/** @file syscall_thread.h
 *
 *  @brief  Custom syscalls to support real-time threading in 18-349 lab 3.
 *
 *  @author Hing-On Miu <hmiu@andrew.cmu.edu>
 *  @author Ian Hartwig <ihartwig@andrew.cmu.edu>
 */

#ifndef _SYSCALL_THREAD_H_
#define _SYSCALL_THREAD_H_

#include <kstdint.h>
#include <mutex_type.h>


/** @brief Signature of a thread function
 *
 *  Each thread should run a function that never exits. Instead, you can assume
 *  that any test functions will spin wait (if we want to overrun the execution
 *  time) or use wait_until_next_period().
 */
typedef void (*thread_fn) (void);

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
int thread_init(thread_fn idle_fn, uint32_t *idle_stack_start);

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
int thread_create(thread_fn fn, uint32_t *stack_start,
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
int mutex_init(mutex_t *mutex, unsigned int max_prio);

/** @brief Lock the mutex
 *
 *  This function will not return (may block) until the current thread has
 *  exclusive rights to the mutex. You can assume the mutex has been
 *  initialized.
 *
 *  @param mutex The mutex to act on.
 */
void mutex_lock(mutex_t *mutex);

/** @brief Unlock the mutex
 *
 *  @param mutex The mutex to act on.
 */
void mutex_unlock(mutex_t *mutex);

/** @brief Efficiently waits to run until the next period */
void wait_until_next_period(void);

/** @brief Get the current time in milliseconds */
unsigned int get_time(void);

/** @brief Allow the kernel to start running the added task set.
 *
 *  This function should enable IRQs and thus enable your scheduler. The kernel
 *  will test that a task set with this new task is scheduleable before running
 *  and may return an error if this is not the case.
 *
 *  @return 0 on success or -1 on failure
 */
int scheduler_start(void);


#endif /* _SYSCALL_THREAD_H_ */
