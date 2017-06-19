/**
 * @file   encoder_pos.c
 *
 * @brief  Loadable Kernel Module to interface the 
 *			PWM pin. This is to be used to control
 *			the speed of rotation of the motor
 *
 * @date   05 Dec 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu>  
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */
#include <linux/init.h>       
#include <linux/module.h>      
#include <linux/device.h>      
#include <linux/kernel.h>      
#include <linux/fs.h>          
#include <asm/uaccess.h>       
#include <linux/gpio.h>
#include <linux/interrupt.h>
#include <linux/hrtimer.h>
#include <linux/ktime.h>

#define  DEVICE_NAME "motor_pwm"
#define  CLASS_NAME  "motor_pwm" 

#define GPIO_PWM_CHANNEL_1 		13
 
MODULE_LICENSE("GPL");  
MODULE_AUTHOR("Rishabh Bhatnagar and Krishanu Ganguly");    
MODULE_DESCRIPTION("A Simple PWM Driver to control the speed of a Servo Motor");
MODULE_VERSION("1.0");
 
 
static unsigned int gpioPWM1	 = GPIO_PWM_CHANNEL_1;

static int duty_cycle = 0;		// Duty Cycle of the PWM
static unsigned long on_time;	// ON Time for the PWM
static unsigned long off_time;	// OFF Time for the PWM
static int tmr_flag = 0;		// Flag to determine OFF Time/ ON Time

unsigned long timer_interval_ns = 1e6;
static struct hrtimer hr_timer;
static ktime_t ktime;

 
static int    major_number;               
static char   message[256] = {0};         
static short  size_of_message;            
static int    number_of_opens = 0;        
static struct class*  this_class  = NULL; 
static struct device* this_device = NULL; 
static char   *message_header;
 
static int     dev_open(struct inode *, struct file *);
static int     dev_release(struct inode *, struct file *);
static ssize_t dev_read(struct file *, char *, size_t, loff_t *);
static ssize_t dev_write(struct file *, const char *, size_t, loff_t *);
 
/** @brief Devices are represented as file structure in the kernel. The file_operations structure from
 *  /linux/fs.h lists the callback functions that you wish to associated with your file operations
 *  using a C99 syntax structure. char devices usually implement open, read, write and release calls
 */
static struct file_operations fops =
{
   .open = dev_open,
   .read = dev_read,
   .write = dev_write,
   .release = dev_release,
};
 
 /**
 * @brief This function will be called everytime the hr timer flag is up
 * 		   
 */ 
enum hrtimer_restart timer_callback( struct hrtimer *timer_for_restart )
{
	
  	ktime_t currtime , interval;
  	currtime  = ktime_get();
	
	// If tmr_flag == 1, then the PWM was in it's OFF Time
	if(tmr_flag)
	{
		// Flip the flag
		tmr_flag = 1-tmr_flag;
		// Set the new interval to that of ON Time
		interval = ktime_set(0,on_time);
		// Since it is ON Time, set the PWM GPIO pin to 1
		gpio_set_value(gpioPWM1, true);

		// Restart the timer with the newly set time (ON Time)
		hrtimer_forward(timer_for_restart, currtime , interval);
		return HRTIMER_RESTART;		
	}
	// If tmr_flag == 0, then the PWM was in it's ON Time
	else
	{
		// Flip the flag
		tmr_flag = 1-tmr_flag;
		// Set the new interval to that of ON Time
		interval = ktime_set(0,off_time);
		// Since it is ON Time, set the PWM GPIO pin to 1s
		gpio_set_value(gpioPWM1, false);

		// Restart the timer with the newly set time (OFF Time)
		hrtimer_forward(timer_for_restart, currtime , interval);
		return HRTIMER_RESTART;		
	}

}

 /**
 * @brief A Function to parse the string received from the user to an integer
 * 		   
 */ 
static int strtoInt(const char *str, int len)
{
	int x = 0, ret = 0;
	int i = 0;
	for(;i<len;i++)
	{
		x = str[i] - 48;
		ret = (ret * 10) + x;
	}
	return ret;
}
 

 
/** @brief The LKM initialization function
 *  The static keyword restricts the visibility of the function to within this C file. The __init
 *  macro means that for a built-in driver (not a LKM) the function is only used at initialization
 *  time and that it can be discarded and its memory freed up after that point.
 *  @return returns 0 if successful
 */
 
static int __init motor_pwm_init(void)
{
	message_header = "Motor PWM Controller (motor_pwm.ko):";
	printk(KERN_INFO "%s Initializing the LKM...\n",message_header );

	// Trying to dynamically allocate a major number for the device
	major_number = register_chrdev(0, DEVICE_NAME, &fops);
	if (major_number<0){
	  printk(KERN_ALERT "%s failed to register a major number\n",message_header);
	  return major_number;
	}
	printk(KERN_INFO "%s registered correctly with major number %d\n",message_header, major_number);
 
   // Trying to register the device class
   this_class = class_create(THIS_MODULE, CLASS_NAME);
   // Check for error and clean up if there is
   if (IS_ERR(this_class))
   {                
      unregister_chrdev(major_number, DEVICE_NAME);
      printk(KERN_ALERT "%s Failed to register device class\n", message_header);
      return PTR_ERR(this_class);          // Correct way to return an error on a pointer
   }
   printk(KERN_INFO "%s device class registered correctly\n",message_header);
 
   // Register the device driver
   this_device = device_create(this_class, NULL, MKDEV(major_number, 0), NULL, DEVICE_NAME);
   if (IS_ERR(this_device)){               // Clean up if there is an error
      class_destroy(this_class); 
      unregister_chrdev(major_number, DEVICE_NAME);
      printk(KERN_ALERT "%s Failed to create the device\n", message_header);
      return PTR_ERR(this_device);
   }
   printk(KERN_INFO "%s: device class created correctly\n", message_header);

	// Tring to initialize the GPIO for PWM Channel 1 as an output pin
	if (gpio_request(gpioPWM1, "gpioPWM1"))
		printk(KERN_ALERT "%s Failed to initialize GPIO pin for PWM Channel 1\n",message_header);
	if (gpio_direction_output(gpioPWM1, true))
		printk(KERN_ALERT "%s Failed to enable GPIO pin for PWM Channel 1\n", message_header);		
	gpio_set_value(gpioPWM1, false);
	
	printk(KERN_ALERT "%s GPIO init successful!\n",message_header);	   
   
	// Setting up the hr timer for controlling the ON time and OFF time
	ktime = ktime_set( 0, timer_interval_ns );
	hrtimer_init( &hr_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL );
	// Registering the timer call-back function everytime the timer flag is up
	hr_timer.function = &timer_callback;
 	hrtimer_start( &hr_timer, ktime, HRTIMER_MODE_REL );

   
   return 0;
}
 
/** @brief The LKM cleanup function
 *  Similar to the initialization function, it is static. The __exit macro notifies that if this
 *  code is used for a built-in driver (not a LKM) that this function is not required.
 */
static void __exit motor_pwm_exit(void)
{
	 // remove the device, unregister and remove the device class and the major number
	device_destroy(this_class, MKDEV(major_number, 0));    
	class_unregister(this_class);                          
	class_destroy(this_class);                             
	unregister_chrdev(major_number, DEVICE_NAME);

	// Stopping the timer before exiting
	hrtimer_cancel( &hr_timer );
	
	printk(KERN_INFO "Motor PWM Controller (motor_pwm): Exiting!\n");
}
 
/** @brief The device open function that is called each time the device is opened
 *  This will only increment the number_of_opens counter in this case.
 *  @param inodep A pointer to an inode object (defined in linux/fs.h)
 *  @param filep A pointer to a file object (defined in linux/fs.h)
 */
static int dev_open(struct inode *inodep, struct file *filep){
   number_of_opens++;
   printk(KERN_INFO "%s Device has been opened %d time(s)\n",message_header, number_of_opens);
   return 0;
}
 
/** @brief This function is called whenever device is being read from user space i.e. data is
 *  being sent from the device to the user. In this case is uses the copy_to_user() function to
 *  send the buffer string to the user and captures any errors.
 *  @param filep A pointer to a file object (defined in linux/fs.h)
 *  @param buffer The pointer to the buffer to which this function writes the data
 *  @param len The length of the b
 *  @param offset The offset if required
 */
static ssize_t dev_read(struct file *filep, char *buffer, size_t len, loff_t *offset){
   int error_count = 0;
   // copy_to_user has the format ( * to, *from, size) and returns 0 on success
   error_count = copy_to_user(buffer, message, size_of_message);
 
   if (error_count==0){            // if true then have success
      printk(KERN_INFO "%s Sent %d characters to the user\n", message_header, size_of_message);
      return (size_of_message=0);  // clear the position to the start and return 0
   }
   else {
      printk(KERN_INFO "%s Failed to send %d characters to the user\n",message_header, error_count);
      return -EFAULT;              // Failed -- return a bad address message (i.e. -14)
   }
}
 
/** @brief This function is called whenever the device is being written to from user space i.e.
 *  data is sent to the device from the user. The data is copied to the message[] array in this
 *  LKM using the sprintf() function along with the length of the string.
 *  @param filep A pointer to a file object
 *  @param buffer The buffer to that contains the string to write to the device
 *  @param len The length of the array of data that is being passed in the const char buffer
 *  @param offset The offset if required
 */
static ssize_t dev_write(struct file *filep, const char *buffer, size_t len, loff_t *offset)
{
	// Stop the timer that was running so far
	hrtimer_cancel( &hr_timer );
	
	//Get the duty-cycle value received from the user in integer
	duty_cycle =  strtoInt(buffer, len-1);

	//Print a prompt to the buffer
	printk("%s PWM Value from user: %d \n", message_header, duty_cycle);

	// With the value of the duty-cycle, determine the ON and OFF times
	// and store them in the global variables for use by timer_callback()
	off_time = ((100-duty_cycle)*timer_interval_ns)/100;
	on_time = (duty_cycle*timer_interval_ns)/100;

	tmr_flag = 0;
	
	// Re-initialize the timer to the new ON time obtained
	ktime = ktime_set( 0, on_time);
	hrtimer_init( &hr_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL );
	hr_timer.function = &timer_callback;
	hrtimer_start( &hr_timer, ktime, HRTIMER_MODE_REL );   

	return len;
}
 
/** @brief The device release function that is called whenever the device is closed/released by
 *  the userspace program
 *  @param inodep A pointer to an inode object (defined in linux/fs.h)
 *  @param filep A pointer to a file object (defined in linux/fs.h)
 */
static int dev_release(struct inode *inodep, struct file *filep){
   printk(KERN_INFO "Motor PWM Controller (motor_pwm): Device successfully closed\n");
   return 0;
}
 
/** @brief A module must use the module_init() module_exit() macros from linux/init.h, which
 *  identify the initialization function at insertion time and the cleanup function (as
 *  listed above)
 */
module_init(motor_pwm_init);
module_exit(motor_pwm_exit);