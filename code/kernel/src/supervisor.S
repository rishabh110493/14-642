/**
 * @file   supervisor.S
 *
 * @brief  Assembly implementation to setup interrupts and enter/exit user mode
 *
 * @date   October 18, 2016
 * @author Rishabh Bhatnagar <rishabhb@andrew.cmu.edu> 
 * @author Krishanu Ganguly  <krishang@andrew.cmu.edu>
 */

.section ".text"

/**
 * vector table that is loaded by install_vector_table to address 0x0
 */
interrupt_vector_table:
  // ARM core does the following on interrupt:
  // 1) save cpsr into spsr
  // 2) set mode bits in current cpsr
  // 3) disable further interrupts of lower/same priority
  // 4) store return address in lr
  // 5) set pc to correct vector table entry below
  ldr pc, _reset_asm_handler                 // priority: 1st
  ldr pc, _undefined_instruction_asm_handler // priority: 6th
  ldr pc, _swi_asm_handler                   // priority: 6th
  ldr pc, _prefetch_abort_asm_handler        // priority: 5th
  ldr pc, _data_abort_asm_handler            // priority: 2nd
  ldr pc, _reset_asm_handler                 // priority: undefined
  ldr pc, _irq_asm_handler                   // priority: 4th
  ldr pc, _fiq_asm_handler                   // priority: 3rd

/**
 * SOFT vector table that is loaded by install_vector_table ABOVE
 * interrupt_vector_table
 */
// to make sure the addresses are aligned this must follow the
// actual vector table above!
soft_table:
_reset_asm_handler:                 .word reset_asm_handler
_undefined_instruction_asm_handler: .word undefined_instruction_asm_handler
_swi_asm_handler:                   .word swi_asm_handler
_prefetch_abort_asm_handler:        .word prefetch_abort_asm_handler
_data_abort_asm_handler:            .word data_abort_asm_handler
_irq_asm_handler:                   .word irq_asm_handler
_fiq_asm_handler:                   .word fiq_asm_handler

/**
 * called to install the vector table at address 0x0
 */
.global install_interrupt_table
install_interrupt_table:
	// Copy the vector table to the active table at 0x00000000
	ldr     r0, =interrupt_vector_table
	mov     r1, #0
	ldmia   r0!,{r2, r3, r4, r5, r6, r7, r8, r9}
	stmia   r1!,{r2, r3, r4, r5, r6, r7, r8, r9}
	// Copy the soft vector table
	ldr     r0, =soft_table
	ldmia   r0!,{r2, r3, r4, r5, r6, r7, r8}
	stmia   r1!,{r2, r3, r4, r5, r6, r7, r8}		
	bx lr

/************************************************************/
/* Assembly handlers for interrupts in the vector table     */
/************************************************************/

swi_asm_handler:
	//Save r0, r10 and lr. They will be used to change 
	//the SVC_SP
	stmfd sp!,{r0,r1,r2,r3,r4,r10,lr}
	
	// Save the old SP in r10
	mov r10, sp
	
	//Get the new SP for the thread
	bl get_svc_sp
	
	// Restore back the SP consumed in saving {r0,r1,r2,r3,r4,r10 and lr
	add sp, #28
	
	// Change the SP to the new SP received
	cmp r0, #0
	beq new_stack
	mov sp, r0
	
new_stack:	
	// restore back r0, r10 and lr
	ldr r0, [r10]
	ldr r1, [r10,#4]
	ldr r2, [r10,#8]
	ldr r3, [r10,#12]
	ldr r4, [r10,#16]	
	ldr lr, [r10,#24]
	ldr r10,[r10,#20]
	
	sub sp,sp, #4		//Creating space for storing spsr
	stmfd sp!,{r0-r12,lr}	
	
	mrs r4, spsr
	str r4, [sp,#56]
	mov r1,sp
	
	// Extracting the swi number
	ldr r0,[lr,#-4]
	bic r0,r0,#0xff000000
	
	// Getting the user stack to extract the 5th argument
	stmfd sp, {r13}^	// get the location of the user SP at SP-4
	sub r2, sp, #4		// manually point to sp-4
	ldr r2,[r2]			// fetch sp_user from sp-4
	ldr r2,[r2]			// fetch the 5th argument from sp_user
	
	cmp r0, #15
	bne SWI_C

	//Enabling interrupts for IRQ
	mrs r3, cpsr
	bic r3, #0x80
	msr cpsr,r3	

SWI_C:
	bl swi_c_handler
	
	ldr r4,[sp, #56]
	msr spsr, r4
	add sp,sp,#4
	
	
	ldmfd sp!,{r1-r12,lr}
	add sp,sp,#4
	movs pc,lr



irq_asm_handler:

	//If return value = 1, continue, else jump back to the user program
	//Save r0-r12,lr,spsr in the irq stack
	ldr sp, =__irq_stack_top
	sub sp,sp, #4 	//make space for saving spsr
	sub lr, lr, #4
	stmfd sp!,{r0-r12,lr}
	mrs r4, spsr
	str r4, [sp,#56]

	//Check if there are threads to be waken up and a context switch
	//musy be performed
	bl check_time
	
	//Restore back the original lr(corrupted due to jump to check_time)
	add r1, sp, #52
	ldr lr, [r1]	
	
	//output of check_time decides if we should change context or not
	cmp r0,#1
	bne INC_CLK
	
	
	//Store r0-r12 in TCB
	mov r0,sp
	bl save_context_irq		// Save the lr_irq in TCB.PC
	
	// Go to system mode
	mrs r1, cpsr
	orr r1, #0x1F
	msr cpsr,r1	
	
	//Grab the sp, lr of the user mode to save in TCB
	mov r0, lr
	mov r1, sp
	bl save_context_user
	
	// Go to SVC mode
	mrs r1, cpsr
	bic r1, #0x1F
	orr r1, #0x13
	msr cpsr,r1		
	
	//Grab the sp, lr of the SVC mode to save in TCB
	mov r0, lr
	mov r1, sp
	mrs r2, spsr
	bl save_context_SVC

	// Back to IRQ mode
	mrs r1, cpsr
	bic r1, #0x1F
	orr r1, #0x12
	msr cpsr,r1			
	
	
	bl context_switch	//Reminder: Update the context_switch
	
	//Get back a fresh TCB
	//Putting result in a safe register
	mov r10, r0
	
	//Write back sp,lr in system mode
	// Go to system mode
	mrs r1, cpsr
	orr r1, #0x1F
	msr cpsr,r1		
	
	ldr sp, [r10]
	ldr lr, [r10, #60]
	
	
	//Write back sp,lr in SVC mode
	// Go to SVC mode
	mrs r1, cpsr
	bic r1, #0x1F
	orr r1, #0x13
	msr cpsr,r1		
	
	//Grab SP_svc, LR_svc and SPSR_svc from the returned TCB
	ldr sp, [r10, #64]
	ldr lr, [r10, #68]	
	ldr r2, [r10, #76]
	msr spsr,r2
	
	// Back to IRQ mode
	mrs r1, cpsr
	bic r1, #0x1F
	orr r1, #0x12
	msr cpsr,r1	

	//IRQ_LR = TCB.PC
	ldr lr, [r10, #4]
	
	//IRQ_SP = TCB.registers
	add r1, r10, #8
	mov sp, r1				//setting sp to point to registers in TCB	
	
	
	//IRQ_SPSR = TCB.SPSR
	ldr r1, [r10,#72]
	msr spsr,r1		
	
INC_CLK:
	ldr r1, =CLOCK_TICKS
	ldr r2, [r1]
	add r2, r2, #1
	str r2, [r1]

	//Restore back r0 - r12
	ldmfd sp!,{r0-r12}
	
	// Go back to where the interrupt came from
	movs pc,lr		
	
	

reset_asm_handler:
  b _start // just reset the kernel


/************************************************************
 * If you fall into one of these handlers something bad is
 * happening. bkpt will drop back into gdb so you can debug.
 ************************************************************/
undefined_instruction_asm_handler:
  bkpt

prefetch_abort_asm_handler:
  bkpt

data_abort_asm_handler:
  bkpt

fiq_asm_handler:
  bkpt


/************************************************************/
/* Initializes cpsr for user mode and jumps to user program */
/************************************************************/
.global enter_user_mode
enter_user_mode:
	stmfd sp!,{r4-r12,lr}
	mrs r0,cpsr
	
	//Resetting interrupts and the value of mode
	and r0,r0, #0xffffff60
	
	//Enabling Interrupts
	orr r0,r0,#0x50
	msr cpsr,r0
	ldr sp,=__user_stack_top
	ldr pc,=__user_program
	b enter_user_mode

	
.global start_thread
start_thread:
	mrs r4,cpsr
	
	//Resetting interrupts and the value of mode
	and r4,r4, #0xffffff60
	
	//Enabling Interrupts
	orr r4,r4,#0x50
	msr cpsr,r4
	mov sp,r1
	mov pc,r0	