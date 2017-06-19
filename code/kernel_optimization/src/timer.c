/**
 * @file   timer.c
 *
 * @brief  Implementation of routines for interacting with ARM timer
 *
 * @date   09/28/2016
  * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <timer.h>
#include<BCM2836.h>
#define LOADVAL (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B400)
#define VALREG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B404)
#define TCR (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B408)
#define PREDIV (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B41C)

void timer_start(int freq) {
	int pre_div = (250000000/freq) - 1;
	*PREDIV = pre_div;	
	*TCR = 0x82;	
  return;
}

void timer_stop(void) {
	*TCR &= 0xFFFFFF7F; // resetting bit 7
  return;
}

uint32_t timer_read(void){
  return 0;  
}

int timer_is_pending(void) {
  return 0;
}


void timer_clear_pending(void) {
  return;
}




