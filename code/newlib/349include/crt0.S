/**
 * @file   crt0.S
 *
 * @brief  Assembly startup routine for user programs
 *
 * @date   September 26th 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

.section ".text.start"

#include <swi_num.h>

.global _start
_start:
  ldr r0, =__bss_start
  ldr r1, =__bss_end
  mov r2, #0
  mov r3, #0
  mov r4, #0
  mov r5, #0
  // Clear out bss section
bss_loop:
  stmia r0!, {r2-r5}
  cmp r0, r1
  blo bss_loop
  
  // Branch to user defined main() and call exit() if main returns
  bl main
  swi SWI_EXIT