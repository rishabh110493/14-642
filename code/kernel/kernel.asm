
kernel/kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <__start>:
    8000:	e10f0000 	mrs	r0, CPSR
    8004:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8008:	e59fd034 	ldr	sp, [pc, #52]	; 8044 <hang+0x8>
    800c:	e121f000 	msr	CPSR_c, r0
    8010:	e59fd030 	ldr	sp, [pc, #48]	; 8048 <hang+0xc>
    8014:	e59f0030 	ldr	r0, [pc, #48]	; 804c <hang+0x10>
    8018:	e59f1030 	ldr	r1, [pc, #48]	; 8050 <hang+0x14>
    801c:	e3a02000 	mov	r2, #0
    8020:	e3a03000 	mov	r3, #0
    8024:	e3a04000 	mov	r4, #0
    8028:	e3a05000 	mov	r5, #0

0000802c <bss_loop>:
    802c:	e8a0003c 	stmia	r0!, {r2, r3, r4, r5}
    8030:	e1500001 	cmp	r0, r1
    8034:	3afffffc 	bcc	802c <bss_loop>
    8038:	eb0000cd 	bl	8374 <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	00150000 	andseq	r0, r5, r0
    8048:	0013f000 	andseq	pc, r3, r0
    804c:	0000d000 	andeq	sp, r0, r0
    8050:	0002f000 	andeq	pc, r2, r0

00008054 <gpio_config>:
    8054:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8058:	e28db000 	add	fp, sp, #0
    805c:	e24dd01c 	sub	sp, sp, #28
    8060:	e1a03000 	mov	r3, r0
    8064:	e1a02001 	mov	r2, r1
    8068:	e54b3015 	strb	r3, [fp, #-21]
    806c:	e1a03002 	mov	r3, r2
    8070:	e54b3016 	strb	r3, [fp, #-22]
    8074:	e55b3015 	ldrb	r3, [fp, #-21]
    8078:	e3530035 	cmp	r3, #53	; 0x35
    807c:	8a000002 	bhi	808c <gpio_config+0x38>
    8080:	e55b3016 	ldrb	r3, [fp, #-22]
    8084:	e3530007 	cmp	r3, #7
    8088:	9a000000 	bls	8090 <gpio_config+0x3c>
    808c:	ea000035 	b	8168 <gpio_config+0x114>
    8090:	e55b2015 	ldrb	r2, [fp, #-21]
    8094:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    8098:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    809c:	e0832392 	umull	r2, r3, r2, r3
    80a0:	e1a031a3 	lsr	r3, r3, #3
    80a4:	e6ef3073 	uxtb	r3, r3
    80a8:	e50b3008 	str	r3, [fp, #-8]
    80ac:	e30c3000 	movw	r3, #49152	; 0xc000
    80b0:	e3403000 	movt	r3, #0
    80b4:	e5932000 	ldr	r2, [r3]
    80b8:	e51b3008 	ldr	r3, [fp, #-8]
    80bc:	e1a03103 	lsl	r3, r3, #2
    80c0:	e0823003 	add	r3, r2, r3
    80c4:	e5933000 	ldr	r3, [r3]
    80c8:	e50b300c 	str	r3, [fp, #-12]
    80cc:	e55b1015 	ldrb	r1, [fp, #-21]
    80d0:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    80d4:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    80d8:	e0832391 	umull	r2, r3, r1, r3
    80dc:	e1a021a3 	lsr	r2, r3, #3
    80e0:	e1a03002 	mov	r3, r2
    80e4:	e1a03103 	lsl	r3, r3, #2
    80e8:	e0833002 	add	r3, r3, r2
    80ec:	e1a03083 	lsl	r3, r3, #1
    80f0:	e0633001 	rsb	r3, r3, r1
    80f4:	e6ef3073 	uxtb	r3, r3
    80f8:	e1a02003 	mov	r2, r3
    80fc:	e1a03002 	mov	r3, r2
    8100:	e1a03083 	lsl	r3, r3, #1
    8104:	e0833002 	add	r3, r3, r2
    8108:	e50b3010 	str	r3, [fp, #-16]
    810c:	e51b3010 	ldr	r3, [fp, #-16]
    8110:	e3a02007 	mov	r2, #7
    8114:	e1a03312 	lsl	r3, r2, r3
    8118:	e1e03003 	mvn	r3, r3
    811c:	e1a02003 	mov	r2, r3
    8120:	e51b300c 	ldr	r3, [fp, #-12]
    8124:	e0033002 	and	r3, r3, r2
    8128:	e50b300c 	str	r3, [fp, #-12]
    812c:	e55b2016 	ldrb	r2, [fp, #-22]
    8130:	e51b3010 	ldr	r3, [fp, #-16]
    8134:	e1a03312 	lsl	r3, r2, r3
    8138:	e1a02003 	mov	r2, r3
    813c:	e51b300c 	ldr	r3, [fp, #-12]
    8140:	e1833002 	orr	r3, r3, r2
    8144:	e50b300c 	str	r3, [fp, #-12]
    8148:	e30c3000 	movw	r3, #49152	; 0xc000
    814c:	e3403000 	movt	r3, #0
    8150:	e5932000 	ldr	r2, [r3]
    8154:	e51b3008 	ldr	r3, [fp, #-8]
    8158:	e1a03103 	lsl	r3, r3, #2
    815c:	e0823003 	add	r3, r2, r3
    8160:	e51b200c 	ldr	r2, [fp, #-12]
    8164:	e5832000 	str	r2, [r3]
    8168:	e24bd000 	sub	sp, fp, #0
    816c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8170:	e12fff1e 	bx	lr

00008174 <gpio_set>:
    8174:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8178:	e28db000 	add	fp, sp, #0
    817c:	e24dd00c 	sub	sp, sp, #12
    8180:	e1a03000 	mov	r3, r0
    8184:	e54b3005 	strb	r3, [fp, #-5]
    8188:	e55b3005 	ldrb	r3, [fp, #-5]
    818c:	e3530035 	cmp	r3, #53	; 0x35
    8190:	9a000000 	bls	8198 <gpio_set+0x24>
    8194:	ea000014 	b	81ec <gpio_set+0x78>
    8198:	e55b3005 	ldrb	r3, [fp, #-5]
    819c:	e353001f 	cmp	r3, #31
    81a0:	9a000009 	bls	81cc <gpio_set+0x58>
    81a4:	e30c3000 	movw	r3, #49152	; 0xc000
    81a8:	e3403000 	movt	r3, #0
    81ac:	e5933000 	ldr	r3, [r3]
    81b0:	e2833020 	add	r3, r3, #32
    81b4:	e55b2005 	ldrb	r2, [fp, #-5]
    81b8:	e2422020 	sub	r2, r2, #32
    81bc:	e3a01001 	mov	r1, #1
    81c0:	e1a02211 	lsl	r2, r1, r2
    81c4:	e5832000 	str	r2, [r3]
    81c8:	ea000007 	b	81ec <gpio_set+0x78>
    81cc:	e30c3000 	movw	r3, #49152	; 0xc000
    81d0:	e3403000 	movt	r3, #0
    81d4:	e5933000 	ldr	r3, [r3]
    81d8:	e283301c 	add	r3, r3, #28
    81dc:	e55b2005 	ldrb	r2, [fp, #-5]
    81e0:	e3a01001 	mov	r1, #1
    81e4:	e1a02211 	lsl	r2, r1, r2
    81e8:	e5832000 	str	r2, [r3]
    81ec:	e24bd000 	sub	sp, fp, #0
    81f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81f4:	e12fff1e 	bx	lr

000081f8 <gpio_clr>:
    81f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81fc:	e28db000 	add	fp, sp, #0
    8200:	e24dd00c 	sub	sp, sp, #12
    8204:	e1a03000 	mov	r3, r0
    8208:	e54b3005 	strb	r3, [fp, #-5]
    820c:	e55b3005 	ldrb	r3, [fp, #-5]
    8210:	e3530035 	cmp	r3, #53	; 0x35
    8214:	9a000000 	bls	821c <gpio_clr+0x24>
    8218:	ea000014 	b	8270 <gpio_clr+0x78>
    821c:	e55b3005 	ldrb	r3, [fp, #-5]
    8220:	e353001f 	cmp	r3, #31
    8224:	9a000009 	bls	8250 <gpio_clr+0x58>
    8228:	e30c3000 	movw	r3, #49152	; 0xc000
    822c:	e3403000 	movt	r3, #0
    8230:	e5933000 	ldr	r3, [r3]
    8234:	e283302c 	add	r3, r3, #44	; 0x2c
    8238:	e55b2005 	ldrb	r2, [fp, #-5]
    823c:	e2422020 	sub	r2, r2, #32
    8240:	e3a01001 	mov	r1, #1
    8244:	e1a02211 	lsl	r2, r1, r2
    8248:	e5832000 	str	r2, [r3]
    824c:	ea000007 	b	8270 <gpio_clr+0x78>
    8250:	e30c3000 	movw	r3, #49152	; 0xc000
    8254:	e3403000 	movt	r3, #0
    8258:	e5933000 	ldr	r3, [r3]
    825c:	e2833028 	add	r3, r3, #40	; 0x28
    8260:	e55b2005 	ldrb	r2, [fp, #-5]
    8264:	e3a01001 	mov	r1, #1
    8268:	e1a02211 	lsl	r2, r1, r2
    826c:	e5832000 	str	r2, [r3]
    8270:	e24bd000 	sub	sp, fp, #0
    8274:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8278:	e12fff1e 	bx	lr

0000827c <gpio_set_pull>:
    827c:	e92d4800 	push	{fp, lr}
    8280:	e28db004 	add	fp, sp, #4
    8284:	e24dd008 	sub	sp, sp, #8
    8288:	e1a03000 	mov	r3, r0
    828c:	e1a02001 	mov	r2, r1
    8290:	e54b3005 	strb	r3, [fp, #-5]
    8294:	e1a03002 	mov	r3, r2
    8298:	e54b3006 	strb	r3, [fp, #-6]
    829c:	e55b3005 	ldrb	r3, [fp, #-5]
    82a0:	e3530035 	cmp	r3, #53	; 0x35
    82a4:	8a000002 	bhi	82b4 <gpio_set_pull+0x38>
    82a8:	e55b3006 	ldrb	r3, [fp, #-6]
    82ac:	e3530002 	cmp	r3, #2
    82b0:	9a000000 	bls	82b8 <gpio_set_pull+0x3c>
    82b4:	ea00002c 	b	836c <gpio_set_pull+0xf0>
    82b8:	e30c3000 	movw	r3, #49152	; 0xc000
    82bc:	e3403000 	movt	r3, #0
    82c0:	e5933000 	ldr	r3, [r3]
    82c4:	e2833094 	add	r3, r3, #148	; 0x94
    82c8:	e55b2006 	ldrb	r2, [fp, #-6]
    82cc:	e5832000 	str	r2, [r3]
    82d0:	e3a00096 	mov	r0, #150	; 0x96
    82d4:	eb000717 	bl	9f38 <delay_cycles>
    82d8:	e55b3005 	ldrb	r3, [fp, #-5]
    82dc:	e353001f 	cmp	r3, #31
    82e0:	9a000011 	bls	832c <gpio_set_pull+0xb0>
    82e4:	e30c3000 	movw	r3, #49152	; 0xc000
    82e8:	e3403000 	movt	r3, #0
    82ec:	e5933000 	ldr	r3, [r3]
    82f0:	e283309c 	add	r3, r3, #156	; 0x9c
    82f4:	e55b2005 	ldrb	r2, [fp, #-5]
    82f8:	e2422020 	sub	r2, r2, #32
    82fc:	e3a01001 	mov	r1, #1
    8300:	e1a02211 	lsl	r2, r1, r2
    8304:	e5832000 	str	r2, [r3]
    8308:	e3a00096 	mov	r0, #150	; 0x96
    830c:	eb000709 	bl	9f38 <delay_cycles>
    8310:	e30c3000 	movw	r3, #49152	; 0xc000
    8314:	e3403000 	movt	r3, #0
    8318:	e5933000 	ldr	r3, [r3]
    831c:	e283309c 	add	r3, r3, #156	; 0x9c
    8320:	e3a02000 	mov	r2, #0
    8324:	e5832000 	str	r2, [r3]
    8328:	ea00000f 	b	836c <gpio_set_pull+0xf0>
    832c:	e30c3000 	movw	r3, #49152	; 0xc000
    8330:	e3403000 	movt	r3, #0
    8334:	e5933000 	ldr	r3, [r3]
    8338:	e2833098 	add	r3, r3, #152	; 0x98
    833c:	e55b2005 	ldrb	r2, [fp, #-5]
    8340:	e3a01001 	mov	r1, #1
    8344:	e1a02211 	lsl	r2, r1, r2
    8348:	e5832000 	str	r2, [r3]
    834c:	e3a00096 	mov	r0, #150	; 0x96
    8350:	eb0006f8 	bl	9f38 <delay_cycles>
    8354:	e30c3000 	movw	r3, #49152	; 0xc000
    8358:	e3403000 	movt	r3, #0
    835c:	e5933000 	ldr	r3, [r3]
    8360:	e2833098 	add	r3, r3, #152	; 0x98
    8364:	e3a02000 	mov	r2, #0
    8368:	e5832000 	str	r2, [r3]
    836c:	e24bd004 	sub	sp, fp, #4
    8370:	e8bd8800 	pop	{fp, pc}

00008374 <kernel_main>:
    8374:	e92d4008 	push	{r3, lr}
    8378:	eb00070e 	bl	9fb8 <install_interrupt_table>
    837c:	eb000131 	bl	8848 <timer_stop>
    8380:	eb0006f8 	bl	9f68 <enable_interrupts>
    8384:	eb000235 	bl	8c60 <uart_init>
    8388:	e3a00064 	mov	r0, #100	; 0x64
    838c:	eb00026e 	bl	8d4c <i2c_master_init>
    8390:	eb00031e 	bl	9010 <threads_init>
    8394:	eb0001a7 	bl	8a38 <oled_init>
    8398:	eb000221 	bl	8c24 <oled_clear_screen>
    839c:	eb000172 	bl	896c <oled_buf_clr>
    83a0:	eb000773 	bl	a174 <enter_user_mode>
    83a4:	e8bd8008 	pop	{r3, pc}

000083a8 <irq_c_handler>:
    83a8:	e92d4008 	push	{r3, lr}
    83ac:	e30b0014 	movw	r0, #45076	; 0xb014
    83b0:	e3400000 	movt	r0, #0
    83b4:	eb0000a5 	bl	8650 <printk>
    83b8:	eb000134 	bl	8890 <timer_clear_pending>
    83bc:	e8bd8008 	pop	{r3, pc}

000083c0 <swi_c_handler>:
    83c0:	e92d4010 	push	{r4, lr}
    83c4:	e24dd010 	sub	sp, sp, #16
    83c8:	e1a04001 	mov	r4, r1
    83cc:	e3a03001 	mov	r3, #1
    83d0:	e58d300c 	str	r3, [sp, #12]
    83d4:	e3500011 	cmp	r0, #17
    83d8:	979ff100 	ldrls	pc, [pc, r0, lsl #2]
    83dc:	ea000060 	b	8564 <swi_c_handler+0x1a4>
    83e0:	0000844c 	andeq	r8, r0, ip, asr #8
    83e4:	00008428 	andeq	r8, r0, r8, lsr #8
    83e8:	00008564 	andeq	r8, r0, r4, ror #10
    83ec:	00008458 	andeq	r8, r0, r8, asr r4
    83f0:	00008564 	andeq	r8, r0, r4, ror #10
    83f4:	00008564 	andeq	r8, r0, r4, ror #10
    83f8:	0000846c 	andeq	r8, r0, ip, ror #8
    83fc:	00008440 	andeq	r8, r0, r0, asr #8
    8400:	00008484 	andeq	r8, r0, r4, lsl #9
    8404:	0000849c 	muleq	r0, ip, r4
    8408:	000084a8 	andeq	r8, r0, r8, lsr #9
    840c:	000084bc 			; <UNDEFINED> instruction: 0x000084bc
    8410:	00008520 	andeq	r8, r0, r0, lsr #10
    8414:	00008534 	andeq	r8, r0, r4, lsr r5
    8418:	00008544 	andeq	r8, r0, r4, asr #10
    841c:	000084ec 	andeq	r8, r0, ip, ror #9
    8420:	000084f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
    8424:	000084e0 	andeq	r8, r0, r0, ror #9
    8428:	e5910000 	ldr	r0, [r1]
    842c:	e5911004 	ldr	r1, [r1, #4]
    8430:	e5942008 	ldr	r2, [r4, #8]
    8434:	eb00065d 	bl	9db0 <syscall_write>
    8438:	e58d000c 	str	r0, [sp, #12]
    843c:	ea000048 	b	8564 <swi_c_handler+0x1a4>
    8440:	e3a00000 	mov	r0, #0
    8444:	eb000652 	bl	9d94 <syscall_exit>
    8448:	ea000045 	b	8564 <swi_c_handler+0x1a4>
    844c:	e5910000 	ldr	r0, [r1]
    8450:	eb00069a 	bl	9ec0 <syscall_sbrk>
    8454:	ea000043 	b	8568 <swi_c_handler+0x1a8>
    8458:	e5910000 	ldr	r0, [r1]
    845c:	e5911004 	ldr	r1, [r1, #4]
    8460:	eb0006ae 	bl	9f20 <syscall_fstat>
    8464:	e58d000c 	str	r0, [sp, #12]
    8468:	ea00003d 	b	8564 <swi_c_handler+0x1a4>
    846c:	e5910000 	ldr	r0, [r1]
    8470:	e5911004 	ldr	r1, [r1, #4]
    8474:	e5942008 	ldr	r2, [r4, #8]
    8478:	eb00065e 	bl	9df8 <syscall_read>
    847c:	e58d000c 	str	r0, [sp, #12]
    8480:	ea000037 	b	8564 <swi_c_handler+0x1a4>
    8484:	e5910000 	ldr	r0, [r1]
    8488:	e5d11004 	ldrb	r1, [r1, #4]
    848c:	e5942008 	ldr	r2, [r4, #8]
    8490:	eb00067f 	bl	9e94 <syscall_sample_adc_start>
    8494:	e58d000c 	str	r0, [sp, #12]
    8498:	ea000031 	b	8564 <swi_c_handler+0x1a4>
    849c:	eb000683 	bl	9eb0 <syscall_sample_adc_stop>
    84a0:	e58d000c 	str	r0, [sp, #12]
    84a4:	ea00002e 	b	8564 <swi_c_handler+0x1a4>
    84a8:	e5910000 	ldr	r0, [r1]
    84ac:	e5911004 	ldr	r1, [r1, #4]
    84b0:	eb0005a8 	bl	9b58 <syscall_thread_init>
    84b4:	e58d000c 	str	r0, [sp, #12]
    84b8:	ea000029 	b	8564 <swi_c_handler+0x1a4>
    84bc:	e5910000 	ldr	r0, [r1]
    84c0:	e5911004 	ldr	r1, [r1, #4]
    84c4:	e594c008 	ldr	ip, [r4, #8]
    84c8:	e594300c 	ldr	r3, [r4, #12]
    84cc:	e58d2000 	str	r2, [sp]
    84d0:	e1a0200c 	mov	r2, ip
    84d4:	eb000331 	bl	91a0 <syscall_thread_create>
    84d8:	e58d000c 	str	r0, [sp, #12]
    84dc:	ea000020 	b	8564 <swi_c_handler+0x1a4>
    84e0:	eb00052b 	bl	9994 <syscall_scheduler_start>
    84e4:	e58d000c 	str	r0, [sp, #12]
    84e8:	ea00001d 	b	8564 <swi_c_handler+0x1a4>
    84ec:	eb0004e2 	bl	987c <syscall_wait_until_next_period>
    84f0:	e59d000c 	ldr	r0, [sp, #12]
    84f4:	ea00001b 	b	8568 <swi_c_handler+0x1a8>
    84f8:	e3a03000 	mov	r3, #0
    84fc:	e58d300c 	str	r3, [sp, #12]
    8500:	eb0004f7 	bl	98e4 <syscall_get_time>
    8504:	e58d0008 	str	r0, [sp, #8]
    8508:	e59d3008 	ldr	r3, [sp, #8]
    850c:	e58d300c 	str	r3, [sp, #12]
    8510:	e59d3008 	ldr	r3, [sp, #8]
    8514:	e2833001 	add	r3, r3, #1
    8518:	e58d3008 	str	r3, [sp, #8]
    851c:	ea000010 	b	8564 <swi_c_handler+0x1a4>
    8520:	e5910000 	ldr	r0, [r1]
    8524:	e5911004 	ldr	r1, [r1, #4]
    8528:	eb000358 	bl	9290 <syscall_mutex_init>
    852c:	e58d000c 	str	r0, [sp, #12]
    8530:	ea00000b 	b	8564 <swi_c_handler+0x1a4>
    8534:	e5910000 	ldr	r0, [r1]
    8538:	eb000359 	bl	92a4 <syscall_mutex_lock>
    853c:	e59d000c 	ldr	r0, [sp, #12]
    8540:	ea000008 	b	8568 <swi_c_handler+0x1a8>
    8544:	e3a03000 	mov	r3, #0
    8548:	e58d300c 	str	r3, [sp, #12]
    854c:	eb000680 	bl	9f54 <disable_interrupts>
    8550:	e5940000 	ldr	r0, [r4]
    8554:	eb000365 	bl	92f0 <syscall_mutex_unlock>
    8558:	eb000682 	bl	9f68 <enable_interrupts>
    855c:	e59d000c 	ldr	r0, [sp, #12]
    8560:	ea000000 	b	8568 <swi_c_handler+0x1a8>
    8564:	e59d000c 	ldr	r0, [sp, #12]
    8568:	e28dd010 	add	sp, sp, #16
    856c:	e8bd8010 	pop	{r4, pc}

00008570 <printnumk>:
    8570:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8574:	e24dd008 	sub	sp, sp, #8
    8578:	e1a06002 	mov	r6, r2
    857c:	e1a07003 	mov	r7, r3
    8580:	e3500008 	cmp	r0, #8
    8584:	0a000004 	beq	859c <printnumk+0x2c>
    8588:	e30b8020 	movw	r8, #45088	; 0xb020
    858c:	e3408000 	movt	r8, #0
    8590:	e3500010 	cmp	r0, #16
    8594:	13a08000 	movne	r8, #0
    8598:	ea000001 	b	85a4 <printnumk+0x34>
    859c:	e30b801c 	movw	r8, #45084	; 0xb01c
    85a0:	e3408000 	movt	r8, #0
    85a4:	e28d4007 	add	r4, sp, #7
    85a8:	e1a05000 	mov	r5, r0
    85ac:	e3a09000 	mov	r9, #0
    85b0:	e30ba000 	movw	sl, #45056	; 0xb000
    85b4:	e340a000 	movt	sl, #0
    85b8:	e1a00006 	mov	r0, r6
    85bc:	e1a01007 	mov	r1, r7
    85c0:	e1a02005 	mov	r2, r5
    85c4:	e1a03009 	mov	r3, r9
    85c8:	eb000943 	bl	aadc <__aeabi_uldivmod>
    85cc:	e7da3002 	ldrb	r3, [sl, r2]
    85d0:	e4443001 	strb	r3, [r4], #-1
    85d4:	e1a00006 	mov	r0, r6
    85d8:	e1a01007 	mov	r1, r7
    85dc:	e1a02005 	mov	r2, r5
    85e0:	e1a03009 	mov	r3, r9
    85e4:	eb00093c 	bl	aadc <__aeabi_uldivmod>
    85e8:	e1a06000 	mov	r6, r0
    85ec:	e1a07001 	mov	r7, r1
    85f0:	e1963007 	orrs	r3, r6, r7
    85f4:	1affffef 	bne	85b8 <printnumk+0x48>
    85f8:	e3580000 	cmp	r8, #0
    85fc:	0a000002 	beq	860c <printnumk+0x9c>
    8600:	e5d80000 	ldrb	r0, [r8]
    8604:	e3500000 	cmp	r0, #0
    8608:	1a000004 	bne	8620 <printnumk+0xb0>
    860c:	e2844001 	add	r4, r4, #1
    8610:	e28d3008 	add	r3, sp, #8
    8614:	e1540003 	cmp	r4, r3
    8618:	1a000005 	bne	8634 <printnumk+0xc4>
    861c:	ea000009 	b	8648 <printnumk+0xd8>
    8620:	eb0001b1 	bl	8cec <uart_put_byte>
    8624:	e5f80001 	ldrb	r0, [r8, #1]!
    8628:	e3500000 	cmp	r0, #0
    862c:	1afffffb 	bne	8620 <printnumk+0xb0>
    8630:	eafffff5 	b	860c <printnumk+0x9c>
    8634:	e4d40001 	ldrb	r0, [r4], #1
    8638:	eb0001ab 	bl	8cec <uart_put_byte>
    863c:	e28d3008 	add	r3, sp, #8
    8640:	e1540003 	cmp	r4, r3
    8644:	1afffffa 	bne	8634 <printnumk+0xc4>
    8648:	e28dd008 	add	sp, sp, #8
    864c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

00008650 <printk>:
    8650:	e92d000f 	push	{r0, r1, r2, r3}
    8654:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8658:	e24dd008 	sub	sp, sp, #8
    865c:	e59d4020 	ldr	r4, [sp, #32]
    8660:	e28d3024 	add	r3, sp, #36	; 0x24
    8664:	e58d3004 	str	r3, [sp, #4]
    8668:	e3a06000 	mov	r6, #0
    866c:	e3a08008 	mov	r8, #8
    8670:	e3a07010 	mov	r7, #16
    8674:	ea00005c 	b	87ec <printk+0x19c>
    8678:	e3500025 	cmp	r0, #37	; 0x25
    867c:	0a000002 	beq	868c <printk+0x3c>
    8680:	e2844001 	add	r4, r4, #1
    8684:	eb000198 	bl	8cec <uart_put_byte>
    8688:	ea000057 	b	87ec <printk+0x19c>
    868c:	e5d43001 	ldrb	r3, [r4, #1]
    8690:	e353006f 	cmp	r3, #111	; 0x6f
    8694:	0a00002c 	beq	874c <printk+0xfc>
    8698:	8a000006 	bhi	86b8 <printk+0x68>
    869c:	e3530063 	cmp	r3, #99	; 0x63
    86a0:	0a000045 	beq	87bc <printk+0x16c>
    86a4:	e3530064 	cmp	r3, #100	; 0x64
    86a8:	0a00000d 	beq	86e4 <printk+0x94>
    86ac:	e3530025 	cmp	r3, #37	; 0x25
    86b0:	1a00004a 	bne	87e0 <printk+0x190>
    86b4:	ea000046 	b	87d4 <printk+0x184>
    86b8:	e3530073 	cmp	r3, #115	; 0x73
    86bc:	0a000032 	beq	878c <printk+0x13c>
    86c0:	8a000002 	bhi	86d0 <printk+0x80>
    86c4:	e3530070 	cmp	r3, #112	; 0x70
    86c8:	0a000027 	beq	876c <printk+0x11c>
    86cc:	ea000043 	b	87e0 <printk+0x190>
    86d0:	e3530075 	cmp	r3, #117	; 0x75
    86d4:	0a000014 	beq	872c <printk+0xdc>
    86d8:	e3530078 	cmp	r3, #120	; 0x78
    86dc:	0a000022 	beq	876c <printk+0x11c>
    86e0:	ea00003e 	b	87e0 <printk+0x190>
    86e4:	e59d3004 	ldr	r3, [sp, #4]
    86e8:	e2832004 	add	r2, r3, #4
    86ec:	e58d2004 	str	r2, [sp, #4]
    86f0:	e5935000 	ldr	r5, [r3]
    86f4:	e3550000 	cmp	r5, #0
    86f8:	aa000006 	bge	8718 <printk+0xc8>
    86fc:	e3a0002d 	mov	r0, #45	; 0x2d
    8700:	eb000179 	bl	8cec <uart_put_byte>
    8704:	e2652000 	rsb	r2, r5, #0
    8708:	e3a0000a 	mov	r0, #10
    870c:	e1a03fc2 	asr	r3, r2, #31
    8710:	ebffff96 	bl	8570 <printnumk>
    8714:	ea000033 	b	87e8 <printk+0x198>
    8718:	e3a0000a 	mov	r0, #10
    871c:	e1a02005 	mov	r2, r5
    8720:	e1a03fc5 	asr	r3, r5, #31
    8724:	ebffff91 	bl	8570 <printnumk>
    8728:	ea00002e 	b	87e8 <printk+0x198>
    872c:	e59d3004 	ldr	r3, [sp, #4]
    8730:	e2832004 	add	r2, r3, #4
    8734:	e58d2004 	str	r2, [sp, #4]
    8738:	e3a0000a 	mov	r0, #10
    873c:	e5932000 	ldr	r2, [r3]
    8740:	e1a03006 	mov	r3, r6
    8744:	ebffff89 	bl	8570 <printnumk>
    8748:	ea000026 	b	87e8 <printk+0x198>
    874c:	e59d3004 	ldr	r3, [sp, #4]
    8750:	e2832004 	add	r2, r3, #4
    8754:	e58d2004 	str	r2, [sp, #4]
    8758:	e1a00008 	mov	r0, r8
    875c:	e5932000 	ldr	r2, [r3]
    8760:	e1a03006 	mov	r3, r6
    8764:	ebffff81 	bl	8570 <printnumk>
    8768:	ea00001e 	b	87e8 <printk+0x198>
    876c:	e59d3004 	ldr	r3, [sp, #4]
    8770:	e2832004 	add	r2, r3, #4
    8774:	e58d2004 	str	r2, [sp, #4]
    8778:	e1a00007 	mov	r0, r7
    877c:	e5932000 	ldr	r2, [r3]
    8780:	e1a03006 	mov	r3, r6
    8784:	ebffff79 	bl	8570 <printnumk>
    8788:	ea000016 	b	87e8 <printk+0x198>
    878c:	e59d3004 	ldr	r3, [sp, #4]
    8790:	e2832004 	add	r2, r3, #4
    8794:	e58d2004 	str	r2, [sp, #4]
    8798:	e5935000 	ldr	r5, [r3]
    879c:	e5d50000 	ldrb	r0, [r5]
    87a0:	e3500000 	cmp	r0, #0
    87a4:	0a00000f 	beq	87e8 <printk+0x198>
    87a8:	eb00014f 	bl	8cec <uart_put_byte>
    87ac:	e5f50001 	ldrb	r0, [r5, #1]!
    87b0:	e3500000 	cmp	r0, #0
    87b4:	1afffffb 	bne	87a8 <printk+0x158>
    87b8:	ea00000a 	b	87e8 <printk+0x198>
    87bc:	e59d3004 	ldr	r3, [sp, #4]
    87c0:	e2832004 	add	r2, r3, #4
    87c4:	e58d2004 	str	r2, [sp, #4]
    87c8:	e5d30000 	ldrb	r0, [r3]
    87cc:	eb000146 	bl	8cec <uart_put_byte>
    87d0:	ea000004 	b	87e8 <printk+0x198>
    87d4:	e3a00025 	mov	r0, #37	; 0x25
    87d8:	eb000143 	bl	8cec <uart_put_byte>
    87dc:	ea000001 	b	87e8 <printk+0x198>
    87e0:	e3e00000 	mvn	r0, #0
    87e4:	ea000003 	b	87f8 <printk+0x1a8>
    87e8:	e2844002 	add	r4, r4, #2
    87ec:	e5d40000 	ldrb	r0, [r4]
    87f0:	e3500000 	cmp	r0, #0
    87f4:	1affff9f 	bne	8678 <printk+0x28>
    87f8:	e28dd008 	add	sp, sp, #8
    87fc:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8800:	e28dd010 	add	sp, sp, #16
    8804:	e12fff1e 	bx	lr

00008808 <timer_start>:
    8808:	e92d4008 	push	{r3, lr}
    880c:	e1a01000 	mov	r1, r0
    8810:	e3040240 	movw	r0, #16960	; 0x4240
    8814:	e340000f 	movt	r0, #15
    8818:	eb0006ae 	bl	a2d8 <__aeabi_idiv>
    881c:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8820:	e3433f00 	movt	r3, #16128	; 0x3f00
    8824:	e5830400 	str	r0, [r3, #1024]	; 0x400
    8828:	e5932218 	ldr	r2, [r3, #536]	; 0x218
    882c:	e3822001 	orr	r2, r2, #1
    8830:	e5832218 	str	r2, [r3, #536]	; 0x218
    8834:	e3a020f9 	mov	r2, #249	; 0xf9
    8838:	e583241c 	str	r2, [r3, #1052]	; 0x41c
    883c:	e30022a2 	movw	r2, #674	; 0x2a2
    8840:	e5832408 	str	r2, [r3, #1032]	; 0x408
    8844:	e8bd8008 	pop	{r3, pc}

00008848 <timer_stop>:
    8848:	e3a03a0b 	mov	r3, #45056	; 0xb000
    884c:	e3433f00 	movt	r3, #16128	; 0x3f00
    8850:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    8854:	e3c22080 	bic	r2, r2, #128	; 0x80
    8858:	e5832408 	str	r2, [r3, #1032]	; 0x408
    885c:	e5932408 	ldr	r2, [r3, #1032]	; 0x408
    8860:	e3c22020 	bic	r2, r2, #32
    8864:	e5832408 	str	r2, [r3, #1032]	; 0x408
    8868:	e12fff1e 	bx	lr

0000886c <timer_read>:
    886c:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8870:	e3433f00 	movt	r3, #16128	; 0x3f00
    8874:	e5930404 	ldr	r0, [r3, #1028]	; 0x404
    8878:	e12fff1e 	bx	lr

0000887c <timer_is_pending>:
    887c:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8880:	e3433f00 	movt	r3, #16128	; 0x3f00
    8884:	e5930410 	ldr	r0, [r3, #1040]	; 0x410
    8888:	e2000001 	and	r0, r0, #1
    888c:	e12fff1e 	bx	lr

00008890 <timer_clear_pending>:
    8890:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8894:	e3433f00 	movt	r3, #16128	; 0x3f00
    8898:	e5933410 	ldr	r3, [r3, #1040]	; 0x410
    889c:	e3130001 	tst	r3, #1
    88a0:	012fff1e 	bxeq	lr
    88a4:	e3a03a0b 	mov	r3, #45056	; 0xb000
    88a8:	e3433f00 	movt	r3, #16128	; 0x3f00
    88ac:	e3e01000 	mvn	r1, #0
    88b0:	e583140c 	str	r1, [r3, #1036]	; 0x40c
    88b4:	e5932410 	ldr	r2, [r3, #1040]	; 0x410
    88b8:	e3120001 	tst	r2, #1
    88bc:	1afffffb 	bne	88b0 <timer_clear_pending+0x20>
    88c0:	e12fff1e 	bx	lr

000088c4 <delay>:
    88c4:	e2403001 	sub	r3, r0, #1
    88c8:	e3500000 	cmp	r0, #0
    88cc:	012fff1e 	bxeq	lr
    88d0:	e1a00000 	nop			; (mov r0, r0)
    88d4:	e2433001 	sub	r3, r3, #1
    88d8:	e3730001 	cmn	r3, #1
    88dc:	1afffffb 	bne	88d0 <delay+0xc>
    88e0:	e12fff1e 	bx	lr

000088e4 <oled_buf_pixel_set>:
    88e4:	e350001f 	cmp	r0, #31
    88e8:	9351007f 	cmpls	r1, #127	; 0x7f
    88ec:	8a00000b 	bhi	8920 <oled_buf_pixel_set+0x3c>
    88f0:	e260001f 	rsb	r0, r0, #31
    88f4:	e261107f 	rsb	r1, r1, #127	; 0x7f
    88f8:	e1a031a0 	lsr	r3, r0, #3
    88fc:	e0811383 	add	r1, r1, r3, lsl #7
    8900:	e30d2010 	movw	r2, #53264	; 0xd010
    8904:	e3402000 	movt	r2, #0
    8908:	e2003007 	and	r3, r0, #7
    890c:	e3a00001 	mov	r0, #1
    8910:	e7d2c001 	ldrb	ip, [r2, r1]
    8914:	e18c3310 	orr	r3, ip, r0, lsl r3
    8918:	e7c23001 	strb	r3, [r2, r1]
    891c:	e12fff1e 	bx	lr
    8920:	e3a00000 	mov	r0, #0
    8924:	e12fff1e 	bx	lr

00008928 <oled_buf_pixel_clr>:
    8928:	e350001f 	cmp	r0, #31
    892c:	9351007f 	cmpls	r1, #127	; 0x7f
    8930:	8a00000b 	bhi	8964 <oled_buf_pixel_clr+0x3c>
    8934:	e260001f 	rsb	r0, r0, #31
    8938:	e261107f 	rsb	r1, r1, #127	; 0x7f
    893c:	e1a031a0 	lsr	r3, r0, #3
    8940:	e0811383 	add	r1, r1, r3, lsl #7
    8944:	e30d2010 	movw	r2, #53264	; 0xd010
    8948:	e3402000 	movt	r2, #0
    894c:	e2003007 	and	r3, r0, #7
    8950:	e3a00001 	mov	r0, #1
    8954:	e7d2c001 	ldrb	ip, [r2, r1]
    8958:	e1cc3310 	bic	r3, ip, r0, lsl r3
    895c:	e7c23001 	strb	r3, [r2, r1]
    8960:	e12fff1e 	bx	lr
    8964:	e3a00000 	mov	r0, #0
    8968:	e12fff1e 	bx	lr

0000896c <oled_buf_clr>:
    896c:	e59f3018 	ldr	r3, [pc, #24]	; 898c <oled_buf_clr+0x20>
    8970:	e2831c02 	add	r1, r3, #512	; 0x200
    8974:	e3a02000 	mov	r2, #0
    8978:	e5e32001 	strb	r2, [r3, #1]!
    897c:	e1530001 	cmp	r3, r1
    8980:	1afffffc 	bne	8978 <oled_buf_clr+0xc>
    8984:	e3a00001 	mov	r0, #1
    8988:	e12fff1e 	bx	lr
    898c:	0000d00f 	andeq	sp, r0, pc

00008990 <oled_write_command>:
    8990:	e92d4010 	push	{r4, lr}
    8994:	e1a04000 	mov	r4, r0
    8998:	e3a00009 	mov	r0, #9
    899c:	ebfffe15 	bl	81f8 <gpio_clr>
    89a0:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    89a4:	ebffffc6 	bl	88c4 <delay>
    89a8:	e3a00000 	mov	r0, #0
    89ac:	e3a01040 	mov	r1, #64	; 0x40
    89b0:	eb0004bc 	bl	9ca8 <spi_begin>
    89b4:	e1a00004 	mov	r0, r4
    89b8:	eb0004cd 	bl	9cf4 <spi_transfer>
    89bc:	eb0004c6 	bl	9cdc <spi_end>
    89c0:	e8bd8010 	pop	{r4, pc}

000089c4 <oled_write_data>:
    89c4:	e92d4010 	push	{r4, lr}
    89c8:	e1a04000 	mov	r4, r0
    89cc:	e3a00009 	mov	r0, #9
    89d0:	ebfffde7 	bl	8174 <gpio_set>
    89d4:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    89d8:	ebffffb9 	bl	88c4 <delay>
    89dc:	e3a00000 	mov	r0, #0
    89e0:	e3a01020 	mov	r1, #32
    89e4:	eb0004af 	bl	9ca8 <spi_begin>
    89e8:	e1a00004 	mov	r0, r4
    89ec:	eb0004c0 	bl	9cf4 <spi_transfer>
    89f0:	eb0004b9 	bl	9cdc <spi_end>
    89f4:	e8bd8010 	pop	{r4, pc}

000089f8 <oled_reset>:
    89f8:	e92d4008 	push	{r3, lr}
    89fc:	e3a00010 	mov	r0, #16
    8a00:	e3a01001 	mov	r1, #1
    8a04:	ebfffd92 	bl	8054 <gpio_config>
    8a08:	e3a00010 	mov	r0, #16
    8a0c:	ebfffdd8 	bl	8174 <gpio_set>
    8a10:	e30806a0 	movw	r0, #34464	; 0x86a0
    8a14:	e3400001 	movt	r0, #1
    8a18:	ebffffa9 	bl	88c4 <delay>
    8a1c:	e3a00010 	mov	r0, #16
    8a20:	ebfffdf4 	bl	81f8 <gpio_clr>
    8a24:	e30c0350 	movw	r0, #50000	; 0xc350
    8a28:	ebffffa5 	bl	88c4 <delay>
    8a2c:	e3a00010 	mov	r0, #16
    8a30:	ebfffdcf 	bl	8174 <gpio_set>
    8a34:	e8bd8008 	pop	{r3, pc}

00008a38 <oled_init>:
    8a38:	e92d4008 	push	{r3, lr}
    8a3c:	ebffffed 	bl	89f8 <oled_reset>
    8a40:	e3a00010 	mov	r0, #16
    8a44:	e3a01001 	mov	r1, #1
    8a48:	ebfffd81 	bl	8054 <gpio_config>
    8a4c:	e3a00009 	mov	r0, #9
    8a50:	e3a01001 	mov	r1, #1
    8a54:	ebfffd7e 	bl	8054 <gpio_config>
    8a58:	e3a00010 	mov	r0, #16
    8a5c:	ebfffdc4 	bl	8174 <gpio_set>
    8a60:	e3a00009 	mov	r0, #9
    8a64:	ebfffde3 	bl	81f8 <gpio_clr>
    8a68:	e3020710 	movw	r0, #10000	; 0x2710
    8a6c:	ebffff94 	bl	88c4 <delay>
    8a70:	e3a00000 	mov	r0, #0
    8a74:	e3a01020 	mov	r1, #32
    8a78:	eb00046d 	bl	9c34 <spi_master_init>
    8a7c:	e3a000ae 	mov	r0, #174	; 0xae
    8a80:	ebffffc2 	bl	8990 <oled_write_command>
    8a84:	e3a000d5 	mov	r0, #213	; 0xd5
    8a88:	ebffffc0 	bl	8990 <oled_write_command>
    8a8c:	e3a00080 	mov	r0, #128	; 0x80
    8a90:	ebffffbe 	bl	8990 <oled_write_command>
    8a94:	e3a000a8 	mov	r0, #168	; 0xa8
    8a98:	ebffffbc 	bl	8990 <oled_write_command>
    8a9c:	e3a0001f 	mov	r0, #31
    8aa0:	ebffffba 	bl	8990 <oled_write_command>
    8aa4:	e3a000d3 	mov	r0, #211	; 0xd3
    8aa8:	ebffffb8 	bl	8990 <oled_write_command>
    8aac:	e3a00000 	mov	r0, #0
    8ab0:	ebffffb6 	bl	8990 <oled_write_command>
    8ab4:	e3a00040 	mov	r0, #64	; 0x40
    8ab8:	ebffffb4 	bl	8990 <oled_write_command>
    8abc:	e3a0008d 	mov	r0, #141	; 0x8d
    8ac0:	ebffffb2 	bl	8990 <oled_write_command>
    8ac4:	e3a00014 	mov	r0, #20
    8ac8:	ebffffb0 	bl	8990 <oled_write_command>
    8acc:	e3a00020 	mov	r0, #32
    8ad0:	ebffffae 	bl	8990 <oled_write_command>
    8ad4:	e3a00000 	mov	r0, #0
    8ad8:	ebffffac 	bl	8990 <oled_write_command>
    8adc:	e3a000a1 	mov	r0, #161	; 0xa1
    8ae0:	ebffffaa 	bl	8990 <oled_write_command>
    8ae4:	e3a000c8 	mov	r0, #200	; 0xc8
    8ae8:	ebffffa8 	bl	8990 <oled_write_command>
    8aec:	e3a000da 	mov	r0, #218	; 0xda
    8af0:	ebffffa6 	bl	8990 <oled_write_command>
    8af4:	e3a00002 	mov	r0, #2
    8af8:	ebffffa4 	bl	8990 <oled_write_command>
    8afc:	e3a00081 	mov	r0, #129	; 0x81
    8b00:	ebffffa2 	bl	8990 <oled_write_command>
    8b04:	e3a0008f 	mov	r0, #143	; 0x8f
    8b08:	ebffffa0 	bl	8990 <oled_write_command>
    8b0c:	e3a000d9 	mov	r0, #217	; 0xd9
    8b10:	ebffff9e 	bl	8990 <oled_write_command>
    8b14:	e3a000f1 	mov	r0, #241	; 0xf1
    8b18:	ebffff9c 	bl	8990 <oled_write_command>
    8b1c:	e3a000db 	mov	r0, #219	; 0xdb
    8b20:	ebffff9a 	bl	8990 <oled_write_command>
    8b24:	e3a00040 	mov	r0, #64	; 0x40
    8b28:	ebffff98 	bl	8990 <oled_write_command>
    8b2c:	e3a000a4 	mov	r0, #164	; 0xa4
    8b30:	ebffff96 	bl	8990 <oled_write_command>
    8b34:	e3a000a6 	mov	r0, #166	; 0xa6
    8b38:	ebffff94 	bl	8990 <oled_write_command>
    8b3c:	e3a000af 	mov	r0, #175	; 0xaf
    8b40:	ebffff92 	bl	8990 <oled_write_command>
    8b44:	e8bd8008 	pop	{r3, pc}

00008b48 <oled_start_sequence>:
    8b48:	e92d4008 	push	{r3, lr}
    8b4c:	e3a00021 	mov	r0, #33	; 0x21
    8b50:	ebffff8e 	bl	8990 <oled_write_command>
    8b54:	e3a00000 	mov	r0, #0
    8b58:	ebffff8c 	bl	8990 <oled_write_command>
    8b5c:	e3a0007f 	mov	r0, #127	; 0x7f
    8b60:	ebffff8a 	bl	8990 <oled_write_command>
    8b64:	e3a00022 	mov	r0, #34	; 0x22
    8b68:	ebffff88 	bl	8990 <oled_write_command>
    8b6c:	e3a00000 	mov	r0, #0
    8b70:	ebffff86 	bl	8990 <oled_write_command>
    8b74:	e3a00003 	mov	r0, #3
    8b78:	ebffff84 	bl	8990 <oled_write_command>
    8b7c:	e8bd8008 	pop	{r3, pc}

00008b80 <oled_buf_draw>:
    8b80:	e92d4038 	push	{r3, r4, r5, lr}
    8b84:	ebffffef 	bl	8b48 <oled_start_sequence>
    8b88:	e3a00009 	mov	r0, #9
    8b8c:	ebfffd78 	bl	8174 <gpio_set>
    8b90:	e3a00000 	mov	r0, #0
    8b94:	e3a01020 	mov	r1, #32
    8b98:	eb000442 	bl	9ca8 <spi_begin>
    8b9c:	e59f401c 	ldr	r4, [pc, #28]	; 8bc0 <oled_buf_draw+0x40>
    8ba0:	e2845c02 	add	r5, r4, #512	; 0x200
    8ba4:	e5f40001 	ldrb	r0, [r4, #1]!
    8ba8:	eb000451 	bl	9cf4 <spi_transfer>
    8bac:	e1540005 	cmp	r4, r5
    8bb0:	1afffffb 	bne	8ba4 <oled_buf_draw+0x24>
    8bb4:	eb000448 	bl	9cdc <spi_end>
    8bb8:	e3a00001 	mov	r0, #1
    8bbc:	e8bd8038 	pop	{r3, r4, r5, pc}
    8bc0:	0000d00f 	andeq	sp, r0, pc

00008bc4 <oled_scroll_test>:
    8bc4:	e92d4038 	push	{r3, r4, r5, lr}
    8bc8:	ebffffde 	bl	8b48 <oled_start_sequence>
    8bcc:	e3a00009 	mov	r0, #9
    8bd0:	ebfffd67 	bl	8174 <gpio_set>
    8bd4:	e3a00000 	mov	r0, #0
    8bd8:	e3a01020 	mov	r1, #32
    8bdc:	eb000431 	bl	9ca8 <spi_begin>
    8be0:	e3a04c02 	mov	r4, #512	; 0x200
    8be4:	e30d5004 	movw	r5, #53252	; 0xd004
    8be8:	e3405000 	movt	r5, #0
    8bec:	e5950000 	ldr	r0, [r5]
    8bf0:	e2803001 	add	r3, r0, #1
    8bf4:	e5853000 	str	r3, [r5]
    8bf8:	e6ef0070 	uxtb	r0, r0
    8bfc:	eb00043c 	bl	9cf4 <spi_transfer>
    8c00:	e2544001 	subs	r4, r4, #1
    8c04:	1afffff8 	bne	8bec <oled_scroll_test+0x28>
    8c08:	eb000433 	bl	9cdc <spi_end>
    8c0c:	e30d3004 	movw	r3, #53252	; 0xd004
    8c10:	e3403000 	movt	r3, #0
    8c14:	e5932000 	ldr	r2, [r3]
    8c18:	e2822001 	add	r2, r2, #1
    8c1c:	e5832000 	str	r2, [r3]
    8c20:	e8bd8038 	pop	{r3, r4, r5, pc}

00008c24 <oled_clear_screen>:
    8c24:	e92d4038 	push	{r3, r4, r5, lr}
    8c28:	ebffffc6 	bl	8b48 <oled_start_sequence>
    8c2c:	e3a00009 	mov	r0, #9
    8c30:	ebfffd4f 	bl	8174 <gpio_set>
    8c34:	e3a00000 	mov	r0, #0
    8c38:	e3a01020 	mov	r1, #32
    8c3c:	eb000419 	bl	9ca8 <spi_begin>
    8c40:	e3a04c02 	mov	r4, #512	; 0x200
    8c44:	e3a05000 	mov	r5, #0
    8c48:	e1a00005 	mov	r0, r5
    8c4c:	eb000428 	bl	9cf4 <spi_transfer>
    8c50:	e2544001 	subs	r4, r4, #1
    8c54:	1afffffb 	bne	8c48 <oled_clear_screen+0x24>
    8c58:	eb00041f 	bl	9cdc <spi_end>
    8c5c:	e8bd8038 	pop	{r3, r4, r5, pc}

00008c60 <uart_init>:
    8c60:	e92d4008 	push	{r3, lr}
    8c64:	e3a0000f 	mov	r0, #15
    8c68:	e3a01000 	mov	r1, #0
    8c6c:	ebfffd82 	bl	827c <gpio_set_pull>
    8c70:	e3a0000e 	mov	r0, #14
    8c74:	e3a01000 	mov	r1, #0
    8c78:	ebfffd7f 	bl	827c <gpio_set_pull>
    8c7c:	e3a0000f 	mov	r0, #15
    8c80:	e3a01002 	mov	r1, #2
    8c84:	ebfffcf2 	bl	8054 <gpio_config>
    8c88:	e3a0000e 	mov	r0, #14
    8c8c:	e3a01002 	mov	r1, #2
    8c90:	ebfffcef 	bl	8054 <gpio_config>
    8c94:	e3a03a05 	mov	r3, #20480	; 0x5000
    8c98:	e3433f21 	movt	r3, #16161	; 0x3f21
    8c9c:	e3a02001 	mov	r2, #1
    8ca0:	e5832004 	str	r2, [r3, #4]
    8ca4:	e300210e 	movw	r2, #270	; 0x10e
    8ca8:	e5832068 	str	r2, [r3, #104]	; 0x68
    8cac:	e3a02000 	mov	r2, #0
    8cb0:	e5832044 	str	r2, [r3, #68]	; 0x44
    8cb4:	e3a02003 	mov	r2, #3
    8cb8:	e583204c 	str	r2, [r3, #76]	; 0x4c
    8cbc:	e5932048 	ldr	r2, [r3, #72]	; 0x48
    8cc0:	e3c22006 	bic	r2, r2, #6
    8cc4:	e5832048 	str	r2, [r3, #72]	; 0x48
    8cc8:	e8bd8008 	pop	{r3, pc}

00008ccc <uart_close>:
    8ccc:	e3a03a05 	mov	r3, #20480	; 0x5000
    8cd0:	e3433f21 	movt	r3, #16161	; 0x3f21
    8cd4:	e5932048 	ldr	r2, [r3, #72]	; 0x48
    8cd8:	e3822004 	orr	r2, r2, #4
    8cdc:	e5832048 	str	r2, [r3, #72]	; 0x48
    8ce0:	e3a02000 	mov	r2, #0
    8ce4:	e5832004 	str	r2, [r3, #4]
    8ce8:	e12fff1e 	bx	lr

00008cec <uart_put_byte>:
    8cec:	e3a02a05 	mov	r2, #20480	; 0x5000
    8cf0:	e3432f21 	movt	r2, #16161	; 0x3f21
    8cf4:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    8cf8:	e3130020 	tst	r3, #32
    8cfc:	0afffffc 	beq	8cf4 <uart_put_byte+0x8>
    8d00:	e3a03a05 	mov	r3, #20480	; 0x5000
    8d04:	e3433f21 	movt	r3, #16161	; 0x3f21
    8d08:	e5830040 	str	r0, [r3, #64]	; 0x40
    8d0c:	e12fff1e 	bx	lr

00008d10 <uart_get_byte>:
    8d10:	e3a03a05 	mov	r3, #20480	; 0x5000
    8d14:	e3433f21 	movt	r3, #16161	; 0x3f21
    8d18:	e5932048 	ldr	r2, [r3, #72]	; 0x48
    8d1c:	e3822002 	orr	r2, r2, #2
    8d20:	e5832048 	str	r2, [r3, #72]	; 0x48
    8d24:	e3a02a05 	mov	r2, #20480	; 0x5000
    8d28:	e3432f21 	movt	r2, #16161	; 0x3f21
    8d2c:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    8d30:	e3130001 	tst	r3, #1
    8d34:	0afffffc 	beq	8d2c <uart_get_byte+0x1c>
    8d38:	e3a03a05 	mov	r3, #20480	; 0x5000
    8d3c:	e3433f21 	movt	r3, #16161	; 0x3f21
    8d40:	e5930040 	ldr	r0, [r3, #64]	; 0x40
    8d44:	e6ef0070 	uxtb	r0, r0
    8d48:	e12fff1e 	bx	lr

00008d4c <i2c_master_init>:
    8d4c:	e92d4038 	push	{r3, r4, r5, lr}
    8d50:	e1a04000 	mov	r4, r0
    8d54:	e3a00002 	mov	r0, #2
    8d58:	e1a01000 	mov	r1, r0
    8d5c:	ebfffd46 	bl	827c <gpio_set_pull>
    8d60:	e3a00003 	mov	r0, #3
    8d64:	e3a01002 	mov	r1, #2
    8d68:	ebfffd43 	bl	827c <gpio_set_pull>
    8d6c:	e3a00002 	mov	r0, #2
    8d70:	e3a01004 	mov	r1, #4
    8d74:	ebfffcb6 	bl	8054 <gpio_config>
    8d78:	e3a00003 	mov	r0, #3
    8d7c:	e3a01004 	mov	r1, #4
    8d80:	ebfffcb3 	bl	8054 <gpio_config>
    8d84:	e3a05901 	mov	r5, #16384	; 0x4000
    8d88:	e3435f80 	movt	r5, #16256	; 0x3f80
    8d8c:	e3083011 	movw	r3, #32785	; 0x8011
    8d90:	e5853000 	str	r3, [r5]
    8d94:	e0641284 	rsb	r1, r4, r4, lsl #5
    8d98:	e0841101 	add	r1, r4, r1, lsl #2
    8d9c:	e30d0180 	movw	r0, #53632	; 0xd180
    8da0:	e34008f0 	movt	r0, #2288	; 0x8f0
    8da4:	e1a01181 	lsl	r1, r1, #3
    8da8:	eb00054a 	bl	a2d8 <__aeabi_idiv>
    8dac:	e5850014 	str	r0, [r5, #20]
    8db0:	e8bd8038 	pop	{r3, r4, r5, pc}

00008db4 <i2c_master_write>:
    8db4:	e3a03901 	mov	r3, #16384	; 0x4000
    8db8:	e3433f80 	movt	r3, #16256	; 0x3f80
    8dbc:	e593c000 	ldr	ip, [r3]
    8dc0:	e38cc010 	orr	ip, ip, #16
    8dc4:	e583c000 	str	ip, [r3]
    8dc8:	e593c004 	ldr	ip, [r3, #4]
    8dcc:	e38ccc01 	orr	ip, ip, #256	; 0x100
    8dd0:	e38cc002 	orr	ip, ip, #2
    8dd4:	e583c004 	str	ip, [r3, #4]
    8dd8:	e583200c 	str	r2, [r3, #12]
    8ddc:	e5831008 	str	r1, [r3, #8]
    8de0:	e3082090 	movw	r2, #32912	; 0x8090
    8de4:	e5832000 	str	r2, [r3]
    8de8:	e3a02901 	mov	r2, #16384	; 0x4000
    8dec:	e3432f80 	movt	r2, #16256	; 0x3f80
    8df0:	e5923004 	ldr	r3, [r2, #4]
    8df4:	e3130001 	tst	r3, #1
    8df8:	0afffffc 	beq	8df0 <i2c_master_write+0x3c>
    8dfc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8e00:	e3a03901 	mov	r3, #16384	; 0x4000
    8e04:	e3433f80 	movt	r3, #16256	; 0x3f80
    8e08:	ea000017 	b	8e6c <i2c_master_write+0xb8>
    8e0c:	e5932004 	ldr	r2, [r3, #4]
    8e10:	e3120010 	tst	r2, #16
    8e14:	0afffffc 	beq	8e0c <i2c_master_write+0x58>
    8e18:	e5932004 	ldr	r2, [r3, #4]
    8e1c:	e7e02252 	ubfx	r2, r2, #4, #1
    8e20:	e3510000 	cmp	r1, #0
    8e24:	03a02000 	moveq	r2, #0
    8e28:	12022001 	andne	r2, r2, #1
    8e2c:	e3520000 	cmp	r2, #0
    8e30:	0a00000a 	beq	8e60 <i2c_master_write+0xac>
    8e34:	e1a02000 	mov	r2, r0
    8e38:	e4d20001 	ldrb	r0, [r2], #1
    8e3c:	e5830010 	str	r0, [r3, #16]
    8e40:	e2411001 	sub	r1, r1, #1
    8e44:	e6ff1071 	uxth	r1, r1
    8e48:	e1a00002 	mov	r0, r2
    8e4c:	e593e004 	ldr	lr, [r3, #4]
    8e50:	e291c000 	adds	ip, r1, #0
    8e54:	13a0c001 	movne	ip, #1
    8e58:	e01cc22e 	ands	ip, ip, lr, lsr #4
    8e5c:	1afffff5 	bne	8e38 <i2c_master_write+0x84>
    8e60:	e5932004 	ldr	r2, [r3, #4]
    8e64:	e3120c01 	tst	r2, #256	; 0x100
    8e68:	1a000007 	bne	8e8c <i2c_master_write+0xd8>
    8e6c:	e5932004 	ldr	r2, [r3, #4]
    8e70:	e3120001 	tst	r2, #1
    8e74:	1affffe4 	bne	8e0c <i2c_master_write+0x58>
    8e78:	e3a03901 	mov	r3, #16384	; 0x4000
    8e7c:	e3433f80 	movt	r3, #16256	; 0x3f80
    8e80:	e5930004 	ldr	r0, [r3, #4]
    8e84:	e7e000d0 	ubfx	r0, r0, #1, #1
    8e88:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    8e8c:	e3a00000 	mov	r0, #0
    8e90:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00008e94 <i2c_master_read>:
    8e94:	e3a03901 	mov	r3, #16384	; 0x4000
    8e98:	e3433f80 	movt	r3, #16256	; 0x3f80
    8e9c:	e593c004 	ldr	ip, [r3, #4]
    8ea0:	e38ccc01 	orr	ip, ip, #256	; 0x100
    8ea4:	e38cc002 	orr	ip, ip, #2
    8ea8:	e583c004 	str	ip, [r3, #4]
    8eac:	e583200c 	str	r2, [r3, #12]
    8eb0:	e5831008 	str	r1, [r3, #8]
    8eb4:	e3082091 	movw	r2, #32913	; 0x8091
    8eb8:	e5832000 	str	r2, [r3]
    8ebc:	e3a03901 	mov	r3, #16384	; 0x4000
    8ec0:	e3433f80 	movt	r3, #16256	; 0x3f80
    8ec4:	ea000002 	b	8ed4 <i2c_master_read+0x40>
    8ec8:	e5932004 	ldr	r2, [r3, #4]
    8ecc:	e3120c01 	tst	r2, #256	; 0x100
    8ed0:	1a00001f 	bne	8f54 <i2c_master_read+0xc0>
    8ed4:	e5932004 	ldr	r2, [r3, #4]
    8ed8:	e3120020 	tst	r2, #32
    8edc:	0afffff9 	beq	8ec8 <i2c_master_read+0x34>
    8ee0:	e3a03901 	mov	r3, #16384	; 0x4000
    8ee4:	e3433f80 	movt	r3, #16256	; 0x3f80
    8ee8:	e5933004 	ldr	r3, [r3, #4]
    8eec:	e3130020 	tst	r3, #32
    8ef0:	0a00000b 	beq	8f24 <i2c_master_read+0x90>
    8ef4:	e3a03901 	mov	r3, #16384	; 0x4000
    8ef8:	e3433f80 	movt	r3, #16256	; 0x3f80
    8efc:	e5932010 	ldr	r2, [r3, #16]
    8f00:	e4c02001 	strb	r2, [r0], #1
    8f04:	e5932004 	ldr	r2, [r3, #4]
    8f08:	e3120020 	tst	r2, #32
    8f0c:	1afffffa 	bne	8efc <i2c_master_read+0x68>
    8f10:	ea000003 	b	8f24 <i2c_master_read+0x90>
    8f14:	e5932004 	ldr	r2, [r3, #4]
    8f18:	e3120c01 	tst	r2, #256	; 0x100
    8f1c:	0a000002 	beq	8f2c <i2c_master_read+0x98>
    8f20:	ea00000d 	b	8f5c <i2c_master_read+0xc8>
    8f24:	e3a03901 	mov	r3, #16384	; 0x4000
    8f28:	e3433f80 	movt	r3, #16256	; 0x3f80
    8f2c:	e5932004 	ldr	r2, [r3, #4]
    8f30:	e3120002 	tst	r2, #2
    8f34:	0afffff6 	beq	8f14 <i2c_master_read+0x80>
    8f38:	e3a03901 	mov	r3, #16384	; 0x4000
    8f3c:	e3433f80 	movt	r3, #16256	; 0x3f80
    8f40:	e5932000 	ldr	r2, [r3]
    8f44:	e3822010 	orr	r2, r2, #16
    8f48:	e5832000 	str	r2, [r3]
    8f4c:	e3a00001 	mov	r0, #1
    8f50:	e12fff1e 	bx	lr
    8f54:	e3a00000 	mov	r0, #0
    8f58:	e12fff1e 	bx	lr
    8f5c:	e3a00000 	mov	r0, #0
    8f60:	e12fff1e 	bx	lr

00008f64 <adc_init>:
    8f64:	e30d3210 	movw	r3, #53776	; 0xd210
    8f68:	e3403000 	movt	r3, #0
    8f6c:	e3a02000 	mov	r2, #0
    8f70:	e5832000 	str	r2, [r3]
    8f74:	e12fff1e 	bx	lr

00008f78 <adc_read>:
    8f78:	e92d4010 	push	{r4, lr}
    8f7c:	e24dd010 	sub	sp, sp, #16
    8f80:	e1a04000 	mov	r4, r0
    8f84:	e3a03000 	mov	r3, #0
    8f88:	e5cd300c 	strb	r3, [sp, #12]
    8f8c:	e30d3210 	movw	r3, #53776	; 0xd210
    8f90:	e3403000 	movt	r3, #0
    8f94:	e5933000 	ldr	r3, [r3]
    8f98:	e1500003 	cmp	r0, r3
    8f9c:	0a000011 	beq	8fe8 <adc_read+0x70>
    8fa0:	e3a03001 	mov	r3, #1
    8fa4:	e5cd3004 	strb	r3, [sp, #4]
    8fa8:	e1a03200 	lsl	r3, r0, #4
    8fac:	e5cd3005 	strb	r3, [sp, #5]
    8fb0:	e3a03000 	mov	r3, #0
    8fb4:	e5cd3006 	strb	r3, [sp, #6]
    8fb8:	e28d0004 	add	r0, sp, #4
    8fbc:	e3a01003 	mov	r1, #3
    8fc0:	e3a02049 	mov	r2, #73	; 0x49
    8fc4:	ebffff7a 	bl	8db4 <i2c_master_write>
    8fc8:	e3500001 	cmp	r0, #1
    8fcc:	030d3210 	movweq	r3, #53776	; 0xd210
    8fd0:	03403000 	movteq	r3, #0
    8fd4:	05834000 	streq	r4, [r3]
    8fd8:	e28d000c 	add	r0, sp, #12
    8fdc:	e3a01001 	mov	r1, #1
    8fe0:	e3a02049 	mov	r2, #73	; 0x49
    8fe4:	ebffff72 	bl	8db4 <i2c_master_write>
    8fe8:	e28d0008 	add	r0, sp, #8
    8fec:	e3a01002 	mov	r1, #2
    8ff0:	e3a02049 	mov	r2, #73	; 0x49
    8ff4:	ebffffa6 	bl	8e94 <i2c_master_read>
    8ff8:	e5dd0008 	ldrb	r0, [sp, #8]
    8ffc:	e5dd3009 	ldrb	r3, [sp, #9]
    9000:	e1830400 	orr	r0, r3, r0, lsl #8
    9004:	e1a00220 	lsr	r0, r0, #4
    9008:	e28dd010 	add	sp, sp, #16
    900c:	e8bd8010 	pop	{r4, pc}

00009010 <threads_init>:
    9010:	e3053218 	movw	r3, #21016	; 0x5218
    9014:	e3403001 	movt	r3, #1
    9018:	e59f20f4 	ldr	r2, [pc, #244]	; 9114 <threads_init+0x104>
    901c:	e5832040 	str	r2, [r3, #64]	; 0x40
    9020:	e59f20f0 	ldr	r2, [pc, #240]	; 9118 <threads_init+0x108>
    9024:	e58320b0 	str	r2, [r3, #176]	; 0xb0
    9028:	e59f20ec 	ldr	r2, [pc, #236]	; 911c <threads_init+0x10c>
    902c:	e5832120 	str	r2, [r3, #288]	; 0x120
    9030:	e59f20e8 	ldr	r2, [pc, #232]	; 9120 <threads_init+0x110>
    9034:	e5832190 	str	r2, [r3, #400]	; 0x190
    9038:	e59f20e4 	ldr	r2, [pc, #228]	; 9124 <threads_init+0x114>
    903c:	e5832200 	str	r2, [r3, #512]	; 0x200
    9040:	e59f20e0 	ldr	r2, [pc, #224]	; 9128 <threads_init+0x118>
    9044:	e5832270 	str	r2, [r3, #624]	; 0x270
    9048:	e59f20dc 	ldr	r2, [pc, #220]	; 912c <threads_init+0x11c>
    904c:	e58322e0 	str	r2, [r3, #736]	; 0x2e0
    9050:	e59f20d8 	ldr	r2, [pc, #216]	; 9130 <threads_init+0x120>
    9054:	e5832350 	str	r2, [r3, #848]	; 0x350
    9058:	e59f20d4 	ldr	r2, [pc, #212]	; 9134 <threads_init+0x124>
    905c:	e58323c0 	str	r2, [r3, #960]	; 0x3c0
    9060:	e59f20d0 	ldr	r2, [pc, #208]	; 9138 <threads_init+0x128>
    9064:	e5832430 	str	r2, [r3, #1072]	; 0x430
    9068:	e59f20cc 	ldr	r2, [pc, #204]	; 913c <threads_init+0x12c>
    906c:	e58324a0 	str	r2, [r3, #1184]	; 0x4a0
    9070:	e59f20c8 	ldr	r2, [pc, #200]	; 9140 <threads_init+0x130>
    9074:	e5832510 	str	r2, [r3, #1296]	; 0x510
    9078:	e59f20c4 	ldr	r2, [pc, #196]	; 9144 <threads_init+0x134>
    907c:	e5832580 	str	r2, [r3, #1408]	; 0x580
    9080:	e59f20c0 	ldr	r2, [pc, #192]	; 9148 <threads_init+0x138>
    9084:	e58325f0 	str	r2, [r3, #1520]	; 0x5f0
    9088:	e59f20bc 	ldr	r2, [pc, #188]	; 914c <threads_init+0x13c>
    908c:	e5832660 	str	r2, [r3, #1632]	; 0x660
    9090:	e59f20b8 	ldr	r2, [pc, #184]	; 9150 <threads_init+0x140>
    9094:	e58326d0 	str	r2, [r3, #1744]	; 0x6d0
    9098:	e59f20b4 	ldr	r2, [pc, #180]	; 9154 <threads_init+0x144>
    909c:	e5832740 	str	r2, [r3, #1856]	; 0x740
    90a0:	e59f20b0 	ldr	r2, [pc, #176]	; 9158 <threads_init+0x148>
    90a4:	e58327b0 	str	r2, [r3, #1968]	; 0x7b0
    90a8:	e59f20ac 	ldr	r2, [pc, #172]	; 915c <threads_init+0x14c>
    90ac:	e5832820 	str	r2, [r3, #2080]	; 0x820
    90b0:	e59f20a8 	ldr	r2, [pc, #168]	; 9160 <threads_init+0x150>
    90b4:	e5832890 	str	r2, [r3, #2192]	; 0x890
    90b8:	e59f20a4 	ldr	r2, [pc, #164]	; 9164 <threads_init+0x154>
    90bc:	e5832900 	str	r2, [r3, #2304]	; 0x900
    90c0:	e59f20a0 	ldr	r2, [pc, #160]	; 9168 <threads_init+0x158>
    90c4:	e5832970 	str	r2, [r3, #2416]	; 0x970
    90c8:	e59f209c 	ldr	r2, [pc, #156]	; 916c <threads_init+0x15c>
    90cc:	e58329e0 	str	r2, [r3, #2528]	; 0x9e0
    90d0:	e59f2098 	ldr	r2, [pc, #152]	; 9170 <threads_init+0x160>
    90d4:	e5832a50 	str	r2, [r3, #2640]	; 0xa50
    90d8:	e59f2094 	ldr	r2, [pc, #148]	; 9174 <threads_init+0x164>
    90dc:	e5832ac0 	str	r2, [r3, #2752]	; 0xac0
    90e0:	e59f2090 	ldr	r2, [pc, #144]	; 9178 <threads_init+0x168>
    90e4:	e5832b30 	str	r2, [r3, #2864]	; 0xb30
    90e8:	e59f208c 	ldr	r2, [pc, #140]	; 917c <threads_init+0x16c>
    90ec:	e5832ba0 	str	r2, [r3, #2976]	; 0xba0
    90f0:	e59f2088 	ldr	r2, [pc, #136]	; 9180 <threads_init+0x170>
    90f4:	e5832c10 	str	r2, [r3, #3088]	; 0xc10
    90f8:	e59f2084 	ldr	r2, [pc, #132]	; 9184 <threads_init+0x174>
    90fc:	e5832c80 	str	r2, [r3, #3200]	; 0xc80
    9100:	e59f2080 	ldr	r2, [pc, #128]	; 9188 <threads_init+0x178>
    9104:	e5832cf0 	str	r2, [r3, #3312]	; 0xcf0
    9108:	e59f207c 	ldr	r2, [pc, #124]	; 918c <threads_init+0x17c>
    910c:	e5832d60 	str	r2, [r3, #3424]	; 0xd60
    9110:	e12fff1e 	bx	lr
    9114:	000250a4 	andeq	r5, r2, r4, lsr #1
    9118:	0000e210 	andeq	lr, r0, r0, lsl r2
    911c:	0002b0a0 	andeq	fp, r2, r0, lsr #1
    9120:	0002d0a0 	andeq	sp, r2, r0, lsr #1
    9124:	00017014 	andeq	r7, r1, r4, lsl r0
    9128:	0001b014 	andeq	fp, r1, r4, lsl r0
    912c:	000260a0 	andeq	r6, r2, r0, lsr #1
    9130:	000270a0 	andeq	r7, r2, r0, lsr #1
    9134:	0001e098 	muleq	r1, r8, r0
    9138:	0001c098 	muleq	r1, r8, r0
    913c:	00019014 	andeq	r9, r1, r4, lsl r0
    9140:	0002309c 	muleq	r2, ip, r0
    9144:	00018014 	andeq	r8, r1, r4, lsl r0
    9148:	0002109c 	muleq	r2, ip, r0
    914c:	0001a014 	andeq	sl, r1, r4, lsl r0
    9150:	00010210 	andeq	r0, r1, r0, lsl r2
    9154:	0001d098 	muleq	r1, r8, r0
    9158:	00012210 	andeq	r2, r1, r0, lsl r2
    915c:	000280a0 	andeq	r8, r2, r0, lsr #1
    9160:	0002c0a0 	andeq	ip, r2, r0, lsr #1
    9164:	00013210 	andeq	r3, r1, r0, lsl r2
    9168:	00011210 	andeq	r1, r1, r0, lsl r2
    916c:	0002209c 	muleq	r2, ip, r0
    9170:	0002a0a0 	andeq	sl, r2, r0, lsr #1
    9174:	0000f210 	andeq	pc, r0, r0, lsl r2	; <UNPREDICTABLE>
    9178:	00014210 	andeq	r4, r1, r0, lsl r2
    917c:	0002009c 	muleq	r2, ip, r0
    9180:	000290a0 	andeq	r9, r2, r0, lsr #1
    9184:	0001f09c 	muleq	r1, ip, r0
    9188:	0002e0a0 	andeq	lr, r2, r0, lsr #1
    918c:	00015214 	andeq	r5, r1, r4, lsl r2

00009190 <get_idle_thread>:
    9190:	e30e309c 	movw	r3, #57500	; 0xe09c
    9194:	e3403001 	movt	r3, #1
    9198:	e5930000 	ldr	r0, [r3]
    919c:	e12fff1e 	bx	lr

000091a0 <syscall_thread_create>:
    91a0:	e92d4070 	push	{r4, r5, r6, lr}
    91a4:	e3a0c000 	mov	ip, #0
    91a8:	e3055218 	movw	r5, #21016	; 0x5218
    91ac:	e3405001 	movt	r5, #1
    91b0:	e0624182 	rsb	r4, r2, r2, lsl #3
    91b4:	e1a04104 	lsl	r4, r4, #2
    91b8:	e1a0600c 	mov	r6, ip
    91bc:	e084e00c 	add	lr, r4, ip
    91c0:	e28ee002 	add	lr, lr, #2
    91c4:	e785610e 	str	r6, [r5, lr, lsl #2]
    91c8:	e28cc001 	add	ip, ip, #1
    91cc:	e35c000d 	cmp	ip, #13
    91d0:	1afffff9 	bne	91bc <syscall_thread_create+0x1c>
    91d4:	e305c218 	movw	ip, #21016	; 0x5218
    91d8:	e340c001 	movt	ip, #1
    91dc:	e062e182 	rsb	lr, r2, r2, lsl #3
    91e0:	e08cc20e 	add	ip, ip, lr, lsl #4
    91e4:	e28ce058 	add	lr, ip, #88	; 0x58
    91e8:	e59d4010 	ldr	r4, [sp, #16]
    91ec:	e58c4058 	str	r4, [ip, #88]	; 0x58
    91f0:	e28c4050 	add	r4, ip, #80	; 0x50
    91f4:	e58c3054 	str	r3, [ip, #84]	; 0x54
    91f8:	e58c205c 	str	r2, [ip, #92]	; 0x5c
    91fc:	e58c2060 	str	r2, [ip, #96]	; 0x60
    9200:	e3510000 	cmp	r1, #0
    9204:	0a00001d 	beq	9280 <syscall_thread_create+0xe0>
    9208:	e24110e0 	sub	r1, r1, #224	; 0xe0
    920c:	e305c218 	movw	ip, #21016	; 0x5218
    9210:	e340c001 	movt	ip, #1
    9214:	e0623182 	rsb	r3, r2, r2, lsl #3
    9218:	e1a03203 	lsl	r3, r3, #4
    921c:	e78c1003 	str	r1, [ip, r3]
    9220:	e3500000 	cmp	r0, #0
    9224:	0a000017 	beq	9288 <syscall_thread_create+0xe8>
    9228:	e0621182 	rsb	r1, r2, r2, lsl #3
    922c:	e08c3201 	add	r3, ip, r1, lsl #4
    9230:	e5830004 	str	r0, [r3, #4]
    9234:	e3a0c001 	mov	ip, #1
    9238:	e583c064 	str	ip, [r3, #100]	; 0x64
    923c:	e3a00000 	mov	r0, #0
    9240:	e5830050 	str	r0, [r3, #80]	; 0x50
    9244:	e5830068 	str	r0, [r3, #104]	; 0x68
    9248:	e3a0ee15 	mov	lr, #336	; 0x150
    924c:	e583e048 	str	lr, [r3, #72]	; 0x48
    9250:	e583006c 	str	r0, [r3, #108]	; 0x6c
    9254:	e30330a0 	movw	r3, #12448	; 0x30a0
    9258:	e3403002 	movt	r3, #2
    925c:	e5931000 	ldr	r1, [r3]
    9260:	e181221c 	orr	r2, r1, ip, lsl r2
    9264:	e5832000 	str	r2, [r3]
    9268:	e3043214 	movw	r3, #16916	; 0x4214
    926c:	e3403001 	movt	r3, #1
    9270:	e5932000 	ldr	r2, [r3]
    9274:	e082200c 	add	r2, r2, ip
    9278:	e5832000 	str	r2, [r3]
    927c:	e8bd8070 	pop	{r4, r5, r6, pc}
    9280:	e3a00001 	mov	r0, #1
    9284:	e8bd8070 	pop	{r4, r5, r6, pc}
    9288:	e3a00001 	mov	r0, #1
    928c:	e8bd8070 	pop	{r4, r5, r6, pc}

00009290 <syscall_mutex_init>:
    9290:	e3500000 	cmp	r0, #0
    9294:	15801000 	strne	r1, [r0]
    9298:	13a00000 	movne	r0, #0
    929c:	03a00001 	moveq	r0, #1
    92a0:	e12fff1e 	bx	lr

000092a4 <syscall_mutex_lock>:
    92a4:	e92d4010 	push	{r4, lr}
    92a8:	e1a04000 	mov	r4, r0
    92ac:	e5943004 	ldr	r3, [r4, #4]
    92b0:	e3530000 	cmp	r3, #0
    92b4:	1afffffc 	bne	92ac <syscall_mutex_lock+0x8>
    92b8:	eb000325 	bl	9f54 <disable_interrupts>
    92bc:	e3a03001 	mov	r3, #1
    92c0:	e5843004 	str	r3, [r4, #4]
    92c4:	e30c3008 	movw	r3, #49160	; 0xc008
    92c8:	e3403000 	movt	r3, #0
    92cc:	e5932000 	ldr	r2, [r3]
    92d0:	e5941000 	ldr	r1, [r4]
    92d4:	e3053218 	movw	r3, #21016	; 0x5218
    92d8:	e3403001 	movt	r3, #1
    92dc:	e0622182 	rsb	r2, r2, r2, lsl #3
    92e0:	e0833202 	add	r3, r3, r2, lsl #4
    92e4:	e5831060 	str	r1, [r3, #96]	; 0x60
    92e8:	eb00031e 	bl	9f68 <enable_interrupts>
    92ec:	e8bd8010 	pop	{r4, pc}

000092f0 <syscall_mutex_unlock>:
    92f0:	e3a03000 	mov	r3, #0
    92f4:	e5803004 	str	r3, [r0, #4]
    92f8:	e30c3008 	movw	r3, #49160	; 0xc008
    92fc:	e3403000 	movt	r3, #0
    9300:	e5931000 	ldr	r1, [r3]
    9304:	e5933000 	ldr	r3, [r3]
    9308:	e3052218 	movw	r2, #21016	; 0x5218
    930c:	e3402001 	movt	r2, #1
    9310:	e0633183 	rsb	r3, r3, r3, lsl #3
    9314:	e0823203 	add	r3, r2, r3, lsl #4
    9318:	e2833058 	add	r3, r3, #88	; 0x58
    931c:	e5933004 	ldr	r3, [r3, #4]
    9320:	e0611181 	rsb	r1, r1, r1, lsl #3
    9324:	e0822201 	add	r2, r2, r1, lsl #4
    9328:	e5823060 	str	r3, [r2, #96]	; 0x60
    932c:	e12fff1e 	bx	lr

00009330 <getMostImportantRunnableThread>:
    9330:	e30330a0 	movw	r3, #12448	; 0x30a0
    9334:	e3403002 	movt	r3, #2
    9338:	e5933000 	ldr	r3, [r3]
    933c:	e3530000 	cmp	r3, #0
    9340:	0a000025 	beq	93dc <getMostImportantRunnableThread+0xac>
    9344:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    9348:	e3a02000 	mov	r2, #0
    934c:	e3a0001f 	mov	r0, #31
    9350:	e305c218 	movw	ip, #21016	; 0x5218
    9354:	e340c001 	movt	ip, #1
    9358:	e3130001 	tst	r3, #1
    935c:	0a00001a 	beq	93cc <getMostImportantRunnableThread+0x9c>
    9360:	e0621182 	rsb	r1, r2, r2, lsl #3
    9364:	e08c1201 	add	r1, ip, r1, lsl #4
    9368:	e591e060 	ldr	lr, [r1, #96]	; 0x60
    936c:	e0601180 	rsb	r1, r0, r0, lsl #3
    9370:	e08c1201 	add	r1, ip, r1, lsl #4
    9374:	e5911060 	ldr	r1, [r1, #96]	; 0x60
    9378:	e15e0001 	cmp	lr, r1
    937c:	31a00002 	movcc	r0, r2
    9380:	3a000011 	bcc	93cc <getMostImportantRunnableThread+0x9c>
    9384:	e0621182 	rsb	r1, r2, r2, lsl #3
    9388:	e08c1201 	add	r1, ip, r1, lsl #4
    938c:	e591e060 	ldr	lr, [r1, #96]	; 0x60
    9390:	e0601180 	rsb	r1, r0, r0, lsl #3
    9394:	e08c1201 	add	r1, ip, r1, lsl #4
    9398:	e5911060 	ldr	r1, [r1, #96]	; 0x60
    939c:	e15e0001 	cmp	lr, r1
    93a0:	1a000009 	bne	93cc <getMostImportantRunnableThread+0x9c>
    93a4:	e0621182 	rsb	r1, r2, r2, lsl #3
    93a8:	e08c1201 	add	r1, ip, r1, lsl #4
    93ac:	e591e05c 	ldr	lr, [r1, #92]	; 0x5c
    93b0:	e0601180 	rsb	r1, r0, r0, lsl #3
    93b4:	e08c1201 	add	r1, ip, r1, lsl #4
    93b8:	e2811058 	add	r1, r1, #88	; 0x58
    93bc:	e5911004 	ldr	r1, [r1, #4]
    93c0:	e15e0001 	cmp	lr, r1
    93c4:	31a00002 	movcc	r0, r2
    93c8:	eaffffff 	b	93cc <getMostImportantRunnableThread+0x9c>
    93cc:	e2822001 	add	r2, r2, #1
    93d0:	e1b030a3 	lsrs	r3, r3, #1
    93d4:	1affffdf 	bne	9358 <getMostImportantRunnableThread+0x28>
    93d8:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    93dc:	e3a0001f 	mov	r0, #31
    93e0:	e12fff1e 	bx	lr

000093e4 <context_switch>:
    93e4:	e92d4010 	push	{r4, lr}
    93e8:	e30e309c 	movw	r3, #57500	; 0xe09c
    93ec:	e3403001 	movt	r3, #1
    93f0:	e5933000 	ldr	r3, [r3]
    93f4:	e3054218 	movw	r4, #21016	; 0x5218
    93f8:	e3404001 	movt	r4, #1
    93fc:	e5843d94 	str	r3, [r4, #3476]	; 0xd94
    9400:	ebffffca 	bl	9330 <getMostImportantRunnableThread>
    9404:	e30c3008 	movw	r3, #49160	; 0xc008
    9408:	e3403000 	movt	r3, #0
    940c:	e5830000 	str	r0, [r3]
    9410:	e5930000 	ldr	r0, [r3]
    9414:	e0600180 	rsb	r0, r0, r0, lsl #3
    9418:	e0840200 	add	r0, r4, r0, lsl #4
    941c:	e8bd8010 	pop	{r4, pc}

00009420 <check_time>:
    9420:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    9424:	ebfffd19 	bl	8890 <timer_clear_pending>
    9428:	e30c3008 	movw	r3, #49160	; 0xc008
    942c:	e3403000 	movt	r3, #0
    9430:	e5930000 	ldr	r0, [r3]
    9434:	e30d4000 	movw	r4, #53248	; 0xd000
    9438:	e3404000 	movt	r4, #0
    943c:	e5941000 	ldr	r1, [r4]
    9440:	e7e611d1 	ubfx	r1, r1, #3, #7
    9444:	ebfffd26 	bl	88e4 <oled_buf_pixel_set>
    9448:	e5943000 	ldr	r3, [r4]
    944c:	e7e93053 	ubfx	r3, r3, #0, #10
    9450:	e3530000 	cmp	r3, #0
    9454:	1a000091 	bne	96a0 <check_time+0x280>
    9458:	ebfffdf1 	bl	8c24 <oled_clear_screen>
    945c:	ebfffdc7 	bl	8b80 <oled_buf_draw>
    9460:	ebfffd41 	bl	896c <oled_buf_clr>
    9464:	ea00008d 	b	96a0 <check_time+0x280>
    9468:	e0643184 	rsb	r3, r4, r4, lsl #3
    946c:	e0853203 	add	r3, r5, r3, lsl #4
    9470:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    9474:	e3530000 	cmp	r3, #0
    9478:	0a000012 	beq	94c8 <check_time+0xa8>
    947c:	e5980000 	ldr	r0, [r8]
    9480:	e0643184 	rsb	r3, r4, r4, lsl #3
    9484:	e0853203 	add	r3, r5, r3, lsl #4
    9488:	e5931058 	ldr	r1, [r3, #88]	; 0x58
    948c:	eb000389 	bl	a2b8 <__aeabi_uidivmod>
    9490:	e3510000 	cmp	r1, #0
    9494:	1a00000b 	bne	94c8 <check_time+0xa8>
    9498:	e0643184 	rsb	r3, r4, r4, lsl #3
    949c:	e0853203 	add	r3, r5, r3, lsl #4
    94a0:	e583a064 	str	sl, [r3, #100]	; 0x64
    94a4:	e5839068 	str	r9, [r3, #104]	; 0x68
    94a8:	e5839050 	str	r9, [r3, #80]	; 0x50
    94ac:	e1a0341a 	lsl	r3, sl, r4
    94b0:	e5972000 	ldr	r2, [r7]
    94b4:	e1832002 	orr	r2, r3, r2
    94b8:	e5872000 	str	r2, [r7]
    94bc:	e5962000 	ldr	r2, [r6]
    94c0:	e1c23003 	bic	r3, r2, r3
    94c4:	e5863000 	str	r3, [r6]
    94c8:	e2844001 	add	r4, r4, #1
    94cc:	e3540020 	cmp	r4, #32
    94d0:	1affffe4 	bne	9468 <check_time+0x48>
    94d4:	ebffff95 	bl	9330 <getMostImportantRunnableThread>
    94d8:	e30c3008 	movw	r3, #49160	; 0xc008
    94dc:	e3403000 	movt	r3, #0
    94e0:	e5933000 	ldr	r3, [r3]
    94e4:	e1530000 	cmp	r3, r0
    94e8:	1a000064 	bne	9680 <check_time+0x260>
    94ec:	e30c3008 	movw	r3, #49160	; 0xc008
    94f0:	e3403000 	movt	r3, #0
    94f4:	e5932000 	ldr	r2, [r3]
    94f8:	e3053218 	movw	r3, #21016	; 0x5218
    94fc:	e3403001 	movt	r3, #1
    9500:	e0622182 	rsb	r2, r2, r2, lsl #3
    9504:	e0833202 	add	r3, r3, r2, lsl #4
    9508:	e5930050 	ldr	r0, [r3, #80]	; 0x50
    950c:	e3500001 	cmp	r0, #1
    9510:	1a00001b 	bne	9584 <check_time+0x164>
    9514:	e30c3008 	movw	r3, #49160	; 0xc008
    9518:	e3403000 	movt	r3, #0
    951c:	e5933000 	ldr	r3, [r3]
    9520:	e353001f 	cmp	r3, #31
    9524:	0a000057 	beq	9688 <check_time+0x268>
    9528:	e30c2008 	movw	r2, #49160	; 0xc008
    952c:	e3402000 	movt	r2, #0
    9530:	e5921000 	ldr	r1, [r2]
    9534:	e3053218 	movw	r3, #21016	; 0x5218
    9538:	e3403001 	movt	r3, #1
    953c:	e0611181 	rsb	r1, r1, r1, lsl #3
    9540:	e0833201 	add	r3, r3, r1, lsl #4
    9544:	e3a01000 	mov	r1, #0
    9548:	e5831064 	str	r1, [r3, #100]	; 0x64
    954c:	e592e000 	ldr	lr, [r2]
    9550:	e30b3018 	movw	r3, #45080	; 0xb018
    9554:	e3403001 	movt	r3, #1
    9558:	e5931000 	ldr	r1, [r3]
    955c:	e3a0c001 	mov	ip, #1
    9560:	e1811e1c 	orr	r1, r1, ip, lsl lr
    9564:	e5831000 	str	r1, [r3]
    9568:	e5922000 	ldr	r2, [r2]
    956c:	e30330a0 	movw	r3, #12448	; 0x30a0
    9570:	e3403002 	movt	r3, #2
    9574:	e5931000 	ldr	r1, [r3]
    9578:	e1c1221c 	bic	r2, r1, ip, lsl r2
    957c:	e5832000 	str	r2, [r3]
    9580:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9584:	e30c1008 	movw	r1, #49160	; 0xc008
    9588:	e3401000 	movt	r1, #0
    958c:	e5912000 	ldr	r2, [r1]
    9590:	e3053218 	movw	r3, #21016	; 0x5218
    9594:	e3403001 	movt	r3, #1
    9598:	e0622182 	rsb	r2, r2, r2, lsl #3
    959c:	e0832202 	add	r2, r3, r2, lsl #4
    95a0:	e5920068 	ldr	r0, [r2, #104]	; 0x68
    95a4:	e5912000 	ldr	r2, [r1]
    95a8:	e0622182 	rsb	r2, r2, r2, lsl #3
    95ac:	e0833202 	add	r3, r3, r2, lsl #4
    95b0:	e2833050 	add	r3, r3, #80	; 0x50
    95b4:	e5933004 	ldr	r3, [r3, #4]
    95b8:	e1500003 	cmp	r0, r3
    95bc:	8a00000f 	bhi	9600 <check_time+0x1e0>
    95c0:	e5913000 	ldr	r3, [r1]
    95c4:	e353001f 	cmp	r3, #31
    95c8:	0a000030 	beq	9690 <check_time+0x270>
    95cc:	e5910000 	ldr	r0, [r1]
    95d0:	e3053218 	movw	r3, #21016	; 0x5218
    95d4:	e3403001 	movt	r3, #1
    95d8:	e1a02180 	lsl	r2, r0, #3
    95dc:	e0601002 	rsb	r1, r0, r2
    95e0:	e0831201 	add	r1, r3, r1, lsl #4
    95e4:	e5911068 	ldr	r1, [r1, #104]	; 0x68
    95e8:	e2811001 	add	r1, r1, #1
    95ec:	e0602002 	rsb	r2, r0, r2
    95f0:	e0833202 	add	r3, r3, r2, lsl #4
    95f4:	e5831068 	str	r1, [r3, #104]	; 0x68
    95f8:	e3a00000 	mov	r0, #0
    95fc:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9600:	e30c3008 	movw	r3, #49160	; 0xc008
    9604:	e3403000 	movt	r3, #0
    9608:	e5933000 	ldr	r3, [r3]
    960c:	e353001f 	cmp	r3, #31
    9610:	0a000020 	beq	9698 <check_time+0x278>
    9614:	e30c1008 	movw	r1, #49160	; 0xc008
    9618:	e3401000 	movt	r1, #0
    961c:	e5913000 	ldr	r3, [r1]
    9620:	e3052218 	movw	r2, #21016	; 0x5218
    9624:	e3402001 	movt	r2, #1
    9628:	e0633183 	rsb	r3, r3, r3, lsl #3
    962c:	e0823203 	add	r3, r2, r3, lsl #4
    9630:	e3a00000 	mov	r0, #0
    9634:	e5830064 	str	r0, [r3, #100]	; 0x64
    9638:	e591e000 	ldr	lr, [r1]
    963c:	e30330a0 	movw	r3, #12448	; 0x30a0
    9640:	e3403002 	movt	r3, #2
    9644:	e593c000 	ldr	ip, [r3]
    9648:	e3a00001 	mov	r0, #1
    964c:	e1ccce10 	bic	ip, ip, r0, lsl lr
    9650:	e583c000 	str	ip, [r3]
    9654:	e591e000 	ldr	lr, [r1]
    9658:	e30b3018 	movw	r3, #45080	; 0xb018
    965c:	e3403001 	movt	r3, #1
    9660:	e593c000 	ldr	ip, [r3]
    9664:	e18cce10 	orr	ip, ip, r0, lsl lr
    9668:	e583c000 	str	ip, [r3]
    966c:	e5913000 	ldr	r3, [r1]
    9670:	e0633183 	rsb	r3, r3, r3, lsl #3
    9674:	e0823203 	add	r3, r2, r3, lsl #4
    9678:	e5830050 	str	r0, [r3, #80]	; 0x50
    967c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9680:	e3a00001 	mov	r0, #1
    9684:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9688:	e3a00000 	mov	r0, #0
    968c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9690:	e3a00000 	mov	r0, #0
    9694:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9698:	e3a00000 	mov	r0, #0
    969c:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    96a0:	e3a04000 	mov	r4, #0
    96a4:	e3055218 	movw	r5, #21016	; 0x5218
    96a8:	e3405001 	movt	r5, #1
    96ac:	e30d8000 	movw	r8, #53248	; 0xd000
    96b0:	e3408000 	movt	r8, #0
    96b4:	e3a0a001 	mov	sl, #1
    96b8:	e1a09004 	mov	r9, r4
    96bc:	e30370a0 	movw	r7, #12448	; 0x30a0
    96c0:	e3407002 	movt	r7, #2
    96c4:	e30b6018 	movw	r6, #45080	; 0xb018
    96c8:	e3406001 	movt	r6, #1
    96cc:	eaffff65 	b	9468 <check_time+0x48>

000096d0 <get_svc_sp>:
    96d0:	e30c3008 	movw	r3, #49160	; 0xc008
    96d4:	e3403000 	movt	r3, #0
    96d8:	e5932000 	ldr	r2, [r3]
    96dc:	e3053218 	movw	r3, #21016	; 0x5218
    96e0:	e3403001 	movt	r3, #1
    96e4:	e0622182 	rsb	r2, r2, r2, lsl #3
    96e8:	e0833202 	add	r3, r3, r2, lsl #4
    96ec:	e2833068 	add	r3, r3, #104	; 0x68
    96f0:	e5933004 	ldr	r3, [r3, #4]
    96f4:	e3530000 	cmp	r3, #0
    96f8:	1a00000d 	bne	9734 <get_svc_sp+0x64>
    96fc:	e30c1008 	movw	r1, #49160	; 0xc008
    9700:	e3401000 	movt	r1, #0
    9704:	e5913000 	ldr	r3, [r1]
    9708:	e3052218 	movw	r2, #21016	; 0x5218
    970c:	e3402001 	movt	r2, #1
    9710:	e0633183 	rsb	r3, r3, r3, lsl #3
    9714:	e0823203 	add	r3, r2, r3, lsl #4
    9718:	e3a00001 	mov	r0, #1
    971c:	e583006c 	str	r0, [r3, #108]	; 0x6c
    9720:	e5913000 	ldr	r3, [r1]
    9724:	e0633183 	rsb	r3, r3, r3, lsl #3
    9728:	e0822203 	add	r2, r2, r3, lsl #4
    972c:	e5920040 	ldr	r0, [r2, #64]	; 0x40
    9730:	e12fff1e 	bx	lr
    9734:	e3a00000 	mov	r0, #0
    9738:	e12fff1e 	bx	lr

0000973c <save_context>:
    973c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    9740:	e2400004 	sub	r0, r0, #4
    9744:	e3a02000 	mov	r2, #0
    9748:	e30ce008 	movw	lr, #49160	; 0xc008
    974c:	e340e000 	movt	lr, #0
    9750:	e305c218 	movw	ip, #21016	; 0x5218
    9754:	e340c001 	movt	ip, #1
    9758:	e59e3000 	ldr	r3, [lr]
    975c:	e5b01004 	ldr	r1, [r0, #4]!
    9760:	e0633183 	rsb	r3, r3, r3, lsl #3
    9764:	e0823103 	add	r3, r2, r3, lsl #2
    9768:	e2833002 	add	r3, r3, #2
    976c:	e78c1103 	str	r1, [ip, r3, lsl #2]
    9770:	e2822001 	add	r2, r2, #1
    9774:	e352000d 	cmp	r2, #13
    9778:	1afffff6 	bne	9758 <save_context+0x1c>
    977c:	e3a00000 	mov	r0, #0
    9780:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00009784 <save_context_SVC>:
    9784:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    9788:	e30ce008 	movw	lr, #49160	; 0xc008
    978c:	e340e000 	movt	lr, #0
    9790:	e59ec000 	ldr	ip, [lr]
    9794:	e3053218 	movw	r3, #21016	; 0x5218
    9798:	e3403001 	movt	r3, #1
    979c:	e06cc18c 	rsb	ip, ip, ip, lsl #3
    97a0:	e083c20c 	add	ip, r3, ip, lsl #4
    97a4:	e58c1040 	str	r1, [ip, #64]	; 0x40
    97a8:	e59e1000 	ldr	r1, [lr]
    97ac:	e0611181 	rsb	r1, r1, r1, lsl #3
    97b0:	e0831201 	add	r1, r3, r1, lsl #4
    97b4:	e5810044 	str	r0, [r1, #68]	; 0x44
    97b8:	e59e1000 	ldr	r1, [lr]
    97bc:	e0611181 	rsb	r1, r1, r1, lsl #3
    97c0:	e0833201 	add	r3, r3, r1, lsl #4
    97c4:	e583204c 	str	r2, [r3, #76]	; 0x4c
    97c8:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

000097cc <save_context_user>:
    97cc:	e30cc008 	movw	ip, #49160	; 0xc008
    97d0:	e340c000 	movt	ip, #0
    97d4:	e59c2000 	ldr	r2, [ip]
    97d8:	e3053218 	movw	r3, #21016	; 0x5218
    97dc:	e3403001 	movt	r3, #1
    97e0:	e0622182 	rsb	r2, r2, r2, lsl #3
    97e4:	e1a02202 	lsl	r2, r2, #4
    97e8:	e7831002 	str	r1, [r3, r2]
    97ec:	e59c2000 	ldr	r2, [ip]
    97f0:	e0622182 	rsb	r2, r2, r2, lsl #3
    97f4:	e0833202 	add	r3, r3, r2, lsl #4
    97f8:	e583003c 	str	r0, [r3, #60]	; 0x3c
    97fc:	e12fff1e 	bx	lr

00009800 <save_context_irq>:
    9800:	e92d4010 	push	{r4, lr}
    9804:	e2401004 	sub	r1, r0, #4
    9808:	e3a02000 	mov	r2, #0
    980c:	e30c4008 	movw	r4, #49160	; 0xc008
    9810:	e3404000 	movt	r4, #0
    9814:	e305e218 	movw	lr, #21016	; 0x5218
    9818:	e340e001 	movt	lr, #1
    981c:	e5943000 	ldr	r3, [r4]
    9820:	e5b1c004 	ldr	ip, [r1, #4]!
    9824:	e0633183 	rsb	r3, r3, r3, lsl #3
    9828:	e0823103 	add	r3, r2, r3, lsl #2
    982c:	e2833002 	add	r3, r3, #2
    9830:	e78ec103 	str	ip, [lr, r3, lsl #2]
    9834:	e2822001 	add	r2, r2, #1
    9838:	e352000d 	cmp	r2, #13
    983c:	1afffff6 	bne	981c <save_context_irq+0x1c>
    9840:	e30c1008 	movw	r1, #49160	; 0xc008
    9844:	e3401000 	movt	r1, #0
    9848:	e5912000 	ldr	r2, [r1]
    984c:	e590c034 	ldr	ip, [r0, #52]	; 0x34
    9850:	e3053218 	movw	r3, #21016	; 0x5218
    9854:	e3403001 	movt	r3, #1
    9858:	e0622182 	rsb	r2, r2, r2, lsl #3
    985c:	e0832202 	add	r2, r3, r2, lsl #4
    9860:	e582c004 	str	ip, [r2, #4]
    9864:	e5912000 	ldr	r2, [r1]
    9868:	e5901038 	ldr	r1, [r0, #56]	; 0x38
    986c:	e0622182 	rsb	r2, r2, r2, lsl #3
    9870:	e0833202 	add	r3, r3, r2, lsl #4
    9874:	e5831048 	str	r1, [r3, #72]	; 0x48
    9878:	e8bd8010 	pop	{r4, pc}

0000987c <syscall_wait_until_next_period>:
    987c:	e30c1008 	movw	r1, #49160	; 0xc008
    9880:	e3401000 	movt	r1, #0
    9884:	e5913000 	ldr	r3, [r1]
    9888:	e3052218 	movw	r2, #21016	; 0x5218
    988c:	e3402001 	movt	r2, #1
    9890:	e0633183 	rsb	r3, r3, r3, lsl #3
    9894:	e0823203 	add	r3, r2, r3, lsl #4
    9898:	e3a00000 	mov	r0, #0
    989c:	e5830064 	str	r0, [r3, #100]	; 0x64
    98a0:	e5913000 	ldr	r3, [r1]
    98a4:	e0633183 	rsb	r3, r3, r3, lsl #3
    98a8:	e0822203 	add	r2, r2, r3, lsl #4
    98ac:	e3a03001 	mov	r3, #1
    98b0:	e5823050 	str	r3, [r2, #80]	; 0x50
    98b4:	e30c1008 	movw	r1, #49160	; 0xc008
    98b8:	e3401000 	movt	r1, #0
    98bc:	e3052218 	movw	r2, #21016	; 0x5218
    98c0:	e3402001 	movt	r2, #1
    98c4:	e5913000 	ldr	r3, [r1]
    98c8:	e0633183 	rsb	r3, r3, r3, lsl #3
    98cc:	e0823203 	add	r3, r2, r3, lsl #4
    98d0:	e2833060 	add	r3, r3, #96	; 0x60
    98d4:	e5933004 	ldr	r3, [r3, #4]
    98d8:	e3530000 	cmp	r3, #0
    98dc:	0afffff8 	beq	98c4 <syscall_wait_until_next_period+0x48>
    98e0:	e12fff1e 	bx	lr

000098e4 <syscall_get_time>:
    98e4:	e30d3000 	movw	r3, #53248	; 0xd000
    98e8:	e3403000 	movt	r3, #0
    98ec:	e5930000 	ldr	r0, [r3]
    98f0:	e12fff1e 	bx	lr

000098f4 <UB_Test>:
    98f4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    98f8:	e3a06000 	mov	r6, #0
    98fc:	e3a04000 	mov	r4, #0
    9900:	e3055218 	movw	r5, #21016	; 0x5218
    9904:	e3405001 	movt	r5, #1
    9908:	e0643184 	rsb	r3, r4, r4, lsl #3
    990c:	e0853203 	add	r3, r5, r3, lsl #4
    9910:	e2833058 	add	r3, r3, #88	; 0x58
    9914:	e5933004 	ldr	r3, [r3, #4]
    9918:	e353001f 	cmp	r3, #31
    991c:	8a00000e 	bhi	995c <UB_Test+0x68>
    9920:	e0643184 	rsb	r3, r4, r4, lsl #3
    9924:	e0853203 	add	r3, r5, r3, lsl #4
    9928:	e5930054 	ldr	r0, [r3, #84]	; 0x54
    992c:	e5938058 	ldr	r8, [r3, #88]	; 0x58
    9930:	eb00032d 	bl	a5ec <__aeabi_ui2f>
    9934:	e1a07000 	mov	r7, r0
    9938:	e1a00008 	mov	r0, r8
    993c:	eb00032a 	bl	a5ec <__aeabi_ui2f>
    9940:	e1a01000 	mov	r1, r0
    9944:	e1a00007 	mov	r0, r7
    9948:	eb0003c6 	bl	a868 <__aeabi_fdiv>
    994c:	e1a01000 	mov	r1, r0
    9950:	e1a00006 	mov	r0, r6
    9954:	eb0002b5 	bl	a430 <__addsf3>
    9958:	e1a06000 	mov	r6, r0
    995c:	e2844001 	add	r4, r4, #1
    9960:	e354001f 	cmp	r4, #31
    9964:	1affffe7 	bne	9908 <UB_Test+0x14>
    9968:	e30b301c 	movw	r3, #45084	; 0xb01c
    996c:	e3403001 	movt	r3, #1
    9970:	e3042214 	movw	r2, #16916	; 0x4214
    9974:	e3402001 	movt	r2, #1
    9978:	e5922000 	ldr	r2, [r2]
    997c:	e1a00006 	mov	r0, r6
    9980:	e7931102 	ldr	r1, [r3, r2, lsl #2]
    9984:	eb000442 	bl	aa94 <__aeabi_fcmple>
    9988:	e2900000 	adds	r0, r0, #0
    998c:	13a00001 	movne	r0, #1
    9990:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00009994 <syscall_scheduler_start>:
    9994:	e92d4008 	push	{r3, lr}
    9998:	ebffffd5 	bl	98f4 <UB_Test>
    999c:	e3500000 	cmp	r0, #0
    99a0:	0a00000b 	beq	99d4 <syscall_scheduler_start+0x40>
    99a4:	ebfffbb9 	bl	8890 <timer_clear_pending>
    99a8:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    99ac:	ebfffb95 	bl	8808 <timer_start>
    99b0:	e3053218 	movw	r3, #21016	; 0x5218
    99b4:	e3403001 	movt	r3, #1
    99b8:	e5931d90 	ldr	r1, [r3, #3472]	; 0xd90
    99bc:	e30e309c 	movw	r3, #57500	; 0xe09c
    99c0:	e3403001 	movt	r3, #1
    99c4:	e5930000 	ldr	r0, [r3]
    99c8:	eb0001f1 	bl	a194 <start_thread>
    99cc:	e3a00000 	mov	r0, #0
    99d0:	e8bd8008 	pop	{r3, pc}
    99d4:	e3a00001 	mov	r0, #1
    99d8:	e8bd8008 	pop	{r3, pc}

000099dc <set_UB_Bounds>:
    99dc:	e30b301c 	movw	r3, #45084	; 0xb01c
    99e0:	e3403001 	movt	r3, #1
    99e4:	e3a025fe 	mov	r2, #1065353216	; 0x3f800000
    99e8:	e5832004 	str	r2, [r3, #4]
    99ec:	e3012206 	movw	r2, #4614	; 0x1206
    99f0:	e3432f54 	movt	r2, #16212	; 0x3f54
    99f4:	e5832008 	str	r2, [r3, #8]
    99f8:	e3092a6b 	movw	r2, #39531	; 0x9a6b
    99fc:	e3432f47 	movt	r2, #16199	; 0x3f47
    9a00:	e583200c 	str	r2, [r3, #12]
    9a04:	e30b2da5 	movw	r2, #48549	; 0xbda5
    9a08:	e3432f41 	movt	r2, #16193	; 0x3f41
    9a0c:	e5832010 	str	r2, [r3, #16]
    9a10:	e3042f76 	movw	r2, #20342	; 0x4f76
    9a14:	e3432f3e 	movt	r2, #16190	; 0x3f3e
    9a18:	e5832014 	str	r2, [r3, #20]
    9a1c:	e301254d 	movw	r2, #5453	; 0x154d
    9a20:	e3432f3c 	movt	r2, #16188	; 0x3f3c
    9a24:	e5832018 	str	r2, [r3, #24]
    9a28:	e3082588 	movw	r2, #34184	; 0x8588
    9a2c:	e3432f3a 	movt	r2, #16186	; 0x3f3a
    9a30:	e583201c 	str	r2, [r3, #28]
    9a34:	e3052810 	movw	r2, #22544	; 0x5810
    9a38:	e3432f39 	movt	r2, #16185	; 0x3f39
    9a3c:	e5832020 	str	r2, [r3, #32]
    9a40:	e30722b0 	movw	r2, #29360	; 0x72b0
    9a44:	e3432f38 	movt	r2, #16184	; 0x3f38
    9a48:	e5832024 	str	r2, [r3, #36]	; 0x24
    9a4c:	e30b2b30 	movw	r2, #47920	; 0xbb30
    9a50:	e3432f37 	movt	r2, #16183	; 0x3f37
    9a54:	e5832028 	str	r2, [r3, #40]	; 0x28
    9a58:	e3022474 	movw	r2, #9332	; 0x2474
    9a5c:	e3432f37 	movt	r2, #16183	; 0x3f37
    9a60:	e583202c 	str	r2, [r3, #44]	; 0x2c
    9a64:	e30a27f0 	movw	r2, #42992	; 0xa7f0
    9a68:	e3432f36 	movt	r2, #16182	; 0x3f36
    9a6c:	e5832030 	str	r2, [r3, #48]	; 0x30
    9a70:	e3032f14 	movw	r2, #16148	; 0x3f14
    9a74:	e3432f36 	movt	r2, #16182	; 0x3f36
    9a78:	e5832034 	str	r2, [r3, #52]	; 0x34
    9a7c:	e30e2354 	movw	r2, #58196	; 0xe354
    9a80:	e3432f35 	movt	r2, #16181	; 0x3f35
    9a84:	e5832038 	str	r2, [r3, #56]	; 0x38
    9a88:	e3092b3d 	movw	r2, #39741	; 0x9b3d
    9a8c:	e3432f35 	movt	r2, #16181	; 0x3f35
    9a90:	e583203c 	str	r2, [r3, #60]	; 0x3c
    9a94:	e3052326 	movw	r2, #21286	; 0x5326
    9a98:	e3432f35 	movt	r2, #16181	; 0x3f35
    9a9c:	e5832040 	str	r2, [r3, #64]	; 0x40
    9aa0:	e301282b 	movw	r2, #6187	; 0x182b
    9aa4:	e3432f35 	movt	r2, #16181	; 0x3f35
    9aa8:	e5832044 	str	r2, [r3, #68]	; 0x44
    9aac:	e30e23bd 	movw	r2, #58301	; 0xe3bd
    9ab0:	e3432f34 	movt	r2, #16180	; 0x3f34
    9ab4:	e5832048 	str	r2, [r3, #72]	; 0x48
    9ab8:	e30b25dd 	movw	r2, #46557	; 0xb5dd
    9abc:	e3432f34 	movt	r2, #16180	; 0x3f34
    9ac0:	e583204c 	str	r2, [r3, #76]	; 0x4c
    9ac4:	e30827fd 	movw	r2, #34813	; 0x87fd
    9ac8:	e3432f34 	movt	r2, #16180	; 0x3f34
    9acc:	e5832050 	str	r2, [r3, #80]	; 0x50
    9ad0:	e3062738 	movw	r2, #26424	; 0x6738
    9ad4:	e3432f34 	movt	r2, #16180	; 0x3f34
    9ad8:	e5832054 	str	r2, [r3, #84]	; 0x54
    9adc:	e3032fe6 	movw	r2, #16358	; 0x3fe6
    9ae0:	e3432f34 	movt	r2, #16180	; 0x3f34
    9ae4:	e5832058 	str	r2, [r3, #88]	; 0x58
    9ae8:	e3012f21 	movw	r2, #7969	; 0x1f21
    9aec:	e3432f34 	movt	r2, #16180	; 0x3f34
    9af0:	e583205c 	str	r2, [r3, #92]	; 0x5c
    9af4:	e30024ea 	movw	r2, #1258	; 0x4ea
    9af8:	e3432f34 	movt	r2, #16180	; 0x3f34
    9afc:	e5832060 	str	r2, [r3, #96]	; 0x60
    9b00:	e30e2ab3 	movw	r2, #60083	; 0xeab3
    9b04:	e3432f33 	movt	r2, #16179	; 0x3f33
    9b08:	e5832064 	str	r2, [r3, #100]	; 0x64
    9b0c:	e30d207d 	movw	r2, #53373	; 0xd07d
    9b10:	e3432f33 	movt	r2, #16179	; 0x3f33
    9b14:	e5832068 	str	r2, [r3, #104]	; 0x68
    9b18:	e30b2cd3 	movw	r2, #48339	; 0xbcd3
    9b1c:	e3432f33 	movt	r2, #16179	; 0x3f33
    9b20:	e583206c 	str	r2, [r3, #108]	; 0x6c
    9b24:	e30a229c 	movw	r2, #41628	; 0xa29c
    9b28:	e3432f33 	movt	r2, #16179	; 0x3f33
    9b2c:	e5832070 	str	r2, [r3, #112]	; 0x70
    9b30:	e3082ef3 	movw	r2, #36595	; 0x8ef3
    9b34:	e3432f33 	movt	r2, #16179	; 0x3f33
    9b38:	e5832074 	str	r2, [r3, #116]	; 0x74
    9b3c:	e30821d8 	movw	r2, #33240	; 0x81d8
    9b40:	e3432f33 	movt	r2, #16179	; 0x3f33
    9b44:	e5832078 	str	r2, [r3, #120]	; 0x78
    9b48:	e3062e2f 	movw	r2, #28207	; 0x6e2f
    9b4c:	e3432f33 	movt	r2, #16179	; 0x3f33
    9b50:	e583207c 	str	r2, [r3, #124]	; 0x7c
    9b54:	e12fff1e 	bx	lr

00009b58 <syscall_thread_init>:
    9b58:	e92d4070 	push	{r4, r5, r6, lr}
    9b5c:	e30e309c 	movw	r3, #57500	; 0xe09c
    9b60:	e3403001 	movt	r3, #1
    9b64:	e5830000 	str	r0, [r3]
    9b68:	e3a0c000 	mov	ip, #0
    9b6c:	e3054218 	movw	r4, #21016	; 0x5218
    9b70:	e3404001 	movt	r4, #1
    9b74:	e1a0200c 	mov	r2, ip
    9b78:	e3a05020 	mov	r5, #32
    9b7c:	e06ce18c 	rsb	lr, ip, ip, lsl #3
    9b80:	e084320e 	add	r3, r4, lr, lsl #4
    9b84:	e5832054 	str	r2, [r3, #84]	; 0x54
    9b88:	e5832058 	str	r2, [r3, #88]	; 0x58
    9b8c:	e583505c 	str	r5, [r3, #92]	; 0x5c
    9b90:	e2836060 	add	r6, r3, #96	; 0x60
    9b94:	e5835060 	str	r5, [r3, #96]	; 0x60
    9b98:	e5832064 	str	r2, [r3, #100]	; 0x64
    9b9c:	e784220e 	str	r2, [r4, lr, lsl #4]
    9ba0:	e5832004 	str	r2, [r3, #4]
    9ba4:	e28cc001 	add	ip, ip, #1
    9ba8:	e35c0020 	cmp	ip, #32
    9bac:	1afffff2 	bne	9b7c <syscall_thread_init+0x24>
    9bb0:	e3053218 	movw	r3, #21016	; 0x5218
    9bb4:	e3403001 	movt	r3, #1
    9bb8:	e3a0201f 	mov	r2, #31
    9bbc:	e5832dec 	str	r2, [r3, #3564]	; 0xdec
    9bc0:	e3a0c001 	mov	ip, #1
    9bc4:	e583cdf4 	str	ip, [r3, #3572]	; 0xdf4
    9bc8:	e5831d90 	str	r1, [r3, #3472]	; 0xd90
    9bcc:	e5830d94 	str	r0, [r3, #3476]	; 0xd94
    9bd0:	e583cde8 	str	ip, [r3, #3560]	; 0xde8
    9bd4:	e3011388 	movw	r1, #5000	; 0x1388
    9bd8:	e5831de4 	str	r1, [r3, #3556]	; 0xde4
    9bdc:	e30330a0 	movw	r3, #12448	; 0x30a0
    9be0:	e3403002 	movt	r3, #2
    9be4:	e3a01102 	mov	r1, #-2147483648	; 0x80000000
    9be8:	e5831000 	str	r1, [r3]
    9bec:	e30b3018 	movw	r3, #45080	; 0xb018
    9bf0:	e3403001 	movt	r3, #1
    9bf4:	e3a04000 	mov	r4, #0
    9bf8:	e5834000 	str	r4, [r3]
    9bfc:	e30c3008 	movw	r3, #49160	; 0xc008
    9c00:	e3403000 	movt	r3, #0
    9c04:	e5832000 	str	r2, [r3]
    9c08:	ebffff73 	bl	99dc <set_UB_Bounds>
    9c0c:	e1a00004 	mov	r0, r4
    9c10:	e8bd8070 	pop	{r4, r5, r6, pc}

00009c14 <wait>:
    9c14:	e2403001 	sub	r3, r0, #1
    9c18:	e3500000 	cmp	r0, #0
    9c1c:	012fff1e 	bxeq	lr
    9c20:	e1a00000 	nop			; (mov r0, r0)
    9c24:	e2433001 	sub	r3, r3, #1
    9c28:	e3730001 	cmn	r3, #1
    9c2c:	1afffffb 	bne	9c20 <wait+0xc>
    9c30:	e12fff1e 	bx	lr

00009c34 <spi_master_init>:
    9c34:	e92d4010 	push	{r4, lr}
    9c38:	e1a04001 	mov	r4, r1
    9c3c:	e3a00007 	mov	r0, #7
    9c40:	e3a01004 	mov	r1, #4
    9c44:	ebfff902 	bl	8054 <gpio_config>
    9c48:	e3a00008 	mov	r0, #8
    9c4c:	e3a01004 	mov	r1, #4
    9c50:	ebfff8ff 	bl	8054 <gpio_config>
    9c54:	e3a0000a 	mov	r0, #10
    9c58:	e3a01004 	mov	r1, #4
    9c5c:	ebfff8fc 	bl	8054 <gpio_config>
    9c60:	e3a0000b 	mov	r0, #11
    9c64:	e3a01004 	mov	r1, #4
    9c68:	ebfff8f9 	bl	8054 <gpio_config>
    9c6c:	e3a03901 	mov	r3, #16384	; 0x4000
    9c70:	e3433f20 	movt	r3, #16160	; 0x3f20
    9c74:	e3a02000 	mov	r2, #0
    9c78:	e5832000 	str	r2, [r3]
    9c7c:	e5932000 	ldr	r2, [r3]
    9c80:	e3822030 	orr	r2, r2, #48	; 0x30
    9c84:	e5832000 	str	r2, [r3]
    9c88:	e5932000 	ldr	r2, [r3]
    9c8c:	e3c2200f 	bic	r2, r2, #15
    9c90:	e3822040 	orr	r2, r2, #64	; 0x40
    9c94:	e5832000 	str	r2, [r3]
    9c98:	e5834008 	str	r4, [r3, #8]
    9c9c:	e3020710 	movw	r0, #10000	; 0x2710
    9ca0:	ebffffdb 	bl	9c14 <wait>
    9ca4:	e8bd8010 	pop	{r4, pc}

00009ca8 <spi_begin>:
    9ca8:	e3a03901 	mov	r3, #16384	; 0x4000
    9cac:	e3433f20 	movt	r3, #16160	; 0x3f20
    9cb0:	e3a02000 	mov	r2, #0
    9cb4:	e5832000 	str	r2, [r3]
    9cb8:	e5932000 	ldr	r2, [r3]
    9cbc:	e3822030 	orr	r2, r2, #48	; 0x30
    9cc0:	e5832000 	str	r2, [r3]
    9cc4:	e5932000 	ldr	r2, [r3]
    9cc8:	e3c2200f 	bic	r2, r2, #15
    9ccc:	e3822040 	orr	r2, r2, #64	; 0x40
    9cd0:	e5832000 	str	r2, [r3]
    9cd4:	e5831008 	str	r1, [r3, #8]
    9cd8:	e12fff1e 	bx	lr

00009cdc <spi_end>:
    9cdc:	e3a03901 	mov	r3, #16384	; 0x4000
    9ce0:	e3433f20 	movt	r3, #16160	; 0x3f20
    9ce4:	e5932000 	ldr	r2, [r3]
    9ce8:	e3c22080 	bic	r2, r2, #128	; 0x80
    9cec:	e5832000 	str	r2, [r3]
    9cf0:	e12fff1e 	bx	lr

00009cf4 <spi_transfer>:
    9cf4:	e92d4070 	push	{r4, r5, r6, lr}
    9cf8:	e1a06000 	mov	r6, r0
    9cfc:	e3a03901 	mov	r3, #16384	; 0x4000
    9d00:	e3433f20 	movt	r3, #16160	; 0x3f20
    9d04:	e5932000 	ldr	r2, [r3]
    9d08:	e38220b0 	orr	r2, r2, #176	; 0xb0
    9d0c:	e5832000 	str	r2, [r3]
    9d10:	e5933000 	ldr	r3, [r3]
    9d14:	e3130701 	tst	r3, #262144	; 0x40000
    9d18:	1a000007 	bne	9d3c <spi_transfer+0x48>
    9d1c:	e3a05001 	mov	r5, #1
    9d20:	e3a04901 	mov	r4, #16384	; 0x4000
    9d24:	e3434f20 	movt	r4, #16160	; 0x3f20
    9d28:	e1a00005 	mov	r0, r5
    9d2c:	ebffffb8 	bl	9c14 <wait>
    9d30:	e5943000 	ldr	r3, [r4]
    9d34:	e3130701 	tst	r3, #262144	; 0x40000
    9d38:	0afffffa 	beq	9d28 <spi_transfer+0x34>
    9d3c:	e3a03901 	mov	r3, #16384	; 0x4000
    9d40:	e3433f20 	movt	r3, #16160	; 0x3f20
    9d44:	e5836004 	str	r6, [r3, #4]
    9d48:	e5933000 	ldr	r3, [r3]
    9d4c:	e3130801 	tst	r3, #65536	; 0x10000
    9d50:	1a000007 	bne	9d74 <spi_transfer+0x80>
    9d54:	e3a05001 	mov	r5, #1
    9d58:	e3a04901 	mov	r4, #16384	; 0x4000
    9d5c:	e3434f20 	movt	r4, #16160	; 0x3f20
    9d60:	e1a00005 	mov	r0, r5
    9d64:	ebffffaa 	bl	9c14 <wait>
    9d68:	e5943000 	ldr	r3, [r4]
    9d6c:	e3130801 	tst	r3, #65536	; 0x10000
    9d70:	0afffffa 	beq	9d60 <spi_transfer+0x6c>
    9d74:	e3a03901 	mov	r3, #16384	; 0x4000
    9d78:	e3433f20 	movt	r3, #16160	; 0x3f20
    9d7c:	e5930004 	ldr	r0, [r3, #4]
    9d80:	e5932000 	ldr	r2, [r3]
    9d84:	e3c22080 	bic	r2, r2, #128	; 0x80
    9d88:	e5832000 	str	r2, [r3]
    9d8c:	e6ef0070 	uxtb	r0, r0
    9d90:	e8bd8070 	pop	{r4, r5, r6, pc}

00009d94 <syscall_exit>:
    9d94:	e92d4008 	push	{r3, lr}
    9d98:	e1a01000 	mov	r1, r0
    9d9c:	e30b0024 	movw	r0, #45092	; 0xb024
    9da0:	e3400000 	movt	r0, #0
    9da4:	ebfffa29 	bl	8650 <printk>
    9da8:	ebfff8a3 	bl	803c <hang>
    9dac:	e8bd8008 	pop	{r3, pc}

00009db0 <syscall_write>:
    9db0:	e3500001 	cmp	r0, #1
    9db4:	1a00000d 	bne	9df0 <syscall_write+0x40>
    9db8:	e92d4070 	push	{r4, r5, r6, lr}
    9dbc:	e1a04001 	mov	r4, r1
    9dc0:	e1a06002 	mov	r6, r2
    9dc4:	e3520000 	cmp	r2, #0
    9dc8:	da000005 	ble	9de4 <syscall_write+0x34>
    9dcc:	e0815002 	add	r5, r1, r2
    9dd0:	e4d40001 	ldrb	r0, [r4], #1
    9dd4:	ebfffbc4 	bl	8cec <uart_put_byte>
    9dd8:	e1540005 	cmp	r4, r5
    9ddc:	1afffffb 	bne	9dd0 <syscall_write+0x20>
    9de0:	ea000000 	b	9de8 <syscall_write+0x38>
    9de4:	e3a06000 	mov	r6, #0
    9de8:	e1a00006 	mov	r0, r6
    9dec:	e8bd8070 	pop	{r4, r5, r6, pc}
    9df0:	e3e00000 	mvn	r0, #0
    9df4:	e12fff1e 	bx	lr

00009df8 <syscall_read>:
    9df8:	e3500000 	cmp	r0, #0
    9dfc:	1a000022 	bne	9e8c <syscall_read+0x94>
    9e00:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
    9e04:	e1a05001 	mov	r5, r1
    9e08:	e1a06002 	mov	r6, r2
    9e0c:	e3520000 	cmp	r2, #0
    9e10:	da00001a 	ble	9e80 <syscall_read+0x88>
    9e14:	e3a04000 	mov	r4, #0
    9e18:	e30b7034 	movw	r7, #45108	; 0xb034
    9e1c:	e3407000 	movt	r7, #0
    9e20:	ebfffbba 	bl	8d10 <uart_get_byte>
    9e24:	e3500004 	cmp	r0, #4
    9e28:	0a000015 	beq	9e84 <syscall_read+0x8c>
    9e2c:	e3500008 	cmp	r0, #8
    9e30:	1350007f 	cmpne	r0, #127	; 0x7f
    9e34:	1a000004 	bne	9e4c <syscall_read+0x54>
    9e38:	e2444001 	sub	r4, r4, #1
    9e3c:	e2455001 	sub	r5, r5, #1
    9e40:	e1a00007 	mov	r0, r7
    9e44:	ebfffa01 	bl	8650 <printk>
    9e48:	ea000009 	b	9e74 <syscall_read+0x7c>
    9e4c:	e350000a 	cmp	r0, #10
    9e50:	1350000d 	cmpne	r0, #13
    9e54:	1a000003 	bne	9e68 <syscall_read+0x70>
    9e58:	e5c50000 	strb	r0, [r5]
    9e5c:	ebfffba2 	bl	8cec <uart_put_byte>
    9e60:	e2840001 	add	r0, r4, #1
    9e64:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    9e68:	e4c50001 	strb	r0, [r5], #1
    9e6c:	ebfffb9e 	bl	8cec <uart_put_byte>
    9e70:	e2844001 	add	r4, r4, #1
    9e74:	e1560004 	cmp	r6, r4
    9e78:	caffffe8 	bgt	9e20 <syscall_read+0x28>
    9e7c:	ea000000 	b	9e84 <syscall_read+0x8c>
    9e80:	e3a04000 	mov	r4, #0
    9e84:	e1a00004 	mov	r0, r4
    9e88:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    9e8c:	e3e00000 	mvn	r0, #0
    9e90:	e12fff1e 	bx	lr

00009e94 <syscall_sample_adc_start>:
    9e94:	e92d4008 	push	{r3, lr}
    9e98:	e30d300c 	movw	r3, #53260	; 0xd00c
    9e9c:	e3403000 	movt	r3, #0
    9ea0:	e5832000 	str	r2, [r3]
    9ea4:	ebfffa57 	bl	8808 <timer_start>
    9ea8:	e3a00000 	mov	r0, #0
    9eac:	e8bd8008 	pop	{r3, pc}

00009eb0 <syscall_sample_adc_stop>:
    9eb0:	e92d4008 	push	{r3, lr}
    9eb4:	ebfffa63 	bl	8848 <timer_stop>
    9eb8:	e3a00000 	mov	r0, #0
    9ebc:	e8bd8008 	pop	{r3, pc}

00009ec0 <syscall_sbrk>:
    9ec0:	e30d3008 	movw	r3, #53256	; 0xd008
    9ec4:	e3403000 	movt	r3, #0
    9ec8:	e5933000 	ldr	r3, [r3]
    9ecc:	e3530000 	cmp	r3, #0
    9ed0:	030d3008 	movweq	r3, #53256	; 0xd008
    9ed4:	03403000 	movteq	r3, #0
    9ed8:	030f2000 	movweq	r2, #61440	; 0xf000
    9edc:	03402002 	movteq	r2, #2
    9ee0:	05832000 	streq	r2, [r3]
    9ee4:	e30d3008 	movw	r3, #53256	; 0xd008
    9ee8:	e3403000 	movt	r3, #0
    9eec:	e5933000 	ldr	r3, [r3]
    9ef0:	e0830000 	add	r0, r3, r0
    9ef4:	e30f2000 	movw	r2, #61440	; 0xf000
    9ef8:	e3402012 	movt	r2, #18
    9efc:	e1500002 	cmp	r0, r2
    9f00:	930d2008 	movwls	r2, #53256	; 0xd008
    9f04:	93402000 	movtls	r2, #0
    9f08:	95820000 	strls	r0, [r2]
    9f0c:	91a00003 	movls	r0, r3
    9f10:	83e00000 	mvnhi	r0, #0
    9f14:	e12fff1e 	bx	lr

00009f18 <syscall_close>:
    9f18:	e3e00000 	mvn	r0, #0
    9f1c:	e12fff1e 	bx	lr

00009f20 <syscall_fstat>:
    9f20:	e3a00000 	mov	r0, #0
    9f24:	e12fff1e 	bx	lr

00009f28 <syscall_isatty>:
    9f28:	e3a00001 	mov	r0, #1
    9f2c:	e12fff1e 	bx	lr

00009f30 <syscall_lseek>:
    9f30:	e3a00000 	mov	r0, #0
    9f34:	e12fff1e 	bx	lr

00009f38 <delay_cycles>:
    9f38:	e2500001 	subs	r0, r0, #1
    9f3c:	1afffffd 	bne	9f38 <delay_cycles>
    9f40:	e1a0f00e 	mov	pc, lr

00009f44 <read_cpsr>:
    9f44:	e10f0000 	mrs	r0, CPSR
    9f48:	e1a0f00e 	mov	pc, lr

00009f4c <write_cpsr>:
    9f4c:	e129f000 	msr	CPSR_fc, r0
    9f50:	e1a0f00e 	mov	pc, lr

00009f54 <disable_interrupts>:
    9f54:	e10f0000 	mrs	r0, CPSR
    9f58:	e3a01d07 	mov	r1, #448	; 0x1c0
    9f5c:	e1800001 	orr	r0, r0, r1
    9f60:	e129f000 	msr	CPSR_fc, r0
    9f64:	e1a0f00e 	mov	pc, lr

00009f68 <enable_interrupts>:
    9f68:	e10f0000 	mrs	r0, CPSR
    9f6c:	e3a01d07 	mov	r1, #448	; 0x1c0
    9f70:	e1c00001 	bic	r0, r0, r1
    9f74:	e129f000 	msr	CPSR_fc, r0
    9f78:	e1a0f00e 	mov	pc, lr

00009f7c <interrupt_vector_table>:
    9f7c:	e59ff018 	ldr	pc, [pc, #24]	; 9f9c <_reset_asm_handler>
    9f80:	e59ff018 	ldr	pc, [pc, #24]	; 9fa0 <_undefined_instruction_asm_handler>
    9f84:	e59ff018 	ldr	pc, [pc, #24]	; 9fa4 <_swi_asm_handler>
    9f88:	e59ff018 	ldr	pc, [pc, #24]	; 9fa8 <_prefetch_abort_asm_handler>
    9f8c:	e59ff018 	ldr	pc, [pc, #24]	; 9fac <_data_abort_asm_handler>
    9f90:	e59ff004 	ldr	pc, [pc, #4]	; 9f9c <_reset_asm_handler>
    9f94:	e59ff014 	ldr	pc, [pc, #20]	; 9fb0 <_irq_asm_handler>
    9f98:	e59ff014 	ldr	pc, [pc, #20]	; 9fb4 <_fiq_asm_handler>

00009f9c <_reset_asm_handler>:
    9f9c:	0000a160 	andeq	sl, r0, r0, ror #2

00009fa0 <_undefined_instruction_asm_handler>:
    9fa0:	0000a164 	andeq	sl, r0, r4, ror #2

00009fa4 <_swi_asm_handler>:
    9fa4:	00009fd8 	ldrdeq	r9, [r0], -r8

00009fa8 <_prefetch_abort_asm_handler>:
    9fa8:	0000a168 	andeq	sl, r0, r8, ror #2

00009fac <_data_abort_asm_handler>:
    9fac:	0000a16c 	andeq	sl, r0, ip, ror #2

00009fb0 <_irq_asm_handler>:
    9fb0:	0000a06c 	andeq	sl, r0, ip, rrx

00009fb4 <_fiq_asm_handler>:
    9fb4:	0000a170 	andeq	sl, r0, r0, ror r1

00009fb8 <install_interrupt_table>:
    9fb8:	e59f01ec 	ldr	r0, [pc, #492]	; a1ac <start_thread+0x18>
    9fbc:	e3a01000 	mov	r1, #0
    9fc0:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    9fc4:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    9fc8:	e59f01e0 	ldr	r0, [pc, #480]	; a1b0 <start_thread+0x1c>
    9fcc:	e8b001fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8}
    9fd0:	e8a101fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8}
    9fd4:	e12fff1e 	bx	lr

00009fd8 <swi_asm_handler>:
    9fd8:	e92d441f 	push	{r0, r1, r2, r3, r4, sl, lr}
    9fdc:	e1a0a00d 	mov	sl, sp
    9fe0:	ebfffdba 	bl	96d0 <get_svc_sp>
    9fe4:	e28dd01c 	add	sp, sp, #28
    9fe8:	e3500000 	cmp	r0, #0
    9fec:	0a000000 	beq	9ff4 <new_stack>
    9ff0:	e1a0d000 	mov	sp, r0

00009ff4 <new_stack>:
    9ff4:	e59a0000 	ldr	r0, [sl]
    9ff8:	e59a1004 	ldr	r1, [sl, #4]
    9ffc:	e59a2008 	ldr	r2, [sl, #8]
    a000:	e59a300c 	ldr	r3, [sl, #12]
    a004:	e59a4010 	ldr	r4, [sl, #16]
    a008:	e59ae018 	ldr	lr, [sl, #24]
    a00c:	e59aa014 	ldr	sl, [sl, #20]
    a010:	e24dd004 	sub	sp, sp, #4
    a014:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a018:	e14f4000 	mrs	r4, SPSR
    a01c:	e58d4038 	str	r4, [sp, #56]	; 0x38
    a020:	e1a0100d 	mov	r1, sp
    a024:	e51e0004 	ldr	r0, [lr, #-4]
    a028:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    a02c:	e94d2000 	stmdb	sp, {sp}^
    a030:	e24d2004 	sub	r2, sp, #4
    a034:	e5922000 	ldr	r2, [r2]
    a038:	e5922000 	ldr	r2, [r2]
    a03c:	e350000f 	cmp	r0, #15
    a040:	1a000002 	bne	a050 <SWI_C>
    a044:	e10f3000 	mrs	r3, CPSR
    a048:	e3c33080 	bic	r3, r3, #128	; 0x80
    a04c:	e129f003 	msr	CPSR_fc, r3

0000a050 <SWI_C>:
    a050:	ebfff8da 	bl	83c0 <swi_c_handler>
    a054:	e59d4038 	ldr	r4, [sp, #56]	; 0x38
    a058:	e169f004 	msr	SPSR_fc, r4
    a05c:	e28dd004 	add	sp, sp, #4
    a060:	e8bd5ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a064:	e28dd004 	add	sp, sp, #4
    a068:	e1b0f00e 	movs	pc, lr

0000a06c <irq_asm_handler>:
    a06c:	e59fd140 	ldr	sp, [pc, #320]	; a1b4 <start_thread+0x20>
    a070:	e24dd004 	sub	sp, sp, #4
    a074:	e24ee004 	sub	lr, lr, #4
    a078:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a07c:	e14f4000 	mrs	r4, SPSR
    a080:	e58d4038 	str	r4, [sp, #56]	; 0x38
    a084:	ebfffce5 	bl	9420 <check_time>
    a088:	e28d1034 	add	r1, sp, #52	; 0x34
    a08c:	e591e000 	ldr	lr, [r1]
    a090:	e3500001 	cmp	r0, #1
    a094:	1a00002b 	bne	a148 <INC_CLK>
    a098:	e1a0000d 	mov	r0, sp
    a09c:	ebfffdd7 	bl	9800 <save_context_irq>
    a0a0:	e10f1000 	mrs	r1, CPSR
    a0a4:	e381101f 	orr	r1, r1, #31
    a0a8:	e129f001 	msr	CPSR_fc, r1
    a0ac:	e1a0000e 	mov	r0, lr
    a0b0:	e1a0100d 	mov	r1, sp
    a0b4:	ebfffdc4 	bl	97cc <save_context_user>
    a0b8:	e10f1000 	mrs	r1, CPSR
    a0bc:	e3c1101f 	bic	r1, r1, #31
    a0c0:	e3811013 	orr	r1, r1, #19
    a0c4:	e129f001 	msr	CPSR_fc, r1
    a0c8:	e1a0000e 	mov	r0, lr
    a0cc:	e1a0100d 	mov	r1, sp
    a0d0:	e14f2000 	mrs	r2, SPSR
    a0d4:	ebfffdaa 	bl	9784 <save_context_SVC>
    a0d8:	e10f1000 	mrs	r1, CPSR
    a0dc:	e3c1101f 	bic	r1, r1, #31
    a0e0:	e3811012 	orr	r1, r1, #18
    a0e4:	e129f001 	msr	CPSR_fc, r1
    a0e8:	ebfffcbd 	bl	93e4 <context_switch>
    a0ec:	e1a0a000 	mov	sl, r0
    a0f0:	e10f1000 	mrs	r1, CPSR
    a0f4:	e381101f 	orr	r1, r1, #31
    a0f8:	e129f001 	msr	CPSR_fc, r1
    a0fc:	e59ad000 	ldr	sp, [sl]
    a100:	e59ae03c 	ldr	lr, [sl, #60]	; 0x3c
    a104:	e10f1000 	mrs	r1, CPSR
    a108:	e3c1101f 	bic	r1, r1, #31
    a10c:	e3811013 	orr	r1, r1, #19
    a110:	e129f001 	msr	CPSR_fc, r1
    a114:	e59ad040 	ldr	sp, [sl, #64]	; 0x40
    a118:	e59ae044 	ldr	lr, [sl, #68]	; 0x44
    a11c:	e59a204c 	ldr	r2, [sl, #76]	; 0x4c
    a120:	e169f002 	msr	SPSR_fc, r2
    a124:	e10f1000 	mrs	r1, CPSR
    a128:	e3c1101f 	bic	r1, r1, #31
    a12c:	e3811012 	orr	r1, r1, #18
    a130:	e129f001 	msr	CPSR_fc, r1
    a134:	e59ae004 	ldr	lr, [sl, #4]
    a138:	e28a1008 	add	r1, sl, #8
    a13c:	e1a0d001 	mov	sp, r1
    a140:	e59a1048 	ldr	r1, [sl, #72]	; 0x48
    a144:	e169f001 	msr	SPSR_fc, r1

0000a148 <INC_CLK>:
    a148:	e59f1068 	ldr	r1, [pc, #104]	; a1b8 <start_thread+0x24>
    a14c:	e5912000 	ldr	r2, [r1]
    a150:	e2822001 	add	r2, r2, #1
    a154:	e5812000 	str	r2, [r1]
    a158:	e8bd1fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    a15c:	e1b0f00e 	movs	pc, lr

0000a160 <reset_asm_handler>:
    a160:	eafff7a6 	b	8000 <__start>

0000a164 <undefined_instruction_asm_handler>:
    a164:	e1200070 	bkpt	0x0000

0000a168 <prefetch_abort_asm_handler>:
    a168:	e1200070 	bkpt	0x0000

0000a16c <data_abort_asm_handler>:
    a16c:	e1200070 	bkpt	0x0000

0000a170 <fiq_asm_handler>:
    a170:	e1200070 	bkpt	0x0000

0000a174 <enter_user_mode>:
    a174:	e92d5ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    a178:	e10f0000 	mrs	r0, CPSR
    a17c:	e3c0009f 	bic	r0, r0, #159	; 0x9f
    a180:	e3800050 	orr	r0, r0, #80	; 0x50
    a184:	e129f000 	msr	CPSR_fc, r0
    a188:	e59fd02c 	ldr	sp, [pc, #44]	; a1bc <start_thread+0x28>
    a18c:	e59ff02c 	ldr	pc, [pc, #44]	; a1c0 <start_thread+0x2c>
    a190:	eafffff7 	b	a174 <enter_user_mode>

0000a194 <start_thread>:
    a194:	e10f4000 	mrs	r4, CPSR
    a198:	e3c4409f 	bic	r4, r4, #159	; 0x9f
    a19c:	e3844050 	orr	r4, r4, #80	; 0x50
    a1a0:	e129f004 	msr	CPSR_fc, r4
    a1a4:	e1a0d001 	mov	sp, r1
    a1a8:	e1a0f000 	mov	pc, r0
    a1ac:	00009f7c 	andeq	r9, r0, ip, ror pc
    a1b0:	00009f9c 	muleq	r0, ip, pc	; <UNPREDICTABLE>
    a1b4:	00150000 	andseq	r0, r5, r0
    a1b8:	0000d000 	andeq	sp, r0, r0
    a1bc:	0014f000 	andseq	pc, r4, r0
    a1c0:	00300000 	eorseq	r0, r0, r0

0000a1c4 <__aeabi_uidiv>:
    a1c4:	e2512001 	subs	r2, r1, #1
    a1c8:	012fff1e 	bxeq	lr
    a1cc:	3a000036 	bcc	a2ac <__aeabi_uidiv+0xe8>
    a1d0:	e1500001 	cmp	r0, r1
    a1d4:	9a000022 	bls	a264 <__aeabi_uidiv+0xa0>
    a1d8:	e1110002 	tst	r1, r2
    a1dc:	0a000023 	beq	a270 <__aeabi_uidiv+0xac>
    a1e0:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    a1e4:	01a01181 	lsleq	r1, r1, #3
    a1e8:	03a03008 	moveq	r3, #8
    a1ec:	13a03001 	movne	r3, #1
    a1f0:	e3510201 	cmp	r1, #268435456	; 0x10000000
    a1f4:	31510000 	cmpcc	r1, r0
    a1f8:	31a01201 	lslcc	r1, r1, #4
    a1fc:	31a03203 	lslcc	r3, r3, #4
    a200:	3afffffa 	bcc	a1f0 <__aeabi_uidiv+0x2c>
    a204:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    a208:	31510000 	cmpcc	r1, r0
    a20c:	31a01081 	lslcc	r1, r1, #1
    a210:	31a03083 	lslcc	r3, r3, #1
    a214:	3afffffa 	bcc	a204 <__aeabi_uidiv+0x40>
    a218:	e3a02000 	mov	r2, #0
    a21c:	e1500001 	cmp	r0, r1
    a220:	20400001 	subcs	r0, r0, r1
    a224:	21822003 	orrcs	r2, r2, r3
    a228:	e15000a1 	cmp	r0, r1, lsr #1
    a22c:	204000a1 	subcs	r0, r0, r1, lsr #1
    a230:	218220a3 	orrcs	r2, r2, r3, lsr #1
    a234:	e1500121 	cmp	r0, r1, lsr #2
    a238:	20400121 	subcs	r0, r0, r1, lsr #2
    a23c:	21822123 	orrcs	r2, r2, r3, lsr #2
    a240:	e15001a1 	cmp	r0, r1, lsr #3
    a244:	204001a1 	subcs	r0, r0, r1, lsr #3
    a248:	218221a3 	orrcs	r2, r2, r3, lsr #3
    a24c:	e3500000 	cmp	r0, #0
    a250:	11b03223 	lsrsne	r3, r3, #4
    a254:	11a01221 	lsrne	r1, r1, #4
    a258:	1affffef 	bne	a21c <__aeabi_uidiv+0x58>
    a25c:	e1a00002 	mov	r0, r2
    a260:	e12fff1e 	bx	lr
    a264:	03a00001 	moveq	r0, #1
    a268:	13a00000 	movne	r0, #0
    a26c:	e12fff1e 	bx	lr
    a270:	e3510801 	cmp	r1, #65536	; 0x10000
    a274:	21a01821 	lsrcs	r1, r1, #16
    a278:	23a02010 	movcs	r2, #16
    a27c:	33a02000 	movcc	r2, #0
    a280:	e3510c01 	cmp	r1, #256	; 0x100
    a284:	21a01421 	lsrcs	r1, r1, #8
    a288:	22822008 	addcs	r2, r2, #8
    a28c:	e3510010 	cmp	r1, #16
    a290:	21a01221 	lsrcs	r1, r1, #4
    a294:	22822004 	addcs	r2, r2, #4
    a298:	e3510004 	cmp	r1, #4
    a29c:	82822003 	addhi	r2, r2, #3
    a2a0:	908220a1 	addls	r2, r2, r1, lsr #1
    a2a4:	e1a00230 	lsr	r0, r0, r2
    a2a8:	e12fff1e 	bx	lr
    a2ac:	e3500000 	cmp	r0, #0
    a2b0:	13e00000 	mvnne	r0, #0
    a2b4:	ea000059 	b	a420 <__aeabi_idiv0>

0000a2b8 <__aeabi_uidivmod>:
    a2b8:	e3510000 	cmp	r1, #0
    a2bc:	0afffffa 	beq	a2ac <__aeabi_uidiv+0xe8>
    a2c0:	e92d4003 	push	{r0, r1, lr}
    a2c4:	ebffffbe 	bl	a1c4 <__aeabi_uidiv>
    a2c8:	e8bd4006 	pop	{r1, r2, lr}
    a2cc:	e0030092 	mul	r3, r2, r0
    a2d0:	e0411003 	sub	r1, r1, r3
    a2d4:	e12fff1e 	bx	lr

0000a2d8 <__aeabi_idiv>:
    a2d8:	e3510000 	cmp	r1, #0
    a2dc:	0a000043 	beq	a3f0 <.divsi3_skip_div0_test+0x110>

0000a2e0 <.divsi3_skip_div0_test>:
    a2e0:	e020c001 	eor	ip, r0, r1
    a2e4:	42611000 	rsbmi	r1, r1, #0
    a2e8:	e2512001 	subs	r2, r1, #1
    a2ec:	0a000027 	beq	a390 <.divsi3_skip_div0_test+0xb0>
    a2f0:	e1b03000 	movs	r3, r0
    a2f4:	42603000 	rsbmi	r3, r0, #0
    a2f8:	e1530001 	cmp	r3, r1
    a2fc:	9a000026 	bls	a39c <.divsi3_skip_div0_test+0xbc>
    a300:	e1110002 	tst	r1, r2
    a304:	0a000028 	beq	a3ac <.divsi3_skip_div0_test+0xcc>
    a308:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    a30c:	01a01181 	lsleq	r1, r1, #3
    a310:	03a02008 	moveq	r2, #8
    a314:	13a02001 	movne	r2, #1
    a318:	e3510201 	cmp	r1, #268435456	; 0x10000000
    a31c:	31510003 	cmpcc	r1, r3
    a320:	31a01201 	lslcc	r1, r1, #4
    a324:	31a02202 	lslcc	r2, r2, #4
    a328:	3afffffa 	bcc	a318 <.divsi3_skip_div0_test+0x38>
    a32c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    a330:	31510003 	cmpcc	r1, r3
    a334:	31a01081 	lslcc	r1, r1, #1
    a338:	31a02082 	lslcc	r2, r2, #1
    a33c:	3afffffa 	bcc	a32c <.divsi3_skip_div0_test+0x4c>
    a340:	e3a00000 	mov	r0, #0
    a344:	e1530001 	cmp	r3, r1
    a348:	20433001 	subcs	r3, r3, r1
    a34c:	21800002 	orrcs	r0, r0, r2
    a350:	e15300a1 	cmp	r3, r1, lsr #1
    a354:	204330a1 	subcs	r3, r3, r1, lsr #1
    a358:	218000a2 	orrcs	r0, r0, r2, lsr #1
    a35c:	e1530121 	cmp	r3, r1, lsr #2
    a360:	20433121 	subcs	r3, r3, r1, lsr #2
    a364:	21800122 	orrcs	r0, r0, r2, lsr #2
    a368:	e15301a1 	cmp	r3, r1, lsr #3
    a36c:	204331a1 	subcs	r3, r3, r1, lsr #3
    a370:	218001a2 	orrcs	r0, r0, r2, lsr #3
    a374:	e3530000 	cmp	r3, #0
    a378:	11b02222 	lsrsne	r2, r2, #4
    a37c:	11a01221 	lsrne	r1, r1, #4
    a380:	1affffef 	bne	a344 <.divsi3_skip_div0_test+0x64>
    a384:	e35c0000 	cmp	ip, #0
    a388:	42600000 	rsbmi	r0, r0, #0
    a38c:	e12fff1e 	bx	lr
    a390:	e13c0000 	teq	ip, r0
    a394:	42600000 	rsbmi	r0, r0, #0
    a398:	e12fff1e 	bx	lr
    a39c:	33a00000 	movcc	r0, #0
    a3a0:	01a00fcc 	asreq	r0, ip, #31
    a3a4:	03800001 	orreq	r0, r0, #1
    a3a8:	e12fff1e 	bx	lr
    a3ac:	e3510801 	cmp	r1, #65536	; 0x10000
    a3b0:	21a01821 	lsrcs	r1, r1, #16
    a3b4:	23a02010 	movcs	r2, #16
    a3b8:	33a02000 	movcc	r2, #0
    a3bc:	e3510c01 	cmp	r1, #256	; 0x100
    a3c0:	21a01421 	lsrcs	r1, r1, #8
    a3c4:	22822008 	addcs	r2, r2, #8
    a3c8:	e3510010 	cmp	r1, #16
    a3cc:	21a01221 	lsrcs	r1, r1, #4
    a3d0:	22822004 	addcs	r2, r2, #4
    a3d4:	e3510004 	cmp	r1, #4
    a3d8:	82822003 	addhi	r2, r2, #3
    a3dc:	908220a1 	addls	r2, r2, r1, lsr #1
    a3e0:	e35c0000 	cmp	ip, #0
    a3e4:	e1a00233 	lsr	r0, r3, r2
    a3e8:	42600000 	rsbmi	r0, r0, #0
    a3ec:	e12fff1e 	bx	lr
    a3f0:	e3500000 	cmp	r0, #0
    a3f4:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
    a3f8:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
    a3fc:	ea000007 	b	a420 <__aeabi_idiv0>

0000a400 <__aeabi_idivmod>:
    a400:	e3510000 	cmp	r1, #0
    a404:	0afffff9 	beq	a3f0 <.divsi3_skip_div0_test+0x110>
    a408:	e92d4003 	push	{r0, r1, lr}
    a40c:	ebffffb3 	bl	a2e0 <.divsi3_skip_div0_test>
    a410:	e8bd4006 	pop	{r1, r2, lr}
    a414:	e0030092 	mul	r3, r2, r0
    a418:	e0411003 	sub	r1, r1, r3
    a41c:	e12fff1e 	bx	lr

0000a420 <__aeabi_idiv0>:
    a420:	e12fff1e 	bx	lr

0000a424 <__aeabi_frsub>:
    a424:	e2200102 	eor	r0, r0, #-2147483648	; 0x80000000
    a428:	ea000000 	b	a430 <__addsf3>

0000a42c <__aeabi_fsub>:
    a42c:	e2211102 	eor	r1, r1, #-2147483648	; 0x80000000

0000a430 <__addsf3>:
    a430:	e1b02080 	lsls	r2, r0, #1
    a434:	11b03081 	lslsne	r3, r1, #1
    a438:	11320003 	teqne	r2, r3
    a43c:	11f0cc42 	mvnsne	ip, r2, asr #24
    a440:	11f0cc43 	mvnsne	ip, r3, asr #24
    a444:	0a000047 	beq	a568 <__addsf3+0x138>
    a448:	e1a02c22 	lsr	r2, r2, #24
    a44c:	e0723c23 	rsbs	r3, r2, r3, lsr #24
    a450:	c0822003 	addgt	r2, r2, r3
    a454:	c0201001 	eorgt	r1, r0, r1
    a458:	c0210000 	eorgt	r0, r1, r0
    a45c:	c0201001 	eorgt	r1, r0, r1
    a460:	b2633000 	rsblt	r3, r3, #0
    a464:	e3530019 	cmp	r3, #25
    a468:	812fff1e 	bxhi	lr
    a46c:	e3100102 	tst	r0, #-2147483648	; 0x80000000
    a470:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    a474:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    a478:	12600000 	rsbne	r0, r0, #0
    a47c:	e3110102 	tst	r1, #-2147483648	; 0x80000000
    a480:	e3811502 	orr	r1, r1, #8388608	; 0x800000
    a484:	e3c114ff 	bic	r1, r1, #-16777216	; 0xff000000
    a488:	12611000 	rsbne	r1, r1, #0
    a48c:	e1320003 	teq	r2, r3
    a490:	0a00002e 	beq	a550 <__addsf3+0x120>
    a494:	e2422001 	sub	r2, r2, #1
    a498:	e0900351 	adds	r0, r0, r1, asr r3
    a49c:	e2633020 	rsb	r3, r3, #32
    a4a0:	e1a01311 	lsl	r1, r1, r3
    a4a4:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
    a4a8:	5a000001 	bpl	a4b4 <__addsf3+0x84>
    a4ac:	e2711000 	rsbs	r1, r1, #0
    a4b0:	e2e00000 	rsc	r0, r0, #0
    a4b4:	e3500502 	cmp	r0, #8388608	; 0x800000
    a4b8:	3a00000b 	bcc	a4ec <__addsf3+0xbc>
    a4bc:	e3500401 	cmp	r0, #16777216	; 0x1000000
    a4c0:	3a000004 	bcc	a4d8 <__addsf3+0xa8>
    a4c4:	e1b000a0 	lsrs	r0, r0, #1
    a4c8:	e1a01061 	rrx	r1, r1
    a4cc:	e2822001 	add	r2, r2, #1
    a4d0:	e35200fe 	cmp	r2, #254	; 0xfe
    a4d4:	2a000038 	bcs	a5bc <__addsf3+0x18c>
    a4d8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    a4dc:	e0a00b82 	adc	r0, r0, r2, lsl #23
    a4e0:	03c00001 	biceq	r0, r0, #1
    a4e4:	e1800003 	orr	r0, r0, r3
    a4e8:	e12fff1e 	bx	lr
    a4ec:	e1b01081 	lsls	r1, r1, #1
    a4f0:	e0a00000 	adc	r0, r0, r0
    a4f4:	e3100502 	tst	r0, #8388608	; 0x800000
    a4f8:	e2422001 	sub	r2, r2, #1
    a4fc:	1afffff5 	bne	a4d8 <__addsf3+0xa8>
    a500:	e1b0c620 	lsrs	ip, r0, #12
    a504:	01a00600 	lsleq	r0, r0, #12
    a508:	0242200c 	subeq	r2, r2, #12
    a50c:	e31008ff 	tst	r0, #16711680	; 0xff0000
    a510:	01a00400 	lsleq	r0, r0, #8
    a514:	02422008 	subeq	r2, r2, #8
    a518:	e310060f 	tst	r0, #15728640	; 0xf00000
    a51c:	01a00200 	lsleq	r0, r0, #4
    a520:	02422004 	subeq	r2, r2, #4
    a524:	e3100503 	tst	r0, #12582912	; 0xc00000
    a528:	01a00100 	lsleq	r0, r0, #2
    a52c:	02422002 	subeq	r2, r2, #2
    a530:	e3500502 	cmp	r0, #8388608	; 0x800000
    a534:	31a00080 	lslcc	r0, r0, #1
    a538:	e2d22000 	sbcs	r2, r2, #0
    a53c:	a0800b82 	addge	r0, r0, r2, lsl #23
    a540:	b2622000 	rsblt	r2, r2, #0
    a544:	a1800003 	orrge	r0, r0, r3
    a548:	b1830230 	orrlt	r0, r3, r0, lsr r2
    a54c:	e12fff1e 	bx	lr
    a550:	e3320000 	teq	r2, #0
    a554:	e2211502 	eor	r1, r1, #8388608	; 0x800000
    a558:	02200502 	eoreq	r0, r0, #8388608	; 0x800000
    a55c:	02822001 	addeq	r2, r2, #1
    a560:	12433001 	subne	r3, r3, #1
    a564:	eaffffca 	b	a494 <__addsf3+0x64>
    a568:	e1a03081 	lsl	r3, r1, #1
    a56c:	e1f0cc42 	mvns	ip, r2, asr #24
    a570:	11f0cc43 	mvnsne	ip, r3, asr #24
    a574:	0a000013 	beq	a5c8 <__addsf3+0x198>
    a578:	e1320003 	teq	r2, r3
    a57c:	0a000002 	beq	a58c <__addsf3+0x15c>
    a580:	e3320000 	teq	r2, #0
    a584:	01a00001 	moveq	r0, r1
    a588:	e12fff1e 	bx	lr
    a58c:	e1300001 	teq	r0, r1
    a590:	13a00000 	movne	r0, #0
    a594:	112fff1e 	bxne	lr
    a598:	e31204ff 	tst	r2, #-16777216	; 0xff000000
    a59c:	1a000002 	bne	a5ac <__addsf3+0x17c>
    a5a0:	e1b00080 	lsls	r0, r0, #1
    a5a4:	23800102 	orrcs	r0, r0, #-2147483648	; 0x80000000
    a5a8:	e12fff1e 	bx	lr
    a5ac:	e2922402 	adds	r2, r2, #33554432	; 0x2000000
    a5b0:	32800502 	addcc	r0, r0, #8388608	; 0x800000
    a5b4:	312fff1e 	bxcc	lr
    a5b8:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
    a5bc:	e383047f 	orr	r0, r3, #2130706432	; 0x7f000000
    a5c0:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    a5c4:	e12fff1e 	bx	lr
    a5c8:	e1f02c42 	mvns	r2, r2, asr #24
    a5cc:	11a00001 	movne	r0, r1
    a5d0:	01f03c43 	mvnseq	r3, r3, asr #24
    a5d4:	11a01000 	movne	r1, r0
    a5d8:	e1b02480 	lsls	r2, r0, #9
    a5dc:	01b03481 	lslseq	r3, r1, #9
    a5e0:	01300001 	teqeq	r0, r1
    a5e4:	13800501 	orrne	r0, r0, #4194304	; 0x400000
    a5e8:	e12fff1e 	bx	lr

0000a5ec <__aeabi_ui2f>:
    a5ec:	e3a03000 	mov	r3, #0
    a5f0:	ea000001 	b	a5fc <__aeabi_i2f+0x8>

0000a5f4 <__aeabi_i2f>:
    a5f4:	e2103102 	ands	r3, r0, #-2147483648	; 0x80000000
    a5f8:	42600000 	rsbmi	r0, r0, #0
    a5fc:	e1b0c000 	movs	ip, r0
    a600:	012fff1e 	bxeq	lr
    a604:	e383344b 	orr	r3, r3, #1258291200	; 0x4b000000
    a608:	e1a01000 	mov	r1, r0
    a60c:	e3a00000 	mov	r0, #0
    a610:	ea00000f 	b	a654 <__aeabi_l2f+0x30>

0000a614 <__aeabi_ul2f>:
    a614:	e1902001 	orrs	r2, r0, r1
    a618:	012fff1e 	bxeq	lr
    a61c:	e3a03000 	mov	r3, #0
    a620:	ea000005 	b	a63c <__aeabi_l2f+0x18>

0000a624 <__aeabi_l2f>:
    a624:	e1902001 	orrs	r2, r0, r1
    a628:	012fff1e 	bxeq	lr
    a62c:	e2113102 	ands	r3, r1, #-2147483648	; 0x80000000
    a630:	5a000001 	bpl	a63c <__aeabi_l2f+0x18>
    a634:	e2700000 	rsbs	r0, r0, #0
    a638:	e2e11000 	rsc	r1, r1, #0
    a63c:	e1b0c001 	movs	ip, r1
    a640:	01a0c000 	moveq	ip, r0
    a644:	01a01000 	moveq	r1, r0
    a648:	03a00000 	moveq	r0, #0
    a64c:	e383345b 	orr	r3, r3, #1526726656	; 0x5b000000
    a650:	02433201 	subeq	r3, r3, #268435456	; 0x10000000
    a654:	e2433502 	sub	r3, r3, #8388608	; 0x800000
    a658:	e3a02017 	mov	r2, #23
    a65c:	e35c0801 	cmp	ip, #65536	; 0x10000
    a660:	21a0c82c 	lsrcs	ip, ip, #16
    a664:	22422010 	subcs	r2, r2, #16
    a668:	e35c0c01 	cmp	ip, #256	; 0x100
    a66c:	21a0c42c 	lsrcs	ip, ip, #8
    a670:	22422008 	subcs	r2, r2, #8
    a674:	e35c0010 	cmp	ip, #16
    a678:	21a0c22c 	lsrcs	ip, ip, #4
    a67c:	22422004 	subcs	r2, r2, #4
    a680:	e35c0004 	cmp	ip, #4
    a684:	22422002 	subcs	r2, r2, #2
    a688:	304220ac 	subcc	r2, r2, ip, lsr #1
    a68c:	e05221ac 	subs	r2, r2, ip, lsr #3
    a690:	e0433b82 	sub	r3, r3, r2, lsl #23
    a694:	ba000006 	blt	a6b4 <__aeabi_l2f+0x90>
    a698:	e0833211 	add	r3, r3, r1, lsl r2
    a69c:	e1a0c210 	lsl	ip, r0, r2
    a6a0:	e2622020 	rsb	r2, r2, #32
    a6a4:	e35c0102 	cmp	ip, #-2147483648	; 0x80000000
    a6a8:	e0a30230 	adc	r0, r3, r0, lsr r2
    a6ac:	03c00001 	biceq	r0, r0, #1
    a6b0:	e12fff1e 	bx	lr
    a6b4:	e2822020 	add	r2, r2, #32
    a6b8:	e1a0c211 	lsl	ip, r1, r2
    a6bc:	e2622020 	rsb	r2, r2, #32
    a6c0:	e190008c 	orrs	r0, r0, ip, lsl #1
    a6c4:	e0a30231 	adc	r0, r3, r1, lsr r2
    a6c8:	01c00fac 	biceq	r0, r0, ip, lsr #31
    a6cc:	e12fff1e 	bx	lr

0000a6d0 <__aeabi_fmul>:
    a6d0:	e3a0c0ff 	mov	ip, #255	; 0xff
    a6d4:	e01c2ba0 	ands	r2, ip, r0, lsr #23
    a6d8:	101c3ba1 	andsne	r3, ip, r1, lsr #23
    a6dc:	1132000c 	teqne	r2, ip
    a6e0:	1133000c 	teqne	r3, ip
    a6e4:	0a00003e 	beq	a7e4 <__aeabi_fmul+0x114>
    a6e8:	e0822003 	add	r2, r2, r3
    a6ec:	e020c001 	eor	ip, r0, r1
    a6f0:	e1b00480 	lsls	r0, r0, #9
    a6f4:	11b01481 	lslsne	r1, r1, #9
    a6f8:	0a000010 	beq	a740 <__aeabi_fmul+0x70>
    a6fc:	e3a03302 	mov	r3, #134217728	; 0x8000000
    a700:	e18302a0 	orr	r0, r3, r0, lsr #5
    a704:	e18312a1 	orr	r1, r3, r1, lsr #5
    a708:	e0813190 	umull	r3, r1, r0, r1
    a70c:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
    a710:	e3510502 	cmp	r1, #8388608	; 0x800000
    a714:	31a01081 	lslcc	r1, r1, #1
    a718:	31811fa3 	orrcc	r1, r1, r3, lsr #31
    a71c:	31a03083 	lslcc	r3, r3, #1
    a720:	e1800001 	orr	r0, r0, r1
    a724:	e2c2207f 	sbc	r2, r2, #127	; 0x7f
    a728:	e35200fd 	cmp	r2, #253	; 0xfd
    a72c:	8a00000f 	bhi	a770 <__aeabi_fmul+0xa0>
    a730:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
    a734:	e0a00b82 	adc	r0, r0, r2, lsl #23
    a738:	03c00001 	biceq	r0, r0, #1
    a73c:	e12fff1e 	bx	lr
    a740:	e3300000 	teq	r0, #0
    a744:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
    a748:	01a01481 	lsleq	r1, r1, #9
    a74c:	e18c04a0 	orr	r0, ip, r0, lsr #9
    a750:	e18004a1 	orr	r0, r0, r1, lsr #9
    a754:	e252207f 	subs	r2, r2, #127	; 0x7f
    a758:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
    a75c:	c1800b82 	orrgt	r0, r0, r2, lsl #23
    a760:	c12fff1e 	bxgt	lr
    a764:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    a768:	e3a03000 	mov	r3, #0
    a76c:	e2522001 	subs	r2, r2, #1
    a770:	ca000035 	bgt	a84c <__aeabi_fmul+0x17c>
    a774:	e3720019 	cmn	r2, #25
    a778:	d2000102 	andle	r0, r0, #-2147483648	; 0x80000000
    a77c:	d12fff1e 	bxle	lr
    a780:	e2622000 	rsb	r2, r2, #0
    a784:	e1b01080 	lsls	r1, r0, #1
    a788:	e1a01231 	lsr	r1, r1, r2
    a78c:	e2622020 	rsb	r2, r2, #32
    a790:	e1a0c210 	lsl	ip, r0, r2
    a794:	e1b00061 	rrxs	r0, r1
    a798:	e2a00000 	adc	r0, r0, #0
    a79c:	e193308c 	orrs	r3, r3, ip, lsl #1
    a7a0:	01c00fac 	biceq	r0, r0, ip, lsr #31
    a7a4:	e12fff1e 	bx	lr
    a7a8:	e3320000 	teq	r2, #0
    a7ac:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
    a7b0:	01a00080 	lsleq	r0, r0, #1
    a7b4:	03100502 	tsteq	r0, #8388608	; 0x800000
    a7b8:	02422001 	subeq	r2, r2, #1
    a7bc:	0afffffb 	beq	a7b0 <__aeabi_fmul+0xe0>
    a7c0:	e180000c 	orr	r0, r0, ip
    a7c4:	e3330000 	teq	r3, #0
    a7c8:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
    a7cc:	01a01081 	lsleq	r1, r1, #1
    a7d0:	03110502 	tsteq	r1, #8388608	; 0x800000
    a7d4:	02433001 	subeq	r3, r3, #1
    a7d8:	0afffffb 	beq	a7cc <__aeabi_fmul+0xfc>
    a7dc:	e181100c 	orr	r1, r1, ip
    a7e0:	eaffffc0 	b	a6e8 <__aeabi_fmul+0x18>
    a7e4:	e00c3ba1 	and	r3, ip, r1, lsr #23
    a7e8:	e132000c 	teq	r2, ip
    a7ec:	1133000c 	teqne	r3, ip
    a7f0:	0a000005 	beq	a80c <__aeabi_fmul+0x13c>
    a7f4:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
    a7f8:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
    a7fc:	1affffe9 	bne	a7a8 <__aeabi_fmul+0xd8>
    a800:	e0200001 	eor	r0, r0, r1
    a804:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
    a808:	e12fff1e 	bx	lr
    a80c:	e3300000 	teq	r0, #0
    a810:	13300102 	teqne	r0, #-2147483648	; 0x80000000
    a814:	01a00001 	moveq	r0, r1
    a818:	13310000 	teqne	r1, #0
    a81c:	13310102 	teqne	r1, #-2147483648	; 0x80000000
    a820:	0a00000d 	beq	a85c <__aeabi_fmul+0x18c>
    a824:	e132000c 	teq	r2, ip
    a828:	1a000001 	bne	a834 <__aeabi_fmul+0x164>
    a82c:	e1b02480 	lsls	r2, r0, #9
    a830:	1a000009 	bne	a85c <__aeabi_fmul+0x18c>
    a834:	e133000c 	teq	r3, ip
    a838:	1a000002 	bne	a848 <__aeabi_fmul+0x178>
    a83c:	e1b03481 	lsls	r3, r1, #9
    a840:	11a00001 	movne	r0, r1
    a844:	1a000004 	bne	a85c <__aeabi_fmul+0x18c>
    a848:	e0200001 	eor	r0, r0, r1
    a84c:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
    a850:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
    a854:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    a858:	e12fff1e 	bx	lr
    a85c:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
    a860:	e3800503 	orr	r0, r0, #12582912	; 0xc00000
    a864:	e12fff1e 	bx	lr

0000a868 <__aeabi_fdiv>:
    a868:	e3a0c0ff 	mov	ip, #255	; 0xff
    a86c:	e01c2ba0 	ands	r2, ip, r0, lsr #23
    a870:	101c3ba1 	andsne	r3, ip, r1, lsr #23
    a874:	1132000c 	teqne	r2, ip
    a878:	1133000c 	teqne	r3, ip
    a87c:	0a00003a 	beq	a96c <__aeabi_fdiv+0x104>
    a880:	e0422003 	sub	r2, r2, r3
    a884:	e020c001 	eor	ip, r0, r1
    a888:	e1b01481 	lsls	r1, r1, #9
    a88c:	e1a00480 	lsl	r0, r0, #9
    a890:	0a00001c 	beq	a908 <__aeabi_fdiv+0xa0>
    a894:	e3a03201 	mov	r3, #268435456	; 0x10000000
    a898:	e1831221 	orr	r1, r3, r1, lsr #4
    a89c:	e1833220 	orr	r3, r3, r0, lsr #4
    a8a0:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
    a8a4:	e1530001 	cmp	r3, r1
    a8a8:	31a03083 	lslcc	r3, r3, #1
    a8ac:	e2a2207d 	adc	r2, r2, #125	; 0x7d
    a8b0:	e3a0c502 	mov	ip, #8388608	; 0x800000
    a8b4:	e1530001 	cmp	r3, r1
    a8b8:	20433001 	subcs	r3, r3, r1
    a8bc:	2180000c 	orrcs	r0, r0, ip
    a8c0:	e15300a1 	cmp	r3, r1, lsr #1
    a8c4:	204330a1 	subcs	r3, r3, r1, lsr #1
    a8c8:	218000ac 	orrcs	r0, r0, ip, lsr #1
    a8cc:	e1530121 	cmp	r3, r1, lsr #2
    a8d0:	20433121 	subcs	r3, r3, r1, lsr #2
    a8d4:	2180012c 	orrcs	r0, r0, ip, lsr #2
    a8d8:	e15301a1 	cmp	r3, r1, lsr #3
    a8dc:	204331a1 	subcs	r3, r3, r1, lsr #3
    a8e0:	218001ac 	orrcs	r0, r0, ip, lsr #3
    a8e4:	e1b03203 	lsls	r3, r3, #4
    a8e8:	11b0c22c 	lsrsne	ip, ip, #4
    a8ec:	1afffff0 	bne	a8b4 <__aeabi_fdiv+0x4c>
    a8f0:	e35200fd 	cmp	r2, #253	; 0xfd
    a8f4:	8affff9d 	bhi	a770 <__aeabi_fmul+0xa0>
    a8f8:	e1530001 	cmp	r3, r1
    a8fc:	e0a00b82 	adc	r0, r0, r2, lsl #23
    a900:	03c00001 	biceq	r0, r0, #1
    a904:	e12fff1e 	bx	lr
    a908:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
    a90c:	e18c04a0 	orr	r0, ip, r0, lsr #9
    a910:	e292207f 	adds	r2, r2, #127	; 0x7f
    a914:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
    a918:	c1800b82 	orrgt	r0, r0, r2, lsl #23
    a91c:	c12fff1e 	bxgt	lr
    a920:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    a924:	e3a03000 	mov	r3, #0
    a928:	e2522001 	subs	r2, r2, #1
    a92c:	eaffff8f 	b	a770 <__aeabi_fmul+0xa0>
    a930:	e3320000 	teq	r2, #0
    a934:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
    a938:	01a00080 	lsleq	r0, r0, #1
    a93c:	03100502 	tsteq	r0, #8388608	; 0x800000
    a940:	02422001 	subeq	r2, r2, #1
    a944:	0afffffb 	beq	a938 <__aeabi_fdiv+0xd0>
    a948:	e180000c 	orr	r0, r0, ip
    a94c:	e3330000 	teq	r3, #0
    a950:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
    a954:	01a01081 	lsleq	r1, r1, #1
    a958:	03110502 	tsteq	r1, #8388608	; 0x800000
    a95c:	02433001 	subeq	r3, r3, #1
    a960:	0afffffb 	beq	a954 <__aeabi_fdiv+0xec>
    a964:	e181100c 	orr	r1, r1, ip
    a968:	eaffffc4 	b	a880 <__aeabi_fdiv+0x18>
    a96c:	e00c3ba1 	and	r3, ip, r1, lsr #23
    a970:	e132000c 	teq	r2, ip
    a974:	1a000005 	bne	a990 <__aeabi_fdiv+0x128>
    a978:	e1b02480 	lsls	r2, r0, #9
    a97c:	1affffb6 	bne	a85c <__aeabi_fmul+0x18c>
    a980:	e133000c 	teq	r3, ip
    a984:	1affffaf 	bne	a848 <__aeabi_fmul+0x178>
    a988:	e1a00001 	mov	r0, r1
    a98c:	eaffffb2 	b	a85c <__aeabi_fmul+0x18c>
    a990:	e133000c 	teq	r3, ip
    a994:	1a000003 	bne	a9a8 <__aeabi_fdiv+0x140>
    a998:	e1b03481 	lsls	r3, r1, #9
    a99c:	0affff97 	beq	a800 <__aeabi_fmul+0x130>
    a9a0:	e1a00001 	mov	r0, r1
    a9a4:	eaffffac 	b	a85c <__aeabi_fmul+0x18c>
    a9a8:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
    a9ac:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
    a9b0:	1affffde 	bne	a930 <__aeabi_fdiv+0xc8>
    a9b4:	e3d02102 	bics	r2, r0, #-2147483648	; 0x80000000
    a9b8:	1affffa2 	bne	a848 <__aeabi_fmul+0x178>
    a9bc:	e3d13102 	bics	r3, r1, #-2147483648	; 0x80000000
    a9c0:	1affff8e 	bne	a800 <__aeabi_fmul+0x130>
    a9c4:	eaffffa4 	b	a85c <__aeabi_fmul+0x18c>

0000a9c8 <__gesf2>:
    a9c8:	e3e0c000 	mvn	ip, #0
    a9cc:	ea000002 	b	a9dc <__cmpsf2+0x4>

0000a9d0 <__lesf2>:
    a9d0:	e3a0c001 	mov	ip, #1
    a9d4:	ea000000 	b	a9dc <__cmpsf2+0x4>

0000a9d8 <__cmpsf2>:
    a9d8:	e3a0c001 	mov	ip, #1
    a9dc:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
    a9e0:	e1a02080 	lsl	r2, r0, #1
    a9e4:	e1a03081 	lsl	r3, r1, #1
    a9e8:	e1f0cc42 	mvns	ip, r2, asr #24
    a9ec:	11f0cc43 	mvnsne	ip, r3, asr #24
    a9f0:	0a000007 	beq	aa14 <__cmpsf2+0x3c>
    a9f4:	e28dd004 	add	sp, sp, #4
    a9f8:	e192c0a3 	orrs	ip, r2, r3, lsr #1
    a9fc:	11300001 	teqne	r0, r1
    aa00:	50520003 	subspl	r0, r2, r3
    aa04:	81a00fc1 	asrhi	r0, r1, #31
    aa08:	31e00fc1 	mvncc	r0, r1, asr #31
    aa0c:	13800001 	orrne	r0, r0, #1
    aa10:	e12fff1e 	bx	lr
    aa14:	e1f0cc42 	mvns	ip, r2, asr #24
    aa18:	1a000001 	bne	aa24 <__cmpsf2+0x4c>
    aa1c:	e1b0c480 	lsls	ip, r0, #9
    aa20:	1a000003 	bne	aa34 <__cmpsf2+0x5c>
    aa24:	e1f0cc43 	mvns	ip, r3, asr #24
    aa28:	1afffff1 	bne	a9f4 <__cmpsf2+0x1c>
    aa2c:	e1b0c481 	lsls	ip, r1, #9
    aa30:	0affffef 	beq	a9f4 <__cmpsf2+0x1c>
    aa34:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    aa38:	e12fff1e 	bx	lr

0000aa3c <__aeabi_cfrcmple>:
    aa3c:	e1a0c000 	mov	ip, r0
    aa40:	e1a00001 	mov	r0, r1
    aa44:	e1a0100c 	mov	r1, ip
    aa48:	eaffffff 	b	aa4c <__aeabi_cfcmpeq>

0000aa4c <__aeabi_cfcmpeq>:
    aa4c:	e92d400f 	push	{r0, r1, r2, r3, lr}
    aa50:	ebffffe0 	bl	a9d8 <__cmpsf2>
    aa54:	e3500000 	cmp	r0, #0
    aa58:	43700000 	cmnmi	r0, #0
    aa5c:	e8bd400f 	pop	{r0, r1, r2, r3, lr}
    aa60:	e12fff1e 	bx	lr

0000aa64 <__aeabi_fcmpeq>:
    aa64:	e52de008 	str	lr, [sp, #-8]!
    aa68:	ebfffff7 	bl	aa4c <__aeabi_cfcmpeq>
    aa6c:	03a00001 	moveq	r0, #1
    aa70:	13a00000 	movne	r0, #0
    aa74:	e49de008 	ldr	lr, [sp], #8
    aa78:	e12fff1e 	bx	lr

0000aa7c <__aeabi_fcmplt>:
    aa7c:	e52de008 	str	lr, [sp, #-8]!
    aa80:	ebfffff1 	bl	aa4c <__aeabi_cfcmpeq>
    aa84:	33a00001 	movcc	r0, #1
    aa88:	23a00000 	movcs	r0, #0
    aa8c:	e49de008 	ldr	lr, [sp], #8
    aa90:	e12fff1e 	bx	lr

0000aa94 <__aeabi_fcmple>:
    aa94:	e52de008 	str	lr, [sp, #-8]!
    aa98:	ebffffeb 	bl	aa4c <__aeabi_cfcmpeq>
    aa9c:	93a00001 	movls	r0, #1
    aaa0:	83a00000 	movhi	r0, #0
    aaa4:	e49de008 	ldr	lr, [sp], #8
    aaa8:	e12fff1e 	bx	lr

0000aaac <__aeabi_fcmpge>:
    aaac:	e52de008 	str	lr, [sp, #-8]!
    aab0:	ebffffe1 	bl	aa3c <__aeabi_cfrcmple>
    aab4:	93a00001 	movls	r0, #1
    aab8:	83a00000 	movhi	r0, #0
    aabc:	e49de008 	ldr	lr, [sp], #8
    aac0:	e12fff1e 	bx	lr

0000aac4 <__aeabi_fcmpgt>:
    aac4:	e52de008 	str	lr, [sp, #-8]!
    aac8:	ebffffdb 	bl	aa3c <__aeabi_cfrcmple>
    aacc:	33a00001 	movcc	r0, #1
    aad0:	23a00000 	movcs	r0, #0
    aad4:	e49de008 	ldr	lr, [sp], #8
    aad8:	e12fff1e 	bx	lr

0000aadc <__aeabi_uldivmod>:
    aadc:	e3530000 	cmp	r3, #0
    aae0:	03520000 	cmpeq	r2, #0
    aae4:	1a000004 	bne	aafc <__aeabi_uldivmod+0x20>
    aae8:	e3510000 	cmp	r1, #0
    aaec:	03500000 	cmpeq	r0, #0
    aaf0:	13e01000 	mvnne	r1, #0
    aaf4:	13e00000 	mvnne	r0, #0
    aaf8:	eafffe48 	b	a420 <__aeabi_idiv0>
    aafc:	e24dd008 	sub	sp, sp, #8
    ab00:	e92d6000 	push	{sp, lr}
    ab04:	eb000014 	bl	ab5c <__gnu_uldivmod_helper>
    ab08:	e59de004 	ldr	lr, [sp, #4]
    ab0c:	e28dd008 	add	sp, sp, #8
    ab10:	e8bd000c 	pop	{r2, r3}
    ab14:	e12fff1e 	bx	lr

0000ab18 <__gnu_ldivmod_helper>:
    ab18:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    ab1c:	e59d6020 	ldr	r6, [sp, #32]
    ab20:	e1a07002 	mov	r7, r2
    ab24:	e1a0a003 	mov	sl, r3
    ab28:	e1a04000 	mov	r4, r0
    ab2c:	e1a05001 	mov	r5, r1
    ab30:	eb000019 	bl	ab9c <__divdi3>
    ab34:	e1a03000 	mov	r3, r0
    ab38:	e0020197 	mul	r2, r7, r1
    ab3c:	e0898097 	umull	r8, r9, r7, r0
    ab40:	e023239a 	mla	r3, sl, r3, r2
    ab44:	e0544008 	subs	r4, r4, r8
    ab48:	e0839009 	add	r9, r3, r9
    ab4c:	e0c55009 	sbc	r5, r5, r9
    ab50:	e8860030 	stm	r6, {r4, r5}
    ab54:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    ab58:	e12fff1e 	bx	lr

0000ab5c <__gnu_uldivmod_helper>:
    ab5c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    ab60:	e59d5018 	ldr	r5, [sp, #24]
    ab64:	e1a04002 	mov	r4, r2
    ab68:	e1a08003 	mov	r8, r3
    ab6c:	e1a06000 	mov	r6, r0
    ab70:	e1a07001 	mov	r7, r1
    ab74:	eb000066 	bl	ad14 <__udivdi3>
    ab78:	e0080890 	mul	r8, r0, r8
    ab7c:	e0832490 	umull	r2, r3, r0, r4
    ab80:	e0248491 	mla	r4, r1, r4, r8
    ab84:	e0566002 	subs	r6, r6, r2
    ab88:	e0843003 	add	r3, r4, r3
    ab8c:	e0c77003 	sbc	r7, r7, r3
    ab90:	e88500c0 	stm	r5, {r6, r7}
    ab94:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    ab98:	e12fff1e 	bx	lr

0000ab9c <__divdi3>:
    ab9c:	e3510000 	cmp	r1, #0
    aba0:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    aba4:	a1a04000 	movge	r4, r0
    aba8:	a1a05001 	movge	r5, r1
    abac:	a3a0a000 	movge	sl, #0
    abb0:	ba000053 	blt	ad04 <__divdi3+0x168>
    abb4:	e3530000 	cmp	r3, #0
    abb8:	a1a08002 	movge	r8, r2
    abbc:	a1a09003 	movge	r9, r3
    abc0:	ba00004b 	blt	acf4 <__divdi3+0x158>
    abc4:	e1550009 	cmp	r5, r9
    abc8:	01540008 	cmpeq	r4, r8
    abcc:	33a02000 	movcc	r2, #0
    abd0:	33a03000 	movcc	r3, #0
    abd4:	3a00003b 	bcc	acc8 <__divdi3+0x12c>
    abd8:	e1a01009 	mov	r1, r9
    abdc:	e1a00008 	mov	r0, r8
    abe0:	eb000093 	bl	ae34 <__clzdi2>
    abe4:	e1a01005 	mov	r1, r5
    abe8:	e1a0b000 	mov	fp, r0
    abec:	e1a00004 	mov	r0, r4
    abf0:	eb00008f 	bl	ae34 <__clzdi2>
    abf4:	e060000b 	rsb	r0, r0, fp
    abf8:	e240e020 	sub	lr, r0, #32
    abfc:	e1a07019 	lsl	r7, r9, r0
    ac00:	e1877e18 	orr	r7, r7, r8, lsl lr
    ac04:	e260c020 	rsb	ip, r0, #32
    ac08:	e1877c38 	orr	r7, r7, r8, lsr ip
    ac0c:	e1550007 	cmp	r5, r7
    ac10:	e1a06018 	lsl	r6, r8, r0
    ac14:	01540006 	cmpeq	r4, r6
    ac18:	e1a01000 	mov	r1, r0
    ac1c:	33a02000 	movcc	r2, #0
    ac20:	33a03000 	movcc	r3, #0
    ac24:	3a000005 	bcc	ac40 <__divdi3+0xa4>
    ac28:	e3a08001 	mov	r8, #1
    ac2c:	e0544006 	subs	r4, r4, r6
    ac30:	e1a03e18 	lsl	r3, r8, lr
    ac34:	e1833c38 	orr	r3, r3, r8, lsr ip
    ac38:	e0c55007 	sbc	r5, r5, r7
    ac3c:	e1a02018 	lsl	r2, r8, r0
    ac40:	e3500000 	cmp	r0, #0
    ac44:	0a00001f 	beq	acc8 <__divdi3+0x12c>
    ac48:	e1b070a7 	lsrs	r7, r7, #1
    ac4c:	e1a06066 	rrx	r6, r6
    ac50:	ea000007 	b	ac74 <__divdi3+0xd8>
    ac54:	e0544006 	subs	r4, r4, r6
    ac58:	e0c55007 	sbc	r5, r5, r7
    ac5c:	e0944004 	adds	r4, r4, r4
    ac60:	e0a55005 	adc	r5, r5, r5
    ac64:	e2944001 	adds	r4, r4, #1
    ac68:	e2a55000 	adc	r5, r5, #0
    ac6c:	e2500001 	subs	r0, r0, #1
    ac70:	0a000006 	beq	ac90 <__divdi3+0xf4>
    ac74:	e1570005 	cmp	r7, r5
    ac78:	01560004 	cmpeq	r6, r4
    ac7c:	9afffff4 	bls	ac54 <__divdi3+0xb8>
    ac80:	e0944004 	adds	r4, r4, r4
    ac84:	e0a55005 	adc	r5, r5, r5
    ac88:	e2500001 	subs	r0, r0, #1
    ac8c:	1afffff8 	bne	ac74 <__divdi3+0xd8>
    ac90:	e261c020 	rsb	ip, r1, #32
    ac94:	e1a00134 	lsr	r0, r4, r1
    ac98:	e0922004 	adds	r2, r2, r4
    ac9c:	e241e020 	sub	lr, r1, #32
    aca0:	e1800c15 	orr	r0, r0, r5, lsl ip
    aca4:	e1a04135 	lsr	r4, r5, r1
    aca8:	e1800e35 	orr	r0, r0, r5, lsr lr
    acac:	e1a07114 	lsl	r7, r4, r1
    acb0:	e1877e10 	orr	r7, r7, r0, lsl lr
    acb4:	e1a06110 	lsl	r6, r0, r1
    acb8:	e0a33005 	adc	r3, r3, r5
    acbc:	e1877c30 	orr	r7, r7, r0, lsr ip
    acc0:	e0522006 	subs	r2, r2, r6
    acc4:	e0c33007 	sbc	r3, r3, r7
    acc8:	e29a0000 	adds	r0, sl, #0
    accc:	13a00001 	movne	r0, #1
    acd0:	e3a01000 	mov	r1, #0
    acd4:	e2704000 	rsbs	r4, r0, #0
    acd8:	e2e15000 	rsc	r5, r1, #0
    acdc:	e0222004 	eor	r2, r2, r4
    ace0:	e0233005 	eor	r3, r3, r5
    ace4:	e0900002 	adds	r0, r0, r2
    ace8:	e0a11003 	adc	r1, r1, r3
    acec:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    acf0:	e12fff1e 	bx	lr
    acf4:	e2728000 	rsbs	r8, r2, #0
    acf8:	e1e0a00a 	mvn	sl, sl
    acfc:	e2e39000 	rsc	r9, r3, #0
    ad00:	eaffffaf 	b	abc4 <__divdi3+0x28>
    ad04:	e2704000 	rsbs	r4, r0, #0
    ad08:	e2e15000 	rsc	r5, r1, #0
    ad0c:	e3e0a000 	mvn	sl, #0
    ad10:	eaffffa7 	b	abb4 <__divdi3+0x18>

0000ad14 <__udivdi3>:
    ad14:	e1510003 	cmp	r1, r3
    ad18:	01500002 	cmpeq	r0, r2
    ad1c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    ad20:	e1a04000 	mov	r4, r0
    ad24:	e1a05001 	mov	r5, r1
    ad28:	e1a08002 	mov	r8, r2
    ad2c:	e1a09003 	mov	r9, r3
    ad30:	33a00000 	movcc	r0, #0
    ad34:	33a01000 	movcc	r1, #0
    ad38:	3a00003b 	bcc	ae2c <__udivdi3+0x118>
    ad3c:	e1a01003 	mov	r1, r3
    ad40:	e1a00002 	mov	r0, r2
    ad44:	eb00003a 	bl	ae34 <__clzdi2>
    ad48:	e1a01005 	mov	r1, r5
    ad4c:	e1a0a000 	mov	sl, r0
    ad50:	e1a00004 	mov	r0, r4
    ad54:	eb000036 	bl	ae34 <__clzdi2>
    ad58:	e060300a 	rsb	r3, r0, sl
    ad5c:	e243e020 	sub	lr, r3, #32
    ad60:	e1a07319 	lsl	r7, r9, r3
    ad64:	e1877e18 	orr	r7, r7, r8, lsl lr
    ad68:	e263c020 	rsb	ip, r3, #32
    ad6c:	e1877c38 	orr	r7, r7, r8, lsr ip
    ad70:	e1550007 	cmp	r5, r7
    ad74:	e1a06318 	lsl	r6, r8, r3
    ad78:	01540006 	cmpeq	r4, r6
    ad7c:	e1a02003 	mov	r2, r3
    ad80:	33a00000 	movcc	r0, #0
    ad84:	33a01000 	movcc	r1, #0
    ad88:	3a000005 	bcc	ada4 <__udivdi3+0x90>
    ad8c:	e3a08001 	mov	r8, #1
    ad90:	e0544006 	subs	r4, r4, r6
    ad94:	e1a01e18 	lsl	r1, r8, lr
    ad98:	e1811c38 	orr	r1, r1, r8, lsr ip
    ad9c:	e0c55007 	sbc	r5, r5, r7
    ada0:	e1a00318 	lsl	r0, r8, r3
    ada4:	e3530000 	cmp	r3, #0
    ada8:	0a00001f 	beq	ae2c <__udivdi3+0x118>
    adac:	e1b070a7 	lsrs	r7, r7, #1
    adb0:	e1a06066 	rrx	r6, r6
    adb4:	ea000007 	b	add8 <__udivdi3+0xc4>
    adb8:	e0544006 	subs	r4, r4, r6
    adbc:	e0c55007 	sbc	r5, r5, r7
    adc0:	e0944004 	adds	r4, r4, r4
    adc4:	e0a55005 	adc	r5, r5, r5
    adc8:	e2944001 	adds	r4, r4, #1
    adcc:	e2a55000 	adc	r5, r5, #0
    add0:	e2533001 	subs	r3, r3, #1
    add4:	0a000006 	beq	adf4 <__udivdi3+0xe0>
    add8:	e1570005 	cmp	r7, r5
    addc:	01560004 	cmpeq	r6, r4
    ade0:	9afffff4 	bls	adb8 <__udivdi3+0xa4>
    ade4:	e0944004 	adds	r4, r4, r4
    ade8:	e0a55005 	adc	r5, r5, r5
    adec:	e2533001 	subs	r3, r3, #1
    adf0:	1afffff8 	bne	add8 <__udivdi3+0xc4>
    adf4:	e0948000 	adds	r8, r4, r0
    adf8:	e0a59001 	adc	r9, r5, r1
    adfc:	e1a03234 	lsr	r3, r4, r2
    ae00:	e2621020 	rsb	r1, r2, #32
    ae04:	e2420020 	sub	r0, r2, #32
    ae08:	e1833115 	orr	r3, r3, r5, lsl r1
    ae0c:	e1a0c235 	lsr	ip, r5, r2
    ae10:	e1833035 	orr	r3, r3, r5, lsr r0
    ae14:	e1a0721c 	lsl	r7, ip, r2
    ae18:	e1877013 	orr	r7, r7, r3, lsl r0
    ae1c:	e1a06213 	lsl	r6, r3, r2
    ae20:	e1877133 	orr	r7, r7, r3, lsr r1
    ae24:	e0580006 	subs	r0, r8, r6
    ae28:	e0c91007 	sbc	r1, r9, r7
    ae2c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    ae30:	e12fff1e 	bx	lr

0000ae34 <__clzdi2>:
    ae34:	e92d4010 	push	{r4, lr}
    ae38:	e3510000 	cmp	r1, #0
    ae3c:	1a000002 	bne	ae4c <__clzdi2+0x18>
    ae40:	eb000005 	bl	ae5c <__clzsi2>
    ae44:	e2800020 	add	r0, r0, #32
    ae48:	ea000001 	b	ae54 <__clzdi2+0x20>
    ae4c:	e1a00001 	mov	r0, r1
    ae50:	eb000001 	bl	ae5c <__clzsi2>
    ae54:	e8bd4010 	pop	{r4, lr}
    ae58:	e12fff1e 	bx	lr

0000ae5c <__clzsi2>:
    ae5c:	e3a0101c 	mov	r1, #28
    ae60:	e3500801 	cmp	r0, #65536	; 0x10000
    ae64:	21a00820 	lsrcs	r0, r0, #16
    ae68:	22411010 	subcs	r1, r1, #16
    ae6c:	e3500c01 	cmp	r0, #256	; 0x100
    ae70:	21a00420 	lsrcs	r0, r0, #8
    ae74:	22411008 	subcs	r1, r1, #8
    ae78:	e3500010 	cmp	r0, #16
    ae7c:	21a00220 	lsrcs	r0, r0, #4
    ae80:	22411004 	subcs	r1, r1, #4
    ae84:	e28f2008 	add	r2, pc, #8
    ae88:	e7d20000 	ldrb	r0, [r2, r0]
    ae8c:	e0800001 	add	r0, r0, r1
    ae90:	e12fff1e 	bx	lr
    ae94:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    ae98:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

0000b000 <__rodata_start>:
    b000:	33323130 	teqcc	r2, #48, 2
    b004:	37363534 			; <UNDEFINED> instruction: 0x37363534
    b008:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    b00c:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .rodata.str1.4:

0000b014 <.rodata.str1.4>:
    b014:	5249200a 	subpl	r2, r9, #10
    b018:	00000051 	andeq	r0, r0, r1, asr r0
    b01c:	00000030 	andeq	r0, r0, r0, lsr r0
    b020:	00007830 	andeq	r7, r0, r0, lsr r8
    b024:	74697865 	strbtvc	r7, [r9], #-2149	; 0x865
    b028:	61747320 	cmnvs	r4, r0, lsr #6
    b02c:	3a737574 	bcc	1ce8604 <__user_program+0x19e8604>
    b030:	00642520 	rsbeq	r2, r4, r0, lsr #10
    b034:	00082008 	andeq	r2, r8, r8

Disassembly of section .ARM.exidx:

0000b038 <.ARM.exidx>:
    b038:	7ffffb64 	svcvc	0x00fffb64
    b03c:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000c000 <__data_start>:
    c000:	3f200000 	svccc	0x00200000

0000c004 <cnt>:
    c004:	00000001 	andeq	r0, r0, r1

0000c008 <present_thread>:
    c008:	0000001f 	andeq	r0, r0, pc, lsl r0

Disassembly of section .bss:

0000d000 <CLOCK_TICKS>:
    d000:	00000000 	andeq	r0, r0, r0

0000d004 <cnt.3726>:
    d004:	00000000 	andeq	r0, r0, r0

0000d008 <heap_end>:
    d008:	00000000 	andeq	r0, r0, r0

0000d00c <gl>:
    d00c:	00000000 	andeq	r0, r0, r0

0000d010 <_oled_frame_buffer>:
	...

0000d210 <CHANNEL>:
    d210:	00000000 	andeq	r0, r0, r0

0000d214 <thread1_svc_stack>:
	...

0000e214 <thread24_svc_stack>:
	...

0000f214 <thread15_svc_stack>:
	...

00010214 <thread21_svc_stack>:
	...

00011214 <thread17_svc_stack>:
	...

00012214 <thread20_svc_stack>:
	...

00013214 <thread25_svc_stack>:
	...

00014214 <thread_count>:
   14214:	00000000 	andeq	r0, r0, r0

00014218 <thread30_svc_stack>:
	...

00015218 <threads>:
	...

00016018 <thread4_svc_stack>:
	...

00017018 <thread12_svc_stack>:
	...

00018018 <thread10_svc_stack>:
	...

00019018 <thread14_svc_stack>:
	...

0001a018 <thread5_svc_stack>:
	...

0001b018 <waiting_list>:
   1b018:	00000000 	andeq	r0, r0, r0

0001b01c <UB_Bounds>:
	...

0001b09c <thread9_svc_stack>:
	...

0001c09c <thread16_svc_stack>:
	...

0001d09c <thread8_svc_stack>:
	...

0001e09c <idle_function>:
   1e09c:	00000000 	andeq	r0, r0, r0

0001e0a0 <thread28_svc_stack>:
	...

0001f0a0 <thread26_svc_stack>:
	...

000200a0 <thread13_svc_stack>:
	...

000210a0 <thread22_svc_stack>:
	...

000220a0 <thread11_svc_stack>:
	...

000230a0 <runnable>:
   230a0:	00000000 	andeq	r0, r0, r0

000230a4 <idle_svc_stack>:
	...

000240a4 <thread0_svc_stack>:
	...

000250a4 <thread6_svc_stack>:
	...

000260a4 <thread7_svc_stack>:
	...

000270a4 <thread18_svc_stack>:
	...

000280a4 <thread27_svc_stack>:
	...

000290a4 <thread23_svc_stack>:
	...

0002a0a4 <thread2_svc_stack>:
	...

0002b0a4 <thread19_svc_stack>:
	...

0002c0a4 <thread3_svc_stack>:
	...

0002d0a4 <thread29_svc_stack>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	00000162 	andeq	r0, r0, r2, ror #2
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	000000a3 	andeq	r0, r0, r3, lsr #1
      10:	00014201 	andeq	r4, r1, r1, lsl #4
      14:	00001c00 	andeq	r1, r0, r0, lsl #24
      18:	00805400 	addeq	r5, r0, r0, lsl #8
      1c:	00032000 	andeq	r2, r3, r0
      20:	00000000 	andeq	r0, r0, r0
      24:	08010200 	stmdaeq	r1, {r9}
      28:	00000082 	andeq	r0, r0, r2, lsl #1
      2c:	38050202 	stmdacc	r5, {r1, r9}
      30:	03000001 	movweq	r0, #1
      34:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
      38:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
      3c:	00000005 	andeq	r0, r0, r5
      40:	00710400 	rsbseq	r0, r1, r0, lsl #8
      44:	16020000 	strne	r0, [r2], -r0
      48:	0000004c 	andeq	r0, r0, ip, asr #32
      4c:	79080102 	stmdbvc	r8, {r1, r8}
      50:	02000000 	andeq	r0, r0, #0
      54:	00900702 	addseq	r0, r0, r2, lsl #14
      58:	87040000 	strhi	r0, [r4, -r0]
      5c:	02000000 	andeq	r0, r0, #0
      60:	0000651a 	andeq	r6, r0, sl, lsl r5
      64:	07040200 	streq	r0, [r4, -r0, lsl #4]
      68:	00000054 	andeq	r0, r0, r4, asr r0
      6c:	4a070802 	bmi	1c207c <__end+0x7207c>
      70:	05000000 	streq	r0, [r0, #-0]
      74:	0000012c 	andeq	r0, r0, ip, lsr #2
      78:	80545401 	subshi	r5, r4, r1, lsl #8
      7c:	01200000 	teqeq	r0, r0
      80:	9c010000 	stcls	0, cr0, [r1], {-0}
      84:	000000cf 	andeq	r0, r0, pc, asr #1
      88:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
      8c:	41540100 	cmpmi	r4, r0, lsl #2
      90:	02000000 	andeq	r0, r0, #0
      94:	66066791 			; <UNDEFINED> instruction: 0x66066791
      98:	01006e75 	tsteq	r0, r5, ror lr
      9c:	00004154 	andeq	r4, r0, r4, asr r1
      a0:	66910200 	ldrvs	r0, [r1], r0, lsl #4
      a4:	67657207 	strbvs	r7, [r5, -r7, lsl #4]!
      a8:	5a590100 	bpl	16404b0 <__user_program+0x13404b0>
      ac:	02000000 	andeq	r0, r0, #0
      b0:	31087491 			; <UNDEFINED> instruction: 0x31087491
      b4:	01000001 	tsteq	r0, r1
      b8:	00005a5b 	andeq	r5, r0, fp, asr sl
      bc:	70910200 	addsvc	r0, r1, r0, lsl #4
      c0:	00006a08 	andeq	r6, r0, r8, lsl #20
      c4:	5a5d0100 	bpl	17404cc <__user_program+0x14404cc>
      c8:	02000000 	andeq	r0, r0, #0
      cc:	05006c91 	streq	r6, [r0, #-3217]	; 0xc91
      d0:	00000041 	andeq	r0, r0, r1, asr #32
      d4:	81746401 	cmnhi	r4, r1, lsl #8
      d8:	00840000 	addeq	r0, r4, r0
      dc:	9c010000 	stcls	0, cr0, [r1], {-0}
      e0:	000000f3 	strdeq	r0, [r0], -r3
      e4:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
      e8:	41640100 	cmnmi	r4, r0, lsl #2
      ec:	02000000 	andeq	r0, r0, #0
      f0:	05007791 	streq	r7, [r0, #-1937]	; 0x791
      f4:	00000061 	andeq	r0, r0, r1, rrx
      f8:	81f87001 	mvnshi	r7, r1
      fc:	00840000 	addeq	r0, r4, r0
     100:	9c010000 	stcls	0, cr0, [r1], {-0}
     104:	00000117 	andeq	r0, r0, r7, lsl r1
     108:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     10c:	41700100 	cmnmi	r0, r0, lsl #2
     110:	02000000 	andeq	r0, r0, #0
     114:	09007791 	stmdbeq	r0, {r0, r4, r7, r8, r9, sl, ip, sp, lr}
     118:	0000000e 	andeq	r0, r0, lr
     11c:	827c7c01 	rsbshi	r7, ip, #256	; 0x100
     120:	00f80000 	rscseq	r0, r8, r0
     124:	9c010000 	stcls	0, cr0, [r1], {-0}
     128:	00000149 	andeq	r0, r0, r9, asr #2
     12c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     130:	417c0100 	cmnmi	ip, r0, lsl #2
     134:	02000000 	andeq	r0, r0, #0
     138:	260a7791 			; <UNDEFINED> instruction: 0x260a7791
     13c:	01000001 	tsteq	r0, r1
     140:	0000417c 	andeq	r4, r0, ip, ror r1
     144:	76910200 	ldrvc	r0, [r1], r0, lsl #4
     148:	003c0800 	eorseq	r0, ip, r0, lsl #16
     14c:	51010000 	mrspl	r0, (UNDEF: 1)
     150:	0000015a 	andeq	r0, r0, sl, asr r1
     154:	c0000305 	andgt	r0, r0, r5, lsl #6
     158:	040b0000 	streq	r0, [fp], #-0
     15c:	00000160 	andeq	r0, r0, r0, ror #2
     160:	00005a0c 	andeq	r5, r0, ip, lsl #20
     164:	04f40000 	ldrbteq	r0, [r4], #0
     168:	00040000 	andeq	r0, r4, r0
     16c:	000000b7 	strheq	r0, [r0], -r7
     170:	03b10104 			; <UNDEFINED> instruction: 0x03b10104
     174:	b4010000 	strlt	r0, [r1], #-0
     178:	58000002 	stmdapl	r0, {r1}
     17c:	74000003 	strvc	r0, [r0], #-3
     180:	fc000083 	stc2	0, cr0, [r0], {131}	; 0x83
     184:	96000001 	strls	r0, [r0], -r1
     188:	02000000 	andeq	r0, r0, #0
     18c:	00820801 	addeq	r0, r2, r1, lsl #16
     190:	02020000 	andeq	r0, r2, #0
     194:	00013805 	andeq	r3, r1, r5, lsl #16
     198:	05040300 	streq	r0, [r4, #-768]	; 0x300
     19c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     1a0:	00050802 	andeq	r0, r5, r2, lsl #16
     1a4:	04000000 	streq	r0, [r0], #-0
     1a8:	00000071 	andeq	r0, r0, r1, ror r0
     1ac:	004c1602 	subeq	r1, ip, r2, lsl #12
     1b0:	01020000 	mrseq	r0, (UNDEF: 2)
     1b4:	00007908 	andeq	r7, r0, r8, lsl #18
     1b8:	038a0400 	orreq	r0, sl, #0, 8
     1bc:	18020000 	stmdane	r2, {}	; <UNPREDICTABLE>
     1c0:	0000005e 	andeq	r0, r0, lr, asr r0
     1c4:	90070202 	andls	r0, r7, r2, lsl #4
     1c8:	04000000 	streq	r0, [r0], #-0
     1cc:	00000087 	andeq	r0, r0, r7, lsl #1
     1d0:	00701a02 	rsbseq	r1, r0, r2, lsl #20
     1d4:	04020000 	streq	r0, [r2], #-0
     1d8:	00005407 	andeq	r5, r0, r7, lsl #8
     1dc:	07080200 	streq	r0, [r8, -r0, lsl #4]
     1e0:	0000004a 	andeq	r0, r0, sl, asr #32
     1e4:	00037a05 	andeq	r7, r3, r5, lsl #20
     1e8:	0e030800 	cdpeq	8, 0, cr0, cr3, cr0, {0}
     1ec:	000000a3 	andeq	r0, r0, r3, lsr #1
     1f0:	000a6e06 	andeq	r6, sl, r6, lsl #28
     1f4:	700f0300 	andvc	r0, pc, r0, lsl #6
     1f8:	00000000 	andeq	r0, r0, r0
     1fc:	00031306 	andeq	r1, r3, r6, lsl #6
     200:	a3100300 	tstge	r0, #0, 6
     204:	04000000 	streq	r0, [r0], #-0
     208:	00330700 	eorseq	r0, r3, r0, lsl #14
     20c:	6a040000 	bvs	100214 <__bss_end+0xd1214>
     210:	03000001 	movweq	r0, #1
     214:	00007e11 	andeq	r7, r0, r1, lsl lr
     218:	02730400 	rsbseq	r0, r3, #0, 8
     21c:	16040000 	strne	r0, [r4], -r0
     220:	000000be 	strheq	r0, [r0], -lr
     224:	00c40408 	sbceq	r0, r4, r8, lsl #8
     228:	08090000 	stmdaeq	r9, {}	; <UNPREDICTABLE>
     22c:	00006504 	andeq	r6, r0, r4, lsl #10
     230:	07040200 	streq	r0, [r4, -r0, lsl #4]
     234:	0000034f 	andeq	r0, r0, pc, asr #6
     238:	0004300a 	andeq	r3, r4, sl
     23c:	74280100 	strtvc	r0, [r8], #-256	; 0x100
     240:	34000083 	strcc	r0, [r0], #-131	; 0x83
     244:	01000000 	mrseq	r0, (UNDEF: 0)
     248:	00014d9c 	muleq	r1, ip, sp
     24c:	837c0b00 	cmnhi	ip, #0, 22
     250:	03100000 	tsteq	r0, #0
     254:	800b0000 	andhi	r0, fp, r0
     258:	1d000083 	stcne	0, cr0, [r0, #-524]	; 0xfffffdf4
     25c:	0b000003 	bleq	270 <__start-0x7d90>
     260:	00008384 	andeq	r8, r0, r4, lsl #7
     264:	00000324 	andeq	r0, r0, r4, lsr #6
     268:	0083880b 	addeq	r8, r3, fp, lsl #16
     26c:	00032b00 	andeq	r2, r3, r0, lsl #22
     270:	83900c00 	orrshi	r0, r0, #0, 24
     274:	03320000 	teqeq	r2, #0
     278:	011f0000 	tsteq	pc, r0
     27c:	010d0000 	mrseq	r0, (UNDEF: 13)
     280:	64080250 	strvs	r0, [r8], #-592	; 0x250
     284:	83940b00 	orrshi	r0, r4, #0, 22
     288:	03430000 	movteq	r0, #12288	; 0x3000
     28c:	980b0000 	stmdals	fp, {}	; <UNPREDICTABLE>
     290:	50000083 	andpl	r0, r0, r3, lsl #1
     294:	0b000003 	bleq	2a8 <__start-0x7d58>
     298:	0000839c 	muleq	r0, ip, r3
     29c:	00000357 	andeq	r0, r0, r7, asr r3
     2a0:	0083a00b 	addeq	sl, r3, fp
     2a4:	00035e00 	andeq	r5, r3, r0, lsl #28
     2a8:	83a40b00 			; <UNDEFINED> instruction: 0x83a40b00
     2ac:	036f0000 	cmneq	pc, #0
     2b0:	0a000000 	beq	2b8 <__start-0x7d48>
     2b4:	000001cd 	andeq	r0, r0, sp, asr #3
     2b8:	83a83a01 			; <UNDEFINED> instruction: 0x83a83a01
     2bc:	00180000 	andseq	r0, r8, r0
     2c0:	9c010000 	stcls	0, cr0, [r1], {-0}
     2c4:	00000183 	andeq	r0, r0, r3, lsl #3
     2c8:	0083b80c 	addeq	fp, r3, ip, lsl #16
     2cc:	00037c00 	andeq	r7, r3, r0, lsl #24
     2d0:	00017900 	andeq	r7, r1, r0, lsl #18
     2d4:	50010d00 	andpl	r0, r1, r0, lsl #26
     2d8:	b0140305 	andslt	r0, r4, r5, lsl #6
     2dc:	0b000000 	bleq	2e4 <__start-0x7d1c>
     2e0:	000083bc 			; <UNDEFINED> instruction: 0x000083bc
     2e4:	0000039d 	muleq	r0, sp, r3
     2e8:	02270e00 	eoreq	r0, r7, #0, 28
     2ec:	4a010000 	bmi	402f4 <__bss_end+0x112f4>
     2f0:	000002cb 	andeq	r0, r0, fp, asr #5
     2f4:	000083c0 	andeq	r8, r0, r0, asr #7
     2f8:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
     2fc:	02cb9c01 	sbceq	r9, fp, #256	; 0x100
     300:	6b0f0000 	blvs	3c0308 <__user_program+0xc0308>
     304:	01000002 	tsteq	r0, r2
     308:	0000334a 	andeq	r3, r0, sl, asr #6
     30c:	00000000 	andeq	r0, r0, r0
     310:	03930f00 	orrseq	r0, r3, #0, 30
     314:	4a010000 	bmi	4031c <__bss_end+0x1131c>
     318:	000002cd 	andeq	r0, r0, sp, asr #5
     31c:	0000017f 	andeq	r0, r0, pc, ror r1
     320:	0001720f 	andeq	r7, r1, pc, lsl #4
     324:	334a0100 	movtcc	r0, #41216	; 0xa100
     328:	d1000000 	mrsle	r0, (UNDEF: 0)
     32c:	10000002 	andne	r0, r0, r2
     330:	00000266 	andeq	r0, r0, r6, ror #4
     334:	00334c01 	eorseq	r4, r3, r1, lsl #24
     338:	045c0000 	ldrbeq	r0, [ip], #-0
     33c:	6c110000 	ldcvs	0, cr0, [r1], {-0}
     340:	01006e65 	tsteq	r0, r5, ror #28
     344:	0000334c 	andeq	r3, r0, ip, asr #6
     348:	00049200 	andeq	r9, r4, r0, lsl #4
     34c:	74701100 	ldrbtvc	r1, [r0], #-256	; 0x100
     350:	4d010072 	stcmi	0, cr0, [r1, #-456]	; 0xfffffe38
     354:	000002d3 	ldrdeq	r0, [r0], -r3
     358:	000004ca 	andeq	r0, r0, sl, asr #9
     35c:	00022012 	andeq	r2, r2, r2, lsl r0
     360:	a34e0100 	movtge	r0, #57600	; 0xe100
     364:	02000000 	andeq	r0, r0, #0
     368:	28137491 	ldmdacs	r3, {r0, r4, r7, sl, ip, sp, lr}
     36c:	3c000084 	stccc	0, cr0, [r0], {132}	; 0x84
     370:	14000001 	strne	r0, [r0], #-1
     374:	7a010078 	bvc	4055c <__bss_end+0x1155c>
     378:	000002d9 	ldrdeq	r0, [r0], -r9
     37c:	0b709102 	bleq	1c2478c <__user_program+0x192478c>
     380:	00008438 	andeq	r8, r0, r8, lsr r4
     384:	000003a4 	andeq	r0, r0, r4, lsr #7
     388:	0084480c 	addeq	r4, r4, ip, lsl #16
     38c:	0003c300 	andeq	ip, r3, r0, lsl #6
     390:	00023500 	andeq	r3, r2, r0, lsl #10
     394:	50010d00 	andpl	r0, r1, r0, lsl #26
     398:	0b003001 	bleq	c3a4 <present_thread+0x39c>
     39c:	00008454 	andeq	r8, r0, r4, asr r4
     3a0:	000003d4 	ldrdeq	r0, [r0], -r4
     3a4:	0084640b 	addeq	r6, r4, fp, lsl #8
     3a8:	0003e900 	andeq	lr, r3, r0, lsl #18
     3ac:	847c0b00 	ldrbthi	r0, [ip], #-2816	; 0xb00
     3b0:	04030000 	streq	r0, [r3], #-0
     3b4:	940b0000 	strls	r0, [fp], #-0
     3b8:	22000084 	andcs	r0, r0, #132	; 0x84
     3bc:	0b000004 	bleq	3d4 <__start-0x7c2c>
     3c0:	000084a0 	andeq	r8, r0, r0, lsr #9
     3c4:	00000441 	andeq	r0, r0, r1, asr #8
     3c8:	0084b40b 	addeq	fp, r4, fp, lsl #8
     3cc:	00045200 	andeq	r5, r4, r0, lsl #4
     3d0:	84d80c00 	ldrbhi	r0, [r8], #3072	; 0xc00
     3d4:	046c0000 	strbteq	r0, [ip], #-0
     3d8:	02810000 	addeq	r0, r1, #0
     3dc:	020d0000 	andeq	r0, sp, #0
     3e0:	f303007d 	vqadd.u8	q0, <illegal reg q1.5>, <illegal reg q14.5>
     3e4:	0b005201 	bleq	14bf0 <thread30_svc_stack+0x9d8>
     3e8:	000084e4 	andeq	r8, r0, r4, ror #9
     3ec:	00000495 	muleq	r0, r5, r4
     3f0:	0084f00b 	addeq	pc, r4, fp
     3f4:	0004a000 	andeq	sl, r4, r0
     3f8:	85040b00 	strhi	r0, [r4, #-2816]	; 0xb00
     3fc:	04a70000 	strteq	r0, [r7], #0
     400:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     404:	b2000085 	andlt	r0, r0, #133	; 0x85
     408:	0b000004 	bleq	420 <__start-0x7be0>
     40c:	0000853c 	andeq	r8, r0, ip, lsr r5
     410:	000004d2 	ldrdeq	r0, [r0], -r2
     414:	0085500b 	addeq	r5, r5, fp
     418:	0004e300 	andeq	lr, r4, r0, lsl #6
     41c:	85580b00 	ldrbhi	r0, [r8, #-2816]	; 0xb00
     420:	04ea0000 	strbteq	r0, [sl], #0
     424:	5c0b0000 	stcpl	0, cr0, [fp], {-0}
     428:	24000085 	strcs	r0, [r0], #-133	; 0x85
     42c:	00000003 	andeq	r0, r0, r3
     430:	08041500 	stmdaeq	r4, {r8, sl, ip}
     434:	00003304 	andeq	r3, r0, r4, lsl #6
     438:	25040800 	strcs	r0, [r4, #-2048]	; 0x800
     43c:	07000000 	streq	r0, [r0, -r0]
     440:	00000070 	andeq	r0, r0, r0, ror r0
     444:	0002e916 	andeq	lr, r2, r6, lsl r9
     448:	00531700 	subseq	r1, r3, r0, lsl #14
     44c:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     450:	01006c67 	tsteq	r0, r7, ror #24
     454:	0002f925 	andeq	pc, r2, r5, lsr #18
     458:	0c030500 	cfstr32eq	mvfx0, [r3], {-0}
     45c:	080000d0 	stmdaeq	r0, {r4, r6, r7}
     460:	0002de04 	andeq	sp, r2, r4, lsl #28
     464:	017b1900 	cmneq	fp, r0, lsl #18
     468:	26010000 	strcs	r0, [r1], -r0
     46c:	000002d9 	ldrdeq	r0, [r0], -r9
     470:	d0000305 	andle	r0, r0, r5, lsl #6
     474:	db1a0000 	blle	68047c <__user_program+0x38047c>
     478:	01000001 	tsteq	r0, r1
     47c:	00031d1b 	andeq	r1, r3, fp, lsl sp
     480:	1c001b00 	stcne	11, cr1, [r0], {-0}
     484:	00000318 	andeq	r0, r0, r8, lsl r3
     488:	941c2d05 	ldrls	r2, [ip], #-3333	; 0xd05
     48c:	06000001 	streq	r0, [r0], -r1
     490:	02161c2b 	andseq	r1, r6, #11008	; 0x2b00
     494:	17070000 	strne	r0, [r7, -r0]
     498:	0002061d 	andeq	r0, r2, sp, lsl r6
     49c:	43390900 	teqmi	r9, #0, 18
     4a0:	17000003 	strne	r0, [r0, -r3]
     4a4:	00000053 	andeq	r0, r0, r3, asr r0
     4a8:	02f81a00 	rscseq	r1, r8, #0, 20
     4ac:	1e010000 	cdpne	0, 0, cr0, cr1, cr0, {0}
     4b0:	00000350 	andeq	r0, r0, r0, asr r3
     4b4:	801c001b 	andshi	r0, ip, fp, lsl r0
     4b8:	08000003 	stmdaeq	r0, {r0, r1}
     4bc:	02351c32 	eorseq	r1, r5, #12800	; 0x3200
     4c0:	31080000 	mrscc	r0, (UNDEF: 8)
     4c4:	0003231e 	andeq	r2, r3, lr, lsl r3
     4c8:	41290800 	teqmi	r9, r0, lsl #16
     4cc:	6f000000 	svcvs	0x00000000
     4d0:	1b000003 	blne	4e4 <__start-0x7b1c>
     4d4:	04491a00 	strbeq	r1, [r9], #-2560	; 0xa00
     4d8:	1c010000 	stcne	0, cr0, [r1], {-0}
     4dc:	0000037c 	andeq	r0, r0, ip, ror r3
     4e0:	731f001b 	tstvc	pc, #27
     4e4:	0a000003 	beq	4f8 <__start-0x7b08>
     4e8:	00003313 	andeq	r3, r0, r3, lsl r3
     4ec:	00039200 	andeq	r9, r3, r0, lsl #4
     4f0:	03921700 	orrseq	r1, r2, #0, 14
     4f4:	001b0000 	andseq	r0, fp, r0
     4f8:	03980408 	orrseq	r0, r8, #8, 8	; 0x8000000
     4fc:	25200000 	strcs	r0, [r0, #-0]!
     500:	1c000000 	stcne	0, cr0, [r0], {-0}
     504:	0000027d 	andeq	r0, r0, sp, ror r2
     508:	471f3a05 	ldrmi	r3, [pc, -r5, lsl #20]
     50c:	0b000002 	bleq	51c <__start-0x7ae4>
     510:	0000331f 	andeq	r3, r0, pc, lsl r3
     514:	0003c300 	andeq	ip, r3, r0, lsl #6
     518:	00331700 	eorseq	r1, r3, r0, lsl #14
     51c:	d3170000 	tstle	r7, #0
     520:	17000002 	strne	r0, [r0, -r2]
     524:	00000033 	andeq	r0, r0, r3, lsr r0
     528:	02a71d00 	adceq	r1, r7, #0, 26
     52c:	580b0000 	stmdapl	fp, {}	; <UNPREDICTABLE>
     530:	000003d4 	ldrdeq	r0, [r0], -r4
     534:	00003317 	andeq	r3, r0, r7, lsl r3
     538:	871f0000 	ldrhi	r0, [pc, -r0]
     53c:	0b000001 	bleq	548 <__start-0x7ab8>
     540:	0002cb15 	andeq	ip, r2, r5, lsl fp
     544:	0003e900 	andeq	lr, r3, r0, lsl #18
     548:	00331700 	eorseq	r1, r3, r0, lsl #14
     54c:	1f000000 	svcne	0x00000000
     550:	00000459 	andeq	r0, r0, r9, asr r4
     554:	0033320b 	eorseq	r3, r3, fp, lsl #4
     558:	04030000 	streq	r0, [r3], #-0
     55c:	33170000 	tstcc	r7, #0
     560:	17000000 	strne	r0, [r0, -r0]
     564:	000002cb 	andeq	r0, r0, fp, asr #5
     568:	043c1f00 	ldrteq	r1, [ip], #-3840	; 0xf00
     56c:	500b0000 	andpl	r0, fp, r0
     570:	00000033 	andeq	r0, r0, r3, lsr r0
     574:	00000422 	andeq	r0, r0, r2, lsr #8
     578:	00003317 	andeq	r3, r0, r7, lsl r3
     57c:	02d31700 	sbcseq	r1, r3, #0, 14
     580:	33170000 	tstcc	r7, #0
     584:	00000000 	andeq	r0, r0, r0
     588:	0003981f 	andeq	r9, r3, pc, lsl r8
     58c:	33640b00 	cmncc	r4, #0, 22
     590:	41000000 	mrsmi	r0, (UNDEF: 0)
     594:	17000004 	strne	r0, [r0, -r4]
     598:	00000033 	andeq	r0, r0, r3, lsr r0
     59c:	00004117 	andeq	r4, r0, r7, lsl r1
     5a0:	02f91700 	rscseq	r1, r9, #0, 14
     5a4:	1e000000 	cdpne	0, 0, cr0, cr0, cr0, {0}
     5a8:	000002c8 	andeq	r0, r0, r8, asr #5
     5ac:	00336b0b 	eorseq	r6, r3, fp, lsl #22
     5b0:	04520000 	ldrbeq	r0, [r2], #-0
     5b4:	001b0000 	andseq	r0, fp, r0
     5b8:	0001b91f 	andeq	fp, r1, pc, lsl r9
     5bc:	33320c00 	teqcc	r2, #0, 24
     5c0:	6c000000 	stcvs	0, cr0, [r0], {-0}
     5c4:	17000004 	strne	r0, [r0, -r4]
     5c8:	000000b3 	strheq	r0, [r0], -r3
     5cc:	0000c517 	andeq	ip, r0, r7, lsl r5
     5d0:	911f0000 	tstls	pc, r0
     5d4:	0c000002 	stceq	0, cr0, [r0], {2}
     5d8:	0000333f 	andeq	r3, r0, pc, lsr r3
     5dc:	00049500 	andeq	r9, r4, r0, lsl #10
     5e0:	00b31700 	adcseq	r1, r3, r0, lsl #14
     5e4:	c5170000 	ldrgt	r0, [r7, #-0]
     5e8:	17000000 	strne	r0, [r0, -r0]
     5ec:	00000070 	andeq	r0, r0, r0, ror r0
     5f0:	00007017 	andeq	r7, r0, r7, lsl r0
     5f4:	00701700 	rsbseq	r1, r0, r0, lsl #14
     5f8:	21000000 	mrscs	r0, (UNDEF: 0)
     5fc:	000002e0 	andeq	r0, r0, r0, ror #5
     600:	00336d0c 	eorseq	r6, r3, ip, lsl #26
     604:	301c0000 	andscc	r0, ip, r0
     608:	0c000003 	stceq	0, cr0, [r0], {3}
     60c:	02552160 	subseq	r2, r5, #96, 2
     610:	630c0000 	movwvs	r0, #49152	; 0xc000
     614:	00000070 	andeq	r0, r0, r0, ror r0
     618:	0001a61f 	andeq	sl, r1, pc, lsl r6
     61c:	334d0c00 	movtcc	r0, #56320	; 0xdc00
     620:	cc000000 	stcgt	0, cr0, [r0], {-0}
     624:	17000004 	strne	r0, [r0, -r4]
     628:	000004cc 	andeq	r0, r0, ip, asr #9
     62c:	00007017 	andeq	r7, r0, r7, lsl r0
     630:	04080000 	streq	r0, [r8], #-0
     634:	000000a8 	andeq	r0, r0, r8, lsr #1
     638:	0003051d 	andeq	r0, r3, sp, lsl r5
     63c:	e3570c00 	cmp	r7, #0, 24
     640:	17000004 	strne	r0, [r0, -r4]
     644:	000004cc 	andeq	r0, r0, ip, asr #9
     648:	01f31c00 	mvnseq	r1, r0, lsl #24
     64c:	30060000 	andcc	r0, r6, r0
     650:	00015522 	andeq	r5, r1, r2, lsr #10
     654:	175d0c00 	ldrbne	r0, [sp, -r0, lsl #24]
     658:	000004cc 	andeq	r0, r0, ip, asr #9
     65c:	02f00000 	rscseq	r0, r0, #0
     660:	00040000 	andeq	r0, r4, r0
     664:	00000297 	muleq	r0, r7, r2
     668:	03b10104 			; <UNDEFINED> instruction: 0x03b10104
     66c:	79010000 	stmdbvc	r1, {}	; <UNPREDICTABLE>
     670:	58000004 	stmdapl	r0, {r2}
     674:	70000003 	andvc	r0, r0, r3
     678:	98000085 	stmdals	r0, {r0, r2, r7}
     67c:	cd000002 	stcgt	0, cr0, [r0, #-8]
     680:	02000001 	andeq	r0, r0, #1
     684:	00000072 	andeq	r0, r0, r2, ror r0
     688:	00300e02 	eorseq	r0, r0, r2, lsl #28
     68c:	01030000 	mrseq	r0, (UNDEF: 3)
     690:	00008208 	andeq	r8, r0, r8, lsl #4
     694:	05020300 	streq	r0, [r2, #-768]	; 0x300
     698:	00000138 	andeq	r0, r0, r8, lsr r1
     69c:	00008802 	andeq	r8, r0, r2, lsl #16
     6a0:	49120200 	ldmdbmi	r2, {r9}
     6a4:	04000000 	streq	r0, [r0], #-0
     6a8:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     6ac:	08030074 	stmdaeq	r3, {r2, r4, r5, r6}
     6b0:	00000005 	andeq	r0, r0, r5
     6b4:	00710200 	rsbseq	r0, r1, r0, lsl #4
     6b8:	16020000 	strne	r0, [r2], -r0
     6bc:	00000062 	andeq	r0, r0, r2, rrx
     6c0:	79080103 	stmdbvc	r8, {r0, r1, r8}
     6c4:	03000000 	movweq	r0, #0
     6c8:	00900702 	addseq	r0, r0, r2, lsl #14
     6cc:	87020000 	strhi	r0, [r2, -r0]
     6d0:	02000000 	andeq	r0, r0, #0
     6d4:	00007b1a 	andeq	r7, r0, sl, lsl fp
     6d8:	07040300 	streq	r0, [r4, -r0, lsl #6]
     6dc:	00000054 	andeq	r0, r0, r4, asr r0
     6e0:	00047002 	andeq	r7, r4, r2
     6e4:	8d1c0200 	lfmhi	f0, 4, [ip, #-0]
     6e8:	03000000 	movweq	r0, #0
     6ec:	004a0708 	subeq	r0, sl, r8, lsl #14
     6f0:	8f020000 	svchi	0x00020000
     6f4:	03000004 	movweq	r0, #4
     6f8:	00009f13 	andeq	r9, r0, r3, lsl pc
     6fc:	048d0500 	streq	r0, [sp], #1280	; 0x500
     700:	04040000 	streq	r0, [r4], #-0
     704:	0000b600 	andeq	fp, r0, r0, lsl #12
     708:	04c20600 	strbeq	r0, [r2], #1536	; 0x600
     70c:	00b60000 	adcseq	r0, r6, r0
     710:	00000000 	andeq	r0, r0, r0
     714:	a5080407 	strge	r0, [r8, #-1031]	; 0x407
     718:	01000004 	tsteq	r0, r4
     71c:	00857021 	addeq	r7, r5, r1, lsr #32
     720:	0000e000 	andeq	lr, r0, r0
     724:	2a9c0100 	bcs	fe700b2c <__user_program+0xfe400b2c>
     728:	09000001 	stmdbeq	r0, {r0}
     72c:	000004bd 			; <UNDEFINED> instruction: 0x000004bd
     730:	00572101 	subseq	r2, r7, r1, lsl #2
     734:	05000000 	streq	r0, [r0, #-0]
     738:	6e0a0000 	cdpvs	0, 0, cr0, cr10, cr0, {0}
     73c:	01006d75 	tsteq	r0, r5, ror sp
     740:	00008221 	andeq	r8, r0, r1, lsr #4
     744:	00052100 	andeq	r2, r5, r0, lsl #2
     748:	04b60b00 	ldrteq	r0, [r6], #2816	; 0xb00
     74c:	22010000 	andcs	r0, r1, #0
     750:	0000012a 	andeq	r0, r0, sl, lsr #2
     754:	00000559 	andeq	r0, r0, r9, asr r5
     758:	6675620c 	ldrbtvs	r6, [r5], -ip, lsl #4
     75c:	30230100 	eorcc	r0, r3, r0, lsl #2
     760:	02000001 	andeq	r0, r0, #1
     764:	700d5891 	mulvc	sp, r1, r8
     768:	01007274 	tsteq	r0, r4, ror r2
     76c:	00012a24 	andeq	r2, r1, r4, lsr #20
     770:	00059000 	andeq	r9, r5, r0
     774:	86240e00 	strthi	r0, [r4], -r0, lsl #28
     778:	02e60000 	rsceq	r0, r6, #0
     77c:	3c0e0000 	stccc	0, cr0, [lr], {-0}
     780:	e6000086 	str	r0, [r0], -r6, lsl #1
     784:	00000002 	andeq	r0, r0, r2
     788:	0025040f 	eoreq	r0, r5, pc, lsl #8
     78c:	25100000 	ldrcs	r0, [r0, #-0]
     790:	40000000 	andmi	r0, r0, r0
     794:	11000001 	tstne	r0, r1
     798:	00000140 	andeq	r0, r0, r0, asr #2
     79c:	04030007 	streq	r0, [r3], #-7
     7a0:	00034f07 	andeq	r4, r3, r7, lsl #30
     7a4:	03731200 	cmneq	r3, #0, 4
     7a8:	3f010000 	svccc	0x00010000
     7ac:	00000049 	andeq	r0, r0, r9, asr #32
     7b0:	00008650 	andeq	r8, r0, r0, asr r6
     7b4:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
     7b8:	02b59c01 	adcseq	r9, r5, #256	; 0x100
     7bc:	660a0000 	strvs	r0, [sl], -r0
     7c0:	0100746d 	tsteq	r0, sp, ror #8
     7c4:	0002b53f 	andeq	fp, r2, pc, lsr r5
     7c8:	0005f800 	andeq	pc, r5, r0, lsl #16
     7cc:	93141300 	tstls	r4, #0, 6
     7d0:	01000003 	tsteq	r0, r3
     7d4:	00009440 	andeq	r9, r0, r0, asr #8
     7d8:	54910200 	ldrpl	r0, [r1], #512	; 0x200
     7dc:	00000015 	andeq	r0, r0, r5, lsl r0
     7e0:	0001a700 	andeq	sl, r1, r0, lsl #14
     7e4:	756e0d00 	strbvc	r0, [lr, #-3328]!	; 0xd00
     7e8:	6101006d 	tstvs	r1, sp, rrx
     7ec:	00000070 	andeq	r0, r0, r0, ror r0
     7f0:	0000062f 	andeq	r0, r0, pc, lsr #12
     7f4:	00876816 	addeq	r6, r7, r6, lsl r8
     7f8:	0000b800 	andeq	fp, r0, r0, lsl #16
     7fc:	50011700 	andpl	r1, r1, r0, lsl #14
     800:	00007802 	andeq	r7, r0, r2, lsl #16
     804:	00181500 	andseq	r1, r8, r0, lsl #10
     808:	01d00000 	bicseq	r0, r0, r0
     80c:	6e0d0000 	cdpvs	0, 0, cr0, cr13, cr0, {0}
     810:	01006d75 	tsteq	r0, r5, ror sp
     814:	00007068 	andeq	r7, r0, r8, rrx
     818:	00064e00 	andeq	r4, r6, r0, lsl #28
     81c:	87881600 	strhi	r1, [r8, r0, lsl #12]
     820:	00b80000 	adcseq	r0, r8, r0
     824:	01170000 	tsteq	r7, r0
     828:	00770250 	rsbseq	r0, r7, r0, asr r2
     82c:	e4180000 	ldr	r0, [r8], #-0
     830:	48000086 	stmdami	r0, {r1, r2, r7}
     834:	23000000 	movwcs	r0, #0
     838:	0d000002 	stceq	0, cr0, [r0, #-8]
     83c:	006d756e 	rsbeq	r7, sp, lr, ror #10
     840:	003e5001 	eorseq	r5, lr, r1
     844:	066d0000 	strbteq	r0, [sp], -r0
     848:	04190000 	ldreq	r0, [r9], #-0
     84c:	e6000087 	str	r0, [r0], -r7, lsl #1
     850:	00000002 	andeq	r0, r0, r2
     854:	17000002 	strne	r0, [r0, -r2]
     858:	08025001 	stmdaeq	r2, {r0, ip, lr}
     85c:	1419002d 	ldrne	r0, [r9], #-45	; 0x2d
     860:	b8000087 	stmdalt	r0, {r0, r1, r2, r7}
     864:	13000000 	movwne	r0, #0
     868:	17000002 	strne	r0, [r0, -r2]
     86c:	3a015001 	bcc	54878 <__bss_end+0x25878>
     870:	87281600 	strhi	r1, [r8, -r0, lsl #12]!
     874:	00b80000 	adcseq	r0, r8, r0
     878:	01170000 	tsteq	r7, r0
     87c:	003a0150 	eorseq	r0, sl, r0, asr r1
     880:	872c1800 	strhi	r1, [ip, -r0, lsl #16]!
     884:	00200000 	eoreq	r0, r0, r0
     888:	024f0000 	subeq	r0, pc, #0
     88c:	6e0d0000 	cdpvs	0, 0, cr0, cr13, cr0, {0}
     890:	01006d75 	tsteq	r0, r5, ror sp
     894:	0000705b 	andeq	r7, r0, fp, asr r0
     898:	00068000 	andeq	r8, r6, r0
     89c:	87481600 	strbhi	r1, [r8, -r0, lsl #12]
     8a0:	00b80000 	adcseq	r0, r8, r0
     8a4:	01170000 	tsteq	r7, r0
     8a8:	003a0150 	eorseq	r0, sl, r0, asr r1
     8ac:	878c1800 	strhi	r1, [ip, r0, lsl #16]
     8b0:	00300000 	eorseq	r0, r0, r0
     8b4:	02750000 	rsbseq	r0, r5, #0
     8b8:	670b0000 	strvs	r0, [fp, -r0]
     8bc:	01000004 	tsteq	r0, r4
     8c0:	00012a6e 	andeq	r2, r1, lr, ror #20
     8c4:	00069f00 	andeq	r9, r6, r0, lsl #30
     8c8:	87ac0e00 	strhi	r0, [ip, r0, lsl #28]!
     8cc:	02e60000 	rsceq	r0, r6, #0
     8d0:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     8d4:	000087bc 			; <UNDEFINED> instruction: 0x000087bc
     8d8:	00000018 	andeq	r0, r0, r8, lsl r0
     8dc:	0000029b 	muleq	r0, fp, r2
     8e0:	0005ff0b 	andeq	pc, r5, fp, lsl #30
     8e4:	3e770100 	rpwccs	f0, f7, f0
     8e8:	bf000000 	svclt	0x00000000
     8ec:	0e000006 	cdpeq	0, 0, cr0, cr0, cr6, {0}
     8f0:	000087d0 	ldrdeq	r8, [r0], -r0
     8f4:	000002e6 	andeq	r0, r0, r6, ror #5
     8f8:	86880e00 	strhi	r0, [r8], r0, lsl #28
     8fc:	02e60000 	rsceq	r0, r6, #0
     900:	dc160000 	ldcle	0, cr0, [r6], {-0}
     904:	e6000087 	str	r0, [r0], -r7, lsl #1
     908:	17000002 	strne	r0, [r0, -r2]
     90c:	08025001 	stmdaeq	r2, {r0, ip, lr}
     910:	0f000025 	svceq	0x00000025
     914:	0002bb04 	andeq	fp, r2, r4, lsl #22
     918:	00301a00 	eorseq	r1, r0, r0, lsl #20
     91c:	30100000 	andscc	r0, r0, r0
     920:	d0000000 	andle	r0, r0, r0
     924:	11000002 	tstne	r0, r2
     928:	00000140 	andeq	r0, r0, r0, asr #2
     92c:	af140010 	svcge	0x00140010
     930:	01000004 	tsteq	r0, r4
     934:	0002e118 	andeq	lr, r2, r8, lsl r1
     938:	00030500 	andeq	r0, r3, r0, lsl #10
     93c:	1a0000b0 	bne	c04 <__start-0x73fc>
     940:	000002c0 	andeq	r0, r0, r0, asr #5
     944:	0004971b 	andeq	r9, r4, fp, lsl r7
     948:	1c230500 	cfstr32ne	mvfx0, [r3], #-0
     94c:	00000057 	andeq	r0, r0, r7, asr r0
     950:	00fa0000 	rscseq	r0, sl, r0
     954:	00040000 	andeq	r0, r4, r0
     958:	00000401 	andeq	r0, r0, r1, lsl #8
     95c:	03b10104 			; <UNDEFINED> instruction: 0x03b10104
     960:	c7010000 	strgt	r0, [r1, -r0]
     964:	58000004 	stmdapl	r0, {r2}
     968:	08000003 	stmdaeq	r0, {r0, r1}
     96c:	bc000088 	stclt	0, cr0, [r0], {136}	; 0x88
     970:	b1000000 	mrslt	r0, (UNDEF: 0)
     974:	02000002 	andeq	r0, r0, #2
     978:	00820801 	addeq	r0, r2, r1, lsl #16
     97c:	02020000 	andeq	r0, r2, #0
     980:	00013805 	andeq	r3, r1, r5, lsl #16
     984:	05040300 	streq	r0, [r4, #-768]	; 0x300
     988:	00746e69 	rsbseq	r6, r4, r9, ror #28
     98c:	00050802 	andeq	r0, r5, r2, lsl #16
     990:	02000000 	andeq	r0, r0, #0
     994:	00790801 	rsbseq	r0, r9, r1, lsl #16
     998:	02020000 	andeq	r0, r2, #0
     99c:	00009007 	andeq	r9, r0, r7
     9a0:	00870400 	addeq	r0, r7, r0, lsl #8
     9a4:	1a020000 	bne	809ac <__bss_end+0x519ac>
     9a8:	0000005a 	andeq	r0, r0, sl, asr r0
     9ac:	54070402 	strpl	r0, [r7], #-1026	; 0x402
     9b0:	02000000 	andeq	r0, r0, #0
     9b4:	004a0708 	subeq	r0, sl, r8, lsl #14
     9b8:	df050000 	svcle	0x00050000
     9bc:	01000004 	tsteq	r0, r4
     9c0:	00880810 	addeq	r0, r8, r0, lsl r8
     9c4:	00004000 	andeq	r4, r0, r0
     9c8:	8d9c0100 	ldfhis	f0, [ip]
     9cc:	06000000 	streq	r0, [r0], -r0
     9d0:	000004da 	ldrdeq	r0, [r0], -sl
     9d4:	00331001 	eorseq	r1, r3, r1
     9d8:	06d30000 	ldrbeq	r0, [r3], r0
     9dc:	07000000 	streq	r0, [r0, -r0]
     9e0:	00000318 	andeq	r0, r0, r8, lsl r3
     9e4:	88481a01 	stmdahi	r8, {r0, r9, fp, ip}^
     9e8:	00240000 	eoreq	r0, r4, r0
     9ec:	9c010000 	stcls	0, cr0, [r1], {-0}
     9f0:	0004fc08 	andeq	pc, r4, r8, lsl #24
     9f4:	4f200100 	svcmi	0x00200100
     9f8:	6c000000 	stcvs	0, cr0, [r0], {-0}
     9fc:	10000088 	andne	r0, r0, r8, lsl #1
     a00:	01000000 	mrseq	r0, (UNDEF: 0)
     a04:	0000c59c 	muleq	r0, ip, r5
     a08:	61760900 	cmnvs	r6, r0, lsl #18
     a0c:	2101006c 	tstcs	r1, ip, rrx
     a10:	0000004f 	andeq	r0, r0, pc, asr #32
     a14:	08005001 	stmdaeq	r0, {r0, ip, lr}
     a18:	000004eb 	andeq	r0, r0, fp, ror #9
     a1c:	00332501 	eorseq	r2, r3, r1, lsl #10
     a20:	887c0000 	ldmdahi	ip!, {}^	; <UNPREDICTABLE>
     a24:	00140000 	andseq	r0, r4, r0
     a28:	9c010000 	stcls	0, cr0, [r1], {-0}
     a2c:	000000ec 	andeq	r0, r0, ip, ror #1
     a30:	01006c0a 	tsteq	r0, sl, lsl #24
     a34:	00003326 	andeq	r3, r0, r6, lsr #6
     a38:	0006ff00 	andeq	pc, r6, r0, lsl #30
     a3c:	7d070000 	stcvc	0, cr0, [r7, #-0]
     a40:	01000002 	tsteq	r0, r2
     a44:	0088902b 	addeq	r9, r8, fp, lsr #32
     a48:	00003400 	andeq	r3, r0, r0, lsl #8
     a4c:	009c0100 	addseq	r0, ip, r0, lsl #2
     a50:	0000081a 	andeq	r0, r0, sl, lsl r8
     a54:	04b30004 	ldrteq	r0, [r3], #4
     a58:	01040000 	mrseq	r0, (UNDEF: 4)
     a5c:	000003b1 			; <UNDEFINED> instruction: 0x000003b1
     a60:	00053e01 	andeq	r3, r5, r1, lsl #28
     a64:	00035800 	andeq	r5, r3, r0, lsl #16
     a68:	0088c400 	addeq	ip, r8, r0, lsl #8
     a6c:	00039c00 	andeq	r9, r3, r0, lsl #24
     a70:	00032100 	andeq	r2, r3, r0, lsl #2
     a74:	08010200 	stmdaeq	r1, {r9}
     a78:	00000082 	andeq	r0, r0, r2, lsl #1
     a7c:	38050202 	stmdacc	r5, {r1, r9}
     a80:	03000001 	movweq	r0, #1
     a84:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     a88:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     a8c:	00000005 	andeq	r0, r0, r5
     a90:	00710400 	rsbseq	r0, r1, r0, lsl #8
     a94:	16020000 	strne	r0, [r2], -r0
     a98:	0000004c 	andeq	r0, r0, ip, asr #32
     a9c:	79080102 	stmdbvc	r8, {r1, r8}
     aa0:	02000000 	andeq	r0, r0, #0
     aa4:	00900702 	addseq	r0, r0, r2, lsl #14
     aa8:	87040000 	strhi	r0, [r4, -r0]
     aac:	02000000 	andeq	r0, r0, #0
     ab0:	0000651a 	andeq	r6, r0, sl, lsl r5
     ab4:	07040200 	streq	r0, [r4, -r0, lsl #4]
     ab8:	00000054 	andeq	r0, r0, r4, asr r0
     abc:	4a070802 	bmi	1c2acc <__end+0x72acc>
     ac0:	05000000 	streq	r0, [r0, #-0]
     ac4:	00000520 	andeq	r0, r0, r0, lsr #10
     ac8:	88c40801 	stmiahi	r4, {r0, fp}^
     acc:	00200000 	eoreq	r0, r0, r0
     ad0:	9c010000 	stcls	0, cr0, [r1], {-0}
     ad4:	00000098 	muleq	r0, r8, r0
     ad8:	00051a06 	andeq	r1, r5, r6, lsl #20
     adc:	5a080100 	bpl	200ee4 <__end+0xb0ee4>
     ae0:	21000000 	mrscs	r0, (UNDEF: 0)
     ae4:	00000007 	andeq	r0, r0, r7
     ae8:	00050707 	andeq	r0, r5, r7, lsl #14
     aec:	41100100 	tstmi	r0, r0, lsl #2
     af0:	e4000000 	str	r0, [r0], #-0
     af4:	44000088 	strmi	r0, [r0], #-136	; 0x88
     af8:	01000000 	mrseq	r0, (UNDEF: 0)
     afc:	0000ee9c 	muleq	r0, ip, lr
     b00:	6f720800 	svcvs	0x00720800
     b04:	10010077 	andne	r0, r1, r7, ror r0
     b08:	0000005a 	andeq	r0, r0, sl, asr r0
     b0c:	0000073f 	andeq	r0, r0, pc, lsr r7
     b10:	6c6f6308 	stclvs	3, cr6, [pc], #-32	; af8 <__start-0x7508>
     b14:	5a100100 	bpl	400f1c <__user_program+0x100f1c>
     b18:	86000000 	strhi	r0, [r0], -r0
     b1c:	09000007 	stmdbeq	r0, {r0, r1, r2}
     b20:	0000006a 	andeq	r0, r0, sl, rrx
     b24:	00331201 	eorseq	r1, r3, r1, lsl #4
     b28:	07d00000 	ldrbeq	r0, [r0, r0]
     b2c:	8e090000 	cdphi	0, 0, cr0, cr9, cr0, {0}
     b30:	01000005 	tsteq	r0, r5
     b34:	00003312 	andeq	r3, r0, r2, lsl r3
     b38:	00080400 	andeq	r0, r8, r0, lsl #8
     b3c:	b1070000 	mrslt	r0, (UNDEF: 7)
     b40:	01000005 	tsteq	r0, r5
     b44:	0000411c 	andeq	r4, r0, ip, lsl r1
     b48:	00892800 	addeq	r2, r9, r0, lsl #16
     b4c:	00004400 	andeq	r4, r0, r0, lsl #8
     b50:	449c0100 	ldrmi	r0, [ip], #256	; 0x100
     b54:	08000001 	stmdaeq	r0, {r0}
     b58:	00776f72 	rsbseq	r6, r7, r2, ror pc
     b5c:	005a1c01 	subseq	r1, sl, r1, lsl #24
     b60:	08170000 	ldmdaeq	r7, {}	; <UNPREDICTABLE>
     b64:	63080000 	movwvs	r0, #32768	; 0x8000
     b68:	01006c6f 	tsteq	r0, pc, ror #24
     b6c:	00005a1c 	andeq	r5, r0, ip, lsl sl
     b70:	00085e00 	andeq	r5, r8, r0, lsl #28
     b74:	006a0900 	rsbeq	r0, sl, r0, lsl #18
     b78:	1e010000 	cdpne	0, 0, cr0, cr1, cr0, {0}
     b7c:	00000033 	andeq	r0, r0, r3, lsr r0
     b80:	000008a8 	andeq	r0, r0, r8, lsr #17
     b84:	00058e09 	andeq	r8, r5, r9, lsl #28
     b88:	331e0100 	tstcc	lr, #0, 2
     b8c:	dc000000 	stcle	0, cr0, [r0], {-0}
     b90:	00000008 	andeq	r0, r0, r8
     b94:	0003230a 	andeq	r2, r3, sl, lsl #6
     b98:	41290100 	teqmi	r9, r0, lsl #2
     b9c:	6c000000 	stcvs	0, cr0, [r0], {-0}
     ba0:	24000089 	strcs	r0, [r0], #-137	; 0x89
     ba4:	01000000 	mrseq	r0, (UNDEF: 0)
     ba8:	00016b9c 	muleq	r1, ip, fp
     bac:	00690b00 	rsbeq	r0, r9, r0, lsl #22
     bb0:	00332b01 	eorseq	r2, r3, r1, lsl #22
     bb4:	08ef0000 	stmiaeq	pc!, {}^	; <UNPREDICTABLE>
     bb8:	05000000 	streq	r0, [r0, #-0]
     bbc:	000005d8 	ldrdeq	r0, [r0], -r8
     bc0:	89903f01 	ldmibhi	r0, {r0, r8, r9, sl, fp, ip, sp}
     bc4:	00340000 	eorseq	r0, r4, r0
     bc8:	9c010000 	stcls	0, cr0, [r1], {-0}
     bcc:	000001ee 	andeq	r0, r0, lr, ror #3
     bd0:	0005e306 	andeq	lr, r5, r6, lsl #6
     bd4:	4c3f0100 	ldfmis	f0, [pc], #-0	; bdc <__start-0x7424>
     bd8:	16000000 	strne	r0, [r0], -r0
     bdc:	0c000009 	stceq	0, cr0, [r0], {9}
     be0:	000089a0 	andeq	r8, r0, r0, lsr #19
     be4:	000007a1 	andeq	r0, r0, r1, lsr #15
     be8:	000001a2 	andeq	r0, r0, r2, lsr #3
     bec:	0150010d 	cmpeq	r0, sp, lsl #2
     bf0:	a80c0039 	stmdage	ip, {r0, r3, r4, r5}
     bf4:	73000089 	movwvc	r0, #137	; 0x89
     bf8:	b7000000 	strlt	r0, [r0, -r0]
     bfc:	0d000001 	stceq	0, cr0, [r0, #-4]
     c00:	0a035001 	beq	d4c0c <__bss_end+0xa5c0c>
     c04:	0c0003e8 	stceq	3, cr0, [r0], {232}	; 0xe8
     c08:	000089b4 			; <UNDEFINED> instruction: 0x000089b4
     c0c:	000007b2 			; <UNDEFINED> instruction: 0x000007b2
     c10:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     c14:	0251010d 	subseq	r0, r1, #1073741827	; 0x40000003
     c18:	010d4008 	tsteq	sp, r8
     c1c:	00300150 	eorseq	r0, r0, r0, asr r1
     c20:	0089bc0c 	addeq	fp, r9, ip, lsl #24
     c24:	0007c800 	andeq	ip, r7, r0, lsl #16
     c28:	0001e400 	andeq	lr, r1, r0, lsl #8
     c2c:	50010d00 	andpl	r0, r1, r0, lsl #26
     c30:	00007402 	andeq	r7, r0, r2, lsl #8
     c34:	0089c00e 	addeq	ip, r9, lr
     c38:	0007dd00 	andeq	sp, r7, r0, lsl #26
     c3c:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
     c40:	01000005 	tsteq	r0, r5
     c44:	0089c449 	addeq	ip, r9, r9, asr #8
     c48:	00003400 	andeq	r3, r0, r0, lsl #8
     c4c:	719c0100 	orrsvc	r0, ip, r0, lsl #2
     c50:	06000002 	streq	r0, [r0], -r2
     c54:	00000539 	andeq	r0, r0, r9, lsr r5
     c58:	004c4901 	subeq	r4, ip, r1, lsl #18
     c5c:	09370000 	ldmdbeq	r7!, {}	; <UNPREDICTABLE>
     c60:	d40c0000 	strle	r0, [ip], #-0
     c64:	e4000089 	str	r0, [r0], #-137	; 0x89
     c68:	25000007 	strcs	r0, [r0, #-7]
     c6c:	0d000002 	stceq	0, cr0, [r0, #-8]
     c70:	39015001 	stmdbcc	r1, {r0, ip, lr}
     c74:	89dc0c00 	ldmibhi	ip, {sl, fp}^
     c78:	00730000 	rsbseq	r0, r3, r0
     c7c:	023a0000 	eorseq	r0, sl, #0
     c80:	010d0000 	mrseq	r0, (UNDEF: 13)
     c84:	e80a0350 	stmda	sl, {r4, r6, r8, r9}
     c88:	e80c0003 	stmda	ip, {r0, r1}
     c8c:	b2000089 	andlt	r0, r0, #137	; 0x89
     c90:	53000007 	movwpl	r0, #7
     c94:	0d000002 	stceq	0, cr0, [r0, #-8]
     c98:	08025101 	stmdaeq	r2, {r0, r8, ip, lr}
     c9c:	50010d20 	andpl	r0, r1, r0, lsr #26
     ca0:	0c003001 	stceq	0, cr3, [r0], {1}
     ca4:	000089f0 	strdeq	r8, [r0], -r0
     ca8:	000007c8 	andeq	r0, r0, r8, asr #15
     cac:	00000267 	andeq	r0, r0, r7, ror #4
     cb0:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     cb4:	0e000074 	mcreq	0, 0, r0, cr0, cr4, {3}
     cb8:	000089f4 	strdeq	r8, [r0], -r4
     cbc:	000007dd 	ldrdeq	r0, [r0], -sp
     cc0:	05eb0500 	strbeq	r0, [fp, #1280]!	; 0x500
     cc4:	52010000 	andpl	r0, r1, #0
     cc8:	000089f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
     ccc:	00000040 	andeq	r0, r0, r0, asr #32
     cd0:	02f29c01 	rscseq	r9, r2, #256	; 0x100
     cd4:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
     cd8:	f500008a 			; <UNDEFINED> instruction: 0xf500008a
     cdc:	9e000007 	cdpls	0, 0, cr0, cr0, cr7, {0}
     ce0:	0d000002 	stceq	0, cr0, [r0, #-8]
     ce4:	31015101 	tstcc	r1, r1, lsl #2
     ce8:	0150010d 	cmpeq	r0, sp, lsl #2
     cec:	100c0040 	andne	r0, ip, r0, asr #32
     cf0:	e400008a 	str	r0, [r0], #-138	; 0x8a
     cf4:	b1000007 	tstlt	r0, r7
     cf8:	0d000002 	stceq	0, cr0, [r0, #-8]
     cfc:	40015001 	andmi	r5, r1, r1
     d00:	8a1c0e00 	bhi	704508 <__user_program+0x404508>
     d04:	00730000 	rsbseq	r0, r3, r0
     d08:	240c0000 	strcs	r0, [ip], #-0
     d0c:	a100008a 	smlabbge	r0, sl, r0, r0
     d10:	cd000007 	stcgt	0, cr0, [r0, #-28]	; 0xffffffe4
     d14:	0d000002 	stceq	0, cr0, [r0, #-8]
     d18:	40015001 	andmi	r5, r1, r1
     d1c:	8a2c0c00 	bhi	b03d24 <__user_program+0x803d24>
     d20:	00730000 	rsbseq	r0, r3, r0
     d24:	02e20000 	rsceq	r0, r2, #0
     d28:	010d0000 	mrseq	r0, (UNDEF: 13)
     d2c:	500a0350 	andpl	r0, sl, r0, asr r3
     d30:	340f00c3 	strcc	r0, [pc], #-195	; d38 <__start-0x72c8>
     d34:	e400008a 	str	r0, [r0], #-138	; 0x8a
     d38:	0d000007 	stceq	0, cr0, [r0, #-28]	; 0xffffffe4
     d3c:	40015001 	andmi	r5, r1, r1
     d40:	80050000 	andhi	r0, r5, r0
     d44:	01000003 	tsteq	r0, r3
     d48:	008a3871 	addeq	r3, sl, r1, ror r8
     d4c:	00011000 	andeq	r1, r1, r0
     d50:	809c0100 	addshi	r0, ip, r0, lsl #2
     d54:	0e000005 	cdpeq	0, 0, cr0, cr0, cr5, {0}
     d58:	00008a40 	andeq	r8, r0, r0, asr #20
     d5c:	00000271 	andeq	r0, r0, r1, ror r2
     d60:	008a4c0c 	addeq	r4, sl, ip, lsl #24
     d64:	0007f500 	andeq	pc, r7, r0, lsl #10
     d68:	00032800 	andeq	r2, r3, r0, lsl #16
     d6c:	51010d00 	tstpl	r1, r0, lsl #26
     d70:	010d3101 	tsteq	sp, r1, lsl #2
     d74:	00400150 	subeq	r0, r0, r0, asr r1
     d78:	008a580c 	addeq	r5, sl, ip, lsl #16
     d7c:	0007f500 	andeq	pc, r7, r0, lsl #10
     d80:	00034000 	andeq	r4, r3, r0
     d84:	51010d00 	tstpl	r1, r0, lsl #26
     d88:	010d3101 	tsteq	sp, r1, lsl #2
     d8c:	00390150 	eorseq	r0, r9, r0, asr r1
     d90:	008a600c 	addeq	r6, sl, ip
     d94:	0007e400 	andeq	lr, r7, r0, lsl #8
     d98:	00035300 	andeq	r5, r3, r0, lsl #6
     d9c:	50010d00 	andpl	r0, r1, r0, lsl #26
     da0:	0c004001 	stceq	0, cr4, [r0], {1}
     da4:	00008a68 	andeq	r8, r0, r8, ror #20
     da8:	000007a1 	andeq	r0, r0, r1, lsr #15
     dac:	00000366 	andeq	r0, r0, r6, ror #6
     db0:	0150010d 	cmpeq	r0, sp, lsl #2
     db4:	700c0039 	andvc	r0, ip, r9, lsr r0
     db8:	7300008a 	movwvc	r0, #138	; 0x8a
     dbc:	7b000000 	blvc	dc4 <__start-0x723c>
     dc0:	0d000003 	stceq	0, cr0, [r0, #-12]
     dc4:	0a035001 	beq	d4dd0 <__bss_end+0xa5dd0>
     dc8:	0c002710 	stceq	7, cr2, [r0], {16}
     dcc:	00008a7c 	andeq	r8, r0, ip, ror sl
     dd0:	0000080b 	andeq	r0, r0, fp, lsl #16
     dd4:	00000394 	muleq	r0, r4, r3
     dd8:	0251010d 	subseq	r0, r1, #1073741827	; 0x40000003
     ddc:	010d2008 	tsteq	sp, r8
     de0:	00300150 	eorseq	r0, r0, r0, asr r1
     de4:	008a840c 	addeq	r8, sl, ip, lsl #8
     de8:	00016b00 	andeq	r6, r1, r0, lsl #22
     dec:	0003a800 	andeq	sl, r3, r0, lsl #16
     df0:	50010d00 	andpl	r0, r1, r0, lsl #26
     df4:	00ae0902 	adceq	r0, lr, r2, lsl #18
     df8:	008a8c0c 	addeq	r8, sl, ip, lsl #24
     dfc:	00016b00 	andeq	r6, r1, r0, lsl #22
     e00:	0003bc00 	andeq	fp, r3, r0, lsl #24
     e04:	50010d00 	andpl	r0, r1, r0, lsl #26
     e08:	00d50902 	sbcseq	r0, r5, r2, lsl #18
     e0c:	008a940c 	addeq	r9, sl, ip, lsl #8
     e10:	00016b00 	andeq	r6, r1, r0, lsl #22
     e14:	0003d000 	andeq	sp, r3, r0
     e18:	50010d00 	andpl	r0, r1, r0, lsl #26
     e1c:	00800902 	addeq	r0, r0, r2, lsl #18
     e20:	008a9c0c 	addeq	r9, sl, ip, lsl #24
     e24:	00016b00 	andeq	r6, r1, r0, lsl #22
     e28:	0003e400 	andeq	lr, r3, r0, lsl #8
     e2c:	50010d00 	andpl	r0, r1, r0, lsl #26
     e30:	00a80902 	adceq	r0, r8, r2, lsl #18
     e34:	008aa40c 	addeq	sl, sl, ip, lsl #8
     e38:	00016b00 	andeq	r6, r1, r0, lsl #22
     e3c:	0003f700 	andeq	pc, r3, r0, lsl #14
     e40:	50010d00 	andpl	r0, r1, r0, lsl #26
     e44:	0c004f01 	stceq	15, cr4, [r0], {1}
     e48:	00008aac 	andeq	r8, r0, ip, lsr #21
     e4c:	0000016b 	andeq	r0, r0, fp, ror #2
     e50:	0000040b 	andeq	r0, r0, fp, lsl #8
     e54:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     e58:	0c00d309 	stceq	3, cr13, [r0], {9}
     e5c:	00008ab4 			; <UNDEFINED> instruction: 0x00008ab4
     e60:	0000016b 	andeq	r0, r0, fp, ror #2
     e64:	0000041e 	andeq	r0, r0, lr, lsl r4
     e68:	0150010d 	cmpeq	r0, sp, lsl #2
     e6c:	bc0c0030 	stclt	0, cr0, [ip], {48}	; 0x30
     e70:	6b00008a 	blvs	10a0 <__start-0x6f60>
     e74:	32000001 	andcc	r0, r0, #1
     e78:	0d000004 	stceq	0, cr0, [r0, #-16]
     e7c:	08025001 	stmdaeq	r2, {r0, ip, lr}
     e80:	c40c0040 	strgt	r0, [ip], #-64	; 0x40
     e84:	6b00008a 	blvs	10b4 <__start-0x6f4c>
     e88:	46000001 	strmi	r0, [r0], -r1
     e8c:	0d000004 	stceq	0, cr0, [r0, #-16]
     e90:	09025001 	stmdbeq	r2, {r0, ip, lr}
     e94:	cc0c008d 	stcgt	0, cr0, [ip], {141}	; 0x8d
     e98:	6b00008a 	blvs	10c8 <__start-0x6f38>
     e9c:	59000001 	stmdbpl	r0, {r0}
     ea0:	0d000004 	stceq	0, cr0, [r0, #-16]
     ea4:	44015001 	strmi	r5, [r1], #-1
     ea8:	8ad40c00 	bhi	ff503eb0 <__user_program+0xff203eb0>
     eac:	016b0000 	cmneq	fp, r0
     eb0:	046d0000 	strbteq	r0, [sp], #-0
     eb4:	010d0000 	mrseq	r0, (UNDEF: 13)
     eb8:	20080250 	andcs	r0, r8, r0, asr r2
     ebc:	8adc0c00 	bhi	ff703ec4 <__user_program+0xff403ec4>
     ec0:	016b0000 	cmneq	fp, r0
     ec4:	04800000 	streq	r0, [r0], #0
     ec8:	010d0000 	mrseq	r0, (UNDEF: 13)
     ecc:	00300150 	eorseq	r0, r0, r0, asr r1
     ed0:	008ae40c 	addeq	lr, sl, ip, lsl #8
     ed4:	00016b00 	andeq	r6, r1, r0, lsl #22
     ed8:	00049400 	andeq	r9, r4, r0, lsl #8
     edc:	50010d00 	andpl	r0, r1, r0, lsl #26
     ee0:	00a10902 	adceq	r0, r1, r2, lsl #18
     ee4:	008aec0c 	addeq	lr, sl, ip, lsl #24
     ee8:	00016b00 	andeq	r6, r1, r0, lsl #22
     eec:	0004a800 	andeq	sl, r4, r0, lsl #16
     ef0:	50010d00 	andpl	r0, r1, r0, lsl #26
     ef4:	00c80902 	sbceq	r0, r8, r2, lsl #18
     ef8:	008af40c 	addeq	pc, sl, ip, lsl #8
     efc:	00016b00 	andeq	r6, r1, r0, lsl #22
     f00:	0004bc00 	andeq	fp, r4, r0, lsl #24
     f04:	50010d00 	andpl	r0, r1, r0, lsl #26
     f08:	00da0902 	sbcseq	r0, sl, r2, lsl #18
     f0c:	008afc0c 	addeq	pc, sl, ip, lsl #24
     f10:	00016b00 	andeq	r6, r1, r0, lsl #22
     f14:	0004cf00 	andeq	ip, r4, r0, lsl #30
     f18:	50010d00 	andpl	r0, r1, r0, lsl #26
     f1c:	0c003201 	sfmeq	f3, 4, [r0], {1}
     f20:	00008b04 	andeq	r8, r0, r4, lsl #22
     f24:	0000016b 	andeq	r0, r0, fp, ror #2
     f28:	000004e3 	andeq	r0, r0, r3, ror #9
     f2c:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f30:	0c008109 	stfeqd	f0, [r0], {9}
     f34:	00008b0c 	andeq	r8, r0, ip, lsl #22
     f38:	0000016b 	andeq	r0, r0, fp, ror #2
     f3c:	000004f7 	strdeq	r0, [r0], -r7
     f40:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f44:	0c008f09 	stceq	15, cr8, [r0], {9}
     f48:	00008b14 	andeq	r8, r0, r4, lsl fp
     f4c:	0000016b 	andeq	r0, r0, fp, ror #2
     f50:	0000050b 	andeq	r0, r0, fp, lsl #10
     f54:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f58:	0c00d909 	stceq	9, cr13, [r0], {9}
     f5c:	00008b1c 	andeq	r8, r0, ip, lsl fp
     f60:	0000016b 	andeq	r0, r0, fp, ror #2
     f64:	0000051f 	andeq	r0, r0, pc, lsl r5
     f68:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f6c:	0c00f109 	stfeqd	f7, [r0], {9}
     f70:	00008b24 	andeq	r8, r0, r4, lsr #22
     f74:	0000016b 	andeq	r0, r0, fp, ror #2
     f78:	00000533 	andeq	r0, r0, r3, lsr r5
     f7c:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f80:	0c00db09 	stceq	11, cr13, [r0], {9}
     f84:	00008b2c 	andeq	r8, r0, ip, lsr #22
     f88:	0000016b 	andeq	r0, r0, fp, ror #2
     f8c:	00000547 	andeq	r0, r0, r7, asr #10
     f90:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f94:	0c004008 	stceq	0, cr4, [r0], {8}
     f98:	00008b34 	andeq	r8, r0, r4, lsr fp
     f9c:	0000016b 	andeq	r0, r0, fp, ror #2
     fa0:	0000055b 	andeq	r0, r0, fp, asr r5
     fa4:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     fa8:	0c00a409 	cfstrseq	mvf10, [r0], {9}
     fac:	00008b3c 	andeq	r8, r0, ip, lsr fp
     fb0:	0000016b 	andeq	r0, r0, fp, ror #2
     fb4:	0000056f 	andeq	r0, r0, pc, ror #10
     fb8:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     fbc:	0f00a609 	svceq	0x0000a609
     fc0:	00008b44 	andeq	r8, r0, r4, asr #22
     fc4:	0000016b 	andeq	r0, r0, fp, ror #2
     fc8:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     fcc:	0000af09 	andeq	sl, r0, r9, lsl #30
     fd0:	0005c405 	andeq	ip, r5, r5, lsl #8
     fd4:	48970100 	ldmmi	r7, {r8}
     fd8:	3800008b 	stmdacc	r0, {r0, r1, r3, r7}
     fdc:	01000000 	mrseq	r0, (UNDEF: 0)
     fe0:	0006079c 	muleq	r6, ip, r7
     fe4:	8b540c00 	blhi	1503fec <__user_program+0x1203fec>
     fe8:	016b0000 	cmneq	fp, r0
     fec:	05a90000 	streq	r0, [r9, #0]!
     ff0:	010d0000 	mrseq	r0, (UNDEF: 13)
     ff4:	21080250 	tstcs	r8, r0, asr r2
     ff8:	8b5c0c00 	blhi	1704000 <__user_program+0x1404000>
     ffc:	016b0000 	cmneq	fp, r0
    1000:	05bc0000 	ldreq	r0, [ip, #0]!
    1004:	010d0000 	mrseq	r0, (UNDEF: 13)
    1008:	00300150 	eorseq	r0, r0, r0, asr r1
    100c:	008b640c 	addeq	r6, fp, ip, lsl #8
    1010:	00016b00 	andeq	r6, r1, r0, lsl #22
    1014:	0005d000 	andeq	sp, r5, r0
    1018:	50010d00 	andpl	r0, r1, r0, lsl #26
    101c:	007f0802 	rsbseq	r0, pc, r2, lsl #16
    1020:	008b6c0c 	addeq	r6, fp, ip, lsl #24
    1024:	00016b00 	andeq	r6, r1, r0, lsl #22
    1028:	0005e400 	andeq	lr, r5, r0, lsl #8
    102c:	50010d00 	andpl	r0, r1, r0, lsl #26
    1030:	00220802 	eoreq	r0, r2, r2, lsl #16
    1034:	008b740c 	addeq	r7, fp, ip, lsl #8
    1038:	00016b00 	andeq	r6, r1, r0, lsl #22
    103c:	0005f700 	andeq	pc, r5, r0, lsl #14
    1040:	50010d00 	andpl	r0, r1, r0, lsl #26
    1044:	0f003001 	svceq	0x00003001
    1048:	00008b7c 	andeq	r8, r0, ip, ror fp
    104c:	0000016b 	andeq	r0, r0, fp, ror #2
    1050:	0150010d 	cmpeq	r0, sp, lsl #2
    1054:	0a000033 	beq	1128 <__start-0x6ed8>
    1058:	00000563 	andeq	r0, r0, r3, ror #10
    105c:	00413001 	subeq	r3, r1, r1
    1060:	8b800000 	blhi	fe001068 <__user_program+0xfdd01068>
    1064:	00440000 	subeq	r0, r4, r0
    1068:	9c010000 	stcls	0, cr0, [r1], {-0}
    106c:	00000677 	andeq	r0, r0, r7, ror r6
    1070:	00058e09 	andeq	r8, r5, r9, lsl #28
    1074:	33320100 	teqcc	r2, #0, 2
    1078:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
    107c:	0e000009 	cdpeq	0, 0, cr0, cr0, cr9, {0}
    1080:	00008b88 	andeq	r8, r0, r8, lsl #23
    1084:	00000580 	andeq	r0, r0, r0, lsl #11
    1088:	008b900c 	addeq	r9, fp, ip
    108c:	0007e400 	andeq	lr, r7, r0, lsl #8
    1090:	00064b00 	andeq	r4, r6, r0, lsl #22
    1094:	50010d00 	andpl	r0, r1, r0, lsl #26
    1098:	0c003901 	stceq	9, cr3, [r0], {1}
    109c:	00008b9c 	muleq	r0, ip, fp
    10a0:	000007b2 			; <UNDEFINED> instruction: 0x000007b2
    10a4:	00000664 	andeq	r0, r0, r4, ror #12
    10a8:	0251010d 	subseq	r0, r1, #1073741827	; 0x40000003
    10ac:	010d2008 	tsteq	sp, r8
    10b0:	00300150 	eorseq	r0, r0, r0, asr r1
    10b4:	008bac0e 	addeq	sl, fp, lr, lsl #24
    10b8:	0007c800 	andeq	ip, r7, r0, lsl #16
    10bc:	8bb80e00 	blhi	fee048c4 <__user_program+0xfeb048c4>
    10c0:	07dd0000 	ldrbeq	r0, [sp, r0]
    10c4:	05000000 	streq	r0, [r0, #-0]
    10c8:	00000552 	andeq	r0, r0, r2, asr r5
    10cc:	8bc45b01 	blhi	ff117cd8 <__user_program+0xfee17cd8>
    10d0:	00600000 	rsbeq	r0, r0, r0
    10d4:	9c010000 	stcls	0, cr0, [r1], {-0}
    10d8:	000006f2 	strdeq	r0, [r0], -r2
    10dc:	0100690b 	tsteq	r0, fp, lsl #18
    10e0:	0000335c 	andeq	r3, r0, ip, asr r3
    10e4:	0009a500 	andeq	sl, r9, r0, lsl #10
    10e8:	6e631000 	cdpvs	0, 6, cr1, cr3, cr0, {0}
    10ec:	5d010074 	stcpl	0, cr0, [r1, #-464]	; 0xfffffe30
    10f0:	00000033 	andeq	r0, r0, r3, lsr r0
    10f4:	d0040305 	andle	r0, r4, r5, lsl #6
    10f8:	cc0e0000 	stcgt	0, cr0, [lr], {-0}
    10fc:	8000008b 	andhi	r0, r0, fp, lsl #1
    1100:	0c000005 	stceq	0, cr0, [r0], {5}
    1104:	00008bd4 	ldrdeq	r8, [r0], -r4
    1108:	000007e4 	andeq	r0, r0, r4, ror #15
    110c:	000006c6 	andeq	r0, r0, r6, asr #13
    1110:	0150010d 	cmpeq	r0, sp, lsl #2
    1114:	e00c0039 	and	r0, ip, r9, lsr r0
    1118:	b200008b 	andlt	r0, r0, #139	; 0x8b
    111c:	df000007 	svcle	0x00000007
    1120:	0d000006 	stceq	0, cr0, [r0, #-24]	; 0xffffffe8
    1124:	08025101 	stmdaeq	r2, {r0, r8, ip, lr}
    1128:	50010d20 	andpl	r0, r1, r0, lsr #26
    112c:	0e003001 	cdpeq	0, 0, cr3, cr0, cr1, {0}
    1130:	00008c00 	andeq	r8, r0, r0, lsl #24
    1134:	000007c8 	andeq	r0, r0, r8, asr #15
    1138:	008c0c0e 	addeq	r0, ip, lr, lsl #24
    113c:	0007dd00 	andeq	sp, r7, r0, lsl #26
    1140:	35050000 	strcc	r0, [r5, #-0]
    1144:	01000002 	tsteq	r0, r2
    1148:	008c2467 	addeq	r2, ip, r7, ror #8
    114c:	00003c00 	andeq	r3, r0, r0, lsl #24
    1150:	679c0100 	ldrvs	r0, [ip, r0, lsl #2]
    1154:	0b000007 	bleq	1178 <__start-0x6e88>
    1158:	68010069 	stmdavs	r1, {r0, r3, r5, r6}
    115c:	00000033 	andeq	r0, r0, r3, lsr r0
    1160:	000009ec 	andeq	r0, r0, ip, ror #19
    1164:	008c2c0e 	addeq	r2, ip, lr, lsl #24
    1168:	00058000 	andeq	r8, r5, r0
    116c:	8c340c00 	ldchi	12, cr0, [r4], #-0
    1170:	07e40000 	strbeq	r0, [r4, r0]!
    1174:	07300000 	ldreq	r0, [r0, -r0]!
    1178:	010d0000 	mrseq	r0, (UNDEF: 13)
    117c:	00390150 	eorseq	r0, r9, r0, asr r1
    1180:	008c400c 	addeq	r4, ip, ip
    1184:	0007b200 	andeq	fp, r7, r0, lsl #4
    1188:	00074900 	andeq	r4, r7, r0, lsl #18
    118c:	51010d00 	tstpl	r1, r0, lsl #26
    1190:	0d200802 	stceq	8, cr0, [r0, #-8]!
    1194:	30015001 	andcc	r5, r1, r1
    1198:	8c500c00 	mrrchi	12, 0, r0, r0, cr0	; <UNPREDICTABLE>
    119c:	07c80000 	strbeq	r0, [r8, r0]
    11a0:	075d0000 	ldrbeq	r0, [sp, -r0]
    11a4:	010d0000 	mrseq	r0, (UNDEF: 13)
    11a8:	00750250 	rsbseq	r0, r5, r0, asr r2
    11ac:	8c5c0e00 	mrrchi	14, 0, r0, ip, cr0
    11b0:	07dd0000 	ldrbeq	r0, [sp, r0]
    11b4:	11000000 	mrsne	r0, (UNDEF: 0)
    11b8:	00746e63 	rsbseq	r6, r4, r3, ror #28
    11bc:	00410601 	subeq	r0, r1, r1, lsl #12
    11c0:	03050000 	movweq	r0, #20480	; 0x5000
    11c4:	0000c004 	andeq	ip, r0, r4
    11c8:	00004112 	andeq	r4, r0, r2, lsl r1
    11cc:	00078900 	andeq	r8, r7, r0, lsl #18
    11d0:	07891300 	streq	r1, [r9, r0, lsl #6]
    11d4:	01ff0000 	mvnseq	r0, r0
    11d8:	07040200 	streq	r0, [r4, -r0, lsl #4]
    11dc:	0000034f 	andeq	r0, r0, pc, asr #6
    11e0:	00059414 	andeq	r9, r5, r4, lsl r4
    11e4:	780e0100 	stmdavc	lr, {r8}
    11e8:	05000007 	streq	r0, [r0, #-7]
    11ec:	00d01003 	sbcseq	r1, r0, r3
    11f0:	00611500 	rsbeq	r1, r1, r0, lsl #10
    11f4:	43030000 	movwmi	r0, #12288	; 0x3000
    11f8:	000007b2 			; <UNDEFINED> instruction: 0x000007b2
    11fc:	00004116 	andeq	r4, r0, r6, lsl r1
    1200:	a7150000 	ldrge	r0, [r5, -r0]
    1204:	04000005 	streq	r0, [r0], #-5
    1208:	0007c874 	andeq	ip, r7, r4, ror r8
    120c:	00411600 	subeq	r1, r1, r0, lsl #12
    1210:	5a160000 	bpl	581218 <__user_program+0x281218>
    1214:	00000000 	andeq	r0, r0, r0
    1218:	00057117 	andeq	r7, r5, r7, lsl r1
    121c:	41820400 	orrmi	r0, r2, r0, lsl #8
    1220:	dd000000 	stcle	0, cr0, [r0, #-0]
    1224:	16000007 	strne	r0, [r0], -r7
    1228:	00000041 	andeq	r0, r0, r1, asr #32
    122c:	05261800 	streq	r1, [r6, #-2048]!	; 0x800
    1230:	7a040000 	bvc	101238 <__bss_end+0xd2238>
    1234:	00004115 	andeq	r4, r0, r5, lsl r1
    1238:	f53d0300 			; <UNDEFINED> instruction: 0xf53d0300
    123c:	16000007 	strne	r0, [r0], -r7
    1240:	00000041 	andeq	r0, r0, r1, asr #32
    1244:	012c1500 	teqeq	ip, r0, lsl #10
    1248:	37030000 	strcc	r0, [r3, -r0]
    124c:	0000080b 	andeq	r0, r0, fp, lsl #16
    1250:	00004116 	andeq	r4, r0, r6, lsl r1
    1254:	00411600 	subeq	r1, r1, r0, lsl #12
    1258:	19000000 	stmdbne	r0, {}	; <UNPREDICTABLE>
    125c:	0000057e 	andeq	r0, r0, lr, ror r5
    1260:	5a166e04 	bpl	59ca78 <__user_program+0x29ca78>
    1264:	16000000 	strne	r0, [r0], -r0
    1268:	0000005a 	andeq	r0, r0, sl, asr r0
    126c:	01650000 	cmneq	r5, r0
    1270:	00040000 	andeq	r0, r4, r0
    1274:	00000639 	andeq	r0, r0, r9, lsr r6
    1278:	03b10104 			; <UNDEFINED> instruction: 0x03b10104
    127c:	04010000 	streq	r0, [r1], #-0
    1280:	58000006 	stmdapl	r0, {r1, r2}
    1284:	60000003 	andvs	r0, r0, r3
    1288:	ec00008c 	stc	0, cr0, [r0], {140}	; 0x8c
    128c:	41000000 	mrsmi	r0, (UNDEF: 0)
    1290:	02000004 	andeq	r0, r0, #4
    1294:	00820801 	addeq	r0, r2, r1, lsl #16
    1298:	02020000 	andeq	r0, r2, #0
    129c:	00013805 	andeq	r3, r1, r5, lsl #16
    12a0:	05040300 	streq	r0, [r4, #-768]	; 0x300
    12a4:	00746e69 	rsbseq	r6, r4, r9, ror #28
    12a8:	00050802 	andeq	r0, r5, r2, lsl #16
    12ac:	04000000 	streq	r0, [r0], #-0
    12b0:	00000071 	andeq	r0, r0, r1, ror r0
    12b4:	004c1602 	subeq	r1, ip, r2, lsl #12
    12b8:	01020000 	mrseq	r0, (UNDEF: 2)
    12bc:	00007908 	andeq	r7, r0, r8, lsl #18
    12c0:	07020200 	streq	r0, [r2, -r0, lsl #4]
    12c4:	00000090 	muleq	r0, r0, r0
    12c8:	00008704 	andeq	r8, r0, r4, lsl #14
    12cc:	651a0200 	ldrvs	r0, [sl, #-512]	; 0x200
    12d0:	02000000 	andeq	r0, r0, #0
    12d4:	00540704 	subseq	r0, r4, r4, lsl #14
    12d8:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    12dc:	00004a07 	andeq	r4, r0, r7, lsl #20
    12e0:	02160500 	andseq	r0, r6, #0, 10
    12e4:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
    12e8:	00008c60 	andeq	r8, r0, r0, ror #24
    12ec:	0000006c 	andeq	r0, r0, ip, rrx
    12f0:	00e59c01 	rsceq	r9, r5, r1, lsl #24
    12f4:	70060000 	andvc	r0, r6, r0
    12f8:	4000008c 	andmi	r0, r0, ip, lsl #1
    12fc:	a0000001 	andge	r0, r0, r1
    1300:	07000000 	streq	r0, [r0, -r0]
    1304:	30015101 	andcc	r5, r1, r1, lsl #2
    1308:	01500107 	cmpeq	r0, r7, lsl #2
    130c:	7c06003f 	stcvc	0, cr0, [r6], {63}	; 0x3f
    1310:	4000008c 	andmi	r0, r0, ip, lsl #1
    1314:	b8000001 	stmdalt	r0, {r0}
    1318:	07000000 	streq	r0, [r0, -r0]
    131c:	30015101 	andcc	r5, r1, r1, lsl #2
    1320:	01500107 	cmpeq	r0, r7, lsl #2
    1324:	8806003e 	stmdahi	r6, {r1, r2, r3, r4, r5}
    1328:	5600008c 	strpl	r0, [r0], -ip, lsl #1
    132c:	d0000001 	andle	r0, r0, r1
    1330:	07000000 	streq	r0, [r0, -r0]
    1334:	32015101 	andcc	r5, r1, #1073741824	; 0x40000000
    1338:	01500107 	cmpeq	r0, r7, lsl #2
    133c:	9408003f 	strls	r0, [r8], #-63	; 0x3f
    1340:	5600008c 	strpl	r0, [r0], -ip, lsl #1
    1344:	07000001 	streq	r0, [r0, -r1]
    1348:	32015101 	andcc	r5, r1, #1073741824	; 0x40000000
    134c:	01500107 	cmpeq	r0, r7, lsl #2
    1350:	0900003e 	stmdbeq	r0, {r1, r2, r3, r4, r5}
    1354:	00000616 	andeq	r0, r0, r6, lsl r6
    1358:	8ccc2701 	stclhi	7, cr2, [ip], {1}
    135c:	00200000 	eoreq	r0, r0, r0
    1360:	9c010000 	stcls	0, cr0, [r1], {-0}
    1364:	00049705 	andeq	r9, r4, r5, lsl #14
    1368:	ec2d0100 	stfs	f0, [sp], #-0
    136c:	2400008c 	strcs	r0, [r0], #-140	; 0x8c
    1370:	01000000 	mrseq	r0, (UNDEF: 0)
    1374:	0001199c 	muleq	r1, ip, r9
    1378:	05ff0a00 	ldrbeq	r0, [pc, #2560]!	; 1d80 <__start-0x6280>
    137c:	2d010000 	stccs	0, cr0, [r1, #-0]
    1380:	00000041 	andeq	r0, r0, r1, asr #32
    1384:	0b005001 	bleq	15390 <threads+0x178>
    1388:	000005f6 	strdeq	r0, [r0], -r6
    138c:	00413301 	subeq	r3, r1, r1, lsl #6
    1390:	8d100000 	ldchi	0, cr0, [r0, #-0]
    1394:	003c0000 	eorseq	r0, ip, r0
    1398:	9c010000 	stcls	0, cr0, [r1], {-0}
    139c:	00000140 	andeq	r0, r0, r0, asr #2
    13a0:	7465720c 	strbtvc	r7, [r5], #-524	; 0x20c
    13a4:	41370100 	teqmi	r7, r0, lsl #2
    13a8:	01000000 	mrseq	r0, (UNDEF: 0)
    13ac:	0e0d0050 	mcreq	0, 0, r0, cr13, cr0, {2}
    13b0:	03000000 	movweq	r0, #0
    13b4:	0001564b 	andeq	r5, r1, fp, asr #12
    13b8:	00410e00 	subeq	r0, r1, r0, lsl #28
    13bc:	410e0000 	mrsmi	r0, (UNDEF: 14)
    13c0:	00000000 	andeq	r0, r0, r0
    13c4:	00012c0f 	andeq	r2, r1, pc, lsl #24
    13c8:	0e370300 	cdpeq	3, 3, cr0, cr7, cr0, {0}
    13cc:	00000041 	andeq	r0, r0, r1, asr #32
    13d0:	0000410e 	andeq	r4, r0, lr, lsl #2
    13d4:	b6000000 	strlt	r0, [r0], -r0
    13d8:	04000001 	streq	r0, [r0], #-1
    13dc:	00072b00 	andeq	r2, r7, r0, lsl #22
    13e0:	b1010400 	tstlt	r1, r0, lsl #8
    13e4:	01000003 	tsteq	r0, r3
    13e8:	00000621 	andeq	r0, r0, r1, lsr #12
    13ec:	00000358 	andeq	r0, r0, r8, asr r3
    13f0:	00008d4c 	andeq	r8, r0, ip, asr #26
    13f4:	00000218 	andeq	r0, r0, r8, lsl r2
    13f8:	000004cb 	andeq	r0, r0, fp, asr #9
    13fc:	82080102 	andhi	r0, r8, #-2147483648	; 0x80000000
    1400:	02000000 	andeq	r0, r0, #0
    1404:	01380502 	teqeq	r8, r2, lsl #10
    1408:	04030000 	streq	r0, [r3], #-0
    140c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
    1410:	05080200 	streq	r0, [r8, #-512]	; 0x200
    1414:	00000000 	andeq	r0, r0, r0
    1418:	00007104 	andeq	r7, r0, r4, lsl #2
    141c:	4c160200 	lfmmi	f0, 4, [r6], {-0}
    1420:	02000000 	andeq	r0, r0, #0
    1424:	00790801 	rsbseq	r0, r9, r1, lsl #16
    1428:	8a040000 	bhi	101430 <__bss_end+0xd2430>
    142c:	02000003 	andeq	r0, r0, #3
    1430:	00005e18 	andeq	r5, r0, r8, lsl lr
    1434:	07020200 	streq	r0, [r2, -r0, lsl #4]
    1438:	00000090 	muleq	r0, r0, r0
    143c:	00008704 	andeq	r8, r0, r4, lsl #14
    1440:	701a0200 	andsvc	r0, sl, r0, lsl #4
    1444:	02000000 	andeq	r0, r0, #0
    1448:	00540704 	subseq	r0, r4, r4, lsl #14
    144c:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1450:	00004a07 	andeq	r4, r0, r7, lsl #20
    1454:	02060500 	andeq	r0, r6, #0, 10
    1458:	16010000 	strne	r0, [r1], -r0
    145c:	00008d4c 	andeq	r8, r0, ip, asr #26
    1460:	00000068 	andeq	r0, r0, r8, rrx
    1464:	00ff9c01 	rscseq	r9, pc, r1, lsl #24
    1468:	63060000 	movwvs	r0, #24576	; 0x6000
    146c:	01006b6c 	tsteq	r0, ip, ror #22
    1470:	00005316 	andeq	r5, r0, r6, lsl r3
    1474:	000a3300 	andeq	r3, sl, r0, lsl #6
    1478:	8d600700 	stclhi	7, cr0, [r0, #-0]
    147c:	01910000 	orrseq	r0, r1, r0
    1480:	00ba0000 	adcseq	r0, sl, r0
    1484:	01080000 	mrseq	r0, (UNDEF: 8)
    1488:	08320151 	ldmdaeq	r2!, {r0, r4, r6, r8}
    148c:	32015001 	andcc	r5, r1, #1
    1490:	8d6c0700 	stclhi	7, cr0, [ip, #-0]
    1494:	01910000 	orrseq	r0, r1, r0
    1498:	00d20000 	sbcseq	r0, r2, r0
    149c:	01080000 	mrseq	r0, (UNDEF: 8)
    14a0:	08320151 	ldmdaeq	r2!, {r0, r4, r6, r8}
    14a4:	33015001 	movwcc	r5, #4097	; 0x1001
    14a8:	8d780700 	ldclhi	7, cr0, [r8, #-0]
    14ac:	01a70000 			; <UNDEFINED> instruction: 0x01a70000
    14b0:	00ea0000 	rsceq	r0, sl, r0
    14b4:	01080000 	mrseq	r0, (UNDEF: 8)
    14b8:	08340151 	ldmdaeq	r4!, {r0, r4, r6, r8}
    14bc:	32015001 	andcc	r5, r1, #1
    14c0:	8d840900 	stchi	9, cr0, [r4]
    14c4:	01a70000 			; <UNDEFINED> instruction: 0x01a70000
    14c8:	01080000 	mrseq	r0, (UNDEF: 8)
    14cc:	08340151 	ldmdaeq	r4!, {r0, r4, r6, r8}
    14d0:	33015001 	movwcc	r5, #4097	; 0x1001
    14d4:	470a0000 	strmi	r0, [sl, -r0]
    14d8:	01000006 	tsteq	r0, r6
    14dc:	0000412b 	andeq	r4, r0, fp, lsr #2
    14e0:	008db400 	addeq	fp, sp, r0, lsl #8
    14e4:	0000e000 	andeq	lr, r0, r0
    14e8:	469c0100 	ldrmi	r0, [ip], r0, lsl #2
    14ec:	06000001 	streq	r0, [r0], -r1
    14f0:	00667562 	rsbeq	r7, r6, r2, ror #10
    14f4:	01462b01 	cmpeq	r6, r1, lsl #22
    14f8:	0a540000 	beq	1501500 <__user_program+0x1201500>
    14fc:	6c060000 	stcvs	0, cr0, [r6], {-0}
    1500:	01006e65 	tsteq	r0, r5, ror #28
    1504:	0000532b 	andeq	r5, r0, fp, lsr #6
    1508:	000a9500 	andeq	r9, sl, r0, lsl #10
    150c:	06320b00 	ldrteq	r0, [r2], -r0, lsl #22
    1510:	2b010000 	blcs	41518 <__bss_end+0x12518>
    1514:	00000041 	andeq	r0, r0, r1, asr #32
    1518:	00000ab3 			; <UNDEFINED> instruction: 0x00000ab3
    151c:	41040c00 	tstmi	r4, r0, lsl #24
    1520:	0a000000 	beq	1528 <__start-0x6ad8>
    1524:	00000637 	andeq	r0, r0, r7, lsr r6
    1528:	00415001 	subeq	r5, r1, r1
    152c:	8e940000 	cdphi	0, 9, cr0, cr4, cr0, {0}
    1530:	00d00000 	sbcseq	r0, r0, r0
    1534:	9c010000 	stcls	0, cr0, [r1], {-0}
    1538:	00000191 	muleq	r0, r1, r1
    153c:	66756206 	ldrbtvs	r6, [r5], -r6, lsl #4
    1540:	46500100 	ldrbmi	r0, [r0], -r0, lsl #2
    1544:	d4000001 	strle	r0, [r0], #-1
    1548:	0d00000a 	stceq	0, cr0, [r0, #-40]	; 0xffffffd8
    154c:	006e656c 	rsbeq	r6, lr, ip, ror #10
    1550:	00535001 	subseq	r5, r3, r1
    1554:	51010000 	mrspl	r0, (UNDEF: 1)
    1558:	0006320b 	andeq	r3, r6, fp, lsl #4
    155c:	41500100 	cmpmi	r0, r0, lsl #2
    1560:	16000000 	strne	r0, [r0], -r0
    1564:	0000000b 	andeq	r0, r0, fp
    1568:	00000e0e 	andeq	r0, r0, lr, lsl #28
    156c:	a74b0300 	strbge	r0, [fp, -r0, lsl #6]
    1570:	0f000001 	svceq	0x00000001
    1574:	00000041 	andeq	r0, r0, r1, asr #32
    1578:	0000410f 	andeq	r4, r0, pc, lsl #2
    157c:	2c100000 	ldccs	0, cr0, [r0], {-0}
    1580:	03000001 	movweq	r0, #1
    1584:	00410f37 	subeq	r0, r1, r7, lsr pc
    1588:	410f0000 	mrsmi	r0, CPSR
    158c:	00000000 	andeq	r0, r0, r0
    1590:	0001db00 	andeq	sp, r1, r0, lsl #22
    1594:	1d000400 	cfstrsne	mvf0, [r0, #-0]
    1598:	04000008 	streq	r0, [r0], #-8
    159c:	0003b101 	andeq	fp, r3, r1, lsl #2
    15a0:	06880100 	streq	r0, [r8], r0, lsl #2
    15a4:	03580000 	cmpeq	r8, #0
    15a8:	8f640000 	svchi	0x00640000
    15ac:	00ac0000 	adceq	r0, ip, r0
    15b0:	05770000 	ldrbeq	r0, [r7, #-0]!
    15b4:	01020000 	mrseq	r0, (UNDEF: 2)
    15b8:	00008208 	andeq	r8, r0, r8, lsl #4
    15bc:	05020200 	streq	r0, [r2, #-512]	; 0x200
    15c0:	00000138 	andeq	r0, r0, r8, lsr r1
    15c4:	69050403 	stmdbvs	r5, {r0, r1, sl}
    15c8:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    15cc:	00000508 	andeq	r0, r0, r8, lsl #10
    15d0:	71040000 	mrsvc	r0, (UNDEF: 4)
    15d4:	02000000 	andeq	r0, r0, #0
    15d8:	00004c16 	andeq	r4, r0, r6, lsl ip
    15dc:	08010200 	stmdaeq	r1, {r9}
    15e0:	00000079 	andeq	r0, r0, r9, ror r0
    15e4:	00038a04 	andeq	r8, r3, r4, lsl #20
    15e8:	5e180200 	cdppl	2, 1, cr0, cr8, cr0, {0}
    15ec:	02000000 	andeq	r0, r0, #0
    15f0:	00900702 	addseq	r0, r0, r2, lsl #14
    15f4:	04020000 	streq	r0, [r2], #-0
    15f8:	00005407 	andeq	r5, r0, r7, lsl #8
    15fc:	07080200 	streq	r0, [r8, -r0, lsl #4]
    1600:	0000004a 	andeq	r0, r0, sl, asr #32
    1604:	00066f05 	andeq	r6, r6, r5, lsl #30
    1608:	64110100 	ldrvs	r0, [r1], #-256	; 0x100
    160c:	1400008f 	strne	r0, [r0], #-143	; 0x8f
    1610:	01000000 	mrseq	r0, (UNDEF: 0)
    1614:	06a5069c 	ssateq	r0, #6, ip, lsl #13
    1618:	1d010000 	stcne	0, cr0, [r1, #-0]
    161c:	00000053 	andeq	r0, r0, r3, asr r0
    1620:	00008f78 	andeq	r8, r0, r8, ror pc
    1624:	00000098 	muleq	r0, r8, r0
    1628:	01569c01 	cmpeq	r6, r1, lsl #24
    162c:	9d070000 	stcls	0, cr0, [r7, #-0]
    1630:	01000006 	tsteq	r0, r6
    1634:	0000411d 	andeq	r4, r0, sp, lsl r1
    1638:	000b3700 	andeq	r3, fp, r0, lsl #14
    163c:	06580800 	ldrbeq	r0, [r8], -r0, lsl #16
    1640:	1f010000 	svcne	0x00010000
    1644:	00000156 	andeq	r0, r0, r6, asr r1
    1648:	09749102 	ldmdbeq	r4!, {r1, r8, ip, pc}^
    164c:	21010078 	tstcs	r1, r8, ror r0
    1650:	00000041 	andeq	r0, r0, r1, asr #32
    1654:	00000b58 	andeq	r0, r0, r8, asr fp
    1658:	00066608 	andeq	r6, r6, r8, lsl #12
    165c:	6d220100 	stfvss	f0, [r2, #-0]
    1660:	02000001 	andeq	r0, r0, #1
    1664:	780a7091 	stmdavc	sl, {r0, r4, r7, ip, sp, lr}
    1668:	01000006 	tsteq	r0, r6
    166c:	00005332 	andeq	r5, r0, r2, lsr r3
    1670:	000b6b00 	andeq	r6, fp, r0, lsl #22
    1674:	8fa00b00 	svchi	0x00a00b00
    1678:	00480000 	subeq	r0, r8, r0
    167c:	013a0000 	teqeq	sl, r0
    1680:	ae080000 	cdpge	0, 0, cr0, cr8, cr0, {0}
    1684:	01000006 	tsteq	r0, r6
    1688:	00017d25 	andeq	r7, r1, r5, lsr #26
    168c:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1690:	008fc80c 	addeq	ip, pc, ip, lsl #16
    1694:	00019e00 	andeq	r9, r1, r0, lsl #28
    1698:	00011e00 	andeq	r1, r1, r0, lsl #28
    169c:	52010d00 	andpl	r0, r1, #0, 26
    16a0:	0d490802 	stcleq	8, cr0, [r9, #-8]
    16a4:	33015101 	movwcc	r5, #4353	; 0x1101
    16a8:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
    16ac:	0e006491 	mcreq	4, 0, r6, cr0, cr1, {4}
    16b0:	00008fe8 	andeq	r8, r0, r8, ror #31
    16b4:	0000019e 	muleq	r0, lr, r1
    16b8:	0252010d 	subseq	r0, r2, #1073741827	; 0x40000003
    16bc:	010d4908 	tsteq	sp, r8, lsl #18
    16c0:	0d310151 	ldfeqs	f0, [r1, #-324]!	; 0xfffffebc
    16c4:	91025001 	tstls	r2, r1
    16c8:	0e00006c 	cdpeq	0, 0, cr0, cr0, cr12, {3}
    16cc:	00008ff8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
    16d0:	000001c3 	andeq	r0, r0, r3, asr #3
    16d4:	0252010d 	subseq	r0, r2, #1073741827	; 0x40000003
    16d8:	010d4908 	tsteq	sp, r8, lsl #18
    16dc:	0d320151 	ldfeqs	f0, [r2, #-324]!	; 0xfffffebc
    16e0:	91025001 	tstls	r2, r1
    16e4:	0f000068 	svceq	0x00000068
    16e8:	00000041 	andeq	r0, r0, r1, asr #32
    16ec:	00000166 	andeq	r0, r0, r6, ror #2
    16f0:	00016610 	andeq	r6, r1, r0, lsl r6
    16f4:	02000000 	andeq	r0, r0, #0
    16f8:	034f0704 	movteq	r0, #63236	; 0xf704
    16fc:	410f0000 	mrsmi	r0, CPSR
    1700:	7d000000 	stcvc	0, cr0, [r0, #-0]
    1704:	10000001 	andne	r0, r0, r1
    1708:	00000166 	andeq	r0, r0, r6, ror #2
    170c:	410f0001 	tstmi	pc, r1
    1710:	8d000000 	stchi	0, cr0, [r0, #-0]
    1714:	10000001 	andne	r0, r0, r1
    1718:	00000166 	andeq	r0, r0, r6, ror #2
    171c:	80110002 	andshi	r0, r1, r2
    1720:	01000006 	tsteq	r0, r6
    1724:	00003310 	andeq	r3, r0, r0, lsl r3
    1728:	10030500 	andne	r0, r3, r0, lsl #10
    172c:	120000d2 	andne	r0, r0, #210	; 0xd2
    1730:	00000647 	andeq	r0, r0, r7, asr #12
    1734:	00414203 	subeq	r4, r1, r3, lsl #4
    1738:	01bd0000 			; <UNDEFINED> instruction: 0x01bd0000
    173c:	bd130000 	ldclt	0, cr0, [r3, #-0]
    1740:	13000001 	movwne	r0, #1
    1744:	00000053 	andeq	r0, r0, r3, asr r0
    1748:	00004113 	andeq	r4, r0, r3, lsl r1
    174c:	04140000 	ldreq	r0, [r4], #-0
    1750:	00000041 	andeq	r0, r0, r1, asr #32
    1754:	00063715 	andeq	r3, r6, r5, lsl r7
    1758:	414b0300 	mrsmi	r0, (UNDEF: 123)
    175c:	13000000 	movwne	r0, #0
    1760:	000001bd 			; <UNDEFINED> instruction: 0x000001bd
    1764:	00005313 	andeq	r5, r0, r3, lsl r3
    1768:	00411300 	subeq	r1, r1, r0, lsl #6
    176c:	00000000 	andeq	r0, r0, r0
    1770:	00000935 	andeq	r0, r0, r5, lsr r9
    1774:	094e0004 	stmdbeq	lr, {r2}^
    1778:	01040000 	mrseq	r0, (UNDEF: 4)
    177c:	000003b1 			; <UNDEFINED> instruction: 0x000003b1
    1780:	00073e01 	andeq	r3, r7, r1, lsl #28
    1784:	00035800 	andeq	r5, r3, r0, lsl #16
    1788:	00901000 	addseq	r1, r0, r0
    178c:	000c0400 	andeq	r0, ip, r0, lsl #8
    1790:	00060000 	andeq	r0, r6, r0
    1794:	08010200 	stmdaeq	r1, {r9}
    1798:	00000082 	andeq	r0, r0, r2, lsl #1
    179c:	38050202 	stmdacc	r5, {r1, r9}
    17a0:	03000001 	movweq	r0, #1
    17a4:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    17a8:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
    17ac:	00000005 	andeq	r0, r0, r5
    17b0:	00710400 	rsbseq	r0, r1, r0, lsl #8
    17b4:	16020000 	strne	r0, [r2], -r0
    17b8:	0000004c 	andeq	r0, r0, ip, asr #32
    17bc:	79080102 	stmdbvc	r8, {r1, r8}
    17c0:	02000000 	andeq	r0, r0, #0
    17c4:	00900702 	addseq	r0, r0, r2, lsl #14
    17c8:	87040000 	strhi	r0, [r4, -r0]
    17cc:	02000000 	andeq	r0, r0, #0
    17d0:	0000651a 	andeq	r6, r0, sl, lsl r5
    17d4:	07040200 	streq	r0, [r4, -r0, lsl #4]
    17d8:	00000054 	andeq	r0, r0, r4, asr r0
    17dc:	4a070802 	bmi	1c37ec <__end+0x737ec>
    17e0:	05000000 	streq	r0, [r0, #-0]
    17e4:	0000037a 	andeq	r0, r0, sl, ror r3
    17e8:	980e0308 	stmdals	lr, {r3, r8, r9}
    17ec:	06000000 	streq	r0, [r0], -r0
    17f0:	00000a6e 	andeq	r0, r0, lr, ror #20
    17f4:	00650f03 	rsbeq	r0, r5, r3, lsl #30
    17f8:	06000000 	streq	r0, [r0], -r0
    17fc:	00000313 	andeq	r0, r0, r3, lsl r3
    1800:	00981003 	addseq	r1, r8, r3
    1804:	00040000 	andeq	r0, r4, r0
    1808:	00003307 	andeq	r3, r0, r7, lsl #6
    180c:	016a0400 	cmneq	sl, r0, lsl #8
    1810:	11030000 	mrsne	r0, (UNDEF: 3)
    1814:	00000073 	andeq	r0, r0, r3, ror r0
    1818:	00027304 	andeq	r7, r2, r4, lsl #6
    181c:	b3160400 	tstlt	r6, #0, 8
    1820:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1824:	0000b904 	andeq	fp, r0, r4, lsl #18
    1828:	700a0900 	andvc	r0, sl, r0, lsl #18
    182c:	017d1105 	cmneq	sp, r5, lsl #2
    1830:	530b0000 	movwpl	r0, #45056	; 0xb000
    1834:	13050050 	movwne	r0, #20560	; 0x5050
    1838:	0000017d 	andeq	r0, r0, sp, ror r1
    183c:	43500b00 	cmpmi	r0, #0, 22
    1840:	a8140500 	ldmdage	r4, {r8, sl}
    1844:	04000000 	streq	r0, [r0], #-0
    1848:	00078906 	andeq	r8, r7, r6, lsl #18
    184c:	83150500 	tsthi	r5, #0, 10
    1850:	08000001 	stmdaeq	r0, {r0}
    1854:	00080c06 	andeq	r0, r8, r6, lsl #24
    1858:	7d160500 	cfldr32vc	mvfx0, [r6, #-0]
    185c:	3c000001 	stccc	0, cr0, [r0], {1}
    1860:	0006ec06 	andeq	lr, r6, r6, lsl #24
    1864:	7d170500 	cfldr32vc	mvfx0, [r7, #-0]
    1868:	40000001 	andmi	r0, r0, r1
    186c:	0007e106 	andeq	lr, r7, r6, lsl #2
    1870:	7d180500 	cfldr32vc	mvfx0, [r8, #-0]
    1874:	44000001 	strmi	r0, [r0], #-1
    1878:	00086706 	andeq	r6, r8, r6, lsl #14
    187c:	5a190500 	bpl	642c84 <__user_program+0x342c84>
    1880:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
    1884:	00095906 	andeq	r5, r9, r6, lsl #18
    1888:	5a1a0500 	bpl	682c90 <__user_program+0x382c90>
    188c:	4c000000 	stcmi	0, cr0, [r0], {-0}
    1890:	00085e06 	andeq	r5, r8, r6, lsl #28
    1894:	331b0500 	tstcc	fp, #0, 10
    1898:	50000000 	andpl	r0, r0, r0
    189c:	0500430b 	streq	r4, [r0, #-779]	; 0x30b
    18a0:	0000651c 	andeq	r6, r0, ip, lsl r5
    18a4:	540b5400 	strpl	r5, [fp], #-1024	; 0x400
    18a8:	651d0500 	ldrvs	r0, [sp, #-1280]	; 0x500
    18ac:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
    18b0:	000a6e06 	andeq	r6, sl, r6, lsl #28
    18b4:	651e0500 	ldrvs	r0, [lr, #-1280]	; 0x500
    18b8:	5c000000 	stcpl	0, cr0, [r0], {-0}
    18bc:	000a6606 	andeq	r6, sl, r6, lsl #12
    18c0:	651f0500 	ldrvs	r0, [pc, #-1280]	; 13c8 <__start-0x6c38>
    18c4:	60000000 	andvs	r0, r0, r0
    18c8:	00093f06 	andeq	r3, r9, r6, lsl #30
    18cc:	33200500 	teqcc	r0, #0, 10
    18d0:	64000000 	strvs	r0, [r0], #-0
    18d4:	0009d306 	andeq	sp, r9, r6, lsl #6
    18d8:	33210500 	teqcc	r1, #0, 10
    18dc:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
    18e0:	00082c06 	andeq	r2, r8, r6, lsl #24
    18e4:	33220500 	teqcc	r2, #0, 10
    18e8:	6c000000 	stcvs	0, cr0, [r0], {-0}
    18ec:	5a040800 	bpl	1038f4 <__bss_end+0xd48f4>
    18f0:	0c000000 	stceq	0, cr0, [r0], {-0}
    18f4:	00000033 	andeq	r0, r0, r3, lsr r0
    18f8:	00000193 	muleq	r0, r3, r1
    18fc:	0001930d 	andeq	r9, r1, sp, lsl #6
    1900:	02000c00 	andeq	r0, r0, #0, 24
    1904:	034f0704 	movteq	r0, #63236	; 0xf704
    1908:	540e0000 	strpl	r0, [lr], #-0
    190c:	05004243 	streq	r4, [r0, #-579]	; 0x243
    1910:	0000ba24 	andeq	fp, r0, r4, lsr #20
    1914:	02f80f00 	rscseq	r0, r8, #0, 30
    1918:	44010000 	strmi	r0, [r1], #-0
    191c:	00009010 	andeq	r9, r0, r0, lsl r0
    1920:	00000180 	andeq	r0, r0, r0, lsl #3
    1924:	e2109c01 	ands	r9, r0, #256	; 0x100
    1928:	01000008 	tsteq	r0, r8
    192c:	0000a86b 	andeq	sl, r0, fp, ror #16
    1930:	00919000 	addseq	r9, r1, r0
    1934:	00001000 	andeq	r1, r0, r0
    1938:	119c0100 	orrsne	r0, ip, r0, lsl #2
    193c:	00000291 	muleq	r0, r1, r2
    1940:	00339001 	eorseq	r9, r3, r1
    1944:	91a00000 	movls	r0, r0
    1948:	00f00000 	rscseq	r0, r0, r0
    194c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1950:	00000237 	andeq	r0, r0, r7, lsr r2
    1954:	006e6612 	rsbeq	r6, lr, r2, lsl r6
    1958:	00a89001 	adceq	r9, r8, r1
    195c:	0b9b0000 	bleq	fe6c1964 <__user_program+0xfe3c1964>
    1960:	ba130000 	blt	4c1968 <__user_program+0x1c1968>
    1964:	0100000a 	tsteq	r0, sl
    1968:	00017d90 	muleq	r1, r0, sp
    196c:	000bee00 	andeq	lr, fp, r0, lsl #28
    1970:	091a1300 	ldmdbeq	sl, {r8, r9, ip}
    1974:	91010000 	mrsls	r0, (UNDEF: 1)
    1978:	00000065 	andeq	r0, r0, r5, rrx
    197c:	00000c60 	andeq	r0, r0, r0, ror #24
    1980:	01004312 	tsteq	r0, r2, lsl r3
    1984:	00006591 	muleq	r0, r1, r5
    1988:	000c8c00 	andeq	r8, ip, r0, lsl #24
    198c:	00541400 	subseq	r1, r4, r0, lsl #8
    1990:	00659101 	rsbeq	r9, r5, r1, lsl #2
    1994:	91020000 	mrsls	r0, (UNDEF: 2)
    1998:	00691500 	rsbeq	r1, r9, r0, lsl #10
    199c:	00339301 	eorseq	r9, r3, r1, lsl #6
    19a0:	0cc60000 	stcleq	0, cr0, [r6], {0}
    19a4:	11000000 	mrsne	r0, (UNDEF: 0)
    19a8:	000001a6 	andeq	r0, r0, r6, lsr #3
    19ac:	0033b901 	eorseq	fp, r3, r1, lsl #18
    19b0:	92900000 	addsls	r0, r0, #0
    19b4:	00140000 	andseq	r0, r4, r0
    19b8:	9c010000 	stcls	0, cr0, [r1], {-0}
    19bc:	0000026d 	andeq	r0, r0, sp, ror #4
    19c0:	00037a13 	andeq	r7, r3, r3, lsl sl
    19c4:	6db90100 	ldfvss	f0, [r9]
    19c8:	e5000002 	str	r0, [r0, #-2]
    19cc:	1600000c 	strne	r0, [r0], -ip
    19d0:	00000916 	andeq	r0, r0, r6, lsl r9
    19d4:	0065b901 	rsbeq	fp, r5, r1, lsl #18
    19d8:	51010000 	mrspl	r0, (UNDEF: 1)
    19dc:	9d040800 	stcls	8, cr0, [r4, #-0]
    19e0:	17000000 	strne	r0, [r0, -r0]
    19e4:	00000305 	andeq	r0, r0, r5, lsl #6
    19e8:	92a4c901 	adcls	ip, r4, #16384	; 0x4000
    19ec:	004c0000 	subeq	r0, ip, r0
    19f0:	9c010000 	stcls	0, cr0, [r1], {-0}
    19f4:	000002aa 	andeq	r0, r0, sl, lsr #5
    19f8:	00037a13 	andeq	r7, r3, r3, lsl sl
    19fc:	6dc90100 	stfvse	f0, [r9]
    1a00:	06000002 	streq	r0, [r0], -r2
    1a04:	1800000d 	stmdane	r0, {r0, r2, r3}
    1a08:	000092bc 			; <UNDEFINED> instruction: 0x000092bc
    1a0c:	000008bd 			; <UNDEFINED> instruction: 0x000008bd
    1a10:	0092ec18 	addseq	lr, r2, r8, lsl ip
    1a14:	0008c400 	andeq	ip, r8, r0, lsl #8
    1a18:	55170000 	ldrpl	r0, [r7, #-0]
    1a1c:	01000001 	tsteq	r0, r1
    1a20:	0092f0d8 	ldrsbeq	pc, [r2], r8	; <UNPREDICTABLE>
    1a24:	00004000 	andeq	r4, r0, r0
    1a28:	cd9c0100 	ldfgts	f0, [ip]
    1a2c:	16000002 	strne	r0, [r0], -r2
    1a30:	0000037a 	andeq	r0, r0, sl, ror r3
    1a34:	026dd801 	rsbeq	sp, sp, #65536	; 0x10000
    1a38:	50010000 	andpl	r0, r1, r0
    1a3c:	06ba1900 	ldrteq	r1, [sl], r0, lsl #18
    1a40:	e1010000 	mrs	r0, (UNDEF: 1)
    1a44:	00000033 	andeq	r0, r0, r3, lsr r0
    1a48:	00009330 	andeq	r9, r0, r0, lsr r3
    1a4c:	000000b4 	strheq	r0, [r0], -r4
    1a50:	03149c01 	tsteq	r4, #256	; 0x100
    1a54:	581a0000 	ldmdapl	sl, {}	; <UNPREDICTABLE>
    1a58:	0100000a 	tsteq	r0, sl
    1a5c:	00005ae4 	andeq	r5, r0, r4, ror #21
    1a60:	000d2400 	andeq	r2, sp, r0, lsl #8
    1a64:	0a771a00 	beq	1dc826c <__user_program+0x1ac826c>
    1a68:	e5010000 	str	r0, [r1, #-0]
    1a6c:	00000033 	andeq	r0, r0, r3, lsr r0
    1a70:	00000d51 	andeq	r0, r0, r1, asr sp
    1a74:	746e6315 	strbtvc	r6, [lr], #-789	; 0x315
    1a78:	33e60100 	mvncc	r0, #0, 2
    1a7c:	87000000 	strhi	r0, [r0, -r0]
    1a80:	0000000d 	andeq	r0, r0, sp
    1a84:	00097e19 	andeq	r7, r9, r9, lsl lr
    1a88:	46fb0100 	ldrbtmi	r0, [fp], r0, lsl #2
    1a8c:	e4000003 	str	r0, [r0], #-3
    1a90:	3c000093 	stccc	0, cr0, [r0], {147}	; 0x93
    1a94:	01000000 	mrseq	r0, (UNDEF: 0)
    1a98:	0003469c 	muleq	r3, ip, r6
    1a9c:	6e631500 	cdpvs	5, 6, cr1, cr3, cr0, {0}
    1aa0:	ff010074 			; <UNDEFINED> instruction: 0xff010074
    1aa4:	00000033 	andeq	r0, r0, r3, lsr r0
    1aa8:	00000db2 			; <UNDEFINED> instruction: 0x00000db2
    1aac:	00940418 	addseq	r0, r4, r8, lsl r4
    1ab0:	0002cd00 	andeq	ip, r2, r0, lsl #26
    1ab4:	04080000 	streq	r0, [r8], #-0
    1ab8:	0000034c 	andeq	r0, r0, ip, asr #6
    1abc:	00019a07 	andeq	r9, r1, r7, lsl #20
    1ac0:	09621b00 	stmdbeq	r2!, {r8, r9, fp, ip}^
    1ac4:	07010000 	streq	r0, [r1, -r0]
    1ac8:	00003301 	andeq	r3, r0, r1, lsl #6
    1acc:	00942000 	addseq	r2, r4, r0
    1ad0:	0002b000 	andeq	fp, r2, r0
    1ad4:	c09c0100 	addsgt	r0, ip, r0, lsl #2
    1ad8:	1c000003 	stcne	0, cr0, [r0], {3}
    1adc:	09010069 	stmdbeq	r1, {r0, r3, r5, r6}
    1ae0:	00003301 	andeq	r3, r0, r1, lsl #6
    1ae4:	000dd400 	andeq	sp, sp, r0, lsl #8
    1ae8:	6e631c00 	cdpvs	12, 6, cr1, cr3, cr0, {0}
    1aec:	27010074 	smlsdxcs	r1, r4, r0, r0
    1af0:	00003301 	andeq	r3, r0, r1, lsl #6
    1af4:	000df300 	andeq	pc, sp, r0, lsl #6
    1af8:	94281800 	strtls	r1, [r8], #-2048	; 0x800
    1afc:	08cb0000 	stmiaeq	fp, {}^	; <UNPREDICTABLE>
    1b00:	48180000 	ldmdami	r8, {}	; <UNPREDICTABLE>
    1b04:	d2000094 	andle	r0, r0, #148	; 0x94
    1b08:	18000008 	stmdane	r0, {r3}
    1b0c:	0000945c 	andeq	r9, r0, ip, asr r4
    1b10:	000008ec 	andeq	r0, r0, ip, ror #17
    1b14:	00946018 	addseq	r6, r4, r8, lsl r0
    1b18:	0008f300 	andeq	pc, r8, r0, lsl #6
    1b1c:	94641800 	strbtls	r1, [r4], #-2048	; 0x800
    1b20:	09040000 	stmdbeq	r4, {}	; <UNPREDICTABLE>
    1b24:	d8180000 	ldmdale	r8, {}	; <UNPREDICTABLE>
    1b28:	cd000094 	stcgt	0, cr0, [r0, #-592]	; 0xfffffdb0
    1b2c:	00000002 	andeq	r0, r0, r2
    1b30:	000a0c1d 	andeq	r0, sl, sp, lsl ip
    1b34:	01560100 	cmpeq	r6, r0, lsl #2
    1b38:	0000017d 	andeq	r0, r0, sp, ror r1
    1b3c:	000096d0 	ldrdeq	r9, [r0], -r0
    1b40:	0000006c 	andeq	r0, r0, ip, rrx
    1b44:	6c1e9c01 	ldcvs	12, cr9, [lr], {1}
    1b48:	01000008 	tsteq	r0, r8
    1b4c:	0033015e 	eorseq	r0, r3, lr, asr r1
    1b50:	973c0000 	ldrls	r0, [ip, -r0]!
    1b54:	00480000 	subeq	r0, r8, r0
    1b58:	9c010000 	stcls	0, cr0, [r1], {-0}
    1b5c:	0000040f 	andeq	r0, r0, pc, lsl #8
    1b60:	0008711f 	andeq	r7, r8, pc, lsl r1
    1b64:	015e0100 	cmpeq	lr, r0, lsl #2
    1b68:	0000040f 	andeq	r0, r0, pc, lsl #8
    1b6c:	00000e11 	andeq	r0, r0, r1, lsl lr
    1b70:	0100691c 	tsteq	r0, ip, lsl r9
    1b74:	00330160 	eorseq	r0, r3, r0, ror #2
    1b78:	0e3f0000 	cdpeq	0, 3, cr0, cr15, cr0, {0}
    1b7c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1b80:	00003304 	andeq	r3, r0, r4, lsl #6
    1b84:	089f2000 	ldmeq	pc, {sp}	; <UNPREDICTABLE>
    1b88:	69010000 	stmdbvs	r1, {}	; <UNPREDICTABLE>
    1b8c:	00978401 	addseq	r8, r7, r1, lsl #8
    1b90:	00004800 	andeq	r4, r0, r0, lsl #16
    1b94:	589c0100 	ldmpl	ip, {r8}
    1b98:	21000004 	tstcs	r0, r4
    1b9c:	000007e1 	andeq	r0, r0, r1, ror #15
    1ba0:	7d016901 	stcvc	9, cr6, [r1, #-4]
    1ba4:	01000001 	tsteq	r0, r1
    1ba8:	06ec1f50 	usateq	r1, #12, r0, asr #30
    1bac:	69010000 	stmdbvs	r1, {}	; <UNPREDICTABLE>
    1bb0:	00017d01 	andeq	r7, r1, r1, lsl #26
    1bb4:	000e5e00 	andeq	r5, lr, r0, lsl #28
    1bb8:	09592100 	ldmdbeq	r9, {r8, sp}^
    1bbc:	69010000 	stmdbvs	r1, {}	; <UNPREDICTABLE>
    1bc0:	00005a01 	andeq	r5, r0, r1, lsl #20
    1bc4:	00520100 	subseq	r0, r2, r0, lsl #2
    1bc8:	000a7f20 	andeq	r7, sl, r0, lsr #30
    1bcc:	01700100 	cmneq	r0, r0, lsl #2
    1bd0:	000097cc 	andeq	r9, r0, ip, asr #15
    1bd4:	00000034 	andeq	r0, r0, r4, lsr r0
    1bd8:	04899c01 	streq	r9, [r9], #3073	; 0xc01
    1bdc:	4c220000 	stcmi	0, cr0, [r2], #-0
    1be0:	70010052 	andvc	r0, r1, r2, asr r0
    1be4:	00017d01 	andeq	r7, r1, r1, lsl #26
    1be8:	22500100 	subscs	r0, r0, #0, 2
    1bec:	01005053 	qaddeq	r5, r3, r0
    1bf0:	017d0170 	cmneq	sp, r0, ror r1
    1bf4:	51010000 	mrspl	r0, (UNDEF: 1)
    1bf8:	09052000 	stmdbeq	r5, {sp}
    1bfc:	76010000 	strvc	r0, [r1], -r0
    1c00:	00980001 	addseq	r0, r8, r1
    1c04:	00007c00 	andeq	r7, r0, r0, lsl #24
    1c08:	bc9c0100 	ldflts	f0, [ip], {0}
    1c0c:	21000004 	tstcs	r0, r4
    1c10:	00000871 	andeq	r0, r0, r1, ror r8
    1c14:	0f017601 	svceq	0x00017601
    1c18:	01000004 	tsteq	r0, r4
    1c1c:	00691c50 	rsbeq	r1, r9, r0, asr ip
    1c20:	33017901 	movwcc	r7, #6401	; 0x1901
    1c24:	8c000000 	stchi	0, cr0, [r0], {-0}
    1c28:	0000000e 	andeq	r0, r0, lr
    1c2c:	00033023 	andeq	r3, r3, r3, lsr #32
    1c30:	01820100 	orreq	r0, r2, r0, lsl #2
    1c34:	0000987c 	andeq	r9, r0, ip, ror r8
    1c38:	00000068 	andeq	r0, r0, r8, rrx
    1c3c:	55249c01 	strpl	r9, [r4, #-3073]!	; 0xc01
    1c40:	01000002 	tsteq	r0, r2
    1c44:	0065018d 	rsbeq	r0, r5, sp, lsl #3
    1c48:	98e40000 	stmials	r4!, {}^	; <UNPREDICTABLE>
    1c4c:	00100000 	andseq	r0, r0, r0
    1c50:	9c010000 	stcls	0, cr0, [r1], {-0}
    1c54:	0007c625 	andeq	ip, r7, r5, lsr #12
    1c58:	01a80100 			; <UNDEFINED> instruction: 0x01a80100
    1c5c:	00000033 	andeq	r0, r0, r3, lsr r0
    1c60:	000098f4 	strdeq	r9, [r0], -r4
    1c64:	000000a0 	andeq	r0, r0, r0, lsr #1
    1c68:	051d9c01 	ldreq	r9, [sp, #-3073]	; 0xc01
    1c6c:	691c0000 	ldmdbvs	ip, {}	; <UNPREDICTABLE>
    1c70:	01aa0100 			; <UNDEFINED> instruction: 0x01aa0100
    1c74:	00000033 	andeq	r0, r0, r3, lsr r0
    1c78:	00000eab 	andeq	r0, r0, fp, lsr #29
    1c7c:	0008b026 	andeq	fp, r8, r6, lsr #32
    1c80:	01ab0100 			; <UNDEFINED> instruction: 0x01ab0100
    1c84:	0000051d 	andeq	r0, r0, sp, lsl r5
    1c88:	00000eca 	andeq	r0, r0, sl, asr #29
    1c8c:	04040200 	streq	r0, [r4], #-512	; 0x200
    1c90:	00000813 	andeq	r0, r0, r3, lsl r8
    1c94:	0002e01e 	andeq	lr, r2, lr, lsl r0
    1c98:	019a0100 	orrseq	r0, sl, r0, lsl #2
    1c9c:	00000033 	andeq	r0, r0, r3, lsr r0
    1ca0:	00009994 	muleq	r0, r4, r9
    1ca4:	00000048 	andeq	r0, r0, r8, asr #32
    1ca8:	056f9c01 	strbeq	r9, [pc, #-3073]!	; 10af <__start-0x6f51>
    1cac:	9c180000 	ldcls	0, cr0, [r8], {-0}
    1cb0:	e4000099 	str	r0, [r0], #-153	; 0x99
    1cb4:	18000004 	stmdane	r0, {r2}
    1cb8:	000099a8 	andeq	r9, r0, r8, lsr #19
    1cbc:	000008cb 	andeq	r0, r0, fp, asr #17
    1cc0:	0099b027 	addseq	fp, r9, r7, lsr #32
    1cc4:	00091500 	andeq	r1, r9, r0, lsl #10
    1cc8:	00056500 	andeq	r6, r5, r0, lsl #10
    1ccc:	50012800 	andpl	r2, r1, r0, lsl #16
    1cd0:	03e80a03 	mvneq	r0, #12288	; 0x3000
    1cd4:	99cc1800 	stmibls	ip, {fp, ip}^
    1cd8:	09260000 	stmdbeq	r6!, {}	; <UNPREDICTABLE>
    1cdc:	23000000 	movwcs	r0, #0
    1ce0:	0000098d 	andeq	r0, r0, sp, lsl #19
    1ce4:	dc01b901 	stcle	9, cr11, [r1], {1}
    1ce8:	7c000099 	stcvc	0, cr0, [r0], {153}	; 0x99
    1cec:	01000001 	tsteq	r0, r1
    1cf0:	01b9119c 			; <UNDEFINED> instruction: 0x01b9119c
    1cf4:	71010000 	mrsvc	r0, (UNDEF: 1)
    1cf8:	00000033 	andeq	r0, r0, r3, lsr r0
    1cfc:	00009b58 	andeq	r9, r0, r8, asr fp
    1d00:	000000bc 	strheq	r0, [r0], -ip
    1d04:	05db9c01 	ldrbeq	r9, [fp, #3073]	; 0xc01
    1d08:	76130000 	ldrvc	r0, [r3], -r0
    1d0c:	01000009 	tsteq	r0, r9
    1d10:	0000a871 	andeq	sl, r0, r1, ror r8
    1d14:	000eed00 	andeq	lr, lr, r0, lsl #26
    1d18:	0ab51300 	beq	fed46920 <__user_program+0xfea46920>
    1d1c:	71010000 	mrsvc	r0, (UNDEF: 1)
    1d20:	0000017d 	andeq	r0, r0, sp, ror r1
    1d24:	00000f0e 	andeq	r0, r0, lr, lsl #30
    1d28:	01006915 	tsteq	r0, r5, lsl r9
    1d2c:	00003374 	andeq	r3, r0, r4, ror r3
    1d30:	000f2f00 	andeq	r2, pc, r0, lsl #30
    1d34:	08e62900 	stmiaeq	r6!, {r8, fp, sp}^
    1d38:	74010000 	strvc	r0, [r1], #-0
    1d3c:	00000033 	andeq	r0, r0, r3, lsr r0
    1d40:	9c0c181f 	stcls	8, cr1, [ip], {31}
    1d44:	056f0000 	strbeq	r0, [pc, #-0]!	; 1d4c <__start-0x62b4>
    1d48:	0c000000 	stceq	0, cr0, [r0], {-0}
    1d4c:	0000005a 	andeq	r0, r0, sl, asr r0
    1d50:	000005ec 	andeq	r0, r0, ip, ror #11
    1d54:	0001932a 	andeq	r9, r1, sl, lsr #6
    1d58:	0003ff00 	andeq	pc, r3, r0, lsl #30
    1d5c:	000a242b 	andeq	r2, sl, fp, lsr #8
    1d60:	db170100 	blle	5c2168 <__user_program+0x2c2168>
    1d64:	05000005 	streq	r0, [r0, #-5]
    1d68:	0230a403 	eorseq	sl, r0, #50331648	; 0x3000000
    1d6c:	07fa2b00 	ldrbeq	r2, [sl, r0, lsl #22]!
    1d70:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
    1d74:	000005db 	ldrdeq	r0, [r0], -fp
    1d78:	40a40305 	adcmi	r0, r4, r5, lsl #6
    1d7c:	912b0002 	teqls	fp, r2
    1d80:	0100000a 	tsteq	r0, sl
    1d84:	0005db19 	andeq	sp, r5, r9, lsl fp
    1d88:	14030500 	strne	r0, [r3], #-1280	; 0x500
    1d8c:	2b0000d2 	blcs	20dc <__start-0x5f24>
    1d90:	00000a33 	andeq	r0, r0, r3, lsr sl
    1d94:	05db1a01 	ldrbeq	r1, [fp, #2561]	; 0xa01
    1d98:	03050000 	movweq	r0, #20480	; 0x5000
    1d9c:	0002a0a4 	andeq	sl, r2, r4, lsr #1
    1da0:	0009c12b 	andeq	ip, r9, fp, lsr #2
    1da4:	db1b0100 	blle	6c21ac <__user_program+0x3c21ac>
    1da8:	05000005 	streq	r0, [r0, #-5]
    1dac:	02c0a403 	sbceq	sl, r0, #50331648	; 0x3000000
    1db0:	07652b00 	strbeq	r2, [r5, -r0, lsl #22]!
    1db4:	1c010000 	stcne	0, cr0, [r1], {-0}
    1db8:	000005db 	ldrdeq	r0, [r0], -fp
    1dbc:	60180305 	andsvs	r0, r8, r5, lsl #6
    1dc0:	062b0001 	strteq	r0, [fp], -r1
    1dc4:	01000007 	tsteq	r0, r7
    1dc8:	0005db1d 	andeq	sp, r5, sp, lsl fp
    1dcc:	18030500 	stmdane	r3, {r8, sl}
    1dd0:	2b0001a0 	blcs	2458 <__start-0x5ba8>
    1dd4:	00000aa3 	andeq	r0, r0, r3, lsr #21
    1dd8:	05db1e01 	ldrbeq	r1, [fp, #3585]	; 0xe01
    1ddc:	03050000 	movweq	r0, #20480	; 0x5000
    1de0:	000250a4 	andeq	r5, r2, r4, lsr #1
    1de4:	00084c2b 	andeq	r4, r8, fp, lsr #24
    1de8:	db1f0100 	blle	7c21f0 <__user_program+0x4c21f0>
    1dec:	05000005 	streq	r0, [r0, #-5]
    1df0:	0260a403 	rsbeq	sl, r0, #50331648	; 0x3000000
    1df4:	07e82b00 	strbeq	r2, [r8, r0, lsl #22]!
    1df8:	20010000 	andcs	r0, r1, r0
    1dfc:	000005db 	ldrdeq	r0, [r0], -fp
    1e00:	d09c0305 	addsle	r0, ip, r5, lsl #6
    1e04:	772b0001 	strvc	r0, [fp, -r1]!
    1e08:	01000007 	tsteq	r0, r7
    1e0c:	0005db21 	andeq	sp, r5, r1, lsr #22
    1e10:	9c030500 	cfstr32ls	mvfx0, [r3], {-0}
    1e14:	2b0001b0 	blcs	24dc <__start-0x5b24>
    1e18:	00000718 	andeq	r0, r0, r8, lsl r7
    1e1c:	05db2201 	ldrbeq	r2, [fp, #513]	; 0x201
    1e20:	03050000 	movweq	r0, #20480	; 0x5000
    1e24:	00018018 	andeq	r8, r1, r8, lsl r0
    1e28:	0006d92b 	andeq	sp, r6, fp, lsr #18
    1e2c:	db230100 	blle	8c2234 <__user_program+0x5c2234>
    1e30:	05000005 	streq	r0, [r0, #-5]
    1e34:	0220a003 	eoreq	sl, r0, #3
    1e38:	08792b00 	ldmdaeq	r9!, {r8, r9, fp, sp}^
    1e3c:	24010000 	strcs	r0, [r1], #-0
    1e40:	000005db 	ldrdeq	r0, [r0], -fp
    1e44:	70180305 	andsvc	r0, r8, r5, lsl #6
    1e48:	192b0001 	stmdbne	fp!, {r0}
    1e4c:	01000008 	tsteq	r0, r8
    1e50:	0005db25 	andeq	sp, r5, r5, lsr #22
    1e54:	a0030500 	andge	r0, r3, r0, lsl #10
    1e58:	2b000200 	blcs	2660 <__start-0x59a0>
    1e5c:	000007b3 			; <UNDEFINED> instruction: 0x000007b3
    1e60:	05db2601 	ldrbeq	r2, [fp, #1537]	; 0x601
    1e64:	03050000 	movweq	r0, #20480	; 0x5000
    1e68:	00019018 	andeq	r9, r1, r8, lsl r0
    1e6c:	00091f2b 	andeq	r1, r9, fp, lsr #30
    1e70:	db270100 	blle	9c2278 <__user_program+0x6c2278>
    1e74:	05000005 	streq	r0, [r0, #-5]
    1e78:	00f21403 	rscseq	r1, r2, r3, lsl #8
    1e7c:	08f22b00 	ldmeq	r2!, {r8, r9, fp, sp}^
    1e80:	28010000 	stmdacs	r1, {}	; <UNPREDICTABLE>
    1e84:	000005db 	ldrdeq	r0, [r0], -fp
    1e88:	c09c0305 	addsgt	r0, ip, r5, lsl #6
    1e8c:	8c2b0001 	stchi	0, cr0, [fp], #-4
    1e90:	01000008 	tsteq	r0, r8
    1e94:	0005db29 	andeq	sp, r5, r9, lsr #22
    1e98:	14030500 	strne	r0, [r3], #-1280	; 0x500
    1e9c:	2b000112 	blcs	22ec <__start-0x5d14>
    1ea0:	00000946 	andeq	r0, r0, r6, asr #18
    1ea4:	05db2a01 	ldrbeq	r2, [fp, #2561]	; 0xa01
    1ea8:	03050000 	movweq	r0, #20480	; 0x5000
    1eac:	000270a4 	andeq	r7, r2, r4, lsr #1
    1eb0:	00099b2b 	andeq	r9, r9, fp, lsr #22
    1eb4:	db2b0100 	blle	ac22bc <__user_program+0x7c22bc>
    1eb8:	05000005 	streq	r0, [r0, #-5]
    1ebc:	02b0a403 	adcseq	sl, r0, #50331648	; 0x3000000
    1ec0:	08cf2b00 	stmiaeq	pc, {r8, r9, fp, sp}^	; <UNPREDICTABLE>
    1ec4:	2c010000 	stccs	0, cr0, [r1], {-0}
    1ec8:	000005db 	ldrdeq	r0, [r0], -fp
    1ecc:	22140305 	andscs	r0, r4, #335544320	; 0x14000000
    1ed0:	f32b0001 	vhadd.u32	d0, d11, d1
    1ed4:	01000006 	tsteq	r0, r6
    1ed8:	0005db2d 	andeq	sp, r5, sp, lsr #22
    1edc:	14030500 	strne	r0, [r3], #-1280	; 0x500
    1ee0:	2b000102 	blcs	22f0 <__start-0x5d10>
    1ee4:	000009f9 	strdeq	r0, [r0], -r9
    1ee8:	05db2e01 	ldrbeq	r2, [fp, #3585]	; 0xe01
    1eec:	03050000 	movweq	r0, #20480	; 0x5000
    1ef0:	000210a0 	andeq	r1, r2, r0, lsr #1
    1ef4:	0008bc2b 	andeq	fp, r8, fp, lsr #24
    1ef8:	db2f0100 	blle	bc2300 <__user_program+0x8c2300>
    1efc:	05000005 	streq	r0, [r0, #-5]
    1f00:	0290a403 	addseq	sl, r0, #50331648	; 0x3000000
    1f04:	07ce2b00 	strbeq	r2, [lr, r0, lsl #22]
    1f08:	30010000 	andcc	r0, r1, r0
    1f0c:	000005db 	ldrdeq	r0, [r0], -fp
    1f10:	e2140305 	ands	r0, r4, #335544320	; 0x14000000
    1f14:	522b0000 	eorpl	r0, fp, #0
    1f18:	01000007 	tsteq	r0, r7
    1f1c:	0005db31 	andeq	sp, r5, r1, lsr fp
    1f20:	14030500 	strne	r0, [r3], #-1280	; 0x500
    1f24:	2b000132 	blcs	23f4 <__start-0x5c0c>
    1f28:	00000793 	muleq	r0, r3, r7
    1f2c:	05db3201 	ldrbeq	r3, [fp, #513]	; 0x201
    1f30:	03050000 	movweq	r0, #20480	; 0x5000
    1f34:	0001f0a0 	andeq	pc, r1, r0, lsr #1
    1f38:	00072b2b 	andeq	r2, r7, fp, lsr #22
    1f3c:	db330100 	blle	cc2344 <__user_program+0x9c2344>
    1f40:	05000005 	streq	r0, [r0, #-5]
    1f44:	0280a403 	addeq	sl, r0, #50331648	; 0x3000000
    1f48:	08392b00 	ldmdaeq	r9!, {r8, r9, fp, sp}
    1f4c:	34010000 	strcc	r0, [r1], #-0
    1f50:	000005db 	ldrdeq	r0, [r0], -fp
    1f54:	e0a00305 	adc	r0, r0, r5, lsl #6
    1f58:	452b0001 	strmi	r0, [fp, #-1]!
    1f5c:	0100000a 	tsteq	r0, sl
    1f60:	0005db35 	andeq	sp, r5, r5, lsr fp
    1f64:	a4030500 	strge	r0, [r3], #-1280	; 0x500
    1f68:	2b0002d0 	blcs	2ab0 <__start-0x5550>
    1f6c:	000009ae 	andeq	r0, r0, lr, lsr #19
    1f70:	05db3601 	ldrbeq	r3, [fp, #1537]	; 0x601
    1f74:	03050000 	movweq	r0, #20480	; 0x5000
    1f78:	00014218 	andeq	r4, r1, r8, lsl r2
    1f7c:	00017b2c 	andeq	r7, r1, ip, lsr #22
    1f80:	173a0100 	ldrne	r0, [sl, -r0, lsl #2]!
    1f84:	07000008 	streq	r0, [r0, -r8]
    1f88:	00000065 	andeq	r0, r0, r5, rrx
    1f8c:	00019a0c 	andeq	r9, r1, ip, lsl #20
    1f90:	00082c00 	andeq	r2, r8, r0, lsl #24
    1f94:	01930d00 	orrseq	r0, r3, r0, lsl #26
    1f98:	001f0000 	andseq	r0, pc, r0
    1f9c:	000a5e2b 	andeq	r5, sl, fp, lsr #28
    1fa0:	3d3b0100 	ldfccs	f0, [fp, #-0]
    1fa4:	05000008 	streq	r0, [r0, #-8]
    1fa8:	01521803 	cmpeq	r2, r3, lsl #16
    1fac:	081c0700 	ldmdaeq	ip, {r8, r9, sl}
    1fb0:	dc2b0000 	stcle	0, cr0, [fp], #-0
    1fb4:	01000009 	tsteq	r0, r9
    1fb8:	0000b33d 	andeq	fp, r0, sp, lsr r3
    1fbc:	9c030500 	cfstr32ls	mvfx0, [r3], {-0}
    1fc0:	2b0001e0 	blcs	2748 <__start-0x58b8>
    1fc4:	000007a6 	andeq	r0, r0, r6, lsr #15
    1fc8:	08643e01 	stmdaeq	r4!, {r0, r9, sl, fp, ip, sp}^
    1fcc:	03050000 	movweq	r0, #20480	; 0x5000
    1fd0:	0001b018 	andeq	fp, r1, r8, lsl r0
    1fd4:	00005a07 	andeq	r5, r0, r7, lsl #20
    1fd8:	096d2b00 	stmdbeq	sp!, {r8, r9, fp, sp}^
    1fdc:	3e010000 	cdpcc	0, 0, cr0, cr1, cr0, {0}
    1fe0:	00000864 	andeq	r0, r0, r4, ror #16
    1fe4:	30a00305 	adccc	r0, r0, r5, lsl #6
    1fe8:	ea2b0002 	b	ac1ff8 <__user_program+0x7c1ff8>
    1fec:	01000009 	tsteq	r0, r9
    1ff0:	0000983f 	andeq	r9, r0, pc, lsr r8
    1ff4:	08030500 	stmdaeq	r3, {r8, sl}
    1ff8:	2b0000c0 	blcs	2300 <__start-0x5d00>
    1ffc:	00000a17 	andeq	r0, r0, r7, lsl sl
    2000:	00334001 	eorseq	r4, r3, r1
    2004:	03050000 	movweq	r0, #20480	; 0x5000
    2008:	00014214 	andeq	r4, r1, r4, lsl r2
    200c:	00051d0c 	andeq	r1, r5, ip, lsl #26
    2010:	0008ac00 	andeq	sl, r8, r0, lsl #24
    2014:	01930d00 	orrseq	r0, r3, r0, lsl #26
    2018:	001f0000 	andseq	r0, pc, r0
    201c:	0009912b 	andeq	r9, r9, fp, lsr #2
    2020:	9c410100 	stflse	f0, [r1], {-0}
    2024:	05000008 	streq	r0, [r0, #-8]
    2028:	01b01c03 	lslseq	r1, r3, #24
    202c:	01f32d00 	mvnseq	r2, r0, lsl #26
    2030:	30060000 	andcc	r0, r6, r0
    2034:	0001942d 	andeq	r9, r1, sp, lsr #8
    2038:	2d2b0600 	stccs	6, cr0, [fp, #-0]
    203c:	0000027d 	andeq	r0, r0, sp, ror r2
    2040:	072e3a07 	streq	r3, [lr, -r7, lsl #20]!
    2044:	08000005 	stmdaeq	r0, {r0, r2}
    2048:	00004127 	andeq	r4, r0, r7, lsr #2
    204c:	0008ec00 	andeq	lr, r8, r0, lsl #24
    2050:	005a2f00 	subseq	r2, sl, r0, lsl #30
    2054:	5a2f0000 	bpl	bc205c <__user_program+0x8c205c>
    2058:	00000000 	andeq	r0, r0, r0
    205c:	0002352d 	andeq	r3, r2, sp, lsr #10
    2060:	30310800 	eorscc	r0, r1, r0, lsl #16
    2064:	00000563 	andeq	r0, r0, r3, ror #10
    2068:	00412a08 	subeq	r2, r1, r8, lsl #20
    206c:	09040000 	stmdbeq	r4, {}	; <UNPREDICTABLE>
    2070:	00310000 	eorseq	r0, r1, r0
    2074:	00032330 	andeq	r2, r3, r0, lsr r3
    2078:	41290800 	teqmi	r9, r0, lsl #16
    207c:	15000000 	strne	r0, [r0, #-0]
    2080:	31000009 	tstcc	r0, r9
    2084:	04df3200 	ldrbeq	r3, [pc], #512	; 208c <__start-0x5f74>
    2088:	28070000 	stmdacs	r7, {}	; <UNPREDICTABLE>
    208c:	00000926 	andeq	r0, r0, r6, lsr #18
    2090:	0000332f 	andeq	r3, r0, pc, lsr #6
    2094:	32330000 	eorscc	r0, r3, #0
    2098:	01000009 	tsteq	r0, r9
    209c:	00a82f3c 	adceq	r2, r8, ip, lsr pc
    20a0:	7d2f0000 	stcvc	0, cr0, [pc, #-0]	; 20a8 <__start-0x5f58>
    20a4:	00000001 	andeq	r0, r0, r1
    20a8:	00021600 	andeq	r1, r2, r0, lsl #12
    20ac:	95000400 	strls	r0, [r0, #-1024]	; 0x400
    20b0:	0400000c 	streq	r0, [r0], #-12
    20b4:	0003b101 	andeq	fp, r3, r1, lsl #2
    20b8:	0ace0100 	beq	ff3824c0 <__user_program+0xff0824c0>
    20bc:	03580000 	cmpeq	r8, #0
    20c0:	9c140000 	ldcls	0, cr0, [r4], {-0}
    20c4:	01800000 	orreq	r0, r0, r0
    20c8:	08510000 	ldmdaeq	r1, {}^	; <UNPREDICTABLE>
    20cc:	01020000 	mrseq	r0, (UNDEF: 2)
    20d0:	00008208 	andeq	r8, r0, r8, lsl #4
    20d4:	05020200 	streq	r0, [r2, #-512]	; 0x200
    20d8:	00000138 	andeq	r0, r0, r8, lsr r1
    20dc:	69050403 	stmdbvs	r5, {r0, r1, sl}
    20e0:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    20e4:	00000508 	andeq	r0, r0, r8, lsl #10
    20e8:	71040000 	mrsvc	r0, (UNDEF: 4)
    20ec:	02000000 	andeq	r0, r0, #0
    20f0:	00004c16 	andeq	r4, r0, r6, lsl ip
    20f4:	08010200 	stmdaeq	r1, {r9}
    20f8:	00000079 	andeq	r0, r0, r9, ror r0
    20fc:	90070202 	andls	r0, r7, r2, lsl #4
    2100:	04000000 	streq	r0, [r0], #-0
    2104:	00000087 	andeq	r0, r0, r7, lsl #1
    2108:	00651a02 	rsbeq	r1, r5, r2, lsl #20
    210c:	04020000 	streq	r0, [r2], #-0
    2110:	00005407 	andeq	r5, r0, r7, lsl #8
    2114:	07080200 	streq	r0, [r8, -r0, lsl #4]
    2118:	0000004a 	andeq	r0, r0, sl, asr #32
    211c:	00051b05 	andeq	r1, r5, r5, lsl #22
    2120:	14360100 	ldrtne	r0, [r6], #-256	; 0x100
    2124:	2000009c 	mulcs	r0, ip, r0
    2128:	01000000 	mrseq	r0, (UNDEF: 0)
    212c:	0000989c 	muleq	r0, ip, r8
    2130:	05200600 	streq	r0, [r0, #-1536]!	; 0x600
    2134:	36010000 	strcc	r0, [r1], -r0
    2138:	00000065 	andeq	r0, r0, r5, rrx
    213c:	00000f4e 	andeq	r0, r0, lr, asr #30
    2140:	057e0500 	ldrbeq	r0, [lr, #-1280]!	; 0x500
    2144:	3c010000 	stccc	0, cr0, [r1], {-0}
    2148:	00009c34 	andeq	r9, r0, r4, lsr ip
    214c:	00000074 	andeq	r0, r0, r4, ror r0
    2150:	014c9c01 	cmpeq	ip, r1, lsl #24
    2154:	54060000 	strpl	r0, [r6], #-0
    2158:	01000004 	tsteq	r0, r4
    215c:	00005a3c 	andeq	r5, r0, ip, lsr sl
    2160:	000f6c00 	andeq	r6, pc, r0, lsl #24
    2164:	6c630700 	stclvs	7, cr0, [r3], #-0
    2168:	3c01006b 	stccc	0, cr0, [r1], {107}	; 0x6b
    216c:	0000005a 	andeq	r0, r0, sl, asr r0
    2170:	00000f8d 	andeq	r0, r0, sp, lsl #31
    2174:	72617608 	rsbvc	r7, r1, #8, 12	; 0x800000
    2178:	653d0100 	ldrvs	r0, [sp, #-256]!	; 0x100
    217c:	ab000000 	blge	2184 <__start-0x5e7c>
    2180:	0900000f 	stmdbeq	r0, {r0, r1, r2, r3}
    2184:	00009c48 	andeq	r9, r0, r8, asr #24
    2188:	00000207 	andeq	r0, r0, r7, lsl #4
    218c:	000000f2 	strdeq	r0, [r0], -r2
    2190:	0151010a 	cmpeq	r1, sl, lsl #2
    2194:	50010a34 	andpl	r0, r1, r4, lsr sl
    2198:	09003701 	stmdbeq	r0, {r0, r8, r9, sl, ip, sp}
    219c:	00009c54 	andeq	r9, r0, r4, asr ip
    21a0:	00000207 	andeq	r0, r0, r7, lsl #4
    21a4:	0000010a 	andeq	r0, r0, sl, lsl #2
    21a8:	0151010a 	cmpeq	r1, sl, lsl #2
    21ac:	50010a34 	andpl	r0, r1, r4, lsr sl
    21b0:	09003801 	stmdbeq	r0, {r0, fp, ip, sp}
    21b4:	00009c60 	andeq	r9, r0, r0, ror #24
    21b8:	00000207 	andeq	r0, r0, r7, lsl #4
    21bc:	00000122 	andeq	r0, r0, r2, lsr #2
    21c0:	0151010a 	cmpeq	r1, sl, lsl #2
    21c4:	50010a34 	andpl	r0, r1, r4, lsr sl
    21c8:	09003a01 	stmdbeq	r0, {r0, r9, fp, ip, sp}
    21cc:	00009c6c 	andeq	r9, r0, ip, ror #24
    21d0:	00000207 	andeq	r0, r0, r7, lsl #4
    21d4:	0000013a 	andeq	r0, r0, sl, lsr r1
    21d8:	0151010a 	cmpeq	r1, sl, lsl #2
    21dc:	50010a34 	andpl	r0, r1, r4, lsr sl
    21e0:	0b003b01 	bleq	10dec <thread21_svc_stack+0xbd8>
    21e4:	00009ca4 	andeq	r9, r0, r4, lsr #25
    21e8:	00000073 	andeq	r0, r0, r3, ror r0
    21ec:	0350010a 	cmpeq	r0, #-2147483646	; 0x80000002
    21f0:	0027100a 	eoreq	r1, r7, sl
    21f4:	05a70500 	streq	r0, [r7, #1280]!	; 0x500
    21f8:	5f010000 	svcpl	0x00010000
    21fc:	00009ca8 	andeq	r9, r0, r8, lsr #25
    2200:	00000034 	andeq	r0, r0, r4, lsr r0
    2204:	018b9c01 	orreq	r9, fp, r1, lsl #24
    2208:	c60c0000 	strgt	r0, [ip], -r0
    220c:	0100000a 	tsteq	r0, sl
    2210:	0000415f 	andeq	r4, r0, pc, asr r1
    2214:	0d500100 	ldfeqe	f0, [r0, #-0]
    2218:	006b6c63 	rsbeq	r6, fp, r3, ror #24
    221c:	005a5f01 	subseq	r5, sl, r1, lsl #30
    2220:	51010000 	mrspl	r0, (UNDEF: 1)
    2224:	72617608 	rsbvc	r7, r1, #8, 12	; 0x800000
    2228:	65600100 	strbvs	r0, [r0, #-256]!	; 0x100
    222c:	ce000000 	cdpgt	0, 0, cr0, cr0, cr0, {0}
    2230:	0000000f 	andeq	r0, r0, pc
    2234:	0005260e 	andeq	r2, r5, lr, lsl #12
    2238:	dc830100 	stfles	f0, [r3], {0}
    223c:	1800009c 	stmdane	r0, {r2, r3, r4, r7}
    2240:	01000000 	mrseq	r0, (UNDEF: 0)
    2244:	05710f9c 	ldrbeq	r0, [r1, #-3996]!	; 0xf9c
    2248:	89010000 	stmdbhi	r1, {}	; <UNPREDICTABLE>
    224c:	00000041 	andeq	r0, r0, r1, asr #32
    2250:	00009cf4 	strdeq	r9, [r0], -r4
    2254:	000000a0 	andeq	r0, r0, r0, lsr #1
    2258:	02079c01 	andeq	r9, r7, #256	; 0x100
    225c:	39060000 	stmdbcc	r6, {}	; <UNPREDICTABLE>
    2260:	01000005 	tsteq	r0, r5
    2264:	00004189 	andeq	r4, r0, r9, lsl #3
    2268:	000ff100 	andeq	pc, pc, r0, lsl #2
    226c:	61760800 	cmnvs	r6, r0, lsl #16
    2270:	8a010072 	bhi	42440 <__bss_end+0x13440>
    2274:	00000065 	andeq	r0, r0, r5, rrx
    2278:	00001012 	andeq	r1, r0, r2, lsl r0
    227c:	74657208 	strbtvc	r7, [r5], #-520	; 0x208
    2280:	658b0100 	strvs	r0, [fp, #256]	; 0x100
    2284:	4c000000 	stcmi	0, cr0, [r0], {-0}
    2288:	09000010 	stmdbeq	r0, {r4}
    228c:	00009d30 	andeq	r9, r0, r0, lsr sp
    2290:	00000073 	andeq	r0, r0, r3, ror r0
    2294:	000001f6 	strdeq	r0, [r0], -r6
    2298:	0250010a 	subseq	r0, r0, #-2147483646	; 0x80000002
    229c:	0b000075 	bleq	2478 <__start-0x5b88>
    22a0:	00009d68 	andeq	r9, r0, r8, ror #26
    22a4:	00000073 	andeq	r0, r0, r3, ror r0
    22a8:	0250010a 	subseq	r0, r0, #-2147483646	; 0x80000002
    22ac:	00000075 	andeq	r0, r0, r5, ror r0
    22b0:	00012c10 	andeq	r2, r1, r0, lsl ip
    22b4:	11370300 	teqne	r7, r0, lsl #6
    22b8:	00000041 	andeq	r0, r0, r1, asr #32
    22bc:	00004111 	andeq	r4, r0, r1, lsl r1
    22c0:	e5000000 	str	r0, [r0, #-0]
    22c4:	04000003 	streq	r0, [r0], #-3
    22c8:	000da100 	andeq	sl, sp, r0, lsl #2
    22cc:	b1010400 	tstlt	r1, r0, lsl #8
    22d0:	01000003 	tsteq	r0, r3
    22d4:	00000adf 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    22d8:	00000358 	andeq	r0, r0, r8, asr r3
    22dc:	00009d94 	muleq	r0, r4, sp
    22e0:	000001a4 	andeq	r0, r0, r4, lsr #3
    22e4:	000008e8 	andeq	r0, r0, r8, ror #17
    22e8:	82080102 	andhi	r0, r8, #-2147483648	; 0x80000000
    22ec:	02000000 	andeq	r0, r0, #0
    22f0:	01380502 	teqeq	r8, r2, lsl #10
    22f4:	04030000 	streq	r0, [r3], #-0
    22f8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
    22fc:	05080200 	streq	r0, [r8, #-512]	; 0x200
    2300:	00000000 	andeq	r0, r0, r0
    2304:	00007104 	andeq	r7, r0, r4, lsl #2
    2308:	4c160200 	lfmmi	f0, 4, [r6], {-0}
    230c:	02000000 	andeq	r0, r0, #0
    2310:	00790801 	rsbseq	r0, r9, r1, lsl #16
    2314:	8a040000 	bhi	10231c <__bss_end+0xd331c>
    2318:	02000003 	andeq	r0, r0, #3
    231c:	00005e18 	andeq	r5, r0, r8, lsl lr
    2320:	07020200 	streq	r0, [r2, -r0, lsl #4]
    2324:	00000090 	muleq	r0, r0, r0
    2328:	54070402 	strpl	r0, [r7], #-1026	; 0x402
    232c:	02000000 	andeq	r0, r0, #0
    2330:	004a0708 	subeq	r0, sl, r8, lsl #14
    2334:	a7050000 	strge	r0, [r5, -r0]
    2338:	01000002 	tsteq	r0, r2
    233c:	009d941a 	addseq	r9, sp, sl, lsl r4
    2340:	00001c00 	andeq	r1, r0, r0, lsl #24
    2344:	bf9c0100 	svclt	0x009c0100
    2348:	06000000 	streq	r0, [r0], -r0
    234c:	0000093f 	andeq	r0, r0, pc, lsr r9
    2350:	00331a01 	eorseq	r1, r3, r1, lsl #20
    2354:	106b0000 	rsbne	r0, fp, r0
    2358:	a8070000 	stmdage	r7, {}	; <UNPREDICTABLE>
    235c:	8600009d 			; <UNDEFINED> instruction: 0x8600009d
    2360:	b5000003 	strlt	r0, [r0, #-3]
    2364:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    2368:	f3035101 	vrhadd.u8	d5, d3, d1
    236c:	01085001 	tsteq	r8, r1
    2370:	24030550 	strcs	r0, [r3], #-1360	; 0x550
    2374:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
    2378:	009dac09 	addseq	sl, sp, r9, lsl #24
    237c:	0003a700 	andeq	sl, r3, r0, lsl #14
    2380:	470a0000 	strmi	r0, [sl, -r0]
    2384:	01000002 	tsteq	r0, r2
    2388:	00003322 	andeq	r3, r0, r2, lsr #6
    238c:	009db000 	addseq	fp, sp, r0
    2390:	00004800 	andeq	r4, r0, r0, lsl #16
    2394:	1c9c0100 	ldfnes	f0, [ip], {0}
    2398:	06000001 	streq	r0, [r0], -r1
    239c:	00000266 	andeq	r0, r0, r6, ror #4
    23a0:	00332201 	eorseq	r2, r3, r1, lsl #4
    23a4:	10970000 	addsne	r0, r7, r0
    23a8:	700b0000 	andvc	r0, fp, r0
    23ac:	01007274 	tsteq	r0, r4, ror r2
    23b0:	00011c22 	andeq	r1, r1, r2, lsr #24
    23b4:	0010ea00 	andseq	lr, r0, r0, lsl #20
    23b8:	656c0b00 	strbvs	r0, [ip, #-2816]!	; 0xb00
    23bc:	2201006e 	andcs	r0, r1, #110	; 0x6e
    23c0:	00000033 	andeq	r0, r0, r3, lsr r0
    23c4:	00001141 	andeq	r1, r0, r1, asr #2
    23c8:	0100690c 	tsteq	r0, ip, lsl #18
    23cc:	00003324 	andeq	r3, r0, r4, lsr #6
    23d0:	00118300 	andseq	r8, r1, r0, lsl #6
    23d4:	9dd80900 	ldclls	9, cr0, [r8]
    23d8:	03b40000 			; <UNDEFINED> instruction: 0x03b40000
    23dc:	0d000000 	stceq	0, cr0, [r0, #-0]
    23e0:	00002504 	andeq	r2, r0, r4, lsl #10
    23e4:	043c0a00 	ldrteq	r0, [ip], #-2560	; 0xa00
    23e8:	38010000 	stmdacc	r1, {}	; <UNPREDICTABLE>
    23ec:	00000033 	andeq	r0, r0, r3, lsr r0
    23f0:	00009df8 	strdeq	r9, [r0], -r8
    23f4:	0000009c 	muleq	r0, ip, r0
    23f8:	01b29c01 			; <UNDEFINED> instruction: 0x01b29c01
    23fc:	66060000 	strvs	r0, [r6], -r0
    2400:	01000002 	tsteq	r0, r2
    2404:	00003338 	andeq	r3, r0, r8, lsr r3
    2408:	0011a300 	andseq	sl, r1, r0, lsl #6
    240c:	74700b00 	ldrbtvc	r0, [r0], #-2816	; 0xb00
    2410:	38010072 	stmdacc	r1, {r1, r4, r5, r6}
    2414:	0000011c 	andeq	r0, r0, ip, lsl r1
    2418:	000011f6 	strdeq	r1, [r0], -r6
    241c:	6e656c0b 	cdpvs	12, 6, cr6, cr5, cr11, {0}
    2420:	33380100 	teqcc	r8, #0, 2
    2424:	44000000 	strmi	r0, [r0], #-0
    2428:	0c000012 	stceq	0, cr0, [r0], {18}
    242c:	3a010069 	bcc	425d8 <__bss_end+0x135d8>
    2430:	00000033 	andeq	r0, r0, r3, lsr r0
    2434:	00001283 	andeq	r1, r0, r3, lsl #5
    2438:	0100630c 	tsteq	r0, ip, lsl #6
    243c:	0000253b 	andeq	r2, r0, fp, lsr r5
    2440:	0012ba00 	andseq	fp, r2, r0, lsl #20
    2444:	9e240900 	cdpls	9, 2, cr0, cr4, cr0, {0}
    2448:	03c50000 	biceq	r0, r5, #0
    244c:	48070000 	stmdami	r7, {}	; <UNPREDICTABLE>
    2450:	8600009e 			; <UNDEFINED> instruction: 0x8600009e
    2454:	9f000003 	svcls	0x00000003
    2458:	08000001 	stmdaeq	r0, {r0}
    245c:	77025001 	strvc	r5, [r2, -r1]
    2460:	60090000 	andvs	r0, r9, r0
    2464:	b400009e 	strlt	r0, [r0], #-158	; 0x9e
    2468:	09000003 	stmdbeq	r0, {r0, r1}
    246c:	00009e70 	andeq	r9, r0, r0, ror lr
    2470:	000003b4 			; <UNDEFINED> instruction: 0x000003b4
    2474:	03980a00 	orrseq	r0, r8, #0, 20
    2478:	5f010000 	svcpl	0x00010000
    247c:	00000033 	andeq	r0, r0, r3, lsr r0
    2480:	00009e94 	muleq	r0, r4, lr
    2484:	0000001c 	andeq	r0, r0, ip, lsl r0
    2488:	02099c01 	andeq	r9, r9, #256	; 0x100
    248c:	da060000 	ble	182494 <__end+0x32494>
    2490:	01000004 	tsteq	r0, r4
    2494:	0000335f 	andeq	r3, r0, pc, asr r3
    2498:	0012e300 	andseq	lr, r2, r0, lsl #6
    249c:	069d0600 	ldreq	r0, [sp], r0, lsl #12
    24a0:	5f010000 	svcpl	0x00010000
    24a4:	00000041 	andeq	r0, r0, r1, asr #32
    24a8:	00001304 	andeq	r1, r0, r4, lsl #6
    24ac:	006e660b 	rsbeq	r6, lr, fp, lsl #12
    24b0:	02145f01 	andseq	r5, r4, #1, 30
    24b4:	13250000 	teqne	r5, #0
    24b8:	a80e0000 	stmdage	lr, {}	; <UNPREDICTABLE>
    24bc:	d000009e 	mulle	r0, lr, r0
    24c0:	08000003 	stmdaeq	r0, {r0, r1}
    24c4:	f3035001 	vhadd.u8	d5, d3, d1
    24c8:	00005001 	andeq	r5, r0, r1
    24cc:	0002140f 	andeq	r1, r2, pc, lsl #8
    24d0:	00531000 	subseq	r1, r3, r0
    24d4:	0d000000 	stceq	0, cr0, [r0, #-0]
    24d8:	00020904 	andeq	r0, r2, r4, lsl #18
    24dc:	02c81100 	sbceq	r1, r8, #0, 2
    24e0:	66010000 	strvs	r0, [r1], -r0
    24e4:	00000033 	andeq	r0, r0, r3, lsr r0
    24e8:	00009eb0 			; <UNDEFINED> instruction: 0x00009eb0
    24ec:	00000010 	andeq	r0, r0, r0, lsl r0
    24f0:	023d9c01 	eorseq	r9, sp, #256	; 0x100
    24f4:	b8090000 	stmdalt	r9, {}	; <UNPREDICTABLE>
    24f8:	e100009e 	swp	r0, lr, [r0]	; <UNPREDICTABLE>
    24fc:	00000003 	andeq	r0, r0, r3
    2500:	0001870a 	andeq	r8, r1, sl, lsl #14
    2504:	89700100 	ldmdbhi	r0!, {r8}^
    2508:	c0000002 	andgt	r0, r0, r2
    250c:	5800009e 	stmdapl	r0, {r1, r2, r3, r4, r7}
    2510:	01000000 	mrseq	r0, (UNDEF: 0)
    2514:	0002899c 	muleq	r2, ip, r9
    2518:	0af50600 	beq	ffd43d20 <__user_program+0xffa43d20>
    251c:	70010000 	andvc	r0, r1, r0
    2520:	00000033 	andeq	r0, r0, r3, lsr r0
    2524:	00001346 	andeq	r1, r0, r6, asr #6
    2528:	000afa12 	andeq	pc, sl, r2, lsl sl	; <UNPREDICTABLE>
    252c:	25710100 	ldrbcs	r0, [r1, #-256]!	; 0x100
    2530:	12000000 	andne	r0, r0, #0
    2534:	00000b05 	andeq	r0, r0, r5, lsl #22
    2538:	00257201 	eoreq	r7, r5, r1, lsl #4
    253c:	23130000 	tstcs	r3, #0
    2540:	0100000b 	tsteq	r0, fp
    2544:	00011c73 	andeq	r1, r1, r3, ror ip
    2548:	00530100 	subseq	r0, r3, r0, lsl #2
    254c:	400a0414 	andmi	r0, sl, r4, lsl r4
    2550:	0100000b 	tsteq	r0, fp
    2554:	00003385 	andeq	r3, r0, r5, lsl #7
    2558:	009f1800 	addseq	r1, pc, r0, lsl #16
    255c:	00000800 	andeq	r0, r0, r0, lsl #16
    2560:	b49c0100 	ldrlt	r0, [ip], #256	; 0x100
    2564:	06000002 	streq	r0, [r0], -r2
    2568:	00000266 	andeq	r0, r0, r6, ror #4
    256c:	00338501 	eorseq	r8, r3, r1, lsl #10
    2570:	13670000 	cmnne	r7, #0
    2574:	0a000000 	beq	257c <__start-0x5a84>
    2578:	00000459 	andeq	r0, r0, r9, asr r4
    257c:	00338901 	eorseq	r8, r3, r1, lsl #18
    2580:	9f200000 	svcls	0x00200000
    2584:	00080000 	andeq	r0, r8, r0
    2588:	9c010000 	stcls	0, cr0, [r1], {-0}
    258c:	000002e9 	andeq	r0, r0, r9, ror #5
    2590:	00026606 	andeq	r6, r2, r6, lsl #12
    2594:	33890100 	orrcc	r0, r9, #0, 2
    2598:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
    259c:	15000013 	strne	r0, [r0, #-19]
    25a0:	01007473 	tsteq	r0, r3, ror r4
    25a4:	00028989 	andeq	r8, r2, r9, lsl #19
    25a8:	00510100 	subseq	r0, r1, r0, lsl #2
    25ac:	000b310a 	andeq	r3, fp, sl, lsl #2
    25b0:	338d0100 	orrcc	r0, sp, #0, 2
    25b4:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
    25b8:	0800009f 	stmdaeq	r0, {r0, r1, r2, r3, r4, r7}
    25bc:	01000000 	mrseq	r0, (UNDEF: 0)
    25c0:	0003129c 	muleq	r3, ip, r2
    25c4:	02660600 	rsbeq	r0, r6, #0, 12
    25c8:	8d010000 	stchi	0, cr0, [r1, #-0]
    25cc:	00000033 	andeq	r0, r0, r3, lsr r0
    25d0:	000013a9 	andeq	r1, r0, r9, lsr #7
    25d4:	0b150a00 	bleq	544ddc <__user_program+0x244ddc>
    25d8:	91010000 	mrsls	r0, (UNDEF: 1)
    25dc:	00000033 	andeq	r0, r0, r3, lsr r0
    25e0:	00009f30 	andeq	r9, r0, r0, lsr pc
    25e4:	00000008 	andeq	r0, r0, r8
    25e8:	03559c01 	cmpeq	r5, #256	; 0x100
    25ec:	66060000 	strvs	r0, [r6], -r0
    25f0:	01000002 	tsteq	r0, r2
    25f4:	00003391 	muleq	r0, r1, r3
    25f8:	0013ca00 	andseq	ip, r3, r0, lsl #20
    25fc:	74701500 	ldrbtvc	r1, [r0], #-1280	; 0x500
    2600:	91010072 	tstls	r1, r2, ror r0
    2604:	00000033 	andeq	r0, r0, r3, lsr r0
    2608:	64155101 	ldrvs	r5, [r5], #-257	; 0x101
    260c:	01007269 	tsteq	r0, r9, ror #4
    2610:	00003391 	muleq	r0, r1, r3
    2614:	00520100 	subseq	r0, r2, r0, lsl #2
    2618:	000b2816 	andeq	r2, fp, r6, lsl r8
    261c:	1c110100 	ldfnes	f0, [r1], {-0}
    2620:	05000001 	streq	r0, [r0, #-1]
    2624:	00d00803 	sbcseq	r0, r0, r3, lsl #16
    2628:	6c671700 	stclvs	7, cr1, [r7], #-0
    262c:	14140100 	ldrne	r0, [r4], #-256	; 0x100
    2630:	12000002 	andne	r0, r0, #2
    2634:	00000afa 	strdeq	r0, [r0], -sl
    2638:	00257101 	eoreq	r7, r5, r1, lsl #2
    263c:	05120000 	ldreq	r0, [r2, #-0]
    2640:	0100000b 	tsteq	r0, fp
    2644:	00002572 	andeq	r2, r0, r2, ror r5
    2648:	03731800 	cmneq	r3, #0, 16
    264c:	13050000 	movwne	r0, #20480	; 0x5000
    2650:	00000033 	andeq	r0, r0, r3, lsr r0
    2654:	0000039c 	muleq	r0, ip, r3
    2658:	00039c10 	andeq	r9, r3, r0, lsl ip
    265c:	0d001900 	stceq	9, cr1, [r0, #-0]
    2660:	0003a204 	andeq	sl, r3, r4, lsl #4
    2664:	00251a00 	eoreq	r1, r5, r0, lsl #20
    2668:	101b0000 	andsne	r0, fp, r0
    266c:	0100000b 	tsteq	r0, fp
    2670:	0003b418 	andeq	fp, r3, r8, lsl r4
    2674:	1c001900 	stcne	9, cr1, [r0], {-0}
    2678:	00000497 	muleq	r0, r7, r4
    267c:	03c52303 	biceq	r2, r5, #201326592	; 0xc000000
    2680:	41100000 	tstmi	r0, r0
    2684:	00000000 	andeq	r0, r0, r0
    2688:	0005f61d 	andeq	pc, r5, sp, lsl r6	; <UNPREDICTABLE>
    268c:	412a0300 	teqmi	sl, r0, lsl #6
    2690:	1c000000 	stcne	0, cr0, [r0], {-0}
    2694:	000004df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    2698:	03e12804 	mvneq	r2, #4, 16	; 0x40000
    269c:	33100000 	tstcc	r0, #0
    26a0:	00000000 	andeq	r0, r0, r0
    26a4:	0003181e 	andeq	r1, r3, lr, lsl r8
    26a8:	002d0400 	eoreq	r0, sp, r0, lsl #8
    26ac:	00000057 	andeq	r0, r0, r7, asr r0
    26b0:	0f5e0002 	svceq	0x005e0002
    26b4:	01040000 	mrseq	r0, (UNDEF: 4)
    26b8:	000009ba 			; <UNDEFINED> instruction: 0x000009ba
    26bc:	00008000 	andeq	r8, r0, r0
    26c0:	00008054 	andeq	r8, r0, r4, asr r0
    26c4:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
    26c8:	2f6b6269 	svccs	0x006b6269
    26cc:	2f637273 	svccs	0x00637273
    26d0:	746f6f62 	strbtvc	r6, [pc], #-3938	; 26d8 <__start-0x5928>
    26d4:	2f00532e 	svccs	0x0000532e
    26d8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
    26dc:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
    26e0:	2f393433 	svccs	0x00393433
    26e4:	6f706572 	svcvs	0x00706572
    26e8:	34362f73 	ldrtcc	r2, [r6], #-3955	; 0xf73
    26ec:	31662d32 	cmncc	r6, r2, lsr sp
    26f0:	6f632f36 	svcvs	0x00632f36
    26f4:	47006564 	strmi	r6, [r0, -r4, ror #10]
    26f8:	4120554e 	teqmi	r0, lr, asr #10
    26fc:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    2700:	302e3432 	eorcc	r3, lr, r2, lsr r4
    2704:	56800100 	strpl	r0, [r0], r0, lsl #2
    2708:	02000000 	andeq	r0, r0, #0
    270c:	000f7200 	andeq	r7, pc, r0, lsl #4
    2710:	12010400 	andne	r0, r1, #0, 8
    2714:	3800000a 	stmdacc	r0, {r1, r3}
    2718:	7c00009f 	stcvc	0, cr0, [r0], {159}	; 0x9f
    271c:	3300009f 	movwcc	r0, #159	; 0x9f
    2720:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
    2724:	732f6b62 	teqvc	pc, #100352	; 0x18800
    2728:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
    272c:	532e6d72 	teqpl	lr, #7296	; 0x1c80
    2730:	6f682f00 	svcvs	0x00682f00
    2734:	652f656d 	strvs	r6, [pc, #-1389]!	; 21cf <__start-0x5e31>
    2738:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
    273c:	65722f39 	ldrbvs	r2, [r2, #-3897]!	; 0xf39
    2740:	2f736f70 	svccs	0x00736f70
    2744:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
    2748:	2f363166 	svccs	0x00363166
    274c:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
    2750:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
    2754:	20534120 	subscs	r4, r3, r0, lsr #2
    2758:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
    275c:	0100302e 	tsteq	r0, lr, lsr #32
    2760:	00005780 	andeq	r5, r0, r0, lsl #15
    2764:	86000200 	strhi	r0, [r0], -r0, lsl #4
    2768:	0400000f 	streq	r0, [r0], #-15
    276c:	000a6301 	andeq	r6, sl, r1, lsl #6
    2770:	009f7c00 	addseq	r7, pc, r0, lsl #24
    2774:	00a1c400 	adceq	ip, r1, r0, lsl #8
    2778:	72656b00 	rsbvc	r6, r5, #0, 22
    277c:	2f6c656e 	svccs	0x006c656e
    2780:	2f637273 	svccs	0x00637273
    2784:	65707573 	ldrbvs	r7, [r0, #-1395]!	; 0x573
    2788:	73697672 	cmnvc	r9, #119537664	; 0x7200000
    278c:	532e726f 	teqpl	lr, #-268435450	; 0xf0000006
    2790:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
    2794:	67682f74 			; <UNDEFINED> instruction: 0x67682f74
    2798:	312f7366 	teqcc	pc, r6, ror #6
    279c:	32343634 	eorscc	r3, r4, #52, 12	; 0x3400000
    27a0:	7065722f 	rsbvc	r7, r5, pc, lsr #4
    27a4:	632f736f 	teqvs	pc, #-1140850687	; 0xbc000001
    27a8:	0065646f 	rsbeq	r6, r5, pc, ror #8
    27ac:	20554e47 	subscs	r4, r5, r7, asr #28
    27b0:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    27b4:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    27b8:	80010030 	andhi	r0, r1, r0, lsr r0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1700ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x17e87c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	03000506 	movweq	r0, #1286	; 0x506
  54:	3b0b3a08 	blcc	2ce87c <__end+0x17e87c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000018 	smladeq	r0, r8, r0, r0
  60:	08030034 	stmdaeq	r3, {r2, r4, r5}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a0e0300 	bcc	380c78 <__user_program+0x80c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00180213 	andseq	r0, r8, r3, lsl r2
  7c:	012e0900 	teqeq	lr, r0, lsl #18
  80:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  84:	0b3b0b3a 	bleq	ec2d74 <__user_program+0xbc2d74>
  88:	01111927 	tsteq	r1, r7, lsr #18
  8c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
  90:	01194296 			; <UNDEFINED> instruction: 0x01194296
  94:	0a000013 	beq	e8 <__start-0x7f18>
  98:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
  9c:	0b3b0b3a 	bleq	ec2d8c <__user_program+0xbc2d8c>
  a0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  a4:	0f0b0000 	svceq	0x000b0000
  a8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
  ac:	0c000013 	stceq	0, cr0, [r0], {19}
  b0:	13490035 	movtne	r0, #36917	; 0x9035
  b4:	01000000 	mrseq	r0, (UNDEF: 0)
  b8:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
  bc:	0e030b13 	vmoveq.32	d3[0], r0
  c0:	01110e1b 	tsteq	r1, fp, lsl lr
  c4:	17100612 			; <UNDEFINED> instruction: 0x17100612
  c8:	24020000 	strcs	r0, [r2], #-0
  cc:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  d0:	000e030b 	andeq	r0, lr, fp, lsl #6
  d4:	00240300 	eoreq	r0, r4, r0, lsl #6
  d8:	0b3e0b0b 	bleq	f82d0c <__user_program+0xc82d0c>
  dc:	00000803 	andeq	r0, r0, r3, lsl #16
  e0:	03001604 	movweq	r1, #1540	; 0x604
  e4:	3b0b3a0e 	blcc	2ce924 <__end+0x17e924>
  e8:	0013490b 	andseq	r4, r3, fp, lsl #18
  ec:	01130500 	tsteq	r3, r0, lsl #10
  f0:	0b0b0e03 	bleq	2c3904 <__end+0x173904>
  f4:	0b3b0b3a 	bleq	ec2de4 <__user_program+0xbc2de4>
  f8:	00001301 	andeq	r1, r0, r1, lsl #6
  fc:	03000d06 	movweq	r0, #3334	; 0xd06
 100:	3b0b3a0e 	blcc	2ce940 <__end+0x17e940>
 104:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 108:	0700000b 	streq	r0, [r0, -fp]
 10c:	13490035 	movtne	r0, #36917	; 0x9035
 110:	0f080000 	svceq	0x00080000
 114:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 118:	09000013 	stmdbeq	r0, {r0, r1, r4}
 11c:	19270015 	stmdbne	r7!, {r0, r2, r4}
 120:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 124:	03193f01 	tsteq	r9, #1, 30
 128:	3b0b3a0e 	blcc	2ce968 <__end+0x17e968>
 12c:	1119270b 	tstne	r9, fp, lsl #14
 130:	40061201 	andmi	r1, r6, r1, lsl #4
 134:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 138:	00001301 	andeq	r1, r0, r1, lsl #6
 13c:	0182890b 	orreq	r8, r2, fp, lsl #18
 140:	31011100 	mrscc	r1, (UNDEF: 17)
 144:	0c000013 	stceq	0, cr0, [r0], {19}
 148:	01018289 	smlabbeq	r1, r9, r2, r8
 14c:	13310111 	teqne	r1, #1073741828	; 0x40000004
 150:	00001301 	andeq	r1, r0, r1, lsl #6
 154:	01828a0d 	orreq	r8, r2, sp, lsl #20
 158:	91180200 	tstls	r8, r0, lsl #4
 15c:	00001842 	andeq	r1, r0, r2, asr #16
 160:	3f012e0e 	svccc	0x00012e0e
 164:	3a0e0319 	bcc	380dd0 <__user_program+0x80dd0>
 168:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 16c:	11134919 	tstne	r3, r9, lsl r9
 170:	40061201 	andmi	r1, r6, r1, lsl #4
 174:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 178:	00001301 	andeq	r1, r0, r1, lsl #6
 17c:	0300050f 	movweq	r0, #1295	; 0x50f
 180:	3b0b3a0e 	blcc	2ce9c0 <__end+0x17e9c0>
 184:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 188:	10000017 	andne	r0, r0, r7, lsl r0
 18c:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 190:	0b3b0b3a 	bleq	ec2e80 <__user_program+0xbc2e80>
 194:	17021349 	strne	r1, [r2, -r9, asr #6]
 198:	34110000 	ldrcc	r0, [r1], #-0
 19c:	3a080300 	bcc	200da4 <__end+0xb0da4>
 1a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1a4:	00170213 	andseq	r0, r7, r3, lsl r2
 1a8:	00341200 	eorseq	r1, r4, r0, lsl #4
 1ac:	0b3a0e03 	bleq	e839c0 <__user_program+0xb839c0>
 1b0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1b4:	00001802 	andeq	r1, r0, r2, lsl #16
 1b8:	11010b13 	tstne	r1, r3, lsl fp
 1bc:	00061201 	andeq	r1, r6, r1, lsl #4
 1c0:	00341400 	eorseq	r1, r4, r0, lsl #8
 1c4:	0b3a0803 	bleq	e821d8 <__user_program+0xb821d8>
 1c8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1cc:	00001802 	andeq	r1, r0, r2, lsl #16
 1d0:	0b000f15 	bleq	3e2c <__start-0x41d4>
 1d4:	1600000b 	strne	r0, [r0], -fp
 1d8:	19270115 	stmdbne	r7!, {r0, r2, r4, r8}
 1dc:	00001301 	andeq	r1, r0, r1, lsl #6
 1e0:	49000517 	stmdbmi	r0, {r0, r1, r2, r4, r8, sl}
 1e4:	18000013 	stmdane	r0, {r0, r1, r4}
 1e8:	08030034 	stmdaeq	r3, {r2, r4, r5}
 1ec:	0b3b0b3a 	bleq	ec2edc <__user_program+0xbc2edc>
 1f0:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 1f4:	00001802 	andeq	r1, r0, r2, lsl #16
 1f8:	03003419 	movweq	r3, #1049	; 0x419
 1fc:	3b0b3a0e 	blcc	2cea3c <__end+0x17ea3c>
 200:	3f13490b 	svccc	0x0013490b
 204:	00180219 	andseq	r0, r8, r9, lsl r2
 208:	012e1a00 	teqeq	lr, r0, lsl #20
 20c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 210:	0b3b0b3a 	bleq	ec2f00 <__user_program+0xbc2f00>
 214:	1301193c 	movwne	r1, #6460	; 0x193c
 218:	181b0000 	ldmdane	fp, {}	; <UNPREDICTABLE>
 21c:	1c000000 	stcne	0, cr0, [r0], {-0}
 220:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 224:	0b3a0e03 	bleq	e83a38 <__user_program+0xb83a38>
 228:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 22c:	0000193c 	andeq	r1, r0, ip, lsr r9
 230:	3f012e1d 	svccc	0x00012e1d
 234:	3a0e0319 	bcc	380ea0 <__user_program+0x80ea0>
 238:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 23c:	01193c19 	tsteq	r9, r9, lsl ip
 240:	1e000013 	mcrne	0, 0, r0, cr0, cr3, {0}
 244:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 248:	0b3a0e03 	bleq	e83a5c <__user_program+0xb83a5c>
 24c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 250:	1301193c 	movwne	r1, #6460	; 0x193c
 254:	2e1f0000 	cdpcs	0, 1, cr0, cr15, cr0, {0}
 258:	03193f01 	tsteq	r9, #1, 30
 25c:	3b0b3a0e 	blcc	2cea9c <__end+0x17ea9c>
 260:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 264:	01193c13 	tsteq	r9, r3, lsl ip
 268:	20000013 	andcs	r0, r0, r3, lsl r0
 26c:	13490026 	movtne	r0, #36902	; 0x9026
 270:	2e210000 	cdpcs	0, 2, cr0, cr1, cr0, {0}
 274:	03193f00 	tsteq	r9, #0, 30
 278:	3b0b3a0e 	blcc	2ceab8 <__end+0x17eab8>
 27c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 280:	00193c13 	andseq	r3, r9, r3, lsl ip
 284:	012e2200 	teqeq	lr, r0, lsl #4
 288:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 28c:	0b3b0b3a 	bleq	ec2f7c <__user_program+0xbc2f7c>
 290:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 294:	01000000 	mrseq	r0, (UNDEF: 0)
 298:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 29c:	0e030b13 	vmoveq.32	d3[0], r0
 2a0:	01110e1b 	tsteq	r1, fp, lsl lr
 2a4:	17100612 			; <UNDEFINED> instruction: 0x17100612
 2a8:	16020000 	strne	r0, [r2], -r0
 2ac:	3a0e0300 	bcc	380eb4 <__user_program+0x80eb4>
 2b0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2b4:	03000013 	movweq	r0, #19
 2b8:	0b0b0024 	bleq	2c0350 <__end+0x170350>
 2bc:	0e030b3e 	vmoveq.16	d3[0], r0
 2c0:	24040000 	strcs	r0, [r4], #-0
 2c4:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 2c8:	0008030b 	andeq	r0, r8, fp, lsl #6
 2cc:	01130500 	tsteq	r3, r0, lsl #10
 2d0:	0b0b0e03 	bleq	2c3ae4 <__end+0x173ae4>
 2d4:	0b3b0b3a 	bleq	ec2fc4 <__user_program+0xbc2fc4>
 2d8:	00001301 	andeq	r1, r0, r1, lsl #6
 2dc:	03000d06 	movweq	r0, #3334	; 0xd06
 2e0:	3813490e 	ldmdacc	r3, {r1, r2, r3, r8, fp, lr}
 2e4:	0019340b 	andseq	r3, r9, fp, lsl #8
 2e8:	000f0700 	andeq	r0, pc, r0, lsl #14
 2ec:	00000b0b 	andeq	r0, r0, fp, lsl #22
 2f0:	03012e08 	movweq	r2, #7688	; 0x1e08
 2f4:	3b0b3a0e 	blcc	2ceb34 <__end+0x17eb34>
 2f8:	1119270b 	tstne	r9, fp, lsl #14
 2fc:	40061201 	andmi	r1, r6, r1, lsl #4
 300:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 304:	00001301 	andeq	r1, r0, r1, lsl #6
 308:	03000509 	movweq	r0, #1289	; 0x509
 30c:	3b0b3a0e 	blcc	2ceb4c <__end+0x17eb4c>
 310:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 314:	0a000017 	beq	378 <__start-0x7c88>
 318:	08030005 	stmdaeq	r3, {r0, r2}
 31c:	0b3b0b3a 	bleq	ec300c <__user_program+0xbc300c>
 320:	17021349 	strne	r1, [r2, -r9, asr #6]
 324:	340b0000 	strcc	r0, [fp], #-0
 328:	3a0e0300 	bcc	380f30 <__user_program+0x80f30>
 32c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 330:	00170213 	andseq	r0, r7, r3, lsl r2
 334:	00340c00 	eorseq	r0, r4, r0, lsl #24
 338:	0b3a0803 	bleq	e8234c <__user_program+0xb8234c>
 33c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 340:	00001802 	andeq	r1, r0, r2, lsl #16
 344:	0300340d 	movweq	r3, #1037	; 0x40d
 348:	3b0b3a08 	blcc	2ceb70 <__end+0x17eb70>
 34c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 350:	0e000017 	mcreq	0, 0, r0, cr0, cr7, {0}
 354:	00018289 	andeq	r8, r1, r9, lsl #5
 358:	13310111 	teqne	r1, #1073741828	; 0x40000004
 35c:	0f0f0000 	svceq	0x000f0000
 360:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 364:	10000013 	andne	r0, r0, r3, lsl r0
 368:	13490101 	movtne	r0, #37121	; 0x9101
 36c:	00001301 	andeq	r1, r0, r1, lsl #6
 370:	49002111 	stmdbmi	r0, {r0, r4, r8, sp}
 374:	000b2f13 	andeq	r2, fp, r3, lsl pc
 378:	012e1200 	teqeq	lr, r0, lsl #4
 37c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 380:	0b3b0b3a 	bleq	ec3070 <__user_program+0xbc3070>
 384:	13491927 	movtne	r1, #39207	; 0x9927
 388:	06120111 			; <UNDEFINED> instruction: 0x06120111
 38c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 390:	00130119 	andseq	r0, r3, r9, lsl r1
 394:	00181300 	andseq	r1, r8, r0, lsl #6
 398:	34140000 	ldrcc	r0, [r4], #-0
 39c:	3a0e0300 	bcc	380fa4 <__user_program+0x80fa4>
 3a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3a4:	00180213 	andseq	r0, r8, r3, lsl r2
 3a8:	010b1500 	tsteq	fp, r0, lsl #10
 3ac:	13011755 	movwne	r1, #5973	; 0x1755
 3b0:	89160000 	ldmdbhi	r6, {}	; <UNPREDICTABLE>
 3b4:	11010182 	smlabbne	r1, r2, r1, r0
 3b8:	00133101 	andseq	r3, r3, r1, lsl #2
 3bc:	828a1700 	addhi	r1, sl, #0, 14
 3c0:	18020001 	stmdane	r2, {r0}
 3c4:	00184291 	mulseq	r8, r1, r2
 3c8:	010b1800 	tsteq	fp, r0, lsl #16
 3cc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3d0:	00001301 	andeq	r1, r0, r1, lsl #6
 3d4:	01828919 	orreq	r8, r2, r9, lsl r9
 3d8:	31011101 	tstcc	r1, r1, lsl #2
 3dc:	00130113 	andseq	r0, r3, r3, lsl r1
 3e0:	00261a00 	eoreq	r1, r6, r0, lsl #20
 3e4:	00001349 	andeq	r1, r0, r9, asr #6
 3e8:	3f012e1b 	svccc	0x00012e1b
 3ec:	3a0e0319 	bcc	381058 <__user_program+0x81058>
 3f0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3f4:	00193c19 	andseq	r3, r9, r9, lsl ip
 3f8:	00051c00 	andeq	r1, r5, r0, lsl #24
 3fc:	00001349 	andeq	r1, r0, r9, asr #6
 400:	01110100 	tsteq	r1, r0, lsl #2
 404:	0b130e25 	bleq	4c3ca0 <__user_program+0x1c3ca0>
 408:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 40c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 410:	00001710 	andeq	r1, r0, r0, lsl r7
 414:	0b002402 	bleq	9424 <check_time+0x4>
 418:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 41c:	0300000e 	movweq	r0, #14
 420:	0b0b0024 	bleq	2c04b8 <__end+0x1704b8>
 424:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 428:	16040000 	strne	r0, [r4], -r0
 42c:	3a0e0300 	bcc	381034 <__user_program+0x81034>
 430:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 434:	05000013 	streq	r0, [r0, #-19]
 438:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 43c:	0b3a0e03 	bleq	e83c50 <__user_program+0xb83c50>
 440:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 444:	06120111 			; <UNDEFINED> instruction: 0x06120111
 448:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 44c:	00130119 	andseq	r0, r3, r9, lsl r1
 450:	00050600 	andeq	r0, r5, r0, lsl #12
 454:	0b3a0e03 	bleq	e83c68 <__user_program+0xb83c68>
 458:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 45c:	00001702 	andeq	r1, r0, r2, lsl #14
 460:	3f002e07 	svccc	0x00002e07
 464:	3a0e0319 	bcc	3810d0 <__user_program+0x810d0>
 468:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 46c:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 470:	97184006 	ldrls	r4, [r8, -r6]
 474:	00001942 	andeq	r1, r0, r2, asr #18
 478:	3f012e08 	svccc	0x00012e08
 47c:	3a0e0319 	bcc	3810e8 <__user_program+0x810e8>
 480:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 484:	11134919 	tstne	r3, r9, lsl r9
 488:	40061201 	andmi	r1, r6, r1, lsl #4
 48c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 490:	00001301 	andeq	r1, r0, r1, lsl #6
 494:	03003409 	movweq	r3, #1033	; 0x409
 498:	3b0b3a08 	blcc	2cecc0 <__end+0x17ecc0>
 49c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 4a0:	0a000018 	beq	508 <__start-0x7af8>
 4a4:	08030034 	stmdaeq	r3, {r2, r4, r5}
 4a8:	0b3b0b3a 	bleq	ec3198 <__user_program+0xbc3198>
 4ac:	17021349 	strne	r1, [r2, -r9, asr #6]
 4b0:	01000000 	mrseq	r0, (UNDEF: 0)
 4b4:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 4b8:	0e030b13 	vmoveq.32	d3[0], r0
 4bc:	01110e1b 	tsteq	r1, fp, lsl lr
 4c0:	17100612 			; <UNDEFINED> instruction: 0x17100612
 4c4:	24020000 	strcs	r0, [r2], #-0
 4c8:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 4cc:	000e030b 	andeq	r0, lr, fp, lsl #6
 4d0:	00240300 	eoreq	r0, r4, r0, lsl #6
 4d4:	0b3e0b0b 	bleq	f83108 <__user_program+0xc83108>
 4d8:	00000803 	andeq	r0, r0, r3, lsl #16
 4dc:	03001604 	movweq	r1, #1540	; 0x604
 4e0:	3b0b3a0e 	blcc	2ced20 <__end+0x17ed20>
 4e4:	0013490b 	andseq	r4, r3, fp, lsl #18
 4e8:	012e0500 	teqeq	lr, r0, lsl #10
 4ec:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 4f0:	0b3b0b3a 	bleq	ec31e0 <__user_program+0xbc31e0>
 4f4:	01111927 	tsteq	r1, r7, lsr #18
 4f8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 4fc:	01194297 			; <UNDEFINED> instruction: 0x01194297
 500:	06000013 			; <UNDEFINED> instruction: 0x06000013
 504:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 508:	0b3b0b3a 	bleq	ec31f8 <__user_program+0xbc31f8>
 50c:	17021349 	strne	r1, [r2, -r9, asr #6]
 510:	2e070000 	cdpcs	0, 0, cr0, cr7, cr0, {0}
 514:	03193f01 	tsteq	r9, #1, 30
 518:	3b0b3a0e 	blcc	2ced58 <__end+0x17ed58>
 51c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 520:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 524:	97184006 	ldrls	r4, [r8, -r6]
 528:	13011942 	movwne	r1, #6466	; 0x1942
 52c:	05080000 	streq	r0, [r8, #-0]
 530:	3a080300 	bcc	201138 <__end+0xb1138>
 534:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 538:	00170213 	andseq	r0, r7, r3, lsl r2
 53c:	00340900 	eorseq	r0, r4, r0, lsl #18
 540:	0b3a0e03 	bleq	e83d54 <__user_program+0xb83d54>
 544:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 548:	00001702 	andeq	r1, r0, r2, lsl #14
 54c:	3f012e0a 	svccc	0x00012e0a
 550:	3a0e0319 	bcc	3811bc <__user_program+0x811bc>
 554:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 558:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 55c:	97184006 	ldrls	r4, [r8, -r6]
 560:	13011942 	movwne	r1, #6466	; 0x1942
 564:	340b0000 	strcc	r0, [fp], #-0
 568:	3a080300 	bcc	201170 <__end+0xb1170>
 56c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 570:	00170213 	andseq	r0, r7, r3, lsl r2
 574:	82890c00 	addhi	r0, r9, #0, 24
 578:	01110101 	tsteq	r1, r1, lsl #2
 57c:	13011331 	movwne	r1, #4913	; 0x1331
 580:	8a0d0000 	bhi	340588 <__user_program+0x40588>
 584:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 588:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 58c:	890e0000 	stmdbhi	lr, {}	; <UNPREDICTABLE>
 590:	11000182 	smlabbne	r0, r2, r1, r0
 594:	00133101 	andseq	r3, r3, r1, lsl #2
 598:	82890f00 	addhi	r0, r9, #0, 30
 59c:	01110101 	tsteq	r1, r1, lsl #2
 5a0:	00001331 	andeq	r1, r0, r1, lsr r3
 5a4:	03003410 	movweq	r3, #1040	; 0x410
 5a8:	3b0b3a08 	blcc	2cedd0 <__end+0x17edd0>
 5ac:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 5b0:	11000018 	tstne	r0, r8, lsl r0
 5b4:	08030034 	stmdaeq	r3, {r2, r4, r5}
 5b8:	0b3b0b3a 	bleq	ec32a8 <__user_program+0xbc32a8>
 5bc:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 5c0:	00001802 	andeq	r1, r0, r2, lsl #16
 5c4:	49010112 	stmdbmi	r1, {r1, r4, r8}
 5c8:	00130113 	andseq	r0, r3, r3, lsl r1
 5cc:	00211300 	eoreq	r1, r1, r0, lsl #6
 5d0:	052f1349 	streq	r1, [pc, #-841]!	; 28f <__start-0x7d71>
 5d4:	34140000 	ldrcc	r0, [r4], #-0
 5d8:	3a0e0300 	bcc	3811e0 <__user_program+0x811e0>
 5dc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 5e0:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 5e4:	15000018 	strne	r0, [r0, #-24]
 5e8:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 5ec:	0b3a0e03 	bleq	e83e00 <__user_program+0xb83e00>
 5f0:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 5f4:	1301193c 	movwne	r1, #6460	; 0x193c
 5f8:	05160000 	ldreq	r0, [r6, #-0]
 5fc:	00134900 	andseq	r4, r3, r0, lsl #18
 600:	012e1700 	teqeq	lr, r0, lsl #14
 604:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 608:	0b3b0b3a 	bleq	ec32f8 <__user_program+0xbc32f8>
 60c:	13491927 	movtne	r1, #39207	; 0x9927
 610:	1301193c 	movwne	r1, #6460	; 0x193c
 614:	2e180000 	cdpcs	0, 1, cr0, cr8, cr0, {0}
 618:	03193f00 	tsteq	r9, #0, 30
 61c:	3b0b3a0e 	blcc	2cee5c <__end+0x17ee5c>
 620:	3c19270b 	ldccc	7, cr2, [r9], {11}
 624:	19000019 	stmdbne	r0, {r0, r3, r4}
 628:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 62c:	0b3a0e03 	bleq	e83e40 <__user_program+0xb83e40>
 630:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 634:	0000193c 	andeq	r1, r0, ip, lsr r9
 638:	01110100 	tsteq	r1, r0, lsl #2
 63c:	0b130e25 	bleq	4c3ed8 <__user_program+0x1c3ed8>
 640:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 644:	06120111 			; <UNDEFINED> instruction: 0x06120111
 648:	00001710 	andeq	r1, r0, r0, lsl r7
 64c:	0b002402 	bleq	965c <check_time+0x23c>
 650:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 654:	0300000e 	movweq	r0, #14
 658:	0b0b0024 	bleq	2c06f0 <__end+0x1706f0>
 65c:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 660:	16040000 	strne	r0, [r4], -r0
 664:	3a0e0300 	bcc	38126c <__user_program+0x8126c>
 668:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 66c:	05000013 	streq	r0, [r0, #-19]
 670:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 674:	0b3a0e03 	bleq	e83e88 <__user_program+0xb83e88>
 678:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 67c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 680:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 684:	00130119 	andseq	r0, r3, r9, lsl r1
 688:	82890600 	addhi	r0, r9, #0, 12
 68c:	01110101 	tsteq	r1, r1, lsl #2
 690:	13011331 	movwne	r1, #4913	; 0x1331
 694:	8a070000 	bhi	1c069c <__end+0x7069c>
 698:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 69c:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 6a0:	89080000 	stmdbhi	r8, {}	; <UNPREDICTABLE>
 6a4:	11010182 	smlabbne	r1, r2, r1, r0
 6a8:	00133101 	andseq	r3, r3, r1, lsl #2
 6ac:	002e0900 	eoreq	r0, lr, r0, lsl #18
 6b0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 6b4:	0b3b0b3a 	bleq	ec33a4 <__user_program+0xbc33a4>
 6b8:	01111927 	tsteq	r1, r7, lsr #18
 6bc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 6c0:	00194297 	mulseq	r9, r7, r2
 6c4:	00050a00 	andeq	r0, r5, r0, lsl #20
 6c8:	0b3a0e03 	bleq	e83edc <__user_program+0xb83edc>
 6cc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6d0:	00001802 	andeq	r1, r0, r2, lsl #16
 6d4:	3f012e0b 	svccc	0x00012e0b
 6d8:	3a0e0319 	bcc	381344 <__user_program+0x81344>
 6dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 6e0:	11134919 	tstne	r3, r9, lsl r9
 6e4:	40061201 	andmi	r1, r6, r1, lsl #4
 6e8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 6ec:	00001301 	andeq	r1, r0, r1, lsl #6
 6f0:	0300340c 	movweq	r3, #1036	; 0x40c
 6f4:	3b0b3a08 	blcc	2cef1c <__end+0x17ef1c>
 6f8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 6fc:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 700:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 704:	0b3a0e03 	bleq	e83f18 <__user_program+0xb83f18>
 708:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 70c:	1301193c 	movwne	r1, #6460	; 0x193c
 710:	050e0000 	streq	r0, [lr, #-0]
 714:	00134900 	andseq	r4, r3, r0, lsl #18
 718:	012e0f00 	teqeq	lr, r0, lsl #30
 71c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 720:	0b3b0b3a 	bleq	ec3410 <__user_program+0xbc3410>
 724:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 728:	01000000 	mrseq	r0, (UNDEF: 0)
 72c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 730:	0e030b13 	vmoveq.32	d3[0], r0
 734:	01110e1b 	tsteq	r1, fp, lsl lr
 738:	17100612 			; <UNDEFINED> instruction: 0x17100612
 73c:	24020000 	strcs	r0, [r2], #-0
 740:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 744:	000e030b 	andeq	r0, lr, fp, lsl #6
 748:	00240300 	eoreq	r0, r4, r0, lsl #6
 74c:	0b3e0b0b 	bleq	f83380 <__user_program+0xc83380>
 750:	00000803 	andeq	r0, r0, r3, lsl #16
 754:	03001604 	movweq	r1, #1540	; 0x604
 758:	3b0b3a0e 	blcc	2cef98 <__end+0x17ef98>
 75c:	0013490b 	andseq	r4, r3, fp, lsl #18
 760:	012e0500 	teqeq	lr, r0, lsl #10
 764:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 768:	0b3b0b3a 	bleq	ec3458 <__user_program+0xbc3458>
 76c:	01111927 	tsteq	r1, r7, lsr #18
 770:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 774:	01194296 			; <UNDEFINED> instruction: 0x01194296
 778:	06000013 			; <UNDEFINED> instruction: 0x06000013
 77c:	08030005 	stmdaeq	r3, {r0, r2}
 780:	0b3b0b3a 	bleq	ec3470 <__user_program+0xbc3470>
 784:	17021349 	strne	r1, [r2, -r9, asr #6]
 788:	89070000 	stmdbhi	r7, {}	; <UNPREDICTABLE>
 78c:	11010182 	smlabbne	r1, r2, r1, r0
 790:	01133101 	tsteq	r3, r1, lsl #2
 794:	08000013 	stmdaeq	r0, {r0, r1, r4}
 798:	0001828a 	andeq	r8, r1, sl, lsl #5
 79c:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 7a0:	09000018 	stmdbeq	r0, {r3, r4}
 7a4:	01018289 	smlabbeq	r1, r9, r2, r8
 7a8:	13310111 	teqne	r1, #1073741828	; 0x40000004
 7ac:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 7b0:	03193f01 	tsteq	r9, #1, 30
 7b4:	3b0b3a0e 	blcc	2ceff4 <__end+0x17eff4>
 7b8:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 7bc:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 7c0:	97184006 	ldrls	r4, [r8, -r6]
 7c4:	13011942 	movwne	r1, #6466	; 0x1942
 7c8:	050b0000 	streq	r0, [fp, #-0]
 7cc:	3a0e0300 	bcc	3813d4 <__user_program+0x813d4>
 7d0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 7d4:	00170213 	andseq	r0, r7, r3, lsl r2
 7d8:	000f0c00 	andeq	r0, pc, r0, lsl #24
 7dc:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 7e0:	050d0000 	streq	r0, [sp, #-0]
 7e4:	3a080300 	bcc	2013ec <__end+0xb13ec>
 7e8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 7ec:	00180213 	andseq	r0, r8, r3, lsl r2
 7f0:	012e0e00 	teqeq	lr, r0, lsl #28
 7f4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 7f8:	0b3b0b3a 	bleq	ec34e8 <__user_program+0xbc34e8>
 7fc:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 800:	00001301 	andeq	r1, r0, r1, lsl #6
 804:	4900050f 	stmdbmi	r0, {r0, r1, r2, r3, r8, sl}
 808:	10000013 	andne	r0, r0, r3, lsl r0
 80c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 810:	0b3a0e03 	bleq	e84024 <__user_program+0xb84024>
 814:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 818:	0000193c 	andeq	r1, r0, ip, lsr r9
 81c:	01110100 	tsteq	r1, r0, lsl #2
 820:	0b130e25 	bleq	4c40bc <__user_program+0x1c40bc>
 824:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 828:	06120111 			; <UNDEFINED> instruction: 0x06120111
 82c:	00001710 	andeq	r1, r0, r0, lsl r7
 830:	0b002402 	bleq	9840 <save_context_irq+0x40>
 834:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 838:	0300000e 	movweq	r0, #14
 83c:	0b0b0024 	bleq	2c08d4 <__end+0x1708d4>
 840:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 844:	16040000 	strne	r0, [r4], -r0
 848:	3a0e0300 	bcc	381450 <__user_program+0x81450>
 84c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 850:	05000013 	streq	r0, [r0, #-19]
 854:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 858:	0b3a0e03 	bleq	e8406c <__user_program+0xb8406c>
 85c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 860:	06120111 			; <UNDEFINED> instruction: 0x06120111
 864:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 868:	06000019 			; <UNDEFINED> instruction: 0x06000019
 86c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 870:	0b3a0e03 	bleq	e84084 <__user_program+0xb84084>
 874:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 878:	01111349 	tsteq	r1, r9, asr #6
 87c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 880:	01194297 			; <UNDEFINED> instruction: 0x01194297
 884:	07000013 	smladeq	r0, r3, r0, r0
 888:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 88c:	0b3b0b3a 	bleq	ec357c <__user_program+0xbc357c>
 890:	17021349 	strne	r1, [r2, -r9, asr #6]
 894:	34080000 	strcc	r0, [r8], #-0
 898:	3a0e0300 	bcc	3814a0 <__user_program+0x814a0>
 89c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 8a0:	00180213 	andseq	r0, r8, r3, lsl r2
 8a4:	00340900 	eorseq	r0, r4, r0, lsl #18
 8a8:	0b3a0803 	bleq	e828bc <__user_program+0xb828bc>
 8ac:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 8b0:	00001702 	andeq	r1, r0, r2, lsl #14
 8b4:	0300340a 	movweq	r3, #1034	; 0x40a
 8b8:	3b0b3a0e 	blcc	2cf0f8 <__end+0x17f0f8>
 8bc:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 8c0:	0b000017 	bleq	924 <__start-0x76dc>
 8c4:	0111010b 	tsteq	r1, fp, lsl #2
 8c8:	13010612 	movwne	r0, #5650	; 0x1612
 8cc:	890c0000 	stmdbhi	ip, {}	; <UNPREDICTABLE>
 8d0:	11010182 	smlabbne	r1, r2, r1, r0
 8d4:	01133101 	tsteq	r3, r1, lsl #2
 8d8:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 8dc:	0001828a 	andeq	r8, r1, sl, lsl #5
 8e0:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 8e4:	0e000018 	mcreq	0, 0, r0, cr0, cr8, {0}
 8e8:	01018289 	smlabbeq	r1, r9, r2, r8
 8ec:	13310111 	teqne	r1, #1073741828	; 0x40000004
 8f0:	010f0000 	mrseq	r0, CPSR
 8f4:	01134901 	tsteq	r3, r1, lsl #18
 8f8:	10000013 	andne	r0, r0, r3, lsl r0
 8fc:	13490021 	movtne	r0, #36897	; 0x9021
 900:	00000b2f 	andeq	r0, r0, pc, lsr #22
 904:	03003411 	movweq	r3, #1041	; 0x411
 908:	3b0b3a0e 	blcc	2cf148 <__end+0x17f148>
 90c:	3f13490b 	svccc	0x0013490b
 910:	00180219 	andseq	r0, r8, r9, lsl r2
 914:	012e1200 	teqeq	lr, r0, lsl #4
 918:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 91c:	0b3b0b3a 	bleq	ec360c <__user_program+0xbc360c>
 920:	13491927 	movtne	r1, #39207	; 0x9927
 924:	1301193c 	movwne	r1, #6460	; 0x193c
 928:	05130000 	ldreq	r0, [r3, #-0]
 92c:	00134900 	andseq	r4, r3, r0, lsl #18
 930:	000f1400 	andeq	r1, pc, r0, lsl #8
 934:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 938:	2e150000 	cdpcs	0, 1, cr0, cr5, cr0, {0}
 93c:	03193f01 	tsteq	r9, #1, 30
 940:	3b0b3a0e 	blcc	2cf180 <__end+0x17f180>
 944:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 948:	00193c13 	andseq	r3, r9, r3, lsl ip
 94c:	11010000 	mrsne	r0, (UNDEF: 1)
 950:	130e2501 	movwne	r2, #58625	; 0xe501
 954:	1b0e030b 	blne	381588 <__user_program+0x81588>
 958:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 95c:	00171006 	andseq	r1, r7, r6
 960:	00240200 	eoreq	r0, r4, r0, lsl #4
 964:	0b3e0b0b 	bleq	f83598 <__user_program+0xc83598>
 968:	00000e03 	andeq	r0, r0, r3, lsl #28
 96c:	0b002403 	bleq	9980 <UB_Test+0x8c>
 970:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 974:	04000008 	streq	r0, [r0], #-8
 978:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 97c:	0b3b0b3a 	bleq	ec366c <__user_program+0xbc366c>
 980:	00001349 	andeq	r1, r0, r9, asr #6
 984:	03011305 	movweq	r1, #4869	; 0x1305
 988:	3a0b0b0e 	bcc	2c35c8 <__end+0x1735c8>
 98c:	010b3b0b 	tsteq	fp, fp, lsl #22
 990:	06000013 			; <UNDEFINED> instruction: 0x06000013
 994:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 998:	0b3b0b3a 	bleq	ec3688 <__user_program+0xbc3688>
 99c:	0b381349 	bleq	e056c8 <__user_program+0xb056c8>
 9a0:	35070000 	strcc	r0, [r7, #-0]
 9a4:	00134900 	andseq	r4, r3, r0, lsl #18
 9a8:	000f0800 	andeq	r0, pc, r0, lsl #16
 9ac:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 9b0:	15090000 	strne	r0, [r9, #-0]
 9b4:	00192700 	andseq	r2, r9, r0, lsl #14
 9b8:	01130a00 	tsteq	r3, r0, lsl #20
 9bc:	0b3a0b0b 	bleq	e835f0 <__user_program+0xb835f0>
 9c0:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 9c4:	0d0b0000 	stceq	0, cr0, [fp, #-0]
 9c8:	3a080300 	bcc	2015d0 <__end+0xb15d0>
 9cc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 9d0:	000b3813 	andeq	r3, fp, r3, lsl r8
 9d4:	01010c00 	tsteq	r1, r0, lsl #24
 9d8:	13011349 	movwne	r1, #4937	; 0x1349
 9dc:	210d0000 	mrscs	r0, (UNDEF: 13)
 9e0:	2f134900 	svccs	0x00134900
 9e4:	0e00000b 	cdpeq	0, 0, cr0, cr0, cr11, {0}
 9e8:	08030016 	stmdaeq	r3, {r1, r2, r4}
 9ec:	0b3b0b3a 	bleq	ec36dc <__user_program+0xbc36dc>
 9f0:	00001349 	andeq	r1, r0, r9, asr #6
 9f4:	3f002e0f 	svccc	0x00002e0f
 9f8:	3a0e0319 	bcc	381664 <__user_program+0x81664>
 9fc:	110b3b0b 	tstne	fp, fp, lsl #22
 a00:	40061201 	andmi	r1, r6, r1, lsl #4
 a04:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 a08:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 a0c:	03193f00 	tsteq	r9, #0, 30
 a10:	3b0b3a0e 	blcc	2cf250 <__end+0x17f250>
 a14:	1113490b 	tstne	r3, fp, lsl #18
 a18:	40061201 	andmi	r1, r6, r1, lsl #4
 a1c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 a20:	2e110000 	cdpcs	0, 1, cr0, cr1, cr0, {0}
 a24:	03193f01 	tsteq	r9, #1, 30
 a28:	3b0b3a0e 	blcc	2cf268 <__end+0x17f268>
 a2c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 a30:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 a34:	97184006 	ldrls	r4, [r8, -r6]
 a38:	13011942 	movwne	r1, #6466	; 0x1942
 a3c:	05120000 	ldreq	r0, [r2, #-0]
 a40:	3a080300 	bcc	201648 <__end+0xb1648>
 a44:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 a48:	00170213 	andseq	r0, r7, r3, lsl r2
 a4c:	00051300 	andeq	r1, r5, r0, lsl #6
 a50:	0b3a0e03 	bleq	e84264 <__user_program+0xb84264>
 a54:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 a58:	00001702 	andeq	r1, r0, r2, lsl #14
 a5c:	03000514 	movweq	r0, #1300	; 0x514
 a60:	3b0b3a08 	blcc	2cf288 <__end+0x17f288>
 a64:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 a68:	15000018 	strne	r0, [r0, #-24]
 a6c:	08030034 	stmdaeq	r3, {r2, r4, r5}
 a70:	0b3b0b3a 	bleq	ec3760 <__user_program+0xbc3760>
 a74:	17021349 	strne	r1, [r2, -r9, asr #6]
 a78:	05160000 	ldreq	r0, [r6, #-0]
 a7c:	3a0e0300 	bcc	381684 <__user_program+0x81684>
 a80:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 a84:	00180213 	andseq	r0, r8, r3, lsl r2
 a88:	012e1700 	teqeq	lr, r0, lsl #14
 a8c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 a90:	0b3b0b3a 	bleq	ec3780 <__user_program+0xbc3780>
 a94:	01111927 	tsteq	r1, r7, lsr #18
 a98:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 a9c:	01194297 			; <UNDEFINED> instruction: 0x01194297
 aa0:	18000013 	stmdane	r0, {r0, r1, r4}
 aa4:	00018289 	andeq	r8, r1, r9, lsl #5
 aa8:	13310111 	teqne	r1, #1073741828	; 0x40000004
 aac:	2e190000 	cdpcs	0, 1, cr0, cr9, cr0, {0}
 ab0:	03193f01 	tsteq	r9, #1, 30
 ab4:	3b0b3a0e 	blcc	2cf2f4 <__end+0x17f2f4>
 ab8:	1113490b 	tstne	r3, fp, lsl #18
 abc:	40061201 	andmi	r1, r6, r1, lsl #4
 ac0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 ac4:	00001301 	andeq	r1, r0, r1, lsl #6
 ac8:	0300341a 	movweq	r3, #1050	; 0x41a
 acc:	3b0b3a0e 	blcc	2cf30c <__end+0x17f30c>
 ad0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 ad4:	1b000017 	blne	b38 <__start-0x74c8>
 ad8:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 adc:	0b3a0e03 	bleq	e842f0 <__user_program+0xb842f0>
 ae0:	1349053b 	movtne	r0, #38203	; 0x953b
 ae4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 ae8:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 aec:	00130119 	andseq	r0, r3, r9, lsl r1
 af0:	00341c00 	eorseq	r1, r4, r0, lsl #24
 af4:	0b3a0803 	bleq	e82b08 <__user_program+0xb82b08>
 af8:	1349053b 	movtne	r0, #38203	; 0x953b
 afc:	00001702 	andeq	r1, r0, r2, lsl #14
 b00:	3f002e1d 	svccc	0x00002e1d
 b04:	3a0e0319 	bcc	381770 <__user_program+0x81770>
 b08:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 b0c:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 b10:	97184006 	ldrls	r4, [r8, -r6]
 b14:	00001942 	andeq	r1, r0, r2, asr #18
 b18:	3f012e1e 	svccc	0x00012e1e
 b1c:	3a0e0319 	bcc	381788 <__user_program+0x81788>
 b20:	27053b0b 	strcs	r3, [r5, -fp, lsl #22]
 b24:	11134919 	tstne	r3, r9, lsl r9
 b28:	40061201 	andmi	r1, r6, r1, lsl #4
 b2c:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 b30:	00001301 	andeq	r1, r0, r1, lsl #6
 b34:	0300051f 	movweq	r0, #1311	; 0x51f
 b38:	3b0b3a0e 	blcc	2cf378 <__end+0x17f378>
 b3c:	02134905 	andseq	r4, r3, #81920	; 0x14000
 b40:	20000017 	andcs	r0, r0, r7, lsl r0
 b44:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 b48:	0b3a0e03 	bleq	e8435c <__user_program+0xb8435c>
 b4c:	1927053b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, sl}
 b50:	06120111 			; <UNDEFINED> instruction: 0x06120111
 b54:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 b58:	00130119 	andseq	r0, r3, r9, lsl r1
 b5c:	00052100 	andeq	r2, r5, r0, lsl #2
 b60:	0b3a0e03 	bleq	e84374 <__user_program+0xb84374>
 b64:	1349053b 	movtne	r0, #38203	; 0x953b
 b68:	00001802 	andeq	r1, r0, r2, lsl #16
 b6c:	03000522 	movweq	r0, #1314	; 0x522
 b70:	3b0b3a08 	blcc	2cf398 <__end+0x17f398>
 b74:	02134905 	andseq	r4, r3, #81920	; 0x14000
 b78:	23000018 	movwcs	r0, #24
 b7c:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 b80:	0b3a0e03 	bleq	e84394 <__user_program+0xb84394>
 b84:	1927053b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, sl}
 b88:	06120111 			; <UNDEFINED> instruction: 0x06120111
 b8c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 b90:	24000019 	strcs	r0, [r0], #-25
 b94:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 b98:	0b3a0e03 	bleq	e843ac <__user_program+0xb843ac>
 b9c:	1927053b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, sl}
 ba0:	01111349 	tsteq	r1, r9, asr #6
 ba4:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 ba8:	00194297 	mulseq	r9, r7, r2
 bac:	012e2500 	teqeq	lr, r0, lsl #10
 bb0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 bb4:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 bb8:	13491927 	movtne	r1, #39207	; 0x9927
 bbc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 bc0:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 bc4:	00130119 	andseq	r0, r3, r9, lsl r1
 bc8:	00342600 	eorseq	r2, r4, r0, lsl #12
 bcc:	0b3a0e03 	bleq	e843e0 <__user_program+0xb843e0>
 bd0:	1349053b 	movtne	r0, #38203	; 0x953b
 bd4:	00001702 	andeq	r1, r0, r2, lsl #14
 bd8:	01828927 	orreq	r8, r2, r7, lsr #18
 bdc:	31011101 	tstcc	r1, r1, lsl #2
 be0:	00130113 	andseq	r0, r3, r3, lsl r1
 be4:	828a2800 	addhi	r2, sl, #0, 16
 be8:	18020001 	stmdane	r2, {r0}
 bec:	00184291 	mulseq	r8, r1, r2
 bf0:	00342900 	eorseq	r2, r4, r0, lsl #18
 bf4:	0b3a0e03 	bleq	e84408 <__user_program+0xb84408>
 bf8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 bfc:	00000b1c 	andeq	r0, r0, ip, lsl fp
 c00:	4900212a 	stmdbmi	r0, {r1, r3, r5, r8, sp}
 c04:	00052f13 	andeq	r2, r5, r3, lsl pc
 c08:	00342b00 	eorseq	r2, r4, r0, lsl #22
 c0c:	0b3a0e03 	bleq	e84420 <__user_program+0xb84420>
 c10:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 c14:	1802193f 	stmdane	r2, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 c18:	342c0000 	strtcc	r0, [ip], #-0
 c1c:	3a0e0300 	bcc	381824 <__user_program+0x81824>
 c20:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 c24:	3c193f13 	ldccc	15, cr3, [r9], {19}
 c28:	2d000019 	stccs	0, cr0, [r0, #-100]	; 0xffffff9c
 c2c:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 c30:	0b3a0e03 	bleq	e84444 <__user_program+0xb84444>
 c34:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 c38:	0000193c 	andeq	r1, r0, ip, lsr r9
 c3c:	3f012e2e 	svccc	0x00012e2e
 c40:	3a0e0319 	bcc	3818ac <__user_program+0x818ac>
 c44:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 c48:	3c134919 	ldccc	9, cr4, [r3], {25}
 c4c:	00130119 	andseq	r0, r3, r9, lsl r1
 c50:	00052f00 	andeq	r2, r5, r0, lsl #30
 c54:	00001349 	andeq	r1, r0, r9, asr #6
 c58:	3f012e30 	svccc	0x00012e30
 c5c:	3a0e0319 	bcc	3818c8 <__user_program+0x818c8>
 c60:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 c64:	01193c13 	tsteq	r9, r3, lsl ip
 c68:	31000013 	tstcc	r0, r3, lsl r0
 c6c:	00000018 	andeq	r0, r0, r8, lsl r0
 c70:	3f012e32 	svccc	0x00012e32
 c74:	3a0e0319 	bcc	3818e0 <__user_program+0x818e0>
 c78:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 c7c:	01193c19 	tsteq	r9, r9, lsl ip
 c80:	33000013 	movwcc	r0, #19
 c84:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 c88:	0b3a0e03 	bleq	e8449c <__user_program+0xb8449c>
 c8c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 c90:	0000193c 	andeq	r1, r0, ip, lsr r9
 c94:	01110100 	tsteq	r1, r0, lsl #2
 c98:	0b130e25 	bleq	4c4534 <__user_program+0x1c4534>
 c9c:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 ca0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 ca4:	00001710 	andeq	r1, r0, r0, lsl r7
 ca8:	0b002402 	bleq	9cb8 <spi_begin+0x10>
 cac:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 cb0:	0300000e 	movweq	r0, #14
 cb4:	0b0b0024 	bleq	2c0d4c <__end+0x170d4c>
 cb8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 cbc:	16040000 	strne	r0, [r4], -r0
 cc0:	3a0e0300 	bcc	3818c8 <__user_program+0x818c8>
 cc4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 cc8:	05000013 	streq	r0, [r0, #-19]
 ccc:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 cd0:	0b3a0e03 	bleq	e844e4 <__user_program+0xb844e4>
 cd4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 cd8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 cdc:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 ce0:	00130119 	andseq	r0, r3, r9, lsl r1
 ce4:	00050600 	andeq	r0, r5, r0, lsl #12
 ce8:	0b3a0e03 	bleq	e844fc <__user_program+0xb844fc>
 cec:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 cf0:	00001702 	andeq	r1, r0, r2, lsl #14
 cf4:	03000507 	movweq	r0, #1287	; 0x507
 cf8:	3b0b3a08 	blcc	2cf520 <__end+0x17f520>
 cfc:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 d00:	08000017 	stmdaeq	r0, {r0, r1, r2, r4}
 d04:	08030034 	stmdaeq	r3, {r2, r4, r5}
 d08:	0b3b0b3a 	bleq	ec39f8 <__user_program+0xbc39f8>
 d0c:	17021349 	strne	r1, [r2, -r9, asr #6]
 d10:	89090000 	stmdbhi	r9, {}	; <UNPREDICTABLE>
 d14:	11010182 	smlabbne	r1, r2, r1, r0
 d18:	01133101 	tsteq	r3, r1, lsl #2
 d1c:	0a000013 	beq	d70 <__start-0x7290>
 d20:	0001828a 	andeq	r8, r1, sl, lsl #5
 d24:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 d28:	0b000018 	bleq	d90 <__start-0x7270>
 d2c:	01018289 	smlabbeq	r1, r9, r2, r8
 d30:	13310111 	teqne	r1, #1073741828	; 0x40000004
 d34:	050c0000 	streq	r0, [ip, #-0]
 d38:	3a0e0300 	bcc	381940 <__user_program+0x81940>
 d3c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 d40:	00180213 	andseq	r0, r8, r3, lsl r2
 d44:	00050d00 	andeq	r0, r5, r0, lsl #26
 d48:	0b3a0803 	bleq	e82d5c <__user_program+0xb82d5c>
 d4c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 d50:	00001802 	andeq	r1, r0, r2, lsl #16
 d54:	3f002e0e 	svccc	0x00002e0e
 d58:	3a0e0319 	bcc	3819c4 <__user_program+0x819c4>
 d5c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 d60:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 d64:	97184006 	ldrls	r4, [r8, -r6]
 d68:	00001942 	andeq	r1, r0, r2, asr #18
 d6c:	3f012e0f 	svccc	0x00012e0f
 d70:	3a0e0319 	bcc	3819dc <__user_program+0x819dc>
 d74:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 d78:	11134919 	tstne	r3, r9, lsl r9
 d7c:	40061201 	andmi	r1, r6, r1, lsl #4
 d80:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 d84:	00001301 	andeq	r1, r0, r1, lsl #6
 d88:	3f012e10 	svccc	0x00012e10
 d8c:	3a0e0319 	bcc	3819f8 <__user_program+0x819f8>
 d90:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 d94:	00193c19 	andseq	r3, r9, r9, lsl ip
 d98:	00051100 	andeq	r1, r5, r0, lsl #2
 d9c:	00001349 	andeq	r1, r0, r9, asr #6
 da0:	01110100 	tsteq	r1, r0, lsl #2
 da4:	0b130e25 	bleq	4c4640 <__user_program+0x1c4640>
 da8:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 dac:	06120111 			; <UNDEFINED> instruction: 0x06120111
 db0:	00001710 	andeq	r1, r0, r0, lsl r7
 db4:	0b002402 	bleq	9dc4 <syscall_write+0x14>
 db8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 dbc:	0300000e 	movweq	r0, #14
 dc0:	0b0b0024 	bleq	2c0e58 <__end+0x170e58>
 dc4:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 dc8:	16040000 	strne	r0, [r4], -r0
 dcc:	3a0e0300 	bcc	3819d4 <__user_program+0x819d4>
 dd0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 dd4:	05000013 	streq	r0, [r0, #-19]
 dd8:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 ddc:	0b3a0e03 	bleq	e845f0 <__user_program+0xb845f0>
 de0:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 de4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 de8:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 dec:	00130119 	andseq	r0, r3, r9, lsl r1
 df0:	00050600 	andeq	r0, r5, r0, lsl #12
 df4:	0b3a0e03 	bleq	e84608 <__user_program+0xb84608>
 df8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 dfc:	00001702 	andeq	r1, r0, r2, lsl #14
 e00:	01828907 	orreq	r8, r2, r7, lsl #18
 e04:	31011101 	tstcc	r1, r1, lsl #2
 e08:	00130113 	andseq	r0, r3, r3, lsl r1
 e0c:	828a0800 	addhi	r0, sl, #0, 16
 e10:	18020001 	stmdane	r2, {r0}
 e14:	00184291 	mulseq	r8, r1, r2
 e18:	82890900 	addhi	r0, r9, #0, 18
 e1c:	01110001 	tsteq	r1, r1
 e20:	00001331 	andeq	r1, r0, r1, lsr r3
 e24:	3f012e0a 	svccc	0x00012e0a
 e28:	3a0e0319 	bcc	381a94 <__user_program+0x81a94>
 e2c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 e30:	11134919 	tstne	r3, r9, lsl r9
 e34:	40061201 	andmi	r1, r6, r1, lsl #4
 e38:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 e3c:	00001301 	andeq	r1, r0, r1, lsl #6
 e40:	0300050b 	movweq	r0, #1291	; 0x50b
 e44:	3b0b3a08 	blcc	2cf66c <__end+0x17f66c>
 e48:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 e4c:	0c000017 	stceq	0, cr0, [r0], {23}
 e50:	08030034 	stmdaeq	r3, {r2, r4, r5}
 e54:	0b3b0b3a 	bleq	ec3b44 <__user_program+0xbc3b44>
 e58:	17021349 	strne	r1, [r2, -r9, asr #6]
 e5c:	0f0d0000 	svceq	0x000d0000
 e60:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 e64:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 e68:	01018289 	smlabbeq	r1, r9, r2, r8
 e6c:	13310111 	teqne	r1, #1073741828	; 0x40000004
 e70:	150f0000 	strne	r0, [pc, #-0]	; e78 <__start-0x7188>
 e74:	01192701 	tsteq	r9, r1, lsl #14
 e78:	10000013 	andne	r0, r0, r3, lsl r0
 e7c:	13490005 	movtne	r0, #36869	; 0x9005
 e80:	2e110000 	cdpcs	0, 1, cr0, cr1, cr0, {0}
 e84:	03193f01 	tsteq	r9, #1, 30
 e88:	3b0b3a0e 	blcc	2cf6c8 <__end+0x17f6c8>
 e8c:	1113490b 	tstne	r3, fp, lsl #18
 e90:	40061201 	andmi	r1, r6, r1, lsl #4
 e94:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 e98:	00001301 	andeq	r1, r0, r1, lsl #6
 e9c:	03003412 	movweq	r3, #1042	; 0x412
 ea0:	3b0b3a0e 	blcc	2cf6e0 <__end+0x17f6e0>
 ea4:	3f13490b 	svccc	0x0013490b
 ea8:	00193c19 	andseq	r3, r9, r9, lsl ip
 eac:	00341300 	eorseq	r1, r4, r0, lsl #6
 eb0:	0b3a0e03 	bleq	e846c4 <__user_program+0xb846c4>
 eb4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 eb8:	00001802 	andeq	r1, r0, r2, lsl #16
 ebc:	0b000f14 	bleq	4b14 <__start-0x34ec>
 ec0:	1500000b 	strne	r0, [r0, #-11]
 ec4:	08030005 	stmdaeq	r3, {r0, r2}
 ec8:	0b3b0b3a 	bleq	ec3bb8 <__user_program+0xbc3bb8>
 ecc:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 ed0:	34160000 	ldrcc	r0, [r6], #-0
 ed4:	3a0e0300 	bcc	381adc <__user_program+0x81adc>
 ed8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 edc:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 ee0:	17000018 	smladne	r0, r8, r0, r0
 ee4:	08030034 	stmdaeq	r3, {r2, r4, r5}
 ee8:	0b3b0b3a 	bleq	ec3bd8 <__user_program+0xbc3bd8>
 eec:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 ef0:	0000193c 	andeq	r1, r0, ip, lsr r9
 ef4:	3f012e18 	svccc	0x00012e18
 ef8:	3a0e0319 	bcc	381b64 <__user_program+0x81b64>
 efc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 f00:	3c134919 	ldccc	9, cr4, [r3], {25}
 f04:	00130119 	andseq	r0, r3, r9, lsl r1
 f08:	00181900 	andseq	r1, r8, r0, lsl #18
 f0c:	261a0000 	ldrcs	r0, [sl], -r0
 f10:	00134900 	andseq	r4, r3, r0, lsl #18
 f14:	012e1b00 	teqeq	lr, r0, lsl #22
 f18:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 f1c:	0b3b0b3a 	bleq	ec3c0c <__user_program+0xbc3c0c>
 f20:	1301193c 	movwne	r1, #6460	; 0x193c
 f24:	2e1c0000 	cdpcs	0, 1, cr0, cr12, cr0, {0}
 f28:	03193f01 	tsteq	r9, #1, 30
 f2c:	3b0b3a0e 	blcc	2cf76c <__end+0x17f76c>
 f30:	3c19270b 	ldccc	7, cr2, [r9], {11}
 f34:	00130119 	andseq	r0, r3, r9, lsl r1
 f38:	002e1d00 	eoreq	r1, lr, r0, lsl #26
 f3c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 f40:	0b3b0b3a 	bleq	ec3c30 <__user_program+0xbc3c30>
 f44:	13491927 	movtne	r1, #39207	; 0x9927
 f48:	0000193c 	andeq	r1, r0, ip, lsr r9
 f4c:	3f002e1e 	svccc	0x00002e1e
 f50:	3a0e0319 	bcc	381bbc <__user_program+0x81bbc>
 f54:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 f58:	00193c19 	andseq	r3, r9, r9, lsl ip
 f5c:	11010000 	mrsne	r0, (UNDEF: 1)
 f60:	11061000 	mrsne	r1, (UNDEF: 6)
 f64:	03011201 	movweq	r1, #4609	; 0x1201
 f68:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 f6c:	00051308 	andeq	r1, r5, r8, lsl #6
 f70:	11010000 	mrsne	r0, (UNDEF: 1)
 f74:	11061000 	mrsne	r1, (UNDEF: 6)
 f78:	03011201 	movweq	r1, #4609	; 0x1201
 f7c:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 f80:	00051308 	andeq	r1, r5, r8, lsl #6
 f84:	11010000 	mrsne	r0, (UNDEF: 1)
 f88:	11061000 	mrsne	r1, (UNDEF: 6)
 f8c:	03011201 	movweq	r1, #4609	; 0x1201
 f90:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 f94:	00051308 	andeq	r1, r5, r8, lsl #6
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000320 	andeq	r0, r0, r0, lsr #6
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01660002 	cmneq	r6, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008374 	andeq	r8, r0, r4, ror r3
  34:	000001fc 	strdeq	r0, [r0], -ip
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	065e0002 	ldrbeq	r0, [lr], -r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008570 	andeq	r8, r0, r0, ror r5
  54:	00000298 	muleq	r0, r8, r2
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	09520002 	ldmdbeq	r2, {r1}^
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008808 	andeq	r8, r0, r8, lsl #16
  74:	000000bc 	strheq	r0, [r0], -ip
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	0a500002 	beq	1400094 <__user_program+0x1100094>
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000088c4 	andeq	r8, r0, r4, asr #17
  94:	0000039c 	muleq	r0, ip, r3
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	126e0002 	rsbne	r0, lr, #2
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008c60 	andeq	r8, r0, r0, ror #24
  b4:	000000ec 	andeq	r0, r0, ip, ror #1
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	13d70002 	bicsne	r0, r7, #2
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008d4c 	andeq	r8, r0, ip, asr #26
  d4:	00000218 	andeq	r0, r0, r8, lsl r2
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	15910002 	ldrne	r0, [r1, #2]
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008f64 	andeq	r8, r0, r4, ror #30
  f4:	000000ac 	andeq	r0, r0, ip, lsr #1
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	17700002 	ldrbne	r0, [r0, -r2]!
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00009010 	andeq	r9, r0, r0, lsl r0
 114:	00000c04 	andeq	r0, r0, r4, lsl #24
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	20a90002 	adccs	r0, r9, r2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00009c14 	andeq	r9, r0, r4, lsl ip
 134:	00000180 	andeq	r0, r0, r0, lsl #3
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	22c30002 	sbccs	r0, r3, #2
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	00009d94 	muleq	r0, r4, sp
 154:	000001a4 	andeq	r0, r0, r4, lsr #3
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	26ac0002 	strtcs	r0, [ip], r2
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00008000 	andeq	r8, r0, r0
 174:	00000054 	andeq	r0, r0, r4, asr r0
	...
 180:	0000001c 	andeq	r0, r0, ip, lsl r0
 184:	27070002 	strcs	r0, [r7, -r2]
 188:	00040000 	andeq	r0, r4, r0
 18c:	00000000 	andeq	r0, r0, r0
 190:	00009f38 	andeq	r9, r0, r8, lsr pc
 194:	00000044 	andeq	r0, r0, r4, asr #32
	...
 1a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a4:	27610002 	strbcs	r0, [r1, -r2]!
 1a8:	00040000 	andeq	r0, r4, r0
 1ac:	00000000 	andeq	r0, r0, r0
 1b0:	00009f7c 	andeq	r9, r0, ip, ror pc
 1b4:	00000248 	andeq	r0, r0, r8, asr #4
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000092 	muleq	r0, r2, r0
   4:	00460002 	subeq	r0, r6, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	33010000 	movwcc	r0, #4096	; 0x1000
  1c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  20:	732f6b62 	teqvc	pc, #100352	; 0x18800
  24:	33006372 	movwcc	r6, #882	; 0x372
  28:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  2c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
  30:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  34:	00006564 	andeq	r6, r0, r4, ror #10
  38:	6f697067 	svcvs	0x00697067
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	736b0000 	cmnvc	fp, #0
  44:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  48:	00682e74 	rsbeq	r2, r8, r4, ror lr
  4c:	00000002 	andeq	r0, r0, r2
  50:	54020500 	strpl	r0, [r2], #-1280	; 0x500
  54:	03000080 	movweq	r0, #128	; 0x80
  58:	f30100d3 	vqadd.u8	q0, <illegal reg q8.5>, <illegal reg q1.5>
  5c:	01040200 	mrseq	r0, R12_usr
  60:	67066606 	strvs	r6, [r6, -r6, lsl #12]
  64:	08f4d831 	ldmeq	r4!, {r0, r4, r5, fp, ip, lr, pc}^
  68:	f3d7f3e5 			; <UNDEFINED> instruction: 0xf3d7f3e5
  6c:	30679f69 	rsbcc	r9, r7, r9, ror #30
  70:	f43e0867 			; <UNDEFINED> instruction: 0xf43e0867
  74:	30679f69 	rsbcc	r9, r7, r9, ror #30
  78:	f43e0867 			; <UNDEFINED> instruction: 0xf43e0867
  7c:	0200f369 	andeq	pc, r0, #-1543503871	; 0xa4000001
  80:	66060104 	strvs	r0, [r6], -r4, lsl #2
  84:	bb316706 	bllt	c59ca4 <__user_program+0x959ca4>
  88:	2108674b 	tstcs	r8, fp, asr #14
  8c:	4bf3d84b 	blmi	ffcf61c0 <__user_program+0xff9f61c0>
  90:	000402bc 			; <UNDEFINED> instruction: 0x000402bc
  94:	01330101 	teqeq	r3, r1, lsl #2
  98:	00020000 	andeq	r0, r2, r0
  9c:	000000e5 	andeq	r0, r0, r5, ror #1
  a0:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  a4:	0101000d 	tsteq	r1, sp
  a8:	00000101 	andeq	r0, r0, r1, lsl #2
  ac:	00000100 	andeq	r0, r0, r0, lsl #2
  b0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
  b4:	2f6c656e 	svccs	0x006c656e
  b8:	00637273 	rsbeq	r7, r3, r3, ror r2
  bc:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
  c0:	2f6b6269 	svccs	0x006b6269
  c4:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
  c8:	00656475 	rsbeq	r6, r5, r5, ror r4
  cc:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
  d0:	692f6c65 	stmdbvs	pc!, {r0, r2, r5, r6, sl, fp, sp, lr}	; <UNPREDICTABLE>
  d4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  d8:	6e006564 	cfsh32vs	mvfx6, mvfx0, #52
  dc:	696c7765 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
  e0:	34332f62 	ldrtcc	r2, [r3], #-3938	; 0xf62
  e4:	636e6939 	cmnvs	lr, #933888	; 0xe4000
  e8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
  ec:	656b0000 	strbvs	r0, [fp, #-0]!
  f0:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
  f4:	0100632e 	tsteq	r0, lr, lsr #6
  f8:	736b0000 	cmnvc	fp, #0
  fc:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 100:	00682e74 	rsbeq	r2, r8, r4, ror lr
 104:	6d000002 	stcvs	0, cr0, [r0, #-8]
 108:	78657475 	stmdavc	r5!, {r0, r2, r4, r5, r6, sl, ip, sp, lr}^
 10c:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 110:	00682e65 	rsbeq	r2, r8, r5, ror #28
 114:	73000003 	movwvc	r0, #3
 118:	61637379 	smcvs	14137	; 0x3739
 11c:	745f6c6c 	ldrbvc	r6, [pc], #-3180	; 124 <__start-0x7edc>
 120:	61657268 	cmnvs	r5, r8, ror #4
 124:	00682e64 	rsbeq	r2, r8, r4, ror #28
 128:	74000004 	strvc	r0, [r0], #-4
 12c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 130:	0300682e 	movweq	r6, #2094	; 0x82e
 134:	72610000 	rsbvc	r0, r1, #0
 138:	00682e6d 	rsbeq	r2, r8, sp, ror #28
 13c:	75000002 	strvc	r0, [r0, #-2]
 140:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 144:	00030068 	andeq	r0, r3, r8, rrx
 148:	72637300 	rsbvc	r7, r3, #0, 6
 14c:	2e6e6565 	cdpcs	5, 6, cr6, cr14, cr5, {3}
 150:	00030068 	andeq	r0, r3, r8, rrx
 154:	63326900 	teqvs	r2, #0, 18
 158:	0300682e 	movweq	r6, #2094	; 0x82e
 15c:	72700000 	rsbsvc	r0, r0, #0
 160:	6b746e69 	blvs	1d1bb0c <__user_program+0x1a1bb0c>
 164:	0300682e 	movweq	r6, #2094	; 0x82e
 168:	79730000 	ldmdbvc	r3!, {}^	; <UNPREDICTABLE>
 16c:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 170:	682e736c 	stmdavs	lr!, {r2, r3, r5, r6, r8, r9, ip, sp, lr}
 174:	00000300 	andeq	r0, r0, r0, lsl #6
 178:	65726854 	ldrbvs	r6, [r2, #-2132]!	; 0x854
 17c:	682e6461 	stmdavs	lr!, {r0, r5, r6, sl, sp, lr}
 180:	00000300 	andeq	r0, r0, r0, lsl #6
 184:	02050000 	andeq	r0, r5, #0
 188:	00008374 	andeq	r8, r0, r4, ror r3
 18c:	2f012803 	svccs	0x00012803
 190:	2f2f2f2f 	svccs	0x002f2f2f
 194:	2f2f2f4b 	svccs	0x002f2f4b
 198:	672f522f 	strvs	r5, [pc, -pc, lsr #4]!
 19c:	694a0e03 	stmdbvs	sl, {r0, r1, r9, sl, fp}^
 1a0:	182a024b 	stmdane	sl!, {r0, r1, r3, r6, r9}
 1a4:	304b309f 	umaalcc	r3, fp, pc, r0	; <UNPREDICTABLE>
 1a8:	9f338369 	svcls	0x00338369
 1ac:	4b309f30 	blmi	c27e74 <__user_program+0x927e74>
 1b0:	f3308330 	vcge.u<illegal width 64>	d8, d0, d16
 1b4:	2f304b30 	svccs	0x00304b30
 1b8:	4b4b4b4c 	blmi	12d2ef0 <__user_program+0xfd2ef0>
 1bc:	30833067 	addcc	r3, r3, r7, rrx
 1c0:	2f4b4c4b 	svccs	0x004b4c4b
 1c4:	2f4e2f4b 	svccs	0x004e2f4b
 1c8:	01000402 	tsteq	r0, r2, lsl #8
 1cc:	0000e001 	andeq	lr, r0, r1
 1d0:	7b000200 	blvc	9d8 <__start-0x7628>
 1d4:	02000000 	andeq	r0, r0, #0
 1d8:	0d0efb01 	vstreq	d15, [lr, #-4]
 1dc:	01010100 	mrseq	r0, (UNDEF: 17)
 1e0:	00000001 	andeq	r0, r0, r1
 1e4:	01000001 	tsteq	r0, r1
 1e8:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1ec:	732f6c65 	teqvc	pc, #25856	; 0x6500
 1f0:	33006372 	movwcc	r6, #882	; 0x372
 1f4:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 1f8:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 1fc:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 200:	6b006564 	blvs	19798 <thread14_svc_stack+0x780>
 204:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 208:	6e692f6c 	cdpvs	15, 6, cr2, cr9, cr12, {3}
 20c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 210:	70000065 	andvc	r0, r0, r5, rrx
 214:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 218:	00632e6b 	rsbeq	r2, r3, fp, ror #28
 21c:	6b000001 	blvs	228 <__start-0x7dd8>
 220:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 224:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 228:	00000200 	andeq	r0, r0, r0, lsl #4
 22c:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 230:	2e677261 	cdpcs	2, 6, cr7, cr7, cr1, {3}
 234:	00020068 	andeq	r0, r2, r8, rrx
 238:	75623c00 	strbvc	r3, [r2, #-3072]!	; 0xc00
 23c:	2d746c69 	ldclcs	12, cr6, [r4, #-420]!	; 0xfffffe5c
 240:	003e6e69 	eorseq	r6, lr, r9, ror #28
 244:	75000000 	strvc	r0, [r0, #-0]
 248:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 24c:	00030068 	andeq	r0, r3, r8, rrx
 250:	05000000 	streq	r0, [r0, #-0]
 254:	00857002 	addeq	r7, r5, r2
 258:	01200300 	teqeq	r0, r0, lsl #6
 25c:	009c4d88 	addseq	r4, ip, r8, lsl #27
 260:	4c010402 	cfstrsmi	mvf0, [r1], {2}
 264:	01040200 	mrseq	r0, R12_usr
 268:	04020033 	streq	r0, [r2], #-51	; 0x33
 26c:	00590801 	subseq	r0, r9, r1, lsl #16
 270:	d7010402 	strle	r0, [r1, -r2, lsl #8]
 274:	9b6a4b4d 	blls	1a92fb0 <__user_program+0x1792fb0>
 278:	6949872d 	stmdbvs	r9, {r0, r2, r3, r5, r8, r9, sl, pc}^
 27c:	2003854d 	andcs	r8, r3, sp, asr #10
 280:	5c03514a 	stfpls	f5, [r3], {74}	; 0x4a
 284:	4b4b302e 	blmi	12cc344 <__user_program+0xfcc344>
 288:	152c0232 	strne	r0, [ip, #-562]!	; 0x232
 28c:	a04b4b83 	subge	r4, fp, r3, lsl #23
 290:	328367a4 	addcc	r6, r3, #164, 14	; 0x2900000
 294:	67338367 	ldrvs	r8, [r3, -r7, ror #6]!
 298:	67833283 	strvs	r3, [r3, r3, lsl #5]
 29c:	4b678a2d 	blmi	19e2b58 <__user_program+0x16e2b58>
 2a0:	4d334b32 	vldmdbmi	r3!, {d4-d28}
 2a4:	2e7fbf03 	cdpcs	15, 7, cr11, cr15, cr3, {0}
 2a8:	6600c603 	strvs	ip, [r0], -r3, lsl #12
 2ac:	01000802 	tsteq	r0, r2, lsl #16
 2b0:	00006c01 	andeq	r6, r0, r1, lsl #24
 2b4:	46000200 	strmi	r0, [r0], -r0, lsl #4
 2b8:	02000000 	andeq	r0, r0, #0
 2bc:	0d0efb01 	vstreq	d15, [lr, #-4]
 2c0:	01010100 	mrseq	r0, (UNDEF: 17)
 2c4:	00000001 	andeq	r0, r0, r1
 2c8:	01000001 	tsteq	r0, r1
 2cc:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2d0:	732f6c65 	teqvc	pc, #25856	; 0x6500
 2d4:	33006372 	movwcc	r6, #882	; 0x372
 2d8:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 2dc:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 2e0:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 2e4:	00006564 	andeq	r6, r0, r4, ror #10
 2e8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 2ec:	00632e72 	rsbeq	r2, r3, r2, ror lr
 2f0:	6b000001 	blvs	2fc <__start-0x7d04>
 2f4:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 2f8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 2fc:	00000200 	andeq	r0, r0, r0, lsl #4
 300:	02050000 	andeq	r0, r5, #0
 304:	00008808 	andeq	r8, r0, r8, lsl #16
 308:	4b011003 	blmi	4431c <__bss_end+0x1531c>
 30c:	6b4b67bb 	blvs	12da200 <__user_program+0xfda200>
 310:	13869f13 	orrne	r9, r6, #19, 30	; 0x4c
 314:	68133068 	ldmdavs	r3, {r3, r5, r6, ip, sp}
 318:	819f144d 	orrshi	r1, pc, sp, asr #8
 31c:	01000802 	tsteq	r0, r2, lsl #16
 320:	00011c01 	andeq	r1, r1, r1, lsl #24
 324:	69000200 	stmdbvs	r0, {r9}
 328:	02000000 	andeq	r0, r0, #0
 32c:	0d0efb01 	vstreq	d15, [lr, #-4]
 330:	01010100 	mrseq	r0, (UNDEF: 17)
 334:	00000001 	andeq	r0, r0, r1
 338:	01000001 	tsteq	r0, r1
 33c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 340:	732f6c65 	teqvc	pc, #25856	; 0x6500
 344:	33006372 	movwcc	r6, #882	; 0x372
 348:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 34c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 350:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 354:	6b006564 	blvs	198ec <thread14_svc_stack+0x8d4>
 358:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 35c:	6e692f6c 	cdpvs	15, 6, cr2, cr9, cr12, {3}
 360:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 364:	73000065 	movwvc	r0, #101	; 0x65
 368:	65657263 	strbvs	r7, [r5, #-611]!	; 0x263
 36c:	00632e6e 	rsbeq	r2, r3, lr, ror #28
 370:	6b000001 	blvs	37c <__start-0x7c84>
 374:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 378:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 37c:	00000200 	andeq	r0, r0, r0, lsl #4
 380:	6f697067 	svcvs	0x00697067
 384:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 388:	70730000 	rsbsvc	r0, r3, r0
 38c:	00682e69 	rsbeq	r2, r8, r9, ror #28
 390:	00000003 	andeq	r0, r0, r3
 394:	c4020500 	strgt	r0, [r2], #-1280	; 0x500
 398:	19000088 	stmdbne	r0, {r3, r7}
 39c:	8a2d6713 	bhi	b59ff0 <__user_program+0x859ff0>
 3a0:	302d6814 	eorcc	r6, sp, r4, lsl r8
 3a4:	832f494c 	teqhi	pc, #76, 18	; 0x130000
 3a8:	352e7a03 	strcc	r7, [lr, #-2563]!	; 0xa03
 3ac:	2d681431 	cfstrdcs	mvd1, [r8, #-196]!	; 0xffffff3c
 3b0:	2f494c30 	svccs	0x00494c30
 3b4:	2e7a0383 	cdpcs	3, 7, cr0, cr10, cr3, {4}
 3b8:	004c3235 	subeq	r3, ip, r5, lsr r2
 3bc:	06030402 	streq	r0, [r3], -r2, lsl #8
 3c0:	0368062e 	cmneq	r8, #48234496	; 0x2e00000
 3c4:	4b4c6611 	blmi	1319c10 <__user_program+0x1019c10>
 3c8:	4e4b674b 	cdpmi	7, 4, cr6, cr11, cr11, {2}
 3cc:	674b4b4c 	strbvs	r4, [fp, -ip, asr #22]
 3d0:	672f4d4b 	strvs	r4, [pc, -fp, asr #26]!
 3d4:	4b4b674b 	blmi	12da108 <__user_program+0xfda108>
 3d8:	2f661903 	svccs	0x00661903
 3dc:	4b67672f 	blmi	19da0a0 <__user_program+0x16da0a0>
 3e0:	4b694c4b 	blmi	1a53514 <__user_program+0x1753514>
 3e4:	4b4b4b4b 	blmi	12d3118 <__user_program+0xfd3118>
 3e8:	4b4b4b4b 	blmi	12d311c <__user_program+0xfd311c>
 3ec:	4b4b4b4b 	blmi	12d3120 <__user_program+0xfd3120>
 3f0:	4b4b4b4b 	blmi	12d3124 <__user_program+0xfd3124>
 3f4:	4b4b4b4b 	blmi	12d3128 <__user_program+0xfd3128>
 3f8:	694b4b4b 	stmdbvs	fp, {r0, r1, r3, r6, r8, r9, fp, lr}^
 3fc:	4b4b4b2f 	blmi	12d30c0 <__user_program+0xfd30c0>
 400:	94034b4b 	strls	r4, [r3], #-2891	; 0xb4b
 404:	2f31667f 	svccs	0x0031667f
 408:	0402004b 	streq	r0, [r2], #-75	; 0x4b
 40c:	0200a103 	andeq	sl, r0, #-1073741824	; 0xc0000000
 410:	4d490304 	stclmi	3, cr0, [r9, #-16]
 414:	661e0330 			; <UNDEFINED> instruction: 0x661e0330
 418:	844b2f31 	strbhi	r2, [fp], #-3889	; 0xf31
 41c:	03040200 	movweq	r0, #16896	; 0x4200
 420:	02004a06 	andeq	r4, r0, #24576	; 0x6000
 424:	9d060304 	stcls	3, cr0, [r6, #-16]
 428:	30bd2f4c 	adcscc	r2, sp, ip, asr #30
 42c:	00844b2f 	addeq	r4, r4, pc, lsr #22
 430:	06030402 	streq	r0, [r3], -r2, lsl #8
 434:	0402002e 	streq	r0, [r2], #-46	; 0x2e
 438:	4c490603 	mcrrmi	6, 0, r0, r9, cr3
 43c:	01000402 	tsteq	r0, r2, lsl #8
 440:	00008601 	andeq	r8, r0, r1, lsl #12
 444:	4f000200 	svcmi	0x00000200
 448:	02000000 	andeq	r0, r0, #0
 44c:	0d0efb01 	vstreq	d15, [lr, #-4]
 450:	01010100 	mrseq	r0, (UNDEF: 17)
 454:	00000001 	andeq	r0, r0, r1
 458:	01000001 	tsteq	r0, r1
 45c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 460:	732f6c65 	teqvc	pc, #25856	; 0x6500
 464:	33006372 	movwcc	r6, #882	; 0x372
 468:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 46c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 470:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 474:	00006564 	andeq	r6, r0, r4, ror #10
 478:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 47c:	0100632e 	tsteq	r0, lr, lsr #6
 480:	736b0000 	cmnvc	fp, #0
 484:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 488:	00682e74 	rsbeq	r2, r8, r4, ror lr
 48c:	67000002 	strvs	r0, [r0, -r2]
 490:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
 494:	00020068 	andeq	r0, r2, r8, rrx
 498:	05000000 	streq	r0, [r0, #-0]
 49c:	008c6002 	addeq	r6, ip, r2
 4a0:	01180300 	tsteq	r8, r0, lsl #6
 4a4:	67676730 			; <UNDEFINED> instruction: 0x67676730
 4a8:	4b4b8368 	blmi	12e1250 <__user_program+0xfe1250>
 4ac:	9f13864b 	svcls	0x0013864b
 4b0:	0200136a 	andeq	r1, r0, #-1476395007	; 0xa8000001
 4b4:	4a060104 	bmi	1808cc <__end+0x308cc>
 4b8:	13866706 	orrne	r6, r6, #1572864	; 0x180000
 4bc:	0402009f 	streq	r0, [r2], #-159	; 0x9f
 4c0:	064a0601 	strbeq	r0, [sl], -r1, lsl #12
 4c4:	04026867 	streq	r6, [r2], #-2151	; 0x867
 4c8:	a8010100 	stmdage	r1, {r8}
 4cc:	02000000 	andeq	r0, r0, #0
 4d0:	00004e00 	andeq	r4, r0, r0, lsl #28
 4d4:	fb010200 	blx	40cde <__bss_end+0x11cde>
 4d8:	01000d0e 	tsteq	r0, lr, lsl #26
 4dc:	00010101 	andeq	r0, r1, r1, lsl #2
 4e0:	00010000 	andeq	r0, r1, r0
 4e4:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 4e8:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 4ec:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 4f0:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 4f4:	6b62696c 	blvs	189aaac <__user_program+0x159aaac>
 4f8:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 4fc:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 500:	32690000 	rsbcc	r0, r9, #0
 504:	00632e63 	rsbeq	r2, r3, r3, ror #28
 508:	6b000001 	blvs	514 <__start-0x7aec>
 50c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 510:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 514:	00000200 	andeq	r0, r0, r0, lsl #4
 518:	6f697067 	svcvs	0x00697067
 51c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 520:	00000000 	andeq	r0, r0, r0
 524:	8d4c0205 	sfmhi	f0, 2, [ip, #-20]	; 0xffffffec
 528:	16030000 	strne	r0, [r3], -r0
 52c:	67674b01 	strbvs	r4, [r7, -r1, lsl #22]!
 530:	03836767 	orreq	r6, r3, #27000832	; 0x19c0000
 534:	9f13f20f 	svcls	0x0013f20f
 538:	4b302f83 	blmi	c0c34c <__user_program+0x90c34c>
 53c:	01040200 	mrseq	r0, R12_usr
 540:	03064a06 	movweq	r4, #27142	; 0x6a06
 544:	00366679 	eorseq	r6, r6, r9, ror r6
 548:	68010402 	stmdavs	r1, {r1, sl}
 54c:	4b4bf467 	blmi	12fd6f0 <__user_program+0xffd6f0>
 550:	7703a42a 	strvc	sl, [r3, -sl, lsr #8]
 554:	660e0366 	strvs	r0, [lr], -r6, ror #6
 558:	0e03329b 	mcreq	2, 0, r3, cr3, cr11, {4}
 55c:	2fbb132e 	svccs	0x00bb132e
 560:	64684c2f 	strbtvs	r4, [r8], #-3119	; 0xc2f
 564:	8880a06d 	stmhi	r0, {r0, r2, r3, r5, r6, sp, pc}
 568:	039fa580 	orrseq	sl, pc, #128, 10	; 0x20000000
 56c:	0b034a71 	bleq	d2f38 <__bss_end+0xa3f38>
 570:	0202334a 	andeq	r3, r2, #671088641	; 0x28000001
 574:	85010100 	strhi	r0, [r1, #-256]	; 0x100
 578:	02000000 	andeq	r0, r0, #0
 57c:	00006000 	andeq	r6, r0, r0
 580:	fb010200 	blx	40d8a <__bss_end+0x11d8a>
 584:	01000d0e 	tsteq	r0, lr, lsl #26
 588:	00010101 	andeq	r0, r1, r1, lsl #2
 58c:	00010000 	andeq	r0, r1, r0
 590:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 594:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 598:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 59c:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 5a0:	6b62696c 	blvs	189ab58 <__user_program+0x159ab58>
 5a4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 5a8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 5ac:	72656b00 	rsbvc	r6, r5, #0, 22
 5b0:	2f6c656e 	svccs	0x006c656e
 5b4:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 5b8:	00656475 	rsbeq	r6, r5, r5, ror r4
 5bc:	73646100 	cmnvc	r4, #0, 2
 5c0:	35313031 	ldrcc	r3, [r1, #-49]!	; 0x31
 5c4:	0100632e 	tsteq	r0, lr, lsr #6
 5c8:	736b0000 	cmnvc	fp, #0
 5cc:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 5d0:	00682e74 	rsbeq	r2, r8, r4, ror lr
 5d4:	69000002 	stmdbvs	r0, {r1}
 5d8:	682e6332 	stmdavs	lr!, {r1, r4, r5, r8, r9, sp, lr}
 5dc:	00000300 	andeq	r0, r0, r0, lsl #6
 5e0:	02050000 	andeq	r0, r5, #0
 5e4:	00008f64 	andeq	r8, r0, r4, ror #30
 5e8:	13011103 	movwne	r1, #4355	; 0x1103
 5ec:	689e0b03 	ldmvs	lr, {r0, r1, r8, r9, fp}
 5f0:	4b4ba14d 	blmi	12e8b2c <__user_program+0xfe8b2c>
 5f4:	682f834c 	stmdavs	pc!, {r2, r3, r6, r8, r9, pc}	; <UNPREDICTABLE>
 5f8:	02688385 	rsbeq	r8, r8, #335544322	; 0x14000002
 5fc:	01010006 	tsteq	r1, r6
 600:	0000024d 	andeq	r0, r0, sp, asr #4
 604:	00b80002 	adcseq	r0, r8, r2
 608:	01020000 	mrseq	r0, (UNDEF: 2)
 60c:	000d0efb 	strdeq	r0, [sp], -fp
 610:	01010101 	tsteq	r1, r1, lsl #2
 614:	01000000 	mrseq	r0, (UNDEF: 0)
 618:	6b010000 	blvs	40620 <__bss_end+0x11620>
 61c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 620:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 624:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 628:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 62c:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 630:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 634:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 638:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 63c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 640:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 644:	77656e00 	strbvc	r6, [r5, -r0, lsl #28]!
 648:	2f62696c 	svccs	0x0062696c
 64c:	69393433 	ldmdbvs	r9!, {r0, r1, r4, r5, sl, ip, sp}
 650:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 654:	00006564 	andeq	r6, r0, r4, ror #10
 658:	65726854 	ldrbvs	r6, [r2, #-2132]!	; 0x854
 65c:	632e6461 	teqvs	lr, #1627389952	; 0x61000000
 660:	00000100 	andeq	r0, r0, r0, lsl #2
 664:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 668:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 66c:	00020068 	andeq	r0, r2, r8, rrx
 670:	74756d00 	ldrbtvc	r6, [r5], #-3328	; 0xd00
 674:	745f7865 	ldrbvc	r7, [pc], #-2149	; 67c <__start-0x7984>
 678:	2e657079 	mcrcs	0, 3, r7, cr5, cr9, {3}
 67c:	00030068 	andeq	r0, r3, r8, rrx
 680:	73797300 	cmnvc	r9, #0, 6
 684:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 688:	7268745f 	rsbvc	r7, r8, #1593835520	; 0x5f000000
 68c:	2e646165 	powcssz	f6, f4, f5
 690:	00040068 	andeq	r0, r4, r8, rrx
 694:	72685400 	rsbvc	r5, r8, #0, 8
 698:	2e646165 	powcssz	f6, f4, f5
 69c:	00030068 	andeq	r0, r3, r8, rrx
 6a0:	6d726100 	ldfvse	f6, [r2, #-0]
 6a4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 6a8:	69740000 	ldmdbvs	r4!, {}^	; <UNPREDICTABLE>
 6ac:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 6b0:	00030068 	andeq	r0, r3, r8, rrx
 6b4:	72637300 	rsbvc	r7, r3, #0, 6
 6b8:	2e6e6565 	cdpcs	5, 6, cr6, cr14, cr5, {3}
 6bc:	00030068 	andeq	r0, r3, r8, rrx
 6c0:	05000000 	streq	r0, [r0, #-0]
 6c4:	00901002 	addseq	r1, r0, r2
 6c8:	00c40300 	sbceq	r0, r4, r0, lsl #6
 6cc:	4b831301 	blmi	fe0c52d8 <__user_program+0xfddc52d8>
 6d0:	4b4b4b4b 	blmi	12d3404 <__user_program+0xfd3404>
 6d4:	4b4b4b4b 	blmi	12d3408 <__user_program+0xfd3408>
 6d8:	4b4b4b4b 	blmi	12d340c <__user_program+0xfd340c>
 6dc:	4b4b4b4b 	blmi	12d3410 <__user_program+0xfd3410>
 6e0:	4b4b4b4b 	blmi	12d3414 <__user_program+0xfd3414>
 6e4:	4b4b4b4b 	blmi	12d3418 <__user_program+0xfd3418>
 6e8:	4b4b4b4b 	blmi	12d341c <__user_program+0xfd341c>
 6ec:	131a4402 	tstne	sl, #33554432	; 0x2000000
 6f0:	4a24034b 	bmi	901424 <__user_program+0x601424>
 6f4:	02003030 	andeq	r3, r0, #48	; 0x30
 6f8:	9e060304 	cdpls	3, 0, cr0, cr6, cr4, {0}
 6fc:	03040200 	movweq	r0, #16896	; 0x4200
 700:	d76a6406 	strble	r6, [sl, -r6, lsl #8]!
 704:	4c2f2f4b 	stcmi	15, cr2, [pc], #-300	; 5e0 <__start-0x7a20>
 708:	4b674cbb 	blmi	19d39fc <__user_program+0x16d39fc>
 70c:	304b2f4b 	subcc	r2, fp, fp, asr #30
 710:	73039f9f 	movwvc	r9, #16287	; 0x3f9f
 714:	0b034d2e 	bleq	d3bd4 <__bss_end+0xa4bd4>
 718:	2e0f032e 	cdpcs	3, 0, cr0, cr15, cr14, {1}
 71c:	2c2f3013 	stccs	0, cr3, [pc], #-76	; 6d8 <__start-0x7928>
 720:	2e0b0331 	mcrcs	3, 0, r0, cr11, cr1, {1}
 724:	01040200 	mrseq	r0, R12_usr
 728:	4b2f694b 	blmi	bdac5c <__user_program+0x8dac5c>
 72c:	14522108 	ldrbne	r2, [r2], #-264	; 0x108
 730:	14b2084b 	ldrtne	r0, [r2], #2123	; 0x84b
 734:	4e334569 	cdpmi	5, 3, cr4, cr3, cr9, {3}
 738:	22084c48 	andcs	r4, r8, #72, 24	; 0x4800
 73c:	034108f4 	movteq	r0, #6388	; 0x18f4
 740:	03642e73 	cmneq	r4, #1840	; 0x730
 744:	bc2f4a17 	stclt	10, cr4, [pc], #-92	; 6f0 <__start-0x7910>
 748:	4e4c6730 	mcrmi	7, 2, r6, cr12, cr0, {1}
 74c:	84f43030 	ldrbthi	r3, [r4], #48	; 0x30
 750:	a0522f2f 	subsge	r2, r2, pc, lsr #30
 754:	2f2f67d8 	svccs	0x002f67d8
 758:	04020083 	streq	r0, [r2], #-131	; 0x83
 75c:	66760302 	ldrbtvs	r0, [r6], -r2, lsl #6
 760:	30660f03 	rsbcc	r0, r6, r3, lsl #30
 764:	a03e08a0 	eorsge	r0, lr, r0, lsr #17
 768:	bbd72108 	bllt	ff5c8b90 <__user_program+0xff2c8b90>
 76c:	67ca0835 			; <UNDEFINED> instruction: 0x67ca0835
 770:	a04e5908 	subge	r5, lr, r8, lsl #18
 774:	bcd72108 	ldflte	f2, [r7], {8}
 778:	2e090383 	cdpcs	3, 0, cr0, cr9, cr3, {4}
 77c:	524a6403 	subpl	r6, sl, #50331648	; 0x3000000
 780:	034a0d03 	movteq	r0, #44291	; 0xad03
 784:	034a7fbe 	movteq	r7, #44990	; 0xafbe
 788:	4c4c2e12 	mcrrmi	14, 1, r2, ip, cr2
 78c:	034b302f 	movteq	r3, #45103	; 0xb02f
 790:	08136635 	ldmdaeq	r3, {r0, r2, r4, r5, r9, sl, sp, lr}
 794:	9c21085a 	stcls	8, cr0, [r1], #-360	; 0xfffffe98
 798:	304c3131 	subcc	r3, ip, r1, lsr r1
 79c:	03040200 	movweq	r0, #16896	; 0x4200
 7a0:	02008206 	andeq	r8, r0, #1610612736	; 0x60000000
 7a4:	b8060304 	stmdalt	r6, {r2, r8, r9}
 7a8:	f32f4e6b 	vcgt.f32	q2, <illegal reg q7.5>, <illegal reg q13.5>
 7ac:	f313a283 	vhsub.u16	d10, d19, d3
 7b0:	00304da2 	eorseq	r4, r0, r2, lsr #27
 7b4:	06030402 	streq	r0, [r3], -r2, lsl #8
 7b8:	04020082 	streq	r0, [r2], #-130	; 0x82
 7bc:	6ab80603 	bvs	fee01fd0 <__user_program+0xfeb01fd0>
 7c0:	13be2108 			; <UNDEFINED> instruction: 0x13be2108
 7c4:	009f2108 	addseq	r2, pc, r8, lsl #2
 7c8:	06010402 	streq	r0, [r1], -r2, lsl #8
 7cc:	32da0682 	sbcscc	r0, sl, #136314880	; 0x8200000
 7d0:	19036713 	stmdbne	r3, {r0, r1, r4, r8, r9, sl, sp, lr}
 7d4:	302f302e 	eorcc	r3, pc, lr, lsr #32
 7d8:	040200f4 	streq	r0, [r2], #-244	; 0xf4
 7dc:	6dc40802 	stclvs	8, cr0, [r4, #8]
 7e0:	666403f6 			; <UNDEFINED> instruction: 0x666403f6
 7e4:	4b2f682f 	blmi	bda8a8 <__user_program+0x8da8a8>
 7e8:	032f4dd7 	teqeq	pc, #13760	; 0x35c0
 7ec:	83132e15 	tsthi	r3, #336	; 0x150
 7f0:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 7f4:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 7f8:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 7fc:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 800:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 804:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 808:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 80c:	7d990367 	ldcvc	3, cr0, [r9, #412]	; 0x19c
 810:	30682f82 	rsbcc	r2, r8, r2, lsl #31
 814:	04020068 	streq	r0, [r2], #-104	; 0x68
 818:	02002c03 	andeq	r2, r0, #768	; 0x300
 81c:	00670304 	rsbeq	r0, r7, r4, lsl #6
 820:	2f030402 	svccs	0x00030402
 824:	03040200 	movweq	r0, #16896	; 0x4200
 828:	0402002f 	streq	r0, [r2], #-47	; 0x2f
 82c:	02004b03 	andeq	r4, r0, #3072	; 0xc00
 830:	002f0304 	eoreq	r0, pc, r4, lsl #6
 834:	2f030402 	svccs	0x00030402
 838:	03040200 	movweq	r0, #16896	; 0x4200
 83c:	032e7803 	teqeq	lr, #196608	; 0x30000
 840:	4b83660c 	blmi	fe0da078 <__user_program+0xfddda078>
 844:	4c2f2f2f 	stcmi	15, cr2, [pc], #-188	; 790 <__start-0x7870>
 848:	31678383 	cmncc	r7, r3, lsl #7
 84c:	01000402 	tsteq	r0, r2, lsl #8
 850:	00009301 	andeq	r9, r0, r1, lsl #6
 854:	4e000200 	cdpmi	2, 0, cr0, cr0, cr0, {0}
 858:	02000000 	andeq	r0, r0, #0
 85c:	0d0efb01 	vstreq	d15, [lr, #-4]
 860:	01010100 	mrseq	r0, (UNDEF: 17)
 864:	00000001 	andeq	r0, r0, r1
 868:	01000001 	tsteq	r0, r1
 86c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 870:	732f6c65 	teqvc	pc, #25856	; 0x6500
 874:	33006372 	movwcc	r6, #882	; 0x372
 878:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 87c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 880:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 884:	00006564 	andeq	r6, r0, r4, ror #10
 888:	2e697073 	mcrcs	0, 3, r7, cr9, cr3, {3}
 88c:	00010063 	andeq	r0, r1, r3, rrx
 890:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 894:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 898:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 89c:	70670000 	rsbvc	r0, r7, r0
 8a0:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 8a4:	00000200 	andeq	r0, r0, r0, lsl #4
 8a8:	02050000 	andeq	r0, r5, #0
 8ac:	00009c14 	andeq	r9, r0, r4, lsl ip
 8b0:	13013503 	movwne	r3, #5379	; 0x1503
 8b4:	4e872d67 	cdpmi	13, 8, cr2, cr7, cr7, {3}
 8b8:	6a686767 	bvs	1a1a65c <__user_program+0x171a65c>
 8bc:	31346885 	teqcc	r4, r5, lsl #17
 8c0:	692f3130 	stmdbvs	pc!, {r4, r5, r8, ip, sp}	; <UNPREDICTABLE>
 8c4:	85010d03 	strhi	r0, [r1, #-3331]	; 0xd03
 8c8:	30313468 	eorscc	r3, r1, r8, ror #8
 8cc:	be144e31 	mrclt	14, 0, r4, cr4, cr1, {1}
 8d0:	312f6a4e 	teqcc	pc, lr, asr #20
 8d4:	494b2d67 	stmdbmi	fp, {r0, r1, r2, r5, r6, r8, sl, fp, sp}^
 8d8:	2d67696b 	stclcs	9, cr6, [r7, #-428]!	; 0xfffffe54
 8dc:	696b494b 	stmdbvs	fp!, {r0, r1, r3, r6, r8, fp, lr}^
 8e0:	02322f2f 	eorseq	r2, r2, #47, 30	; 0xbc
 8e4:	01010004 	tsteq	r1, r4
 8e8:	000000ce 	andeq	r0, r0, lr, asr #1
 8ec:	00790002 	rsbseq	r0, r9, r2
 8f0:	01020000 	mrseq	r0, (UNDEF: 2)
 8f4:	000d0efb 	strdeq	r0, [sp], -fp
 8f8:	01010101 	tsteq	r1, r1, lsl #2
 8fc:	01000000 	mrseq	r0, (UNDEF: 0)
 900:	6b010000 	blvs	40908 <__bss_end+0x11908>
 904:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 908:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 90c:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 910:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 914:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 918:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 91c:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 920:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 924:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 928:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 92c:	79730000 	ldmdbvc	r3!, {}^	; <UNPREDICTABLE>
 930:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 934:	632e736c 	teqvs	lr, #108, 6	; 0xb0000001
 938:	00000100 	andeq	r0, r0, r0, lsl #2
 93c:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 940:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 944:	00020068 	andeq	r0, r2, r8, rrx
 948:	72617500 	rsbvc	r7, r1, #0, 10
 94c:	00682e74 	rsbeq	r2, r8, r4, ror lr
 950:	74000003 	strvc	r0, [r0], #-3
 954:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 958:	0300682e 	movweq	r6, #2094	; 0x82e
 95c:	72700000 	rsbsvc	r0, r0, #0
 960:	6b746e69 	blvs	1d1c30c <__user_program+0x1a1c30c>
 964:	0300682e 	movweq	r6, #2094	; 0x82e
 968:	00000000 	andeq	r0, r0, r0
 96c:	9d940205 	lfmls	f0, 4, [r4, #20]
 970:	1a030000 	bne	c0978 <__bss_end+0x91978>
 974:	50674b01 	rsbpl	r4, r7, r1, lsl #22
 978:	686a4814 	stmdavs	sl!, {r2, r4, fp, lr}^
 97c:	034c8848 	movteq	r8, #51272	; 0xc848
 980:	47154a0a 	ldrmi	r4, [r5, -sl, lsl #20]
 984:	660a036b 	strvs	r0, [sl], -fp, ror #6
 988:	2f4a7803 	svccs	0x004a7803
 98c:	684b684e 	stmdavs	fp, {r1, r2, r3, r6, fp, sp, lr}^
 990:	4e2f3068 	cdpmi	0, 2, cr3, cr15, cr8, {3}
 994:	68032f30 	stmdavs	r3, {r4, r5, r8, r9, sl, fp, sp}
 998:	821b032e 	andshi	r0, fp, #-1207959552	; 0xb8000000
 99c:	672f4f4c 	strvs	r4, [pc, -ip, asr #30]!
 9a0:	302f4d30 	eorcc	r4, pc, r0, lsr sp	; <UNPREDICTABLE>
 9a4:	a1841750 	orrge	r1, r4, r0, asr r7
 9a8:	29678867 	stmdbcs	r7!, {r0, r1, r2, r5, r6, fp, pc}^
 9ac:	4c143034 	ldcmi	0, cr3, [r4], {52}	; 0x34
 9b0:	4c144c14 	ldcmi	12, cr4, [r4], {20}
 9b4:	00040214 	andeq	r0, r4, r4, lsl r2
 9b8:	00540101 	subseq	r0, r4, r1, lsl #2
 9bc:	00020000 	andeq	r0, r2, r0
 9c0:	00000029 	andeq	r0, r0, r9, lsr #32
 9c4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 9c8:	0101000d 	tsteq	r1, sp
 9cc:	00000101 	andeq	r0, r0, r1, lsl #2
 9d0:	00000100 	andeq	r0, r0, r0, lsl #2
 9d4:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 9d8:	6b62696c 	blvs	189af90 <__user_program+0x159af90>
 9dc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 9e0:	6f620000 	svcvs	0x00620000
 9e4:	532e746f 	teqpl	lr, #1862270976	; 0x6f000000
 9e8:	00000100 	andeq	r0, r0, r0, lsl #2
 9ec:	02050000 	andeq	r0, r5, #0
 9f0:	00008000 	andeq	r8, r0, r0
 9f4:	2f011b03 	svccs	0x00011b03
 9f8:	2f302f2f 	svccs	0x00302f2f
 9fc:	2f2f2f2f 	svccs	0x002f2f2f
 a00:	2f2f312f 	svccs	0x002f312f
 a04:	032f3331 	teqeq	pc, #-1006632960	; 0xc4000000
 a08:	2f312e69 	svccs	0x00312e69
 a0c:	0002022f 	andeq	r0, r2, pc, lsr #4
 a10:	004d0101 	subeq	r0, sp, r1, lsl #2
 a14:	00020000 	andeq	r0, r2, r0
 a18:	00000028 	andeq	r0, r0, r8, lsr #32
 a1c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 a20:	0101000d 	tsteq	r1, sp
 a24:	00000101 	andeq	r0, r0, r1, lsl #2
 a28:	00000100 	andeq	r0, r0, r0, lsl #2
 a2c:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 a30:	6b62696c 	blvs	189afe8 <__user_program+0x159afe8>
 a34:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 a38:	72610000 	rsbvc	r0, r1, #0
 a3c:	00532e6d 	subseq	r2, r3, sp, ror #28
 a40:	00000001 	andeq	r0, r0, r1
 a44:	38020500 	stmdacc	r2, {r8, sl}
 a48:	0300009f 	movweq	r0, #159	; 0x9f
 a4c:	2f2f0110 	svccs	0x002f0110
 a50:	2f332f33 	svccs	0x00332f33
 a54:	2f2f2f33 	svccs	0x002f2f33
 a58:	2f2f332f 	svccs	0x002f332f
 a5c:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 a60:	dc010100 	stfles	f0, [r1], {-0}
 a64:	02000000 	andeq	r0, r0, #0
 a68:	00002e00 	andeq	r2, r0, r0, lsl #28
 a6c:	fb010200 	blx	41276 <__bss_end+0x12276>
 a70:	01000d0e 	tsteq	r0, lr, lsl #26
 a74:	00010101 	andeq	r0, r1, r1, lsl #2
 a78:	00010000 	andeq	r0, r1, r0
 a7c:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 a80:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 a84:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 a88:	75730000 	ldrbvc	r0, [r3, #-0]!
 a8c:	76726570 			; <UNDEFINED> instruction: 0x76726570
 a90:	726f7369 	rsbvc	r7, pc, #-1543503871	; 0xa4000001
 a94:	0100532e 	tsteq	r0, lr, lsr #6
 a98:	00000000 	andeq	r0, r0, r0
 a9c:	9f7c0205 	svcls	0x007c0205
 aa0:	16030000 	strne	r0, [r3], -r0
 aa4:	2f2f2f01 	svccs	0x002f2f01
 aa8:	2f2f2f2f 	svccs	0x002f2f2f
 aac:	2ff21703 	svccs	0x00f21703
 ab0:	2f302f2f 	svccs	0x00302f2f
 ab4:	09032f2f 	stmdbeq	r3, {r0, r1, r2, r3, r5, r8, r9, sl, fp, sp}
 ab8:	3131312e 	teqcc	r1, lr, lsr #2
 abc:	322f2f31 	eorcc	r2, pc, #49, 30	; 0xc4
 ac0:	2f2f2f2f 	svccs	0x002f2f2f
 ac4:	2f302f2f 	svccs	0x00302f2f
 ac8:	312f2f30 	teqcc	pc, r0, lsr pc	; <UNPREDICTABLE>
 acc:	2f2f312f 	svccs	0x002f312f
 ad0:	312f302f 	teqcc	pc, pc, lsr #32
 ad4:	30312f2f 	eorscc	r2, r1, pc, lsr #30
 ad8:	2f312f2f 	svccs	0x00312f2f
 adc:	2f2f362f 	svccs	0x002f362f
 ae0:	322f2f2f 	eorcc	r2, pc, #47, 30	; 0xbc
 ae4:	2f312f31 	svccs	0x00312f31
 ae8:	2f312f32 	svccs	0x00312f32
 aec:	2f2f312f 	svccs	0x002f312f
 af0:	2f2f2f31 	svccs	0x002f2f31
 af4:	2f2f2f31 	svccs	0x002f2f31
 af8:	2f2f2f31 	svccs	0x002f2f31
 afc:	2f323231 	svccs	0x00323231
 b00:	332f302f 	teqcc	pc, #47	; 0x2f
 b04:	312f2f2f 	teqcc	pc, pc, lsr #30
 b08:	312f2f2f 	teqcc	pc, pc, lsr #30
 b0c:	312f2f2f 	teqcc	pc, pc, lsr #30
 b10:	2f322f31 	svccs	0x00322f31
 b14:	2f2f2f31 	svccs	0x002f2f31
 b18:	36333131 			; <UNDEFINED> instruction: 0x36333131
 b1c:	36313131 			; <UNDEFINED> instruction: 0x36313131
 b20:	2f31312f 	svccs	0x0031312f
 b24:	332f2f2f 	teqcc	pc, #47, 30	; 0xbc
 b28:	2f2f3131 	svccs	0x002f3131
 b2c:	7e85032f 	cdpvc	3, 8, cr0, cr5, cr15, {1}
 b30:	d103332e 	tstle	r3, lr, lsr #6
 b34:	e5032e00 	str	r2, [r3, #-3584]	; 0xe00
 b38:	30032e00 	andcc	r2, r3, r0, lsl #28
 b3c:	02022f2e 	andeq	r2, r2, #46, 30	; 0xb8
 b40:	Address 0x00000b40 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	70670074 	rsbvc	r0, r7, r4, ror r0
  10:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  14:	705f7465 	subsvc	r7, pc, r5, ror #8
  18:	006c6c75 	rsbeq	r6, ip, r5, ror ip
  1c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff68 <__user_program+0xffcfff68>
  20:	63652f65 	cmnvs	r5, #404	; 0x194
  24:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
  28:	7065722f 	rsbvc	r7, r5, pc, lsr #4
  2c:	362f736f 	strtcc	r7, [pc], -pc, ror #6
  30:	662d3234 			; <UNDEFINED> instruction: 0x662d3234
  34:	632f3631 	teqvs	pc, #51380224	; 0x3100000
  38:	0065646f 	rsbeq	r6, r5, pc, ror #8
  3c:	6f697067 	svcvs	0x00697067
  40:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  44:	65735f6f 	ldrbvs	r5, [r3, #-3951]!	; 0xf6f
  48:	6f6c0074 	svcvs	0x006c0074
  4c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
  50:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  54:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  58:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  5c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  60:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  64:	6c635f6f 	stclvs	15, cr5, [r3], #-444	; 0xfffffe44
  68:	666f0072 			; <UNDEFINED> instruction: 0x666f0072
  6c:	74657366 	strbtvc	r7, [r5], #-870	; 0x366
  70:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
  74:	745f3874 	ldrbvc	r3, [pc], #-2164	; 7c <__start-0x7f84>
  78:	736e7500 	cmnvc	lr, #0, 10
  7c:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  80:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
  84:	75007261 	strvc	r7, [r0, #-609]	; 0x261
  88:	33746e69 	cmncc	r4, #1680	; 0x690
  8c:	00745f32 	rsbseq	r5, r4, r2, lsr pc
  90:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
  94:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
  98:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
  9c:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
  a0:	4700746e 	strmi	r7, [r0, -lr, ror #8]
  a4:	4320554e 	teqmi	r0, #327155712	; 0x13800000
  a8:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  ac:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  b0:	30353130 	eorscc	r3, r5, r0, lsr r1
  b4:	20393235 	eorscs	r3, r9, r5, lsr r2
  b8:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  bc:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  c0:	415b2029 	cmpmi	fp, r9, lsr #32
  c4:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff37a <__user_program+0xffcff37a>
  c8:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  cc:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  d0:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  d4:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  d8:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  dc:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  e0:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  e4:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  e8:	205d3838 	subscs	r3, sp, r8, lsr r8
  ec:	6c666d2d 	stclvs	13, cr6, [r6], #-180	; 0xffffff4c
  f0:	2d74616f 	ldfcse	f6, [r4, #-444]!	; 0xfffffe44
  f4:	3d696261 	sfmcc	f6, 2, [r9, #-388]!	; 0xfffffe7c
  f8:	74666f73 	strbtvc	r6, [r6], #-3955	; 0xf73
  fc:	616d2d20 	cmnvs	sp, r0, lsr #26
 100:	3d686372 	stclcc	3, cr6, [r8, #-456]!	; 0xfffffe38
 104:	766d7261 	strbtvc	r7, [sp], -r1, ror #4
 108:	20612d37 	rsbcs	r2, r1, r7, lsr sp
 10c:	2d20672d 	stccs	7, cr6, [r0, #-180]!	; 0xffffff4c
 110:	2d20314f 	stfcss	f3, [r0, #-316]!	; 0xfffffec4
 114:	2d20304f 	stccs	0, cr3, [r0, #-316]!	; 0xfffffec4
 118:	65726666 	ldrbvs	r6, [r2, #-1638]!	; 0x666
 11c:	61747365 	cmnvs	r4, r5, ror #6
 120:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 124:	74730067 	ldrbtvc	r0, [r3], #-103	; 0x67
 128:	00657461 	rsbeq	r7, r5, r1, ror #8
 12c:	6f697067 	svcvs	0x00697067
 130:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 134:	00676966 	rsbeq	r6, r7, r6, ror #18
 138:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 13c:	6e692074 	mcrvs	0, 3, r2, cr9, cr4, {3}
 140:	34330074 	ldrtcc	r0, [r3], #-116	; 0x74
 144:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 148:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 14c:	70672f63 	rsbvc	r2, r7, r3, ror #30
 150:	632e6f69 	teqvs	lr, #420	; 0x1a4
 154:	73797300 	cmnvc	r9, #0, 6
 158:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 15c:	74756d5f 	ldrbtvc	r6, [r5], #-3423	; 0xd5f
 160:	755f7865 	ldrbvc	r7, [pc, #-2149]	; fffff903 <__user_program+0xffcff903>
 164:	636f6c6e 	cmnvs	pc, #28160	; 0x6e00
 168:	756d006b 	strbvc	r0, [sp, #-107]!	; 0x6b
 16c:	5f786574 	svcpl	0x00786574
 170:	72610074 	rsbvc	r0, r1, #116	; 0x74
 174:	6c703467 	cfldrdvs	mvd3, [r0], #-412	; 0xfffffe64
 178:	43007375 	movwmi	r7, #885	; 0x375
 17c:	4b434f4c 	blmi	10d3eb4 <__user_program+0xdd3eb4>
 180:	4349545f 	movtmi	r5, #37983	; 0x945f
 184:	7300534b 	movwvc	r5, #843	; 0x34b
 188:	61637379 	smcvs	14137	; 0x3739
 18c:	735f6c6c 	cmpvc	pc, #108, 24	; 0x6c00
 190:	006b7262 	rsbeq	r7, fp, r2, ror #4
 194:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 198:	695f656c 	ldmdbvs	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 19c:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 1a0:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0x572
 1a4:	79730073 	ldmdbvc	r3!, {r0, r1, r4, r5, r6}^
 1a8:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 1ac:	756d5f6c 	strbvc	r5, [sp, #-3948]!	; 0xf6c
 1b0:	5f786574 	svcpl	0x00786574
 1b4:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 1b8:	73797300 	cmnvc	r9, #0, 6
 1bc:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 1c0:	7268745f 	rsbvc	r7, r8, #1593835520	; 0x5f000000
 1c4:	5f646165 	svcpl	0x00646165
 1c8:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 1cc:	71726900 	cmnvc	r2, r0, lsl #18
 1d0:	685f635f 	ldmdavs	pc, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 1d4:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
 1d8:	69007265 	stmdbvs	r0, {r0, r2, r5, r6, r9, ip, sp, lr}
 1dc:	6174736e 	cmnvs	r4, lr, ror #6
 1e0:	695f6c6c 	ldmdbvs	pc, {r2, r3, r5, r6, sl, fp, sp, lr}^	; <UNPREDICTABLE>
 1e4:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 1e8:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0x572
 1ec:	6261745f 	rsbvs	r7, r1, #1593835520	; 0x5f000000
 1f0:	6400656c 	strvs	r6, [r0], #-1388	; 0x56c
 1f4:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
 1f8:	695f656c 	ldmdbvs	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 1fc:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 200:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0x572
 204:	32690073 	rsbcc	r0, r9, #115	; 0x73
 208:	616d5f63 	cmnvs	sp, r3, ror #30
 20c:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
 210:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 214:	61750074 	cmnvs	r5, r4, ror r0
 218:	695f7472 	ldmdbvs	pc, {r1, r4, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 21c:	0074696e 	rsbseq	r6, r4, lr, ror #18
 220:	76746572 			; <UNDEFINED> instruction: 0x76746572
 224:	73006c61 	movwvc	r6, #3169	; 0xc61
 228:	635f6977 	cmpvs	pc, #1949696	; 0x1dc000
 22c:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
 230:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
 234:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 238:	6c635f64 	stclvs	15, cr5, [r3], #-400	; 0xfffffe70
 23c:	5f726165 	svcpl	0x00726165
 240:	65726373 	ldrbvs	r6, [r2, #-883]!	; 0x373
 244:	73006e65 	movwvc	r6, #3685	; 0xe65
 248:	61637379 	smcvs	14137	; 0x3739
 24c:	775f6c6c 	ldrbvc	r6, [pc, -ip, ror #24]
 250:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0x972
 254:	73797300 	cmnvc	r9, #0, 6
 258:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 25c:	7465675f 	strbtvc	r6, [r5], #-1887	; 0x75f
 260:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
 264:	69660065 	stmdbvs	r6!, {r0, r2, r5, r6}^
 268:	7300656c 	movwvc	r6, #1388	; 0x56c
 26c:	6e5f6977 	mrcvs	9, 2, r6, cr15, cr7, {3}
 270:	74006d75 	strvc	r6, [r0], #-3445	; 0xd75
 274:	61657268 	cmnvs	r5, r8, ror #4
 278:	6e665f64 	cdpvs	15, 6, cr5, cr6, cr4, {3}
 27c:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 280:	635f7265 	cmpvs	pc, #1342177286	; 0x50000006
 284:	7261656c 	rsbvc	r6, r1, #108, 10	; 0x1b000000
 288:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
 28c:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
 290:	73797300 	cmnvc	r9, #0, 6
 294:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 298:	7268745f 	rsbvc	r7, r8, #1593835520	; 0x5f000000
 29c:	5f646165 	svcpl	0x00646165
 2a0:	61657263 	cmnvs	r5, r3, ror #4
 2a4:	73006574 	movwvc	r6, #1396	; 0x574
 2a8:	61637379 	smcvs	14137	; 0x3739
 2ac:	655f6c6c 	ldrbvs	r6, [pc, #-3180]	; fffff648 <__user_program+0xffcff648>
 2b0:	00746978 	rsbseq	r6, r4, r8, ror r9
 2b4:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2b8:	732f6c65 	teqvc	pc, #25856	; 0x6500
 2bc:	6b2f6372 	blvs	bd908c <__user_program+0x8d908c>
 2c0:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 2c4:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 2c8:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 2cc:	5f6c6c61 	svcpl	0x006c6c61
 2d0:	706d6173 	rsbvc	r6, sp, r3, ror r1
 2d4:	615f656c 	cmpvs	pc, ip, ror #10
 2d8:	735f6364 	cmpvc	pc, #100, 6	; 0x90000001
 2dc:	00706f74 	rsbseq	r6, r0, r4, ror pc
 2e0:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 2e4:	5f6c6c61 	svcpl	0x006c6c61
 2e8:	65686373 	strbvs	r6, [r8, #-883]!	; 0x373
 2ec:	656c7564 	strbvs	r7, [ip, #-1380]!	; 0x564
 2f0:	74735f72 	ldrbtvc	r5, [r3], #-3954	; 0xf72
 2f4:	00747261 	rsbseq	r7, r4, r1, ror #4
 2f8:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 2fc:	5f736461 	svcpl	0x00736461
 300:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 304:	73797300 	cmnvc	r9, #0, 6
 308:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 30c:	74756d5f 	ldrbtvc	r6, [r5], #-3423	; 0xd5f
 310:	6c5f7865 	mrrcvs	8, 6, r7, pc, cr5	; <UNPREDICTABLE>
 314:	006b636f 	rsbeq	r6, fp, pc, ror #6
 318:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 31c:	74735f72 	ldrbtvc	r5, [r3], #-3954	; 0xf72
 320:	6f00706f 	svcvs	0x0000706f
 324:	5f64656c 	svcpl	0x0064656c
 328:	5f667562 	svcpl	0x00667562
 32c:	00726c63 	rsbseq	r6, r2, r3, ror #24
 330:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 334:	5f6c6c61 	svcpl	0x006c6c61
 338:	74696177 	strbtvc	r6, [r9], #-375	; 0x177
 33c:	746e755f 	strbtvc	r7, [lr], #-1375	; 0x55f
 340:	6e5f6c69 	cdpvs	12, 5, cr6, cr15, cr9, {3}
 344:	5f747865 	svcpl	0x00747865
 348:	69726570 	ldmdbvs	r2!, {r4, r5, r6, r8, sl, sp, lr}^
 34c:	7300646f 	movwvc	r6, #1135	; 0x46f
 350:	74657a69 	strbtvc	r7, [r5], #-2665	; 0xa69
 354:	00657079 	rsbeq	r7, r5, r9, ror r0
 358:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xd2f
 35c:	6667682f 	strbtvs	r6, [r7], -pc, lsr #16
 360:	34312f73 	ldrtcc	r2, [r1], #-3955	; 0xf73
 364:	2f323436 	svccs	0x00323436
 368:	6f706572 	svcvs	0x00706572
 36c:	6f632f73 	svcvs	0x00632f73
 370:	70006564 	andvc	r6, r0, r4, ror #10
 374:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 378:	756d006b 	strbvc	r0, [sp, #-107]!	; 0x6b
 37c:	00786574 	rsbseq	r6, r8, r4, ror r5
 380:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 384:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 388:	69750074 	ldmdbvs	r5!, {r2, r4, r5, r6}^
 38c:	3631746e 	ldrtcc	r7, [r1], -lr, ror #8
 390:	6100745f 	tstvs	r0, pc, asr r4
 394:	00736772 	rsbseq	r6, r3, r2, ror r7
 398:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 39c:	5f6c6c61 	svcpl	0x006c6c61
 3a0:	706d6173 	rsbvc	r6, sp, r3, ror r1
 3a4:	615f656c 	cmpvs	pc, ip, ror #10
 3a8:	735f6364 	cmpvc	pc, #100, 6	; 0x90000001
 3ac:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 3b0:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 3b4:	34204320 	strtcc	r4, [r0], #-800	; 0x320
 3b8:	332e392e 	teqcc	lr, #753664	; 0xb8000
 3bc:	31303220 	teqcc	r0, r0, lsr #4
 3c0:	32353035 	eorscc	r3, r5, #53	; 0x35
 3c4:	72282039 	eorvc	r2, r8, #57	; 0x39
 3c8:	61656c65 	cmnvs	r5, r5, ror #24
 3cc:	20296573 	eorcs	r6, r9, r3, ror r5
 3d0:	4d52415b 	ldfmie	f4, [r2, #-364]	; 0xfffffe94
 3d4:	626d652f 	rsbvs	r6, sp, #197132288	; 0xbc00000
 3d8:	65646465 	strbvs	r6, [r4, #-1125]!	; 0x465
 3dc:	5f342d64 	svcpl	0x00342d64
 3e0:	72622d39 	rsbvc	r2, r2, #3648	; 0xe40
 3e4:	68636e61 	stmdavs	r3!, {r0, r5, r6, r9, sl, fp, sp, lr}^
 3e8:	76657220 	strbtvc	r7, [r5], -r0, lsr #4
 3ec:	6f697369 	svcvs	0x00697369
 3f0:	3232206e 	eorscc	r2, r2, #110	; 0x6e
 3f4:	38383234 	ldmdacc	r8!, {r2, r4, r5, r9, ip, sp}
 3f8:	6d2d205d 	stcvs	0, cr2, [sp, #-372]!	; 0xfffffe8c
 3fc:	616f6c66 	cmnvs	pc, r6, ror #24
 400:	62612d74 	rsbvs	r2, r1, #116, 26	; 0x1d00
 404:	6f733d69 	svcvs	0x00733d69
 408:	2d207466 	cfstrscs	mvf7, [r0, #-408]!	; 0xfffffe68
 40c:	6372616d 	cmnvs	r2, #1073741851	; 0x4000001b
 410:	72613d68 	rsbvc	r3, r1, #104, 26	; 0x1a00
 414:	2d37766d 	ldccs	6, cr7, [r7, #-436]!	; 0xfffffe4c
 418:	672d2061 	strvs	r2, [sp, -r1, rrx]!
 41c:	314f2d20 	cmpcc	pc, r0, lsr #26
 420:	66662d20 	strbtvs	r2, [r6], -r0, lsr #26
 424:	73656572 	cmnvc	r5, #478150656	; 0x1c800000
 428:	646e6174 	strbtvs	r6, [lr], #-372	; 0x174
 42c:	00676e69 	rsbeq	r6, r7, r9, ror #28
 430:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 434:	6d5f6c65 	ldclvs	12, cr6, [pc, #-404]	; 2a8 <__start-0x7d58>
 438:	006e6961 	rsbeq	r6, lr, r1, ror #18
 43c:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 440:	5f6c6c61 	svcpl	0x006c6c61
 444:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 448:	746e6500 	strbtvc	r6, [lr], #-1280	; 0x500
 44c:	755f7265 	ldrbvc	r7, [pc, #-613]	; 1ef <__start-0x7e11>
 450:	5f726573 	svcpl	0x00726573
 454:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xf6d
 458:	73797300 	cmnvc	r9, #0, 6
 45c:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 460:	7473665f 	ldrbtvc	r6, [r3], #-1631	; 0x65f
 464:	62007461 	andvs	r7, r0, #1627389952	; 0x61000000
 468:	5f657479 	svcpl	0x00657479
 46c:	00727470 	rsbseq	r7, r2, r0, ror r4
 470:	746e6975 	strbtvc	r6, [lr], #-2421	; 0x975
 474:	745f3436 	ldrbvc	r3, [pc], #-1078	; 47c <__start-0x7b84>
 478:	72656b00 	rsbvc	r6, r5, #0, 22
 47c:	2f6c656e 	svccs	0x006c656e
 480:	2f637273 	svccs	0x00637273
 484:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 488:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 48c:	765f5f00 	ldrbvc	r5, [pc], -r0, lsl #30
 490:	696c5f61 	stmdbvs	ip!, {r0, r5, r6, r8, r9, sl, fp, ip, lr}^
 494:	75007473 	strvc	r7, [r0, #-1139]	; 0x473
 498:	5f747261 	svcpl	0x00747261
 49c:	5f747570 	svcpl	0x00747570
 4a0:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 4a4:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 4a8:	756e746e 	strbvc	r7, [lr, #-1134]!	; 0x46e
 4ac:	64006b6d 	strvs	r6, [r0], #-2925	; 0xb6d
 4b0:	74696769 	strbtvc	r6, [r9], #-1897	; 0x769
 4b4:	72700073 	rsbsvc	r0, r0, #115	; 0x73
 4b8:	78696665 	stmdavc	r9!, {r0, r2, r5, r6, r9, sl, sp, lr}^
 4bc:	73616200 	cmnvc	r1, #0, 4
 4c0:	5f5f0065 	svcpl	0x005f0065
 4c4:	6b007061 	blvs	1c650 <thread16_svc_stack+0x5b4>
 4c8:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 4cc:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 4d0:	69742f63 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
 4d4:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 4d8:	72660063 	rsbvc	r0, r6, #99	; 0x63
 4dc:	74007165 	strvc	r7, [r0], #-357	; 0x165
 4e0:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 4e4:	6174735f 	cmnvs	r4, pc, asr r3
 4e8:	74007472 	strvc	r7, [r0], #-1138	; 0x472
 4ec:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 4f0:	5f73695f 	svcpl	0x0073695f
 4f4:	646e6570 	strbtvs	r6, [lr], #-1392	; 0x570
 4f8:	00676e69 	rsbeq	r6, r7, r9, ror #28
 4fc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 500:	65725f72 	ldrbvs	r5, [r2, #-3954]!	; 0xf72
 504:	6f006461 	svcvs	0x00006461
 508:	5f64656c 	svcpl	0x0064656c
 50c:	5f667562 	svcpl	0x00667562
 510:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0x970
 514:	65735f6c 	ldrbvs	r5, [r3, #-3948]!	; 0xf6c
 518:	77740074 			; <UNDEFINED> instruction: 0x77740074
 51c:	00746961 	rsbseq	r6, r4, r1, ror #18
 520:	616c6564 	cmnvs	ip, r4, ror #10
 524:	70730079 	rsbsvc	r0, r3, r9, ror r0
 528:	6e655f69 	cdpvs	15, 6, cr5, cr5, cr9, {3}
 52c:	6c6f0064 	stclvs	0, cr0, [pc], #-400	; 3a4 <__start-0x7c5c>
 530:	775f6465 	ldrbvc	r6, [pc, -r5, ror #8]
 534:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0x972
 538:	7461645f 	strbtvc	r6, [r1], #-1119	; 0x45f
 53c:	656b0061 	strbvs	r0, [fp, #-97]!	; 0x61
 540:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 544:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 548:	7263732f 	rsbvc	r7, r3, #-1140850688	; 0xbc000000
 54c:	2e6e6565 	cdpcs	5, 6, cr6, cr14, cr5, {3}
 550:	6c6f0063 	stclvs	0, cr0, [pc], #-396	; 3cc <__start-0x7c34>
 554:	735f6465 	cmpvc	pc, #1694498816	; 0x65000000
 558:	6c6f7263 	sfmvs	f7, 2, [pc], #-396	; 3d4 <__start-0x7c2c>
 55c:	65745f6c 	ldrbvs	r5, [r4, #-3948]!	; 0xf6c
 560:	6f007473 	svcvs	0x00007473
 564:	5f64656c 	svcpl	0x0064656c
 568:	5f667562 	svcpl	0x00667562
 56c:	77617264 	strbvc	r7, [r1, -r4, ror #4]!
 570:	69707300 	ldmdbvs	r0!, {r8, r9, ip, sp, lr}^
 574:	6172745f 	cmnvs	r2, pc, asr r4
 578:	6566736e 	strbvs	r7, [r6, #-878]!	; 0x36e
 57c:	70730072 	rsbsvc	r0, r3, r2, ror r0
 580:	616d5f69 	cmnvs	sp, r9, ror #30
 584:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
 588:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 58c:	6e690074 	mcrvs	0, 3, r0, cr9, cr4, {3}
 590:	00786564 	rsbseq	r6, r8, r4, ror #10
 594:	656c6f5f 	strbvs	r6, [ip, #-3935]!	; 0xf5f
 598:	72665f64 	rsbvc	r5, r6, #100, 30	; 0x190
 59c:	5f656d61 	svcpl	0x00656d61
 5a0:	66667562 	strbtvs	r7, [r6], -r2, ror #10
 5a4:	73007265 	movwvc	r7, #613	; 0x265
 5a8:	625f6970 	subsvs	r6, pc, #112, 18	; 0x1c0000
 5ac:	6e696765 	cdpvs	7, 6, cr6, cr9, cr5, {3}
 5b0:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 5b4:	75625f64 	strbvc	r5, [r2, #-3940]!	; 0xf64
 5b8:	69705f66 	ldmdbvs	r0!, {r1, r2, r5, r6, r8, r9, sl, fp, ip, lr}^
 5bc:	5f6c6578 	svcpl	0x006c6578
 5c0:	00726c63 	rsbseq	r6, r2, r3, ror #24
 5c4:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 5c8:	6174735f 	cmnvs	r4, pc, asr r3
 5cc:	735f7472 	cmpvc	pc, #1912602624	; 0x72000000
 5d0:	65757165 	ldrbvs	r7, [r5, #-357]!	; 0x165
 5d4:	0065636e 	rsbeq	r6, r5, lr, ror #6
 5d8:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 5dc:	6972775f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 5e0:	635f6574 	cmpvs	pc, #116, 10	; 0x1d000000
 5e4:	616d6d6f 	cmnvs	sp, pc, ror #26
 5e8:	6f00646e 	svcvs	0x0000646e
 5ec:	5f64656c 	svcpl	0x0064656c
 5f0:	65736572 	ldrbvs	r6, [r3, #-1394]!	; 0x572
 5f4:	61750074 	cmnvs	r5, r4, ror r0
 5f8:	675f7472 			; <UNDEFINED> instruction: 0x675f7472
 5fc:	625f7465 	subsvs	r7, pc, #1694498816	; 0x65000000
 600:	00657479 	rsbeq	r7, r5, r9, ror r4
 604:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 608:	732f6c65 	teqvc	pc, #25856	; 0x6500
 60c:	752f6372 	strvc	r6, [pc, #-882]!	; 2a2 <__start-0x7d5e>
 610:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 614:	61750063 	cmnvs	r5, r3, rrx
 618:	635f7472 	cmpvs	pc, #1912602624	; 0x72000000
 61c:	65736f6c 	ldrbvs	r6, [r3, #-3948]!	; 0xf6c
 620:	72656b00 	rsbvc	r6, r5, #0, 22
 624:	2f6c656e 	svccs	0x006c656e
 628:	2f637273 	svccs	0x00637273
 62c:	2e633269 	cdpcs	2, 6, cr3, cr3, cr9, {3}
 630:	64610063 	strbtvs	r0, [r1], #-99	; 0x63
 634:	69007264 	stmdbvs	r0, {r2, r5, r6, r9, ip, sp, lr}
 638:	6d5f6332 	ldclvs	3, cr6, [pc, #-200]	; 578 <__start-0x7a88>
 63c:	65747361 	ldrbvs	r7, [r4, #-865]!	; 0x361
 640:	65725f72 	ldrbvs	r5, [r2, #-3954]!	; 0xf72
 644:	69006461 	stmdbvs	r0, {r0, r5, r6, sl, sp, lr}
 648:	6d5f6332 	ldclvs	3, cr6, [pc, #-200]	; 588 <__start-0x7a78>
 64c:	65747361 	ldrbvs	r7, [r4, #-865]!	; 0x361
 650:	72775f72 	rsbsvc	r5, r7, #456	; 0x1c8
 654:	00657469 	rsbeq	r7, r5, r9, ror #8
 658:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 65c:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 660:	65725f76 	ldrbvs	r5, [r2, #-3958]!	; 0xf76
 664:	65720067 	ldrbvs	r0, [r2, #-103]!	; 0x67
 668:	765f6461 	ldrbvc	r6, [pc], -r1, ror #8
 66c:	61006c61 	tstvs	r0, r1, ror #24
 670:	695f6364 	ldmdbvs	pc, {r2, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 674:	0074696e 	rsbseq	r6, r4, lr, ror #18
 678:	5f746572 	svcpl	0x00746572
 67c:	006c6176 	rsbeq	r6, ip, r6, ror r1
 680:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
 684:	004c454e 	subeq	r4, ip, lr, asr #10
 688:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 68c:	732f6c65 	teqvc	pc, #25856	; 0x6500
 690:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
 694:	30317364 	eorscc	r7, r1, r4, ror #6
 698:	632e3531 	teqvs	lr, #205520896	; 0xc400000
 69c:	61686300 	cmnvs	r8, r0, lsl #6
 6a0:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 6a4:	63646100 	cmnvs	r4, #0, 2
 6a8:	6165725f 	cmnvs	r5, pc, asr r2
 6ac:	6e690064 	cdpvs	0, 6, cr0, cr9, cr4, {3}
 6b0:	635f7469 	cmpvs	pc, #1761607680	; 0x69000000
 6b4:	69666e6f 	stmdbvs	r6!, {r0, r1, r2, r3, r5, r6, r9, sl, fp, sp, lr}^
 6b8:	65670067 	strbvs	r0, [r7, #-103]!	; 0x67
 6bc:	736f4d74 	cmnvc	pc, #116, 26	; 0x1d00
 6c0:	706d4974 	rsbvc	r4, sp, r4, ror r9
 6c4:	6174726f 	cmnvs	r4, pc, ror #4
 6c8:	7552746e 	ldrbvc	r7, [r2, #-1134]	; 0x46e
 6cc:	62616e6e 	rsbvs	r6, r1, #1760	; 0x6e0
 6d0:	6854656c 	ldmdavs	r4, {r2, r3, r5, r6, r8, sl, sp, lr}^
 6d4:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 6d8:	72687400 	rsbvc	r7, r8, #0, 8
 6dc:	31646165 	cmncc	r4, r5, ror #2
 6e0:	76735f31 	uhasxvc	r5, r3, r1
 6e4:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 6e8:	006b6361 	rsbeq	r6, fp, r1, ror #6
 6ec:	735f5053 	cmpvc	pc, #83	; 0x53
 6f0:	74006376 	strvc	r6, [r0], #-886	; 0x376
 6f4:	61657268 	cmnvs	r5, r8, ror #4
 6f8:	5f313264 	svcpl	0x00313264
 6fc:	5f637673 	svcpl	0x00637673
 700:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 704:	6874006b 	ldmdavs	r4!, {r0, r1, r3, r5, r6}^
 708:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 70c:	76735f35 	uhasxvc	r5, r3, r5
 710:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 714:	006b6361 	rsbeq	r6, fp, r1, ror #6
 718:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 71c:	30316461 	eorscc	r6, r1, r1, ror #8
 720:	6376735f 	cmnvs	r6, #2080374785	; 0x7c000001
 724:	6174735f 	cmnvs	r4, pc, asr r3
 728:	74006b63 	strvc	r6, [r0], #-2915	; 0xb63
 72c:	61657268 	cmnvs	r5, r8, ror #4
 730:	5f373264 	svcpl	0x00373264
 734:	5f637673 	svcpl	0x00637673
 738:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 73c:	656b006b 	strbvs	r0, [fp, #-107]!	; 0x6b
 740:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 744:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 748:	7268542f 	rsbvc	r5, r8, #788529152	; 0x2f000000
 74c:	2e646165 	powcssz	f6, f4, f5
 750:	68740063 	ldmdavs	r4!, {r0, r1, r5, r6}^
 754:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 758:	735f3532 	cmpvc	pc, #209715200	; 0xc800000
 75c:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 760:	6b636174 	blvs	18d8d38 <__user_program+0x15d8d38>
 764:	72687400 	rsbvc	r7, r8, #0, 8
 768:	34646165 	strbtcc	r6, [r4], #-357	; 0x165
 76c:	6376735f 	cmnvs	r6, #2080374785	; 0x7c000001
 770:	6174735f 	cmnvs	r4, pc, asr r3
 774:	74006b63 	strvc	r6, [r0], #-2915	; 0xb63
 778:	61657268 	cmnvs	r5, r8, ror #4
 77c:	735f3964 	cmpvc	pc, #100, 18	; 0x190000
 780:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 784:	6b636174 	blvs	18d8d5c <__user_program+0x15d8d5c>
 788:	67657200 	strbvs	r7, [r5, -r0, lsl #4]!
 78c:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0x369
 790:	74007372 	strvc	r7, [r0], #-882	; 0x372
 794:	61657268 	cmnvs	r5, r8, ror #4
 798:	5f363264 	svcpl	0x00363264
 79c:	5f637673 	svcpl	0x00637673
 7a0:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 7a4:	6177006b 	cmnvs	r7, fp, rrx
 7a8:	6e697469 	cdpvs	4, 6, cr7, cr9, cr9, {3}
 7ac:	696c5f67 	stmdbvs	ip!, {r0, r1, r2, r5, r6, r8, r9, sl, fp, ip, lr}^
 7b0:	74007473 	strvc	r7, [r0], #-1139	; 0x473
 7b4:	61657268 	cmnvs	r5, r8, ror #4
 7b8:	5f343164 	svcpl	0x00343164
 7bc:	5f637673 	svcpl	0x00637673
 7c0:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 7c4:	4255006b 	subsmi	r0, r5, #107	; 0x6b
 7c8:	7365545f 	cmnvc	r5, #1593835520	; 0x5f000000
 7cc:	68740074 	ldmdavs	r4!, {r2, r4, r5, r6}^
 7d0:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 7d4:	735f3432 	cmpvc	pc, #838860800	; 0x32000000
 7d8:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 7dc:	6b636174 	blvs	18d8db4 <__user_program+0x15d8db4>
 7e0:	5f524c00 	svcpl	0x00524c00
 7e4:	00637673 	rsbeq	r7, r3, r3, ror r6
 7e8:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 7ec:	5f386461 	svcpl	0x00386461
 7f0:	5f637673 	svcpl	0x00637673
 7f4:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 7f8:	6874006b 	ldmdavs	r4!, {r0, r1, r3, r5, r6}^
 7fc:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 800:	76735f30 	uhasxvc	r5, r3, r0
 804:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 808:	006b6361 	rsbeq	r6, fp, r1, ror #6
 80c:	755f524c 	ldrbvc	r5, [pc, #-588]	; 5c8 <__start-0x7a38>
 810:	66007273 			; <UNDEFINED> instruction: 0x66007273
 814:	74616f6c 	strbtvc	r6, [r1], #-3948	; 0xf6c
 818:	72687400 	rsbvc	r7, r8, #0, 8
 81c:	31646165 	cmncc	r4, r5, ror #2
 820:	76735f33 	uhasxvc	r5, r3, r3
 824:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 828:	006b6361 	rsbeq	r6, fp, r1, ror #6
 82c:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 830:	6f635f6b 	svcvs	0x00635f6b
 834:	64656970 	strbtvs	r6, [r5], #-2416	; 0x970
 838:	72687400 	rsbvc	r7, r8, #0, 8
 83c:	32646165 	rsbcc	r6, r4, #1073741849	; 0x40000019
 840:	76735f38 	uhasxvc	r5, r3, r8
 844:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 848:	006b6361 	rsbeq	r6, fp, r1, ror #6
 84c:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 850:	5f376461 	svcpl	0x00376461
 854:	5f637673 	svcpl	0x00637673
 858:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 85c:	6966006b 	stmdbvs	r6!, {r0, r1, r3, r5, r6}^
 860:	6873696e 	ldmdavs	r3!, {r1, r2, r3, r5, r6, r8, fp, sp, lr}^
 864:	53006465 	movwpl	r6, #1125	; 0x465
 868:	00525350 	subseq	r5, r2, r0, asr r3
 86c:	65766173 	ldrbvs	r6, [r6, #-371]!	; 0x173
 870:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 874:	74786574 	ldrbtvc	r6, [r8], #-1396	; 0x574
 878:	72687400 	rsbvc	r7, r8, #0, 8
 87c:	31646165 	cmncc	r4, r5, ror #2
 880:	76735f32 	uhasxvc	r5, r3, r2
 884:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 888:	006b6361 	rsbeq	r6, fp, r1, ror #6
 88c:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 890:	37316461 	ldrcc	r6, [r1, -r1, ror #8]!
 894:	6376735f 	cmnvs	r6, #2080374785	; 0x7c000001
 898:	6174735f 	cmnvs	r4, pc, asr r3
 89c:	73006b63 	movwvc	r6, #2915	; 0xb63
 8a0:	5f657661 	svcpl	0x00657661
 8a4:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xf63
 8a8:	5f747865 	svcpl	0x00747865
 8ac:	00435653 	subeq	r5, r3, r3, asr r6
 8b0:	6c697475 	cfstrdvs	mvd7, [r9], #-468	; 0xfffffe2c
 8b4:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 8b8:	006e6f69 	rsbeq	r6, lr, r9, ror #30
 8bc:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 8c0:	33326461 	teqcc	r2, #1627389952	; 0x61000000
 8c4:	6376735f 	cmnvs	r6, #2080374785	; 0x7c000001
 8c8:	6174735f 	cmnvs	r4, pc, asr r3
 8cc:	74006b63 	strvc	r6, [r0], #-2915	; 0xb63
 8d0:	61657268 	cmnvs	r5, r8, ror #4
 8d4:	5f303264 	svcpl	0x00303264
 8d8:	5f637673 	svcpl	0x00637673
 8dc:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 8e0:	6567006b 	strbvs	r0, [r7, #-107]!	; 0x6b
 8e4:	64695f74 	strbtvs	r5, [r9], #-3956	; 0xf74
 8e8:	745f656c 	ldrbvc	r6, [pc], #-1388	; 8f0 <__start-0x7710>
 8ec:	61657268 	cmnvs	r5, r8, ror #4
 8f0:	68740064 	ldmdavs	r4!, {r2, r5, r6}^
 8f4:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 8f8:	735f3631 	cmpvc	pc, #51380224	; 0x3100000
 8fc:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 900:	6b636174 	blvs	18d8ed8 <__user_program+0x15d8ed8>
 904:	76617300 	strbtvc	r7, [r1], -r0, lsl #6
 908:	6f635f65 	svcvs	0x00635f65
 90c:	7865746e 	stmdavc	r5!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}^
 910:	72695f74 	rsbvc	r5, r9, #116, 30	; 0x1d0
 914:	616d0071 	smcvs	53249	; 0xd001
 918:	72705f78 	rsbsvc	r5, r0, #120, 30	; 0x1e0
 91c:	74006f69 	strvc	r6, [r0], #-3945	; 0xf69
 920:	61657268 	cmnvs	r5, r8, ror #4
 924:	5f353164 	svcpl	0x00353164
 928:	5f637673 	svcpl	0x00637673
 92c:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 930:	7473006b 	ldrbtvc	r0, [r3], #-107	; 0x6b
 934:	5f747261 	svcpl	0x00747261
 938:	65726874 	ldrbvs	r6, [r2, #-2164]!	; 0x874
 93c:	73006461 	movwvc	r6, #1121	; 0x461
 940:	75746174 	ldrbvc	r6, [r4, #-372]!	; 0x174
 944:	68740073 	ldmdavs	r4!, {r0, r1, r4, r5, r6}^
 948:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 94c:	735f3831 	cmpvc	pc, #3211264	; 0x310000
 950:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 954:	6b636174 	blvs	18d8f2c <__user_program+0x15d8f2c>
 958:	53505300 	cmppl	r0, #0, 6
 95c:	76735f52 	uhsaxvc	r5, r3, r2
 960:	68630063 	stmdavs	r3!, {r0, r1, r5, r6}^
 964:	5f6b6365 	svcpl	0x006b6365
 968:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 96c:	6e757200 	cdpvs	2, 7, cr7, cr5, cr0, {0}
 970:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 974:	64690065 	strbtvs	r0, [r9], #-101	; 0x65
 978:	665f656c 	ldrbvs	r6, [pc], -ip, ror #10
 97c:	6f63006e 	svcvs	0x0063006e
 980:	7865746e 	stmdavc	r5!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}^
 984:	77735f74 			; <UNDEFINED> instruction: 0x77735f74
 988:	68637469 	stmdavs	r3!, {r0, r3, r5, r6, sl, ip, sp, lr}^
 98c:	74657300 	strbtvc	r7, [r5], #-768	; 0x300
 990:	5f42555f 	svcpl	0x0042555f
 994:	6e756f42 	cdpvs	15, 7, cr6, cr5, cr2, {2}
 998:	74007364 	strvc	r7, [r0], #-868	; 0x364
 99c:	61657268 	cmnvs	r5, r8, ror #4
 9a0:	5f393164 	svcpl	0x00393164
 9a4:	5f637673 	svcpl	0x00637673
 9a8:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
 9ac:	6874006b 	ldmdavs	r4!, {r0, r1, r3, r5, r6}^
 9b0:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 9b4:	735f3033 	cmpvc	pc, #51	; 0x33
 9b8:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 9bc:	6b636174 	blvs	18d8f94 <__user_program+0x15d8f94>
 9c0:	72687400 	rsbvc	r7, r8, #0, 8
 9c4:	33646165 	cmncc	r4, #1073741849	; 0x40000019
 9c8:	6376735f 	cmnvs	r6, #2080374785	; 0x7c000001
 9cc:	6174735f 	cmnvs	r4, pc, asr r3
 9d0:	74006b63 	strvc	r6, [r0], #-2915	; 0xb63
 9d4:	5f656d69 	svcpl	0x00656d69
 9d8:	006e7572 	rsbeq	r7, lr, r2, ror r5
 9dc:	656c6469 	strbvs	r6, [ip, #-1129]!	; 0x469
 9e0:	6e75665f 	mrcvs	6, 3, r6, cr5, cr15, {2}
 9e4:	6f697463 	svcvs	0x00697463
 9e8:	7270006e 	rsbsvc	r0, r0, #110	; 0x6e
 9ec:	6e657365 	cdpvs	3, 6, cr7, cr5, cr5, {3}
 9f0:	68745f74 	ldmdavs	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 9f4:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 9f8:	72687400 	rsbvc	r7, r8, #0, 8
 9fc:	32646165 	rsbcc	r6, r4, #1073741849	; 0x40000019
 a00:	76735f32 	uhasxvc	r5, r3, r2
 a04:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 a08:	006b6361 	rsbeq	r6, fp, r1, ror #6
 a0c:	5f746567 	svcpl	0x00746567
 a10:	5f637673 	svcpl	0x00637673
 a14:	74007073 	strvc	r7, [r0], #-115	; 0x73
 a18:	61657268 	cmnvs	r5, r8, ror #4
 a1c:	6f635f64 	svcvs	0x00635f64
 a20:	00746e75 	rsbseq	r6, r4, r5, ror lr
 a24:	656c6469 	strbvs	r6, [ip, #-1129]!	; 0x469
 a28:	6376735f 	cmnvs	r6, #2080374785	; 0x7c000001
 a2c:	6174735f 	cmnvs	r4, pc, asr r3
 a30:	74006b63 	strvc	r6, [r0], #-2915	; 0xb63
 a34:	61657268 	cmnvs	r5, r8, ror #4
 a38:	735f3264 	cmpvc	pc, #100, 4	; 0x40000006
 a3c:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 a40:	6b636174 	blvs	18d9018 <__user_program+0x15d9018>
 a44:	72687400 	rsbvc	r7, r8, #0, 8
 a48:	32646165 	rsbcc	r6, r4, #1073741849	; 0x40000019
 a4c:	76735f39 	uhasxvc	r5, r3, r9
 a50:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 a54:	006b6361 	rsbeq	r6, fp, r1, ror #6
 a58:	5f6e7572 	svcpl	0x006e7572
 a5c:	68740061 	ldmdavs	r4!, {r0, r5, r6}^
 a60:	64616572 	strbtvs	r6, [r1], #-1394	; 0x572
 a64:	75630073 	strbvc	r0, [r3, #-115]!	; 0x73
 a68:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
 a6c:	72705f74 	rsbsvc	r5, r0, #116, 30	; 0x1d0
 a70:	69726f69 	ldmdbvs	r2!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
 a74:	69007974 	stmdbvs	r0, {r2, r4, r5, r6, r8, fp, ip, sp, lr}
 a78:	745f706d 	ldrbvc	r7, [pc], #-109	; a80 <__start-0x7580>
 a7c:	73007268 	movwvc	r7, #616	; 0x268
 a80:	5f657661 	svcpl	0x00657661
 a84:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xf63
 a88:	5f747865 	svcpl	0x00747865
 a8c:	72657375 	rsbvc	r7, r5, #-738197503	; 0xd4000001
 a90:	72687400 	rsbvc	r7, r8, #0, 8
 a94:	31646165 	cmncc	r4, r5, ror #2
 a98:	6376735f 	cmnvs	r6, #2080374785	; 0x7c000001
 a9c:	6174735f 	cmnvs	r4, pc, asr r3
 aa0:	74006b63 	strvc	r6, [r0], #-2915	; 0xb63
 aa4:	61657268 	cmnvs	r5, r8, ror #4
 aa8:	735f3664 	cmpvc	pc, #100, 12	; 0x6400000
 aac:	735f6376 	cmpvc	pc, #-671088639	; 0xd8000001
 ab0:	6b636174 	blvs	18d9088 <__user_program+0x15d9088>
 ab4:	6c646900 	stclvs	9, cr6, [r4], #-0
 ab8:	74735f65 	ldrbtvc	r5, [r3], #-3941	; 0xf65
 abc:	5f6b6361 	svcpl	0x006b6361
 ac0:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
 ac4:	6d630074 	stclvs	0, cr0, [r3, #-464]!	; 0xfffffe30
 ac8:	646f4d64 	strbtvs	r4, [pc], #-3428	; ad0 <__start-0x7530>
 acc:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 ad0:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 ad4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 ad8:	6970732f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r8, r9, ip, sp, lr}^
 adc:	6b00632e 	blvs	1979c <thread14_svc_stack+0x784>
 ae0:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 ae4:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 ae8:	79732f63 	ldmdbvc	r3!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
 aec:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 af0:	632e736c 	teqvs	lr, #108, 6	; 0xb0000001
 af4:	636e6900 	cmnvs	lr, #0, 18
 af8:	5f5f0072 	svcpl	0x005f0072
 afc:	70616568 	rsbvc	r6, r1, r8, ror #10
 b00:	776f6c5f 			; <UNDEFINED> instruction: 0x776f6c5f
 b04:	685f5f00 	ldmdavs	pc, {r8, r9, sl, fp, ip, lr}^	; <UNPREDICTABLE>
 b08:	5f706165 	svcpl	0x00706165
 b0c:	00706f74 	rsbseq	r6, r0, r4, ror pc
 b10:	676e6168 	strbvs	r6, [lr, -r8, ror #2]!
 b14:	73797300 	cmnvc	r9, #0, 6
 b18:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 b1c:	65736c5f 	ldrbvs	r6, [r3, #-3167]!	; 0xc5f
 b20:	70006b65 	andvc	r6, r0, r5, ror #22
 b24:	5f766572 	svcpl	0x00766572
 b28:	70616568 	rsbvc	r6, r1, r8, ror #10
 b2c:	646e655f 	strbtvs	r6, [lr], #-1375	; 0x55f
 b30:	73797300 	cmnvc	r9, #0, 6
 b34:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 b38:	6173695f 	cmnvs	r3, pc, asr r9
 b3c:	00797474 	rsbseq	r7, r9, r4, ror r4
 b40:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 b44:	5f6c6c61 	svcpl	0x006c6c61
 b48:	736f6c63 	cmnvc	pc, #25344	; 0x6300
 b4c:	Address 0x00000b4c is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__user_program+0xdd0d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	204d5241 	subcs	r5, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xd45
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2973726f 	ldmdbcs	r3!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^
  2c:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  30:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  34:	30353130 	eorscc	r3, r5, r0, lsr r1
  38:	20393235 	eorscs	r3, r9, r5, lsr r2
  3c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  40:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  44:	415b2029 	cmpmi	fp, r9, lsr #32
  48:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff2fe <__user_program+0xffcff2fe>
  4c:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  50:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  54:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  58:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  5c:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  60:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  64:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  68:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  6c:	005d3838 	subseq	r3, sp, r8, lsr r8

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002c41 	andeq	r2, r0, r1, asr #24
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000022 	andeq	r0, r0, r2, lsr #32
  10:	412d3705 	teqmi	sp, r5, lsl #14
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	14041202 	strne	r1, [r4], #-514	; 0x202
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end+0x17038>
  28:	22061e01 	andcs	r1, r6, #1, 28
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000001c 	andeq	r0, r0, ip, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000120 	andeq	r0, r0, r0, lsr #2
  20:	8b040e42 	blhi	103930 <__bss_end+0xd4930>
  24:	0b0d4201 	bleq	350830 <__user_program+0x50830>
  28:	0d0d8802 	stceq	8, cr8, [sp, #-8]
  2c:	000ecb42 	andeq	ip, lr, r2, asr #22
  30:	0000001c 	andeq	r0, r0, ip, lsl r0
  34:	00000000 	andeq	r0, r0, r0
  38:	00008174 	andeq	r8, r0, r4, ror r1
  3c:	00000084 	andeq	r0, r0, r4, lsl #1
  40:	8b040e42 	blhi	103950 <__bss_end+0xd4950>
  44:	0b0d4201 	bleq	350850 <__user_program+0x50850>
  48:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
  4c:	00000ecb 	andeq	r0, r0, fp, asr #29
  50:	0000001c 	andeq	r0, r0, ip, lsl r0
  54:	00000000 	andeq	r0, r0, r0
  58:	000081f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
  5c:	00000084 	andeq	r0, r0, r4, lsl #1
  60:	8b040e42 	blhi	103970 <__bss_end+0xd4970>
  64:	0b0d4201 	bleq	350870 <__user_program+0x50870>
  68:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
  6c:	00000ecb 	andeq	r0, r0, fp, asr #29
  70:	0000001c 	andeq	r0, r0, ip, lsl r0
  74:	00000000 	andeq	r0, r0, r0
  78:	0000827c 	andeq	r8, r0, ip, ror r2
  7c:	000000f8 	strdeq	r0, [r0], -r8
  80:	8b080e42 	blhi	203990 <__end+0xb3990>
  84:	42018e02 	andmi	r8, r1, #2, 28
  88:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
  8c:	080d0c76 	stmdaeq	sp, {r1, r2, r4, r5, r6, sl, fp}
  90:	0000000c 	andeq	r0, r0, ip
  94:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  98:	7c020001 	stcvc	0, cr0, [r2], {1}
  9c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  a0:	00000014 	andeq	r0, r0, r4, lsl r0
  a4:	00000090 	muleq	r0, r0, r0
  a8:	00008374 	andeq	r8, r0, r4, ror r3
  ac:	00000034 	andeq	r0, r0, r4, lsr r0
  b0:	83080e42 	movwhi	r0, #36418	; 0x8e42
  b4:	00018e02 	andeq	r8, r1, r2, lsl #28
  b8:	00000014 	andeq	r0, r0, r4, lsl r0
  bc:	00000090 	muleq	r0, r0, r0
  c0:	000083a8 	andeq	r8, r0, r8, lsr #7
  c4:	00000018 	andeq	r0, r0, r8, lsl r0
  c8:	83080e42 	movwhi	r0, #36418	; 0x8e42
  cc:	00018e02 	andeq	r8, r1, r2, lsl #28
  d0:	0000001c 	andeq	r0, r0, ip, lsl r0
  d4:	00000090 	muleq	r0, r0, r0
  d8:	000083c0 	andeq	r8, r0, r0, asr #7
  dc:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
  e0:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
  e4:	42018e02 	andmi	r8, r1, #2, 28
  e8:	d202180e 	andle	r1, r2, #917504	; 0xe0000
  ec:	0000080e 	andeq	r0, r0, lr, lsl #16
  f0:	0000000c 	andeq	r0, r0, ip
  f4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  f8:	7c020001 	stcvc	0, cr0, [r2], {1}
  fc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 100:	00000028 	andeq	r0, r0, r8, lsr #32
 104:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 108:	00008570 	andeq	r8, r0, r0, ror r5
 10c:	000000e0 	andeq	r0, r0, r0, ror #1
 110:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 114:	86078508 	strhi	r8, [r7], -r8, lsl #10
 118:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 11c:	8a038904 	bhi	e2534 <__bss_end+0xb3534>
 120:	42018e02 	andmi	r8, r1, #2, 28
 124:	6a02280e 	bvs	8a164 <__bss_end+0x5b164>
 128:	0000200e 	andeq	r2, r0, lr
 12c:	00000040 	andeq	r0, r0, r0, asr #32
 130:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 134:	00008650 	andeq	r8, r0, r0, asr r6
 138:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 13c:	80100e42 	andshi	r0, r0, r2, asr #28
 140:	82038104 	andhi	r8, r3, #4, 2
 144:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
 148:	0a84280e 	beq	fe10a188 <__user_program+0xfde0a188>
 14c:	08860985 	stmeq	r6, {r0, r2, r7, r8, fp}
 150:	06880787 	streq	r0, [r8], r7, lsl #15
 154:	0e42058e 	cdpeq	5, 4, cr0, cr2, cr14, {4}
 158:	0ed00230 	mrceq	2, 6, r0, cr0, cr0, {1}
 15c:	c8ce4228 	stmiagt	lr, {r3, r5, r9, lr}^
 160:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 164:	c342100e 	movtgt	r1, #8206	; 0x200e
 168:	0ec0c1c2 	acseqdm	f4, f2
 16c:	00000000 	andeq	r0, r0, r0
 170:	0000000c 	andeq	r0, r0, ip
 174:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 178:	7c020001 	stcvc	0, cr0, [r2], {1}
 17c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 180:	00000014 	andeq	r0, r0, r4, lsl r0
 184:	00000170 	andeq	r0, r0, r0, ror r1
 188:	00008808 	andeq	r8, r0, r8, lsl #16
 18c:	00000040 	andeq	r0, r0, r0, asr #32
 190:	83080e42 	movwhi	r0, #36418	; 0x8e42
 194:	00018e02 	andeq	r8, r1, r2, lsl #28
 198:	0000000c 	andeq	r0, r0, ip
 19c:	00000170 	andeq	r0, r0, r0, ror r1
 1a0:	00008848 	andeq	r8, r0, r8, asr #16
 1a4:	00000024 	andeq	r0, r0, r4, lsr #32
 1a8:	0000000c 	andeq	r0, r0, ip
 1ac:	00000170 	andeq	r0, r0, r0, ror r1
 1b0:	0000886c 	andeq	r8, r0, ip, ror #16
 1b4:	00000010 	andeq	r0, r0, r0, lsl r0
 1b8:	0000000c 	andeq	r0, r0, ip
 1bc:	00000170 	andeq	r0, r0, r0, ror r1
 1c0:	0000887c 	andeq	r8, r0, ip, ror r8
 1c4:	00000014 	andeq	r0, r0, r4, lsl r0
 1c8:	0000000c 	andeq	r0, r0, ip
 1cc:	00000170 	andeq	r0, r0, r0, ror r1
 1d0:	00008890 	muleq	r0, r0, r8
 1d4:	00000034 	andeq	r0, r0, r4, lsr r0
 1d8:	0000000c 	andeq	r0, r0, ip
 1dc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1e0:	7c020001 	stcvc	0, cr0, [r2], {1}
 1e4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1e8:	0000000c 	andeq	r0, r0, ip
 1ec:	000001d8 	ldrdeq	r0, [r0], -r8
 1f0:	000088c4 	andeq	r8, r0, r4, asr #17
 1f4:	00000020 	andeq	r0, r0, r0, lsr #32
 1f8:	0000000c 	andeq	r0, r0, ip
 1fc:	000001d8 	ldrdeq	r0, [r0], -r8
 200:	000088e4 	andeq	r8, r0, r4, ror #17
 204:	00000044 	andeq	r0, r0, r4, asr #32
 208:	0000000c 	andeq	r0, r0, ip
 20c:	000001d8 	ldrdeq	r0, [r0], -r8
 210:	00008928 	andeq	r8, r0, r8, lsr #18
 214:	00000044 	andeq	r0, r0, r4, asr #32
 218:	0000000c 	andeq	r0, r0, ip
 21c:	000001d8 	ldrdeq	r0, [r0], -r8
 220:	0000896c 	andeq	r8, r0, ip, ror #18
 224:	00000024 	andeq	r0, r0, r4, lsr #32
 228:	00000014 	andeq	r0, r0, r4, lsl r0
 22c:	000001d8 	ldrdeq	r0, [r0], -r8
 230:	00008990 	muleq	r0, r0, r9
 234:	00000034 	andeq	r0, r0, r4, lsr r0
 238:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 23c:	00018e02 	andeq	r8, r1, r2, lsl #28
 240:	00000014 	andeq	r0, r0, r4, lsl r0
 244:	000001d8 	ldrdeq	r0, [r0], -r8
 248:	000089c4 	andeq	r8, r0, r4, asr #19
 24c:	00000034 	andeq	r0, r0, r4, lsr r0
 250:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 254:	00018e02 	andeq	r8, r1, r2, lsl #28
 258:	00000014 	andeq	r0, r0, r4, lsl r0
 25c:	000001d8 	ldrdeq	r0, [r0], -r8
 260:	000089f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 264:	00000040 	andeq	r0, r0, r0, asr #32
 268:	83080e42 	movwhi	r0, #36418	; 0x8e42
 26c:	00018e02 	andeq	r8, r1, r2, lsl #28
 270:	00000014 	andeq	r0, r0, r4, lsl r0
 274:	000001d8 	ldrdeq	r0, [r0], -r8
 278:	00008a38 	andeq	r8, r0, r8, lsr sl
 27c:	00000110 	andeq	r0, r0, r0, lsl r1
 280:	83080e42 	movwhi	r0, #36418	; 0x8e42
 284:	00018e02 	andeq	r8, r1, r2, lsl #28
 288:	00000014 	andeq	r0, r0, r4, lsl r0
 28c:	000001d8 	ldrdeq	r0, [r0], -r8
 290:	00008b48 	andeq	r8, r0, r8, asr #22
 294:	00000038 	andeq	r0, r0, r8, lsr r0
 298:	83080e42 	movwhi	r0, #36418	; 0x8e42
 29c:	00018e02 	andeq	r8, r1, r2, lsl #28
 2a0:	00000018 	andeq	r0, r0, r8, lsl r0
 2a4:	000001d8 	ldrdeq	r0, [r0], -r8
 2a8:	00008b80 	andeq	r8, r0, r0, lsl #23
 2ac:	00000044 	andeq	r0, r0, r4, asr #32
 2b0:	83100e42 	tsthi	r0, #1056	; 0x420
 2b4:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 2b8:	00018e02 	andeq	r8, r1, r2, lsl #28
 2bc:	00000018 	andeq	r0, r0, r8, lsl r0
 2c0:	000001d8 	ldrdeq	r0, [r0], -r8
 2c4:	00008bc4 	andeq	r8, r0, r4, asr #23
 2c8:	00000060 	andeq	r0, r0, r0, rrx
 2cc:	83100e42 	tsthi	r0, #1056	; 0x420
 2d0:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 2d4:	00018e02 	andeq	r8, r1, r2, lsl #28
 2d8:	00000018 	andeq	r0, r0, r8, lsl r0
 2dc:	000001d8 	ldrdeq	r0, [r0], -r8
 2e0:	00008c24 	andeq	r8, r0, r4, lsr #24
 2e4:	0000003c 	andeq	r0, r0, ip, lsr r0
 2e8:	83100e42 	tsthi	r0, #1056	; 0x420
 2ec:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 2f0:	00018e02 	andeq	r8, r1, r2, lsl #28
 2f4:	0000000c 	andeq	r0, r0, ip
 2f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 300:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 304:	00000014 	andeq	r0, r0, r4, lsl r0
 308:	000002f4 	strdeq	r0, [r0], -r4
 30c:	00008c60 	andeq	r8, r0, r0, ror #24
 310:	0000006c 	andeq	r0, r0, ip, rrx
 314:	83080e42 	movwhi	r0, #36418	; 0x8e42
 318:	00018e02 	andeq	r8, r1, r2, lsl #28
 31c:	0000000c 	andeq	r0, r0, ip
 320:	000002f4 	strdeq	r0, [r0], -r4
 324:	00008ccc 	andeq	r8, r0, ip, asr #25
 328:	00000020 	andeq	r0, r0, r0, lsr #32
 32c:	0000000c 	andeq	r0, r0, ip
 330:	000002f4 	strdeq	r0, [r0], -r4
 334:	00008cec 	andeq	r8, r0, ip, ror #25
 338:	00000024 	andeq	r0, r0, r4, lsr #32
 33c:	0000000c 	andeq	r0, r0, ip
 340:	000002f4 	strdeq	r0, [r0], -r4
 344:	00008d10 	andeq	r8, r0, r0, lsl sp
 348:	0000003c 	andeq	r0, r0, ip, lsr r0
 34c:	0000000c 	andeq	r0, r0, ip
 350:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 354:	7c020001 	stcvc	0, cr0, [r2], {1}
 358:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 35c:	00000018 	andeq	r0, r0, r8, lsl r0
 360:	0000034c 	andeq	r0, r0, ip, asr #6
 364:	00008d4c 	andeq	r8, r0, ip, asr #26
 368:	00000068 	andeq	r0, r0, r8, rrx
 36c:	83100e42 	tsthi	r0, #1056	; 0x420
 370:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 374:	00018e02 	andeq	r8, r1, r2, lsl #28
 378:	00000014 	andeq	r0, r0, r4, lsl r0
 37c:	0000034c 	andeq	r0, r0, ip, asr #6
 380:	00008db4 			; <UNDEFINED> instruction: 0x00008db4
 384:	000000e0 	andeq	r0, r0, r0, ror #1
 388:	8e040e66 	cdphi	14, 0, cr0, cr4, cr6, {3}
 38c:	00000001 	andeq	r0, r0, r1
 390:	0000000c 	andeq	r0, r0, ip
 394:	0000034c 	andeq	r0, r0, ip, asr #6
 398:	00008e94 	muleq	r0, r4, lr
 39c:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 3a0:	0000000c 	andeq	r0, r0, ip
 3a4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3a8:	7c020001 	stcvc	0, cr0, [r2], {1}
 3ac:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3b0:	0000000c 	andeq	r0, r0, ip
 3b4:	000003a0 	andeq	r0, r0, r0, lsr #7
 3b8:	00008f64 	andeq	r8, r0, r4, ror #30
 3bc:	00000014 	andeq	r0, r0, r4, lsl r0
 3c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 3c4:	000003a0 	andeq	r0, r0, r0, lsr #7
 3c8:	00008f78 	andeq	r8, r0, r8, ror pc
 3cc:	00000098 	muleq	r0, r8, r0
 3d0:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 3d4:	42018e02 	andmi	r8, r1, #2, 28
 3d8:	4602180e 	strmi	r1, [r2], -lr, lsl #16
 3dc:	0000080e 	andeq	r0, r0, lr, lsl #16
 3e0:	0000000c 	andeq	r0, r0, ip
 3e4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3e8:	7c020001 	stcvc	0, cr0, [r2], {1}
 3ec:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3f0:	0000000c 	andeq	r0, r0, ip
 3f4:	000003e0 	andeq	r0, r0, r0, ror #7
 3f8:	00009010 	andeq	r9, r0, r0, lsl r0
 3fc:	00000180 	andeq	r0, r0, r0, lsl #3
 400:	0000000c 	andeq	r0, r0, ip
 404:	000003e0 	andeq	r0, r0, r0, ror #7
 408:	00009190 	muleq	r0, r0, r1
 40c:	00000010 	andeq	r0, r0, r0, lsl r0
 410:	00000018 	andeq	r0, r0, r8, lsl r0
 414:	000003e0 	andeq	r0, r0, r0, ror #7
 418:	000091a0 	andeq	r9, r0, r0, lsr #3
 41c:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 420:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 424:	86038504 	strhi	r8, [r3], -r4, lsl #10
 428:	00018e02 	andeq	r8, r1, r2, lsl #28
 42c:	0000000c 	andeq	r0, r0, ip
 430:	000003e0 	andeq	r0, r0, r0, ror #7
 434:	00009290 	muleq	r0, r0, r2
 438:	00000014 	andeq	r0, r0, r4, lsl r0
 43c:	00000014 	andeq	r0, r0, r4, lsl r0
 440:	000003e0 	andeq	r0, r0, r0, ror #7
 444:	000092a4 	andeq	r9, r0, r4, lsr #5
 448:	0000004c 	andeq	r0, r0, ip, asr #32
 44c:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 450:	00018e02 	andeq	r8, r1, r2, lsl #28
 454:	0000000c 	andeq	r0, r0, ip
 458:	000003e0 	andeq	r0, r0, r0, ror #7
 45c:	000092f0 	strdeq	r9, [r0], -r0
 460:	00000040 	andeq	r0, r0, r0, asr #32
 464:	00000018 	andeq	r0, r0, r8, lsl r0
 468:	000003e0 	andeq	r0, r0, r0, ror #7
 46c:	00009330 	andeq	r9, r0, r0, lsr r3
 470:	000000b4 	strheq	r0, [r0], -r4
 474:	8e040e4c 	cdphi	14, 0, cr0, cr4, cr12, {2}
 478:	0e4a0201 	cdpeq	2, 4, cr0, cr10, cr1, {0}
 47c:	0000ce00 	andeq	ip, r0, r0, lsl #28
 480:	00000014 	andeq	r0, r0, r4, lsl r0
 484:	000003e0 	andeq	r0, r0, r0, ror #7
 488:	000093e4 	andeq	r9, r0, r4, ror #7
 48c:	0000003c 	andeq	r0, r0, ip, lsr r0
 490:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 494:	00018e02 	andeq	r8, r1, r2, lsl #28
 498:	00000020 	andeq	r0, r0, r0, lsr #32
 49c:	000003e0 	andeq	r0, r0, r0, ror #7
 4a0:	00009420 	andeq	r9, r0, r0, lsr #8
 4a4:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
 4a8:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 4ac:	86078508 	strhi	r8, [r7], -r8, lsl #10
 4b0:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 4b4:	8a038904 	bhi	e28cc <__bss_end+0xb38cc>
 4b8:	00018e02 	andeq	r8, r1, r2, lsl #28
 4bc:	0000000c 	andeq	r0, r0, ip
 4c0:	000003e0 	andeq	r0, r0, r0, ror #7
 4c4:	000096d0 	ldrdeq	r9, [r0], -r0
 4c8:	0000006c 	andeq	r0, r0, ip, rrx
 4cc:	00000014 	andeq	r0, r0, r4, lsl r0
 4d0:	000003e0 	andeq	r0, r0, r0, ror #7
 4d4:	0000973c 	andeq	r9, r0, ip, lsr r7
 4d8:	00000048 	andeq	r0, r0, r8, asr #32
 4dc:	8e040e42 	cdphi	14, 0, cr0, cr4, cr2, {2}
 4e0:	00000001 	andeq	r0, r0, r1
 4e4:	00000014 	andeq	r0, r0, r4, lsl r0
 4e8:	000003e0 	andeq	r0, r0, r0, ror #7
 4ec:	00009784 	andeq	r9, r0, r4, lsl #15
 4f0:	00000048 	andeq	r0, r0, r8, asr #32
 4f4:	8e040e42 	cdphi	14, 0, cr0, cr4, cr2, {2}
 4f8:	00000001 	andeq	r0, r0, r1
 4fc:	0000000c 	andeq	r0, r0, ip
 500:	000003e0 	andeq	r0, r0, r0, ror #7
 504:	000097cc 	andeq	r9, r0, ip, asr #15
 508:	00000034 	andeq	r0, r0, r4, lsr r0
 50c:	00000014 	andeq	r0, r0, r4, lsl r0
 510:	000003e0 	andeq	r0, r0, r0, ror #7
 514:	00009800 	andeq	r9, r0, r0, lsl #16
 518:	0000007c 	andeq	r0, r0, ip, ror r0
 51c:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 520:	00018e02 	andeq	r8, r1, r2, lsl #28
 524:	0000000c 	andeq	r0, r0, ip
 528:	000003e0 	andeq	r0, r0, r0, ror #7
 52c:	0000987c 	andeq	r9, r0, ip, ror r8
 530:	00000068 	andeq	r0, r0, r8, rrx
 534:	0000000c 	andeq	r0, r0, ip
 538:	000003e0 	andeq	r0, r0, r0, ror #7
 53c:	000098e4 	andeq	r9, r0, r4, ror #17
 540:	00000010 	andeq	r0, r0, r0, lsl r0
 544:	0000001c 	andeq	r0, r0, ip, lsl r0
 548:	000003e0 	andeq	r0, r0, r0, ror #7
 54c:	000098f4 	strdeq	r9, [r0], -r4
 550:	000000a0 	andeq	r0, r0, r0, lsr #1
 554:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 558:	86058506 	strhi	r8, [r5], -r6, lsl #10
 55c:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 560:	00018e02 	andeq	r8, r1, r2, lsl #28
 564:	00000014 	andeq	r0, r0, r4, lsl r0
 568:	000003e0 	andeq	r0, r0, r0, ror #7
 56c:	00009994 	muleq	r0, r4, r9
 570:	00000048 	andeq	r0, r0, r8, asr #32
 574:	83080e42 	movwhi	r0, #36418	; 0x8e42
 578:	00018e02 	andeq	r8, r1, r2, lsl #28
 57c:	0000000c 	andeq	r0, r0, ip
 580:	000003e0 	andeq	r0, r0, r0, ror #7
 584:	000099dc 	ldrdeq	r9, [r0], -ip
 588:	0000017c 	andeq	r0, r0, ip, ror r1
 58c:	00000018 	andeq	r0, r0, r8, lsl r0
 590:	000003e0 	andeq	r0, r0, r0, ror #7
 594:	00009b58 	andeq	r9, r0, r8, asr fp
 598:	000000bc 	strheq	r0, [r0], -ip
 59c:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 5a0:	86038504 	strhi	r8, [r3], -r4, lsl #10
 5a4:	00018e02 	andeq	r8, r1, r2, lsl #28
 5a8:	0000000c 	andeq	r0, r0, ip
 5ac:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 5b0:	7c020001 	stcvc	0, cr0, [r2], {1}
 5b4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 5b8:	0000000c 	andeq	r0, r0, ip
 5bc:	000005a8 	andeq	r0, r0, r8, lsr #11
 5c0:	00009c14 	andeq	r9, r0, r4, lsl ip
 5c4:	00000020 	andeq	r0, r0, r0, lsr #32
 5c8:	00000014 	andeq	r0, r0, r4, lsl r0
 5cc:	000005a8 	andeq	r0, r0, r8, lsr #11
 5d0:	00009c34 	andeq	r9, r0, r4, lsr ip
 5d4:	00000074 	andeq	r0, r0, r4, ror r0
 5d8:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 5dc:	00018e02 	andeq	r8, r1, r2, lsl #28
 5e0:	0000000c 	andeq	r0, r0, ip
 5e4:	000005a8 	andeq	r0, r0, r8, lsr #11
 5e8:	00009ca8 	andeq	r9, r0, r8, lsr #25
 5ec:	00000034 	andeq	r0, r0, r4, lsr r0
 5f0:	0000000c 	andeq	r0, r0, ip
 5f4:	000005a8 	andeq	r0, r0, r8, lsr #11
 5f8:	00009cdc 	ldrdeq	r9, [r0], -ip
 5fc:	00000018 	andeq	r0, r0, r8, lsl r0
 600:	00000018 	andeq	r0, r0, r8, lsl r0
 604:	000005a8 	andeq	r0, r0, r8, lsr #11
 608:	00009cf4 	strdeq	r9, [r0], -r4
 60c:	000000a0 	andeq	r0, r0, r0, lsr #1
 610:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 614:	86038504 	strhi	r8, [r3], -r4, lsl #10
 618:	00018e02 	andeq	r8, r1, r2, lsl #28
 61c:	0000000c 	andeq	r0, r0, ip
 620:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 624:	7c020001 	stcvc	0, cr0, [r2], {1}
 628:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 62c:	00000014 	andeq	r0, r0, r4, lsl r0
 630:	0000061c 	andeq	r0, r0, ip, lsl r6
 634:	00009d94 	muleq	r0, r4, sp
 638:	0000001c 	andeq	r0, r0, ip, lsl r0
 63c:	83080e42 	movwhi	r0, #36418	; 0x8e42
 640:	00018e02 	andeq	r8, r1, r2, lsl #28
 644:	00000020 	andeq	r0, r0, r0, lsr #32
 648:	0000061c 	andeq	r0, r0, ip, lsl r6
 64c:	00009db0 			; <UNDEFINED> instruction: 0x00009db0
 650:	00000048 	andeq	r0, r0, r8, asr #32
 654:	84100e46 	ldrhi	r0, [r0], #-3654	; 0xe46
 658:	86038504 	strhi	r8, [r3], -r4, lsl #10
 65c:	5a018e02 	bpl	63e6c <__bss_end+0x34e6c>
 660:	c5c4000e 	strbgt	r0, [r4, #14]
 664:	0000cec6 	andeq	ip, r0, r6, asr #29
 668:	00000028 	andeq	r0, r0, r8, lsr #32
 66c:	0000061c 	andeq	r0, r0, ip, lsl r6
 670:	00009df8 	strdeq	r9, [r0], -r8
 674:	0000009c 	muleq	r0, ip, r0
 678:	83180e46 	tsthi	r8, #1120	; 0x460
 67c:	85058406 	strhi	r8, [r5, #-1030]	; 0x406
 680:	87038604 	strhi	r8, [r3, -r4, lsl #12]
 684:	02018e02 	andeq	r8, r1, #2, 28
 688:	c3000e44 	movwgt	r0, #3652	; 0xe44
 68c:	c7c6c5c4 	strbgt	ip, [r6, r4, asr #11]
 690:	000000ce 	andeq	r0, r0, lr, asr #1
 694:	00000014 	andeq	r0, r0, r4, lsl r0
 698:	0000061c 	andeq	r0, r0, ip, lsl r6
 69c:	00009e94 	muleq	r0, r4, lr
 6a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 6a4:	83080e42 	movwhi	r0, #36418	; 0x8e42
 6a8:	00018e02 	andeq	r8, r1, r2, lsl #28
 6ac:	00000014 	andeq	r0, r0, r4, lsl r0
 6b0:	0000061c 	andeq	r0, r0, ip, lsl r6
 6b4:	00009eb0 			; <UNDEFINED> instruction: 0x00009eb0
 6b8:	00000010 	andeq	r0, r0, r0, lsl r0
 6bc:	83080e42 	movwhi	r0, #36418	; 0x8e42
 6c0:	00018e02 	andeq	r8, r1, r2, lsl #28
 6c4:	0000000c 	andeq	r0, r0, ip
 6c8:	0000061c 	andeq	r0, r0, ip, lsl r6
 6cc:	00009ec0 	andeq	r9, r0, r0, asr #29
 6d0:	00000058 	andeq	r0, r0, r8, asr r0
 6d4:	0000000c 	andeq	r0, r0, ip
 6d8:	0000061c 	andeq	r0, r0, ip, lsl r6
 6dc:	00009f18 	andeq	r9, r0, r8, lsl pc
 6e0:	00000008 	andeq	r0, r0, r8
 6e4:	0000000c 	andeq	r0, r0, ip
 6e8:	0000061c 	andeq	r0, r0, ip, lsl r6
 6ec:	00009f20 	andeq	r9, r0, r0, lsr #30
 6f0:	00000008 	andeq	r0, r0, r8
 6f4:	0000000c 	andeq	r0, r0, ip
 6f8:	0000061c 	andeq	r0, r0, ip, lsl r6
 6fc:	00009f28 	andeq	r9, r0, r8, lsr #30
 700:	00000008 	andeq	r0, r0, r8
 704:	0000000c 	andeq	r0, r0, ip
 708:	0000061c 	andeq	r0, r0, ip, lsl r6
 70c:	00009f30 	andeq	r9, r0, r0, lsr pc
 710:	00000008 	andeq	r0, r0, r8
 714:	0000000c 	andeq	r0, r0, ip
 718:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 71c:	7c010001 	stcvc	0, cr0, [r1], {1}
 720:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 724:	0000000c 	andeq	r0, r0, ip
 728:	00000714 	andeq	r0, r0, r4, lsl r7
 72c:	0000a1c4 	andeq	sl, r0, r4, asr #3
 730:	000000f4 	strdeq	r0, [r0], -r4
 734:	0000000c 	andeq	r0, r0, ip
 738:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 73c:	7c010001 	stcvc	0, cr0, [r1], {1}
 740:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 744:	0000000c 	andeq	r0, r0, ip
 748:	00000734 	andeq	r0, r0, r4, lsr r7
 74c:	0000a2d8 	ldrdeq	sl, [r0], -r8
 750:	00000128 	andeq	r0, r0, r8, lsr #2
 754:	0000000c 	andeq	r0, r0, ip
 758:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 75c:	7c010001 	stcvc	0, cr0, [r1], {1}
 760:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 764:	00000014 	andeq	r0, r0, r4, lsl r0
 768:	00000754 	andeq	r0, r0, r4, asr r7
 76c:	0000aadc 	ldrdeq	sl, [r0], -ip
 770:	0000003c 	andeq	r0, r0, ip, lsr r0
 774:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 778:	00000010 	andeq	r0, r0, r0, lsl r0
 77c:	0000000c 	andeq	r0, r0, ip
 780:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 784:	7c020001 	stcvc	0, cr0, [r2], {1}
 788:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 78c:	0000002c 	andeq	r0, r0, ip, lsr #32
 790:	0000077c 	andeq	r0, r0, ip, ror r7
 794:	0000ab18 	andeq	sl, r0, r8, lsl fp
 798:	00000044 	andeq	r0, r0, r4, asr #32
 79c:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 7a0:	86078508 	strhi	r8, [r7], -r8, lsl #10
 7a4:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 7a8:	8a038904 	bhi	e2bc0 <__bss_end+0xb3bc0>
 7ac:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 7b0:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 7b4:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 7b8:	0000000e 	andeq	r0, r0, lr
 7bc:	00000024 	andeq	r0, r0, r4, lsr #32
 7c0:	0000077c 	andeq	r0, r0, ip, ror r7
 7c4:	0000ab5c 	andeq	sl, r0, ip, asr fp
 7c8:	00000040 	andeq	r0, r0, r0, asr #32
 7cc:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 7d0:	86058506 	strhi	r8, [r5], -r6, lsl #10
 7d4:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 7d8:	5c018e02 	stcpl	14, cr8, [r1], {2}
 7dc:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 7e0:	000ec4c5 	andeq	ip, lr, r5, asr #9
 7e4:	0000000c 	andeq	r0, r0, ip
 7e8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 7ec:	7c020001 	stcvc	0, cr0, [r2], {1}
 7f0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 7f4:	00000034 	andeq	r0, r0, r4, lsr r0
 7f8:	000007e4 	andeq	r0, r0, r4, ror #15
 7fc:	0000ab9c 	muleq	r0, ip, fp
 800:	00000178 	andeq	r0, r0, r8, ror r1
 804:	83280e44 	teqhi	r8, #68, 28	; 0x440
 808:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 80c:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 810:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 814:	8b038a04 	blhi	e302c <__bss_end+0xb402c>
 818:	02018e02 	andeq	r8, r1, #2, 28
 81c:	cbce0aa6 	blgt	ff3832bc <__user_program+0xff0832bc>
 820:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 824:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 828:	0b42000e 	bleq	1080868 <__user_program+0xd80868>
 82c:	0000000c 	andeq	r0, r0, ip
 830:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 834:	7c020001 	stcvc	0, cr0, [r2], {1}
 838:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 83c:	0000002c 	andeq	r0, r0, ip, lsr #32
 840:	0000082c 	andeq	r0, r0, ip, lsr #16
 844:	0000ad14 	andeq	sl, r0, r4, lsl sp
 848:	00000120 	andeq	r0, r0, r0, lsr #2
 84c:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 850:	86078508 	strhi	r8, [r7], -r8, lsl #10
 854:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 858:	8a038904 	bhi	e2c70 <__bss_end+0xb3c70>
 85c:	02018e02 	andeq	r8, r1, #2, 28
 860:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 864:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 868:	00000ec4 	andeq	r0, r0, r4, asr #29

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
       0:	0000004c 	andeq	r0, r0, ip, asr #32
       4:	000000b8 	strheq	r0, [r0], -r8
       8:	b8500001 	ldmdalt	r0, {r0}^
       c:	cc000000 	stcgt	0, cr0, [r0], {-0}
      10:	04000000 	streq	r0, [r0], #-0
      14:	5001f300 	andpl	pc, r1, r0, lsl #6
      18:	0000cc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
      1c:	0000d000 	andeq	sp, r0, r0
      20:	50000100 	andpl	r0, r0, r0, lsl #2
      24:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
      28:	000000d8 	ldrdeq	r0, [r0], -r8
      2c:	01f30004 	mvnseq	r0, r4
      30:	00d89f50 	sbcseq	r9, r8, r0, asr pc
      34:	00dc0000 	sbcseq	r0, ip, r0
      38:	00010000 	andeq	r0, r1, r0
      3c:	0000dc50 	andeq	sp, r0, r0, asr ip
      40:	0000e400 	andeq	lr, r0, r0, lsl #8
      44:	f3000400 	vshl.u8	d0, d0, d0
      48:	e49f5001 	ldr	r5, [pc], #1	; 50 <__start-0x7fb0>
      4c:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
      50:	01000000 	mrseq	r0, (UNDEF: 0)
      54:	00e85000 	rsceq	r5, r8, r0
      58:	00f80000 	rscseq	r0, r8, r0
      5c:	00040000 	andeq	r0, r4, r0
      60:	9f5001f3 	svcls	0x005001f3
      64:	000000f8 	strdeq	r0, [r0], -r8
      68:	000000fc 	strdeq	r0, [r0], -ip
      6c:	fc500001 	mrrc2	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
      70:	10000000 	andne	r0, r0, r0
      74:	04000001 	streq	r0, [r0], #-1
      78:	5001f300 	andpl	pc, r1, r0, lsl #6
      7c:	0001109f 	muleq	r1, pc, r0	; <UNPREDICTABLE>
      80:	00011400 	andeq	r1, r1, r0, lsl #8
      84:	50000100 	andpl	r0, r0, r0, lsl #2
      88:	00000114 	andeq	r0, r0, r4, lsl r1
      8c:	00000128 	andeq	r0, r0, r8, lsr #2
      90:	01f30004 	mvnseq	r0, r4
      94:	01289f50 	teqeq	r8, r0, asr pc
      98:	012b0000 	teqeq	fp, r0
      9c:	00010000 	andeq	r0, r1, r0
      a0:	00012b50 	andeq	r2, r1, r0, asr fp
      a4:	00013400 	andeq	r3, r1, r0, lsl #8
      a8:	f3000400 	vshl.u8	d0, d0, d0
      ac:	349f5001 	ldrcc	r5, [pc], #1	; b4 <__start-0x7f4c>
      b0:	38000001 	stmdacc	r0, {r0}
      b4:	01000001 	tsteq	r0, r1
      b8:	01385000 	teqeq	r8, r0
      bc:	01480000 	mrseq	r0, (UNDEF: 72)
      c0:	00040000 	andeq	r0, r4, r0
      c4:	9f5001f3 	svcls	0x005001f3
      c8:	00000148 	andeq	r0, r0, r8, asr #2
      cc:	0000014c 	andeq	r0, r0, ip, asr #2
      d0:	4c500001 	mrrcmi	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
      d4:	6c000001 	stcvs	0, cr0, [r0], {1}
      d8:	04000001 	streq	r0, [r0], #-1
      dc:	5001f300 	andpl	pc, r1, r0, lsl #6
      e0:	00016c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
      e4:	00016f00 	andeq	r6, r1, r0, lsl #30
      e8:	50000100 	andpl	r0, r0, r0, lsl #2
      ec:	0000016f 	andeq	r0, r0, pc, ror #2
      f0:	00000178 	andeq	r0, r0, r8, ror r1
      f4:	01f30004 	mvnseq	r0, r4
      f8:	01789f50 	cmneq	r8, r0, asr pc
      fc:	017b0000 	cmneq	fp, r0
     100:	00010000 	andeq	r0, r1, r0
     104:	00017b50 	andeq	r7, r1, r0, asr fp
     108:	00018400 	andeq	r8, r1, r0, lsl #8
     10c:	f3000400 	vshl.u8	d0, d0, d0
     110:	849f5001 	ldrhi	r5, [pc], #1	; 118 <__start-0x7ee8>
     114:	8f000001 	svchi	0x00000001
     118:	01000001 	tsteq	r0, r1
     11c:	018f5000 	orreq	r5, pc, r0
     120:	01ac0000 			; <UNDEFINED> instruction: 0x01ac0000
     124:	00040000 	andeq	r0, r4, r0
     128:	9f5001f3 	svcls	0x005001f3
     12c:	000001ac 	andeq	r0, r0, ip, lsr #3
     130:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
     134:	b0500001 	subslt	r0, r0, r1
     138:	c0000001 	andgt	r0, r0, r1
     13c:	04000001 	streq	r0, [r0], #-1
     140:	5001f300 	andpl	pc, r1, r0, lsl #6
     144:	0001c09f 	muleq	r1, pc, r0	; <UNPREDICTABLE>
     148:	0001c400 	andeq	ip, r1, r0, lsl #8
     14c:	50000100 	andpl	r0, r0, r0, lsl #2
     150:	000001c4 	andeq	r0, r0, r4, asr #3
     154:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     158:	01f30004 	mvnseq	r0, r4
     15c:	01d09f50 	bicseq	r9, r0, r0, asr pc
     160:	01db0000 	bicseq	r0, fp, r0
     164:	00010000 	andeq	r0, r1, r0
     168:	0001db50 	andeq	sp, r1, r0, asr fp
     16c:	0001fc00 	andeq	pc, r1, r0, lsl #24
     170:	f3000400 	vshl.u8	d0, d0, d0
     174:	009f5001 	addseq	r5, pc, r1
     178:	00000000 	andeq	r0, r0, r0
     17c:	4c000000 	stcmi	0, cr0, [r0], {-0}
     180:	bc000000 	stclt	0, cr0, [r0], {-0}
     184:	01000000 	mrseq	r0, (UNDEF: 0)
     188:	00bc5100 	adcseq	r5, ip, r0, lsl #2
     18c:	00cc0000 	sbceq	r0, ip, r0
     190:	00010000 	andeq	r0, r1, r0
     194:	0000cc54 	andeq	ip, r0, r4, asr ip
     198:	0000d300 	andeq	sp, r0, r0, lsl #6
     19c:	51000100 	mrspl	r0, (UNDEF: 16)
     1a0:	000000d3 	ldrdeq	r0, [r0], -r3
     1a4:	000000d8 	ldrdeq	r0, [r0], -r8
     1a8:	d8540001 	ldmdale	r4, {r0}^
     1ac:	df000000 	svcle	0x00000000
     1b0:	01000000 	mrseq	r0, (UNDEF: 0)
     1b4:	00df5100 	sbcseq	r5, pc, r0, lsl #2
     1b8:	00e40000 	rsceq	r0, r4, r0
     1bc:	00010000 	andeq	r0, r1, r0
     1c0:	0000e454 	andeq	lr, r0, r4, asr r4
     1c4:	0000ec00 	andeq	lr, r0, r0, lsl #24
     1c8:	51000100 	mrspl	r0, (UNDEF: 16)
     1cc:	000000ec 	andeq	r0, r0, ip, ror #1
     1d0:	000000f8 	strdeq	r0, [r0], -r8
     1d4:	f8540001 			; <UNDEFINED> instruction: 0xf8540001
     1d8:	00000000 	andeq	r0, r0, r0
     1dc:	01000001 	tsteq	r0, r1
     1e0:	01005100 	mrseq	r5, (UNDEF: 16)
     1e4:	01100000 	tsteq	r0, r0
     1e8:	00010000 	andeq	r0, r1, r0
     1ec:	00011054 	andeq	r1, r1, r4, asr r0
     1f0:	00011800 	andeq	r1, r1, r0, lsl #16
     1f4:	51000100 	mrspl	r0, (UNDEF: 16)
     1f8:	00000118 	andeq	r0, r0, r8, lsl r1
     1fc:	00000128 	andeq	r0, r0, r8, lsr #2
     200:	28540001 	ldmdacs	r4, {r0}^
     204:	2b000001 	blcs	210 <__start-0x7df0>
     208:	01000001 	tsteq	r0, r1
     20c:	012b5100 	teqeq	fp, r0, lsl #2
     210:	01340000 	teqeq	r4, r0
     214:	00010000 	andeq	r0, r1, r0
     218:	00013454 	andeq	r3, r1, r4, asr r4
     21c:	00013c00 	andeq	r3, r1, r0, lsl #24
     220:	51000100 	mrspl	r0, (UNDEF: 16)
     224:	0000013c 	andeq	r0, r0, ip, lsr r1
     228:	00000148 	andeq	r0, r0, r8, asr #2
     22c:	48540001 	ldmdami	r4, {r0}^
     230:	50000001 	andpl	r0, r0, r1
     234:	01000001 	tsteq	r0, r1
     238:	01505100 	cmpeq	r0, r0, lsl #2
     23c:	016c0000 	cmneq	ip, r0
     240:	00010000 	andeq	r0, r1, r0
     244:	00016c54 	andeq	r6, r1, r4, asr ip
     248:	00016f00 	andeq	r6, r1, r0, lsl #30
     24c:	51000100 	mrspl	r0, (UNDEF: 16)
     250:	0000016f 	andeq	r0, r0, pc, ror #2
     254:	00000178 	andeq	r0, r0, r8, ror r1
     258:	78540001 	ldmdavc	r4, {r0}^
     25c:	7b000001 	blvc	268 <__start-0x7d98>
     260:	01000001 	tsteq	r0, r1
     264:	017b5100 	cmneq	fp, r0, lsl #2
     268:	01840000 	orreq	r0, r4, r0
     26c:	00010000 	andeq	r0, r1, r0
     270:	00018454 	andeq	r8, r1, r4, asr r4
     274:	00018f00 	andeq	r8, r1, r0, lsl #30
     278:	51000100 	mrspl	r0, (UNDEF: 16)
     27c:	0000018f 	andeq	r0, r0, pc, lsl #3
     280:	000001ac 	andeq	r0, r0, ip, lsr #3
     284:	ac540001 	mrrcge	0, 0, r0, r4, cr1
     288:	b4000001 	strlt	r0, [r0], #-1
     28c:	01000001 	tsteq	r0, r1
     290:	01b45100 			; <UNDEFINED> instruction: 0x01b45100
     294:	01c00000 	biceq	r0, r0, r0
     298:	00010000 	andeq	r0, r1, r0
     29c:	0001c054 	andeq	ip, r1, r4, asr r0
     2a0:	0001c700 	andeq	ip, r1, r0, lsl #14
     2a4:	51000100 	mrspl	r0, (UNDEF: 16)
     2a8:	000001c7 	andeq	r0, r0, r7, asr #3
     2ac:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     2b0:	d0540001 	subsle	r0, r4, r1
     2b4:	db000001 	blle	2c0 <__start-0x7d40>
     2b8:	01000001 	tsteq	r0, r1
     2bc:	01db5100 	bicseq	r5, fp, r0, lsl #2
     2c0:	01fc0000 	mvnseq	r0, r0
     2c4:	00010000 	andeq	r0, r1, r0
     2c8:	00000054 	andeq	r0, r0, r4, asr r0
     2cc:	00000000 	andeq	r0, r0, r0
     2d0:	00004c00 	andeq	r4, r0, r0, lsl #24
     2d4:	0000c000 	andeq	ip, r0, r0
     2d8:	52000100 	andpl	r0, r0, #0, 2
     2dc:	000000c0 	andeq	r0, r0, r0, asr #1
     2e0:	000000cc 	andeq	r0, r0, ip, asr #1
     2e4:	01f30004 	mvnseq	r0, r4
     2e8:	00cc9f52 	sbceq	r9, ip, r2, asr pc
     2ec:	00d30000 	sbcseq	r0, r3, r0
     2f0:	00010000 	andeq	r0, r1, r0
     2f4:	0000d352 	andeq	sp, r0, r2, asr r3
     2f8:	0000d800 	andeq	sp, r0, r0, lsl #16
     2fc:	f3000400 	vshl.u8	d0, d0, d0
     300:	d89f5201 	ldmle	pc, {r0, r9, ip, lr}	; <UNPREDICTABLE>
     304:	df000000 	svcle	0x00000000
     308:	01000000 	mrseq	r0, (UNDEF: 0)
     30c:	00df5200 	sbcseq	r5, pc, r0, lsl #4
     310:	00e40000 	rsceq	r0, r4, r0
     314:	00040000 	andeq	r0, r4, r0
     318:	9f5201f3 	svcls	0x005201f3
     31c:	000000e4 	andeq	r0, r0, r4, ror #1
     320:	000000ef 	andeq	r0, r0, pc, ror #1
     324:	ef520001 	svc	0x00520001
     328:	f8000000 			; <UNDEFINED> instruction: 0xf8000000
     32c:	04000000 	streq	r0, [r0], #-0
     330:	5201f300 	andpl	pc, r1, #0, 6
     334:	0000f89f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
     338:	00010400 	andeq	r0, r1, r0, lsl #8
     33c:	52000100 	andpl	r0, r0, #0, 2
     340:	00000104 	andeq	r0, r0, r4, lsl #2
     344:	00000110 	andeq	r0, r0, r0, lsl r1
     348:	01f30004 	mvnseq	r0, r4
     34c:	01109f52 	tsteq	r0, r2, asr pc
     350:	011c0000 	tsteq	ip, r0
     354:	00010000 	andeq	r0, r1, r0
     358:	00011c52 	andeq	r1, r1, r2, asr ip
     35c:	00012800 	andeq	r2, r1, r0, lsl #16
     360:	f3000400 	vshl.u8	d0, d0, d0
     364:	289f5201 	ldmcs	pc, {r0, r9, ip, lr}	; <UNPREDICTABLE>
     368:	2b000001 	blcs	374 <__start-0x7c8c>
     36c:	01000001 	tsteq	r0, r1
     370:	012b5200 	teqeq	fp, r0, lsl #4
     374:	01340000 	teqeq	r4, r0
     378:	00040000 	andeq	r0, r4, r0
     37c:	9f5201f3 	svcls	0x005201f3
     380:	00000134 	andeq	r0, r0, r4, lsr r1
     384:	0000013f 	andeq	r0, r0, pc, lsr r1
     388:	3f520001 	svccc	0x00520001
     38c:	48000001 	stmdami	r0, {r0}
     390:	04000001 	streq	r0, [r0], #-1
     394:	5201f300 	andpl	pc, r1, #0, 6
     398:	0001489f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     39c:	00016000 	andeq	r6, r1, r0
     3a0:	52000100 	andpl	r0, r0, #0, 2
     3a4:	00000160 	andeq	r0, r0, r0, ror #2
     3a8:	00000163 	andeq	r0, r0, r3, ror #2
     3ac:	007d0002 	rsbseq	r0, sp, r2
     3b0:	00000163 	andeq	r0, r0, r3, ror #2
     3b4:	0000016c 	andeq	r0, r0, ip, ror #2
     3b8:	01f30004 	mvnseq	r0, r4
     3bc:	016c9f52 	cmneq	ip, r2, asr pc
     3c0:	016f0000 	cmneq	pc, r0
     3c4:	00010000 	andeq	r0, r1, r0
     3c8:	00016f52 	andeq	r6, r1, r2, asr pc
     3cc:	00017800 	andeq	r7, r1, r0, lsl #16
     3d0:	f3000400 	vshl.u8	d0, d0, d0
     3d4:	789f5201 	ldmvc	pc, {r0, r9, ip, lr}	; <UNPREDICTABLE>
     3d8:	7b000001 	blvc	3e4 <__start-0x7c1c>
     3dc:	01000001 	tsteq	r0, r1
     3e0:	017b5200 	cmneq	fp, r0, lsl #4
     3e4:	01840000 	orreq	r0, r4, r0
     3e8:	00040000 	andeq	r0, r4, r0
     3ec:	9f5201f3 	svcls	0x005201f3
     3f0:	00000184 	andeq	r0, r0, r4, lsl #3
     3f4:	0000018f 	andeq	r0, r0, pc, lsl #3
     3f8:	8f520001 	svchi	0x00520001
     3fc:	ac000001 	stcge	0, cr0, [r0], {1}
     400:	04000001 	streq	r0, [r0], #-1
     404:	5201f300 	andpl	pc, r1, #0, 6
     408:	0001ac9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
     40c:	0001b700 	andeq	fp, r1, r0, lsl #14
     410:	52000100 	andpl	r0, r0, #0, 2
     414:	000001b7 			; <UNDEFINED> instruction: 0x000001b7
     418:	000001c0 	andeq	r0, r0, r0, asr #3
     41c:	01f30004 	mvnseq	r0, r4
     420:	01c09f52 	biceq	r9, r0, r2, asr pc
     424:	01c70000 	biceq	r0, r7, r0
     428:	00010000 	andeq	r0, r1, r0
     42c:	0001c752 	andeq	ip, r1, r2, asr r7
     430:	0001d000 	andeq	sp, r1, r0
     434:	f3000400 	vshl.u8	d0, d0, d0
     438:	d09f5201 	addsle	r5, pc, r1, lsl #4
     43c:	db000001 	blle	448 <__start-0x7bb8>
     440:	01000001 	tsteq	r0, r1
     444:	01db5200 	bicseq	r5, fp, r0, lsl #4
     448:	01fc0000 	mvnseq	r0, r0
     44c:	00040000 	andeq	r0, r4, r0
     450:	9f5201f3 	svcls	0x005201f3
	...
     45c:	000000b4 	strheq	r0, [r0], -r4
     460:	000000bc 	strheq	r0, [r0], -ip
     464:	00710002 	rsbseq	r0, r1, r2
     468:	000000bc 	strheq	r0, [r0], -ip
     46c:	000000c3 	andeq	r0, r0, r3, asr #1
     470:	f8500001 			; <UNDEFINED> instruction: 0xf8500001
     474:	00000000 	andeq	r0, r0, r0
     478:	02000001 	andeq	r0, r0, #1
     47c:	00007100 	andeq	r7, r0, r0, lsl #2
     480:	07000001 	streq	r0, [r0, -r1]
     484:	01000001 	tsteq	r0, r1
     488:	00005000 	andeq	r5, r0, r0
     48c:	00000000 	andeq	r0, r0, r0
     490:	00b40000 	adcseq	r0, r4, r0
     494:	00bc0000 	adcseq	r0, ip, r0
     498:	00020000 	andeq	r0, r2, r0
     49c:	00bc0871 	adcseq	r0, ip, r1, ror r8
     4a0:	00c30000 	sbceq	r0, r3, r0
     4a4:	00020000 	andeq	r0, r2, r0
     4a8:	00f80874 	rscseq	r0, r8, r4, ror r8
     4ac:	01000000 	mrseq	r0, (UNDEF: 0)
     4b0:	00020000 	andeq	r0, r2, r0
     4b4:	01000871 	tsteq	r0, r1, ror r8
     4b8:	01070000 	mrseq	r0, (UNDEF: 7)
     4bc:	00020000 	andeq	r0, r2, r0
     4c0:	00000874 	andeq	r0, r0, r4, ror r8
     4c4:	00000000 	andeq	r0, r0, r0
     4c8:	00b40000 	adcseq	r0, r4, r0
     4cc:	00bc0000 	adcseq	r0, ip, r0
     4d0:	00020000 	andeq	r0, r2, r0
     4d4:	00bc0471 	adcseq	r0, ip, r1, ror r4
     4d8:	00c30000 	sbceq	r0, r3, r0
     4dc:	00010000 	andeq	r0, r1, r0
     4e0:	0000f851 	andeq	pc, r0, r1, asr r8	; <UNPREDICTABLE>
     4e4:	00010000 	andeq	r0, r1, r0
     4e8:	71000200 	mrsvc	r0, R8_usr
     4ec:	00010004 	andeq	r0, r1, r4
     4f0:	00010700 	andeq	r0, r1, r0, lsl #14
     4f4:	51000100 	mrspl	r0, (UNDEF: 16)
	...
     504:	00000048 	andeq	r0, r0, r8, asr #32
     508:	48500001 	ldmdami	r0, {r0}^
     50c:	e0000000 	and	r0, r0, r0
     510:	04000000 	streq	r0, [r0], #-0
     514:	5001f300 	andpl	pc, r1, r0, lsl #6
     518:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
     524:	00004800 	andeq	r4, r0, r0, lsl #16
     528:	52000600 	andpl	r0, r0, #0, 12
     52c:	93530493 	cmpls	r3, #-1828716544	; 0x93000000
     530:	00004804 	andeq	r4, r0, r4, lsl #16
     534:	00007c00 	andeq	r7, r0, r0, lsl #24
     538:	56000600 	strpl	r0, [r0], -r0, lsl #12
     53c:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
     540:	00008004 	andeq	r8, r0, r4
     544:	0000e000 	andeq	lr, r0, r0
     548:	56000600 	strpl	r0, [r0], -r0, lsl #12
     54c:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
     550:	00000004 	andeq	r0, r0, r4
     554:	00000000 	andeq	r0, r0, r0
     558:	00001000 	andeq	r1, r0, r0
     55c:	00004800 	andeq	r4, r0, r0, lsl #16
     560:	30000200 	andcc	r0, r0, r0, lsl #4
     564:	0000909f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     568:	00009c00 	andeq	r9, r0, r0, lsl #24
     56c:	58000100 	stmdapl	r0, {r8}
     570:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
     574:	000000b8 	strheq	r0, [r0], -r8
     578:	b8580001 	ldmdalt	r8, {r0}^
     57c:	c4000000 	strgt	r0, [r0], #-0
     580:	03000000 	movweq	r0, #0
     584:	9f7f7800 	svcls	0x007f7800
	...
     590:	00000010 	andeq	r0, r0, r0, lsl r0
     594:	00000038 	andeq	r0, r0, r8, lsr r0
     598:	57910003 	ldrpl	r0, [r1, r3]
     59c:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
     5a0:	00006400 	andeq	r6, r0, r0, lsl #8
     5a4:	54000100 	strpl	r0, [r0], #-256	; 0x100
     5a8:	00000064 	andeq	r0, r0, r4, rrx
     5ac:	0000009c 	muleq	r0, ip, r0
     5b0:	01740003 	cmneq	r4, r3
     5b4:	00009c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
     5b8:	0000b000 	andeq	fp, r0, r0
     5bc:	54000100 	strpl	r0, [r0], #-256	; 0x100
     5c0:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
     5c4:	000000c4 	andeq	r0, r0, r4, asr #1
     5c8:	01740003 	cmneq	r4, r3
     5cc:	0000c49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     5d0:	0000c800 	andeq	ip, r0, r0, lsl #16
     5d4:	54000100 	strpl	r0, [r0], #-256	; 0x100
     5d8:	000000c8 	andeq	r0, r0, r8, asr #1
     5dc:	000000cc 	andeq	r0, r0, ip, asr #1
     5e0:	7f740003 	svcvc	0x00740003
     5e4:	0000cc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
     5e8:	0000e000 	andeq	lr, r0, r0
     5ec:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
     5f8:	000000e0 	andeq	r0, r0, r0, ror #1
     5fc:	00000108 	andeq	r0, r0, r8, lsl #2
     600:	70910002 	addsvc	r0, r1, r2
     604:	00000108 	andeq	r0, r0, r8, lsl #2
     608:	0000011c 	andeq	r0, r0, ip, lsl r1
     60c:	1c540001 	mrrcne	0, 0, r0, r4, cr1
     610:	7c000001 	stcvc	0, cr0, [r0], {1}
     614:	03000002 	movweq	r0, #2
     618:	9f017400 	svcls	0x00017400
     61c:	0000027c 	andeq	r0, r0, ip, ror r2
     620:	00000288 	andeq	r0, r0, r8, lsl #5
     624:	00540001 	subseq	r0, r4, r1
     628:	00000000 	andeq	r0, r0, r0
     62c:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
     630:	f4000001 	vst4.8	{d0-d3}, [r0], r1
     634:	02000001 	andeq	r0, r0, #1
     638:	f4007300 	vst2.8	{d7-d10}, [r0], r0
     63c:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
     640:	01000001 	tsteq	r0, r1
     644:	00005200 	andeq	r5, r0, r0, lsl #4
     648:	00000000 	andeq	r0, r0, r0
     64c:	02080000 	andeq	r0, r8, #0
     650:	02140000 	andseq	r0, r4, #0
     654:	00020000 	andeq	r0, r2, r0
     658:	02140073 	andseq	r0, r4, #115	; 0x73
     65c:	02170000 	andseq	r0, r7, #0
     660:	00010000 	andeq	r0, r1, r0
     664:	00000052 	andeq	r0, r0, r2, asr r0
     668:	00000000 	andeq	r0, r0, r0
     66c:	00018400 	andeq	r8, r1, r0, lsl #8
     670:	0001bc00 	andeq	fp, r1, r0, lsl #24
     674:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
     680:	000001c8 	andeq	r0, r0, r8, asr #3
     684:	000001d4 	ldrdeq	r0, [r0], -r4
     688:	00730002 	rsbseq	r0, r3, r2
     68c:	000001d4 	ldrdeq	r0, [r0], -r4
     690:	000001d7 	ldrdeq	r0, [r0], -r7
     694:	00520001 	subseq	r0, r2, r1
     698:	00000000 	andeq	r0, r0, r0
     69c:	2c000000 	stccs	0, cr0, [r0], {-0}
     6a0:	40000002 	andmi	r0, r0, r2
     6a4:	01000002 	tsteq	r0, r2
     6a8:	02405500 	subeq	r5, r0, #0, 10
     6ac:	024c0000 	subeq	r0, ip, #0
     6b0:	00030000 	andeq	r0, r3, r0
     6b4:	009f7f75 	addseq	r7, pc, r5, ror pc	; <UNPREDICTABLE>
     6b8:	00000000 	andeq	r0, r0, r0
     6bc:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
     6c0:	5f000002 	svcpl	0x00000002
     6c4:	02000002 	andeq	r0, r0, #2
     6c8:	00007300 	andeq	r7, r0, r0, lsl #6
	...
     6d4:	0c000000 	stceq	0, cr0, [r0], {-0}
     6d8:	01000000 	mrseq	r0, (UNDEF: 0)
     6dc:	000c5000 	andeq	r5, ip, r0
     6e0:	00130000 	andseq	r0, r3, r0
     6e4:	00010000 	andeq	r0, r1, r0
     6e8:	00001351 	andeq	r1, r0, r1, asr r3
     6ec:	00004000 	andeq	r4, r0, r0
     6f0:	f3000400 	vshl.u8	d0, d0, d0
     6f4:	009f5001 	addseq	r5, pc, r1
     6f8:	00000000 	andeq	r0, r0, r0
     6fc:	80000000 	andhi	r0, r0, r0
     700:	84000000 	strhi	r0, [r0], #-0
     704:	05000000 	streq	r0, [r0, #-0]
     708:	31007000 	mrscc	r7, (UNDEF: 0)
     70c:	00849f1a 	addeq	r9, r4, sl, lsl pc
     710:	00880000 	addeq	r0, r8, r0
     714:	00010000 	andeq	r0, r1, r0
     718:	00000050 	andeq	r0, r0, r0, asr r0
	...
     724:	00000400 	andeq	r0, r0, r0, lsl #8
     728:	50000100 	andpl	r0, r0, r0, lsl #2
     72c:	00000004 	andeq	r0, r0, r4
     730:	00000020 	andeq	r0, r0, r0, lsr #32
     734:	00530001 	subseq	r0, r3, r1
     738:	00000000 	andeq	r0, r0, r0
     73c:	20000000 	andcs	r0, r0, r0
     740:	30000000 	andcc	r0, r0, r0
     744:	01000000 	mrseq	r0, (UNDEF: 0)
     748:	00305000 	eorseq	r5, r0, r0
     74c:	004c0000 	subeq	r0, ip, r0
     750:	00010000 	andeq	r0, r1, r0
     754:	00004c50 	andeq	r4, r0, r0, asr ip
     758:	00005c00 	andeq	r5, r0, r0, lsl #24
     75c:	4f000600 	svcmi	0x00000600
     760:	1c5001f3 	ldfnee	f0, [r0], {243}	; 0xf3
     764:	00005c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
     768:	00006000 	andeq	r6, r0, r0
     76c:	50000100 	andpl	r0, r0, r0, lsl #2
     770:	00000060 	andeq	r0, r0, r0, rrx
     774:	00000064 	andeq	r0, r0, r4, rrx
     778:	01f30004 	mvnseq	r0, r4
     77c:	00009f50 	andeq	r9, r0, r0, asr pc
     780:	00000000 	andeq	r0, r0, r0
     784:	00200000 	eoreq	r0, r0, r0
     788:	002c0000 	eoreq	r0, ip, r0
     78c:	00010000 	andeq	r0, r1, r0
     790:	00002c51 	andeq	r2, r0, r1, asr ip
     794:	00003400 	andeq	r3, r0, r0, lsl #8
     798:	08000600 	stmdaeq	r0, {r9, sl}
     79c:	1c00717f 	stfnes	f7, [r0], {127}	; 0x7f
     7a0:	0000349f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     7a4:	00003c00 	andeq	r3, r0, r0, lsl #24
     7a8:	51000100 	mrspl	r0, (UNDEF: 16)
     7ac:	0000003c 	andeq	r0, r0, ip, lsr r0
     7b0:	0000005c 	andeq	r0, r0, ip, asr r0
     7b4:	7f080007 	svcvc	0x00080007
     7b8:	1c5101f3 	ldfnee	f0, [r1], {243}	; 0xf3
     7bc:	00005c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
     7c0:	00006400 	andeq	r6, r0, r0, lsl #8
     7c4:	51000100 	mrspl	r0, (UNDEF: 16)
	...
     7d0:	0000003c 	andeq	r0, r0, ip, lsr r0
     7d4:	00000048 	andeq	r0, r0, r8, asr #32
     7d8:	00700005 	rsbseq	r0, r0, r5
     7dc:	489f1a37 	ldmmi	pc, {r0, r1, r2, r4, r5, r9, fp, ip}	; <UNPREDICTABLE>
     7e0:	54000000 	strpl	r0, [r0], #-0
     7e4:	01000000 	mrseq	r0, (UNDEF: 0)
     7e8:	00545300 	subseq	r5, r4, r0, lsl #6
     7ec:	005c0000 	subseq	r0, ip, r0
     7f0:	00080000 	andeq	r0, r8, r0
     7f4:	5001f34f 	andpl	pc, r1, pc, asr #6
     7f8:	9f1a371c 	svcls	0x001a371c
	...
     804:	0000003c 	andeq	r0, r0, ip, lsr r0
     808:	0000005c 	andeq	r0, r0, ip, asr r0
     80c:	00510001 	subseq	r0, r1, r1
     810:	00000000 	andeq	r0, r0, r0
     814:	64000000 	strvs	r0, [r0], #-0
     818:	74000000 	strvc	r0, [r0], #-0
     81c:	01000000 	mrseq	r0, (UNDEF: 0)
     820:	00745000 	rsbseq	r5, r4, r0
     824:	00900000 	addseq	r0, r0, r0
     828:	00010000 	andeq	r0, r1, r0
     82c:	00009050 	andeq	r9, r0, r0, asr r0
     830:	0000a000 	andeq	sl, r0, r0
     834:	4f000600 	svcmi	0x00000600
     838:	1c5001f3 	ldfnee	f0, [r0], {243}	; 0xf3
     83c:	0000a09f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     840:	0000a400 	andeq	sl, r0, r0, lsl #8
     844:	50000100 	andpl	r0, r0, r0, lsl #2
     848:	000000a4 	andeq	r0, r0, r4, lsr #1
     84c:	000000a8 	andeq	r0, r0, r8, lsr #1
     850:	01f30004 	mvnseq	r0, r4
     854:	00009f50 	andeq	r9, r0, r0, asr pc
     858:	00000000 	andeq	r0, r0, r0
     85c:	00640000 	rsbeq	r0, r4, r0
     860:	00700000 	rsbseq	r0, r0, r0
     864:	00010000 	andeq	r0, r1, r0
     868:	00007051 	andeq	r7, r0, r1, asr r0
     86c:	00007800 	andeq	r7, r0, r0, lsl #16
     870:	08000600 	stmdaeq	r0, {r9, sl}
     874:	1c00717f 	stfnes	f7, [r0], {127}	; 0x7f
     878:	0000789f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
     87c:	00008000 	andeq	r8, r0, r0
     880:	51000100 	mrspl	r0, (UNDEF: 16)
     884:	00000080 	andeq	r0, r0, r0, lsl #1
     888:	000000a0 	andeq	r0, r0, r0, lsr #1
     88c:	7f080007 	svcvc	0x00080007
     890:	1c5101f3 	ldfnee	f0, [r1], {243}	; 0xf3
     894:	0000a09f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     898:	0000a800 	andeq	sl, r0, r0, lsl #16
     89c:	51000100 	mrspl	r0, (UNDEF: 16)
	...
     8a8:	00000080 	andeq	r0, r0, r0, lsl #1
     8ac:	0000008c 	andeq	r0, r0, ip, lsl #1
     8b0:	00700005 	rsbseq	r0, r0, r5
     8b4:	8c9f1a37 	vldmiahi	pc, {s2-s56}
     8b8:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
     8bc:	01000000 	mrseq	r0, (UNDEF: 0)
     8c0:	00985300 	addseq	r5, r8, r0, lsl #6
     8c4:	00a00000 	adceq	r0, r0, r0
     8c8:	00080000 	andeq	r0, r8, r0
     8cc:	5001f34f 	andpl	pc, r1, pc, asr #6
     8d0:	9f1a371c 	svcls	0x001a371c
	...
     8dc:	00000080 	andeq	r0, r0, r0, lsl #1
     8e0:	000000a0 	andeq	r0, r0, r0, lsr #1
     8e4:	00510001 	subseq	r0, r1, r1
     8e8:	00000000 	andeq	r0, r0, r0
     8ec:	a8000000 	stmdage	r0, {}	; <UNPREDICTABLE>
     8f0:	b4000000 	strlt	r0, [r0], #-0
     8f4:	02000000 	andeq	r0, r0, #0
     8f8:	b49f3000 	ldrlt	r3, [pc], #0	; 900 <__start-0x7700>
     8fc:	cc000000 	stcgt	0, cr0, [r0], {-0}
     900:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
     904:	03007300 	movweq	r7, #768	; 0x300
     908:	0000d00f 	andeq	sp, r0, pc
     90c:	00009f1c 	andeq	r9, r0, ip, lsl pc
     910:	00000000 	andeq	r0, r0, r0
     914:	00cc0000 	sbceq	r0, ip, r0
     918:	00d80000 	sbcseq	r0, r8, r0
     91c:	00010000 	andeq	r0, r1, r0
     920:	0000d850 	andeq	sp, r0, r0, asr r8
     924:	00010000 	andeq	r0, r1, r0
     928:	f3000400 	vshl.u8	d0, d0, d0
     92c:	009f5001 	addseq	r5, pc, r1
	...
     938:	0c000001 	stceq	0, cr0, [r0], {1}
     93c:	01000001 	tsteq	r0, r1
     940:	010c5000 	mrseq	r5, (UNDEF: 12)
     944:	01340000 	teqeq	r4, r0
     948:	00040000 	andeq	r0, r4, r0
     94c:	9f5001f3 	svcls	0x005001f3
	...
     958:	000002d8 	ldrdeq	r0, [r0], -r8
     95c:	000002e0 	andeq	r0, r0, r0, ror #5
     960:	9f300002 	svcls	0x00300002
     964:	000002e0 	andeq	r0, r0, r0, ror #5
     968:	000002e4 	andeq	r0, r0, r4, ror #5
     96c:	00740009 	rsbseq	r0, r4, r9
     970:	00d00f03 	sbcseq	r0, r0, r3, lsl #30
     974:	e49f1c00 	ldr	r1, [pc], #3072	; 97c <__start-0x7684>
     978:	e8000002 	stmda	r0, {r1}
     97c:	09000002 	stmdbeq	r0, {r1}
     980:	03007400 	movweq	r7, #1024	; 0x400
     984:	0000d010 	andeq	sp, r0, r0, lsl r0
     988:	02e89f1c 	rsceq	r9, r8, #28, 30	; 0x70
     98c:	03000000 	movweq	r0, #0
     990:	00090000 	andeq	r0, r9, r0
     994:	0f030074 	svceq	0x00030074
     998:	1c0000d0 	stcne	0, cr0, [r0], {208}	; 0xd0
     99c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     9a0:	00000000 	andeq	r0, r0, r0
     9a4:	00031c00 	andeq	r1, r3, r0, lsl #24
     9a8:	00032800 	andeq	r2, r3, r0, lsl #16
     9ac:	30000200 	andcc	r0, r0, r0, lsl #4
     9b0:	0003289f 	muleq	r3, pc, r8	; <UNPREDICTABLE>
     9b4:	00033c00 	andeq	r3, r3, r0, lsl #24
     9b8:	0a000700 	beq	25c0 <__start-0x5a40>
     9bc:	00740200 	rsbseq	r0, r4, r0, lsl #4
     9c0:	033c9f1c 	teqeq	ip, #28, 30	; 0x70
     9c4:	03400000 	movteq	r0, #0
     9c8:	00070000 	andeq	r0, r7, r0
     9cc:	7402010a 	strvc	r0, [r2], #-266	; 0x10a
     9d0:	409f1c00 	addsmi	r1, pc, r0, lsl #24
     9d4:	60000003 	andvs	r0, r0, r3
     9d8:	07000003 	streq	r0, [r0, -r3]
     9dc:	02000a00 	andeq	r0, r0, #0, 20
     9e0:	9f1c0074 	svcls	0x001c0074
	...
     9ec:	0000037c 	andeq	r0, r0, ip, ror r3
     9f0:	00000384 	andeq	r0, r0, r4, lsl #7
     9f4:	9f300002 	svcls	0x00300002
     9f8:	00000384 	andeq	r0, r0, r4, lsl #7
     9fc:	0000038c 	andeq	r0, r0, ip, lsl #7
     a00:	000a0007 	andeq	r0, sl, r7
     a04:	1c007402 	cfstrsne	mvf7, [r0], {2}
     a08:	00038c9f 	muleq	r3, pc, ip	; <UNPREDICTABLE>
     a0c:	00039000 	andeq	r9, r3, r0
     a10:	0a000700 	beq	2618 <__start-0x59e8>
     a14:	00740201 	rsbseq	r0, r4, r1, lsl #4
     a18:	03909f1c 	orrseq	r9, r0, #28, 30	; 0x70
     a1c:	039c0000 	orrseq	r0, ip, #0
     a20:	00070000 	andeq	r0, r7, r0
     a24:	7402000a 	strvc	r0, [r2], #-10
     a28:	009f1c00 	addseq	r1, pc, r0, lsl #24
	...
     a34:	0c000000 	stceq	0, cr0, [r0], {-0}
     a38:	01000000 	mrseq	r0, (UNDEF: 0)
     a3c:	000c5000 	andeq	r5, ip, r0
     a40:	00680000 	rsbeq	r0, r8, r0
     a44:	00040000 	andeq	r0, r4, r0
     a48:	9f5001f3 	svcls	0x005001f3
	...
     a54:	00000068 	andeq	r0, r0, r8, rrx
     a58:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     a5c:	f0500001 			; <UNDEFINED> instruction: 0xf0500001
     a60:	00000000 	andeq	r0, r0, r0
     a64:	03000001 	movweq	r0, #1
     a68:	9f7f7200 	svcls	0x007f7200
     a6c:	00000100 	andeq	r0, r0, r0, lsl #2
     a70:	00000114 	andeq	r0, r0, r4, lsl r1
     a74:	14520001 	ldrbne	r0, [r2], #-1
     a78:	38000001 	stmdacc	r0, {r0}
     a7c:	01000001 	tsteq	r0, r1
     a80:	01405000 	mrseq	r5, (UNDEF: 64)
     a84:	01440000 	mrseq	r0, (UNDEF: 68)
     a88:	00010000 	andeq	r0, r1, r0
     a8c:	00000050 	andeq	r0, r0, r0, asr r0
     a90:	00000000 	andeq	r0, r0, r0
     a94:	00006800 	andeq	r6, r0, r0, lsl #16
     a98:	0000f800 	andeq	pc, r0, r0, lsl #16
     a9c:	51000100 	mrspl	r0, (UNDEF: 16)
     aa0:	000000fc 	strdeq	r0, [r0], -ip
     aa4:	00000148 	andeq	r0, r0, r8, asr #2
     aa8:	00510001 	subseq	r0, r1, r1
     aac:	00000000 	andeq	r0, r0, r0
     ab0:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
     ab4:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
     ab8:	01000000 	mrseq	r0, (UNDEF: 0)
     abc:	00985200 	addseq	r5, r8, r0, lsl #4
     ac0:	01480000 	mrseq	r0, (UNDEF: 72)
     ac4:	00040000 	andeq	r0, r4, r0
     ac8:	9f5201f3 	svcls	0x005201f3
	...
     ad4:	00000148 	andeq	r0, r0, r8, asr #2
     ad8:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
     adc:	b8500001 	ldmdalt	r0, {r0}^
     ae0:	04000001 	streq	r0, [r0], #-1
     ae4:	01000002 	tsteq	r0, r2
     ae8:	02085000 	andeq	r5, r8, #0
     aec:	020c0000 	andeq	r0, ip, #0
     af0:	00010000 	andeq	r0, r1, r0
     af4:	00020c50 	andeq	r0, r2, r0, asr ip
     af8:	00021000 	andeq	r1, r2, r0
     afc:	f3000400 	vshl.u8	d0, d0, d0
     b00:	109f5001 	addsne	r5, pc, r1
     b04:	14000002 	strne	r0, [r0], #-2
     b08:	01000002 	tsteq	r0, r2
     b0c:	00005000 	andeq	r5, r0, r0
     b10:	00000000 	andeq	r0, r0, r0
     b14:	01480000 	mrseq	r0, (UNDEF: 72)
     b18:	016c0000 	cmneq	ip, r0
     b1c:	00010000 	andeq	r0, r1, r0
     b20:	00016c52 	andeq	r6, r1, r2, asr ip
     b24:	00021800 	andeq	r1, r2, r0, lsl #16
     b28:	f3000400 	vshl.u8	d0, d0, d0
     b2c:	009f5201 	addseq	r5, pc, r1, lsl #4
     b30:	00000000 	andeq	r0, r0, r0
     b34:	14000000 	strne	r0, [r0], #-0
     b38:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
     b3c:	01000000 	mrseq	r0, (UNDEF: 0)
     b40:	00585000 	subseq	r5, r8, r0
     b44:	00ac0000 	adceq	r0, ip, r0
     b48:	00040000 	andeq	r0, r4, r0
     b4c:	9f5001f3 	svcls	0x005001f3
	...
     b58:	00000064 	andeq	r0, r0, r4, rrx
     b5c:	00000078 	andeq	r0, r0, r8, ror r0
     b60:	00500001 	subseq	r0, r0, r1
     b64:	00000000 	andeq	r0, r0, r0
     b68:	a0000000 	andge	r0, r0, r0
     b6c:	a4000000 	strge	r0, [r0], #-0
     b70:	05000000 	streq	r0, [r0, #-0]
     b74:	34007000 	strcc	r7, [r0], #-0
     b78:	00a49f25 	adceq	r9, r4, r5, lsr #30
     b7c:	00ac0000 	adceq	r0, ip, r0
     b80:	000f0000 	andeq	r0, pc, r0
     b84:	01946891 			; <UNDEFINED> instruction: 0x01946891
     b88:	381aff08 	ldmdacc	sl, {r3, r8, r9, sl, fp, ip, sp, lr, pc}
     b8c:	21007324 	tstcs	r0, r4, lsr #6
     b90:	009f2534 	addseq	r2, pc, r4, lsr r5	; <UNPREDICTABLE>
     b94:	00000000 	andeq	r0, r0, r0
     b98:	90000000 	andls	r0, r0, r0
     b9c:	30000001 	andcc	r0, r0, r1
     ba0:	01000002 	tsteq	r0, r2
     ba4:	02305000 	eorseq	r5, r0, #0
     ba8:	02700000 	rsbseq	r0, r0, #0
     bac:	00040000 	andeq	r0, r4, r0
     bb0:	9f5001f3 	svcls	0x005001f3
     bb4:	00000270 	andeq	r0, r0, r0, ror r2
     bb8:	00000274 	andeq	r0, r0, r4, ror r2
     bbc:	74500001 	ldrbvc	r0, [r0], #-1
     bc0:	78000002 	stmdavc	r0, {r1}
     bc4:	04000002 	streq	r0, [r0], #-2
     bc8:	5001f300 	andpl	pc, r1, r0, lsl #6
     bcc:	0002789f 	muleq	r2, pc, r8	; <UNPREDICTABLE>
     bd0:	00027c00 	andeq	r7, r2, r0, lsl #24
     bd4:	50000100 	andpl	r0, r0, r0, lsl #2
     bd8:	0000027c 	andeq	r0, r0, ip, ror r2
     bdc:	00000280 	andeq	r0, r0, r0, lsl #5
     be0:	01f30004 	mvnseq	r0, r4
     be4:	00009f50 	andeq	r9, r0, r0, asr pc
     be8:	00000000 	andeq	r0, r0, r0
     bec:	01900000 	orrseq	r0, r0, r0
     bf0:	01fc0000 	mvnseq	r0, r0
     bf4:	00010000 	andeq	r0, r1, r0
     bf8:	0001fc51 	andeq	pc, r1, r1, asr ip	; <UNPREDICTABLE>
     bfc:	00021c00 	andeq	r1, r2, r0, lsl #24
     c00:	71000400 	tstvc	r0, r0, lsl #8
     c04:	1c9f01e0 	ldfnes	f0, [pc], {224}	; 0xe0
     c08:	20000002 	andcs	r0, r0, r2
     c0c:	0a000002 	beq	c1c <__start-0x73e4>
     c10:	73007c00 	movwvc	r7, #3072	; 0xc00
     c14:	23062200 	movwcs	r2, #25088	; 0x6200
     c18:	209f01e0 	addscs	r0, pc, r0, ror #3
     c1c:	24000002 	strcs	r0, [r0], #-2
     c20:	0c000002 	stceq	0, cr0, [r0], {2}
     c24:	34007100 	strcc	r7, [r0], #-256	; 0x100
     c28:	22007c24 	andcs	r7, r0, #36, 24	; 0x2400
     c2c:	01e02306 	mvneq	r2, r6, lsl #6
     c30:	0002249f 	muleq	r2, pc, r4	; <UNPREDICTABLE>
     c34:	00027000 	andeq	r7, r2, r0
     c38:	f3000400 	vshl.u8	d0, d0, d0
     c3c:	709f5101 	addsvc	r5, pc, r1, lsl #2
     c40:	78000002 	stmdavc	r0, {r1}
     c44:	01000002 	tsteq	r0, r2
     c48:	02785100 	rsbseq	r5, r8, #0, 2
     c4c:	02800000 	addeq	r0, r0, #0
     c50:	00040000 	andeq	r0, r4, r0
     c54:	9f01e071 	svcls	0x0001e071
	...
     c60:	00000190 	muleq	r0, r0, r1
     c64:	00000254 	andeq	r0, r0, r4, asr r2
     c68:	54520001 	ldrbpl	r0, [r2], #-1
     c6c:	70000002 	andvc	r0, r0, r2
     c70:	04000002 	streq	r0, [r0], #-2
     c74:	5201f300 	andpl	pc, r1, #0, 6
     c78:	0002709f 	muleq	r2, pc, r0	; <UNPREDICTABLE>
     c7c:	00028000 	andeq	r8, r2, r0
     c80:	52000100 	andpl	r0, r0, #0, 2
	...
     c8c:	00000190 	muleq	r0, r0, r1
     c90:	00000208 	andeq	r0, r0, r8, lsl #4
     c94:	08530001 	ldmdaeq	r3, {r0}^
     c98:	70000002 	andvc	r0, r0, r2
     c9c:	04000002 	streq	r0, [r0], #-2
     ca0:	5301f300 	movwpl	pc, #4864	; 0x1300	; <UNPREDICTABLE>
     ca4:	0002709f 	muleq	r2, pc, r0	; <UNPREDICTABLE>
     ca8:	00027800 	andeq	r7, r2, r0, lsl #16
     cac:	53000100 	movwpl	r0, #256	; 0x100
     cb0:	00000278 	andeq	r0, r0, r8, ror r2
     cb4:	00000280 	andeq	r0, r0, r0, lsl #5
     cb8:	01f30004 	mvnseq	r0, r4
     cbc:	00009f53 	andeq	r9, r0, r3, asr pc
     cc0:	00000000 	andeq	r0, r0, r0
     cc4:	01940000 	orrseq	r0, r4, r0
     cc8:	01ac0000 			; <UNDEFINED> instruction: 0x01ac0000
     ccc:	00020000 	andeq	r0, r2, r0
     cd0:	01ac9f30 			; <UNDEFINED> instruction: 0x01ac9f30
     cd4:	01c80000 	biceq	r0, r8, r0
     cd8:	00010000 	andeq	r0, r1, r0
     cdc:	0000005c 	andeq	r0, r0, ip, asr r0
     ce0:	00000000 	andeq	r0, r0, r0
     ce4:	00028000 	andeq	r8, r2, r0
     ce8:	00028c00 	andeq	r8, r2, r0, lsl #24
     cec:	50000100 	andpl	r0, r0, r0, lsl #2
     cf0:	0000028c 	andeq	r0, r0, ip, lsl #5
     cf4:	00000294 	muleq	r0, r4, r2
     cf8:	01f30004 	mvnseq	r0, r4
     cfc:	00009f50 	andeq	r9, r0, r0, asr pc
     d00:	00000000 	andeq	r0, r0, r0
     d04:	02940000 	addseq	r0, r4, #0
     d08:	02ab0000 	adceq	r0, fp, #0
     d0c:	00010000 	andeq	r0, r1, r0
     d10:	0002ab50 	andeq	sl, r2, r0, asr fp
     d14:	0002e000 	andeq	lr, r2, r0
     d18:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
     d24:	0000032c 	andeq	r0, r0, ip, lsr #6
     d28:	000003bc 			; <UNDEFINED> instruction: 0x000003bc
     d2c:	bc530001 	mrrclt	0, 0, r0, r3, cr1
     d30:	c4000003 	strgt	r0, [r0], #-3
     d34:	05000003 	streq	r0, [r0, #-3]
     d38:	31007300 	mrscc	r7, LR_irq
     d3c:	03c49f25 	biceq	r9, r4, #37, 30	; 0x94
     d40:	03d40000 	bicseq	r0, r4, #0
     d44:	00010000 	andeq	r0, r1, r0
     d48:	00000053 	andeq	r0, r0, r3, asr r0
     d4c:	00000000 	andeq	r0, r0, r0
     d50:	00032c00 	andeq	r2, r3, r0, lsl #24
     d54:	00034800 	andeq	r4, r3, r0, lsl #16
     d58:	4f000200 	svcmi	0x00000200
     d5c:	0003489f 	muleq	r3, pc, r8	; <UNPREDICTABLE>
     d60:	00037000 	andeq	r7, r3, r0
     d64:	50000100 	andpl	r0, r0, r0, lsl #2
     d68:	000003bc 			; <UNDEFINED> instruction: 0x000003bc
     d6c:	000003cc 	andeq	r0, r0, ip, asr #7
     d70:	cc500001 	mrrcgt	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
     d74:	d4000003 	strle	r0, [r0], #-3
     d78:	02000003 	andeq	r0, r0, #3
     d7c:	009f4f00 	addseq	r4, pc, r0, lsl #30
     d80:	00000000 	andeq	r0, r0, r0
     d84:	2c000000 	stccs	0, cr0, [r0], {-0}
     d88:	48000003 	stmdami	r0, {r0, r1}
     d8c:	02000003 	andeq	r0, r0, #3
     d90:	489f3000 	ldmmi	pc, {ip, sp}	; <UNPREDICTABLE>
     d94:	cc000003 	stcgt	0, cr0, [r0], {3}
     d98:	01000003 	tsteq	r0, r3
     d9c:	03cc5200 	biceq	r5, ip, #0, 4
     da0:	03d40000 	bicseq	r0, r4, #0
     da4:	00020000 	andeq	r0, r2, r0
     da8:	00009f30 	andeq	r9, r0, r0, lsr pc
     dac:	00000000 	andeq	r0, r0, r0
     db0:	03f40000 	mvnseq	r0, #0
     db4:	04040000 	streq	r0, [r4], #-0
     db8:	00010000 	andeq	r0, r1, r0
     dbc:	00040450 	andeq	r0, r4, r0, asr r4
     dc0:	00041000 	andeq	r1, r4, r0
     dc4:	03000500 	movweq	r0, #1280	; 0x500
     dc8:	0000c008 	andeq	ip, r0, r8
	...
     dd4:	00000458 	andeq	r0, r0, r8, asr r4
     dd8:	00000690 	muleq	r0, r0, r6
     ddc:	90540001 	subsls	r0, r4, r1
     de0:	c0000006 	andgt	r0, r0, r6
     de4:	02000006 	andeq	r0, r0, #6
     de8:	009f3000 	addseq	r3, pc, r0
     dec:	00000000 	andeq	r0, r0, r0
     df0:	c8000000 	stmdagt	r0, {}	; <UNPREDICTABLE>
     df4:	fc000004 	stc2	0, cr0, [r0], {4}
     df8:	01000004 	tsteq	r0, r4
     dfc:	06705000 	ldrbteq	r5, [r0], -r0
     e00:	06740000 	ldrbteq	r0, [r4], -r0
     e04:	00010000 	andeq	r0, r1, r0
     e08:	00000050 	andeq	r0, r0, r0, asr r0
     e0c:	00000000 	andeq	r0, r0, r0
     e10:	00072c00 	andeq	r2, r7, r0, lsl #24
     e14:	00073400 	andeq	r3, r7, r0, lsl #8
     e18:	50000100 	andpl	r0, r0, r0, lsl #2
     e1c:	00000734 	andeq	r0, r0, r4, lsr r7
     e20:	00000748 	andeq	r0, r0, r8, asr #14
     e24:	04700003 	ldrbteq	r0, [r0], #-3
     e28:	0007489f 	muleq	r7, pc, r8	; <UNPREDICTABLE>
     e2c:	00077400 	andeq	r7, r7, r0, lsl #8
     e30:	f3000400 	vshl.u8	d0, d0, d0
     e34:	009f5001 	addseq	r5, pc, r1
     e38:	00000000 	andeq	r0, r0, r0
     e3c:	30000000 	andcc	r0, r0, r0
     e40:	48000007 	stmdami	r0, {r0, r1, r2}
     e44:	02000007 	andeq	r0, r0, #7
     e48:	489f3000 	ldmmi	pc, {ip, sp}	; <UNPREDICTABLE>
     e4c:	74000007 	strvc	r0, [r0], #-7
     e50:	01000007 	tsteq	r0, r7
     e54:	00005200 	andeq	r5, r0, r0, lsl #4
     e58:	00000000 	andeq	r0, r0, r0
     e5c:	07740000 	ldrbeq	r0, [r4, -r0]!
     e60:	079c0000 	ldreq	r0, [ip, r0]
     e64:	00010000 	andeq	r0, r1, r0
     e68:	00079c51 	andeq	r9, r7, r1, asr ip
     e6c:	0007a800 	andeq	sl, r7, r0, lsl #16
     e70:	7c000300 	stcvc	3, cr0, [r0], {-0}
     e74:	07a800c0 	streq	r0, [r8, r0, asr #1]!
     e78:	07bc0000 	ldreq	r0, [ip, r0]!
     e7c:	00040000 	andeq	r0, r4, r0
     e80:	9f5101f3 	svcls	0x005101f3
	...
     e8c:	000007f4 	strdeq	r0, [r0], -r4
     e90:	0000080c 	andeq	r0, r0, ip, lsl #16
     e94:	9f300002 	svcls	0x00300002
     e98:	0000080c 	andeq	r0, r0, ip, lsl #16
     e9c:	0000083c 	andeq	r0, r0, ip, lsr r8
     ea0:	00520001 	subseq	r0, r2, r1
     ea4:	00000000 	andeq	r0, r0, r0
     ea8:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
     eac:	f8000008 			; <UNDEFINED> instruction: 0xf8000008
     eb0:	02000008 	andeq	r0, r0, #8
     eb4:	f89f3000 			; <UNDEFINED> instruction: 0xf89f3000
     eb8:	84000008 	strhi	r0, [r0], #-8
     ebc:	01000009 	tsteq	r0, r9
     ec0:	00005400 	andeq	r5, r0, r0, lsl #8
     ec4:	00000000 	andeq	r0, r0, r0
     ec8:	08e80000 	stmiaeq	r8!, {}^	; <UNPREDICTABLE>
     ecc:	08f80000 	ldmeq	r8!, {}^	; <UNPREDICTABLE>
     ed0:	00060000 	andeq	r0, r6, r0
     ed4:	0000049e 	muleq	r0, lr, r4
     ed8:	08f80000 	ldmeq	r8!, {}^	; <UNPREDICTABLE>
     edc:	09840000 	stmibeq	r4, {}	; <UNPREDICTABLE>
     ee0:	00010000 	andeq	r0, r1, r0
     ee4:	00000056 	andeq	r0, r0, r6, asr r0
     ee8:	00000000 	andeq	r0, r0, r0
     eec:	000b4800 	andeq	r4, fp, r0, lsl #16
     ef0:	000bfb00 	andeq	pc, fp, r0, lsl #22
     ef4:	50000100 	andpl	r0, r0, r0, lsl #2
     ef8:	00000bfb 	strdeq	r0, [r0], -fp
     efc:	00000c04 	andeq	r0, r0, r4, lsl #24
     f00:	01f30004 	mvnseq	r0, r4
     f04:	00009f50 	andeq	r9, r0, r0, asr pc
     f08:	00000000 	andeq	r0, r0, r0
     f0c:	0b480000 	bleq	1200f14 <__user_program+0xf00f14>
     f10:	0bc80000 	bleq	ff200f18 <__user_program+0xfef00f18>
     f14:	00010000 	andeq	r0, r1, r0
     f18:	000bc851 	andeq	ip, fp, r1, asr r8
     f1c:	000c0400 	andeq	r0, ip, r0, lsl #8
     f20:	f3000400 	vshl.u8	d0, d0, d0
     f24:	009f5101 	addseq	r5, pc, r1, lsl #2
     f28:	00000000 	andeq	r0, r0, r0
     f2c:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
     f30:	6c00000b 	stcvs	0, cr0, [r0], {11}
     f34:	0200000b 	andeq	r0, r0, #11
     f38:	6c9f3000 	ldcvs	0, cr3, [pc], {0}
     f3c:	b400000b 	strlt	r0, [r0], #-11
     f40:	0100000b 	tsteq	r0, fp
     f44:	00005c00 	andeq	r5, r0, r0, lsl #24
	...
     f50:	00040000 	andeq	r0, r4, r0
     f54:	00010000 	andeq	r0, r1, r0
     f58:	00000450 	andeq	r0, r0, r0, asr r4
     f5c:	00002000 	andeq	r2, r0, r0
     f60:	53000100 	movwpl	r0, #256	; 0x100
	...
     f6c:	00000020 	andeq	r0, r0, r0, lsr #32
     f70:	0000002c 	andeq	r0, r0, ip, lsr #32
     f74:	2c500001 	mrrccs	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
     f78:	94000000 	strls	r0, [r0], #-0
     f7c:	04000000 	streq	r0, [r0], #-0
     f80:	5001f300 	andpl	pc, r1, r0, lsl #6
     f84:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     f88:	00000000 	andeq	r0, r0, r0
     f8c:	00002000 	andeq	r2, r0, r0
     f90:	00003000 	andeq	r3, r0, r0
     f94:	51000100 	mrspl	r0, (UNDEF: 16)
     f98:	00000030 	andeq	r0, r0, r0, lsr r0
     f9c:	00000094 	muleq	r0, r4, r0
     fa0:	00540001 	subseq	r0, r4, r1
     fa4:	00000000 	andeq	r0, r0, r0
     fa8:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
     fac:	7c000000 	stcvc	0, cr0, [r0], {-0}
     fb0:	06000000 	streq	r0, [r0], -r0
     fb4:	09007200 	stmdbeq	r0, {r9, ip, sp, lr}
     fb8:	7c9f1af3 	vldmiavc	pc, {s2-s244}
     fbc:	8f000000 	svchi	0x00000000
     fc0:	01000000 	mrseq	r0, (UNDEF: 0)
     fc4:	00005200 	andeq	r5, r0, r0, lsl #4
     fc8:	00000000 	andeq	r0, r0, r0
     fcc:	00b40000 	adcseq	r0, r4, r0
     fd0:	00b80000 	adcseq	r0, r8, r0
     fd4:	00060000 	andeq	r0, r6, r0
     fd8:	f3090072 	vqadd.u8	q0, <illegal reg q4.5>, q9
     fdc:	00b89f1a 	adcseq	r9, r8, sl, lsl pc
     fe0:	00c80000 	sbceq	r0, r8, r0
     fe4:	00010000 	andeq	r0, r1, r0
     fe8:	00000052 	andeq	r0, r0, r2, asr r0
     fec:	00000000 	andeq	r0, r0, r0
     ff0:	0000e000 	andeq	lr, r0, r0
     ff4:	00011400 	andeq	r1, r1, r0, lsl #8
     ff8:	50000100 	andpl	r0, r0, r0, lsl #2
     ffc:	00000114 	andeq	r0, r0, r4, lsl r1
    1000:	00000180 	andeq	r0, r0, r0, lsl #3
    1004:	01f30004 	mvnseq	r0, r4
    1008:	00009f50 	andeq	r9, r0, r0, asr pc
    100c:	00000000 	andeq	r0, r0, r0
    1010:	00e80000 	rsceq	r0, r8, r0
    1014:	00f40000 	rscseq	r0, r4, r0
    1018:	00020000 	andeq	r0, r2, r0
    101c:	00f49f30 	rscseq	r9, r4, r0, lsr pc
    1020:	00f80000 	rscseq	r0, r8, r0
    1024:	00060000 	andeq	r0, r6, r0
    1028:	30080072 	andcc	r0, r8, r2, ror r0
    102c:	00f89f21 	rscseq	r9, r8, r1, lsr #30
    1030:	01140000 	tsteq	r4, r0
    1034:	00010000 	andeq	r0, r1, r0
    1038:	00017052 	andeq	r7, r1, r2, asr r0
    103c:	00018000 	andeq	r8, r1, r0
    1040:	52000100 	andpl	r0, r0, #0, 2
	...
    104c:	000000e8 	andeq	r0, r0, r8, ror #1
    1050:	0000016c 	andeq	r0, r0, ip, ror #2
    1054:	9f300002 	svcls	0x00300002
    1058:	0000016c 	andeq	r0, r0, ip, ror #2
    105c:	0000017c 	andeq	r0, r0, ip, ror r1
    1060:	00500001 	subseq	r0, r0, r1
	...
    106c:	0c000000 	stceq	0, cr0, [r0], {-0}
    1070:	01000000 	mrseq	r0, (UNDEF: 0)
    1074:	000c5000 	andeq	r5, ip, r0
    1078:	00130000 	andseq	r0, r3, r0
    107c:	00010000 	andeq	r0, r1, r0
    1080:	00001351 	andeq	r1, r0, r1, asr r3
    1084:	00001c00 	andeq	r1, r0, r0, lsl #24
    1088:	f3000400 	vshl.u8	d0, d0, d0
    108c:	009f5001 	addseq	r5, pc, r1
    1090:	00000000 	andeq	r0, r0, r0
    1094:	1c000000 	stcne	0, cr0, [r0], {-0}
    1098:	3c000000 	stccc	0, cr0, [r0], {-0}
    109c:	01000000 	mrseq	r0, (UNDEF: 0)
    10a0:	003c5000 	eorseq	r5, ip, r0
    10a4:	00500000 	subseq	r0, r0, r0
    10a8:	00040000 	andeq	r0, r4, r0
    10ac:	9f5001f3 	svcls	0x005001f3
    10b0:	00000050 	andeq	r0, r0, r0, asr r0
    10b4:	00000054 	andeq	r0, r0, r4, asr r0
    10b8:	54500001 	ldrbpl	r0, [r0], #-1
    10bc:	5c000000 	stcpl	0, cr0, [r0], {-0}
    10c0:	04000000 	streq	r0, [r0], #-0
    10c4:	5001f300 	andpl	pc, r1, r0, lsl #6
    10c8:	00005c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
    10cc:	00006000 	andeq	r6, r0, r0
    10d0:	50000100 	andpl	r0, r0, r0, lsl #2
    10d4:	00000060 	andeq	r0, r0, r0, rrx
    10d8:	00000064 	andeq	r0, r0, r4, rrx
    10dc:	01f30004 	mvnseq	r0, r4
    10e0:	00009f50 	andeq	r9, r0, r0, asr pc
    10e4:	00000000 	andeq	r0, r0, r0
    10e8:	001c0000 	andseq	r0, ip, r0
    10ec:	003c0000 	eorseq	r0, ip, r0
    10f0:	00010000 	andeq	r0, r1, r0
    10f4:	00003c51 	andeq	r3, r0, r1, asr ip
    10f8:	00004000 	andeq	r4, r0, r0
    10fc:	54000100 	strpl	r0, [r0], #-256	; 0x100
    1100:	00000040 	andeq	r0, r0, r0, asr #32
    1104:	00000044 	andeq	r0, r0, r4, asr #32
    1108:	7f740003 	svcvc	0x00740003
    110c:	0000449f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
    1110:	00005000 	andeq	r5, r0, r0
    1114:	54000100 	strpl	r0, [r0], #-256	; 0x100
    1118:	00000050 	andeq	r0, r0, r0, asr r0
    111c:	00000054 	andeq	r0, r0, r4, asr r0
    1120:	54510001 	ldrbpl	r0, [r1], #-1
    1124:	5c000000 	stcpl	0, cr0, [r0], {-0}
    1128:	01000000 	mrseq	r0, (UNDEF: 0)
    112c:	005c5400 	subseq	r5, ip, r0, lsl #8
    1130:	00640000 	rsbeq	r0, r4, r0
    1134:	00010000 	andeq	r0, r1, r0
    1138:	00000051 	andeq	r0, r0, r1, asr r0
    113c:	00000000 	andeq	r0, r0, r0
    1140:	00001c00 	andeq	r1, r0, r0, lsl #24
    1144:	00003c00 	andeq	r3, r0, r0, lsl #24
    1148:	52000100 	andpl	r0, r0, #0, 2
    114c:	0000003c 	andeq	r0, r0, ip, lsr r0
    1150:	00000050 	andeq	r0, r0, r0, asr r0
    1154:	50560001 	subspl	r0, r6, r1
    1158:	54000000 	strpl	r0, [r0], #-0
    115c:	01000000 	mrseq	r0, (UNDEF: 0)
    1160:	00545200 	subseq	r5, r4, r0, lsl #4
    1164:	005c0000 	subseq	r0, ip, r0
    1168:	00040000 	andeq	r0, r4, r0
    116c:	9f5201f3 	svcls	0x005201f3
    1170:	0000005c 	andeq	r0, r0, ip, asr r0
    1174:	00000064 	andeq	r0, r0, r4, rrx
    1178:	00520001 	subseq	r0, r2, r1
    117c:	00000000 	andeq	r0, r0, r0
    1180:	1c000000 	stcne	0, cr0, [r0], {-0}
    1184:	54000000 	strpl	r0, [r0], #-0
    1188:	02000000 	andeq	r0, r0, #0
    118c:	5c9f3000 	ldcpl	0, cr3, [pc], {0}
    1190:	64000000 	strvs	r0, [r0], #-0
    1194:	02000000 	andeq	r0, r0, #0
    1198:	009f3000 	addseq	r3, pc, r0
    119c:	00000000 	andeq	r0, r0, r0
    11a0:	64000000 	strvs	r0, [r0], #-0
    11a4:	8c000000 	stchi	0, cr0, [r0], {-0}
    11a8:	01000000 	mrseq	r0, (UNDEF: 0)
    11ac:	008c5000 	addeq	r5, ip, r0
    11b0:	00ec0000 	rsceq	r0, ip, r0
    11b4:	00040000 	andeq	r0, r4, r0
    11b8:	9f5001f3 	svcls	0x005001f3
    11bc:	000000ec 	andeq	r0, r0, ip, ror #1
    11c0:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    11c4:	f0500001 			; <UNDEFINED> instruction: 0xf0500001
    11c8:	f8000000 			; <UNDEFINED> instruction: 0xf8000000
    11cc:	04000000 	streq	r0, [r0], #-0
    11d0:	5001f300 	andpl	pc, r1, r0, lsl #6
    11d4:	0000f89f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
    11d8:	0000fc00 	andeq	pc, r0, r0, lsl #24
    11dc:	50000100 	andpl	r0, r0, r0, lsl #2
    11e0:	000000fc 	strdeq	r0, [r0], -ip
    11e4:	00000100 	andeq	r0, r0, r0, lsl #2
    11e8:	01f30004 	mvnseq	r0, r4
    11ec:	00009f50 	andeq	r9, r0, r0, asr pc
    11f0:	00000000 	andeq	r0, r0, r0
    11f4:	00640000 	rsbeq	r0, r4, r0
    11f8:	008c0000 	addeq	r0, ip, r0
    11fc:	00010000 	andeq	r0, r1, r0
    1200:	0000a851 	andeq	sl, r0, r1, asr r8
    1204:	0000ac00 	andeq	sl, r0, r0, lsl #24
    1208:	75000300 	strvc	r0, [r0, #-768]	; 0x300
    120c:	00ac9f7f 	adceq	r9, ip, pc, ror pc
    1210:	00b80000 	adcseq	r0, r8, r0
    1214:	00010000 	andeq	r0, r1, r0
    1218:	0000d855 	andeq	sp, r0, r5, asr r8
    121c:	0000e000 	andeq	lr, r0, r0
    1220:	75000300 	strvc	r0, [r0, #-768]	; 0x300
    1224:	00ec9f01 	rsceq	r9, ip, r1, lsl #30
    1228:	00f00000 	rscseq	r0, r0, r0
    122c:	00010000 	andeq	r0, r1, r0
    1230:	0000f851 	andeq	pc, r0, r1, asr r8	; <UNPREDICTABLE>
    1234:	00010000 	andeq	r0, r1, r0
    1238:	51000100 	mrspl	r0, (UNDEF: 16)
	...
    1244:	00000064 	andeq	r0, r0, r4, rrx
    1248:	0000008c 	andeq	r0, r0, ip, lsl #1
    124c:	8c520001 	mrrchi	0, 0, r0, r2, cr1
    1250:	ec000000 	stc	0, cr0, [r0], {-0}
    1254:	01000000 	mrseq	r0, (UNDEF: 0)
    1258:	00ec5600 	rsceq	r5, ip, r0, lsl #12
    125c:	00f00000 	rscseq	r0, r0, r0
    1260:	00010000 	andeq	r0, r1, r0
    1264:	0000f052 	andeq	pc, r0, r2, asr r0	; <UNPREDICTABLE>
    1268:	0000f800 	andeq	pc, r0, r0, lsl #16
    126c:	56000100 	strpl	r0, [r0], -r0, lsl #2
    1270:	000000f8 	strdeq	r0, [r0], -r8
    1274:	00000100 	andeq	r0, r0, r0, lsl #2
    1278:	00520001 	subseq	r0, r2, r1
    127c:	00000000 	andeq	r0, r0, r0
    1280:	64000000 	strvs	r0, [r0], #-0
    1284:	8c000000 	stchi	0, cr0, [r0], {-0}
    1288:	02000000 	andeq	r0, r0, #0
    128c:	8c9f3000 	ldchi	0, cr3, [pc], {0}
    1290:	ec000000 	stc	0, cr0, [r0], {-0}
    1294:	01000000 	mrseq	r0, (UNDEF: 0)
    1298:	00ec5400 	rsceq	r5, ip, r0, lsl #8
    129c:	00f00000 	rscseq	r0, r0, r0
    12a0:	00020000 	andeq	r0, r2, r0
    12a4:	00f89f30 	rscseq	r9, r8, r0, lsr pc
    12a8:	01000000 	mrseq	r0, (UNDEF: 0)
    12ac:	00020000 	andeq	r0, r2, r0
    12b0:	00009f30 	andeq	r9, r0, r0, lsr pc
    12b4:	00000000 	andeq	r0, r0, r0
    12b8:	00900000 	addseq	r0, r0, r0
    12bc:	00b00000 	adcseq	r0, r0, r0
    12c0:	00010000 	andeq	r0, r1, r0
    12c4:	0000b850 	andeq	fp, r0, r0, asr r8
    12c8:	0000cb00 	andeq	ip, r0, r0, lsl #22
    12cc:	50000100 	andpl	r0, r0, r0, lsl #2
    12d0:	000000d4 	ldrdeq	r0, [r0], -r4
    12d4:	000000db 	ldrdeq	r0, [r0], -fp
    12d8:	00500001 	subseq	r0, r0, r1
	...
    12e4:	13000001 	movwne	r0, #1
    12e8:	01000001 	tsteq	r0, r1
    12ec:	01135000 	tsteq	r3, r0
    12f0:	011c0000 	tsteq	ip, r0
    12f4:	00040000 	andeq	r0, r4, r0
    12f8:	9f5001f3 	svcls	0x005001f3
	...
    1304:	00000100 	andeq	r0, r0, r0, lsl #2
    1308:	00000113 	andeq	r0, r0, r3, lsl r1
    130c:	13510001 	cmpne	r1, #1
    1310:	1c000001 	stcne	0, cr0, [r0], {1}
    1314:	04000001 	streq	r0, [r0], #-1
    1318:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
    131c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    1320:	00000000 	andeq	r0, r0, r0
    1324:	00010000 	andeq	r0, r1, r0
    1328:	00011300 	andeq	r1, r1, r0, lsl #6
    132c:	52000100 	andpl	r0, r0, #0, 2
    1330:	00000113 	andeq	r0, r0, r3, lsl r1
    1334:	0000011c 	andeq	r0, r0, ip, lsl r1
    1338:	01f30004 	mvnseq	r0, r4
    133c:	00009f52 	andeq	r9, r0, r2, asr pc
    1340:	00000000 	andeq	r0, r0, r0
    1344:	012c0000 	teqeq	ip, r0
    1348:	01600000 	cmneq	r0, r0
    134c:	00010000 	andeq	r0, r1, r0
    1350:	00016050 	andeq	r6, r1, r0, asr r0
    1354:	00018400 	andeq	r8, r1, r0, lsl #8
    1358:	f3000400 	vshl.u8	d0, d0, d0
    135c:	009f5001 	addseq	r5, pc, r1
    1360:	00000000 	andeq	r0, r0, r0
    1364:	84000000 	strhi	r0, [r0], #-0
    1368:	88000001 	stmdahi	r0, {r0}
    136c:	01000001 	tsteq	r0, r1
    1370:	01885000 	orreq	r5, r8, r0
    1374:	018c0000 	orreq	r0, ip, r0
    1378:	00040000 	andeq	r0, r4, r0
    137c:	9f5001f3 	svcls	0x005001f3
	...
    1388:	0000018c 	andeq	r0, r0, ip, lsl #3
    138c:	00000190 	muleq	r0, r0, r1
    1390:	90500001 	subsls	r0, r0, r1
    1394:	94000001 	strls	r0, [r0], #-1
    1398:	04000001 	streq	r0, [r0], #-1
    139c:	5001f300 	andpl	pc, r1, r0, lsl #6
    13a0:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    13a4:	00000000 	andeq	r0, r0, r0
    13a8:	00019400 	andeq	r9, r1, r0, lsl #8
    13ac:	00019800 	andeq	r9, r1, r0, lsl #16
    13b0:	50000100 	andpl	r0, r0, r0, lsl #2
    13b4:	00000198 	muleq	r0, r8, r1
    13b8:	0000019c 	muleq	r0, ip, r1
    13bc:	01f30004 	mvnseq	r0, r4
    13c0:	00009f50 	andeq	r9, r0, r0, asr pc
    13c4:	00000000 	andeq	r0, r0, r0
    13c8:	019c0000 	orrseq	r0, ip, r0
    13cc:	01a00000 	moveq	r0, r0
    13d0:	00010000 	andeq	r0, r1, r0
    13d4:	0001a050 	andeq	sl, r1, r0, asr r0
    13d8:	0001a400 	andeq	sl, r1, r0, lsl #8
    13dc:	f3000400 	vshl.u8	d0, d0, d0
    13e0:	009f5001 	addseq	r5, pc, r1
    13e4:	00000000 	andeq	r0, r0, r0
    13e8:	Address 0x000013e8 is out of bounds.


Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	000000f8 	strdeq	r0, [r0], -r8
   4:	00000100 	andeq	r0, r0, r0, lsl #2
   8:	000001dc 	ldrdeq	r0, [r0], -ip
   c:	000001fc 	strdeq	r0, [r0], -ip
	...
  18:	00000100 	andeq	r0, r0, r0, lsl #2
  1c:	00000104 	andeq	r0, r0, r4, lsl #2
  20:	000001fc 	strdeq	r0, [r0], -ip
  24:	0000021c 	andeq	r0, r0, ip, lsl r2
	...
