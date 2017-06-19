/** @file   mutex_type.h
 *
 *  @brief  Mutex type definition.
 *
 * @date   15 Nov 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu>  
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

#ifndef _KERNEL_MUTEX_T_H_
#define _KERNEL_MUTEX_T_H_


typedef struct mutex {
	unsigned int priority;
	volatile int lock;
} mutex_t;


#endif /* _349LIBK_MUTEX_T_H_ */
