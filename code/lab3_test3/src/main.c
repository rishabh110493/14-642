/**
 * @file   main.c
 *
 * @brief  Test for rate-monotonic scheduling, with preemption
 */

#include <stdio.h>
#include <syscall_thread.h>

/** @brief 3x time required to print status information to reduce spin wait */
#define PRINT_STATUS_TIME_MS 6

/** @brief thread user space stack size - 4KB */
#define USR_STACK_WORDS 1024

uint32_t idle_stack[USR_STACK_WORDS];
uint32_t thread1_stack[USR_STACK_WORDS];
uint32_t thread2_stack[USR_STACK_WORDS];
uint32_t thread3_stack[USR_STACK_WORDS];


/** @brief Prints basic status information of a thread
 *
 *  @param name   name of the thread
 *  @param count  the thread's counter variable
 */
void print_status(const char *name, int counter) {
  printf("t = %d --- Task: %s Count: %d\n", get_time(), name, counter);
}

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



/** @brief Default idle thread which just loops infinitely
 */
void idle_thread(void) {
  while(1);
}

/** @brief Basic thread which just increments a counter
 */
void thread_1(void) {
  int cnt = 0;
  while(1) {
    print_status("1", cnt++);
    spin_wait(20-PRINT_STATUS_TIME_MS);
    wait_until_next_period();
  }
}

/** @brief Basic thread which just increments a counter
 */
void thread_2(void) {
  int cnt = 0;
  while(1) {
    print_status("2", cnt++);
    spin_wait(300-PRINT_STATUS_TIME_MS);
    wait_until_next_period();
  }
}

/** @brief Basic thread which just increments a counter
 */
void thread_3(void) {
  int cnt = 0;
  while(1) {
    print_status("3", cnt++);
    spin_wait(400-PRINT_STATUS_TIME_MS);
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
  
  status = thread_create(&thread_1, &thread1_stack[USR_STACK_WORDS-1], 1, 20, 410);
  if (status) {
    printf("Failed to create thread 1: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_2, &thread2_stack[USR_STACK_WORDS-1], 2, 300, 800);
  if (status) {
    printf("Failed to create thread 2: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_3, &thread3_stack[USR_STACK_WORDS-1], 3, 400, 1200);
  if (status) {
    printf("Failed to create thread 3: %d\n", status);
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

