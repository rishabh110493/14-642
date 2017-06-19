/**
 * @file   main.c
 *
 * @brief  Simplist test for 1-1 context switching. Can work with round robin or
 * rate-monotonic scheduling.
 *
 */

#include <stdio.h>
#include <syscall_thread.h>

/** @brief thread user space stack size - 4KB */
#define USR_STACK_WORDS 1024

uint32_t idle_stack[USR_STACK_WORDS];
uint32_t thread1_stack[USR_STACK_WORDS];
uint32_t thread2_stack[USR_STACK_WORDS];


/** @brief Prints basic status information of a thread
 *
 *  @param name   name of the thread
 *  @param count  the thread's counter variable
 */
void print_status(const char *name, int counter) {
  printf("t = %d --- Task: %s Count: %d\n", get_time(), name, counter);
}

/** @brief Default idle thread which just loops infinitely
 */
void idle_thread(void) {	
  while(1)
  {	  
  }
}

/** @brief Basic thread which just increments a counter
 */
void thread_1(void) {
  int cnt = 0;
  while(1) {
    print_status("1", cnt++);
	wait_until_next_period();
  }
}

/** @brief Basic thread which just increments a counter
 */
void thread_2(void) {
  int cnt = 0;
  while(1) {
    print_status("2", cnt++);
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
  
  status = thread_create(&thread_1, &thread1_stack[USR_STACK_WORDS-1], 1, 100, 500);
  if (status) {
    printf("Failed to create thread 1: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_2, &thread2_stack[USR_STACK_WORDS-1], 2, 100, 500);
  if (status) {
    printf("Failed to create thread 2: %d\n", status);
    return 1;
  }
  
  printf("Successfully created threads! Starting scheduler...\n");
  fflush(stdout);

  status = scheduler_start();
  if (status) {
    printf("Threads are unschedulable! %d\n", status);
    return 1;
  }
  
  // Should never get here.
  return 2;
}

