 #include <linux/init.h>       
#include <linux/module.h>      
#include <linux/device.h>      
#include <linux/kernel.h>      
#include <linux/fs.h>          
#include <asm/uaccess.h>       
#include <linux/gpio.h>
#include <linux/interrupt.h>

#define  DEVICE_NAME "motor" 
#define  CLASS_NAME  "motor" 

#define CLOCKWISE 	   1
#define ANTI_CLOCKWISE 2
#define STOP 		   0
#define SUM			   3
 
MODULE_LICENSE("GPL");  
MODULE_AUTHOR("Rishabh Bhatnagar and Krishanu Ganguly");    
MODULE_DESCRIPTION("A Simple H-Bridge Driver to control the direction of a Motor");
MODULE_VERSION("1.0");
 
 
static unsigned int gpioMotorIN3 = 19;
static unsigned int gpioMotorIN4 = 18; 
static unsigned int gpioDownButton = 26; 
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

static int dir_flag = 0;
 
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

void set_direction(int direction)
{
	if(direction == CLOCKWISE)
	{
	   gpio_set_value(gpioMotorIN3, false);
	   gpio_set_value(gpioMotorIN4, true);
	   dir_flag = CLOCKWISE;
	   printk(KERN_INFO "%s Motor in CLOCKWISE!\n", message_header);		
	}
   else if(direction == ANTI_CLOCKWISE)
   {
	   gpio_set_value(gpioMotorIN3, true);
	   gpio_set_value(gpioMotorIN4, false);
	   dir_flag = ANTI_CLOCKWISE;
	   printk(KERN_INFO "%s Motor in ANTI-CLOCKWISE!\n", message_header);
   }	
   else if(direction == STOP)
   {
	   gpio_set_value(gpioMotorIN3, false);
	   gpio_set_value(gpioMotorIN4, false);
	   dir_flag = STOP;
	   printk(KERN_INFO "%s Motor STOPPED!\n", message_header);
   }	
   else
   {
	   printk(KERN_INFO "%s Invalid Command!\n", message_header);	   
   }
}
 
static irq_handler_t down_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
{
	set_direction(SUM-dir_flag);
	printk(KERN_INFO "%s Down Button Pressed!\n", message_header);
	return (irq_handler_t) IRQ_HANDLED;

}
 
// A Function to parse the string received from the user to an integer 
int strtoInt(const char *str, int len)
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
static int __init motor_init(void){
	message_header = "Motor Direction Controller (motor.ko):";
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

	if (gpio_request(gpioMotorIN3, "gpioMotorIN3"))
		printk(KERN_ALERT "%s Failed to initialize gpioMotorIN3\n", message_header);
	if (gpio_request(gpioMotorIN4, "gpioMotorIN4"))
		printk(KERN_ALERT "%s Failed to initialize gpioMotorIN4\n", message_header);	
	if (gpio_request(gpioDownButton, "gpioDownButton"))
		printk(KERN_ALERT "%s Failed to initialize gpioDownButton\n", message_header);
	if (gpio_direction_output(gpioMotorIN3, false))
		printk(KERN_ALERT "%s Failed to enable gpioMotorIN3\n", message_header);
	if (gpio_direction_output(gpioMotorIN4, false))
		printk(KERN_ALERT "%s Failed to enable gpioMotorIN4\n", message_header);		
	if (gpio_direction_input(gpioDownButton))
		printk(KERN_ALERT "%s Failed to enable gpioDownButton\n", message_header);
	if (gpio_set_debounce(gpioDownButton, 200))
		printk(KERN_ALERT "%s Failed to debounce gpioDownButton\n", message_header);
	int irq_down = gpio_to_irq(gpioDownButton);
	
	request_irq(irq_down, (irq_handler_t) down_irq_handler, IRQF_TRIGGER_RISING, "DownButton_gpio_handler",NULL);
	
	printk(KERN_ALERT "GPIO init successful!\n");	   
   
   return 0;
}
 
/** @brief The LKM cleanup function
 *  Similar to the initialization function, it is static. The __exit macro notifies that if this
 *  code is used for a built-in driver (not a LKM) that this function is not required.
 */
static void __exit motor_exit(void){
   device_destroy(this_class, MKDEV(major_number, 0));     // remove the device
   class_unregister(this_class);                          // unregister the device class
   class_destroy(this_class);                             // remove the device class
   unregister_chrdev(major_number, DEVICE_NAME);             // unregister the major number
   printk(KERN_INFO "Motor: Goodbye from the LKM!\n");
}
 
/** @brief The device open function that is called each time the device is opened
 *  This will only increment the number_of_opens counter in this case.
 *  @param inodep A pointer to an inode object (defined in linux/fs.h)
 *  @param filep A pointer to a file object (defined in linux/fs.h)
 */
static int dev_open(struct inode *inodep, struct file *filep){
   number_of_opens++;
   printk(KERN_INFO "Motor: Device has been opened %d time(s)\n", number_of_opens);
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
      printk(KERN_INFO "Motor: Sent %d characters to the user\n", size_of_message);
      return (size_of_message=0);  // clear the position to the start and return 0
   }
   else {
      printk(KERN_INFO "Motor: Failed to send %d characters to the user\n", error_count);
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
   set_direction(strtoInt(buffer, len-1));
   return len;
}
 
/** @brief The device release function that is called whenever the device is closed/released by
 *  the userspace program
 *  @param inodep A pointer to an inode object (defined in linux/fs.h)
 *  @param filep A pointer to a file object (defined in linux/fs.h)
 */
static int dev_release(struct inode *inodep, struct file *filep){
   printk(KERN_INFO "%s Device successfully closed\n", message_header);
   return 0;
}
 
/** @brief A module must use the module_init() module_exit() macros from linux/init.h, which
 *  identify the initialization function at insertion time and the cleanup function (as
 *  listed above)
 */
module_init(motor_init);
module_exit(motor_exit);