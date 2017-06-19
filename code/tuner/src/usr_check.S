.data
msg:
.ascii"hello world \n" 
len=.-msg

.section ".text"

#include<swi_num.h>

.global usr_check
usr_check:
	#mov r0,#0
	ldr r1 ,=msg
	ldr r2,=len
	#swi SWI_READ
	stmfd sp!,{r4-r11,r14}
	bl _write
	ldmfd sp!,{r4-r11,r14}
	bx lr
