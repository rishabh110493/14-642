/**
 * @file   Thread.c
 *
 * @brief  interface for system calls pertaining to threads and context
 * switching
 *
 * @date   15 Nov 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu>  
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#include <Thread.h>
#include <timer.h>
#include <screen.h>
#include <printk.h>
#include <mutex_type.h>
#include <arm.h>
#define SVC_STACK_SIZE 1024
#define REFRESH_PERIOD 1024
#define BUFFER_SIZE		128


uint32_t idle_svc_stack[SVC_STACK_SIZE];
uint32_t thread0_svc_stack[SVC_STACK_SIZE];
uint32_t thread1_svc_stack[SVC_STACK_SIZE];
uint32_t thread2_svc_stack[SVC_STACK_SIZE];
uint32_t thread3_svc_stack[SVC_STACK_SIZE];
uint32_t thread4_svc_stack[SVC_STACK_SIZE];
uint32_t thread5_svc_stack[SVC_STACK_SIZE];
uint32_t thread6_svc_stack[SVC_STACK_SIZE];
uint32_t thread7_svc_stack[SVC_STACK_SIZE];
uint32_t thread8_svc_stack[SVC_STACK_SIZE];
uint32_t thread9_svc_stack[SVC_STACK_SIZE];
uint32_t thread10_svc_stack[SVC_STACK_SIZE];
uint32_t thread11_svc_stack[SVC_STACK_SIZE];
uint32_t thread12_svc_stack[SVC_STACK_SIZE];
uint32_t thread13_svc_stack[SVC_STACK_SIZE];
uint32_t thread14_svc_stack[SVC_STACK_SIZE];
uint32_t thread15_svc_stack[SVC_STACK_SIZE];
uint32_t thread16_svc_stack[SVC_STACK_SIZE];
uint32_t thread17_svc_stack[SVC_STACK_SIZE];
uint32_t thread18_svc_stack[SVC_STACK_SIZE];
uint32_t thread19_svc_stack[SVC_STACK_SIZE];
uint32_t thread20_svc_stack[SVC_STACK_SIZE];
uint32_t thread21_svc_stack[SVC_STACK_SIZE];
uint32_t thread22_svc_stack[SVC_STACK_SIZE];
uint32_t thread23_svc_stack[SVC_STACK_SIZE];
uint32_t thread24_svc_stack[SVC_STACK_SIZE];
uint32_t thread25_svc_stack[SVC_STACK_SIZE];
uint32_t thread26_svc_stack[SVC_STACK_SIZE];
uint32_t thread27_svc_stack[SVC_STACK_SIZE];
uint32_t thread28_svc_stack[SVC_STACK_SIZE];
uint32_t thread29_svc_stack[SVC_STACK_SIZE];
uint32_t thread30_svc_stack[SVC_STACK_SIZE];



extern volatile unsigned int CLOCK_TICKS;
volatile TCB threads[32];
void start_thread(thread_fn fn, uint32_t *s);
void (*idle_function)(void);
volatile uint32_t waiting_list, runnable;
volatile int present_thread = 31;
int thread_count;
float UB_Bounds[STACK_LIMIT];


void threads_init()
{
	threads[0].SP_svc = &thread0_svc_stack[SVC_STACK_SIZE];
	threads[1].SP_svc = &thread1_svc_stack[SVC_STACK_SIZE-1];
	threads[2].SP_svc = &thread2_svc_stack[SVC_STACK_SIZE-1];
	threads[3].SP_svc = &thread3_svc_stack[SVC_STACK_SIZE-1];
	threads[4].SP_svc = &thread4_svc_stack[SVC_STACK_SIZE-1];
	threads[5].SP_svc = &thread5_svc_stack[SVC_STACK_SIZE-1];
	threads[6].SP_svc = &thread6_svc_stack[SVC_STACK_SIZE-1];	
	threads[7].SP_svc = &thread7_svc_stack[SVC_STACK_SIZE-1];
	threads[8].SP_svc = &thread8_svc_stack[SVC_STACK_SIZE-1];
	threads[9].SP_svc = &thread9_svc_stack[SVC_STACK_SIZE-1];
	threads[10].SP_svc = &thread10_svc_stack[SVC_STACK_SIZE-1];
	threads[11].SP_svc = &thread11_svc_stack[SVC_STACK_SIZE-1];	
	threads[12].SP_svc = &thread12_svc_stack[SVC_STACK_SIZE-1];	
	threads[13].SP_svc = &thread13_svc_stack[SVC_STACK_SIZE-1];		
	threads[14].SP_svc = &thread14_svc_stack[SVC_STACK_SIZE-1];
	threads[15].SP_svc = &thread15_svc_stack[SVC_STACK_SIZE-1];	
	threads[16].SP_svc = &thread16_svc_stack[SVC_STACK_SIZE-1];	
	threads[17].SP_svc = &thread17_svc_stack[SVC_STACK_SIZE-1];			
	threads[18].SP_svc = &thread18_svc_stack[SVC_STACK_SIZE-1];
	threads[19].SP_svc = &thread19_svc_stack[SVC_STACK_SIZE-1];	
	threads[20].SP_svc = &thread20_svc_stack[SVC_STACK_SIZE-1];	
	threads[21].SP_svc = &thread21_svc_stack[SVC_STACK_SIZE-1];		
	threads[22].SP_svc = &thread22_svc_stack[SVC_STACK_SIZE-1];
	threads[23].SP_svc = &thread23_svc_stack[SVC_STACK_SIZE-1];	
	threads[24].SP_svc = &thread24_svc_stack[SVC_STACK_SIZE-1];	
	threads[25].SP_svc = &thread25_svc_stack[SVC_STACK_SIZE-1];		
	threads[26].SP_svc = &thread26_svc_stack[SVC_STACK_SIZE-1];	
	threads[27].SP_svc = &thread27_svc_stack[SVC_STACK_SIZE-1];		
	threads[28].SP_svc = &thread28_svc_stack[SVC_STACK_SIZE-1];
	threads[29].SP_svc = &thread29_svc_stack[SVC_STACK_SIZE-1];	
	threads[30].SP_svc = &thread30_svc_stack[SVC_STACK_SIZE-1];		
	return;
}




thread_fn get_idle_thread()
{
	return idle_function;
}


int syscall_thread_init(thread_fn idle_fn, uint32_t *idle_stack_start)
{	
	idle_function = idle_fn;
	int i,idle_thread;
	for(i = 0;i<STACK_LIMIT;i++)
	{
		threads[i].C = 0;
		threads[i].T = 0;
		threads[i].priority = STACK_LIMIT;
		threads[i].current_priority = STACK_LIMIT;
		threads[i].status = WAITING;
		threads[i].SP = 0;
		threads[i].PC = 0;		
	}
	idle_thread = STACK_LIMIT-1;
	
	threads[idle_thread].priority = idle_thread;
	threads[idle_thread].status = RUNNABLE;
	threads[idle_thread].SP = idle_stack_start;
	threads[idle_thread].PC = idle_fn;
	threads[idle_thread].T = 1;
	threads[idle_thread].C = 5000;
	
	runnable = (1<<31);
	waiting_list = 0;
	present_thread = idle_thread;
	set_UB_Bounds();

	return 0;
}

int syscall_thread_create(thread_fn fn, uint32_t *stack_start,
                  unsigned int prio, unsigned int C, unsigned int T)
{
	int i;
	for (i = 0;i<13;i++)
	{
		threads[prio].registers[i] = 0;
	}	
	threads[prio].T = T;
	threads[prio].C = C;
	threads[prio].priority = prio;
	threads[prio].current_priority = prio;
	if(!stack_start)
		return 1;
	threads[prio].SP = stack_start-56;
	if(!fn)
		return 1;
	threads[prio].PC = fn;
	threads[prio].status = RUNNABLE;
	threads[prio].finished = 0;
	threads[prio].time_run = 0;
	threads[prio].SPSR = 0x150;
	threads[prio].stack_copied = 0;
		
	runnable |= (1<<prio);	
	thread_count++;
	return 0;
}


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
int syscall_mutex_init(mutex_t *mutex, unsigned int max_prio)
{
	if(mutex == NULL)
		return 1;
	mutex->priority = max_prio;
	return 0;
}

/** @brief Lock the mutex
 *
 *  This function will not return (may block) until the current thread has
 *  exclusive rights to the mutex. You can assume the mutex has been
 *  initialized.
 *
 *  @param mutex The mutex to act on.
 */
void syscall_mutex_lock(mutex_t *mutex)
{
	while(mutex->lock)
	{
	}
	disable_interrupts();
	mutex->lock = 1;
	threads[present_thread].current_priority = mutex->priority;
	enable_interrupts();
}

/** @brief Unlock the mutex
 *
 *  @param mutex The mutex to act on.
 */
void syscall_mutex_unlock(mutex_t *mutex)
{
	
	mutex->lock = 0;
	threads[present_thread].current_priority = threads[present_thread].priority;
		
	
}

int getMostImportantRunnableThread()
{
	
	uint32_t run_a = runnable;
	int imp_thr = 31;
	int cnt = 0;
	while(run_a)
	{
		if(run_a & 0x01)
		{
			if(threads[cnt].current_priority < threads[imp_thr].current_priority)
				imp_thr = cnt;
			else if(threads[cnt].current_priority == threads[imp_thr].current_priority)
			{
				if(threads[cnt].priority < threads[imp_thr].priority)
				imp_thr = cnt;	
			}
		}
		run_a = run_a>>1;
		cnt++;
	}
	return imp_thr;
	
}


volatile TCB* context_switch()
{
	threads[31].PC = idle_function;

	int cnt = getMostImportantRunnableThread();

	present_thread = cnt;
	return &threads[present_thread];
	
}


int check_time()
{
	int i;
	timer_clear_pending();
	
	oled_buf_pixel_set(present_thread, (CLOCK_TICKS%REFRESH_PERIOD)/(REFRESH_PERIOD/BUFFER_SIZE));	
				
		if(!(CLOCK_TICKS % REFRESH_PERIOD))
		{
			oled_clear_screen();
			oled_buf_draw();	
			oled_buf_clr();
		}
	

	
	//Waking up threads whose wait times have finished
	for(i = 0;i<STACK_LIMIT;i++)
	{
		if(threads[i].T)
		{
			if(!(CLOCK_TICKS%threads[i].T))
			{
				threads[i].status = RUNNABLE;
				threads[i].time_run = 0;
				threads[i].finished = 0;
				runnable |= (1<<i);
				waiting_list &= ~(1<<i);	
			}
		}
	}
	
	int cnt = getMostImportantRunnableThread();

	if(present_thread == cnt)
	{
		if(threads[present_thread].finished == 1)
		{
			if(present_thread != 31)
			{
				threads[present_thread].status = WAITING;
				waiting_list |= (1<<present_thread);				
				runnable &= ~(1<<present_thread);
				return 1;	//If not idle thread, then switch context
			}
			//Return 0 for idle thread
			return 0;			
		}
		else
		{
			if(threads[present_thread].time_run <= threads[present_thread].C)
			{
				if(present_thread != 31)
					threads[present_thread].time_run++;		
				return 0;
			}
			else
			{
				if(present_thread != 31)
				{
					threads[present_thread].status = WAITING;
					runnable &= ~(1<<present_thread);
					waiting_list |= (1<<present_thread);
					
					threads[present_thread].finished = 1;
					return 1;
				}
				return 0;				
			}
			
		}
	}
	else
	{
		return 1;
	}
}


uint32_t *get_svc_sp()
{
	if(threads[present_thread].stack_copied)
		return 0;
	threads[present_thread].stack_copied = 1;
	return threads[present_thread].SP_svc;
}

int save_context(int *context)
{
	int i;
	for(i = 0;i<13;i++)
	{
		threads[present_thread].registers[i] = context[i];	// Copy everything but LR
	}
	return 0;
}


void save_context_SVC(uint32_t *LR_svc, uint32_t *SP_svc, uint32_t SPSR_svc)
{
	threads[present_thread].SP_svc = SP_svc;
	threads[present_thread].LR_svc = LR_svc;
	threads[present_thread].SPSR_svc = SPSR_svc;
}

void save_context_user(uint32_t *LR, uint32_t *SP)
{
	threads[present_thread].SP = SP;
	threads[present_thread].LR_usr = LR;
}

void save_context_irq(int *context)
{
	
	int i;
	for(i = 0;i<13;i++)
	{
		threads[present_thread].registers[i] = context[i];	// Copy everything but LR
	}
	threads[present_thread].PC = (thread_fn)context[13];			//Saving the irq_lr
	threads[present_thread].SPSR = context[14];			//Saving the SPSR
}

void syscall_wait_until_next_period()
{
	threads[present_thread].status = WAITING;
	threads[present_thread].finished = 1;
	while(threads[present_thread].status == WAITING)
	{
	}
	return;
}

/** @brief Get the current time in milliseconds */
unsigned int syscall_get_time(void)
{
	return CLOCK_TICKS;
}

/** @brief Allow the kernel to start running the added task set.
 *
 *  This function should enable IRQs and thus enable your scheduler. The kernel
 *  will test that a task set with this new task is scheduleable before running
 *  and may return an error if this is not the case.
 *
 *  @return 0 on success or -1 on failure
 */
int syscall_scheduler_start(void)
{
	if(UB_Test())
	{
		timer_clear_pending();
		timer_start(1000);
		start_thread(idle_function, threads[31].SP);		
		return 0;
	}
	else
		return 1;
}


int UB_Test(void)
{
	int i;
	float utilization = 0.0;
	for(i = 0;i<STACK_LIMIT-1;i++)
	{
		if(threads[i].priority<STACK_LIMIT)
		{
			utilization += (((float)threads[i].C)/((float)threads[i].T));
		}
	}
	if(utilization <= UB_Bounds[thread_count])
		return 1;
	else
		return 0;
}

void set_UB_Bounds(void)
{
	UB_Bounds[1] = 		1;
	UB_Bounds[2] = 		0.8284;
	UB_Bounds[3] = 		0.7797;
	UB_Bounds[4] = 		0.7568;
	UB_Bounds[5] = 		0.7434;
	UB_Bounds[6] = 		0.7347;
	UB_Bounds[7] = 		0.7286;
	UB_Bounds[8] = 		0.7240;
	UB_Bounds[9] = 		0.7205;
	UB_Bounds[10] = 	0.7177;
	UB_Bounds[11] = 	0.7154;
	UB_Bounds[12] = 	0.7135;	
	UB_Bounds[13] = 	0.7119;
	UB_Bounds[14] = 	0.7105;
	UB_Bounds[15] = 	0.7094;
	UB_Bounds[16] = 	0.7083;
	UB_Bounds[17] = 	0.7074;
	UB_Bounds[18] = 	0.7066;
	UB_Bounds[19] = 	0.7059;
	UB_Bounds[20] = 	0.7052;
	UB_Bounds[21] = 	0.7047;
	UB_Bounds[22] = 	0.7041;
	UB_Bounds[23] = 	0.7036;
	UB_Bounds[24] = 	0.7032;	
	UB_Bounds[25] = 	0.7028;
	UB_Bounds[26] = 	0.7024;
	UB_Bounds[27] = 	0.7021;
	UB_Bounds[28] = 	0.7017;
	UB_Bounds[29] = 	0.7014;
	UB_Bounds[30] = 	0.7012;
	UB_Bounds[31] = 	0.7009;
	
}
