/**
 * @file   Thread.h
 *
 * @brief  interface for system calls pertaining to threads
 *
 * @date   15 Nov 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu>  
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */


#include <syscall_thread.h>
#define STACK_LIMIT 32
#define RUNNABLE 	1
#define WAITING		0

typedef struct  
{
	uint32_t *SP;		//+0
	thread_fn PC;		//+4
	int registers[13];	//+8
	uint32_t *LR_usr;	//+60
	uint32_t *SP_svc;	//+64
	uint32_t *LR_svc;	//+68
	uint32_t SPSR;		//+72
	uint32_t SPSR_svc;	//+76	
	int finished;		//+80
	unsigned int C;
	unsigned int T;
	unsigned int priority;
	unsigned int current_priority;
	int status;  // 1: Runnable 0: Waiting
	int time_run;
	int stack_copied;
	
}TCB;	

/** @brief Initialize the thread library
 *
 *  A user program must call this initializer before attempting to create any
 *  threads or start the scheduler.
 *
 *  @param idle_fn Pointer to a thread function to run when no other threads are
 *  runnable.
 *  @param idle_stack_start Pointer to the first valid location of idle thread's
 *  stack.
 *
 *  @return 0 on success or -1 on failure
 */
int syscall_thread_init(thread_fn idle_fn, uint32_t *idle_stack_start);

/** @brief Create a new thread running the given function
 *
 *  @param fn Pointer to the function to run in the new thread.
 *  @param stack_start Pointer to the first valid location of this thread's
 *  stack.
 *  @param prio Priority of this thread. Lower number are higher priority.
 *  @param C Real time execution time (ms).
 *  @param T Real time task period (ms).
 *
 *  @return 0 on success or -1 on failure
 */
int syscall_thread_create(thread_fn fn, uint32_t *stack_start,
                  unsigned int prio, unsigned int C, unsigned int T);

/** @brief Initialize the mutex
 *
 *  A user program must call this initializer before attempting to lock or
 *  unlock the mutex. You can assume that this initializer will only be called
 *  once by any test programs.
 *
 *  @param mutex The mutex to act on.
 *  @param max_prio The maximum priority of a thread which could use
 *
 *  @return 0 on success or -1 on failure
 */
int syscall_mutex_init(mutex_t *mutex, unsigned int max_prio);

/** @brief Lock the mutex
 *
 *  This function will not return (may block) until the current thread has
 *  exclusive rights to the mutex. You can assume the mutex has been
 *  initialized.
 *
 *  @param mutex The mutex to act on.
 */
void syscall_mutex_lock(mutex_t *mutex);

/** @brief Unlock the mutex
 *
 *  @param mutex The mutex to act on.
 */
void syscall_mutex_unlock(mutex_t *mutex);

/** @brief Efficiently waits to run until the next period */
void syscall_wait_until_next_period(void);

/** @brief Get the current time in milliseconds */
unsigned int syscall_get_time(void);

/** @brief Allow the kernel to start running the added task set.
 *
 *  This function should enable IRQs and thus enable your scheduler. The kernel
 *  will test that a task set with this new task is scheduleable before running
 *  and may return an error if this is not the case.
 *
 *  @return 0 on success or -1 on failure
 */
int syscall_scheduler_start(void);

/** @brief Carry out the UB test before scheduling a set of tasks.
 *
 *  This function looks at the threads which are created and carries
 *  out a UB Test on the given threads before scheduling them. It 
 *  compares the utilization against pre-determined values of utilization bounds
 *
 *  @return 1 on success or 0 on failure
 */
int UB_Test(void);

/** @brief Sets the utilization bounds for tasks.
 *
 */
void set_UB_Bounds(void);

/** @brief This is called every IRQ interrupt.
 *
 *  It checks the status of the all the threads. Wakes up any waiting thread that
 *  ought to be scheduled and determines if a context switch must be performed 
 *  in that IRQ  
 *
 *  @return 1 for context switch or 0 to return to presently running task
 */
int check_time();


int save_context(int *context);

/** @brief Routine to back up all the registers in the event of an IRQ interrupt
 *
 */
void save_context_irq(int *context);

/** @brief Routine to back up the user-space LR and SP registers in the event of an
 * interrupt
 *
 */
void save_context_user(uint32_t *LR, uint32_t *SP);

/** @brief Routine to back up the kernel LR, SPSR and SP registers for the current running
 *  in the event of a SWI.
 *
 */
void save_context_SVC(uint32_t *LR_svc, uint32_t *SP_svc, uint32_t SPSR_svc);

/** @brief Returns the kernel SP of the presently running thread.
 *  
 *  @return kernel SP of the present task if it hadn't been copied before. Else 0.
 */
uint32_t *get_svc_sp();

/** @brief Returns the index of the most important thread at the given point in time
 *  
 *  @return The index of the most important thread at the given point in time
 */
int getMostImportantRunnableThread();

/** @brief Returns the TCB of the new task to be loaded
 *  
 *  @return The TCB of the new task to be loaded
 */
volatile TCB* context_switch();

