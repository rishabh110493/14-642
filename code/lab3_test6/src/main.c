/**
 * @file   main.c
 *
 * @brief  Test for mutex implementation, with priority ceiling protocol
 *         Thread 2 should get pre-empted only after unlocking and should
 *         print "non-critical" section after thread 1 runs.
 */

#include <stdio.h>
#include <syscall_thread.h>
#include <mutex_type.h>

/** @brief 3x time required to print status information to reduce spin wait */
#define PRINT_STATUS_TIME_MS 6

/** @brief thread user space stack size - 4KB */
#define USR_STACK_WORDS 1024

uint32_t idle_stack[USR_STACK_WORDS];
uint32_t thread1_stack[USR_STACK_WORDS];
uint32_t thread2_stack[USR_STACK_WORDS];

mutex_t mutex;

/** @brief Spin waits for approximately ms milliseconds
 *
 *  @param ms   number of millis to loop for.
 */
void spin_wait(unsigned int ms) {
  int i, j;
  for (j = 0; j < ms; j++) {
    for (i = 0; i < 1075; i++) {
      // 1150 was determined to be approximately 1 ms
      __asm__("");
    }
  }
}

/** @brief Prints lock status information of a thread
 *
 *  @param name       name of the thread
 *  @param is_locked  whether the thread locked or released the mutex
 */
void print_status(const char *name, int is_locked) {
  if (is_locked) {
    printf("t = %d --- Task: %s, locked\n", get_time(), name);
  } else {
    printf("t = %d --- Task: %s, unlocked\n", get_time(), name);
  }
}

/** @brief Default idle thread which just loops infinitely
 */
void idle_thread(void) {
	//printf("\n Idle \n");
  while(1);
}

/** @brief Basic thread which locks and unlocks a mutex
 */
void thread_1(void) {
  while(1) {
    mutex_lock(&mutex);
    print_status("1", 1);

    spin_wait(50-PRINT_STATUS_TIME_MS);
    
    print_status("1", 0);
    mutex_unlock(&mutex);

    wait_until_next_period();
  }
}

/** @brief Basic thread which locks and unlocks a mutex
 */
void thread_2(void) {
  while(1) {
    mutex_lock(&mutex);
    print_status("2", 1);

    spin_wait(75-PRINT_STATUS_TIME_MS);
    
    print_status("2", 0);
    mutex_unlock(&mutex);

    spin_wait(75-PRINT_STATUS_TIME_MS);
    printf("t = %d --- Task: 2, non-critical section\n", get_time());
    
    wait_until_next_period();
  }
}


int main(void) {
  int status;
  status = thread_init(&idle_thread, &idle_stack[USR_STACK_WORDS-1]);
  if (status) {
    printf("Failed to initialize thread library: %d\n", status);
    return 1;
  }

  status = mutex_init(&mutex, 0);
  if (status) {
    printf("Mutex initialization failed: %d\n", status);
    return 1;
  }
  
  status = thread_create(&thread_1, &thread1_stack[USR_STACK_WORDS-1], 0, 50, 100);
  if (status) {
    printf("Failed to create thread 1: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_2, &thread2_stack[USR_STACK_WORDS-1], 1, 150, 1000);
  if (status) {
    printf("Failed to create thread 2: %d\n", status);
    return 1;
  }
  
  printf("Successfully created threads! Starting scheduler...\n");

  status = scheduler_start();
  if (status) {
    printf("Threads are unschedulable! %d\n", status);
    return 1;
  }
  
  // Should never get here.
  return 2;
}

