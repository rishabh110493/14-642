/**
 * @file   syscalls.c
 *
 * @brief  Implementation of syscalls needed for newlib and 349 custom syscalls
 *
 * @date   October 18, 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <kstdint.h>
#include<printk.h>
#include<uart.h>
#include<timer.h>
#include<ads1015.h>
/** @brief Global variable to keep track of where our heap ends */
char *heap_end = 0;

/** @brief Global variable which acts as a pointer to the sample function. Defined in kernel.c */
extern void (*gl)(uint16_t);
/** @brief Define this in kernel.c */
extern void (*sample_fn)(uint16_t);

void hang();

void syscall_exit(int status) 
{
	printk("exit status: %d",status);
	hang();
	return;
}


int syscall_write(int file, char *ptr, int len) 
{
	int i=0;
	if(file == 1)
	{
		while( i<len)
		{
		  uart_put_byte(*ptr);
		  ptr++;
		  i++;
		}
		return i;
	}
	else return -1;
}
/**
 * Reads until all len bytes are read or newline/return is found.
 * Detects backspace and EOL characters and handles them appropriately.
 *
 * The idea is to mimic normal terminal reading input, that is,
 * if the user hits backspace it should erase the previously read character.
 */
int syscall_read(int file, char *ptr, int len) 
{
	int i=0;
	char c;
	if(!file)
	{
		while( i<len)
		{
		  c=uart_get_byte();
		  if(c==4)
		  {
			break;
		  }
		  else if(c==8 || c==127)
		  {
			i--;ptr--;
			printk("\b \b");
		  }	
		  else if(c==10 || c==13)
		  {
			*ptr=c; 
			ptr++;
			uart_put_byte(c);
			return i+1;
		  } 
		  else 
		  { 
			*ptr=c;
			ptr++;
			uart_put_byte(c);
			i++;
		  }			  
		}
		return i;
	}
	else return -1;
  
}

int syscall_sample_adc_start(int freq, uint8_t channel, void (*fn)(uint16_t)) 
{
	gl = fn;  
	timer_start(freq);	
	return 0;
}

int syscall_sample_adc_stop() 
{
	timer_stop();
	return 0;
}

/*****************************************************************************/
/* TA system call implementations:                                           */
/*****************************************************************************/

void *syscall_sbrk(int incr) {
  extern char __heap_low; // Defined by the linker
  extern char __heap_top; // Defined by the linker
  char *prev_heap_end;

  if (heap_end == 0) {
    // Initialize heap_end if this is the first time sbrk was called
    heap_end = &__heap_low;
  }

  prev_heap_end = heap_end;
  if (heap_end + incr > &__heap_top) {
    // Heap and stack collision, return error
    return (void *) -1;
  }

  // update heap_end and return old heap_end
  heap_end += incr;
  return (void *) prev_heap_end;
}

int syscall_close(int file) {
  return -1;
}

int syscall_fstat(int file, void *st) {
  return 0;
}

int syscall_isatty(int file) {
  return 1;
}

int syscall_lseek(int file, int ptr, int dir) {
  return 0;
}
