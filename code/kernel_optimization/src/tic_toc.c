/**
 * @file   tic_toc.c
 *
 * @brief  Implementation of tic-toc routines for interacting with ARM timer
 *
 * @date   09/28/2016
  * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <tic_toc.h>
#include<BCM2836.h>
#include<timer.h>
#define LOADVAL (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B400)
#define VALREG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B404)
#define TCR (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B408)
#define PREDIV (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B41C)

void tic(void) 
{
	//*PREDIV = 0x00;
	*LOADVAL = 0xFFFFFFFF;	
	timer_start(250000000);
	//*TCR = 0x82;

  return;
}

uint32_t toc(void) 
{
  timer_stop();
  uint32_t ms = ((0xFFFFFFFF - *VALREG)/(250 * 1000));
  
  return ms;
}