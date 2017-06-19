/**
 * @file   timer.c
 *
 * @brief  Implementation of routines for interacting with ARM timer
 *
 * @date   October 18, 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <timer.h>
#include <arm.h>
#include<BCM2836.h>


void timer_start(int freq) 
{
	*LOADVAL = 1000000/freq;		// load val = 1MHz/desired frequency				
	*IRQ_ENABLE |= IRQ_TIMER_ENABLE;
	*PREDIV = 249;	//Pre-divider for running the timer at 1 MHz
	*TCR = (ENABLE | TIMER_32_BIT | TIMER_IRQ | COUNTER_ENABLE ) & ~(0x0C);		

	return;
}

void timer_stop(void) {
	*TCR &= ~ENABLE; // resetting bit 7
	*TCR &= ~(TMR_IRQ); // resetting the timer IRQ
  return;
}

uint32_t timer_read(void){
	uint32_t val =  *VALREG;
	return val;  
}

int timer_is_pending(void) {
	int l = *RAW_IRQ & IRQ_TIMER_PENDING;
  return l;
}


void timer_clear_pending(void) {	

	while(*RAW_IRQ & IRQ_TIMER_PENDING)
		*CLR_IRQ = IRQ_CLR; // Writing an arbitrary value to clear the pending IRQ
  return;
}