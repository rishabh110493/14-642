#include <linux/init.h>   				// Macros used to mark up functions e.g. __init __exit
#include <linux/module.h> 				// Core header for loading LKMs into the kernel
#include <linux/device.h> 				// Header to support the kernel Driver Model
#include <linux/kernel.h> 				// Contains types, macros, functions for the kernel
#include <linux/fs.h>     				// Header for the Linux file system support
#include <asm/uaccess.h>  				// Required for the copy to user function
#include <linux/gpio.h>                 // Required for the GPIO functions
#include <linux/interrupt.h>            // Required for the IRQ code


/** @brief Module info: license */
MODULE_LICENSE("GPL");
/** @brief Module info: author(s) */
MODULE_AUTHOR("Ram Verma");
/** @brief Module info: description */
MODULE_DESCRIPTION("Simple print msg driver");
/** @brief Module info: version */
MODULE_VERSION("0.1");


static int __init MY_driver_init(void) {
	printk(KERN_INFO "MY driver: hello world!\n");
	printk(KERN_ALERT "Created the device\n");
	return 0;
}

static void __exit MY_driver_exit(void) {
	printk(KERN_INFO "MY driver: Goodbye from the LKM!\n");
}


module_init(MY_driver_init);
module_exit(MY_driver_exit);
