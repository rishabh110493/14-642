/**
 * @file   main.c
 *
 * @brief  Test for nested mutex implementation, with priority ceiling protocol
 */

#include <stdio.h>
#include <stdlib.h>
#include <mutex_type.h>
#include <syscall_thread.h>

/** @brief 3x time required to print status information to reduce spin wait */
#define PRINT_STATUS_TIME_MS 6

/** @brief thread user space stack size - 4KB */
#define USR_STACK_WORDS 1024

uint32_t idle_stack[USR_STACK_WORDS];
uint32_t thread1_stack[USR_STACK_WORDS];
uint32_t thread2_stack[USR_STACK_WORDS];
uint32_t thread3_stack[USR_STACK_WORDS];

mutex_t mutex1;
mutex_t mutex2;

/** @brief Spin waits for approximately ms milliseconds
 *
 *  @param ms   number of millis to loop for.
 */
void spin_wait(unsigned int ms) {
  int i, j;
  for (j = 0; j < ms; j++) {
    for (i = 0; i < 1150; i++) {
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

/** @brief Basic thread which locks and unlocks a mutex
 */
void thread_1(void) {
  while(1) {
    mutex_lock(&mutex1);
    mutex_lock(&mutex2);
    printf("Expecting no more output...\n");
    while(1);
  }
}

/** @brief Basic thread which locks and unlocks a mutex
 */
void thread_2(void) {
  printf("FAILED\n");
  exit(1);
}


int main(void) {
  int status;

  status = thread_init(&idle_thread, &idle_stack[USR_STACK_WORDS-1]);
  if (status) {
    printf("Failed to initialize thread library: %d\n", status);
    return 1;
  }

  status = mutex_init(&mutex1, 0);
  if (status) {
    printf("Mutex 1 initialization failed: %d\n", status);
    return 1;
  }

  status = mutex_init(&mutex2, 3);
  if (status) {
    printf("Mutex 2 initialization failed: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_1, &thread1_stack[USR_STACK_WORDS-1], 0, 100, 600);
  if (status) {
    printf("Failed to create thread 1: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_2, &thread2_stack[USR_STACK_WORDS-1], 1, 200, 600);
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

