
kernel_optimization/kernel.elf:     file format elf32-littlearm


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
    8044:	0012e000 	andseq	lr, r2, r0
    8048:	0011d000 	andseq	sp, r1, r0
    804c:	0000c000 	andeq	ip, r0, r0
    8050:	0000d000 	andeq	sp, r0, r0

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
    80ac:	e30b3000 	movw	r3, #45056	; 0xb000
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
    8148:	e30b3000 	movw	r3, #45056	; 0xb000
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
    81a4:	e30b3000 	movw	r3, #45056	; 0xb000
    81a8:	e3403000 	movt	r3, #0
    81ac:	e5933000 	ldr	r3, [r3]
    81b0:	e2833020 	add	r3, r3, #32
    81b4:	e55b2005 	ldrb	r2, [fp, #-5]
    81b8:	e2422020 	sub	r2, r2, #32
    81bc:	e3a01001 	mov	r1, #1
    81c0:	e1a02211 	lsl	r2, r1, r2
    81c4:	e5832000 	str	r2, [r3]
    81c8:	ea000007 	b	81ec <gpio_set+0x78>
    81cc:	e30b3000 	movw	r3, #45056	; 0xb000
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
    8228:	e30b3000 	movw	r3, #45056	; 0xb000
    822c:	e3403000 	movt	r3, #0
    8230:	e5933000 	ldr	r3, [r3]
    8234:	e283302c 	add	r3, r3, #44	; 0x2c
    8238:	e55b2005 	ldrb	r2, [fp, #-5]
    823c:	e2422020 	sub	r2, r2, #32
    8240:	e3a01001 	mov	r1, #1
    8244:	e1a02211 	lsl	r2, r1, r2
    8248:	e5832000 	str	r2, [r3]
    824c:	ea000007 	b	8270 <gpio_clr+0x78>
    8250:	e30b3000 	movw	r3, #45056	; 0xb000
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
    82b8:	e30b3000 	movw	r3, #45056	; 0xb000
    82bc:	e3403000 	movt	r3, #0
    82c0:	e5933000 	ldr	r3, [r3]
    82c4:	e2833094 	add	r3, r3, #148	; 0x94
    82c8:	e55b2006 	ldrb	r2, [fp, #-6]
    82cc:	e5832000 	str	r2, [r3]
    82d0:	e3a00096 	mov	r0, #150	; 0x96
    82d4:	eb0001a6 	bl	8974 <delay_cycles>
    82d8:	e55b3005 	ldrb	r3, [fp, #-5]
    82dc:	e353001f 	cmp	r3, #31
    82e0:	9a000011 	bls	832c <gpio_set_pull+0xb0>
    82e4:	e30b3000 	movw	r3, #45056	; 0xb000
    82e8:	e3403000 	movt	r3, #0
    82ec:	e5933000 	ldr	r3, [r3]
    82f0:	e283309c 	add	r3, r3, #156	; 0x9c
    82f4:	e55b2005 	ldrb	r2, [fp, #-5]
    82f8:	e2422020 	sub	r2, r2, #32
    82fc:	e3a01001 	mov	r1, #1
    8300:	e1a02211 	lsl	r2, r1, r2
    8304:	e5832000 	str	r2, [r3]
    8308:	e3a00096 	mov	r0, #150	; 0x96
    830c:	eb000198 	bl	8974 <delay_cycles>
    8310:	e30b3000 	movw	r3, #45056	; 0xb000
    8314:	e3403000 	movt	r3, #0
    8318:	e5933000 	ldr	r3, [r3]
    831c:	e283309c 	add	r3, r3, #156	; 0x9c
    8320:	e3a02000 	mov	r2, #0
    8324:	e5832000 	str	r2, [r3]
    8328:	ea00000f 	b	836c <gpio_set_pull+0xf0>
    832c:	e30b3000 	movw	r3, #45056	; 0xb000
    8330:	e3403000 	movt	r3, #0
    8334:	e5933000 	ldr	r3, [r3]
    8338:	e2833098 	add	r3, r3, #152	; 0x98
    833c:	e55b2005 	ldrb	r2, [fp, #-5]
    8340:	e3a01001 	mov	r1, #1
    8344:	e1a02211 	lsl	r2, r1, r2
    8348:	e5832000 	str	r2, [r3]
    834c:	e3a00096 	mov	r0, #150	; 0x96
    8350:	eb000187 	bl	8974 <delay_cycles>
    8354:	e30b3000 	movw	r3, #45056	; 0xb000
    8358:	e3403000 	movt	r3, #0
    835c:	e5933000 	ldr	r3, [r3]
    8360:	e2833098 	add	r3, r3, #152	; 0x98
    8364:	e3a02000 	mov	r2, #0
    8368:	e5832000 	str	r2, [r3]
    836c:	e24bd004 	sub	sp, fp, #4
    8370:	e8bd8800 	pop	{fp, pc}

00008374 <kernel_main>:
    8374:	e92d4800 	push	{fp, lr}
    8378:	e28db004 	add	fp, sp, #4
    837c:	e24dd010 	sub	sp, sp, #16
    8380:	e3a03001 	mov	r3, #1
    8384:	e50b300c 	str	r3, [fp, #-12]
    8388:	eb000131 	bl	8854 <uart_init>
    838c:	e3a03000 	mov	r3, #0
    8390:	e50b3008 	str	r3, [fp, #-8]
    8394:	ea00000c 	b	83cc <kernel_main+0x58>
    8398:	e30c37d0 	movw	r3, #51152	; 0xc7d0
    839c:	e3403000 	movt	r3, #0
    83a0:	e51b2008 	ldr	r2, [fp, #-8]
    83a4:	e51b1008 	ldr	r1, [fp, #-8]
    83a8:	e7831102 	str	r1, [r3, r2, lsl #2]
    83ac:	e30c3000 	movw	r3, #49152	; 0xc000
    83b0:	e3403000 	movt	r3, #0
    83b4:	e51b2008 	ldr	r2, [fp, #-8]
    83b8:	e51b1008 	ldr	r1, [fp, #-8]
    83bc:	e7831102 	str	r1, [r3, r2, lsl #2]
    83c0:	e51b3008 	ldr	r3, [fp, #-8]
    83c4:	e2833001 	add	r3, r3, #1
    83c8:	e50b3008 	str	r3, [fp, #-8]
    83cc:	e51b3008 	ldr	r3, [fp, #-8]
    83d0:	e3530f7d 	cmp	r3, #500	; 0x1f4
    83d4:	baffffef 	blt	8398 <kernel_main+0x24>
    83d8:	e30a0000 	movw	r0, #40960	; 0xa000
    83dc:	e3400000 	movt	r0, #0
    83e0:	eb000087 	bl	8604 <printk>
    83e4:	eb000155 	bl	8940 <tic>
    83e8:	e30c07d0 	movw	r0, #51152	; 0xc7d0
    83ec:	e3400000 	movt	r0, #0
    83f0:	eb0001d7 	bl	8b54 <optimize_me>
    83f4:	eb000157 	bl	8958 <toc>
    83f8:	e50b0010 	str	r0, [fp, #-16]
    83fc:	e30a0024 	movw	r0, #40996	; 0xa024
    8400:	e3400000 	movt	r0, #0
    8404:	e51b1010 	ldr	r1, [fp, #-16]
    8408:	eb00007d 	bl	8604 <printk>
    840c:	e30a0028 	movw	r0, #41000	; 0xa028
    8410:	e3400000 	movt	r0, #0
    8414:	eb00007a 	bl	8604 <printk>
    8418:	eb000148 	bl	8940 <tic>
    841c:	e30c0000 	movw	r0, #49152	; 0xc000
    8420:	e3400000 	movt	r0, #0
    8424:	eb000174 	bl	89fc <unoptimized>
    8428:	eb00014a 	bl	8958 <toc>
    842c:	e50b0010 	str	r0, [fp, #-16]
    8430:	e30a0024 	movw	r0, #40996	; 0xa024
    8434:	e3400000 	movt	r0, #0
    8438:	e51b1010 	ldr	r1, [fp, #-16]
    843c:	eb000070 	bl	8604 <printk>
    8440:	e3a03000 	mov	r3, #0
    8444:	e50b3008 	str	r3, [fp, #-8]
    8448:	ea000012 	b	8498 <kernel_main+0x124>
    844c:	e30c37d0 	movw	r3, #51152	; 0xc7d0
    8450:	e3403000 	movt	r3, #0
    8454:	e51b2008 	ldr	r2, [fp, #-8]
    8458:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    845c:	e30c3000 	movw	r3, #49152	; 0xc000
    8460:	e3403000 	movt	r3, #0
    8464:	e51b1008 	ldr	r1, [fp, #-8]
    8468:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    846c:	e1520003 	cmp	r2, r3
    8470:	0a000005 	beq	848c <kernel_main+0x118>
    8474:	e30a004c 	movw	r0, #41036	; 0xa04c
    8478:	e3400000 	movt	r0, #0
    847c:	eb000060 	bl	8604 <printk>
    8480:	e3a03000 	mov	r3, #0
    8484:	e50b300c 	str	r3, [fp, #-12]
    8488:	ea000005 	b	84a4 <kernel_main+0x130>
    848c:	e51b3008 	ldr	r3, [fp, #-8]
    8490:	e2833001 	add	r3, r3, #1
    8494:	e50b3008 	str	r3, [fp, #-8]
    8498:	e51b3008 	ldr	r3, [fp, #-8]
    849c:	e3530f7d 	cmp	r3, #500	; 0x1f4
    84a0:	baffffe9 	blt	844c <kernel_main+0xd8>
    84a4:	e51b300c 	ldr	r3, [fp, #-12]
    84a8:	e3530000 	cmp	r3, #0
    84ac:	0a000002 	beq	84bc <kernel_main+0x148>
    84b0:	e30a0068 	movw	r0, #41064	; 0xa068
    84b4:	e3400000 	movt	r0, #0
    84b8:	eb000051 	bl	8604 <printk>
    84bc:	e30806a0 	movw	r0, #34464	; 0x86a0
    84c0:	e3400001 	movt	r0, #1
    84c4:	eb00012a 	bl	8974 <delay_cycles>
    84c8:	eafffffb 	b	84bc <kernel_main+0x148>

000084cc <printnumk>:
    84cc:	e92d4810 	push	{r4, fp, lr}
    84d0:	e28db008 	add	fp, sp, #8
    84d4:	e24dd024 	sub	sp, sp, #36	; 0x24
    84d8:	e1a01000 	mov	r1, r0
    84dc:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    84e0:	e1a03001 	mov	r3, r1
    84e4:	e54b301d 	strb	r3, [fp, #-29]
    84e8:	e3a03000 	mov	r3, #0
    84ec:	e50b3010 	str	r3, [fp, #-16]
    84f0:	e24b301c 	sub	r3, fp, #28
    84f4:	e2833007 	add	r3, r3, #7
    84f8:	e50b3014 	str	r3, [fp, #-20]
    84fc:	e55b301d 	ldrb	r3, [fp, #-29]
    8500:	e3530008 	cmp	r3, #8
    8504:	1a000003 	bne	8518 <printnumk+0x4c>
    8508:	e30a3084 	movw	r3, #41092	; 0xa084
    850c:	e3403000 	movt	r3, #0
    8510:	e50b3010 	str	r3, [fp, #-16]
    8514:	ea000005 	b	8530 <printnumk+0x64>
    8518:	e55b301d 	ldrb	r3, [fp, #-29]
    851c:	e3530010 	cmp	r3, #16
    8520:	1a000002 	bne	8530 <printnumk+0x64>
    8524:	e30a3088 	movw	r3, #41096	; 0xa088
    8528:	e3403000 	movt	r3, #0
    852c:	e50b3010 	str	r3, [fp, #-16]
    8530:	e51b4014 	ldr	r4, [fp, #-20]
    8534:	e2443001 	sub	r3, r4, #1
    8538:	e50b3014 	str	r3, [fp, #-20]
    853c:	e55b201d 	ldrb	r2, [fp, #-29]
    8540:	e3a03000 	mov	r3, #0
    8544:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    8548:	eb0001c6 	bl	8c68 <__aeabi_uldivmod>
    854c:	e1a00002 	mov	r0, r2
    8550:	e1a01003 	mov	r1, r3
    8554:	e30b3004 	movw	r3, #45060	; 0xb004
    8558:	e3403000 	movt	r3, #0
    855c:	e0833000 	add	r3, r3, r0
    8560:	e5d33000 	ldrb	r3, [r3]
    8564:	e5c43000 	strb	r3, [r4]
    8568:	e55b201d 	ldrb	r2, [fp, #-29]
    856c:	e3a03000 	mov	r3, #0
    8570:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    8574:	eb0001bb 	bl	8c68 <__aeabi_uldivmod>
    8578:	e1a02000 	mov	r2, r0
    857c:	e1a03001 	mov	r3, r1
    8580:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    8584:	e14b22dc 	ldrd	r2, [fp, #-44]	; 0xffffffd4
    8588:	e1923003 	orrs	r3, r2, r3
    858c:	1affffe7 	bne	8530 <printnumk+0x64>
    8590:	e51b3010 	ldr	r3, [fp, #-16]
    8594:	e3530000 	cmp	r3, #0
    8598:	0a00000a 	beq	85c8 <printnumk+0xfc>
    859c:	ea000005 	b	85b8 <printnumk+0xec>
    85a0:	e51b3010 	ldr	r3, [fp, #-16]
    85a4:	e2832001 	add	r2, r3, #1
    85a8:	e50b2010 	str	r2, [fp, #-16]
    85ac:	e5d33000 	ldrb	r3, [r3]
    85b0:	e1a00003 	mov	r0, r3
    85b4:	eb0000b0 	bl	887c <uart_put_byte>
    85b8:	e51b3010 	ldr	r3, [fp, #-16]
    85bc:	e5d33000 	ldrb	r3, [r3]
    85c0:	e3530000 	cmp	r3, #0
    85c4:	1afffff5 	bne	85a0 <printnumk+0xd4>
    85c8:	ea000003 	b	85dc <printnumk+0x110>
    85cc:	e51b3014 	ldr	r3, [fp, #-20]
    85d0:	e5d33000 	ldrb	r3, [r3]
    85d4:	e1a00003 	mov	r0, r3
    85d8:	eb0000a7 	bl	887c <uart_put_byte>
    85dc:	e51b3014 	ldr	r3, [fp, #-20]
    85e0:	e2833001 	add	r3, r3, #1
    85e4:	e50b3014 	str	r3, [fp, #-20]
    85e8:	e24b301c 	sub	r3, fp, #28
    85ec:	e2833008 	add	r3, r3, #8
    85f0:	e51b2014 	ldr	r2, [fp, #-20]
    85f4:	e1520003 	cmp	r2, r3
    85f8:	1afffff3 	bne	85cc <printnumk+0x100>
    85fc:	e24bd008 	sub	sp, fp, #8
    8600:	e8bd8810 	pop	{r4, fp, pc}

00008604 <printk>:
    8604:	e92d000f 	push	{r0, r1, r2, r3}
    8608:	e92d4800 	push	{fp, lr}
    860c:	e28db004 	add	fp, sp, #4
    8610:	e24dd020 	sub	sp, sp, #32
    8614:	e28b3008 	add	r3, fp, #8
    8618:	e50b3020 	str	r3, [fp, #-32]
    861c:	ea000082 	b	882c <printk+0x228>
    8620:	e59b3004 	ldr	r3, [fp, #4]
    8624:	e5d33000 	ldrb	r3, [r3]
    8628:	e3530025 	cmp	r3, #37	; 0x25
    862c:	0a000006 	beq	864c <printk+0x48>
    8630:	e59b3004 	ldr	r3, [fp, #4]
    8634:	e2832001 	add	r2, r3, #1
    8638:	e58b2004 	str	r2, [fp, #4]
    863c:	e5d33000 	ldrb	r3, [r3]
    8640:	e1a00003 	mov	r0, r3
    8644:	eb00008c 	bl	887c <uart_put_byte>
    8648:	ea000077 	b	882c <printk+0x228>
    864c:	e59b3004 	ldr	r3, [fp, #4]
    8650:	e2833001 	add	r3, r3, #1
    8654:	e58b3004 	str	r3, [fp, #4]
    8658:	e59b3004 	ldr	r3, [fp, #4]
    865c:	e5d33000 	ldrb	r3, [r3]
    8660:	e353006f 	cmp	r3, #111	; 0x6f
    8664:	0a000036 	beq	8744 <printk+0x140>
    8668:	e353006f 	cmp	r3, #111	; 0x6f
    866c:	ca000006 	bgt	868c <printk+0x88>
    8670:	e3530063 	cmp	r3, #99	; 0x63
    8674:	0a00005a 	beq	87e4 <printk+0x1e0>
    8678:	e3530064 	cmp	r3, #100	; 0x64
    867c:	0a00000e 	beq	86bc <printk+0xb8>
    8680:	e3530025 	cmp	r3, #37	; 0x25
    8684:	0a000060 	beq	880c <printk+0x208>
    8688:	ea000062 	b	8818 <printk+0x214>
    868c:	e3530073 	cmp	r3, #115	; 0x73
    8690:	0a000041 	beq	879c <printk+0x198>
    8694:	e3530073 	cmp	r3, #115	; 0x73
    8698:	ca000002 	bgt	86a8 <printk+0xa4>
    869c:	e3530070 	cmp	r3, #112	; 0x70
    86a0:	0a000032 	beq	8770 <printk+0x16c>
    86a4:	ea00005b 	b	8818 <printk+0x214>
    86a8:	e3530075 	cmp	r3, #117	; 0x75
    86ac:	0a000019 	beq	8718 <printk+0x114>
    86b0:	e3530078 	cmp	r3, #120	; 0x78
    86b4:	0a00002d 	beq	8770 <printk+0x16c>
    86b8:	ea000056 	b	8818 <printk+0x214>
    86bc:	e51b3020 	ldr	r3, [fp, #-32]
    86c0:	e2832004 	add	r2, r3, #4
    86c4:	e50b2020 	str	r2, [fp, #-32]
    86c8:	e5933000 	ldr	r3, [r3]
    86cc:	e50b300c 	str	r3, [fp, #-12]
    86d0:	e51b300c 	ldr	r3, [fp, #-12]
    86d4:	e3530000 	cmp	r3, #0
    86d8:	aa000008 	bge	8700 <printk+0xfc>
    86dc:	e3a0002d 	mov	r0, #45	; 0x2d
    86e0:	eb000065 	bl	887c <uart_put_byte>
    86e4:	e51b300c 	ldr	r3, [fp, #-12]
    86e8:	e2633000 	rsb	r3, r3, #0
    86ec:	e1a02003 	mov	r2, r3
    86f0:	e1a03fc2 	asr	r3, r2, #31
    86f4:	e3a0000a 	mov	r0, #10
    86f8:	ebffff73 	bl	84cc <printnumk>
    86fc:	ea000047 	b	8820 <printk+0x21c>
    8700:	e51b300c 	ldr	r3, [fp, #-12]
    8704:	e1a02003 	mov	r2, r3
    8708:	e1a03fc2 	asr	r3, r2, #31
    870c:	e3a0000a 	mov	r0, #10
    8710:	ebffff6d 	bl	84cc <printnumk>
    8714:	ea000041 	b	8820 <printk+0x21c>
    8718:	e51b3020 	ldr	r3, [fp, #-32]
    871c:	e2832004 	add	r2, r3, #4
    8720:	e50b2020 	str	r2, [fp, #-32]
    8724:	e5933000 	ldr	r3, [r3]
    8728:	e50b3010 	str	r3, [fp, #-16]
    872c:	e51b3010 	ldr	r3, [fp, #-16]
    8730:	e1a02003 	mov	r2, r3
    8734:	e3a03000 	mov	r3, #0
    8738:	e3a0000a 	mov	r0, #10
    873c:	ebffff62 	bl	84cc <printnumk>
    8740:	ea000036 	b	8820 <printk+0x21c>
    8744:	e51b3020 	ldr	r3, [fp, #-32]
    8748:	e2832004 	add	r2, r3, #4
    874c:	e50b2020 	str	r2, [fp, #-32]
    8750:	e5933000 	ldr	r3, [r3]
    8754:	e50b3014 	str	r3, [fp, #-20]
    8758:	e51b3014 	ldr	r3, [fp, #-20]
    875c:	e1a02003 	mov	r2, r3
    8760:	e3a03000 	mov	r3, #0
    8764:	e3a00008 	mov	r0, #8
    8768:	ebffff57 	bl	84cc <printnumk>
    876c:	ea00002b 	b	8820 <printk+0x21c>
    8770:	e51b3020 	ldr	r3, [fp, #-32]
    8774:	e2832004 	add	r2, r3, #4
    8778:	e50b2020 	str	r2, [fp, #-32]
    877c:	e5933000 	ldr	r3, [r3]
    8780:	e50b3018 	str	r3, [fp, #-24]
    8784:	e51b3018 	ldr	r3, [fp, #-24]
    8788:	e1a02003 	mov	r2, r3
    878c:	e3a03000 	mov	r3, #0
    8790:	e3a00010 	mov	r0, #16
    8794:	ebffff4c 	bl	84cc <printnumk>
    8798:	ea000020 	b	8820 <printk+0x21c>
    879c:	e51b3020 	ldr	r3, [fp, #-32]
    87a0:	e2832004 	add	r2, r3, #4
    87a4:	e50b2020 	str	r2, [fp, #-32]
    87a8:	e5933000 	ldr	r3, [r3]
    87ac:	e50b3008 	str	r3, [fp, #-8]
    87b0:	ea000006 	b	87d0 <printk+0x1cc>
    87b4:	e51b3008 	ldr	r3, [fp, #-8]
    87b8:	e5d33000 	ldrb	r3, [r3]
    87bc:	e1a00003 	mov	r0, r3
    87c0:	eb00002d 	bl	887c <uart_put_byte>
    87c4:	e51b3008 	ldr	r3, [fp, #-8]
    87c8:	e2833001 	add	r3, r3, #1
    87cc:	e50b3008 	str	r3, [fp, #-8]
    87d0:	e51b3008 	ldr	r3, [fp, #-8]
    87d4:	e5d33000 	ldrb	r3, [r3]
    87d8:	e3530000 	cmp	r3, #0
    87dc:	1afffff4 	bne	87b4 <printk+0x1b0>
    87e0:	ea00000e 	b	8820 <printk+0x21c>
    87e4:	e51b3020 	ldr	r3, [fp, #-32]
    87e8:	e2832004 	add	r2, r3, #4
    87ec:	e50b2020 	str	r2, [fp, #-32]
    87f0:	e5933000 	ldr	r3, [r3]
    87f4:	e50b301c 	str	r3, [fp, #-28]
    87f8:	e51b301c 	ldr	r3, [fp, #-28]
    87fc:	e6ef3073 	uxtb	r3, r3
    8800:	e1a00003 	mov	r0, r3
    8804:	eb00001c 	bl	887c <uart_put_byte>
    8808:	ea000004 	b	8820 <printk+0x21c>
    880c:	e3a00025 	mov	r0, #37	; 0x25
    8810:	eb000019 	bl	887c <uart_put_byte>
    8814:	ea000001 	b	8820 <printk+0x21c>
    8818:	e3e03000 	mvn	r3, #0
    881c:	ea000007 	b	8840 <printk+0x23c>
    8820:	e59b3004 	ldr	r3, [fp, #4]
    8824:	e2833001 	add	r3, r3, #1
    8828:	e58b3004 	str	r3, [fp, #4]
    882c:	e59b3004 	ldr	r3, [fp, #4]
    8830:	e5d33000 	ldrb	r3, [r3]
    8834:	e3530000 	cmp	r3, #0
    8838:	1affff78 	bne	8620 <printk+0x1c>
    883c:	e3a03000 	mov	r3, #0
    8840:	e1a00003 	mov	r0, r3
    8844:	e24bd004 	sub	sp, fp, #4
    8848:	e8bd4800 	pop	{fp, lr}
    884c:	e28dd010 	add	sp, sp, #16
    8850:	e12fff1e 	bx	lr

00008854 <uart_init>:
    8854:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8858:	e28db000 	add	fp, sp, #0
    885c:	e24bd000 	sub	sp, fp, #0
    8860:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8864:	e12fff1e 	bx	lr

00008868 <uart_close>:
    8868:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    886c:	e28db000 	add	fp, sp, #0
    8870:	e24bd000 	sub	sp, fp, #0
    8874:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8878:	e12fff1e 	bx	lr

0000887c <uart_put_byte>:
    887c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8880:	e28db000 	add	fp, sp, #0
    8884:	e24dd00c 	sub	sp, sp, #12
    8888:	e1a03000 	mov	r3, r0
    888c:	e54b3005 	strb	r3, [fp, #-5]
    8890:	e24bd000 	sub	sp, fp, #0
    8894:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8898:	e12fff1e 	bx	lr

0000889c <uart_get_byte>:
    889c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88a0:	e28db000 	add	fp, sp, #0
    88a4:	e3a03000 	mov	r3, #0
    88a8:	e1a00003 	mov	r0, r3
    88ac:	e24bd000 	sub	sp, fp, #0
    88b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88b4:	e12fff1e 	bx	lr

000088b8 <timer_start>:
    88b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88bc:	e28db000 	add	fp, sp, #0
    88c0:	e24dd00c 	sub	sp, sp, #12
    88c4:	e50b0008 	str	r0, [fp, #-8]
    88c8:	e1a00000 	nop			; (mov r0, r0)
    88cc:	e24bd000 	sub	sp, fp, #0
    88d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88d4:	e12fff1e 	bx	lr

000088d8 <timer_stop>:
    88d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88dc:	e28db000 	add	fp, sp, #0
    88e0:	e1a00000 	nop			; (mov r0, r0)
    88e4:	e24bd000 	sub	sp, fp, #0
    88e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88ec:	e12fff1e 	bx	lr

000088f0 <timer_read>:
    88f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88f4:	e28db000 	add	fp, sp, #0
    88f8:	e3a03000 	mov	r3, #0
    88fc:	e1a00003 	mov	r0, r3
    8900:	e24bd000 	sub	sp, fp, #0
    8904:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8908:	e12fff1e 	bx	lr

0000890c <timer_is_pending>:
    890c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8910:	e28db000 	add	fp, sp, #0
    8914:	e3a03000 	mov	r3, #0
    8918:	e1a00003 	mov	r0, r3
    891c:	e24bd000 	sub	sp, fp, #0
    8920:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8924:	e12fff1e 	bx	lr

00008928 <timer_clear_pending>:
    8928:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    892c:	e28db000 	add	fp, sp, #0
    8930:	e1a00000 	nop			; (mov r0, r0)
    8934:	e24bd000 	sub	sp, fp, #0
    8938:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    893c:	e12fff1e 	bx	lr

00008940 <tic>:
    8940:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8944:	e28db000 	add	fp, sp, #0
    8948:	e1a00000 	nop			; (mov r0, r0)
    894c:	e24bd000 	sub	sp, fp, #0
    8950:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8954:	e12fff1e 	bx	lr

00008958 <toc>:
    8958:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    895c:	e28db000 	add	fp, sp, #0
    8960:	e3a03000 	mov	r3, #0
    8964:	e1a00003 	mov	r0, r3
    8968:	e24bd000 	sub	sp, fp, #0
    896c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8970:	e12fff1e 	bx	lr

00008974 <delay_cycles>:
    8974:	e2500001 	subs	r0, r0, #1
    8978:	1afffffd 	bne	8974 <delay_cycles>
    897c:	e1a0f00e 	mov	pc, lr

00008980 <read_cpsr>:
    8980:	e10f0000 	mrs	r0, CPSR
    8984:	e1a0f00e 	mov	pc, lr

00008988 <write_cpsr>:
    8988:	e129f000 	msr	CPSR_fc, r0
    898c:	e1a0f00e 	mov	pc, lr

00008990 <disable_interrupts>:
    8990:	e10f0000 	mrs	r0, CPSR
    8994:	e3a01d07 	mov	r1, #448	; 0x1c0
    8998:	e1800001 	orr	r0, r0, r1
    899c:	e129f000 	msr	CPSR_fc, r0
    89a0:	e1a0f00e 	mov	pc, lr

000089a4 <enable_interrupts>:
    89a4:	e10f0000 	mrs	r0, CPSR
    89a8:	e3a01d07 	mov	r1, #448	; 0x1c0
    89ac:	e1c00001 	bic	r0, r0, r1
    89b0:	e129f000 	msr	CPSR_fc, r0
    89b4:	e1a0f00e 	mov	pc, lr

000089b8 <func2>:
    89b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    89bc:	e28db000 	add	fp, sp, #0
    89c0:	e24dd00c 	sub	sp, sp, #12
    89c4:	e50b0008 	str	r0, [fp, #-8]
    89c8:	e50b100c 	str	r1, [fp, #-12]
    89cc:	e51b200c 	ldr	r2, [fp, #-12]
    89d0:	e1a03002 	mov	r3, r2
    89d4:	e1a03103 	lsl	r3, r3, #2
    89d8:	e0833002 	add	r3, r3, r2
    89dc:	e1a02103 	lsl	r2, r3, #2
    89e0:	e0832002 	add	r2, r3, r2
    89e4:	e51b3008 	ldr	r3, [fp, #-8]
    89e8:	e0823003 	add	r3, r2, r3
    89ec:	e1a00003 	mov	r0, r3
    89f0:	e24bd000 	sub	sp, fp, #0
    89f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    89f8:	e12fff1e 	bx	lr

000089fc <unoptimized>:
    89fc:	e92d4870 	push	{r4, r5, r6, fp, lr}
    8a00:	e28db010 	add	fp, sp, #16
    8a04:	e24dd01c 	sub	sp, sp, #28
    8a08:	e50b0028 	str	r0, [fp, #-40]	; 0x28
    8a0c:	e3a03000 	mov	r3, #0
    8a10:	e50b3018 	str	r3, [fp, #-24]
    8a14:	ea000037 	b	8af8 <unoptimized+0xfc>
    8a18:	e3a03011 	mov	r3, #17
    8a1c:	e50b3020 	str	r3, [fp, #-32]
    8a20:	e3a03000 	mov	r3, #0
    8a24:	e50b301c 	str	r3, [fp, #-28]
    8a28:	ea00002c 	b	8ae0 <unoptimized+0xe4>
    8a2c:	e3a03002 	mov	r3, #2
    8a30:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a34:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8a38:	e2833001 	add	r3, r3, #1
    8a3c:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a40:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8a44:	e2432002 	sub	r2, r3, #2
    8a48:	e1a03002 	mov	r3, r2
    8a4c:	e1a03083 	lsl	r3, r3, #1
    8a50:	e0833002 	add	r3, r3, r2
    8a54:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a58:	e51b301c 	ldr	r3, [fp, #-28]
    8a5c:	e1a03103 	lsl	r3, r3, #2
    8a60:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a64:	e0824003 	add	r4, r2, r3
    8a68:	e51b301c 	ldr	r3, [fp, #-28]
    8a6c:	e1a03103 	lsl	r3, r3, #2
    8a70:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a74:	e0823003 	add	r3, r2, r3
    8a78:	e5933000 	ldr	r3, [r3]
    8a7c:	e51b2020 	ldr	r2, [fp, #-32]
    8a80:	e0030392 	mul	r3, r2, r3
    8a84:	e2835010 	add	r5, r3, #16
    8a88:	e51b3018 	ldr	r3, [fp, #-24]
    8a8c:	e1a03103 	lsl	r3, r3, #2
    8a90:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a94:	e0823003 	add	r3, r2, r3
    8a98:	e5936000 	ldr	r6, [r3]
    8a9c:	e51b0018 	ldr	r0, [fp, #-24]
    8aa0:	e51b101c 	ldr	r1, [fp, #-28]
    8aa4:	ebffffc3 	bl	89b8 <func2>
    8aa8:	e1a03000 	mov	r3, r0
    8aac:	e0030396 	mul	r3, r6, r3
    8ab0:	e0852003 	add	r2, r5, r3
    8ab4:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8ab8:	e0823003 	add	r3, r2, r3
    8abc:	e283200f 	add	r2, r3, #15
    8ac0:	e3530000 	cmp	r3, #0
    8ac4:	b1a03002 	movlt	r3, r2
    8ac8:	a1a03003 	movge	r3, r3
    8acc:	e1a03243 	asr	r3, r3, #4
    8ad0:	e5843000 	str	r3, [r4]
    8ad4:	e51b301c 	ldr	r3, [fp, #-28]
    8ad8:	e2833001 	add	r3, r3, #1
    8adc:	e50b301c 	str	r3, [fp, #-28]
    8ae0:	e51b301c 	ldr	r3, [fp, #-28]
    8ae4:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8ae8:	baffffcf 	blt	8a2c <unoptimized+0x30>
    8aec:	e51b3018 	ldr	r3, [fp, #-24]
    8af0:	e2833001 	add	r3, r3, #1
    8af4:	e50b3018 	str	r3, [fp, #-24]
    8af8:	e51b3018 	ldr	r3, [fp, #-24]
    8afc:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8b00:	baffffc4 	blt	8a18 <unoptimized+0x1c>
    8b04:	e24bd010 	sub	sp, fp, #16
    8b08:	e8bd4870 	pop	{r4, r5, r6, fp, lr}
    8b0c:	e12fff1e 	bx	lr

00008b10 <func>:
    8b10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b14:	e28db000 	add	fp, sp, #0
    8b18:	e24dd00c 	sub	sp, sp, #12
    8b1c:	e50b0008 	str	r0, [fp, #-8]
    8b20:	e50b100c 	str	r1, [fp, #-12]
    8b24:	e51b200c 	ldr	r2, [fp, #-12]
    8b28:	e1a03002 	mov	r3, r2
    8b2c:	e1a03103 	lsl	r3, r3, #2
    8b30:	e0833002 	add	r3, r3, r2
    8b34:	e1a02103 	lsl	r2, r3, #2
    8b38:	e0832002 	add	r2, r3, r2
    8b3c:	e51b3008 	ldr	r3, [fp, #-8]
    8b40:	e0823003 	add	r3, r2, r3
    8b44:	e1a00003 	mov	r0, r3
    8b48:	e24bd000 	sub	sp, fp, #0
    8b4c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b50:	e12fff1e 	bx	lr

00008b54 <optimize_me>:
    8b54:	e92d4870 	push	{r4, r5, r6, fp, lr}
    8b58:	e28db010 	add	fp, sp, #16
    8b5c:	e24dd01c 	sub	sp, sp, #28
    8b60:	e50b0028 	str	r0, [fp, #-40]	; 0x28
    8b64:	e3a03000 	mov	r3, #0
    8b68:	e50b3018 	str	r3, [fp, #-24]
    8b6c:	ea000037 	b	8c50 <optimize_me+0xfc>
    8b70:	e3a03011 	mov	r3, #17
    8b74:	e50b3020 	str	r3, [fp, #-32]
    8b78:	e3a03000 	mov	r3, #0
    8b7c:	e50b301c 	str	r3, [fp, #-28]
    8b80:	ea00002c 	b	8c38 <optimize_me+0xe4>
    8b84:	e3a03002 	mov	r3, #2
    8b88:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8b8c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8b90:	e2833001 	add	r3, r3, #1
    8b94:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8b98:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8b9c:	e2432002 	sub	r2, r3, #2
    8ba0:	e1a03002 	mov	r3, r2
    8ba4:	e1a03083 	lsl	r3, r3, #1
    8ba8:	e0833002 	add	r3, r3, r2
    8bac:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8bb0:	e51b301c 	ldr	r3, [fp, #-28]
    8bb4:	e1a03103 	lsl	r3, r3, #2
    8bb8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8bbc:	e0824003 	add	r4, r2, r3
    8bc0:	e51b301c 	ldr	r3, [fp, #-28]
    8bc4:	e1a03103 	lsl	r3, r3, #2
    8bc8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8bcc:	e0823003 	add	r3, r2, r3
    8bd0:	e5933000 	ldr	r3, [r3]
    8bd4:	e51b2020 	ldr	r2, [fp, #-32]
    8bd8:	e0030392 	mul	r3, r2, r3
    8bdc:	e2835010 	add	r5, r3, #16
    8be0:	e51b3018 	ldr	r3, [fp, #-24]
    8be4:	e1a03103 	lsl	r3, r3, #2
    8be8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8bec:	e0823003 	add	r3, r2, r3
    8bf0:	e5936000 	ldr	r6, [r3]
    8bf4:	e51b0018 	ldr	r0, [fp, #-24]
    8bf8:	e51b101c 	ldr	r1, [fp, #-28]
    8bfc:	ebffffc3 	bl	8b10 <func>
    8c00:	e1a03000 	mov	r3, r0
    8c04:	e0030396 	mul	r3, r6, r3
    8c08:	e0852003 	add	r2, r5, r3
    8c0c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8c10:	e0823003 	add	r3, r2, r3
    8c14:	e283200f 	add	r2, r3, #15
    8c18:	e3530000 	cmp	r3, #0
    8c1c:	b1a03002 	movlt	r3, r2
    8c20:	a1a03003 	movge	r3, r3
    8c24:	e1a03243 	asr	r3, r3, #4
    8c28:	e5843000 	str	r3, [r4]
    8c2c:	e51b301c 	ldr	r3, [fp, #-28]
    8c30:	e2833001 	add	r3, r3, #1
    8c34:	e50b301c 	str	r3, [fp, #-28]
    8c38:	e51b301c 	ldr	r3, [fp, #-28]
    8c3c:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8c40:	baffffcf 	blt	8b84 <optimize_me+0x30>
    8c44:	e51b3018 	ldr	r3, [fp, #-24]
    8c48:	e2833001 	add	r3, r3, #1
    8c4c:	e50b3018 	str	r3, [fp, #-24]
    8c50:	e51b3018 	ldr	r3, [fp, #-24]
    8c54:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8c58:	baffffc4 	blt	8b70 <optimize_me+0x1c>
    8c5c:	e24bd010 	sub	sp, fp, #16
    8c60:	e8bd4870 	pop	{r4, r5, r6, fp, lr}
    8c64:	e12fff1e 	bx	lr

00008c68 <__aeabi_uldivmod>:
    8c68:	e3530000 	cmp	r3, #0
    8c6c:	03520000 	cmpeq	r2, #0
    8c70:	1a000004 	bne	8c88 <__aeabi_uldivmod+0x20>
    8c74:	e3510000 	cmp	r1, #0
    8c78:	03500000 	cmpeq	r0, #0
    8c7c:	13e01000 	mvnne	r1, #0
    8c80:	13e00000 	mvnne	r0, #0
    8c84:	ea000027 	b	8d28 <__aeabi_idiv0>
    8c88:	e24dd008 	sub	sp, sp, #8
    8c8c:	e92d6000 	push	{sp, lr}
    8c90:	eb000014 	bl	8ce8 <__gnu_uldivmod_helper>
    8c94:	e59de004 	ldr	lr, [sp, #4]
    8c98:	e28dd008 	add	sp, sp, #8
    8c9c:	e8bd000c 	pop	{r2, r3}
    8ca0:	e12fff1e 	bx	lr

00008ca4 <__gnu_ldivmod_helper>:
    8ca4:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8ca8:	e59d6020 	ldr	r6, [sp, #32]
    8cac:	e1a07002 	mov	r7, r2
    8cb0:	e1a0a003 	mov	sl, r3
    8cb4:	e1a04000 	mov	r4, r0
    8cb8:	e1a05001 	mov	r5, r1
    8cbc:	eb00001a 	bl	8d2c <__divdi3>
    8cc0:	e1a03000 	mov	r3, r0
    8cc4:	e0020197 	mul	r2, r7, r1
    8cc8:	e0898097 	umull	r8, r9, r7, r0
    8ccc:	e023239a 	mla	r3, sl, r3, r2
    8cd0:	e0544008 	subs	r4, r4, r8
    8cd4:	e0839009 	add	r9, r3, r9
    8cd8:	e0c55009 	sbc	r5, r5, r9
    8cdc:	e8860030 	stm	r6, {r4, r5}
    8ce0:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8ce4:	e12fff1e 	bx	lr

00008ce8 <__gnu_uldivmod_helper>:
    8ce8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8cec:	e59d5018 	ldr	r5, [sp, #24]
    8cf0:	e1a04002 	mov	r4, r2
    8cf4:	e1a08003 	mov	r8, r3
    8cf8:	e1a06000 	mov	r6, r0
    8cfc:	e1a07001 	mov	r7, r1
    8d00:	eb000067 	bl	8ea4 <__udivdi3>
    8d04:	e0080890 	mul	r8, r0, r8
    8d08:	e0832490 	umull	r2, r3, r0, r4
    8d0c:	e0248491 	mla	r4, r1, r4, r8
    8d10:	e0566002 	subs	r6, r6, r2
    8d14:	e0843003 	add	r3, r4, r3
    8d18:	e0c77003 	sbc	r7, r7, r3
    8d1c:	e88500c0 	stm	r5, {r6, r7}
    8d20:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8d24:	e12fff1e 	bx	lr

00008d28 <__aeabi_idiv0>:
    8d28:	e12fff1e 	bx	lr

00008d2c <__divdi3>:
    8d2c:	e3510000 	cmp	r1, #0
    8d30:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8d34:	a1a04000 	movge	r4, r0
    8d38:	a1a05001 	movge	r5, r1
    8d3c:	a3a0a000 	movge	sl, #0
    8d40:	ba000053 	blt	8e94 <__divdi3+0x168>
    8d44:	e3530000 	cmp	r3, #0
    8d48:	a1a08002 	movge	r8, r2
    8d4c:	a1a09003 	movge	r9, r3
    8d50:	ba00004b 	blt	8e84 <__divdi3+0x158>
    8d54:	e1550009 	cmp	r5, r9
    8d58:	01540008 	cmpeq	r4, r8
    8d5c:	33a02000 	movcc	r2, #0
    8d60:	33a03000 	movcc	r3, #0
    8d64:	3a00003b 	bcc	8e58 <__divdi3+0x12c>
    8d68:	e1a01009 	mov	r1, r9
    8d6c:	e1a00008 	mov	r0, r8
    8d70:	eb000093 	bl	8fc4 <__clzdi2>
    8d74:	e1a01005 	mov	r1, r5
    8d78:	e1a0b000 	mov	fp, r0
    8d7c:	e1a00004 	mov	r0, r4
    8d80:	eb00008f 	bl	8fc4 <__clzdi2>
    8d84:	e060000b 	rsb	r0, r0, fp
    8d88:	e240e020 	sub	lr, r0, #32
    8d8c:	e1a07019 	lsl	r7, r9, r0
    8d90:	e1877e18 	orr	r7, r7, r8, lsl lr
    8d94:	e260c020 	rsb	ip, r0, #32
    8d98:	e1877c38 	orr	r7, r7, r8, lsr ip
    8d9c:	e1550007 	cmp	r5, r7
    8da0:	e1a06018 	lsl	r6, r8, r0
    8da4:	01540006 	cmpeq	r4, r6
    8da8:	e1a01000 	mov	r1, r0
    8dac:	33a02000 	movcc	r2, #0
    8db0:	33a03000 	movcc	r3, #0
    8db4:	3a000005 	bcc	8dd0 <__divdi3+0xa4>
    8db8:	e3a08001 	mov	r8, #1
    8dbc:	e0544006 	subs	r4, r4, r6
    8dc0:	e1a03e18 	lsl	r3, r8, lr
    8dc4:	e1833c38 	orr	r3, r3, r8, lsr ip
    8dc8:	e0c55007 	sbc	r5, r5, r7
    8dcc:	e1a02018 	lsl	r2, r8, r0
    8dd0:	e3500000 	cmp	r0, #0
    8dd4:	0a00001f 	beq	8e58 <__divdi3+0x12c>
    8dd8:	e1b070a7 	lsrs	r7, r7, #1
    8ddc:	e1a06066 	rrx	r6, r6
    8de0:	ea000007 	b	8e04 <__divdi3+0xd8>
    8de4:	e0544006 	subs	r4, r4, r6
    8de8:	e0c55007 	sbc	r5, r5, r7
    8dec:	e0944004 	adds	r4, r4, r4
    8df0:	e0a55005 	adc	r5, r5, r5
    8df4:	e2944001 	adds	r4, r4, #1
    8df8:	e2a55000 	adc	r5, r5, #0
    8dfc:	e2500001 	subs	r0, r0, #1
    8e00:	0a000006 	beq	8e20 <__divdi3+0xf4>
    8e04:	e1570005 	cmp	r7, r5
    8e08:	01560004 	cmpeq	r6, r4
    8e0c:	9afffff4 	bls	8de4 <__divdi3+0xb8>
    8e10:	e0944004 	adds	r4, r4, r4
    8e14:	e0a55005 	adc	r5, r5, r5
    8e18:	e2500001 	subs	r0, r0, #1
    8e1c:	1afffff8 	bne	8e04 <__divdi3+0xd8>
    8e20:	e261c020 	rsb	ip, r1, #32
    8e24:	e1a00134 	lsr	r0, r4, r1
    8e28:	e0922004 	adds	r2, r2, r4
    8e2c:	e241e020 	sub	lr, r1, #32
    8e30:	e1800c15 	orr	r0, r0, r5, lsl ip
    8e34:	e1a04135 	lsr	r4, r5, r1
    8e38:	e1800e35 	orr	r0, r0, r5, lsr lr
    8e3c:	e1a07114 	lsl	r7, r4, r1
    8e40:	e1877e10 	orr	r7, r7, r0, lsl lr
    8e44:	e1a06110 	lsl	r6, r0, r1
    8e48:	e0a33005 	adc	r3, r3, r5
    8e4c:	e1877c30 	orr	r7, r7, r0, lsr ip
    8e50:	e0522006 	subs	r2, r2, r6
    8e54:	e0c33007 	sbc	r3, r3, r7
    8e58:	e29a0000 	adds	r0, sl, #0
    8e5c:	13a00001 	movne	r0, #1
    8e60:	e3a01000 	mov	r1, #0
    8e64:	e2704000 	rsbs	r4, r0, #0
    8e68:	e2e15000 	rsc	r5, r1, #0
    8e6c:	e0222004 	eor	r2, r2, r4
    8e70:	e0233005 	eor	r3, r3, r5
    8e74:	e0900002 	adds	r0, r0, r2
    8e78:	e0a11003 	adc	r1, r1, r3
    8e7c:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8e80:	e12fff1e 	bx	lr
    8e84:	e2728000 	rsbs	r8, r2, #0
    8e88:	e1e0a00a 	mvn	sl, sl
    8e8c:	e2e39000 	rsc	r9, r3, #0
    8e90:	eaffffaf 	b	8d54 <__divdi3+0x28>
    8e94:	e2704000 	rsbs	r4, r0, #0
    8e98:	e2e15000 	rsc	r5, r1, #0
    8e9c:	e3e0a000 	mvn	sl, #0
    8ea0:	eaffffa7 	b	8d44 <__divdi3+0x18>

00008ea4 <__udivdi3>:
    8ea4:	e1510003 	cmp	r1, r3
    8ea8:	01500002 	cmpeq	r0, r2
    8eac:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8eb0:	e1a04000 	mov	r4, r0
    8eb4:	e1a05001 	mov	r5, r1
    8eb8:	e1a08002 	mov	r8, r2
    8ebc:	e1a09003 	mov	r9, r3
    8ec0:	33a00000 	movcc	r0, #0
    8ec4:	33a01000 	movcc	r1, #0
    8ec8:	3a00003b 	bcc	8fbc <__udivdi3+0x118>
    8ecc:	e1a01003 	mov	r1, r3
    8ed0:	e1a00002 	mov	r0, r2
    8ed4:	eb00003a 	bl	8fc4 <__clzdi2>
    8ed8:	e1a01005 	mov	r1, r5
    8edc:	e1a0a000 	mov	sl, r0
    8ee0:	e1a00004 	mov	r0, r4
    8ee4:	eb000036 	bl	8fc4 <__clzdi2>
    8ee8:	e060300a 	rsb	r3, r0, sl
    8eec:	e243e020 	sub	lr, r3, #32
    8ef0:	e1a07319 	lsl	r7, r9, r3
    8ef4:	e1877e18 	orr	r7, r7, r8, lsl lr
    8ef8:	e263c020 	rsb	ip, r3, #32
    8efc:	e1877c38 	orr	r7, r7, r8, lsr ip
    8f00:	e1550007 	cmp	r5, r7
    8f04:	e1a06318 	lsl	r6, r8, r3
    8f08:	01540006 	cmpeq	r4, r6
    8f0c:	e1a02003 	mov	r2, r3
    8f10:	33a00000 	movcc	r0, #0
    8f14:	33a01000 	movcc	r1, #0
    8f18:	3a000005 	bcc	8f34 <__udivdi3+0x90>
    8f1c:	e3a08001 	mov	r8, #1
    8f20:	e0544006 	subs	r4, r4, r6
    8f24:	e1a01e18 	lsl	r1, r8, lr
    8f28:	e1811c38 	orr	r1, r1, r8, lsr ip
    8f2c:	e0c55007 	sbc	r5, r5, r7
    8f30:	e1a00318 	lsl	r0, r8, r3
    8f34:	e3530000 	cmp	r3, #0
    8f38:	0a00001f 	beq	8fbc <__udivdi3+0x118>
    8f3c:	e1b070a7 	lsrs	r7, r7, #1
    8f40:	e1a06066 	rrx	r6, r6
    8f44:	ea000007 	b	8f68 <__udivdi3+0xc4>
    8f48:	e0544006 	subs	r4, r4, r6
    8f4c:	e0c55007 	sbc	r5, r5, r7
    8f50:	e0944004 	adds	r4, r4, r4
    8f54:	e0a55005 	adc	r5, r5, r5
    8f58:	e2944001 	adds	r4, r4, #1
    8f5c:	e2a55000 	adc	r5, r5, #0
    8f60:	e2533001 	subs	r3, r3, #1
    8f64:	0a000006 	beq	8f84 <__udivdi3+0xe0>
    8f68:	e1570005 	cmp	r7, r5
    8f6c:	01560004 	cmpeq	r6, r4
    8f70:	9afffff4 	bls	8f48 <__udivdi3+0xa4>
    8f74:	e0944004 	adds	r4, r4, r4
    8f78:	e0a55005 	adc	r5, r5, r5
    8f7c:	e2533001 	subs	r3, r3, #1
    8f80:	1afffff8 	bne	8f68 <__udivdi3+0xc4>
    8f84:	e0948000 	adds	r8, r4, r0
    8f88:	e0a59001 	adc	r9, r5, r1
    8f8c:	e1a03234 	lsr	r3, r4, r2
    8f90:	e2621020 	rsb	r1, r2, #32
    8f94:	e2420020 	sub	r0, r2, #32
    8f98:	e1833115 	orr	r3, r3, r5, lsl r1
    8f9c:	e1a0c235 	lsr	ip, r5, r2
    8fa0:	e1833035 	orr	r3, r3, r5, lsr r0
    8fa4:	e1a0721c 	lsl	r7, ip, r2
    8fa8:	e1877013 	orr	r7, r7, r3, lsl r0
    8fac:	e1a06213 	lsl	r6, r3, r2
    8fb0:	e1877133 	orr	r7, r7, r3, lsr r1
    8fb4:	e0580006 	subs	r0, r8, r6
    8fb8:	e0c91007 	sbc	r1, r9, r7
    8fbc:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8fc0:	e12fff1e 	bx	lr

00008fc4 <__clzdi2>:
    8fc4:	e92d4010 	push	{r4, lr}
    8fc8:	e3510000 	cmp	r1, #0
    8fcc:	1a000002 	bne	8fdc <__clzdi2+0x18>
    8fd0:	eb000005 	bl	8fec <__clzsi2>
    8fd4:	e2800020 	add	r0, r0, #32
    8fd8:	ea000001 	b	8fe4 <__clzdi2+0x20>
    8fdc:	e1a00001 	mov	r0, r1
    8fe0:	eb000001 	bl	8fec <__clzsi2>
    8fe4:	e8bd4010 	pop	{r4, lr}
    8fe8:	e12fff1e 	bx	lr

00008fec <__clzsi2>:
    8fec:	e3a0101c 	mov	r1, #28
    8ff0:	e3500801 	cmp	r0, #65536	; 0x10000
    8ff4:	21a00820 	lsrcs	r0, r0, #16
    8ff8:	22411010 	subcs	r1, r1, #16
    8ffc:	e3500c01 	cmp	r0, #256	; 0x100
    9000:	21a00420 	lsrcs	r0, r0, #8
    9004:	22411008 	subcs	r1, r1, #8
    9008:	e3500010 	cmp	r0, #16
    900c:	21a00220 	lsrcs	r0, r0, #4
    9010:	22411004 	subcs	r1, r1, #4
    9014:	e28f2008 	add	r2, pc, #8
    9018:	e7d20000 	ldrb	r0, [r2, r0]
    901c:	e0800001 	add	r0, r0, r1
    9020:	e12fff1e 	bx	lr
    9024:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    9028:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

0000a000 <__rodata_start>:
    a000:	2b2b2b2b 	blcs	ad4cb4 <__user_program+0x7d4cb4>
    a004:	4f2b2b2b 	svcmi	0x002b2b2b
    a008:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
    a00c:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
    a010:	6e754620 	cdpvs	6, 7, cr4, cr5, cr0, {1}
    a014:	6f697463 	svcvs	0x00697463
    a018:	2b2b2b6e 	blcs	ad4dd8 <__user_program+0x7d4dd8>
    a01c:	2b2b2b2b 	blcs	ad4cd0 <__user_program+0x7d4cd0>
    a020:	0000000a 	andeq	r0, r0, sl

0000a024 <.LC1>:
    a024:	000a6425 	andeq	r6, sl, r5, lsr #8

0000a028 <.LC2>:
    a028:	2b2b2b2b 	blcs	ad4cdc <__user_program+0x7d4cdc>
    a02c:	552b2b2b 	strpl	r2, [fp, #-2859]!	; 0xb2b
    a030:	74706f6e 	ldrbtvc	r6, [r0], #-3950	; 0xf6e
    a034:	7a696d69 	bvc	1a655e0 <__user_program+0x17655e0>
    a038:	46206465 	strtmi	r6, [r0], -r5, ror #8
    a03c:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xe75
    a040:	2b6e6f69 	blcs	1ba5dec <__user_program+0x18a5dec>
    a044:	2b2b2b2b 	blcs	ad4cf8 <__user_program+0x7d4cf8>
    a048:	000a2b2b 	andeq	r2, sl, fp, lsr #22

0000a04c <.LC3>:
    a04c:	2b2b2b2b 	blcs	ad4d00 <__user_program+0x7d4d00>
    a050:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    a054:	20747365 	rsbscs	r7, r4, r5, ror #6
    a058:	6c696146 	stfvse	f6, [r9], #-280	; 0xfffffee8
    a05c:	2b2b6465 	blcs	ae31f8 <__user_program+0x7e31f8>
    a060:	2b2b2b2b 	blcs	ad4d14 <__user_program+0x7d4d14>
    a064:	00000a2b 	andeq	r0, r0, fp, lsr #20

0000a068 <.LC4>:
    a068:	2b2b2b2b 	blcs	ad4d1c <__user_program+0x7d4d1c>
    a06c:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    a070:	20747365 	rsbscs	r7, r4, r5, ror #6
    a074:	73736150 	cmnvc	r3, #80, 2
    a078:	2b2b6465 	blcs	ae3214 <__user_program+0x7e3214>
    a07c:	2b2b2b2b 	blcs	ad4d30 <__user_program+0x7d4d30>
    a080:	00000a2b 	andeq	r0, r0, fp, lsr #20

0000a084 <.LC0>:
    a084:	00000030 	andeq	r0, r0, r0, lsr r0

0000a088 <.LC1>:
    a088:	Address 0x0000a088 is out of bounds.


Disassembly of section .ARM.exidx:

0000a08c <.ARM.exidx>:
    a08c:	7fffeca0 	svcvc	0x00ffeca0
    a090:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000b000 <__data_start>:
    b000:	3f200000 	svccc	0x00200000

0000b004 <digits>:
    b004:	33323130 	teqcc	r2, #48, 2
    b008:	37363534 			; <UNDEFINED> instruction: 0x37363534
    b00c:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    b010:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .bss:

0000c000 <__bss_start>:
	...

0000c7d0 <array1>:
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
  6c:	4a070802 	bmi	1c207c <__end+0x9407c>
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
 154:	b0000305 	andlt	r0, r0, r5, lsl #6
 158:	040b0000 	streq	r0, [fp], #-0
 15c:	00000160 	andeq	r0, r0, r0, ror #2
 160:	00005a0c 	andeq	r5, r0, ip, lsl #20
 164:	00dd0000 	sbcseq	r0, sp, r0
 168:	00040000 	andeq	r0, r4, r0
 16c:	000000b7 	strheq	r0, [r0], -r7
 170:	00a30104 	adceq	r0, r3, r4, lsl #2
 174:	5c010000 	stcpl	0, cr0, [r1], {-0}
 178:	1c000001 	stcne	0, cr0, [r0], {1}
 17c:	74000000 	strvc	r0, [r0], #-0
 180:	58000083 	stmdapl	r0, {r0, r1, r7}
 184:	96000001 	strls	r0, [r0], -r1
 188:	02000000 	andeq	r0, r0, #0
 18c:	00820801 	addeq	r0, r2, r1, lsl #16
 190:	02020000 	andeq	r0, r2, #0
 194:	00013805 	andeq	r3, r1, r5, lsl #16
 198:	05040300 	streq	r0, [r4, #-768]	; 0x300
 19c:	00746e69 	rsbseq	r6, r4, r9, ror #28
 1a0:	00050802 	andeq	r0, r5, r2, lsl #16
 1a4:	02000000 	andeq	r0, r0, #0
 1a8:	00790801 	rsbseq	r0, r9, r1, lsl #16
 1ac:	02020000 	andeq	r0, r2, #0
 1b0:	00009007 	andeq	r9, r0, r7
 1b4:	00870400 	addeq	r0, r7, r0, lsl #8
 1b8:	1a020000 	bne	801c0 <__bss_end+0x731c0>
 1bc:	0000005a 	andeq	r0, r0, sl, asr r0
 1c0:	54070402 	strpl	r0, [r7], #-1026	; 0x402
 1c4:	02000000 	andeq	r0, r0, #0
 1c8:	004a0708 	subeq	r0, sl, r8, lsl #14
 1cc:	8f050000 	svchi	0x00050000
 1d0:	01000001 	tsteq	r0, r1
 1d4:	00837417 	addeq	r7, r3, r7, lsl r4
 1d8:	00015800 	andeq	r5, r1, r0, lsl #16
 1dc:	a69c0100 	ldrge	r0, [ip], r0, lsl #2
 1e0:	06000000 	streq	r0, [r0], -r0
 1e4:	19010069 	stmdbne	r1, {r0, r3, r5, r6}
 1e8:	00000033 	andeq	r0, r0, r3, lsr r0
 1ec:	07749102 	ldrbeq	r9, [r4, -r2, lsl #2]!
 1f0:	0000019b 	muleq	r0, fp, r1
 1f4:	00331901 	eorseq	r1, r3, r1, lsl #18
 1f8:	91020000 	mrsls	r0, (UNDEF: 2)
 1fc:	01840770 	orreq	r0, r4, r0, ror r7
 200:	1a010000 	bne	40208 <__bss_end+0x33208>
 204:	0000004f 	andeq	r0, r0, pc, asr #32
 208:	006c9102 	rsbeq	r9, ip, r2, lsl #2
 20c:	00003308 	andeq	r3, r0, r8, lsl #6
 210:	0000b700 	andeq	fp, r0, r0, lsl #14
 214:	00b70900 	adcseq	r0, r7, r0, lsl #18
 218:	01f30000 	mvnseq	r0, r0
 21c:	07040200 	streq	r0, [r4, -r0, lsl #4]
 220:	000001a0 	andeq	r0, r0, r0, lsr #3
 224:	0001550a 	andeq	r5, r1, sl, lsl #10
 228:	a6120100 	ldrge	r0, [r2], -r0, lsl #2
 22c:	05000000 	streq	r0, [r0, #-0]
 230:	00c7d003 	sbceq	sp, r7, r3
 234:	017d0a00 	cmneq	sp, r0, lsl #20
 238:	12010000 	andne	r0, r1, #0
 23c:	000000a6 	andeq	r0, r0, r6, lsr #1
 240:	c0000305 	andgt	r0, r0, r5, lsl #6
 244:	35000000 	strcc	r0, [r0, #-0]
 248:	04000002 	streq	r0, [r0], #-2
 24c:	00014900 	andeq	r4, r1, r0, lsl #18
 250:	a3010400 	movwge	r0, #5120	; 0x1400
 254:	01000000 	mrseq	r0, (UNDEF: 0)
 258:	000001e2 	andeq	r0, r0, r2, ror #3
 25c:	0000001c 	andeq	r0, r0, ip, lsl r0
 260:	000084cc 	andeq	r8, r0, ip, asr #9
 264:	00000388 	andeq	r0, r0, r8, lsl #7
 268:	00000148 	andeq	r0, r0, r8, asr #2
 26c:	00007202 	andeq	r7, r0, r2, lsl #4
 270:	300e0200 	andcc	r0, lr, r0, lsl #4
 274:	03000000 	movweq	r0, #0
 278:	00820801 	addeq	r0, r2, r1, lsl #16
 27c:	02030000 	andeq	r0, r3, #0
 280:	00013805 	andeq	r3, r1, r5, lsl #16
 284:	00880200 	addeq	r0, r8, r0, lsl #4
 288:	12020000 	andne	r0, r2, #0
 28c:	00000049 	andeq	r0, r0, r9, asr #32
 290:	69050404 	stmdbvs	r5, {r2, sl}
 294:	0300746e 	movweq	r7, #1134	; 0x46e
 298:	00000508 	andeq	r0, r0, r8, lsl #10
 29c:	71020000 	mrsvc	r0, (UNDEF: 2)
 2a0:	02000000 	andeq	r0, r0, #0
 2a4:	00006216 	andeq	r6, r0, r6, lsl r2
 2a8:	08010300 	stmdaeq	r1, {r8, r9}
 2ac:	00000079 	andeq	r0, r0, r9, ror r0
 2b0:	90070203 	andls	r0, r7, r3, lsl #4
 2b4:	02000000 	andeq	r0, r0, #0
 2b8:	00000087 	andeq	r0, r0, r7, lsl #1
 2bc:	007b1a02 	rsbseq	r1, fp, r2, lsl #20
 2c0:	04030000 	streq	r0, [r3], #-0
 2c4:	00005407 	andeq	r5, r0, r7, lsl #8
 2c8:	01b90200 			; <UNDEFINED> instruction: 0x01b90200
 2cc:	1c020000 	stcne	0, cr0, [r2], {-0}
 2d0:	0000008d 	andeq	r0, r0, sp, lsl #1
 2d4:	4a070803 	bmi	1c22e8 <__end+0x942e8>
 2d8:	02000000 	andeq	r0, r0, #0
 2dc:	000001c9 	andeq	r0, r0, r9, asr #3
 2e0:	009f1303 	addseq	r1, pc, r3, lsl #6
 2e4:	c7050000 	strgt	r0, [r5, -r0]
 2e8:	04000001 	streq	r0, [r0], #-1
 2ec:	00b60004 	adcseq	r0, r6, r4
 2f0:	0f060000 	svceq	0x00060000
 2f4:	b6000002 	strlt	r0, [r0], -r2
 2f8:	00000000 	andeq	r0, r0, r0
 2fc:	08040700 	stmdaeq	r4, {r8, r9, sl}
 300:	000001d1 	ldrdeq	r0, [r0], -r1
 304:	84cc2101 	strbhi	r2, [ip], #257	; 0x101
 308:	01380000 	teqeq	r8, r0
 30c:	9c010000 	stcls	0, cr0, [r1], {-0}
 310:	00000114 	andeq	r0, r0, r4, lsl r1
 314:	0001c209 	andeq	ip, r1, r9, lsl #4
 318:	57210100 	strpl	r0, [r1, -r0, lsl #2]!
 31c:	02000000 	andeq	r0, r0, #0
 320:	6e0a5f91 	mcrvs	15, 0, r5, cr10, cr1, {4}
 324:	01006d75 	tsteq	r0, r5, ror sp
 328:	00008221 	andeq	r8, r0, r1, lsr #4
 32c:	50910200 	addspl	r0, r1, r0, lsl #4
 330:	0001b20b 	andeq	fp, r1, fp, lsl #4
 334:	14220100 	strtne	r0, [r2], #-256	; 0x100
 338:	02000001 	andeq	r0, r0, #1
 33c:	620c6c91 	andvs	r6, ip, #37120	; 0x9100
 340:	01006675 	tsteq	r0, r5, ror r6
 344:	00011a23 	andeq	r1, r1, r3, lsr #20
 348:	60910200 	addsvs	r0, r1, r0, lsl #4
 34c:	7274700c 	rsbsvc	r7, r4, #12
 350:	14240100 	strtne	r0, [r4], #-256	; 0x100
 354:	02000001 	andeq	r0, r0, #1
 358:	0d006891 	stceq	8, cr6, [r0, #-580]	; 0xfffffdbc
 35c:	00002504 	andeq	r2, r0, r4, lsl #10
 360:	00250e00 	eoreq	r0, r5, r0, lsl #28
 364:	012a0000 	teqeq	sl, r0
 368:	2a0f0000 	bcs	3c0370 <__user_program+0xc0370>
 36c:	07000001 	streq	r0, [r0, -r1]
 370:	07040300 	streq	r0, [r4, -r0, lsl #6]
 374:	000001a0 	andeq	r0, r0, r0, lsr #3
 378:	00020310 	andeq	r0, r2, r0, lsl r3
 37c:	493f0100 	ldmdbmi	pc!, {r8}	; <UNPREDICTABLE>
 380:	04000000 	streq	r0, [r0], #-0
 384:	50000086 	andpl	r0, r0, r6, lsl #1
 388:	01000002 	tsteq	r0, r2
 38c:	00020c9c 	muleq	r2, ip, ip
 390:	6d660a00 	vstmdbvs	r6!, {s1-s0}
 394:	3f010074 	svccc	0x00010074
 398:	0000020c 	andeq	r0, r0, ip, lsl #4
 39c:	11709102 	cmnne	r0, r2, lsl #2
 3a0:	00020a0b 	andeq	r0, r2, fp, lsl #20
 3a4:	94400100 	strbls	r0, [r0], #-256	; 0x100
 3a8:	02000000 	andeq	r0, r0, #0
 3ac:	bc124c91 	ldclt	12, cr4, [r2], {145}	; 0x91
 3b0:	5c000086 	stcpl	0, cr0, [r0], {134}	; 0x86
 3b4:	83000000 	movwhi	r0, #0
 3b8:	0c000001 	stceq	0, cr0, [r0], {1}
 3bc:	006d756e 	rsbeq	r7, sp, lr, ror #10
 3c0:	003e5001 	eorseq	r5, lr, r1
 3c4:	91020000 	mrsls	r0, (UNDEF: 2)
 3c8:	18120060 	ldmdane	r2, {r5, r6}
 3cc:	2c000087 	stccs	0, cr0, [r0], {135}	; 0x87
 3d0:	9f000000 	svcls	0x00000000
 3d4:	0c000001 	stceq	0, cr0, [r0], {1}
 3d8:	006d756e 	rsbeq	r7, sp, lr, ror #10
 3dc:	00705b01 	rsbseq	r5, r0, r1, lsl #22
 3e0:	91020000 	mrsls	r0, (UNDEF: 2)
 3e4:	4412005c 	ldrmi	r0, [r2], #-92	; 0x5c
 3e8:	2c000087 	stccs	0, cr0, [r0], {135}	; 0x87
 3ec:	bb000000 	bllt	3f4 <__start-0x7c0c>
 3f0:	0c000001 	stceq	0, cr0, [r0], {1}
 3f4:	006d756e 	rsbeq	r7, sp, lr, ror #10
 3f8:	00706101 	rsbseq	r6, r0, r1, lsl #2
 3fc:	91020000 	mrsls	r0, (UNDEF: 2)
 400:	70120058 	andsvc	r0, r2, r8, asr r0
 404:	2c000087 	stccs	0, cr0, [r0], {135}	; 0x87
 408:	d7000000 	strle	r0, [r0, -r0]
 40c:	0c000001 	stceq	0, cr0, [r0], {1}
 410:	006d756e 	rsbeq	r7, sp, lr, ror #10
 414:	00706801 	rsbseq	r6, r0, r1, lsl #16
 418:	91020000 	mrsls	r0, (UNDEF: 2)
 41c:	9c120054 	ldcls	0, cr0, [r2], {84}	; 0x54
 420:	48000087 	stmdami	r0, {r0, r1, r2, r7}
 424:	f3000000 	vhadd.u8	d0, d0, d0
 428:	0b000001 	bleq	434 <__start-0x7bcc>
 42c:	000001a9 	andeq	r0, r0, r9, lsr #3
 430:	01146e01 	tsteq	r4, r1, lsl #28
 434:	91020000 	mrsls	r0, (UNDEF: 2)
 438:	e4130064 	ldr	r0, [r3], #-100	; 0x64
 43c:	28000087 	stmdacs	r0, {r0, r1, r2, r7}
 440:	0b000000 	bleq	448 <__start-0x7bb8>
 444:	0000021d 	andeq	r0, r0, sp, lsl r2
 448:	003e7701 	eorseq	r7, lr, r1, lsl #14
 44c:	91020000 	mrsls	r0, (UNDEF: 2)
 450:	0d000050 	stceq	0, cr0, [r0, #-320]	; 0xfffffec0
 454:	00021204 	andeq	r1, r2, r4, lsl #4
 458:	00301400 	eorseq	r1, r0, r0, lsl #8
 45c:	300e0000 	andcc	r0, lr, r0
 460:	27000000 	strcs	r0, [r0, -r0]
 464:	0f000002 	svceq	0x00000002
 468:	0000012a 	andeq	r0, r0, sl, lsr #2
 46c:	db0b0010 	blle	2c04b4 <__end+0x1924b4>
 470:	01000001 	tsteq	r0, r1
 474:	00021718 	andeq	r1, r2, r8, lsl r7
 478:	04030500 	streq	r0, [r3], #-1280	; 0x500
 47c:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 480:	000000c0 	andeq	r0, r0, r0, asr #1
 484:	024e0004 	subeq	r0, lr, #4
 488:	01040000 	mrseq	r0, (UNDEF: 4)
 48c:	000000a3 	andeq	r0, r0, r3, lsr #1
 490:	00022201 	andeq	r2, r2, r1, lsl #4
 494:	00001c00 	andeq	r1, r0, r0, lsl #24
 498:	00885400 	addeq	r5, r8, r0, lsl #8
 49c:	00006400 	andeq	r6, r0, r0, lsl #8
 4a0:	00022200 	andeq	r2, r2, r0, lsl #4
 4a4:	08010200 	stmdaeq	r1, {r9}
 4a8:	00000082 	andeq	r0, r0, r2, lsl #1
 4ac:	38050202 	stmdacc	r5, {r1, r9}
 4b0:	03000001 	movweq	r0, #1
 4b4:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 4b8:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 4bc:	00000005 	andeq	r0, r0, r5
 4c0:	00710400 	rsbseq	r0, r1, r0, lsl #8
 4c4:	16020000 	strne	r0, [r2], -r0
 4c8:	0000004c 	andeq	r0, r0, ip, asr #32
 4cc:	79080102 	stmdbvc	r8, {r1, r8}
 4d0:	02000000 	andeq	r0, r0, #0
 4d4:	00900702 	addseq	r0, r0, r2, lsl #14
 4d8:	04020000 	streq	r0, [r2], #-0
 4dc:	00005407 	andeq	r5, r0, r7, lsl #8
 4e0:	07080200 	streq	r0, [r8, -r0, lsl #4]
 4e4:	0000004a 	andeq	r0, r0, sl, asr #32
 4e8:	00024105 	andeq	r4, r2, r5, lsl #2
 4ec:	540d0100 	strpl	r0, [sp], #-256	; 0x100
 4f0:	14000088 	strne	r0, [r0], #-136	; 0x88
 4f4:	01000000 	mrseq	r0, (UNDEF: 0)
 4f8:	0259059c 	subseq	r0, r9, #156, 10	; 0x27000000
 4fc:	11010000 	mrsne	r0, (UNDEF: 1)
 500:	00008868 	andeq	r8, r0, r8, ror #16
 504:	00000014 	andeq	r0, r0, r4, lsl r0
 508:	4b069c01 	blmi	1a7514 <__end+0x79514>
 50c:	01000002 	tsteq	r0, r2
 510:	00887c15 	addeq	r7, r8, r5, lsl ip
 514:	00002000 	andeq	r2, r0, r0
 518:	ae9c0100 	fmlgee	f0, f4, f0
 51c:	07000000 	streq	r0, [r0, -r0]
 520:	0000021d 	andeq	r0, r0, sp, lsl r2
 524:	00411501 	subeq	r1, r1, r1, lsl #10
 528:	91020000 	mrsls	r0, (UNDEF: 2)
 52c:	14080077 	strne	r0, [r8], #-119	; 0x77
 530:	01000002 	tsteq	r0, r2
 534:	00004119 	andeq	r4, r0, r9, lsl r1
 538:	00889c00 	addeq	r9, r8, r0, lsl #24
 53c:	00001c00 	andeq	r1, r0, r0, lsl #24
 540:	009c0100 	addseq	r0, ip, r0, lsl #2
 544:	000000d5 	ldrdeq	r0, [r0], -r5
 548:	02e00004 	rsceq	r0, r0, #4
 54c:	01040000 	mrseq	r0, (UNDEF: 4)
 550:	000000a3 	andeq	r0, r0, r3, lsr #1
 554:	00027801 	andeq	r7, r2, r1, lsl #16
 558:	00001c00 	andeq	r1, r0, r0, lsl #24
 55c:	0088b800 	addeq	fp, r8, r0, lsl #16
 560:	00008800 	andeq	r8, r0, r0, lsl #16
 564:	00029500 	andeq	r9, r2, r0, lsl #10
 568:	08010200 	stmdaeq	r1, {r9}
 56c:	00000082 	andeq	r0, r0, r2, lsl #1
 570:	38050202 	stmdacc	r5, {r1, r9}
 574:	03000001 	movweq	r0, #1
 578:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 57c:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 580:	00000005 	andeq	r0, r0, r5
 584:	08010200 	stmdaeq	r1, {r9}
 588:	00000079 	andeq	r0, r0, r9, ror r0
 58c:	90070202 	andls	r0, r7, r2, lsl #4
 590:	04000000 	streq	r0, [r0], #-0
 594:	00000087 	andeq	r0, r0, r7, lsl #1
 598:	005a1a02 	subseq	r1, sl, r2, lsl #20
 59c:	04020000 	streq	r0, [r2], #-0
 5a0:	00005407 	andeq	r5, r0, r7, lsl #8
 5a4:	07080200 	streq	r0, [r8, -r0, lsl #4]
 5a8:	0000004a 	andeq	r0, r0, sl, asr #32
 5ac:	00029d05 	andeq	r9, r2, r5, lsl #26
 5b0:	b80c0100 	stmdalt	ip, {r8}
 5b4:	20000088 	andcs	r0, r0, r8, lsl #1
 5b8:	01000000 	mrseq	r0, (UNDEF: 0)
 5bc:	00008c9c 	muleq	r0, ip, ip
 5c0:	02980600 	addseq	r0, r8, #0, 12
 5c4:	0c010000 	stceq	0, cr0, [r1], {-0}
 5c8:	00000033 	andeq	r0, r0, r3, lsr r0
 5cc:	00749102 	rsbseq	r9, r4, r2, lsl #2
 5d0:	0002ba07 	andeq	fp, r2, r7, lsl #20
 5d4:	d8100100 	ldmdale	r0, {r8}
 5d8:	18000088 	stmdane	r0, {r3, r7}
 5dc:	01000000 	mrseq	r0, (UNDEF: 0)
 5e0:	02c5089c 	sbceq	r0, r5, #156, 16	; 0x9c0000
 5e4:	14010000 	strne	r0, [r1], #-0
 5e8:	0000004f 	andeq	r0, r0, pc, asr #32
 5ec:	000088f0 	strdeq	r8, [r0], -r0
 5f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 5f4:	a9089c01 	stmdbge	r8, {r0, sl, fp, ip, pc}
 5f8:	01000002 	tsteq	r0, r2
 5fc:	00003318 	andeq	r3, r0, r8, lsl r3
 600:	00890c00 	addeq	r0, r9, r0, lsl #24
 604:	00001c00 	andeq	r1, r0, r0, lsl #24
 608:	079c0100 	ldreq	r0, [ip, r0, lsl #2]
 60c:	00000264 	andeq	r0, r0, r4, ror #4
 610:	89281d01 	stmdbhi	r8!, {r0, r8, sl, fp, ip}
 614:	00180000 	andseq	r0, r8, r0
 618:	9c010000 	stcls	0, cr0, [r1], {-0}
 61c:	00008b00 	andeq	r8, r0, r0, lsl #22
 620:	72000400 	andvc	r0, r0, #0, 8
 624:	04000003 	streq	r0, [r0], #-3
 628:	0000a301 	andeq	sl, r0, r1, lsl #6
 62c:	02d00100 	sbcseq	r0, r0, #0, 2
 630:	001c0000 	andseq	r0, ip, r0
 634:	89400000 	stmdbhi	r0, {}^	; <UNPREDICTABLE>
 638:	00340000 	eorseq	r0, r4, r0
 63c:	030f0000 	movweq	r0, #61440	; 0xf000
 640:	01020000 	mrseq	r0, (UNDEF: 2)
 644:	00008208 	andeq	r8, r0, r8, lsl #4
 648:	05020200 	streq	r0, [r2, #-512]	; 0x200
 64c:	00000138 	andeq	r0, r0, r8, lsr r1
 650:	69050403 	stmdbvs	r5, {r0, r1, sl}
 654:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 658:	00000508 	andeq	r0, r0, r8, lsl #10
 65c:	01020000 	mrseq	r0, (UNDEF: 2)
 660:	00007908 	andeq	r7, r0, r8, lsl #18
 664:	07020200 	streq	r0, [r2, -r0, lsl #4]
 668:	00000090 	muleq	r0, r0, r0
 66c:	00008704 	andeq	r8, r0, r4, lsl #14
 670:	5a1a0200 	bpl	680e78 <__user_program+0x380e78>
 674:	02000000 	andeq	r0, r0, #0
 678:	00540704 	subseq	r0, r4, r4, lsl #14
 67c:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 680:	00004a07 	andeq	r4, r0, r7, lsl #20
 684:	69740500 	ldmdbvs	r4!, {r8, sl}^
 688:	0c010063 	stceq	0, cr0, [r1], {99}	; 0x63
 68c:	00008940 	andeq	r8, r0, r0, asr #18
 690:	00000018 	andeq	r0, r0, r8, lsl r0
 694:	74069c01 	strvc	r9, [r6], #-3073	; 0xc01
 698:	0100636f 	tsteq	r0, pc, ror #6
 69c:	00004f10 	andeq	r4, r0, r0, lsl pc
 6a0:	00895800 	addeq	r5, r9, r0, lsl #16
 6a4:	00001c00 	andeq	r1, r0, r0, lsl #24
 6a8:	009c0100 	addseq	r0, ip, r0, lsl #2
 6ac:	00000057 	andeq	r0, r0, r7, asr r0
 6b0:	03db0002 	bicseq	r0, fp, #2
 6b4:	01040000 	mrseq	r0, (UNDEF: 4)
 6b8:	00000382 	andeq	r0, r0, r2, lsl #7
 6bc:	00008000 	andeq	r8, r0, r0
 6c0:	00008054 	andeq	r8, r0, r4, asr r0
 6c4:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 6c8:	2f6b6269 	svccs	0x006b6269
 6cc:	2f637273 	svccs	0x00637273
 6d0:	746f6f62 	strbtvc	r6, [pc], #-3938	; 6d8 <__start-0x7928>
 6d4:	2f00532e 	svccs	0x0000532e
 6d8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 6dc:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 6e0:	2f393433 	svccs	0x00393433
 6e4:	6f706572 	svcvs	0x00706572
 6e8:	34362f73 	ldrtcc	r2, [r6], #-3955	; 0xf73
 6ec:	31662d32 	cmncc	r6, r2, lsr sp
 6f0:	6f632f36 	svcvs	0x00632f36
 6f4:	47006564 	strmi	r6, [r0, -r4, ror #10]
 6f8:	4120554e 	teqmi	r0, lr, asr #10
 6fc:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 700:	302e3432 	eorcc	r3, lr, r2, lsr r4
 704:	56800100 	strpl	r0, [r0], r0, lsl #2
 708:	02000000 	andeq	r0, r0, #0
 70c:	0003ef00 	andeq	lr, r3, r0, lsl #30
 710:	da010400 	ble	41718 <__bss_end+0x34718>
 714:	74000003 	strvc	r0, [r0], #-3
 718:	b8000089 	stmdalt	r0, {r0, r3, r7}
 71c:	33000089 	movwcc	r0, #137	; 0x89
 720:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 724:	732f6b62 	teqvc	pc, #100352	; 0x18800
 728:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
 72c:	532e6d72 	teqpl	lr, #7296	; 0x1c80
 730:	6f682f00 	svcvs	0x00682f00
 734:	652f656d 	strvs	r6, [pc, #-1389]!	; 1cf <__start-0x7e31>
 738:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 73c:	65722f39 	ldrbvs	r2, [r2, #-3897]!	; 0xf39
 740:	2f736f70 	svccs	0x00736f70
 744:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 748:	2f363166 	svccs	0x00363166
 74c:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 750:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 754:	20534120 	subscs	r4, r3, r0, lsr #2
 758:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 75c:	0100302e 	tsteq	r0, lr, lsr #32
 760:	00005280 	andeq	r5, r0, r0, lsl #5
 764:	03000200 	movweq	r0, #512	; 0x200
 768:	04000004 	streq	r0, [r0], #-4
 76c:	00042b01 	andeq	r2, r4, r1, lsl #22
 770:	0089b800 	addeq	fp, r9, r0, lsl #16
 774:	008b1000 	addeq	r1, fp, r0
 778:	6f6e7500 	svcvs	0x006e7500
 77c:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 780:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
 784:	2f00632e 	svccs	0x0000632e
 788:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 78c:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 790:	2f393433 	svccs	0x00393433
 794:	6f706572 	svcvs	0x00706572
 798:	34362f73 	ldrtcc	r2, [r6], #-3955	; 0xf73
 79c:	31662d32 	cmncc	r6, r2, lsr sp
 7a0:	6f632f36 	svcvs	0x00632f36
 7a4:	47006564 	strmi	r6, [r0, -r4, ror #10]
 7a8:	4120554e 	teqmi	r0, lr, asr #10
 7ac:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 7b0:	302e3432 	eorcc	r3, lr, r2, lsr r4
 7b4:	52800100 	addpl	r0, r0, #0, 2
 7b8:	02000000 	andeq	r0, r0, #0
 7bc:	00041700 	andeq	r1, r4, r0, lsl #14
 7c0:	bf010400 	svclt	0x00010400
 7c4:	10000004 	andne	r0, r0, r4
 7c8:	6800008b 	stmdavs	r0, {r0, r1, r3, r7}
 7cc:	6f00008c 	svcvs	0x0000008c
 7d0:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 7d4:	5f657a69 	svcpl	0x00657a69
 7d8:	632e656d 	teqvs	lr, #457179136	; 0x1b400000
 7dc:	6f682f00 	svcvs	0x00682f00
 7e0:	652f656d 	strvs	r6, [pc, #-1389]!	; 27b <__start-0x7d85>
 7e4:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 7e8:	65722f39 	ldrbvs	r2, [r2, #-3897]!	; 0xf39
 7ec:	2f736f70 	svccs	0x00736f70
 7f0:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 7f4:	2f363166 	svccs	0x00363166
 7f8:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 7fc:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 800:	20534120 	subscs	r4, r3, r0, lsr #2
 804:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 808:	0100302e 	tsteq	r0, lr, lsr #32
 80c:	Address 0x0000080c is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1920ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a087c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	03000506 	movweq	r0, #1286	; 0x506
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a087c>
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
  e4:	3b0b3a0e 	blcc	2ce924 <__end+0x1a0924>
  e8:	0013490b 	andseq	r4, r3, fp, lsl #18
  ec:	012e0500 	teqeq	lr, r0, lsl #10
  f0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  f4:	0b3b0b3a 	bleq	ec2de4 <__user_program+0xbc2de4>
  f8:	01111927 	tsteq	r1, r7, lsr #18
  fc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 100:	01194296 			; <UNDEFINED> instruction: 0x01194296
 104:	06000013 			; <UNDEFINED> instruction: 0x06000013
 108:	08030034 	stmdaeq	r3, {r2, r4, r5}
 10c:	0b3b0b3a 	bleq	ec2dfc <__user_program+0xbc2dfc>
 110:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 114:	34070000 	strcc	r0, [r7], #-0
 118:	3a0e0300 	bcc	380d20 <__user_program+0x80d20>
 11c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 120:	00180213 	andseq	r0, r8, r3, lsl r2
 124:	01010800 	tsteq	r1, r0, lsl #16
 128:	13011349 	movwne	r1, #4937	; 0x1349
 12c:	21090000 	mrscs	r0, (UNDEF: 9)
 130:	2f134900 	svccs	0x00134900
 134:	0a000005 	beq	150 <__start-0x7eb0>
 138:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 13c:	0b3b0b3a 	bleq	ec2e2c <__user_program+0xbc2e2c>
 140:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 144:	00001802 	andeq	r1, r0, r2, lsl #16
 148:	01110100 	tsteq	r1, r0, lsl #2
 14c:	0b130e25 	bleq	4c39e8 <__user_program+0x1c39e8>
 150:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 154:	06120111 			; <UNDEFINED> instruction: 0x06120111
 158:	00001710 	andeq	r1, r0, r0, lsl r7
 15c:	03001602 	movweq	r1, #1538	; 0x602
 160:	3b0b3a0e 	blcc	2ce9a0 <__end+0x1a09a0>
 164:	0013490b 	andseq	r4, r3, fp, lsl #18
 168:	00240300 	eoreq	r0, r4, r0, lsl #6
 16c:	0b3e0b0b 	bleq	f82da0 <__user_program+0xc82da0>
 170:	00000e03 	andeq	r0, r0, r3, lsl #28
 174:	0b002404 	bleq	918c <__clzsi2+0x1a0>
 178:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 17c:	05000008 	streq	r0, [r0, #-8]
 180:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 184:	0b3a0b0b 	bleq	e82db8 <__user_program+0xb82db8>
 188:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 18c:	0d060000 	stceq	0, cr0, [r6, #-0]
 190:	490e0300 	stmdbmi	lr, {r8, r9}
 194:	340b3813 	strcc	r3, [fp], #-2067	; 0x813
 198:	07000019 	smladeq	r0, r9, r0, r0
 19c:	0b0b000f 	bleq	2c01e0 <__end+0x1921e0>
 1a0:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 1a4:	3a0e0301 	bcc	380db0 <__user_program+0x80db0>
 1a8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1ac:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 1b0:	96184006 	ldrls	r4, [r8], -r6
 1b4:	13011942 	movwne	r1, #6466	; 0x1942
 1b8:	05090000 	streq	r0, [r9, #-0]
 1bc:	3a0e0300 	bcc	380dc4 <__user_program+0x80dc4>
 1c0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1c4:	00180213 	andseq	r0, r8, r3, lsl r2
 1c8:	00050a00 	andeq	r0, r5, r0, lsl #20
 1cc:	0b3a0803 	bleq	e821e0 <__user_program+0xb821e0>
 1d0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1d4:	00001802 	andeq	r1, r0, r2, lsl #16
 1d8:	0300340b 	movweq	r3, #1035	; 0x40b
 1dc:	3b0b3a0e 	blcc	2cea1c <__end+0x1a0a1c>
 1e0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 1e4:	0c000018 	stceq	0, cr0, [r0], {24}
 1e8:	08030034 	stmdaeq	r3, {r2, r4, r5}
 1ec:	0b3b0b3a 	bleq	ec2edc <__user_program+0xbc2edc>
 1f0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 1f4:	0f0d0000 	svceq	0x000d0000
 1f8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 1fc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 200:	13490101 	movtne	r0, #37121	; 0x9101
 204:	00001301 	andeq	r1, r0, r1, lsl #6
 208:	4900210f 	stmdbmi	r0, {r0, r1, r2, r3, r8, sp}
 20c:	000b2f13 	andeq	r2, fp, r3, lsl pc
 210:	012e1000 	teqeq	lr, r0
 214:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 218:	0b3b0b3a 	bleq	ec2f08 <__user_program+0xbc2f08>
 21c:	13491927 	movtne	r1, #39207	; 0x9927
 220:	06120111 			; <UNDEFINED> instruction: 0x06120111
 224:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 228:	00130119 	andseq	r0, r3, r9, lsl r1
 22c:	00181100 	andseq	r1, r8, r0, lsl #2
 230:	0b120000 	bleq	480238 <__user_program+0x180238>
 234:	12011101 	andne	r1, r1, #1073741824	; 0x40000000
 238:	00130106 	andseq	r0, r3, r6, lsl #2
 23c:	010b1300 	mrseq	r1, (UNDEF: 59)
 240:	06120111 			; <UNDEFINED> instruction: 0x06120111
 244:	26140000 	ldrcs	r0, [r4], -r0
 248:	00134900 	andseq	r4, r3, r0, lsl #18
 24c:	11010000 	mrsne	r0, (UNDEF: 1)
 250:	130e2501 	movwne	r2, #58625	; 0xe501
 254:	1b0e030b 	blne	380e88 <__user_program+0x80e88>
 258:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 25c:	00171006 	andseq	r1, r7, r6
 260:	00240200 	eoreq	r0, r4, r0, lsl #4
 264:	0b3e0b0b 	bleq	f82e98 <__user_program+0xc82e98>
 268:	00000e03 	andeq	r0, r0, r3, lsl #28
 26c:	0b002403 	bleq	9280 <__clzsi2+0x294>
 270:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 274:	04000008 	streq	r0, [r0], #-8
 278:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 27c:	0b3b0b3a 	bleq	ec2f6c <__user_program+0xbc2f6c>
 280:	00001349 	andeq	r1, r0, r9, asr #6
 284:	3f002e05 	svccc	0x00002e05
 288:	3a0e0319 	bcc	380ef4 <__user_program+0x80ef4>
 28c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 290:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 294:	97184006 	ldrls	r4, [r8, -r6]
 298:	00001942 	andeq	r1, r0, r2, asr #18
 29c:	3f012e06 	svccc	0x00012e06
 2a0:	3a0e0319 	bcc	380f0c <__user_program+0x80f0c>
 2a4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2a8:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 2ac:	97184006 	ldrls	r4, [r8, -r6]
 2b0:	13011942 	movwne	r1, #6466	; 0x1942
 2b4:	05070000 	streq	r0, [r7, #-0]
 2b8:	3a0e0300 	bcc	380ec0 <__user_program+0x80ec0>
 2bc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2c0:	00180213 	andseq	r0, r8, r3, lsl r2
 2c4:	002e0800 	eoreq	r0, lr, r0, lsl #16
 2c8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 2cc:	0b3b0b3a 	bleq	ec2fbc <__user_program+0xbc2fbc>
 2d0:	13491927 	movtne	r1, #39207	; 0x9927
 2d4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2d8:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 2dc:	00000019 	andeq	r0, r0, r9, lsl r0
 2e0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 2e4:	030b130e 	movweq	r1, #45838	; 0xb30e
 2e8:	110e1b0e 	tstne	lr, lr, lsl #22
 2ec:	10061201 	andne	r1, r6, r1, lsl #4
 2f0:	02000017 	andeq	r0, r0, #23
 2f4:	0b0b0024 	bleq	2c038c <__end+0x19238c>
 2f8:	0e030b3e 	vmoveq.16	d3[0], r0
 2fc:	24030000 	strcs	r0, [r3], #-0
 300:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 304:	0008030b 	andeq	r0, r8, fp, lsl #6
 308:	00160400 	andseq	r0, r6, r0, lsl #8
 30c:	0b3a0e03 	bleq	e83b20 <__user_program+0xb83b20>
 310:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 314:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 318:	03193f01 	tsteq	r9, #1, 30
 31c:	3b0b3a0e 	blcc	2ceb5c <__end+0x1a0b5c>
 320:	1119270b 	tstne	r9, fp, lsl #14
 324:	40061201 	andmi	r1, r6, r1, lsl #4
 328:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 32c:	00001301 	andeq	r1, r0, r1, lsl #6
 330:	03000506 	movweq	r0, #1286	; 0x506
 334:	3b0b3a0e 	blcc	2ceb74 <__end+0x1a0b74>
 338:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 33c:	07000018 	smladeq	r0, r8, r0, r0
 340:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 344:	0b3a0e03 	bleq	e83b58 <__user_program+0xb83b58>
 348:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 34c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 350:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 354:	08000019 	stmdaeq	r0, {r0, r3, r4}
 358:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 35c:	0b3a0e03 	bleq	e83b70 <__user_program+0xb83b70>
 360:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 364:	01111349 	tsteq	r1, r9, asr #6
 368:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 36c:	00194297 	mulseq	r9, r7, r2
 370:	11010000 	mrsne	r0, (UNDEF: 1)
 374:	130e2501 	movwne	r2, #58625	; 0xe501
 378:	1b0e030b 	blne	380fac <__user_program+0x80fac>
 37c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 380:	00171006 	andseq	r1, r7, r6
 384:	00240200 	eoreq	r0, r4, r0, lsl #4
 388:	0b3e0b0b 	bleq	f82fbc <__user_program+0xc82fbc>
 38c:	00000e03 	andeq	r0, r0, r3, lsl #28
 390:	0b002403 	bleq	93a4 <__clzsi2+0x3b8>
 394:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 398:	04000008 	streq	r0, [r0], #-8
 39c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 3a0:	0b3b0b3a 	bleq	ec3090 <__user_program+0xbc3090>
 3a4:	00001349 	andeq	r1, r0, r9, asr #6
 3a8:	3f002e05 	svccc	0x00002e05
 3ac:	3a080319 	bcc	201018 <__end+0xd3018>
 3b0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3b4:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 3b8:	97184006 	ldrls	r4, [r8, -r6]
 3bc:	00001942 	andeq	r1, r0, r2, asr #18
 3c0:	3f002e06 	svccc	0x00002e06
 3c4:	3a080319 	bcc	201030 <__end+0xd3030>
 3c8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3cc:	11134919 	tstne	r3, r9, lsl r9
 3d0:	40061201 	andmi	r1, r6, r1, lsl #4
 3d4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 3d8:	01000000 	mrseq	r0, (UNDEF: 0)
 3dc:	06100011 			; <UNDEFINED> instruction: 0x06100011
 3e0:	01120111 	tsteq	r2, r1, lsl r1
 3e4:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 3e8:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 3ec:	01000000 	mrseq	r0, (UNDEF: 0)
 3f0:	06100011 			; <UNDEFINED> instruction: 0x06100011
 3f4:	01120111 	tsteq	r2, r1, lsl r1
 3f8:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 3fc:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 400:	01000000 	mrseq	r0, (UNDEF: 0)
 404:	06100011 			; <UNDEFINED> instruction: 0x06100011
 408:	01120111 	tsteq	r2, r1, lsl r1
 40c:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 410:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 414:	01000000 	mrseq	r0, (UNDEF: 0)
 418:	06100011 			; <UNDEFINED> instruction: 0x06100011
 41c:	01120111 	tsteq	r2, r1, lsl r1
 420:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 424:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 428:	Address 0x00000428 is out of bounds.


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
  34:	00000158 	andeq	r0, r0, r8, asr r1
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	02470002 	subeq	r0, r7, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	000084cc 	andeq	r8, r0, ip, asr #9
  54:	00000388 	andeq	r0, r0, r8, lsl #7
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	04800002 	streq	r0, [r0], #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008854 	andeq	r8, r0, r4, asr r8
  74:	00000064 	andeq	r0, r0, r4, rrx
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	05440002 	strbeq	r0, [r4, #-2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000088b8 			; <UNDEFINED> instruction: 0x000088b8
  94:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	061d0002 	ldreq	r0, [sp], -r2
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008940 	andeq	r8, r0, r0, asr #18
  b4:	00000034 	andeq	r0, r0, r4, lsr r0
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	06ac0002 	strteq	r0, [ip], r2
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008000 	andeq	r8, r0, r0
  d4:	00000054 	andeq	r0, r0, r4, asr r0
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	07070002 	streq	r0, [r7, -r2]
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008974 	andeq	r8, r0, r4, ror r9
  f4:	00000044 	andeq	r0, r0, r4, asr #32
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	07610002 	strbeq	r0, [r1, -r2]!
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	000089b8 			; <UNDEFINED> instruction: 0x000089b8
 114:	00000158 	andeq	r0, r0, r8, asr r1
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	07b70002 	ldreq	r0, [r7, r2]!
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008b10 	andeq	r8, r0, r0, lsl fp
 134:	00000158 	andeq	r0, r0, r8, asr r1
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
  94:	00ae0101 	adceq	r0, lr, r1, lsl #2
  98:	00020000 	andeq	r0, r2, r0
  9c:	00000054 	andeq	r0, r0, r4, asr r0
  a0:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  a4:	0101000d 	tsteq	r1, sp
  a8:	00000101 	andeq	r0, r0, r1, lsl #2
  ac:	00000100 	andeq	r0, r0, r0, lsl #2
  b0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
  b4:	5f6c656e 	svcpl	0x006c656e
  b8:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
  bc:	617a696d 	cmnvs	sl, sp, ror #18
  c0:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
  c4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  c8:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
  cc:	6b62696c 	blvs	189a684 <__user_program+0x159a684>
  d0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
  d4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
  d8:	656b0000 	strbvs	r0, [fp, #-0]!
  dc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
  e0:	0100632e 	tsteq	r0, lr, lsr #6
  e4:	736b0000 	cmnvc	fp, #0
  e8:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  ec:	00682e74 	rsbeq	r2, r8, r4, ror lr
  f0:	00000002 	andeq	r0, r0, r2
  f4:	74020500 	strvc	r0, [r2], #-1280	; 0x500
  f8:	03000083 	movweq	r0, #131	; 0x83
  fc:	4d670117 	stfmie	f0, [r7, #-92]!	; 0xffffffa4
 100:	04020030 	streq	r0, [r2], #-48	; 0x30
 104:	02006803 	andeq	r6, r0, #196608	; 0x30000
 108:	009f0304 	addseq	r0, pc, r4, lsl #6
 10c:	9b030402 	blls	c111c <__bss_end+0xb411c>
 110:	01040200 	mrseq	r0, R12_usr
 114:	6d066606 	stcvs	6, cr6, [r6, #-24]	; 0xffffffe8
 118:	4b672f67 	blmi	19cbebc <__user_program+0x16cbebc>
 11c:	672f6785 	strvs	r6, [pc, -r5, lsl #15]!
 120:	0868854b 	stmdaeq	r8!, {r0, r1, r3, r6, r8, sl, pc}^
 124:	004b673f 	subeq	r6, fp, pc, lsr r7
 128:	03020402 	movweq	r0, #9218	; 0x2402
 12c:	02002e79 	andeq	r2, r0, #1936	; 0x790
 130:	66060104 	strvs	r0, [r6], -r4, lsl #2
 134:	660a0306 	strvs	r0, [sl], -r6, lsl #6
 138:	04020069 	streq	r0, [r2], #-105	; 0x69
 13c:	02006a01 	andeq	r6, r0, #4096	; 0x1000
 140:	02670104 	rsbeq	r0, r7, #4, 2
 144:	01010002 	tsteq	r1, r2
 148:	000000d6 	ldrdeq	r0, [r0], -r6
 14c:	006f0002 	rsbeq	r0, pc, r2
 150:	01020000 	mrseq	r0, (UNDEF: 2)
 154:	000d0efb 	strdeq	r0, [sp], -fp
 158:	01010101 	tsteq	r1, r1, lsl #2
 15c:	01000000 	mrseq	r0, (UNDEF: 0)
 160:	6b010000 	blvs	40168 <__bss_end+0x33168>
 164:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 168:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 16c:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 170:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 174:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 178:	33006372 	movwcc	r6, #882	; 0x372
 17c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 180:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 184:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 188:	00006564 	andeq	r6, r0, r4, ror #10
 18c:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 190:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 194:	00000100 	andeq	r0, r0, r0, lsl #2
 198:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 19c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 1a0:	00020068 	andeq	r0, r2, r8, rrx
 1a4:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 1a8:	67726164 	ldrbvs	r6, [r2, -r4, ror #2]!
 1ac:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1b0:	623c0000 	eorsvs	r0, ip, #0
 1b4:	746c6975 	strbtvc	r6, [ip], #-2421	; 0x975
 1b8:	3e6e692d 	cdpcc	9, 6, cr6, cr14, cr13, {1}
 1bc:	00000000 	andeq	r0, r0, r0
 1c0:	02050000 	andeq	r0, r5, #0
 1c4:	000084cc 	andeq	r8, r0, ip, asr #9
 1c8:	d7012003 	strle	r2, [r1, -r3]
 1cc:	8367694c 	cmnhi	r7, #76, 18	; 0x130000
 1d0:	04020067 	streq	r0, [r2], #-103	; 0x67
 1d4:	02006b01 	andeq	r6, r0, #1024	; 0x400
 1d8:	ad080104 	stfges	f0, [r8, #-16]
 1dc:	01040200 	mrseq	r0, R12_usr
 1e0:	2f6769d7 	svccs	0x006769d7
 1e4:	812f86b9 			; <UNDEFINED> instruction: 0x812f86b9
 1e8:	4d854df5 	stcmi	13, cr4, [r5, #980]	; 0x3d4
 1ec:	30bb8330 	adcscc	r8, fp, r0, lsr r3
 1f0:	15320268 	ldrne	r0, [r2, #-616]!	; 0x268
 1f4:	be4b679f 	mcrlt	7, 2, r6, cr11, cr15, {4}
 1f8:	9f32a02c 	svcls	0x0032a02c
 1fc:	9f9f329f 	svcls	0x009f329f
 200:	329f9f33 	addscc	r9, pc, #51, 30	; 0xcc
 204:	64832f9f 	strvs	r2, [r3], #3999	; 0xf9f
 208:	839f3286 	orrshi	r3, pc, #1610612744	; 0x60000008
 20c:	4d334b32 	vldmdbmi	r3!, {d4-d28}
 210:	667fbf03 	ldrbtvs	fp, [pc], -r3, lsl #30
 214:	8200c503 	andhi	ip, r0, #12582912	; 0xc00000
 218:	01040200 	mrseq	r0, R12_usr
 21c:	000a022f 	andeq	r0, sl, pc, lsr #4
 220:	006f0101 	rsbeq	r0, pc, r1, lsl #2
 224:	00020000 	andeq	r0, r2, r0
 228:	00000052 	andeq	r0, r0, r2, asr r0
 22c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 230:	0101000d 	tsteq	r1, sp
 234:	00000101 	andeq	r0, r0, r1, lsl #2
 238:	00000100 	andeq	r0, r0, r0, lsl #2
 23c:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 240:	5f6c656e 	svcpl	0x006c656e
 244:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
 248:	617a696d 	cmnvs	sl, sp, ror #18
 24c:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
 250:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 254:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 258:	6b62696c 	blvs	189a810 <__user_program+0x159a810>
 25c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 260:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 264:	61750000 	cmnvs	r5, r0
 268:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 26c:	00000100 	andeq	r0, r0, r0, lsl #2
 270:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 274:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 278:	00020068 	andeq	r0, r2, r8, rrx
 27c:	05000000 	streq	r0, [r0, #-0]
 280:	00885402 	addeq	r5, r8, r2, lsl #8
 284:	010c0300 	mrseq	r0, LR_mon
 288:	694b694b 	stmdbvs	fp, {r0, r1, r3, r6, r8, fp, sp, lr}^
 28c:	2f4b699f 	svccs	0x004b699f
 290:	01000802 	tsteq	r0, r2, lsl #16
 294:	00007601 	andeq	r7, r0, r1, lsl #12
 298:	53000200 	movwpl	r0, #512	; 0x200
 29c:	02000000 	andeq	r0, r0, #0
 2a0:	0d0efb01 	vstreq	d15, [lr, #-4]
 2a4:	01010100 	mrseq	r0, (UNDEF: 17)
 2a8:	00000001 	andeq	r0, r0, r1
 2ac:	01000001 	tsteq	r0, r1
 2b0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2b4:	6f5f6c65 	svcvs	0x005f6c65
 2b8:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 2bc:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 2c0:	2f6e6f69 	svccs	0x006e6f69
 2c4:	00637273 	rsbeq	r7, r3, r3, ror r2
 2c8:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 2cc:	2f6b6269 	svccs	0x006b6269
 2d0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 2d4:	00656475 	rsbeq	r6, r5, r5, ror r4
 2d8:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2dc:	632e7265 	teqvs	lr, #1342177286	; 0x50000006
 2e0:	00000100 	andeq	r0, r0, r0, lsl #2
 2e4:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 2e8:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 2ec:	00020068 	andeq	r0, r2, r8, rrx
 2f0:	05000000 	streq	r0, [r0, #-0]
 2f4:	0088b802 	addeq	fp, r8, r2, lsl #16
 2f8:	010b0300 	mrseq	r0, (UNDEF: 59)
 2fc:	4b682f83 	blmi	1a0c110 <__user_program+0x170c110>
 300:	2f4b682f 	svccs	0x004b682f
 304:	852f4b84 	strhi	r4, [pc, #-2948]!	; fffff788 <__user_program+0xffcff788>
 308:	06022f4b 	streq	r2, [r2], -fp, asr #30
 30c:	6f010100 	svcvs	0x00010100
 310:	02000000 	andeq	r0, r0, #0
 314:	00005500 	andeq	r5, r0, r0, lsl #10
 318:	fb010200 	blx	40b22 <__bss_end+0x33b22>
 31c:	01000d0e 	tsteq	r0, lr, lsl #26
 320:	00010101 	andeq	r0, r1, r1, lsl #2
 324:	00010000 	andeq	r0, r1, r0
 328:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 32c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 330:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 334:	7a696d69 	bvc	1a5b8e0 <__user_program+0x175b8e0>
 338:	6f697461 	svcvs	0x00697461
 33c:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 340:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 344:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 348:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 34c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 350:	74000065 	strvc	r0, [r0], #-101	; 0x65
 354:	745f6369 	ldrbvc	r6, [pc], #-873	; 35c <__start-0x7ca4>
 358:	632e636f 	teqvs	lr, #-1140850687	; 0xbc000001
 35c:	00000100 	andeq	r0, r0, r0, lsl #2
 360:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 364:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 368:	00020068 	andeq	r0, r2, r8, rrx
 36c:	05000000 	streq	r0, [r0, #-0]
 370:	00894002 	addeq	r4, r9, r2
 374:	010b0300 	mrseq	r0, (UNDEF: 59)
 378:	4b682f4b 	blmi	1a0c0ac <__user_program+0x170c0ac>
 37c:	0008022f 	andeq	r0, r8, pc, lsr #4
 380:	00540101 	subseq	r0, r4, r1, lsl #2
 384:	00020000 	andeq	r0, r2, r0
 388:	00000029 	andeq	r0, r0, r9, lsr #32
 38c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 390:	0101000d 	tsteq	r1, sp
 394:	00000101 	andeq	r0, r0, r1, lsl #2
 398:	00000100 	andeq	r0, r0, r0, lsl #2
 39c:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 3a0:	6b62696c 	blvs	189a958 <__user_program+0x159a958>
 3a4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 3a8:	6f620000 	svcvs	0x00620000
 3ac:	532e746f 	teqpl	lr, #1862270976	; 0x6f000000
 3b0:	00000100 	andeq	r0, r0, r0, lsl #2
 3b4:	02050000 	andeq	r0, r5, #0
 3b8:	00008000 	andeq	r8, r0, r0
 3bc:	2f011b03 	svccs	0x00011b03
 3c0:	2f302f2f 	svccs	0x00302f2f
 3c4:	2f2f2f2f 	svccs	0x002f2f2f
 3c8:	2f2f312f 	svccs	0x002f312f
 3cc:	032f3331 	teqeq	pc, #-1006632960	; 0xc4000000
 3d0:	2f312e69 	svccs	0x00312e69
 3d4:	0002022f 	andeq	r0, r2, pc, lsr #4
 3d8:	004d0101 	subeq	r0, sp, r1, lsl #2
 3dc:	00020000 	andeq	r0, r2, r0
 3e0:	00000028 	andeq	r0, r0, r8, lsr #32
 3e4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 3e8:	0101000d 	tsteq	r1, sp
 3ec:	00000101 	andeq	r0, r0, r1, lsl #2
 3f0:	00000100 	andeq	r0, r0, r0, lsl #2
 3f4:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 3f8:	6b62696c 	blvs	189a9b0 <__user_program+0x159a9b0>
 3fc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 400:	72610000 	rsbvc	r0, r1, #0
 404:	00532e6d 	subseq	r2, r3, sp, ror #28
 408:	00000001 	andeq	r0, r0, r1
 40c:	74020500 	strvc	r0, [r2], #-1280	; 0x500
 410:	03000089 	movweq	r0, #137	; 0x89
 414:	2f2f0110 	svccs	0x002f0110
 418:	2f332f33 	svccs	0x00332f33
 41c:	2f2f2f33 	svccs	0x002f2f33
 420:	2f2f332f 	svccs	0x002f332f
 424:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 428:	90010100 	andls	r0, r1, r0, lsl #2
 42c:	02000000 	andeq	r0, r0, #0
 430:	00002400 	andeq	r2, r0, r0, lsl #8
 434:	fb010200 	blx	40c3e <__bss_end+0x33c3e>
 438:	01000d0e 	tsteq	r0, lr, lsl #26
 43c:	00010101 	andeq	r0, r1, r1, lsl #2
 440:	00010000 	andeq	r0, r1, r0
 444:	75000100 	strvc	r0, [r0, #-256]	; 0x100
 448:	74706f6e 	ldrbtvc	r6, [r0], #-3950	; 0xf6e
 44c:	7a696d69 	bvc	1a5b9f8 <__user_program+0x175b9f8>
 450:	632e6465 	teqvs	lr, #1694498816	; 0x65000000
 454:	00000000 	andeq	r0, r0, r0
 458:	02050000 	andeq	r0, r5, #0
 45c:	000089b8 			; <UNDEFINED> instruction: 0x000089b8
 460:	2f011503 	svccs	0x00011503
 464:	2f2f2f2f 	svccs	0x002f2f2f
 468:	2f2f2f2f 	svccs	0x002f2f2f
 46c:	2f2f2f2f 	svccs	0x002f2f2f
 470:	032f302f 	teqeq	pc, #47	; 0x2f
 474:	2f2f2e09 	svccs	0x002f2e09
 478:	2f2f2f2f 	svccs	0x002f2f2f
 47c:	2f2f2f30 	svccs	0x002f2f30
 480:	2f2f302f 	svccs	0x002f302f
 484:	2f2f2f2f 	svccs	0x002f2f2f
 488:	2f2f2f2f 	svccs	0x002f2f2f
 48c:	2f2f2f2f 	svccs	0x002f2f2f
 490:	2f2f2f2f 	svccs	0x002f2f2f
 494:	2f2f2f2f 	svccs	0x002f2f2f
 498:	2f2f2f2f 	svccs	0x002f2f2f
 49c:	2f2f2f2f 	svccs	0x002f2f2f
 4a0:	2f2f2f2f 	svccs	0x002f2f2f
 4a4:	2f2f2f2f 	svccs	0x002f2f2f
 4a8:	2f2f2f2f 	svccs	0x002f2f2f
 4ac:	2f302f2f 	svccs	0x00302f2f
 4b0:	2f2f2f2f 	svccs	0x002f2f2f
 4b4:	2f2f2f30 	svccs	0x002f2f30
 4b8:	02022f30 	andeq	r2, r2, #48, 30	; 0xc0
 4bc:	90010100 	andls	r0, r1, r0, lsl #2
 4c0:	02000000 	andeq	r0, r0, #0
 4c4:	00002400 	andeq	r2, r0, r0, lsl #8
 4c8:	fb010200 	blx	40cd2 <__bss_end+0x33cd2>
 4cc:	01000d0e 	tsteq	r0, lr, lsl #26
 4d0:	00010101 	andeq	r0, r1, r1, lsl #2
 4d4:	00010000 	andeq	r0, r1, r0
 4d8:	6f000100 	svcvs	0x00000100
 4dc:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 4e0:	5f657a69 	svcpl	0x00657a69
 4e4:	632e656d 	teqvs	lr, #457179136	; 0x1b400000
 4e8:	00000000 	andeq	r0, r0, r0
 4ec:	02050000 	andeq	r0, r5, #0
 4f0:	00008b10 	andeq	r8, r0, r0, lsl fp
 4f4:	2f011503 	svccs	0x00011503
 4f8:	2f2f2f2f 	svccs	0x002f2f2f
 4fc:	2f2f2f2f 	svccs	0x002f2f2f
 500:	2f2f2f2f 	svccs	0x002f2f2f
 504:	032f302f 	teqeq	pc, #47	; 0x2f
 508:	2f2f2e09 	svccs	0x002f2e09
 50c:	2f2f2f2f 	svccs	0x002f2f2f
 510:	2f2f2f30 	svccs	0x002f2f30
 514:	2f2f302f 	svccs	0x002f302f
 518:	2f2f2f2f 	svccs	0x002f2f2f
 51c:	2f2f2f2f 	svccs	0x002f2f2f
 520:	2f2f2f2f 	svccs	0x002f2f2f
 524:	2f2f2f2f 	svccs	0x002f2f2f
 528:	2f2f2f2f 	svccs	0x002f2f2f
 52c:	2f2f2f2f 	svccs	0x002f2f2f
 530:	2f2f2f2f 	svccs	0x002f2f2f
 534:	2f2f2f2f 	svccs	0x002f2f2f
 538:	2f2f2f2f 	svccs	0x002f2f2f
 53c:	2f2f2f2f 	svccs	0x002f2f2f
 540:	2f302f2f 	svccs	0x00302f2f
 544:	2f2f2f2f 	svccs	0x002f2f2f
 548:	2f2f2f30 	svccs	0x002f2f30
 54c:	02022f30 	andeq	r2, r2, #48, 30	; 0xc0
 550:	Address 0x00000550 is out of bounds.


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
 154:	72726100 	rsbsvc	r6, r2, #0, 2
 158:	00317961 	eorseq	r7, r1, r1, ror #18
 15c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 160:	6f5f6c65 	svcvs	0x005f6c65
 164:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 168:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 16c:	2f6e6f69 	svccs	0x006e6f69
 170:	2f637273 	svccs	0x00637273
 174:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 178:	632e6c65 	teqvs	lr, #25856	; 0x6500
 17c:	72726100 	rsbsvc	r6, r2, #0, 2
 180:	00327961 	eorseq	r7, r2, r1, ror #18
 184:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 188:	6c615672 	stclvs	6, cr5, [r1], #-456	; 0xfffffe38
 18c:	6b006575 	blvs	19768 <__bss_end+0xc768>
 190:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 194:	616d5f6c 	cmnvs	sp, ip, ror #30
 198:	67006e69 	strvs	r6, [r0, -r9, ror #28]
 19c:	00646f6f 	rsbeq	r6, r4, pc, ror #30
 1a0:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0x973
 1a4:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0x974
 1a8:	74796200 	ldrbtvc	r6, [r9], #-512	; 0x200
 1ac:	74705f65 	ldrbtvc	r5, [r0], #-3941	; 0xf65
 1b0:	72700072 	rsbsvc	r0, r0, #114	; 0x72
 1b4:	78696665 	stmdavc	r9!, {r0, r2, r5, r6, r9, sl, sp, lr}^
 1b8:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 1bc:	5f343674 	svcpl	0x00343674
 1c0:	61620074 	smcvs	8196	; 0x2004
 1c4:	5f006573 	svcpl	0x00006573
 1c8:	5f61765f 	svcpl	0x0061765f
 1cc:	7473696c 	ldrbtvc	r6, [r3], #-2412	; 0x96c
 1d0:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 1d4:	756e746e 	strbvc	r7, [lr, #-1134]!	; 0x46e
 1d8:	64006b6d 	strvs	r6, [r0], #-2925	; 0xb6d
 1dc:	74696769 	strbtvc	r6, [r9], #-1897	; 0x769
 1e0:	656b0073 	strbvs	r0, [fp, #-115]!	; 0x73
 1e4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 1e8:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 1ec:	7a696d69 	bvc	1a5b798 <__user_program+0x175b798>
 1f0:	6f697461 	svcvs	0x00697461
 1f4:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 1f8:	72702f63 	rsbsvc	r2, r0, #396	; 0x18c
 1fc:	6b746e69 	blvs	1d1bba8 <__user_program+0x1a1bba8>
 200:	7000632e 	andvc	r6, r0, lr, lsr #6
 204:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 208:	7261006b 	rsbvc	r0, r1, #107	; 0x6b
 20c:	5f007367 	svcpl	0x00007367
 210:	0070615f 	rsbseq	r6, r0, pc, asr r1
 214:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 218:	7465675f 	strbtvc	r6, [r5], #-1887	; 0x75f
 21c:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 220:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 224:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 228:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 22c:	7a696d69 	bvc	1a5b7d8 <__user_program+0x175b7d8>
 230:	6f697461 	svcvs	0x00697461
 234:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 238:	61752f63 	cmnvs	r5, r3, ror #30
 23c:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 240:	72617500 	rsbvc	r7, r1, #0, 10
 244:	6e695f74 	mcrvs	15, 3, r5, cr9, cr4, {3}
 248:	75007469 	strvc	r7, [r0, #-1129]	; 0x469
 24c:	5f747261 	svcpl	0x00747261
 250:	5f747570 	svcpl	0x00747570
 254:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 258:	72617500 	rsbvc	r7, r1, #0, 10
 25c:	6c635f74 	stclvs	15, cr5, [r3], #-464	; 0xfffffe30
 260:	0065736f 	rsbeq	r7, r5, pc, ror #6
 264:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 268:	6c635f72 	stclvs	15, cr5, [r3], #-456	; 0xfffffe38
 26c:	5f726165 	svcpl	0x00726165
 270:	646e6570 	strbtvs	r6, [lr], #-1392	; 0x570
 274:	00676e69 	rsbeq	r6, r7, r9, ror #28
 278:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 27c:	6f5f6c65 	svcvs	0x005f6c65
 280:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 284:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 288:	2f6e6f69 	svccs	0x006e6f69
 28c:	2f637273 	svccs	0x00637273
 290:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 294:	00632e72 	rsbeq	r2, r3, r2, ror lr
 298:	71657266 	cmnvc	r5, r6, ror #4
 29c:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2a0:	735f7265 	cmpvc	pc, #1342177286	; 0x50000006
 2a4:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 2a8:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2ac:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 2b0:	65705f73 	ldrbvs	r5, [r0, #-3955]!	; 0xf73
 2b4:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 2b8:	69740067 	ldmdbvs	r4!, {r0, r1, r2, r5, r6}^
 2bc:	5f72656d 	svcpl	0x0072656d
 2c0:	706f7473 	rsbvc	r7, pc, r3, ror r4	; <UNPREDICTABLE>
 2c4:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2c8:	725f7265 	subsvc	r7, pc, #1342177286	; 0x50000006
 2cc:	00646165 	rsbeq	r6, r4, r5, ror #2
 2d0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2d4:	6f5f6c65 	svcvs	0x005f6c65
 2d8:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 2dc:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 2e0:	2f6e6f69 	svccs	0x006e6f69
 2e4:	2f637273 	svccs	0x00637273
 2e8:	5f636974 	svcpl	0x00636974
 2ec:	2e636f74 	mcrcs	15, 3, r6, cr3, cr4, {3}
 2f0:	Address 0x000002f0 is out of bounds.


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
  24:	1a011803 	bne	46038 <__bss_end+0x39038>
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
  20:	8b040e42 	blhi	103930 <__bss_end+0xf6930>
  24:	0b0d4201 	bleq	350830 <__user_program+0x50830>
  28:	0d0d8802 	stceq	8, cr8, [sp, #-8]
  2c:	000ecb42 	andeq	ip, lr, r2, asr #22
  30:	0000001c 	andeq	r0, r0, ip, lsl r0
  34:	00000000 	andeq	r0, r0, r0
  38:	00008174 	andeq	r8, r0, r4, ror r1
  3c:	00000084 	andeq	r0, r0, r4, lsl #1
  40:	8b040e42 	blhi	103950 <__bss_end+0xf6950>
  44:	0b0d4201 	bleq	350850 <__user_program+0x50850>
  48:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
  4c:	00000ecb 	andeq	r0, r0, fp, asr #29
  50:	0000001c 	andeq	r0, r0, ip, lsl r0
  54:	00000000 	andeq	r0, r0, r0
  58:	000081f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
  5c:	00000084 	andeq	r0, r0, r4, lsl #1
  60:	8b040e42 	blhi	103970 <__bss_end+0xf6970>
  64:	0b0d4201 	bleq	350870 <__user_program+0x50870>
  68:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
  6c:	00000ecb 	andeq	r0, r0, fp, asr #29
  70:	0000001c 	andeq	r0, r0, ip, lsl r0
  74:	00000000 	andeq	r0, r0, r0
  78:	0000827c 	andeq	r8, r0, ip, ror r2
  7c:	000000f8 	strdeq	r0, [r0], -r8
  80:	8b080e42 	blhi	203990 <__end+0xd5990>
  84:	42018e02 	andmi	r8, r1, #2, 28
  88:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
  8c:	080d0c76 	stmdaeq	sp, {r1, r2, r4, r5, r6, sl, fp}
  90:	0000000c 	andeq	r0, r0, ip
  94:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  98:	7c020001 	stcvc	0, cr0, [r2], {1}
  9c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  a0:	00000018 	andeq	r0, r0, r8, lsl r0
  a4:	00000090 	muleq	r0, r0, r0
  a8:	00008374 	andeq	r8, r0, r4, ror r3
  ac:	00000158 	andeq	r0, r0, r8, asr r1
  b0:	8b080e42 	blhi	2039c0 <__end+0xd59c0>
  b4:	42018e02 	andmi	r8, r1, #2, 28
  b8:	00040b0c 	andeq	r0, r4, ip, lsl #22
  bc:	0000000c 	andeq	r0, r0, ip
  c0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  c4:	7c020001 	stcvc	0, cr0, [r2], {1}
  c8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  cc:	00000020 	andeq	r0, r0, r0, lsr #32
  d0:	000000bc 	strheq	r0, [r0], -ip
  d4:	000084cc 	andeq	r8, r0, ip, asr #9
  d8:	00000138 	andeq	r0, r0, r8, lsr r1
  dc:	840c0e42 	strhi	r0, [ip], #-3650	; 0xe42
  e0:	8e028b03 	vmlahi.f64	d8, d2, d3
  e4:	0b0c4201 	bleq	3108f0 <__user_program+0x108f0>
  e8:	0c960204 	lfmeq	f0, 4, [r6], {4}
  ec:	00000c0d 	andeq	r0, r0, sp, lsl #24
  f0:	00000034 	andeq	r0, r0, r4, lsr r0
  f4:	000000bc 	strheq	r0, [r0], -ip
  f8:	00008604 	andeq	r8, r0, r4, lsl #12
  fc:	00000250 	andeq	r0, r0, r0, asr r2
 100:	80100e42 	andshi	r0, r0, r2, asr #28
 104:	82038104 	andhi	r8, r3, #4, 2
 108:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
 10c:	068b180e 	streq	r1, [fp], lr, lsl #16
 110:	0c42058e 	cfstr64eq	mvdx0, [r2], {142}	; 0x8e
 114:	1c03140b 	cfstrsne	mvf1, [r3], {11}
 118:	180d0c01 	stmdane	sp, {r0, sl, fp}
 11c:	0ecbce42 	cdpeq	14, 12, cr12, cr11, cr2, {2}
 120:	c2c34210 	sbcgt	r4, r3, #16, 4
 124:	000ec0c1 	andeq	ip, lr, r1, asr #1
 128:	0000000c 	andeq	r0, r0, ip
 12c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 130:	7c020001 	stcvc	0, cr0, [r2], {1}
 134:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 138:	0000001c 	andeq	r0, r0, ip, lsl r0
 13c:	00000128 	andeq	r0, r0, r8, lsr #2
 140:	00008854 	andeq	r8, r0, r4, asr r8
 144:	00000014 	andeq	r0, r0, r4, lsl r0
 148:	8b040e42 	blhi	103a58 <__bss_end+0xf6a58>
 14c:	0b0d4201 	bleq	350958 <__user_program+0x50958>
 150:	420d0d42 	andmi	r0, sp, #4224	; 0x1080
 154:	00000ecb 	andeq	r0, r0, fp, asr #29
 158:	0000001c 	andeq	r0, r0, ip, lsl r0
 15c:	00000128 	andeq	r0, r0, r8, lsr #2
 160:	00008868 	andeq	r8, r0, r8, ror #16
 164:	00000014 	andeq	r0, r0, r4, lsl r0
 168:	8b040e42 	blhi	103a78 <__bss_end+0xf6a78>
 16c:	0b0d4201 	bleq	350978 <__user_program+0x50978>
 170:	420d0d42 	andmi	r0, sp, #4224	; 0x1080
 174:	00000ecb 	andeq	r0, r0, fp, asr #29
 178:	0000001c 	andeq	r0, r0, ip, lsl r0
 17c:	00000128 	andeq	r0, r0, r8, lsr #2
 180:	0000887c 	andeq	r8, r0, ip, ror r8
 184:	00000020 	andeq	r0, r0, r0, lsr #32
 188:	8b040e42 	blhi	103a98 <__bss_end+0xf6a98>
 18c:	0b0d4201 	bleq	350998 <__user_program+0x50998>
 190:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 194:	00000ecb 	andeq	r0, r0, fp, asr #29
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	00000128 	andeq	r0, r0, r8, lsr #2
 1a0:	0000889c 	muleq	r0, ip, r8
 1a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a8:	8b040e42 	blhi	103ab8 <__bss_end+0xf6ab8>
 1ac:	0b0d4201 	bleq	3509b8 <__user_program+0x509b8>
 1b0:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 1b4:	00000ecb 	andeq	r0, r0, fp, asr #29
 1b8:	0000000c 	andeq	r0, r0, ip
 1bc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1c0:	7c020001 	stcvc	0, cr0, [r2], {1}
 1c4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1c8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1cc:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1d0:	000088b8 			; <UNDEFINED> instruction: 0x000088b8
 1d4:	00000020 	andeq	r0, r0, r0, lsr #32
 1d8:	8b040e42 	blhi	103ae8 <__bss_end+0xf6ae8>
 1dc:	0b0d4201 	bleq	3509e8 <__user_program+0x509e8>
 1e0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1e4:	00000ecb 	andeq	r0, r0, fp, asr #29
 1e8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1ec:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1f0:	000088d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 1f4:	00000018 	andeq	r0, r0, r8, lsl r0
 1f8:	8b040e42 	blhi	103b08 <__bss_end+0xf6b08>
 1fc:	0b0d4201 	bleq	350a08 <__user_program+0x50a08>
 200:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 204:	00000ecb 	andeq	r0, r0, fp, asr #29
 208:	0000001c 	andeq	r0, r0, ip, lsl r0
 20c:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 210:	000088f0 	strdeq	r8, [r0], -r0
 214:	0000001c 	andeq	r0, r0, ip, lsl r0
 218:	8b040e42 	blhi	103b28 <__bss_end+0xf6b28>
 21c:	0b0d4201 	bleq	350a28 <__user_program+0x50a28>
 220:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 224:	00000ecb 	andeq	r0, r0, fp, asr #29
 228:	0000001c 	andeq	r0, r0, ip, lsl r0
 22c:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 230:	0000890c 	andeq	r8, r0, ip, lsl #18
 234:	0000001c 	andeq	r0, r0, ip, lsl r0
 238:	8b040e42 	blhi	103b48 <__bss_end+0xf6b48>
 23c:	0b0d4201 	bleq	350a48 <__user_program+0x50a48>
 240:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 244:	00000ecb 	andeq	r0, r0, fp, asr #29
 248:	0000001c 	andeq	r0, r0, ip, lsl r0
 24c:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 250:	00008928 	andeq	r8, r0, r8, lsr #18
 254:	00000018 	andeq	r0, r0, r8, lsl r0
 258:	8b040e42 	blhi	103b68 <__bss_end+0xf6b68>
 25c:	0b0d4201 	bleq	350a68 <__user_program+0x50a68>
 260:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 264:	00000ecb 	andeq	r0, r0, fp, asr #29
 268:	0000000c 	andeq	r0, r0, ip
 26c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 270:	7c020001 	stcvc	0, cr0, [r2], {1}
 274:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 278:	0000001c 	andeq	r0, r0, ip, lsl r0
 27c:	00000268 	andeq	r0, r0, r8, ror #4
 280:	00008940 	andeq	r8, r0, r0, asr #18
 284:	00000018 	andeq	r0, r0, r8, lsl r0
 288:	8b040e42 	blhi	103b98 <__bss_end+0xf6b98>
 28c:	0b0d4201 	bleq	350a98 <__user_program+0x50a98>
 290:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 294:	00000ecb 	andeq	r0, r0, fp, asr #29
 298:	0000001c 	andeq	r0, r0, ip, lsl r0
 29c:	00000268 	andeq	r0, r0, r8, ror #4
 2a0:	00008958 	andeq	r8, r0, r8, asr r9
 2a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 2a8:	8b040e42 	blhi	103bb8 <__bss_end+0xf6bb8>
 2ac:	0b0d4201 	bleq	350ab8 <__user_program+0x50ab8>
 2b0:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 2b4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2b8:	0000000c 	andeq	r0, r0, ip
 2bc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2c0:	7c010001 	stcvc	0, cr0, [r1], {1}
 2c4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2c8:	00000014 	andeq	r0, r0, r4, lsl r0
 2cc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2d0:	00008c68 	andeq	r8, r0, r8, ror #24
 2d4:	0000003c 	andeq	r0, r0, ip, lsr r0
 2d8:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 2dc:	00000010 	andeq	r0, r0, r0, lsl r0
 2e0:	0000000c 	andeq	r0, r0, ip
 2e4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2e8:	7c020001 	stcvc	0, cr0, [r2], {1}
 2ec:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f0:	0000002c 	andeq	r0, r0, ip, lsr #32
 2f4:	000002e0 	andeq	r0, r0, r0, ror #5
 2f8:	00008ca4 	andeq	r8, r0, r4, lsr #25
 2fc:	00000044 	andeq	r0, r0, r4, asr #32
 300:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 304:	86078508 	strhi	r8, [r7], -r8, lsl #10
 308:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 30c:	8a038904 	bhi	e2724 <__bss_end+0xd5724>
 310:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 314:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 318:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 31c:	0000000e 	andeq	r0, r0, lr
 320:	00000024 	andeq	r0, r0, r4, lsr #32
 324:	000002e0 	andeq	r0, r0, r0, ror #5
 328:	00008ce8 	andeq	r8, r0, r8, ror #25
 32c:	00000040 	andeq	r0, r0, r0, asr #32
 330:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 334:	86058506 	strhi	r8, [r5], -r6, lsl #10
 338:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 33c:	5c018e02 	stcpl	14, cr8, [r1], {2}
 340:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 344:	000ec4c5 	andeq	ip, lr, r5, asr #9
 348:	0000000c 	andeq	r0, r0, ip
 34c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 350:	7c020001 	stcvc	0, cr0, [r2], {1}
 354:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 358:	00000034 	andeq	r0, r0, r4, lsr r0
 35c:	00000348 	andeq	r0, r0, r8, asr #6
 360:	00008d2c 	andeq	r8, r0, ip, lsr #26
 364:	00000178 	andeq	r0, r0, r8, ror r1
 368:	83280e44 	teqhi	r8, #68, 28	; 0x440
 36c:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 370:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 374:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 378:	8b038a04 	blhi	e2b90 <__bss_end+0xd5b90>
 37c:	02018e02 	andeq	r8, r1, #2, 28
 380:	cbce0aa6 	blgt	ff382e20 <__user_program+0xff082e20>
 384:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 388:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 38c:	0b42000e 	bleq	10803cc <__user_program+0xd803cc>
 390:	0000000c 	andeq	r0, r0, ip
 394:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 398:	7c020001 	stcvc	0, cr0, [r2], {1}
 39c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3a0:	0000002c 	andeq	r0, r0, ip, lsr #32
 3a4:	00000390 	muleq	r0, r0, r3
 3a8:	00008ea4 	andeq	r8, r0, r4, lsr #29
 3ac:	00000120 	andeq	r0, r0, r0, lsr #2
 3b0:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 3b4:	86078508 	strhi	r8, [r7], -r8, lsl #10
 3b8:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 3bc:	8a038904 	bhi	e27d4 <__bss_end+0xd57d4>
 3c0:	02018e02 	andeq	r8, r1, #2, 28
 3c4:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 3c8:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 3cc:	00000ec4 	andeq	r0, r0, r4, asr #29
