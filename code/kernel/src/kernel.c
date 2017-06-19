/**
 * @file   kernel.c
 *
 * @brief  entry point to the raspberry pi kernel
 *
 * @date   15 Nov 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu>  
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

/**
 * @brief The kernel entry point. Initializes the UART, I2C and the ADC, installs the vector table 
 *  and enters user mode. Contains C handlers for IRQ and SWI
 */
#include<printk.h>
#include<uart.h>
#include <arm.h>
#include <timer.h>
#include<syscalls.h>
#include<Thread.h>
#include<swi_num.h>
#include<i2c.h>
#include<screen.h>
#include<mutex_type.h>
#include<ads1015.h>

void install_interrupt_table();
void enter_user_mode();
int save_context(int *context);
void threads_init();
extern void (*sample_fn)(uint16_t);

/**
 * @brief Global pointer to the sample function to be executed everytime an IRQ is triggered
 *  
 */
void (*gl)(uint16_t);
volatile unsigned int CLOCK_TICKS = 0;

void kernel_main(void) 
{
	install_interrupt_table();
	timer_stop();
	enable_interrupts();	
	uart_init();	
	i2c_master_init(I2C_BAUD_RATE_100KHZ);
	threads_init();
	oled_init();
	oled_clear_screen();
	oled_buf_clr();
	enter_user_mode();
}


/**
 * @brief Handler called when an IRQ occurs
 */
void irq_c_handler(void) 
{
	printk("\n IRQ");
	timer_clear_pending();
	return;
}


/**
 * @brief Handles the given swi_num
 *
 * @param swi_num the swi number passed in from swi_asm_handler
 * @param args pointer to arguments array, set up by the swi_asm_handler
 *
 * @return the return result of the syscall
 */
void *swi_c_handler(int swi_num, int *args, int arg4plus) 
{
	int file,len;
	char *ptr;
	volatile int retval = 1;
	switch(swi_num)
	{
		case SWI_WRITE:
			file=*(args);
			ptr=(char*)*(args+1);
			len=*(args+2);
			retval = syscall_write(file,ptr,len);
			break;
		case SWI_EXIT: 
			syscall_exit(0);
			break;
		case SWI_SBRK: 
			return (void*)syscall_sbrk(*args);
			break;
		case SWI_FSTAT: 			
			retval = syscall_fstat(*args, (void*)*(args+1));
			break;	
		case SWI_READ:
			file = *(args);
			ptr = (char*)*(args+1);
			len = *(args+2);			
			retval = syscall_read(file,ptr,len);			
			break;
		case SWI_ADC_START: 			
			retval = syscall_sample_adc_start(*args, *(args+1),(void*)*(args+2));			
			break;				
		case SWI_ADC_STOP: 
			retval = syscall_sample_adc_stop();
			break;							
		case SWI_THR_INIT:	
			retval = syscall_thread_init((thread_fn)*args, (uint32_t*)*(args+1));
			break;
		case SWI_THR_CREATE:
			retval = syscall_thread_create((thread_fn)*args, (uint32_t*)*(args+1), *(args+2),*(args+3),arg4plus);
			break;
		case SWI_SCHD_START:
			retval = syscall_scheduler_start();
			break;		
		case SWI_WAIT:			
			syscall_wait_until_next_period();
			return (void *) retval;
			break;				
		case SWI_TIME: retval = 0;
		volatile unsigned int x= syscall_get_time();
			retval = x;
			x++;
			break;	
		case SWI_MUT_INIT:
			retval = syscall_mutex_init((mutex_t*)*args,(unsigned int)*(args+1));
			break;				
		case SWI_MUT_LOK:
			syscall_mutex_lock((mutex_t*)*args);
			return (void *) retval; 
			break;		
		case SWI_MUT_ULK: retval = 0;
			disable_interrupts();
			syscall_mutex_unlock((mutex_t*)*args);
			enable_interrupts();
			return (void *) retval; 
			break;						

	}
	return (void *) retval;
}
