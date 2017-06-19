/**
 * @file   timer.h
 *
 * @brief  Routines for interacting with the ARM timer.
 *
 * @date   September 26, 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

#ifndef _TIMER_H_
#define _TIMER_H_
#define LOADVAL (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B400)
#define VALREG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B404)
#define TCR (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B408)
#define RAW_IRQ (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B410)
#define CLR_IRQ (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B40C)
#define PREDIV (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B41C)
#define IRQ_ENABLE (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B218)
#define IRQ_DISABLE (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B224)
#define IRQ_PENDING (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B200)

#define ENABLE 				(1<<7)
#define COUNTER_ENABLE 		(1<<9)
#define TIMER_32_BIT 		(1<<1)
#define TIMER_IRQ 			(1<<5)
#define IRQ_TIMER_ENABLE	(1)
#define CLOCK				150000000
#define DELAY_1_SEC			250000
#define DELAY_1000			1000
#define IRQ_TIMER_PENDING	1
#define IRQ_CLR				0xFFFFFFFF
#define TMR_IRQ				(0x20)

/**
 * @brief Configures the arm timer to start running with the given frequency. The Timer
 *        should run in 32 bit mode, with a prescaler of 1, and with interrupts enabled.
 *
 * @param freq  frequency in KHz at which to run the timer
 */
void timer_start(int freq);

/**
 * @brief Disables timer IRQs
 */
void timer_stop(void);

/**
 * @brief Determines if there is currently a pending timer interrupt
 *
 * @return 1 if timer interrupt is pending, 0 if not.
 */
int timer_is_pending(void);

/**
 * @brief Should be called to acknowledge that a timer interrupt occurred and has been
 *        appropriately handled. Will clear the pending bit in the timer's MMIO registers.
 */
void timer_clear_pending(void);

#endif /* _TIMER_H_ */