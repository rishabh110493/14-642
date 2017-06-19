/**
 * @file   main.c
 *
 * @brief  Test for almost the max number of threads
 */

#include <stdio.h>
#include <syscall_thread.h>

/** @brief 3x time required to print status information to reduce spin wait */
#define PRINT_STATUS_TIME_MS 6

/** @brief Period of each task (since they are all the same) */
#define THREAD_TIME_MS 50

/** @brief Number of identical tasks to schedule */
#define THREAD_COUNT 30

/** @brief Period of each thread (they are all the same) */
#define THREAD_PERIOD (THREAD_COUNT* THREAD_TIME_MS * 2)

/** @brief thread user space stack size - 4KB */
#define USR_STACK_WORDS 512

uint32_t idle_stack[USR_STACK_WORDS];
uint32_t thread1_stack[USR_STACK_WORDS];
uint32_t thread2_stack[USR_STACK_WORDS];
uint32_t thread3_stack[USR_STACK_WORDS];
uint32_t thread4_stack[USR_STACK_WORDS];
uint32_t thread5_stack[USR_STACK_WORDS];
uint32_t thread6_stack[USR_STACK_WORDS];
uint32_t thread7_stack[USR_STACK_WORDS];
uint32_t thread8_stack[USR_STACK_WORDS];
uint32_t thread9_stack[USR_STACK_WORDS];
uint32_t thread10_stack[USR_STACK_WORDS];
uint32_t thread11_stack[USR_STACK_WORDS];
uint32_t thread12_stack[USR_STACK_WORDS];
uint32_t thread13_stack[USR_STACK_WORDS];
uint32_t thread14_stack[USR_STACK_WORDS];
uint32_t thread15_stack[USR_STACK_WORDS];
uint32_t thread16_stack[USR_STACK_WORDS];
uint32_t thread17_stack[USR_STACK_WORDS];
uint32_t thread18_stack[USR_STACK_WORDS];
uint32_t thread19_stack[USR_STACK_WORDS];
uint32_t thread20_stack[USR_STACK_WORDS];
uint32_t thread21_stack[USR_STACK_WORDS];
uint32_t thread22_stack[USR_STACK_WORDS];
uint32_t thread23_stack[USR_STACK_WORDS];
uint32_t thread24_stack[USR_STACK_WORDS];
uint32_t thread25_stack[USR_STACK_WORDS];
uint32_t thread26_stack[USR_STACK_WORDS];
uint32_t thread27_stack[USR_STACK_WORDS];
uint32_t thread28_stack[USR_STACK_WORDS];
uint32_t thread29_stack[USR_STACK_WORDS];

/** @brief holds counters for each thread */
static int cnt_array[THREAD_COUNT];

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

/** @brief Prints basic status information of a thread
 *
 *  @param name   name of the thread
 *  @param count  the thread's counter variable
 */
void print_status(int id, int counter) {
  printf("t = %d --- Task: %d Count: %d\n", get_time(), id, counter);
}

/** @brief Default idle thread which just loops infinitely
 */
void idle_thread(void) {
  while(1);
}

/** @brief Basic thread which just increments a counter
 */
void thread_count(int id) {
  while(1) {
    print_status(id, cnt_array[id]++);
    spin_wait(THREAD_TIME_MS-PRINT_STATUS_TIME_MS);
    wait_until_next_period();
  }
}

void thread_1(void) {thread_count(1);}
void thread_2(void) {thread_count(2);}
void thread_3(void) {thread_count(3);}
void thread_4(void) {thread_count(4);}
void thread_5(void) {thread_count(5);}
void thread_6(void) {thread_count(6);}
void thread_7(void) {thread_count(7);}
void thread_8(void) {thread_count(8);}
void thread_9(void) {thread_count(9);}
void thread_10(void) {thread_count(10);}
void thread_11(void) {thread_count(11);}
void thread_12(void) {thread_count(12);}
void thread_13(void) {thread_count(13);}
void thread_14(void) {thread_count(14);}
void thread_15(void) {thread_count(15);}
void thread_16(void) {thread_count(16);}
void thread_17(void) {thread_count(17);}
void thread_18(void) {thread_count(18);}
void thread_19(void) {thread_count(19);}
void thread_20(void) {thread_count(20);}
void thread_21(void) {thread_count(21);}
void thread_22(void) {thread_count(22);}
void thread_23(void) {thread_count(23);}
void thread_24(void) {thread_count(24);}
void thread_25(void) {thread_count(25);}
void thread_26(void) {thread_count(26);}
void thread_27(void) {thread_count(27);}
void thread_28(void) {thread_count(28);}
void thread_29(void) {thread_count(29);}


int main(void) {
  int status;
  status = thread_init(&idle_thread, &idle_stack[USR_STACK_WORDS-1]);
  if (status) {
    printf("Failed to initialize thread library: %d\n", status);
    return 1;
  }

  status = 0;
  status += thread_create(&thread_1, &thread1_stack[USR_STACK_WORDS-1], 1, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_2, &thread2_stack[USR_STACK_WORDS-1], 2, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_3, &thread3_stack[USR_STACK_WORDS-1], 3, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_4, &thread4_stack[USR_STACK_WORDS-1], 4, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_5, &thread5_stack[USR_STACK_WORDS-1], 5, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_6, &thread6_stack[USR_STACK_WORDS-1], 6, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_7, &thread7_stack[USR_STACK_WORDS-1], 7, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_8, &thread8_stack[USR_STACK_WORDS-1], 8, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_9, &thread9_stack[USR_STACK_WORDS-1], 9, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_10, &thread10_stack[USR_STACK_WORDS-1], 10, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_11, &thread11_stack[USR_STACK_WORDS-1], 11, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_12, &thread12_stack[USR_STACK_WORDS-1], 12, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_13, &thread13_stack[USR_STACK_WORDS-1], 13, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_14, &thread14_stack[USR_STACK_WORDS-1], 14, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_15, &thread15_stack[USR_STACK_WORDS-1], 15, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_16, &thread16_stack[USR_STACK_WORDS-1], 16, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_17, &thread17_stack[USR_STACK_WORDS-1], 17, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_18, &thread18_stack[USR_STACK_WORDS-1], 18, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_19, &thread19_stack[USR_STACK_WORDS-1], 19, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_20, &thread20_stack[USR_STACK_WORDS-1], 20, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_21, &thread21_stack[USR_STACK_WORDS-1], 21, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_22, &thread22_stack[USR_STACK_WORDS-1], 22, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_23, &thread23_stack[USR_STACK_WORDS-1], 23, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_24, &thread24_stack[USR_STACK_WORDS-1], 24, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_25, &thread25_stack[USR_STACK_WORDS-1], 25, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_26, &thread26_stack[USR_STACK_WORDS-1], 26, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_27, &thread27_stack[USR_STACK_WORDS-1], 27, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_28, &thread28_stack[USR_STACK_WORDS-1], 28, THREAD_TIME_MS, THREAD_PERIOD);
  status += thread_create(&thread_29, &thread29_stack[USR_STACK_WORDS-1], 29, THREAD_TIME_MS, THREAD_PERIOD);

  if (status) {
    printf("Failed to create one of the threads!\n");
    return 1;
  } else {
    printf("Successfully created threads! Starting scheduler...\n");
  }

  status = scheduler_start();
  if (status) {
    printf("Threads are unschedulable! %d\n", status);
    return 1;
  }
  
  // Should never get here.
  return 2;
}

