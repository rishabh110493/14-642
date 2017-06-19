.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"optimize_me.c"
	.text
	.align	2
	.global	optimize_me
	.type	optimize_me, %function	
optimize_me:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6,r7,r8,r9,r10, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #28
	mov	r7, r0		
	mov	r3, #17
	str	r3, [fp, #-32]		
	mov	r3, #0	
	mov r8, r3	
	b	.L4		
.L7:
	mov	r3, #0
	mov r10,r3
	mov r9, #-25	
	b	.L5
.L6:
	mov r1, r10
	
	mov	r5, r1, asl #2

	add	r4, r7, r5
	
	add	r3, r7, r5  
	
	ldr	r3, [r3]
	mov	r2, #17
	mul	r3, r2, r3
	add	r5, r3, #16
		
	mov r0, r8
	
	mov	r3, r0, asl #2
	
	add	r3, r7, r3	
	ldr	r6, [r3]
	
@inlining func	
	add r9,r9,#25 @optimized to multiply by 25	
	add	r3, r9, r0
@end of func	

	mul	r3, r6, r3 
	add	r2, r5, r3
	
	add	r3, r2, #3
	add	r2, r3, #15
	
	cmp	r3, #0
	movlt	r3, r2
	
	mov	r3, r3, asr #4
	str	r3, [r4]

	add	r3, r1, #1	
	mov r10, r3
.L5:
	cmp	r3, #500	
	blt	.L6
	add	r3, r0, #1	
	mov r8,r3
.L4:
	cmp	r3, #500
	blt	.L7
	sub	sp, fp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6,r7,r8,r9,r10, fp, lr}
	bx	lr				
	.size	optimize_me, .-optimize_me
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"