
oled_screen_test/kernel.elf:     file format elf32-littlearm


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
    8038:	eb00005d 	bl	81b4 <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	0012d000 	andseq	sp, r2, r0
    8048:	0011c000 	andseq	ip, r1, r0
    804c:	0000b000 	andeq	fp, r0, r0
    8050:	0000c000 	andeq	ip, r0, r0

00008054 <gpio_config>:
    8054:	e3510007 	cmp	r1, #7
    8058:	93500035 	cmpls	r0, #53	; 0x35
    805c:	812fff1e 	bxhi	lr
    8060:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    8064:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    8068:	e0832290 	umull	r2, r3, r0, r2
    806c:	e1a0c1a3 	lsr	ip, r3, #3
    8070:	e6ef307c 	uxtb	r3, ip
    8074:	e1a03103 	lsl	r3, r3, #2
    8078:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    807c:	e2833602 	add	r3, r3, #2097152	; 0x200000
    8080:	e5932000 	ldr	r2, [r3]
    8084:	e08cc10c 	add	ip, ip, ip, lsl #2
    8088:	e040008c 	sub	r0, r0, ip, lsl #1
    808c:	e6ef0070 	uxtb	r0, r0
    8090:	e0800080 	add	r0, r0, r0, lsl #1
    8094:	e3a0c007 	mov	ip, #7
    8098:	e1c2201c 	bic	r2, r2, ip, lsl r0
    809c:	e1820011 	orr	r0, r2, r1, lsl r0
    80a0:	e5830000 	str	r0, [r3]
    80a4:	e12fff1e 	bx	lr

000080a8 <gpio_set>:
    80a8:	e3500035 	cmp	r0, #53	; 0x35
    80ac:	812fff1e 	bxhi	lr
    80b0:	e350001f 	cmp	r0, #31
    80b4:	9a000006 	bls	80d4 <gpio_set+0x2c>
    80b8:	e2400020 	sub	r0, r0, #32
    80bc:	e3a03001 	mov	r3, #1
    80c0:	e1a00013 	lsl	r0, r3, r0
    80c4:	e3a03000 	mov	r3, #0
    80c8:	e3433f20 	movt	r3, #16160	; 0x3f20
    80cc:	e5830020 	str	r0, [r3, #32]
    80d0:	e12fff1e 	bx	lr
    80d4:	e3a03001 	mov	r3, #1
    80d8:	e1a00013 	lsl	r0, r3, r0
    80dc:	e3a03000 	mov	r3, #0
    80e0:	e3433f20 	movt	r3, #16160	; 0x3f20
    80e4:	e583001c 	str	r0, [r3, #28]
    80e8:	e12fff1e 	bx	lr

000080ec <gpio_clr>:
    80ec:	e3500035 	cmp	r0, #53	; 0x35
    80f0:	812fff1e 	bxhi	lr
    80f4:	e350001f 	cmp	r0, #31
    80f8:	9a000006 	bls	8118 <gpio_clr+0x2c>
    80fc:	e2400020 	sub	r0, r0, #32
    8100:	e3a03001 	mov	r3, #1
    8104:	e1a00013 	lsl	r0, r3, r0
    8108:	e3a03000 	mov	r3, #0
    810c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8110:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8114:	e12fff1e 	bx	lr
    8118:	e3a03001 	mov	r3, #1
    811c:	e1a00013 	lsl	r0, r3, r0
    8120:	e3a03000 	mov	r3, #0
    8124:	e3433f20 	movt	r3, #16160	; 0x3f20
    8128:	e5830028 	str	r0, [r3, #40]	; 0x28
    812c:	e12fff1e 	bx	lr

00008130 <gpio_set_pull>:
    8130:	e3510002 	cmp	r1, #2
    8134:	93500035 	cmpls	r0, #53	; 0x35
    8138:	812fff1e 	bxhi	lr
    813c:	e92d4038 	push	{r3, r4, r5, lr}
    8140:	e1a04000 	mov	r4, r0
    8144:	e3a03000 	mov	r3, #0
    8148:	e3433f20 	movt	r3, #16160	; 0x3f20
    814c:	e5831094 	str	r1, [r3, #148]	; 0x94
    8150:	e3a00096 	mov	r0, #150	; 0x96
    8154:	eb00023d 	bl	8a50 <delay_cycles>
    8158:	e354001f 	cmp	r4, #31
    815c:	9a00000a 	bls	818c <gpio_set_pull+0x5c>
    8160:	e2440020 	sub	r0, r4, #32
    8164:	e3a04001 	mov	r4, #1
    8168:	e1a00014 	lsl	r0, r4, r0
    816c:	e3a05000 	mov	r5, #0
    8170:	e3435f20 	movt	r5, #16160	; 0x3f20
    8174:	e585009c 	str	r0, [r5, #156]	; 0x9c
    8178:	e3a00096 	mov	r0, #150	; 0x96
    817c:	eb000233 	bl	8a50 <delay_cycles>
    8180:	e3a03000 	mov	r3, #0
    8184:	e585309c 	str	r3, [r5, #156]	; 0x9c
    8188:	e8bd8038 	pop	{r3, r4, r5, pc}
    818c:	e3a00001 	mov	r0, #1
    8190:	e1a00410 	lsl	r0, r0, r4
    8194:	e3a05000 	mov	r5, #0
    8198:	e3435f20 	movt	r5, #16160	; 0x3f20
    819c:	e5850098 	str	r0, [r5, #152]	; 0x98
    81a0:	e3a00096 	mov	r0, #150	; 0x96
    81a4:	eb000229 	bl	8a50 <delay_cycles>
    81a8:	e3a03000 	mov	r3, #0
    81ac:	e5853098 	str	r3, [r5, #152]	; 0x98
    81b0:	e8bd8038 	pop	{r3, r4, r5, pc}

000081b4 <kernel_main>:
    81b4:	e92d43f8 	push	{r3, r4, r5, r6, r7, r8, r9, lr}
    81b8:	eb00019a 	bl	8828 <oled_init>
    81bc:	eb000166 	bl	875c <oled_buf_clr>
    81c0:	e3a04000 	mov	r4, #0
    81c4:	e1a05004 	mov	r5, r4
    81c8:	e1a08004 	mov	r8, r4
    81cc:	e1a09004 	mov	r9, r4
    81d0:	ea000001 	b	81dc <kernel_main+0x28>
    81d4:	e1a04008 	mov	r4, r8
    81d8:	e1a05006 	mov	r5, r6
    81dc:	e355001f 	cmp	r5, #31
    81e0:	c1a04008 	movgt	r4, r8
    81e4:	c1a05009 	movgt	r5, r9
    81e8:	e1a07004 	mov	r7, r4
    81ec:	e1a00005 	mov	r0, r5
    81f0:	e1a01004 	mov	r1, r4
    81f4:	eb000136 	bl	86d4 <oled_buf_pixel_set>
    81f8:	e2844001 	add	r4, r4, #1
    81fc:	e1a00005 	mov	r0, r5
    8200:	e1a01004 	mov	r1, r4
    8204:	eb000132 	bl	86d4 <oled_buf_pixel_set>
    8208:	e2856001 	add	r6, r5, #1
    820c:	e1a00006 	mov	r0, r6
    8210:	e1a01007 	mov	r1, r7
    8214:	eb00012e 	bl	86d4 <oled_buf_pixel_set>
    8218:	e1a00006 	mov	r0, r6
    821c:	e1a01004 	mov	r1, r4
    8220:	eb00012b 	bl	86d4 <oled_buf_pixel_set>
    8224:	eb0001d1 	bl	8970 <oled_buf_draw>
    8228:	e1a00005 	mov	r0, r5
    822c:	e1a01007 	mov	r1, r7
    8230:	eb000138 	bl	8718 <oled_buf_pixel_clr>
    8234:	e1a00005 	mov	r0, r5
    8238:	e1a01004 	mov	r1, r4
    823c:	eb000135 	bl	8718 <oled_buf_pixel_clr>
    8240:	e1a00006 	mov	r0, r6
    8244:	e1a01007 	mov	r1, r7
    8248:	eb000132 	bl	8718 <oled_buf_pixel_clr>
    824c:	e1a00006 	mov	r0, r6
    8250:	e1a01004 	mov	r1, r4
    8254:	eb00012f 	bl	8718 <oled_buf_pixel_clr>
    8258:	e354007f 	cmp	r4, #127	; 0x7f
    825c:	d1a06005 	movle	r6, r5
    8260:	daffffdc 	ble	81d8 <kernel_main+0x24>
    8264:	eaffffda 	b	81d4 <kernel_main+0x20>

00008268 <printnumk>:
    8268:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    826c:	e24dd008 	sub	sp, sp, #8
    8270:	e1a06002 	mov	r6, r2
    8274:	e1a07003 	mov	r7, r3
    8278:	e3500008 	cmp	r0, #8
    827c:	0a000004 	beq	8294 <printnumk+0x2c>
    8280:	e3098018 	movw	r8, #36888	; 0x9018
    8284:	e3408000 	movt	r8, #0
    8288:	e3500010 	cmp	r0, #16
    828c:	13a08000 	movne	r8, #0
    8290:	ea000001 	b	829c <printnumk+0x34>
    8294:	e3098014 	movw	r8, #36884	; 0x9014
    8298:	e3408000 	movt	r8, #0
    829c:	e28d4007 	add	r4, sp, #7
    82a0:	e1a05000 	mov	r5, r0
    82a4:	e3a09000 	mov	r9, #0
    82a8:	e309a000 	movw	sl, #36864	; 0x9000
    82ac:	e340a000 	movt	sl, #0
    82b0:	e1a00006 	mov	r0, r6
    82b4:	e1a01007 	mov	r1, r7
    82b8:	e1a02005 	mov	r2, r5
    82bc:	e1a03009 	mov	r3, r9
    82c0:	eb0001f3 	bl	8a94 <__aeabi_uldivmod>
    82c4:	e7da3002 	ldrb	r3, [sl, r2]
    82c8:	e4443001 	strb	r3, [r4], #-1
    82cc:	e1a00006 	mov	r0, r6
    82d0:	e1a01007 	mov	r1, r7
    82d4:	e1a02005 	mov	r2, r5
    82d8:	e1a03009 	mov	r3, r9
    82dc:	eb0001ec 	bl	8a94 <__aeabi_uldivmod>
    82e0:	e1a06000 	mov	r6, r0
    82e4:	e1a07001 	mov	r7, r1
    82e8:	e1963007 	orrs	r3, r6, r7
    82ec:	1affffef 	bne	82b0 <printnumk+0x48>
    82f0:	e3580000 	cmp	r8, #0
    82f4:	0a000002 	beq	8304 <printnumk+0x9c>
    82f8:	e5d80000 	ldrb	r0, [r8]
    82fc:	e3500000 	cmp	r0, #0
    8300:	1a000004 	bne	8318 <printnumk+0xb0>
    8304:	e2844001 	add	r4, r4, #1
    8308:	e28d3008 	add	r3, sp, #8
    830c:	e1540003 	cmp	r4, r3
    8310:	1a000005 	bne	832c <printnumk+0xc4>
    8314:	ea000009 	b	8340 <printnumk+0xd8>
    8318:	eb00007a 	bl	8508 <uart_put_byte>
    831c:	e5f80001 	ldrb	r0, [r8, #1]!
    8320:	e3500000 	cmp	r0, #0
    8324:	1afffffb 	bne	8318 <printnumk+0xb0>
    8328:	eafffff5 	b	8304 <printnumk+0x9c>
    832c:	e4d40001 	ldrb	r0, [r4], #1
    8330:	eb000074 	bl	8508 <uart_put_byte>
    8334:	e28d3008 	add	r3, sp, #8
    8338:	e1540003 	cmp	r4, r3
    833c:	1afffffa 	bne	832c <printnumk+0xc4>
    8340:	e28dd008 	add	sp, sp, #8
    8344:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

00008348 <printk>:
    8348:	e92d000f 	push	{r0, r1, r2, r3}
    834c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8350:	e24dd008 	sub	sp, sp, #8
    8354:	e59d4020 	ldr	r4, [sp, #32]
    8358:	e28d3024 	add	r3, sp, #36	; 0x24
    835c:	e58d3004 	str	r3, [sp, #4]
    8360:	e3a06000 	mov	r6, #0
    8364:	e3a08008 	mov	r8, #8
    8368:	e3a07010 	mov	r7, #16
    836c:	ea00005c 	b	84e4 <printk+0x19c>
    8370:	e3500025 	cmp	r0, #37	; 0x25
    8374:	0a000002 	beq	8384 <printk+0x3c>
    8378:	e2844001 	add	r4, r4, #1
    837c:	eb000061 	bl	8508 <uart_put_byte>
    8380:	ea000057 	b	84e4 <printk+0x19c>
    8384:	e5d43001 	ldrb	r3, [r4, #1]
    8388:	e353006f 	cmp	r3, #111	; 0x6f
    838c:	0a00002c 	beq	8444 <printk+0xfc>
    8390:	8a000006 	bhi	83b0 <printk+0x68>
    8394:	e3530063 	cmp	r3, #99	; 0x63
    8398:	0a000045 	beq	84b4 <printk+0x16c>
    839c:	e3530064 	cmp	r3, #100	; 0x64
    83a0:	0a00000d 	beq	83dc <printk+0x94>
    83a4:	e3530025 	cmp	r3, #37	; 0x25
    83a8:	1a00004a 	bne	84d8 <printk+0x190>
    83ac:	ea000046 	b	84cc <printk+0x184>
    83b0:	e3530073 	cmp	r3, #115	; 0x73
    83b4:	0a000032 	beq	8484 <printk+0x13c>
    83b8:	8a000002 	bhi	83c8 <printk+0x80>
    83bc:	e3530070 	cmp	r3, #112	; 0x70
    83c0:	0a000027 	beq	8464 <printk+0x11c>
    83c4:	ea000043 	b	84d8 <printk+0x190>
    83c8:	e3530075 	cmp	r3, #117	; 0x75
    83cc:	0a000014 	beq	8424 <printk+0xdc>
    83d0:	e3530078 	cmp	r3, #120	; 0x78
    83d4:	0a000022 	beq	8464 <printk+0x11c>
    83d8:	ea00003e 	b	84d8 <printk+0x190>
    83dc:	e59d3004 	ldr	r3, [sp, #4]
    83e0:	e2832004 	add	r2, r3, #4
    83e4:	e58d2004 	str	r2, [sp, #4]
    83e8:	e5935000 	ldr	r5, [r3]
    83ec:	e3550000 	cmp	r5, #0
    83f0:	aa000006 	bge	8410 <printk+0xc8>
    83f4:	e3a0002d 	mov	r0, #45	; 0x2d
    83f8:	eb000042 	bl	8508 <uart_put_byte>
    83fc:	e2652000 	rsb	r2, r5, #0
    8400:	e3a0000a 	mov	r0, #10
    8404:	e1a03fc2 	asr	r3, r2, #31
    8408:	ebffff96 	bl	8268 <printnumk>
    840c:	ea000033 	b	84e0 <printk+0x198>
    8410:	e3a0000a 	mov	r0, #10
    8414:	e1a02005 	mov	r2, r5
    8418:	e1a03fc5 	asr	r3, r5, #31
    841c:	ebffff91 	bl	8268 <printnumk>
    8420:	ea00002e 	b	84e0 <printk+0x198>
    8424:	e59d3004 	ldr	r3, [sp, #4]
    8428:	e2832004 	add	r2, r3, #4
    842c:	e58d2004 	str	r2, [sp, #4]
    8430:	e3a0000a 	mov	r0, #10
    8434:	e5932000 	ldr	r2, [r3]
    8438:	e1a03006 	mov	r3, r6
    843c:	ebffff89 	bl	8268 <printnumk>
    8440:	ea000026 	b	84e0 <printk+0x198>
    8444:	e59d3004 	ldr	r3, [sp, #4]
    8448:	e2832004 	add	r2, r3, #4
    844c:	e58d2004 	str	r2, [sp, #4]
    8450:	e1a00008 	mov	r0, r8
    8454:	e5932000 	ldr	r2, [r3]
    8458:	e1a03006 	mov	r3, r6
    845c:	ebffff81 	bl	8268 <printnumk>
    8460:	ea00001e 	b	84e0 <printk+0x198>
    8464:	e59d3004 	ldr	r3, [sp, #4]
    8468:	e2832004 	add	r2, r3, #4
    846c:	e58d2004 	str	r2, [sp, #4]
    8470:	e1a00007 	mov	r0, r7
    8474:	e5932000 	ldr	r2, [r3]
    8478:	e1a03006 	mov	r3, r6
    847c:	ebffff79 	bl	8268 <printnumk>
    8480:	ea000016 	b	84e0 <printk+0x198>
    8484:	e59d3004 	ldr	r3, [sp, #4]
    8488:	e2832004 	add	r2, r3, #4
    848c:	e58d2004 	str	r2, [sp, #4]
    8490:	e5935000 	ldr	r5, [r3]
    8494:	e5d50000 	ldrb	r0, [r5]
    8498:	e3500000 	cmp	r0, #0
    849c:	0a00000f 	beq	84e0 <printk+0x198>
    84a0:	eb000018 	bl	8508 <uart_put_byte>
    84a4:	e5f50001 	ldrb	r0, [r5, #1]!
    84a8:	e3500000 	cmp	r0, #0
    84ac:	1afffffb 	bne	84a0 <printk+0x158>
    84b0:	ea00000a 	b	84e0 <printk+0x198>
    84b4:	e59d3004 	ldr	r3, [sp, #4]
    84b8:	e2832004 	add	r2, r3, #4
    84bc:	e58d2004 	str	r2, [sp, #4]
    84c0:	e5d30000 	ldrb	r0, [r3]
    84c4:	eb00000f 	bl	8508 <uart_put_byte>
    84c8:	ea000004 	b	84e0 <printk+0x198>
    84cc:	e3a00025 	mov	r0, #37	; 0x25
    84d0:	eb00000c 	bl	8508 <uart_put_byte>
    84d4:	ea000001 	b	84e0 <printk+0x198>
    84d8:	e3e00000 	mvn	r0, #0
    84dc:	ea000003 	b	84f0 <printk+0x1a8>
    84e0:	e2844002 	add	r4, r4, #2
    84e4:	e5d40000 	ldrb	r0, [r4]
    84e8:	e3500000 	cmp	r0, #0
    84ec:	1affff9f 	bne	8370 <printk+0x28>
    84f0:	e28dd008 	add	sp, sp, #8
    84f4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    84f8:	e28dd010 	add	sp, sp, #16
    84fc:	e12fff1e 	bx	lr

00008500 <uart_init>:
    8500:	e12fff1e 	bx	lr

00008504 <uart_close>:
    8504:	e12fff1e 	bx	lr

00008508 <uart_put_byte>:
    8508:	e12fff1e 	bx	lr

0000850c <uart_get_byte>:
    850c:	e3a00000 	mov	r0, #0
    8510:	e12fff1e 	bx	lr

00008514 <i2c_master_init>:
    8514:	e12fff1e 	bx	lr

00008518 <i2c_master_write>:
    8518:	e3a00000 	mov	r0, #0
    851c:	e12fff1e 	bx	lr

00008520 <i2c_master_read>:
    8520:	e3a00000 	mov	r0, #0
    8524:	e12fff1e 	bx	lr

00008528 <adc_init>:
    8528:	e12fff1e 	bx	lr

0000852c <adc_read>:
    852c:	e3a00000 	mov	r0, #0
    8530:	e12fff1e 	bx	lr

00008534 <wait>:
    8534:	e2403001 	sub	r3, r0, #1
    8538:	e3500000 	cmp	r0, #0
    853c:	012fff1e 	bxeq	lr
    8540:	e1a00000 	nop			; (mov r0, r0)
    8544:	e2433001 	sub	r3, r3, #1
    8548:	e3730001 	cmn	r3, #1
    854c:	1afffffb 	bne	8540 <wait+0xc>
    8550:	e12fff1e 	bx	lr

00008554 <spi_master_init>:
    8554:	e92d4010 	push	{r4, lr}
    8558:	e1a04001 	mov	r4, r1
    855c:	e3a00007 	mov	r0, #7
    8560:	e3a01004 	mov	r1, #4
    8564:	ebfffeba 	bl	8054 <gpio_config>
    8568:	e3a00008 	mov	r0, #8
    856c:	e3a01004 	mov	r1, #4
    8570:	ebfffeb7 	bl	8054 <gpio_config>
    8574:	e3a0000a 	mov	r0, #10
    8578:	e3a01004 	mov	r1, #4
    857c:	ebfffeb4 	bl	8054 <gpio_config>
    8580:	e3a0000b 	mov	r0, #11
    8584:	e3a01004 	mov	r1, #4
    8588:	ebfffeb1 	bl	8054 <gpio_config>
    858c:	e3a03901 	mov	r3, #16384	; 0x4000
    8590:	e3433f20 	movt	r3, #16160	; 0x3f20
    8594:	e3a02000 	mov	r2, #0
    8598:	e5832000 	str	r2, [r3]
    859c:	e5932000 	ldr	r2, [r3]
    85a0:	e3822030 	orr	r2, r2, #48	; 0x30
    85a4:	e5832000 	str	r2, [r3]
    85a8:	e5932000 	ldr	r2, [r3]
    85ac:	e3c2200f 	bic	r2, r2, #15
    85b0:	e3822040 	orr	r2, r2, #64	; 0x40
    85b4:	e5832000 	str	r2, [r3]
    85b8:	e5834008 	str	r4, [r3, #8]
    85bc:	e3020710 	movw	r0, #10000	; 0x2710
    85c0:	ebffffdb 	bl	8534 <wait>
    85c4:	e8bd8010 	pop	{r4, pc}

000085c8 <spi_begin>:
    85c8:	e3a03901 	mov	r3, #16384	; 0x4000
    85cc:	e3433f20 	movt	r3, #16160	; 0x3f20
    85d0:	e3a02000 	mov	r2, #0
    85d4:	e5832000 	str	r2, [r3]
    85d8:	e5932000 	ldr	r2, [r3]
    85dc:	e3822030 	orr	r2, r2, #48	; 0x30
    85e0:	e5832000 	str	r2, [r3]
    85e4:	e5932000 	ldr	r2, [r3]
    85e8:	e3c2200f 	bic	r2, r2, #15
    85ec:	e3822040 	orr	r2, r2, #64	; 0x40
    85f0:	e5832000 	str	r2, [r3]
    85f4:	e5831008 	str	r1, [r3, #8]
    85f8:	e12fff1e 	bx	lr

000085fc <spi_end>:
    85fc:	e3a03901 	mov	r3, #16384	; 0x4000
    8600:	e3433f20 	movt	r3, #16160	; 0x3f20
    8604:	e5932000 	ldr	r2, [r3]
    8608:	e3c22080 	bic	r2, r2, #128	; 0x80
    860c:	e5832000 	str	r2, [r3]
    8610:	e12fff1e 	bx	lr

00008614 <spi_transfer>:
    8614:	e92d4070 	push	{r4, r5, r6, lr}
    8618:	e1a06000 	mov	r6, r0
    861c:	e3a03901 	mov	r3, #16384	; 0x4000
    8620:	e3433f20 	movt	r3, #16160	; 0x3f20
    8624:	e5932000 	ldr	r2, [r3]
    8628:	e38220b0 	orr	r2, r2, #176	; 0xb0
    862c:	e5832000 	str	r2, [r3]
    8630:	e5933000 	ldr	r3, [r3]
    8634:	e3130701 	tst	r3, #262144	; 0x40000
    8638:	1a000007 	bne	865c <spi_transfer+0x48>
    863c:	e3a05001 	mov	r5, #1
    8640:	e3a04901 	mov	r4, #16384	; 0x4000
    8644:	e3434f20 	movt	r4, #16160	; 0x3f20
    8648:	e1a00005 	mov	r0, r5
    864c:	ebffffb8 	bl	8534 <wait>
    8650:	e5943000 	ldr	r3, [r4]
    8654:	e3130701 	tst	r3, #262144	; 0x40000
    8658:	0afffffa 	beq	8648 <spi_transfer+0x34>
    865c:	e3a03901 	mov	r3, #16384	; 0x4000
    8660:	e3433f20 	movt	r3, #16160	; 0x3f20
    8664:	e5836004 	str	r6, [r3, #4]
    8668:	e5933000 	ldr	r3, [r3]
    866c:	e3130801 	tst	r3, #65536	; 0x10000
    8670:	1a000007 	bne	8694 <spi_transfer+0x80>
    8674:	e3a05001 	mov	r5, #1
    8678:	e3a04901 	mov	r4, #16384	; 0x4000
    867c:	e3434f20 	movt	r4, #16160	; 0x3f20
    8680:	e1a00005 	mov	r0, r5
    8684:	ebffffaa 	bl	8534 <wait>
    8688:	e5943000 	ldr	r3, [r4]
    868c:	e3130801 	tst	r3, #65536	; 0x10000
    8690:	0afffffa 	beq	8680 <spi_transfer+0x6c>
    8694:	e3a03901 	mov	r3, #16384	; 0x4000
    8698:	e3433f20 	movt	r3, #16160	; 0x3f20
    869c:	e5930004 	ldr	r0, [r3, #4]
    86a0:	e5932000 	ldr	r2, [r3]
    86a4:	e3c22080 	bic	r2, r2, #128	; 0x80
    86a8:	e5832000 	str	r2, [r3]
    86ac:	e6ef0070 	uxtb	r0, r0
    86b0:	e8bd8070 	pop	{r4, r5, r6, pc}

000086b4 <delay>:
    86b4:	e2403001 	sub	r3, r0, #1
    86b8:	e3500000 	cmp	r0, #0
    86bc:	012fff1e 	bxeq	lr
    86c0:	e1a00000 	nop			; (mov r0, r0)
    86c4:	e2433001 	sub	r3, r3, #1
    86c8:	e3730001 	cmn	r3, #1
    86cc:	1afffffb 	bne	86c0 <delay+0xc>
    86d0:	e12fff1e 	bx	lr

000086d4 <oled_buf_pixel_set>:
    86d4:	e350001f 	cmp	r0, #31
    86d8:	9351007f 	cmpls	r1, #127	; 0x7f
    86dc:	8a00000b 	bhi	8710 <oled_buf_pixel_set+0x3c>
    86e0:	e260001f 	rsb	r0, r0, #31
    86e4:	e261107f 	rsb	r1, r1, #127	; 0x7f
    86e8:	e1a031a0 	lsr	r3, r0, #3
    86ec:	e0811383 	add	r1, r1, r3, lsl #7
    86f0:	e30b2004 	movw	r2, #45060	; 0xb004
    86f4:	e3402000 	movt	r2, #0
    86f8:	e2003007 	and	r3, r0, #7
    86fc:	e3a00001 	mov	r0, #1
    8700:	e7d2c001 	ldrb	ip, [r2, r1]
    8704:	e18c3310 	orr	r3, ip, r0, lsl r3
    8708:	e7c23001 	strb	r3, [r2, r1]
    870c:	e12fff1e 	bx	lr
    8710:	e3a00000 	mov	r0, #0
    8714:	e12fff1e 	bx	lr

00008718 <oled_buf_pixel_clr>:
    8718:	e350001f 	cmp	r0, #31
    871c:	9351007f 	cmpls	r1, #127	; 0x7f
    8720:	8a00000b 	bhi	8754 <oled_buf_pixel_clr+0x3c>
    8724:	e260001f 	rsb	r0, r0, #31
    8728:	e261107f 	rsb	r1, r1, #127	; 0x7f
    872c:	e1a031a0 	lsr	r3, r0, #3
    8730:	e0811383 	add	r1, r1, r3, lsl #7
    8734:	e30b2004 	movw	r2, #45060	; 0xb004
    8738:	e3402000 	movt	r2, #0
    873c:	e2003007 	and	r3, r0, #7
    8740:	e3a00001 	mov	r0, #1
    8744:	e7d2c001 	ldrb	ip, [r2, r1]
    8748:	e1cc3310 	bic	r3, ip, r0, lsl r3
    874c:	e7c23001 	strb	r3, [r2, r1]
    8750:	e12fff1e 	bx	lr
    8754:	e3a00000 	mov	r0, #0
    8758:	e12fff1e 	bx	lr

0000875c <oled_buf_clr>:
    875c:	e59f3018 	ldr	r3, [pc, #24]	; 877c <oled_buf_clr+0x20>
    8760:	e2831080 	add	r1, r3, #128	; 0x80
    8764:	e3a02000 	mov	r2, #0
    8768:	e5e32001 	strb	r2, [r3, #1]!
    876c:	e1530001 	cmp	r3, r1
    8770:	1afffffc 	bne	8768 <oled_buf_clr+0xc>
    8774:	e3a00001 	mov	r0, #1
    8778:	e12fff1e 	bx	lr
    877c:	0000b003 	andeq	fp, r0, r3

00008780 <oled_write_command>:
    8780:	e92d4010 	push	{r4, lr}
    8784:	e1a04000 	mov	r4, r0
    8788:	e3a00009 	mov	r0, #9
    878c:	ebfffe56 	bl	80ec <gpio_clr>
    8790:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    8794:	ebffffc6 	bl	86b4 <delay>
    8798:	e3a00000 	mov	r0, #0
    879c:	e3a01040 	mov	r1, #64	; 0x40
    87a0:	ebffff88 	bl	85c8 <spi_begin>
    87a4:	e1a00004 	mov	r0, r4
    87a8:	ebffff99 	bl	8614 <spi_transfer>
    87ac:	ebffff92 	bl	85fc <spi_end>
    87b0:	e8bd8010 	pop	{r4, pc}

000087b4 <oled_write_data>:
    87b4:	e92d4010 	push	{r4, lr}
    87b8:	e1a04000 	mov	r4, r0
    87bc:	e3a00009 	mov	r0, #9
    87c0:	ebfffe38 	bl	80a8 <gpio_set>
    87c4:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    87c8:	ebffffb9 	bl	86b4 <delay>
    87cc:	e3a00000 	mov	r0, #0
    87d0:	e3a01020 	mov	r1, #32
    87d4:	ebffff7b 	bl	85c8 <spi_begin>
    87d8:	e1a00004 	mov	r0, r4
    87dc:	ebffff8c 	bl	8614 <spi_transfer>
    87e0:	ebffff85 	bl	85fc <spi_end>
    87e4:	e8bd8010 	pop	{r4, pc}

000087e8 <oled_reset>:
    87e8:	e92d4008 	push	{r3, lr}
    87ec:	e3a00010 	mov	r0, #16
    87f0:	e3a01001 	mov	r1, #1
    87f4:	ebfffe16 	bl	8054 <gpio_config>
    87f8:	e3a00010 	mov	r0, #16
    87fc:	ebfffe29 	bl	80a8 <gpio_set>
    8800:	e30806a0 	movw	r0, #34464	; 0x86a0
    8804:	e3400001 	movt	r0, #1
    8808:	ebffffa9 	bl	86b4 <delay>
    880c:	e3a00010 	mov	r0, #16
    8810:	ebfffe35 	bl	80ec <gpio_clr>
    8814:	e30c0350 	movw	r0, #50000	; 0xc350
    8818:	ebffffa5 	bl	86b4 <delay>
    881c:	e3a00010 	mov	r0, #16
    8820:	ebfffe20 	bl	80a8 <gpio_set>
    8824:	e8bd8008 	pop	{r3, pc}

00008828 <oled_init>:
    8828:	e92d4008 	push	{r3, lr}
    882c:	ebffffed 	bl	87e8 <oled_reset>
    8830:	e3a00010 	mov	r0, #16
    8834:	e3a01001 	mov	r1, #1
    8838:	ebfffe05 	bl	8054 <gpio_config>
    883c:	e3a00009 	mov	r0, #9
    8840:	e3a01001 	mov	r1, #1
    8844:	ebfffe02 	bl	8054 <gpio_config>
    8848:	e3a00010 	mov	r0, #16
    884c:	ebfffe15 	bl	80a8 <gpio_set>
    8850:	e3a00009 	mov	r0, #9
    8854:	ebfffe24 	bl	80ec <gpio_clr>
    8858:	e3020710 	movw	r0, #10000	; 0x2710
    885c:	ebffff94 	bl	86b4 <delay>
    8860:	e3a00000 	mov	r0, #0
    8864:	e3a01020 	mov	r1, #32
    8868:	ebffff39 	bl	8554 <spi_master_init>
    886c:	e3a000ae 	mov	r0, #174	; 0xae
    8870:	ebffffc2 	bl	8780 <oled_write_command>
    8874:	e3a000d5 	mov	r0, #213	; 0xd5
    8878:	ebffffc0 	bl	8780 <oled_write_command>
    887c:	e3a00080 	mov	r0, #128	; 0x80
    8880:	ebffffbe 	bl	8780 <oled_write_command>
    8884:	e3a000a8 	mov	r0, #168	; 0xa8
    8888:	ebffffbc 	bl	8780 <oled_write_command>
    888c:	e3a0001f 	mov	r0, #31
    8890:	ebffffba 	bl	8780 <oled_write_command>
    8894:	e3a000d3 	mov	r0, #211	; 0xd3
    8898:	ebffffb8 	bl	8780 <oled_write_command>
    889c:	e3a00000 	mov	r0, #0
    88a0:	ebffffb6 	bl	8780 <oled_write_command>
    88a4:	e3a00040 	mov	r0, #64	; 0x40
    88a8:	ebffffb4 	bl	8780 <oled_write_command>
    88ac:	e3a0008d 	mov	r0, #141	; 0x8d
    88b0:	ebffffb2 	bl	8780 <oled_write_command>
    88b4:	e3a00014 	mov	r0, #20
    88b8:	ebffffb0 	bl	8780 <oled_write_command>
    88bc:	e3a00020 	mov	r0, #32
    88c0:	ebffffae 	bl	8780 <oled_write_command>
    88c4:	e3a00000 	mov	r0, #0
    88c8:	ebffffac 	bl	8780 <oled_write_command>
    88cc:	e3a000a1 	mov	r0, #161	; 0xa1
    88d0:	ebffffaa 	bl	8780 <oled_write_command>
    88d4:	e3a000c8 	mov	r0, #200	; 0xc8
    88d8:	ebffffa8 	bl	8780 <oled_write_command>
    88dc:	e3a000da 	mov	r0, #218	; 0xda
    88e0:	ebffffa6 	bl	8780 <oled_write_command>
    88e4:	e3a00002 	mov	r0, #2
    88e8:	ebffffa4 	bl	8780 <oled_write_command>
    88ec:	e3a00081 	mov	r0, #129	; 0x81
    88f0:	ebffffa2 	bl	8780 <oled_write_command>
    88f4:	e3a0008f 	mov	r0, #143	; 0x8f
    88f8:	ebffffa0 	bl	8780 <oled_write_command>
    88fc:	e3a000d9 	mov	r0, #217	; 0xd9
    8900:	ebffff9e 	bl	8780 <oled_write_command>
    8904:	e3a000f1 	mov	r0, #241	; 0xf1
    8908:	ebffff9c 	bl	8780 <oled_write_command>
    890c:	e3a000db 	mov	r0, #219	; 0xdb
    8910:	ebffff9a 	bl	8780 <oled_write_command>
    8914:	e3a00040 	mov	r0, #64	; 0x40
    8918:	ebffff98 	bl	8780 <oled_write_command>
    891c:	e3a000a4 	mov	r0, #164	; 0xa4
    8920:	ebffff96 	bl	8780 <oled_write_command>
    8924:	e3a000a6 	mov	r0, #166	; 0xa6
    8928:	ebffff94 	bl	8780 <oled_write_command>
    892c:	e3a000af 	mov	r0, #175	; 0xaf
    8930:	ebffff92 	bl	8780 <oled_write_command>
    8934:	e8bd8008 	pop	{r3, pc}

00008938 <oled_start_sequence>:
    8938:	e92d4008 	push	{r3, lr}
    893c:	e3a00021 	mov	r0, #33	; 0x21
    8940:	ebffff8e 	bl	8780 <oled_write_command>
    8944:	e3a00000 	mov	r0, #0
    8948:	ebffff8c 	bl	8780 <oled_write_command>
    894c:	e3a0007f 	mov	r0, #127	; 0x7f
    8950:	ebffff8a 	bl	8780 <oled_write_command>
    8954:	e3a00022 	mov	r0, #34	; 0x22
    8958:	ebffff88 	bl	8780 <oled_write_command>
    895c:	e3a00000 	mov	r0, #0
    8960:	ebffff86 	bl	8780 <oled_write_command>
    8964:	e3a00003 	mov	r0, #3
    8968:	ebffff84 	bl	8780 <oled_write_command>
    896c:	e8bd8008 	pop	{r3, pc}

00008970 <oled_buf_draw>:
    8970:	e92d4038 	push	{r3, r4, r5, lr}
    8974:	ebffffef 	bl	8938 <oled_start_sequence>
    8978:	e3a00009 	mov	r0, #9
    897c:	ebfffdc9 	bl	80a8 <gpio_set>
    8980:	e3a00000 	mov	r0, #0
    8984:	e3a01020 	mov	r1, #32
    8988:	ebffff0e 	bl	85c8 <spi_begin>
    898c:	e59f401c 	ldr	r4, [pc, #28]	; 89b0 <oled_buf_draw+0x40>
    8990:	e2845c02 	add	r5, r4, #512	; 0x200
    8994:	e5f40001 	ldrb	r0, [r4, #1]!
    8998:	ebffff1d 	bl	8614 <spi_transfer>
    899c:	e1540005 	cmp	r4, r5
    89a0:	1afffffb 	bne	8994 <oled_buf_draw+0x24>
    89a4:	ebffff14 	bl	85fc <spi_end>
    89a8:	e3a00001 	mov	r0, #1
    89ac:	e8bd8038 	pop	{r3, r4, r5, pc}
    89b0:	0000b003 	andeq	fp, r0, r3

000089b4 <oled_scroll_test>:
    89b4:	e92d4038 	push	{r3, r4, r5, lr}
    89b8:	ebffffde 	bl	8938 <oled_start_sequence>
    89bc:	e3a00009 	mov	r0, #9
    89c0:	ebfffdb8 	bl	80a8 <gpio_set>
    89c4:	e3a00000 	mov	r0, #0
    89c8:	e3a01020 	mov	r1, #32
    89cc:	ebfffefd 	bl	85c8 <spi_begin>
    89d0:	e3a04c02 	mov	r4, #512	; 0x200
    89d4:	e30b5000 	movw	r5, #45056	; 0xb000
    89d8:	e3405000 	movt	r5, #0
    89dc:	e5950000 	ldr	r0, [r5]
    89e0:	e2803001 	add	r3, r0, #1
    89e4:	e5853000 	str	r3, [r5]
    89e8:	e6ef0070 	uxtb	r0, r0
    89ec:	ebffff08 	bl	8614 <spi_transfer>
    89f0:	e2544001 	subs	r4, r4, #1
    89f4:	1afffff8 	bne	89dc <oled_scroll_test+0x28>
    89f8:	ebfffeff 	bl	85fc <spi_end>
    89fc:	e30b3000 	movw	r3, #45056	; 0xb000
    8a00:	e3403000 	movt	r3, #0
    8a04:	e5932000 	ldr	r2, [r3]
    8a08:	e2822001 	add	r2, r2, #1
    8a0c:	e5832000 	str	r2, [r3]
    8a10:	e8bd8038 	pop	{r3, r4, r5, pc}

00008a14 <oled_clear_screen>:
    8a14:	e92d4038 	push	{r3, r4, r5, lr}
    8a18:	ebffffc6 	bl	8938 <oled_start_sequence>
    8a1c:	e3a00009 	mov	r0, #9
    8a20:	ebfffda0 	bl	80a8 <gpio_set>
    8a24:	e3a00000 	mov	r0, #0
    8a28:	e3a01020 	mov	r1, #32
    8a2c:	ebfffee5 	bl	85c8 <spi_begin>
    8a30:	e3a04c02 	mov	r4, #512	; 0x200
    8a34:	e3a05000 	mov	r5, #0
    8a38:	e1a00005 	mov	r0, r5
    8a3c:	ebfffef4 	bl	8614 <spi_transfer>
    8a40:	e2544001 	subs	r4, r4, #1
    8a44:	1afffffb 	bne	8a38 <oled_clear_screen+0x24>
    8a48:	ebfffeeb 	bl	85fc <spi_end>
    8a4c:	e8bd8038 	pop	{r3, r4, r5, pc}

00008a50 <delay_cycles>:
    8a50:	e2500001 	subs	r0, r0, #1
    8a54:	1afffffd 	bne	8a50 <delay_cycles>
    8a58:	e1a0f00e 	mov	pc, lr

00008a5c <read_cpsr>:
    8a5c:	e10f0000 	mrs	r0, CPSR
    8a60:	e1a0f00e 	mov	pc, lr

00008a64 <write_cpsr>:
    8a64:	e129f000 	msr	CPSR_fc, r0
    8a68:	e1a0f00e 	mov	pc, lr

00008a6c <disable_interrupts>:
    8a6c:	e10f0000 	mrs	r0, CPSR
    8a70:	e3a01d07 	mov	r1, #448	; 0x1c0
    8a74:	e1800001 	orr	r0, r0, r1
    8a78:	e129f000 	msr	CPSR_fc, r0
    8a7c:	e1a0f00e 	mov	pc, lr

00008a80 <enable_interrupts>:
    8a80:	e10f0000 	mrs	r0, CPSR
    8a84:	e3a01d07 	mov	r1, #448	; 0x1c0
    8a88:	e1c00001 	bic	r0, r0, r1
    8a8c:	e129f000 	msr	CPSR_fc, r0
    8a90:	e1a0f00e 	mov	pc, lr

00008a94 <__aeabi_uldivmod>:
    8a94:	e3530000 	cmp	r3, #0
    8a98:	03520000 	cmpeq	r2, #0
    8a9c:	1a000004 	bne	8ab4 <__aeabi_uldivmod+0x20>
    8aa0:	e3510000 	cmp	r1, #0
    8aa4:	03500000 	cmpeq	r0, #0
    8aa8:	13e01000 	mvnne	r1, #0
    8aac:	13e00000 	mvnne	r0, #0
    8ab0:	ea000027 	b	8b54 <__aeabi_idiv0>
    8ab4:	e24dd008 	sub	sp, sp, #8
    8ab8:	e92d6000 	push	{sp, lr}
    8abc:	eb000014 	bl	8b14 <__gnu_uldivmod_helper>
    8ac0:	e59de004 	ldr	lr, [sp, #4]
    8ac4:	e28dd008 	add	sp, sp, #8
    8ac8:	e8bd000c 	pop	{r2, r3}
    8acc:	e12fff1e 	bx	lr

00008ad0 <__gnu_ldivmod_helper>:
    8ad0:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8ad4:	e59d6020 	ldr	r6, [sp, #32]
    8ad8:	e1a07002 	mov	r7, r2
    8adc:	e1a0a003 	mov	sl, r3
    8ae0:	e1a04000 	mov	r4, r0
    8ae4:	e1a05001 	mov	r5, r1
    8ae8:	eb00001a 	bl	8b58 <__divdi3>
    8aec:	e1a03000 	mov	r3, r0
    8af0:	e0020197 	mul	r2, r7, r1
    8af4:	e0898097 	umull	r8, r9, r7, r0
    8af8:	e023239a 	mla	r3, sl, r3, r2
    8afc:	e0544008 	subs	r4, r4, r8
    8b00:	e0839009 	add	r9, r3, r9
    8b04:	e0c55009 	sbc	r5, r5, r9
    8b08:	e8860030 	stm	r6, {r4, r5}
    8b0c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8b10:	e12fff1e 	bx	lr

00008b14 <__gnu_uldivmod_helper>:
    8b14:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8b18:	e59d5018 	ldr	r5, [sp, #24]
    8b1c:	e1a04002 	mov	r4, r2
    8b20:	e1a08003 	mov	r8, r3
    8b24:	e1a06000 	mov	r6, r0
    8b28:	e1a07001 	mov	r7, r1
    8b2c:	eb000067 	bl	8cd0 <__udivdi3>
    8b30:	e0080890 	mul	r8, r0, r8
    8b34:	e0832490 	umull	r2, r3, r0, r4
    8b38:	e0248491 	mla	r4, r1, r4, r8
    8b3c:	e0566002 	subs	r6, r6, r2
    8b40:	e0843003 	add	r3, r4, r3
    8b44:	e0c77003 	sbc	r7, r7, r3
    8b48:	e88500c0 	stm	r5, {r6, r7}
    8b4c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8b50:	e12fff1e 	bx	lr

00008b54 <__aeabi_idiv0>:
    8b54:	e12fff1e 	bx	lr

00008b58 <__divdi3>:
    8b58:	e3510000 	cmp	r1, #0
    8b5c:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8b60:	a1a04000 	movge	r4, r0
    8b64:	a1a05001 	movge	r5, r1
    8b68:	a3a0a000 	movge	sl, #0
    8b6c:	ba000053 	blt	8cc0 <__divdi3+0x168>
    8b70:	e3530000 	cmp	r3, #0
    8b74:	a1a08002 	movge	r8, r2
    8b78:	a1a09003 	movge	r9, r3
    8b7c:	ba00004b 	blt	8cb0 <__divdi3+0x158>
    8b80:	e1550009 	cmp	r5, r9
    8b84:	01540008 	cmpeq	r4, r8
    8b88:	33a02000 	movcc	r2, #0
    8b8c:	33a03000 	movcc	r3, #0
    8b90:	3a00003b 	bcc	8c84 <__divdi3+0x12c>
    8b94:	e1a01009 	mov	r1, r9
    8b98:	e1a00008 	mov	r0, r8
    8b9c:	eb000093 	bl	8df0 <__clzdi2>
    8ba0:	e1a01005 	mov	r1, r5
    8ba4:	e1a0b000 	mov	fp, r0
    8ba8:	e1a00004 	mov	r0, r4
    8bac:	eb00008f 	bl	8df0 <__clzdi2>
    8bb0:	e060000b 	rsb	r0, r0, fp
    8bb4:	e240e020 	sub	lr, r0, #32
    8bb8:	e1a07019 	lsl	r7, r9, r0
    8bbc:	e1877e18 	orr	r7, r7, r8, lsl lr
    8bc0:	e260c020 	rsb	ip, r0, #32
    8bc4:	e1877c38 	orr	r7, r7, r8, lsr ip
    8bc8:	e1550007 	cmp	r5, r7
    8bcc:	e1a06018 	lsl	r6, r8, r0
    8bd0:	01540006 	cmpeq	r4, r6
    8bd4:	e1a01000 	mov	r1, r0
    8bd8:	33a02000 	movcc	r2, #0
    8bdc:	33a03000 	movcc	r3, #0
    8be0:	3a000005 	bcc	8bfc <__divdi3+0xa4>
    8be4:	e3a08001 	mov	r8, #1
    8be8:	e0544006 	subs	r4, r4, r6
    8bec:	e1a03e18 	lsl	r3, r8, lr
    8bf0:	e1833c38 	orr	r3, r3, r8, lsr ip
    8bf4:	e0c55007 	sbc	r5, r5, r7
    8bf8:	e1a02018 	lsl	r2, r8, r0
    8bfc:	e3500000 	cmp	r0, #0
    8c00:	0a00001f 	beq	8c84 <__divdi3+0x12c>
    8c04:	e1b070a7 	lsrs	r7, r7, #1
    8c08:	e1a06066 	rrx	r6, r6
    8c0c:	ea000007 	b	8c30 <__divdi3+0xd8>
    8c10:	e0544006 	subs	r4, r4, r6
    8c14:	e0c55007 	sbc	r5, r5, r7
    8c18:	e0944004 	adds	r4, r4, r4
    8c1c:	e0a55005 	adc	r5, r5, r5
    8c20:	e2944001 	adds	r4, r4, #1
    8c24:	e2a55000 	adc	r5, r5, #0
    8c28:	e2500001 	subs	r0, r0, #1
    8c2c:	0a000006 	beq	8c4c <__divdi3+0xf4>
    8c30:	e1570005 	cmp	r7, r5
    8c34:	01560004 	cmpeq	r6, r4
    8c38:	9afffff4 	bls	8c10 <__divdi3+0xb8>
    8c3c:	e0944004 	adds	r4, r4, r4
    8c40:	e0a55005 	adc	r5, r5, r5
    8c44:	e2500001 	subs	r0, r0, #1
    8c48:	1afffff8 	bne	8c30 <__divdi3+0xd8>
    8c4c:	e261c020 	rsb	ip, r1, #32
    8c50:	e1a00134 	lsr	r0, r4, r1
    8c54:	e0922004 	adds	r2, r2, r4
    8c58:	e241e020 	sub	lr, r1, #32
    8c5c:	e1800c15 	orr	r0, r0, r5, lsl ip
    8c60:	e1a04135 	lsr	r4, r5, r1
    8c64:	e1800e35 	orr	r0, r0, r5, lsr lr
    8c68:	e1a07114 	lsl	r7, r4, r1
    8c6c:	e1877e10 	orr	r7, r7, r0, lsl lr
    8c70:	e1a06110 	lsl	r6, r0, r1
    8c74:	e0a33005 	adc	r3, r3, r5
    8c78:	e1877c30 	orr	r7, r7, r0, lsr ip
    8c7c:	e0522006 	subs	r2, r2, r6
    8c80:	e0c33007 	sbc	r3, r3, r7
    8c84:	e29a0000 	adds	r0, sl, #0
    8c88:	13a00001 	movne	r0, #1
    8c8c:	e3a01000 	mov	r1, #0
    8c90:	e2704000 	rsbs	r4, r0, #0
    8c94:	e2e15000 	rsc	r5, r1, #0
    8c98:	e0222004 	eor	r2, r2, r4
    8c9c:	e0233005 	eor	r3, r3, r5
    8ca0:	e0900002 	adds	r0, r0, r2
    8ca4:	e0a11003 	adc	r1, r1, r3
    8ca8:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8cac:	e12fff1e 	bx	lr
    8cb0:	e2728000 	rsbs	r8, r2, #0
    8cb4:	e1e0a00a 	mvn	sl, sl
    8cb8:	e2e39000 	rsc	r9, r3, #0
    8cbc:	eaffffaf 	b	8b80 <__divdi3+0x28>
    8cc0:	e2704000 	rsbs	r4, r0, #0
    8cc4:	e2e15000 	rsc	r5, r1, #0
    8cc8:	e3e0a000 	mvn	sl, #0
    8ccc:	eaffffa7 	b	8b70 <__divdi3+0x18>

00008cd0 <__udivdi3>:
    8cd0:	e1510003 	cmp	r1, r3
    8cd4:	01500002 	cmpeq	r0, r2
    8cd8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8cdc:	e1a04000 	mov	r4, r0
    8ce0:	e1a05001 	mov	r5, r1
    8ce4:	e1a08002 	mov	r8, r2
    8ce8:	e1a09003 	mov	r9, r3
    8cec:	33a00000 	movcc	r0, #0
    8cf0:	33a01000 	movcc	r1, #0
    8cf4:	3a00003b 	bcc	8de8 <__udivdi3+0x118>
    8cf8:	e1a01003 	mov	r1, r3
    8cfc:	e1a00002 	mov	r0, r2
    8d00:	eb00003a 	bl	8df0 <__clzdi2>
    8d04:	e1a01005 	mov	r1, r5
    8d08:	e1a0a000 	mov	sl, r0
    8d0c:	e1a00004 	mov	r0, r4
    8d10:	eb000036 	bl	8df0 <__clzdi2>
    8d14:	e060300a 	rsb	r3, r0, sl
    8d18:	e243e020 	sub	lr, r3, #32
    8d1c:	e1a07319 	lsl	r7, r9, r3
    8d20:	e1877e18 	orr	r7, r7, r8, lsl lr
    8d24:	e263c020 	rsb	ip, r3, #32
    8d28:	e1877c38 	orr	r7, r7, r8, lsr ip
    8d2c:	e1550007 	cmp	r5, r7
    8d30:	e1a06318 	lsl	r6, r8, r3
    8d34:	01540006 	cmpeq	r4, r6
    8d38:	e1a02003 	mov	r2, r3
    8d3c:	33a00000 	movcc	r0, #0
    8d40:	33a01000 	movcc	r1, #0
    8d44:	3a000005 	bcc	8d60 <__udivdi3+0x90>
    8d48:	e3a08001 	mov	r8, #1
    8d4c:	e0544006 	subs	r4, r4, r6
    8d50:	e1a01e18 	lsl	r1, r8, lr
    8d54:	e1811c38 	orr	r1, r1, r8, lsr ip
    8d58:	e0c55007 	sbc	r5, r5, r7
    8d5c:	e1a00318 	lsl	r0, r8, r3
    8d60:	e3530000 	cmp	r3, #0
    8d64:	0a00001f 	beq	8de8 <__udivdi3+0x118>
    8d68:	e1b070a7 	lsrs	r7, r7, #1
    8d6c:	e1a06066 	rrx	r6, r6
    8d70:	ea000007 	b	8d94 <__udivdi3+0xc4>
    8d74:	e0544006 	subs	r4, r4, r6
    8d78:	e0c55007 	sbc	r5, r5, r7
    8d7c:	e0944004 	adds	r4, r4, r4
    8d80:	e0a55005 	adc	r5, r5, r5
    8d84:	e2944001 	adds	r4, r4, #1
    8d88:	e2a55000 	adc	r5, r5, #0
    8d8c:	e2533001 	subs	r3, r3, #1
    8d90:	0a000006 	beq	8db0 <__udivdi3+0xe0>
    8d94:	e1570005 	cmp	r7, r5
    8d98:	01560004 	cmpeq	r6, r4
    8d9c:	9afffff4 	bls	8d74 <__udivdi3+0xa4>
    8da0:	e0944004 	adds	r4, r4, r4
    8da4:	e0a55005 	adc	r5, r5, r5
    8da8:	e2533001 	subs	r3, r3, #1
    8dac:	1afffff8 	bne	8d94 <__udivdi3+0xc4>
    8db0:	e0948000 	adds	r8, r4, r0
    8db4:	e0a59001 	adc	r9, r5, r1
    8db8:	e1a03234 	lsr	r3, r4, r2
    8dbc:	e2621020 	rsb	r1, r2, #32
    8dc0:	e2420020 	sub	r0, r2, #32
    8dc4:	e1833115 	orr	r3, r3, r5, lsl r1
    8dc8:	e1a0c235 	lsr	ip, r5, r2
    8dcc:	e1833035 	orr	r3, r3, r5, lsr r0
    8dd0:	e1a0721c 	lsl	r7, ip, r2
    8dd4:	e1877013 	orr	r7, r7, r3, lsl r0
    8dd8:	e1a06213 	lsl	r6, r3, r2
    8ddc:	e1877133 	orr	r7, r7, r3, lsr r1
    8de0:	e0580006 	subs	r0, r8, r6
    8de4:	e0c91007 	sbc	r1, r9, r7
    8de8:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8dec:	e12fff1e 	bx	lr

00008df0 <__clzdi2>:
    8df0:	e92d4010 	push	{r4, lr}
    8df4:	e3510000 	cmp	r1, #0
    8df8:	1a000002 	bne	8e08 <__clzdi2+0x18>
    8dfc:	eb000005 	bl	8e18 <__clzsi2>
    8e00:	e2800020 	add	r0, r0, #32
    8e04:	ea000001 	b	8e10 <__clzdi2+0x20>
    8e08:	e1a00001 	mov	r0, r1
    8e0c:	eb000001 	bl	8e18 <__clzsi2>
    8e10:	e8bd4010 	pop	{r4, lr}
    8e14:	e12fff1e 	bx	lr

00008e18 <__clzsi2>:
    8e18:	e3a0101c 	mov	r1, #28
    8e1c:	e3500801 	cmp	r0, #65536	; 0x10000
    8e20:	21a00820 	lsrcs	r0, r0, #16
    8e24:	22411010 	subcs	r1, r1, #16
    8e28:	e3500c01 	cmp	r0, #256	; 0x100
    8e2c:	21a00420 	lsrcs	r0, r0, #8
    8e30:	22411008 	subcs	r1, r1, #8
    8e34:	e3500010 	cmp	r0, #16
    8e38:	21a00220 	lsrcs	r0, r0, #4
    8e3c:	22411004 	subcs	r1, r1, #4
    8e40:	e28f2008 	add	r2, pc, #8
    8e44:	e7d20000 	ldrb	r0, [r2, r0]
    8e48:	e0800001 	add	r0, r0, r1
    8e4c:	e12fff1e 	bx	lr
    8e50:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    8e54:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

00009000 <__rodata_start>:
    9000:	33323130 	teqcc	r2, #48, 2
    9004:	37363534 			; <UNDEFINED> instruction: 0x37363534
    9008:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    900c:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .rodata.str1.4:

00009014 <.rodata.str1.4>:
    9014:	00000030 	andeq	r0, r0, r0, lsr r0
    9018:	00007830 	andeq	r7, r0, r0, lsr r8

Disassembly of section .ARM.exidx:

0000901c <.ARM.exidx>:
    901c:	7ffffb3c 	svcvc	0x00fffb3c
    9020:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000a000 <__data_start>:
    a000:	Address 0x0000a000 is out of bounds.


Disassembly of section .bss:

0000b000 <__bss_start>:
    b000:	00000000 	andeq	r0, r0, r0

0000b004 <_oled_frame_buffer>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	0000004a 	andeq	r0, r0, sl, asr #32
      10:	00012b01 	andeq	r2, r1, r1, lsl #22
      14:	00013e00 	andeq	r3, r1, r0, lsl #28
      18:	00805400 	addeq	r5, r0, r0, lsl #8
      1c:	00016000 	andeq	r6, r1, r0
      20:	00000000 	andeq	r0, r0, r0
      24:	08010200 	stmdaeq	r1, {r9}
      28:	000000d1 	ldrdeq	r0, [r0], -r1
      2c:	da080102 	ble	20043c <__end+0xd343c>
      30:	02000000 	andeq	r0, r0, #0
      34:	011a0502 	tsteq	sl, r2, lsl #10
      38:	04030000 	streq	r0, [r3], #-0
      3c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
      40:	05080200 	streq	r0, [r8, #-512]	; 0x200
      44:	00000000 	andeq	r0, r0, r0
      48:	0000c904 	andeq	ip, r0, r4, lsl #18
      4c:	25160200 	ldrcs	r0, [r6, #-512]	; 0x200
      50:	02000000 	andeq	r0, r0, #0
      54:	00f50702 	rscseq	r0, r5, r2, lsl #14
      58:	df040000 	svcle	0x00040000
      5c:	02000000 	andeq	r0, r0, #0
      60:	0000651a 	andeq	r6, r0, sl, lsl r5
      64:	07040200 	streq	r0, [r4, -r0, lsl #4]
      68:	00000034 	andeq	r0, r0, r4, lsr r0
      6c:	2a070802 	bcs	1c207c <__end+0x9507c>
      70:	05000000 	streq	r0, [r0, #-0]
      74:	0000010e 	andeq	r0, r0, lr, lsl #2
      78:	80545401 	subshi	r5, r4, r1, lsl #8
      7c:	00540000 	subseq	r0, r4, r0
      80:	9c010000 	stcls	0, cr0, [r1], {-0}
      84:	000000d2 	ldrdeq	r0, [r0], -r2
      88:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
      8c:	48540100 	ldmdami	r4, {r8}^
      90:	00000000 	andeq	r0, r0, r0
      94:	07000000 	streq	r0, [r0, -r0]
      98:	006e7566 	rsbeq	r7, lr, r6, ror #10
      9c:	00485401 	subeq	r5, r8, r1, lsl #8
      a0:	51010000 	mrspl	r0, (UNDEF: 1)
      a4:	67657208 	strbvs	r7, [r5, -r8, lsl #4]!
      a8:	5a590100 	bpl	16404b0 <__user_program+0x13404b0>
      ac:	21000000 	mrscs	r0, (UNDEF: 0)
      b0:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
      b4:	00000113 	andeq	r0, r0, r3, lsl r1
      b8:	005a5b01 	subseq	r5, sl, r1, lsl #22
      bc:	005a0000 	subseq	r0, sl, r0
      c0:	24090000 	strcs	r0, [r9], #-0
      c4:	01000001 	tsteq	r0, r1
      c8:	00005a5d 	andeq	r5, r0, sp, asr sl
      cc:	00007800 	andeq	r7, r0, r0, lsl #16
      d0:	21050000 	mrscs	r0, (UNDEF: 5)
      d4:	01000000 	mrseq	r0, (UNDEF: 0)
      d8:	0080a864 	addeq	sl, r0, r4, ror #16
      dc:	00004400 	andeq	r4, r0, r0, lsl #8
      e0:	f79c0100 			; <UNDEFINED> instruction: 0xf79c0100
      e4:	06000000 	streq	r0, [r0], -r0
      e8:	006e6970 	rsbeq	r6, lr, r0, ror r9
      ec:	00486401 	subeq	r6, r8, r1, lsl #8
      f0:	008b0000 	addeq	r0, fp, r0
      f4:	05000000 	streq	r0, [r0, #-0]
      f8:	00000041 	andeq	r0, r0, r1, asr #32
      fc:	80ec7001 	rschi	r7, ip, r1
     100:	00440000 	subeq	r0, r4, r0
     104:	9c010000 	stcls	0, cr0, [r1], {-0}
     108:	0000011c 	andeq	r0, r0, ip, lsl r1
     10c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     110:	48700100 	ldmdami	r0!, {r8}^
     114:	c5000000 	strgt	r0, [r0, #-0]
     118:	00000000 	andeq	r0, r0, r0
     11c:	00000e05 	andeq	r0, r0, r5, lsl #28
     120:	307c0100 	rsbscc	r0, ip, r0, lsl #2
     124:	84000081 	strhi	r0, [r0], #-129	; 0x81
     128:	01000000 	mrseq	r0, (UNDEF: 0)
     12c:	0001889c 	muleq	r1, ip, r8
     130:	69700600 	ldmdbvs	r0!, {r9, sl}^
     134:	7c01006e 	stcvc	0, cr0, [r1], {110}	; 0x6e
     138:	00000048 	andeq	r0, r0, r8, asr #32
     13c:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     140:	0001080a 	andeq	r0, r1, sl, lsl #16
     144:	487c0100 	ldmdami	ip!, {r8}^
     148:	20000000 	andcs	r0, r0, r0
     14c:	0b000001 	bleq	158 <__start-0x7ea8>
     150:	00008158 	andeq	r8, r0, r8, asr r1
     154:	000001a7 	andeq	r0, r0, r7, lsr #3
     158:	00000163 	andeq	r0, r0, r3, ror #2
     15c:	0250010c 	subseq	r0, r0, #12, 2
     160:	0b009608 	bleq	25988 <__bss_end+0x19988>
     164:	00008180 	andeq	r8, r0, r0, lsl #3
     168:	000001a7 	andeq	r0, r0, r7, lsr #3
     16c:	00000177 	andeq	r0, r0, r7, ror r1
     170:	0250010c 	subseq	r0, r0, #12, 2
     174:	0d009608 	stceq	6, cr9, [r0, #-32]	; 0xffffffe0
     178:	000081a8 	andeq	r8, r0, r8, lsr #3
     17c:	000001a7 	andeq	r0, r0, r7, lsr #3
     180:	0250010c 	subseq	r0, r0, #12, 2
     184:	00009608 	andeq	r9, r0, r8, lsl #12
     188:	00001c0e 	andeq	r1, r0, lr, lsl #24
     18c:	97510100 	ldrbls	r0, [r1, -r0, lsl #2]
     190:	00000001 	andeq	r0, r0, r1
     194:	0f3f2000 	svceq	0x003f2000
     198:	0000019c 	muleq	r0, ip, r1
     19c:	01a20410 			; <UNDEFINED> instruction: 0x01a20410
     1a0:	5a110000 	bpl	4401a8 <__user_program+0x1401a8>
     1a4:	12000000 	andne	r0, r0, #0
     1a8:	000000e8 	andeq	r0, r0, r8, ror #1
     1ac:	5a131903 	bpl	4c65c0 <__user_program+0x1c65c0>
     1b0:	00000000 	andeq	r0, r0, r0
     1b4:	0001e400 	andeq	lr, r1, r0, lsl #8
     1b8:	fe000400 	cdp2	4, 0, cr0, cr0, cr0, {0}
     1bc:	04000000 	streq	r0, [r0], #-0
     1c0:	00004a01 	andeq	r4, r0, r1, lsl #20
     1c4:	01710100 	cmneq	r1, r0, lsl #2
     1c8:	01b10000 			; <UNDEFINED> instruction: 0x01b10000
     1cc:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
     1d0:	00b40000 	adcseq	r0, r4, r0
     1d4:	00860000 	addeq	r0, r6, r0
     1d8:	01020000 	mrseq	r0, (UNDEF: 2)
     1dc:	0000da08 	andeq	sp, r0, r8, lsl #20
     1e0:	05020200 	streq	r0, [r2, #-512]	; 0x200
     1e4:	0000011a 	andeq	r0, r0, sl, lsl r1
     1e8:	69050403 	stmdbvs	r5, {r0, r1, sl}
     1ec:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     1f0:	00000508 	andeq	r0, r0, r8, lsl #10
     1f4:	c9040000 	stmdbgt	r4, {}	; <UNPREDICTABLE>
     1f8:	02000000 	andeq	r0, r0, #0
     1fc:	00004c16 	andeq	r4, r0, r6, lsl ip
     200:	08010200 	stmdaeq	r1, {r9}
     204:	000000d1 	ldrdeq	r0, [r0], -r1
     208:	f5070202 			; <UNDEFINED> instruction: 0xf5070202
     20c:	04000000 	streq	r0, [r0], #-0
     210:	000000df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     214:	00651a02 	rsbeq	r1, r5, r2, lsl #20
     218:	04020000 	streq	r0, [r2], #-0
     21c:	00003407 	andeq	r3, r0, r7, lsl #8
     220:	07080200 	streq	r0, [r8, -r0, lsl #4]
     224:	0000002a 	andeq	r0, r0, sl, lsr #32
     228:	0001a505 	andeq	sl, r1, r5, lsl #10
     22c:	b4110100 	ldrlt	r0, [r1], #-256	; 0x100
     230:	b4000081 	strlt	r0, [r0], #-129	; 0x81
     234:	01000000 	mrseq	r0, (UNDEF: 0)
     238:	00018e9c 	muleq	r1, ip, lr
     23c:	6f720600 	svcvs	0x00720600
     240:	12010077 	andne	r0, r1, #119	; 0x77
     244:	00000033 	andeq	r0, r0, r3, lsr r0
     248:	00000141 	andeq	r0, r0, r1, asr #2
     24c:	6c6f6306 	stclvs	3, cr6, [pc], #-24	; 23c <__start-0x7dc4>
     250:	33120100 	tstcc	r2, #0, 2
     254:	60000000 	andvs	r0, r0, r0
     258:	07000001 	streq	r0, [r0, -r1]
     25c:	000081bc 			; <UNDEFINED> instruction: 0x000081bc
     260:	0000018e 	andeq	r0, r0, lr, lsl #3
     264:	0081c007 	addeq	ip, r1, r7
     268:	00019500 	andeq	r9, r1, r0, lsl #10
     26c:	81f80800 	mvnshi	r0, r0, lsl #16
     270:	01a60000 			; <UNDEFINED> instruction: 0x01a60000
     274:	00d20000 	sbcseq	r0, r2, r0
     278:	01090000 	mrseq	r0, (UNDEF: 9)
     27c:	00740251 	rsbseq	r0, r4, r1, asr r2
     280:	02500109 	subseq	r0, r0, #1073741826	; 0x40000002
     284:	08000075 	stmdaeq	r0, {r0, r2, r4, r5, r6}
     288:	00008208 	andeq	r8, r0, r8, lsl #4
     28c:	000001a6 	andeq	r0, r0, r6, lsr #3
     290:	000000ec 	andeq	r0, r0, ip, ror #1
     294:	02510109 	subseq	r0, r1, #1073741826	; 0x40000002
     298:	01090074 	tsteq	r9, r4, ror r0
     29c:	00750250 	rsbseq	r0, r5, r0, asr r2
     2a0:	82180800 	andshi	r0, r8, #0, 16
     2a4:	01a60000 			; <UNDEFINED> instruction: 0x01a60000
     2a8:	01060000 	mrseq	r0, (UNDEF: 6)
     2ac:	01090000 	mrseq	r0, (UNDEF: 9)
     2b0:	00770251 	rsbseq	r0, r7, r1, asr r2
     2b4:	02500109 	subseq	r0, r0, #1073741826	; 0x40000002
     2b8:	08000076 	stmdaeq	r0, {r1, r2, r4, r5, r6}
     2bc:	00008224 	andeq	r8, r0, r4, lsr #4
     2c0:	000001a6 	andeq	r0, r0, r6, lsr #3
     2c4:	00000120 	andeq	r0, r0, r0, lsr #2
     2c8:	02510109 	subseq	r0, r1, #1073741826	; 0x40000002
     2cc:	01090074 	tsteq	r9, r4, ror r0
     2d0:	00760250 	rsbseq	r0, r6, r0, asr r2
     2d4:	82280700 	eorhi	r0, r8, #0, 14
     2d8:	01c00000 	biceq	r0, r0, r0
     2dc:	34080000 	strcc	r0, [r8], #-0
     2e0:	d1000082 	smlabble	r0, r2, r0, r0
     2e4:	43000001 	movwmi	r0, #1
     2e8:	09000001 	stmdbeq	r0, {r0}
     2ec:	77025101 	strvc	r5, [r2, -r1, lsl #2]
     2f0:	50010900 	andpl	r0, r1, r0, lsl #18
     2f4:	00007502 	andeq	r7, r0, r2, lsl #10
     2f8:	00824008 	addeq	r4, r2, r8
     2fc:	0001d100 	andeq	sp, r1, r0, lsl #2
     300:	00015d00 	andeq	r5, r1, r0, lsl #26
     304:	51010900 	tstpl	r1, r0, lsl #18
     308:	09007402 	stmdbeq	r0, {r1, sl, ip, sp, lr}
     30c:	75025001 	strvc	r5, [r2, #-1]
     310:	4c080000 	stcmi	0, cr0, [r8], {-0}
     314:	d1000082 	smlabble	r0, r2, r0, r0
     318:	77000001 	strvc	r0, [r0, -r1]
     31c:	09000001 	stmdbeq	r0, {r0}
     320:	77025101 	strvc	r5, [r2, -r1, lsl #2]
     324:	50010900 	andpl	r0, r1, r0, lsl #18
     328:	00007602 	andeq	r7, r0, r2, lsl #12
     32c:	0082580a 	addeq	r5, r2, sl, lsl #16
     330:	0001d100 	andeq	sp, r1, r0, lsl #2
     334:	51010900 	tstpl	r1, r0, lsl #18
     338:	09007402 	stmdbeq	r0, {r1, sl, ip, sp, lr}
     33c:	76025001 	strvc	r5, [r2], -r1
     340:	0b000000 	bleq	348 <__start-0x7cb8>
     344:	0000020e 	andeq	r0, r0, lr, lsl #4
     348:	850c3203 	strhi	r3, [ip, #-515]	; 0x203
     34c:	03000001 	movweq	r0, #1
     350:	00004129 	andeq	r4, r0, r9, lsr #2
     354:	0001a600 	andeq	sl, r1, r0, lsl #12
     358:	0e000d00 	cdpeq	13, 0, cr0, cr0, cr0, {0}
     35c:	00000192 	muleq	r0, r2, r1
     360:	00412703 	subeq	r2, r1, r3, lsl #14
     364:	01c00000 	biceq	r0, r0, r0
     368:	5a0f0000 	bpl	3c0370 <__user_program+0xc0370>
     36c:	0f000000 	svceq	0x00000000
     370:	0000005a 	andeq	r0, r0, sl, asr r0
     374:	01ed0c00 	mvneq	r0, r0, lsl #24
     378:	2a030000 	bcs	c0380 <__bss_end+0xb4380>
     37c:	00000041 	andeq	r0, r0, r1, asr #32
     380:	000001d1 	ldrdeq	r0, [r0], -r1
     384:	fb10000d 	blx	4003c2 <__user_program+0x1003c2>
     388:	03000001 	movweq	r0, #1
     38c:	00004128 	andeq	r4, r0, r8, lsr #2
     390:	005a0f00 	subseq	r0, sl, r0, lsl #30
     394:	5a0f0000 	bpl	3c039c <__user_program+0xc039c>
     398:	00000000 	andeq	r0, r0, r0
     39c:	0002f000 	andeq	pc, r2, r0
     3a0:	e5000400 	str	r0, [r0, #-1024]	; 0x400
     3a4:	04000001 	streq	r0, [r0], #-1
     3a8:	00004a01 	andeq	r4, r0, r1, lsl #20
     3ac:	022a0100 	eoreq	r0, sl, #0, 2
     3b0:	01b10000 			; <UNDEFINED> instruction: 0x01b10000
     3b4:	82680000 	rsbhi	r0, r8, #0
     3b8:	02980000 	addseq	r0, r8, #0
     3bc:	01130000 	tsteq	r3, r0
     3c0:	ca020000 	bgt	803c8 <__bss_end+0x743c8>
     3c4:	02000000 	andeq	r0, r0, #0
     3c8:	0000300e 	andeq	r3, r0, lr
     3cc:	08010300 	stmdaeq	r1, {r8, r9}
     3d0:	000000da 	ldrdeq	r0, [r0], -sl
     3d4:	1a050203 	bne	140be8 <__end+0x13be8>
     3d8:	02000001 	andeq	r0, r0, #1
     3dc:	000000e0 	andeq	r0, r0, r0, ror #1
     3e0:	00491202 	subeq	r1, r9, r2, lsl #4
     3e4:	04040000 	streq	r0, [r4], #-0
     3e8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     3ec:	05080300 	streq	r0, [r8, #-768]	; 0x300
     3f0:	00000000 	andeq	r0, r0, r0
     3f4:	0000c902 	andeq	ip, r0, r2, lsl #18
     3f8:	62160200 	andsvs	r0, r6, #0, 4
     3fc:	03000000 	movweq	r0, #0
     400:	00d10801 	sbcseq	r0, r1, r1, lsl #16
     404:	02030000 	andeq	r0, r3, #0
     408:	0000f507 	andeq	pc, r0, r7, lsl #10
     40c:	00df0200 	sbcseq	r0, pc, r0, lsl #4
     410:	1a020000 	bne	80418 <__bss_end+0x74418>
     414:	0000007b 	andeq	r0, r0, fp, ror r0
     418:	34070403 	strcc	r0, [r7], #-1027	; 0x403
     41c:	02000000 	andeq	r0, r0, #0
     420:	00000221 	andeq	r0, r0, r1, lsr #4
     424:	008d1c02 	addeq	r1, sp, r2, lsl #24
     428:	08030000 	stmdaeq	r3, {}	; <UNPREDICTABLE>
     42c:	00002a07 	andeq	r2, r0, r7, lsl #20
     430:	02400200 	subeq	r0, r0, #0, 4
     434:	13030000 	movwne	r0, #12288	; 0x3000
     438:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     43c:	00023e05 	andeq	r3, r2, r5, lsl #28
     440:	00040400 	andeq	r0, r4, r0, lsl #8
     444:	000000b6 	strheq	r0, [r0], -r6
     448:	00028806 	andeq	r8, r2, r6, lsl #16
     44c:	0000b600 	andeq	fp, r0, r0, lsl #12
     450:	07000000 	streq	r0, [r0, -r0]
     454:	025d0804 	subseq	r0, sp, #4, 16	; 0x40000
     458:	21010000 	mrscs	r0, (UNDEF: 1)
     45c:	00008268 	andeq	r8, r0, r8, ror #4
     460:	000000e0 	andeq	r0, r0, r0, ror #1
     464:	012a9c01 	teqeq	sl, r1, lsl #24
     468:	6e090000 	cdpvs	0, 0, cr0, cr9, cr0, {0}
     46c:	01000002 	tsteq	r0, r2
     470:	00005721 	andeq	r5, r0, r1, lsr #14
     474:	0001b800 	andeq	fp, r1, r0, lsl #16
     478:	756e0a00 	strbvc	r0, [lr, #-2560]!	; 0xa00
     47c:	2101006d 	tstcs	r1, sp, rrx
     480:	00000082 	andeq	r0, r0, r2, lsl #1
     484:	000001d9 	ldrdeq	r0, [r0], -r9
     488:	0002670b 	andeq	r6, r2, fp, lsl #14
     48c:	2a220100 	bcs	880894 <__user_program+0x580894>
     490:	11000001 	tstne	r0, r1
     494:	0c000002 	stceq	0, cr0, [r0], {2}
     498:	00667562 	rsbeq	r7, r6, r2, ror #10
     49c:	01302301 	teqeq	r0, r1, lsl #6
     4a0:	91020000 	mrsls	r0, (UNDEF: 2)
     4a4:	74700d58 	ldrbtvc	r0, [r0], #-3416	; 0xd58
     4a8:	24010072 	strcs	r0, [r1], #-114	; 0x72
     4ac:	0000012a 	andeq	r0, r0, sl, lsr #2
     4b0:	00000248 	andeq	r0, r0, r8, asr #4
     4b4:	00831c0e 	addeq	r1, r3, lr, lsl #24
     4b8:	0002e600 	andeq	lr, r2, r0, lsl #12
     4bc:	83340e00 	teqhi	r4, #0, 28
     4c0:	02e60000 	rsceq	r0, r6, #0
     4c4:	0f000000 	svceq	0x00000000
     4c8:	00002504 	andeq	r2, r0, r4, lsl #10
     4cc:	00251000 	eoreq	r1, r5, r0
     4d0:	01400000 	mrseq	r0, (UNDEF: 64)
     4d4:	40110000 	andsmi	r0, r1, r0
     4d8:	07000001 	streq	r0, [r0, -r1]
     4dc:	07040300 	streq	r0, [r4, -r0, lsl #6]
     4e0:	0000027f 	andeq	r0, r0, pc, ror r2
     4e4:	00027312 	andeq	r7, r2, r2, lsl r3
     4e8:	493f0100 	ldmdbmi	pc!, {r8}	; <UNPREDICTABLE>
     4ec:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
     4f0:	b8000083 	stmdalt	r0, {r0, r1, r7}
     4f4:	01000001 	tsteq	r0, r1
     4f8:	0002b59c 	muleq	r2, ip, r5
     4fc:	6d660a00 	vstmdbvs	r6!, {s1-s0}
     500:	3f010074 	svccc	0x00010074
     504:	000002b5 			; <UNDEFINED> instruction: 0x000002b5
     508:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
     50c:	027a1413 	rsbseq	r1, sl, #318767104	; 0x13000000
     510:	40010000 	andmi	r0, r1, r0
     514:	00000094 	muleq	r0, r4, r0
     518:	15549102 	ldrbne	r9, [r4, #-258]	; 0x102
     51c:	00000000 	andeq	r0, r0, r0
     520:	000001a7 	andeq	r0, r0, r7, lsr #3
     524:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
     528:	70610100 	rsbvc	r0, r1, r0, lsl #2
     52c:	e7000000 	str	r0, [r0, -r0]
     530:	16000002 	strne	r0, [r0], -r2
     534:	00008460 	andeq	r8, r0, r0, ror #8
     538:	000000b8 	strheq	r0, [r0], -r8
     53c:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
     540:	00000078 	andeq	r0, r0, r8, ror r0
     544:	00001815 	andeq	r1, r0, r5, lsl r8
     548:	0001d000 	andeq	sp, r1, r0
     54c:	756e0d00 	strbvc	r0, [lr, #-3328]!	; 0xd00
     550:	6801006d 	stmdavs	r1, {r0, r2, r3, r5, r6}
     554:	00000070 	andeq	r0, r0, r0, ror r0
     558:	00000306 	andeq	r0, r0, r6, lsl #6
     55c:	00848016 	addeq	r8, r4, r6, lsl r0
     560:	0000b800 	andeq	fp, r0, r0, lsl #16
     564:	50011700 	andpl	r1, r1, r0, lsl #14
     568:	00007702 	andeq	r7, r0, r2, lsl #14
     56c:	83dc1800 	bicshi	r1, ip, #0, 16
     570:	00480000 	subeq	r0, r8, r0
     574:	02230000 	eoreq	r0, r3, #0
     578:	6e0d0000 	cdpvs	0, 0, cr0, cr13, cr0, {0}
     57c:	01006d75 	tsteq	r0, r5, ror sp
     580:	00003e50 	andeq	r3, r0, r0, asr lr
     584:	00032500 	andeq	r2, r3, r0, lsl #10
     588:	83fc1900 	mvnshi	r1, #0, 18
     58c:	02e60000 	rsceq	r0, r6, #0
     590:	02000000 	andeq	r0, r0, #0
     594:	01170000 	tsteq	r7, r0
     598:	2d080250 	sfmcs	f0, 4, [r8, #-320]	; 0xfffffec0
     59c:	840c1900 	strhi	r1, [ip], #-2304	; 0x900
     5a0:	00b80000 	adcseq	r0, r8, r0
     5a4:	02130000 	andseq	r0, r3, #0
     5a8:	01170000 	tsteq	r7, r0
     5ac:	003a0150 	eorseq	r0, sl, r0, asr r1
     5b0:	00842016 	addeq	r2, r4, r6, lsl r0
     5b4:	0000b800 	andeq	fp, r0, r0, lsl #16
     5b8:	50011700 	andpl	r1, r1, r0, lsl #14
     5bc:	00003a01 	andeq	r3, r0, r1, lsl #20
     5c0:	00842418 	addeq	r2, r4, r8, lsl r4
     5c4:	00002000 	andeq	r2, r0, r0
     5c8:	00024f00 	andeq	r4, r2, r0, lsl #30
     5cc:	756e0d00 	strbvc	r0, [lr, #-3328]!	; 0xd00
     5d0:	5b01006d 	blpl	4078c <__bss_end+0x3478c>
     5d4:	00000070 	andeq	r0, r0, r0, ror r0
     5d8:	00000338 	andeq	r0, r0, r8, lsr r3
     5dc:	00844016 	addeq	r4, r4, r6, lsl r0
     5e0:	0000b800 	andeq	fp, r0, r0, lsl #16
     5e4:	50011700 	andpl	r1, r1, r0, lsl #14
     5e8:	00003a01 	andeq	r3, r0, r1, lsl #20
     5ec:	00848418 	addeq	r8, r4, r8, lsl r4
     5f0:	00003000 	andeq	r3, r0, r0
     5f4:	00027500 	andeq	r7, r2, r0, lsl #10
     5f8:	02180b00 	andseq	r0, r8, #0, 22
     5fc:	6e010000 	cdpvs	0, 0, cr0, cr1, cr0, {0}
     600:	0000012a 	andeq	r0, r0, sl, lsr #2
     604:	00000357 	andeq	r0, r0, r7, asr r3
     608:	0084a40e 	addeq	sl, r4, lr, lsl #8
     60c:	0002e600 	andeq	lr, r2, r0, lsl #12
     610:	b4180000 	ldrlt	r0, [r8], #-0
     614:	18000084 	stmdane	r0, {r2, r7}
     618:	9b000000 	blls	620 <__start-0x79e0>
     61c:	0b000002 	bleq	62c <__start-0x79d4>
     620:	00000296 	muleq	r0, r6, r2
     624:	003e7701 	eorseq	r7, lr, r1, lsl #14
     628:	03770000 	cmneq	r7, #0
     62c:	c80e0000 	stmdagt	lr, {}	; <UNPREDICTABLE>
     630:	e6000084 	str	r0, [r0], -r4, lsl #1
     634:	00000002 	andeq	r0, r0, r2
     638:	0083800e 	addeq	r8, r3, lr
     63c:	0002e600 	andeq	lr, r2, r0, lsl #12
     640:	84d41600 	ldrbhi	r1, [r4], #1536	; 0x600
     644:	02e60000 	rsceq	r0, r6, #0
     648:	01170000 	tsteq	r7, r0
     64c:	25080250 	strcs	r0, [r8, #-592]	; 0x250
     650:	040f0000 	streq	r0, [pc], #-0	; 658 <__start-0x79a8>
     654:	000002bb 			; <UNDEFINED> instruction: 0x000002bb
     658:	0000301a 	andeq	r3, r0, sl, lsl r0
     65c:	00301000 	eorseq	r1, r0, r0
     660:	02d00000 	sbcseq	r0, r0, #0
     664:	40110000 	andsmi	r0, r1, r0
     668:	10000001 	andne	r0, r0, r1
     66c:	02481400 	subeq	r1, r8, #0, 8
     670:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
     674:	000002e1 	andeq	r0, r0, r1, ror #5
     678:	90000305 	andls	r0, r0, r5, lsl #6
     67c:	c01a0000 	andsgt	r0, sl, r0
     680:	1b000002 	blne	690 <__start-0x7970>
     684:	0000024f 	andeq	r0, r0, pc, asr #4
     688:	571c2305 	ldrpl	r2, [ip, -r5, lsl #6]
     68c:	00000000 	andeq	r0, r0, r0
     690:	0000bf00 	andeq	fp, r0, r0, lsl #30
     694:	4f000400 	svcmi	0x00000400
     698:	04000003 	streq	r0, [r0], #-3
     69c:	00004a01 	andeq	r4, r0, r1, lsl #20
     6a0:	02a50100 	adceq	r0, r5, #0, 2
     6a4:	01b10000 			; <UNDEFINED> instruction: 0x01b10000
     6a8:	85000000 	strhi	r0, [r0, #-0]
     6ac:	00140000 	andseq	r0, r4, r0
     6b0:	01f70000 	mvnseq	r0, r0
     6b4:	01020000 	mrseq	r0, (UNDEF: 2)
     6b8:	0000da08 	andeq	sp, r0, r8, lsl #20
     6bc:	05020200 	streq	r0, [r2, #-512]	; 0x200
     6c0:	0000011a 	andeq	r0, r0, sl, lsl r1
     6c4:	69050403 	stmdbvs	r5, {r0, r1, sl}
     6c8:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     6cc:	00000508 	andeq	r0, r0, r8, lsl #10
     6d0:	c9040000 	stmdbgt	r4, {}	; <UNPREDICTABLE>
     6d4:	02000000 	andeq	r0, r0, #0
     6d8:	00004c16 	andeq	r4, r0, r6, lsl ip
     6dc:	08010200 	stmdaeq	r1, {r9}
     6e0:	000000d1 	ldrdeq	r0, [r0], -r1
     6e4:	f5070202 			; <UNDEFINED> instruction: 0xf5070202
     6e8:	02000000 	andeq	r0, r0, #0
     6ec:	00340704 	eorseq	r0, r4, r4, lsl #14
     6f0:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     6f4:	00002a07 	andeq	r2, r0, r7, lsl #20
     6f8:	029b0500 	addseq	r0, fp, #0, 10
     6fc:	0d010000 	stceq	0, cr0, [r1, #-0]
     700:	00008500 	andeq	r8, r0, r0, lsl #10
     704:	00000004 	andeq	r0, r0, r4
     708:	b7059c01 	strlt	r9, [r5, -r1, lsl #24]
     70c:	01000002 	tsteq	r0, r2
     710:	00850411 	addeq	r0, r5, r1, lsl r4
     714:	00000400 	andeq	r0, r0, r0, lsl #8
     718:	069c0100 	ldreq	r0, [ip], r0, lsl #2
     71c:	0000024f 	andeq	r0, r0, pc, asr #4
     720:	85081501 	strhi	r1, [r8, #-1281]	; 0x501
     724:	00040000 	andeq	r0, r4, r0
     728:	9c010000 	stcls	0, cr0, [r1], {-0}
     72c:	000000ad 	andeq	r0, r0, sp, lsr #1
     730:	00029607 	andeq	r9, r2, r7, lsl #12
     734:	41150100 	tstmi	r5, r0, lsl #2
     738:	01000000 	mrseq	r0, (UNDEF: 0)
     73c:	8d080050 	stchi	0, cr0, [r8, #-320]	; 0xfffffec0
     740:	01000002 	tsteq	r0, r2
     744:	00004119 	andeq	r4, r0, r9, lsl r1
     748:	00850c00 	addeq	r0, r5, r0, lsl #24
     74c:	00000800 	andeq	r0, r0, r0, lsl #16
     750:	009c0100 	addseq	r0, ip, r0, lsl #2
     754:	0000011b 	andeq	r0, r0, fp, lsl r1
     758:	03e10004 	mvneq	r0, #4
     75c:	01040000 	mrseq	r0, (UNDEF: 4)
     760:	0000004a 	andeq	r0, r0, sl, asr #32
     764:	0002c201 	andeq	ip, r2, r1, lsl #4
     768:	0001b100 	andeq	fp, r1, r0, lsl #2
     76c:	00851400 	addeq	r1, r5, r0, lsl #8
     770:	00001400 	andeq	r1, r0, r0, lsl #8
     774:	00025900 	andeq	r5, r2, r0, lsl #18
     778:	08010200 	stmdaeq	r1, {r9}
     77c:	000000da 	ldrdeq	r0, [r0], -sl
     780:	1a050202 	bne	140f90 <__end+0x13f90>
     784:	03000001 	movweq	r0, #1
     788:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     78c:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     790:	00000005 	andeq	r0, r0, r5
     794:	00c90400 	sbceq	r0, r9, r0, lsl #8
     798:	16020000 	strne	r0, [r2], -r0
     79c:	0000004c 	andeq	r0, r0, ip, asr #32
     7a0:	d1080102 	tstle	r8, r2, lsl #2
     7a4:	04000000 	streq	r0, [r0], #-0
     7a8:	000002f8 	strdeq	r0, [r0], -r8
     7ac:	005e1802 	subseq	r1, lr, r2, lsl #16
     7b0:	02020000 	andeq	r0, r2, #0
     7b4:	0000f507 	andeq	pc, r0, r7, lsl #10
     7b8:	07040200 	streq	r0, [r4, -r0, lsl #4]
     7bc:	00000034 	andeq	r0, r0, r4, lsr r0
     7c0:	2a070802 	bcs	1c27d0 <__end+0x957d0>
     7c4:	05000000 	streq	r0, [r0, #-0]
     7c8:	000002d3 	ldrdeq	r0, [r0], -r3
     7cc:	85140d01 	ldrhi	r0, [r4, #-3329]	; 0xd01
     7d0:	00040000 	andeq	r0, r4, r0
     7d4:	9c010000 	stcls	0, cr0, [r1], {-0}
     7d8:	00000096 	muleq	r0, r6, r0
     7dc:	6b6c6306 	blvs	1b193fc <__user_program+0x18193fc>
     7e0:	530d0100 	movwpl	r0, #53504	; 0xd100
     7e4:	01000000 	mrseq	r0, (UNDEF: 0)
     7e8:	01070050 	qaddeq	r0, r0, r7
     7ec:	01000003 	tsteq	r0, r3
     7f0:	00004111 	andeq	r4, r0, r1, lsl r1
     7f4:	00851800 	addeq	r1, r5, r0, lsl #16
     7f8:	00000800 	andeq	r0, r0, r0, lsl #16
     7fc:	d99c0100 	ldmible	ip, {r8}
     800:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     804:	00667562 	rsbeq	r7, r6, r2, ror #10
     808:	00d91101 	sbcseq	r1, r9, r1, lsl #2
     80c:	038b0000 	orreq	r0, fp, #0
     810:	6c060000 	stcvs	0, cr0, [r6], {-0}
     814:	01006e65 	tsteq	r0, r5, ror #28
     818:	00005311 	andeq	r5, r0, r1, lsl r3
     81c:	09510100 	ldmdbeq	r1, {r8}^
     820:	000002e3 	andeq	r0, r0, r3, ror #5
     824:	00411101 	subeq	r1, r1, r1, lsl #2
     828:	52010000 	andpl	r0, r1, #0
     82c:	41040a00 	tstmi	r4, r0, lsl #20
     830:	0b000000 	bleq	838 <__start-0x77c8>
     834:	000002e8 	andeq	r0, r0, r8, ror #5
     838:	00411501 	subeq	r1, r1, r1, lsl #10
     83c:	85200000 	strhi	r0, [r0, #-0]!
     840:	00080000 	andeq	r0, r8, r0
     844:	9c010000 	stcls	0, cr0, [r1], {-0}
     848:	66756208 	ldrbtvs	r6, [r5], -r8, lsl #4
     84c:	d9150100 	ldmdble	r5, {r8}
     850:	ac000000 	stcge	0, cr0, [r0], {-0}
     854:	06000003 	streq	r0, [r0], -r3
     858:	006e656c 	rsbeq	r6, lr, ip, ror #10
     85c:	00531501 	subseq	r1, r3, r1, lsl #10
     860:	51010000 	mrspl	r0, (UNDEF: 1)
     864:	0002e309 	andeq	lr, r2, r9, lsl #6
     868:	41150100 	tstmi	r5, r0, lsl #2
     86c:	01000000 	mrseq	r0, (UNDEF: 0)
     870:	a6000052 			; <UNDEFINED> instruction: 0xa6000052
     874:	04000000 	streq	r0, [r0], #-0
     878:	00049e00 	andeq	r9, r4, r0, lsl #28
     87c:	4a010400 	bmi	41884 <__bss_end+0x35884>
     880:	01000000 	mrseq	r0, (UNDEF: 0)
     884:	0000032c 	andeq	r0, r0, ip, lsr #6
     888:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
     88c:	00008528 	andeq	r8, r0, r8, lsr #10
     890:	0000000c 	andeq	r0, r0, ip
     894:	000002ba 			; <UNDEFINED> instruction: 0x000002ba
     898:	da080102 	ble	200ca8 <__end+0xd3ca8>
     89c:	02000000 	andeq	r0, r0, #0
     8a0:	011a0502 	tsteq	sl, r2, lsl #10
     8a4:	04030000 	streq	r0, [r3], #-0
     8a8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     8ac:	05080200 	streq	r0, [r8, #-512]	; 0x200
     8b0:	00000000 	andeq	r0, r0, r0
     8b4:	0000c904 	andeq	ip, r0, r4, lsl #18
     8b8:	4c160200 	lfmmi	f0, 4, [r6], {-0}
     8bc:	02000000 	andeq	r0, r0, #0
     8c0:	00d10801 	sbcseq	r0, r1, r1, lsl #16
     8c4:	f8040000 			; <UNDEFINED> instruction: 0xf8040000
     8c8:	02000002 	andeq	r0, r0, #2
     8cc:	00005e18 	andeq	r5, r0, r8, lsl lr
     8d0:	07020200 	streq	r0, [r2, -r0, lsl #4]
     8d4:	000000f5 	strdeq	r0, [r0], -r5
     8d8:	34070402 	strcc	r0, [r7], #-1026	; 0x402
     8dc:	02000000 	andeq	r0, r0, #0
     8e0:	002a0708 	eoreq	r0, sl, r8, lsl #14
     8e4:	23050000 	movwcs	r0, #20480	; 0x5000
     8e8:	01000003 	tsteq	r0, r3
     8ec:	0085280d 	addeq	r2, r5, sp, lsl #16
     8f0:	00000400 	andeq	r0, r0, r0, lsl #8
     8f4:	069c0100 	ldreq	r0, [ip], r0, lsl #2
     8f8:	0000031a 	andeq	r0, r0, sl, lsl r3
     8fc:	00531101 	subseq	r1, r3, r1, lsl #2
     900:	852c0000 	strhi	r0, [ip, #-0]!
     904:	00080000 	andeq	r0, r8, r0
     908:	9c010000 	stcls	0, cr0, [r1], {-0}
     90c:	00031207 	andeq	r1, r3, r7, lsl #4
     910:	41110100 	tstmi	r1, r0, lsl #2
     914:	cd000000 	stcgt	0, cr0, [r0, #-0]
     918:	00000003 	andeq	r0, r0, r3
     91c:	00021600 	andeq	r1, r2, r0, lsl #12
     920:	16000400 	strne	r0, [r0], -r0, lsl #8
     924:	04000005 	streq	r0, [r0], #-5
     928:	00004a01 	andeq	r4, r0, r1, lsl #20
     92c:	036d0100 	cmneq	sp, #0, 2
     930:	01b10000 			; <UNDEFINED> instruction: 0x01b10000
     934:	85340000 	ldrhi	r0, [r4, #-0]!
     938:	01800000 	orreq	r0, r0, r0
     93c:	031d0000 	tsteq	sp, #0
     940:	01020000 	mrseq	r0, (UNDEF: 2)
     944:	0000da08 	andeq	sp, r0, r8, lsl #20
     948:	05020200 	streq	r0, [r2, #-512]	; 0x200
     94c:	0000011a 	andeq	r0, r0, sl, lsl r1
     950:	69050403 	stmdbvs	r5, {r0, r1, sl}
     954:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
     958:	00000508 	andeq	r0, r0, r8, lsl #10
     95c:	c9040000 	stmdbgt	r4, {}	; <UNPREDICTABLE>
     960:	02000000 	andeq	r0, r0, #0
     964:	00004c16 	andeq	r4, r0, r6, lsl ip
     968:	08010200 	stmdaeq	r1, {r9}
     96c:	000000d1 	ldrdeq	r0, [r0], -r1
     970:	f5070202 			; <UNDEFINED> instruction: 0xf5070202
     974:	04000000 	streq	r0, [r0], #-0
     978:	000000df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     97c:	00651a02 	rsbeq	r1, r5, r2, lsl #20
     980:	04020000 	streq	r0, [r2], #-0
     984:	00003407 	andeq	r3, r0, r7, lsl #8
     988:	07080200 	streq	r0, [r8, -r0, lsl #4]
     98c:	0000002a 	andeq	r0, r0, sl, lsr #32
     990:	00039505 	andeq	r9, r3, r5, lsl #10
     994:	34360100 	ldrtcc	r0, [r6], #-256	; 0x100
     998:	20000085 	andcs	r0, r0, r5, lsl #1
     99c:	01000000 	mrseq	r0, (UNDEF: 0)
     9a0:	0000989c 	muleq	r0, ip, r8
     9a4:	038e0600 	orreq	r0, lr, #0, 12
     9a8:	36010000 	strcc	r0, [r1], -r0
     9ac:	00000065 	andeq	r0, r0, r5, rrx
     9b0:	000003ee 	andeq	r0, r0, lr, ror #7
     9b4:	035d0500 	cmpeq	sp, #0, 10
     9b8:	3c010000 	stccc	0, cr0, [r1], {-0}
     9bc:	00008554 	andeq	r8, r0, r4, asr r5
     9c0:	00000074 	andeq	r0, r0, r4, ror r0
     9c4:	014c9c01 	cmpeq	ip, r1, lsl #24
     9c8:	41060000 	mrsmi	r0, (UNDEF: 6)
     9cc:	01000003 	tsteq	r0, r3
     9d0:	00005a3c 	andeq	r5, r0, ip, lsr sl
     9d4:	00040c00 	andeq	r0, r4, r0, lsl #24
     9d8:	6c630700 	stclvs	7, cr0, [r3], #-0
     9dc:	3c01006b 	stccc	0, cr0, [r1], {107}	; 0x6b
     9e0:	0000005a 	andeq	r0, r0, sl, asr r0
     9e4:	0000042d 	andeq	r0, r0, sp, lsr #8
     9e8:	72617608 	rsbvc	r7, r1, #8, 12	; 0x800000
     9ec:	653d0100 	ldrvs	r0, [sp, #-256]!	; 0x100
     9f0:	4b000000 	blmi	9f8 <__start-0x7608>
     9f4:	09000004 	stmdbeq	r0, {r2}
     9f8:	00008568 	andeq	r8, r0, r8, ror #10
     9fc:	00000207 	andeq	r0, r0, r7, lsl #4
     a00:	000000f2 	strdeq	r0, [r0], -r2
     a04:	0151010a 	cmpeq	r1, sl, lsl #2
     a08:	50010a34 	andpl	r0, r1, r4, lsr sl
     a0c:	09003701 	stmdbeq	r0, {r0, r8, r9, sl, ip, sp}
     a10:	00008574 	andeq	r8, r0, r4, ror r5
     a14:	00000207 	andeq	r0, r0, r7, lsl #4
     a18:	0000010a 	andeq	r0, r0, sl, lsl #2
     a1c:	0151010a 	cmpeq	r1, sl, lsl #2
     a20:	50010a34 	andpl	r0, r1, r4, lsr sl
     a24:	09003801 	stmdbeq	r0, {r0, fp, ip, sp}
     a28:	00008580 	andeq	r8, r0, r0, lsl #11
     a2c:	00000207 	andeq	r0, r0, r7, lsl #4
     a30:	00000122 	andeq	r0, r0, r2, lsr #2
     a34:	0151010a 	cmpeq	r1, sl, lsl #2
     a38:	50010a34 	andpl	r0, r1, r4, lsr sl
     a3c:	09003a01 	stmdbeq	r0, {r0, r9, fp, ip, sp}
     a40:	0000858c 	andeq	r8, r0, ip, lsl #11
     a44:	00000207 	andeq	r0, r0, r7, lsl #4
     a48:	0000013a 	andeq	r0, r0, sl, lsr r1
     a4c:	0151010a 	cmpeq	r1, sl, lsl #2
     a50:	50010a34 	andpl	r0, r1, r4, lsr sl
     a54:	0b003b01 	bleq	f660 <__bss_end+0x3660>
     a58:	000085c4 	andeq	r8, r0, r4, asr #11
     a5c:	00000073 	andeq	r0, r0, r3, ror r0
     a60:	0350010a 	cmpeq	r0, #-2147483646	; 0x80000002
     a64:	0027100a 	eoreq	r1, r7, sl
     a68:	03460500 	movteq	r0, #25856	; 0x6500
     a6c:	5f010000 	svcpl	0x00010000
     a70:	000085c8 	andeq	r8, r0, r8, asr #11
     a74:	00000034 	andeq	r0, r0, r4, lsr r0
     a78:	018b9c01 	orreq	r9, fp, r1, lsl #24
     a7c:	860c0000 	strhi	r0, [ip], -r0
     a80:	01000003 	tsteq	r0, r3
     a84:	0000415f 	andeq	r4, r0, pc, asr r1
     a88:	0d500100 	ldfeqe	f0, [r0, #-0]
     a8c:	006b6c63 	rsbeq	r6, fp, r3, ror #24
     a90:	005a5f01 	subseq	r5, sl, r1, lsl #30
     a94:	51010000 	mrspl	r0, (UNDEF: 1)
     a98:	72617608 	rsbvc	r7, r1, #8, 12	; 0x800000
     a9c:	65600100 	strbvs	r0, [r0, #-256]!	; 0x100
     aa0:	6e000000 	cdpvs	0, 0, cr0, cr0, cr0, {0}
     aa4:	00000004 	andeq	r0, r0, r4
     aa8:	00037e0e 	andeq	r7, r3, lr, lsl #28
     aac:	fc830100 	stc2	1, cr0, [r3], {0}
     ab0:	18000085 	stmdane	r0, {r0, r2, r7}
     ab4:	01000000 	mrseq	r0, (UNDEF: 0)
     ab8:	03500f9c 	cmpeq	r0, #156, 30	; 0x270
     abc:	89010000 	stmdbhi	r1, {}	; <UNPREDICTABLE>
     ac0:	00000041 	andeq	r0, r0, r1, asr #32
     ac4:	00008614 	andeq	r8, r0, r4, lsl r6
     ac8:	000000a0 	andeq	r0, r0, r0, lsr #1
     acc:	02079c01 	andeq	r9, r7, #256	; 0x100
     ad0:	a5060000 	strge	r0, [r6, #-0]
     ad4:	01000003 	tsteq	r0, r3
     ad8:	00004189 	andeq	r4, r0, r9, lsl #3
     adc:	00049100 	andeq	r9, r4, r0, lsl #2
     ae0:	61760800 	cmnvs	r6, r0, lsl #16
     ae4:	8a010072 	bhi	40cb4 <__bss_end+0x34cb4>
     ae8:	00000065 	andeq	r0, r0, r5, rrx
     aec:	000004b2 			; <UNDEFINED> instruction: 0x000004b2
     af0:	74657208 	strbtvc	r7, [r5], #-520	; 0x208
     af4:	658b0100 	strvs	r0, [fp, #256]	; 0x100
     af8:	ec000000 	stc	0, cr0, [r0], {-0}
     afc:	09000004 	stmdbeq	r0, {r2}
     b00:	00008650 	andeq	r8, r0, r0, asr r6
     b04:	00000073 	andeq	r0, r0, r3, ror r0
     b08:	000001f6 	strdeq	r0, [r0], -r6
     b0c:	0250010a 	subseq	r0, r0, #-2147483646	; 0x80000002
     b10:	0b000075 	bleq	cec <__start-0x7314>
     b14:	00008688 	andeq	r8, r0, r8, lsl #13
     b18:	00000073 	andeq	r0, r0, r3, ror r0
     b1c:	0250010a 	subseq	r0, r0, #-2147483646	; 0x80000002
     b20:	00000075 	andeq	r0, r0, r5, ror r0
     b24:	00010e10 	andeq	r0, r1, r0, lsl lr
     b28:	11370300 	teqne	r7, r0, lsl #6
     b2c:	00000041 	andeq	r0, r0, r1, asr #32
     b30:	00004111 	andeq	r4, r0, r1, lsl r1
     b34:	1a000000 	bne	b3c <__start-0x74c4>
     b38:	04000008 	streq	r0, [r0], #-8
     b3c:	00062200 	andeq	r2, r6, r0, lsl #4
     b40:	4a010400 	bmi	41b48 <__bss_end+0x35b48>
     b44:	01000000 	mrseq	r0, (UNDEF: 0)
     b48:	000003aa 	andeq	r0, r0, sl, lsr #7
     b4c:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
     b50:	000086b4 			; <UNDEFINED> instruction: 0x000086b4
     b54:	0000039c 	muleq	r0, ip, r3
     b58:	000003b4 			; <UNDEFINED> instruction: 0x000003b4
     b5c:	da080102 	ble	200f6c <__end+0xd3f6c>
     b60:	02000000 	andeq	r0, r0, #0
     b64:	011a0502 	tsteq	sl, r2, lsl #10
     b68:	04030000 	streq	r0, [r3], #-0
     b6c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     b70:	05080200 	streq	r0, [r8, #-512]	; 0x200
     b74:	00000000 	andeq	r0, r0, r0
     b78:	0000c904 	andeq	ip, r0, r4, lsl #18
     b7c:	4c160200 	lfmmi	f0, 4, [r6], {-0}
     b80:	02000000 	andeq	r0, r0, #0
     b84:	00d10801 	sbcseq	r0, r1, r1, lsl #16
     b88:	02020000 	andeq	r0, r2, #0
     b8c:	0000f507 	andeq	pc, r0, r7, lsl #10
     b90:	00df0400 	sbcseq	r0, pc, r0, lsl #8
     b94:	1a020000 	bne	80b9c <__bss_end+0x74b9c>
     b98:	00000065 	andeq	r0, r0, r5, rrx
     b9c:	34070402 	strcc	r0, [r7], #-1026	; 0x402
     ba0:	02000000 	andeq	r0, r0, #0
     ba4:	002a0708 	eoreq	r0, sl, r8, lsl #14
     ba8:	8e050000 	cdphi	0, 0, cr0, cr5, cr0, {0}
     bac:	01000003 	tsteq	r0, r3
     bb0:	0086b408 	addeq	fp, r6, r8, lsl #8
     bb4:	00002000 	andeq	r2, r0, r0
     bb8:	989c0100 	ldmls	ip, {r8}
     bbc:	06000000 	streq	r0, [r0], -r0
     bc0:	00000394 	muleq	r0, r4, r3
     bc4:	005a0801 	subseq	r0, sl, r1, lsl #16
     bc8:	050b0000 	streq	r0, [fp, #-0]
     bcc:	07000000 	streq	r0, [r0, -r0]
     bd0:	00000192 	muleq	r0, r2, r1
     bd4:	00411001 	subeq	r1, r1, r1
     bd8:	86d40000 	ldrbhi	r0, [r4], r0
     bdc:	00440000 	subeq	r0, r4, r0
     be0:	9c010000 	stcls	0, cr0, [r1], {-0}
     be4:	000000ee 	andeq	r0, r0, lr, ror #1
     be8:	776f7208 	strbvc	r7, [pc, -r8, lsl #4]!
     bec:	5a100100 	bpl	400ff4 <__user_program+0x100ff4>
     bf0:	29000000 	stmdbcs	r0, {}	; <UNPREDICTABLE>
     bf4:	08000005 	stmdaeq	r0, {r0, r2}
     bf8:	006c6f63 	rsbeq	r6, ip, r3, ror #30
     bfc:	005a1001 	subseq	r1, sl, r1
     c00:	05700000 	ldrbeq	r0, [r0, #-0]!
     c04:	24090000 	strcs	r0, [r9], #-0
     c08:	01000001 	tsteq	r0, r1
     c0c:	00003312 	andeq	r3, r0, r2, lsl r3
     c10:	0005ba00 	andeq	fp, r5, r0, lsl #20
     c14:	03e10900 	mvneq	r0, #0, 18
     c18:	12010000 	andne	r0, r1, #0
     c1c:	00000033 	andeq	r0, r0, r3, lsr r0
     c20:	000005ee 	andeq	r0, r0, lr, ror #11
     c24:	01fb0700 	mvnseq	r0, r0, lsl #14
     c28:	1c010000 	stcne	0, cr0, [r1], {-0}
     c2c:	00000041 	andeq	r0, r0, r1, asr #32
     c30:	00008718 	andeq	r8, r0, r8, lsl r7
     c34:	00000044 	andeq	r0, r0, r4, asr #32
     c38:	01449c01 	cmpeq	r4, r1, lsl #24
     c3c:	72080000 	andvc	r0, r8, #0
     c40:	0100776f 	tsteq	r0, pc, ror #14
     c44:	00005a1c 	andeq	r5, r0, ip, lsl sl
     c48:	00060100 	andeq	r0, r6, r0, lsl #2
     c4c:	6f630800 	svcvs	0x00630800
     c50:	1c01006c 	stcne	0, cr0, [r1], {108}	; 0x6c
     c54:	0000005a 	andeq	r0, r0, sl, asr r0
     c58:	00000648 	andeq	r0, r0, r8, asr #12
     c5c:	00012409 	andeq	r2, r1, r9, lsl #8
     c60:	331e0100 	tstcc	lr, #0, 2
     c64:	92000000 	andls	r0, r0, #0
     c68:	09000006 	stmdbeq	r0, {r1, r2}
     c6c:	000003e1 	andeq	r0, r0, r1, ror #7
     c70:	00331e01 	eorseq	r1, r3, r1, lsl #28
     c74:	06c60000 	strbeq	r0, [r6], r0
     c78:	0a000000 	beq	c80 <__start-0x7380>
     c7c:	00000185 	andeq	r0, r0, r5, lsl #3
     c80:	00412901 	subeq	r2, r1, r1, lsl #18
     c84:	875c0000 	ldrbhi	r0, [ip, -r0]
     c88:	00240000 	eoreq	r0, r4, r0
     c8c:	9c010000 	stcls	0, cr0, [r1], {-0}
     c90:	0000016b 	andeq	r0, r0, fp, ror #2
     c94:	0100690b 	tsteq	r0, fp, lsl #18
     c98:	0000332b 	andeq	r3, r0, fp, lsr #6
     c9c:	0006d900 	andeq	sp, r6, r0, lsl #18
     ca0:	0e050000 	cdpeq	0, 0, cr0, cr5, cr0, {0}
     ca4:	01000004 	tsteq	r0, r4
     ca8:	0087803f 	addeq	r8, r7, pc, lsr r0
     cac:	00003400 	andeq	r3, r0, r0, lsl #8
     cb0:	ee9c0100 	fmle	f0, f4, f0
     cb4:	06000001 	streq	r0, [r0], -r1
     cb8:	00000419 	andeq	r0, r0, r9, lsl r4
     cbc:	004c3f01 	subeq	r3, ip, r1, lsl #30
     cc0:	07000000 	streq	r0, [r0, -r0]
     cc4:	900c0000 	andls	r0, ip, r0
     cc8:	a1000087 	smlabbge	r0, r7, r0, r0
     ccc:	a2000007 	andge	r0, r0, #7
     cd0:	0d000001 	stceq	0, cr0, [r0, #-4]
     cd4:	39015001 	stmdbcc	r1, {r0, ip, lr}
     cd8:	87980c00 	ldrhi	r0, [r8, r0, lsl #24]
     cdc:	00730000 	rsbseq	r0, r3, r0
     ce0:	01b70000 			; <UNDEFINED> instruction: 0x01b70000
     ce4:	010d0000 	mrseq	r0, (UNDEF: 13)
     ce8:	e80a0350 	stmda	sl, {r4, r6, r8, r9}
     cec:	a40c0003 	strge	r0, [ip], #-3
     cf0:	b2000087 	andlt	r0, r0, #135	; 0x87
     cf4:	d0000007 	andle	r0, r0, r7
     cf8:	0d000001 	stceq	0, cr0, [r0, #-4]
     cfc:	08025101 	stmdaeq	r2, {r0, r8, ip, lr}
     d00:	50010d40 	andpl	r0, r1, r0, asr #26
     d04:	0c003001 	stceq	0, cr3, [r0], {1}
     d08:	000087ac 	andeq	r8, r0, ip, lsr #15
     d0c:	000007c8 	andeq	r0, r0, r8, asr #15
     d10:	000001e4 	andeq	r0, r0, r4, ror #3
     d14:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     d18:	0e000074 	mcreq	0, 0, r0, cr0, cr4, {3}
     d1c:	000087b0 			; <UNDEFINED> instruction: 0x000087b0
     d20:	000007dd 	ldrdeq	r0, [r0], -sp
     d24:	039a0500 	orrseq	r0, sl, #0, 10
     d28:	49010000 	stmdbmi	r1, {}	; <UNPREDICTABLE>
     d2c:	000087b4 			; <UNDEFINED> instruction: 0x000087b4
     d30:	00000034 	andeq	r0, r0, r4, lsr r0
     d34:	02719c01 	rsbseq	r9, r1, #256	; 0x100
     d38:	a5060000 	strge	r0, [r6, #-0]
     d3c:	01000003 	tsteq	r0, r3
     d40:	00004c49 	andeq	r4, r0, r9, asr #24
     d44:	00072100 	andeq	r2, r7, r0, lsl #2
     d48:	87c40c00 	strbhi	r0, [r4, r0, lsl #24]
     d4c:	07e40000 	strbeq	r0, [r4, r0]!
     d50:	02250000 	eoreq	r0, r5, #0
     d54:	010d0000 	mrseq	r0, (UNDEF: 13)
     d58:	00390150 	eorseq	r0, r9, r0, asr r1
     d5c:	0087cc0c 	addeq	ip, r7, ip, lsl #24
     d60:	00007300 	andeq	r7, r0, r0, lsl #6
     d64:	00023a00 	andeq	r3, r2, r0, lsl #20
     d68:	50010d00 	andpl	r0, r1, r0, lsl #26
     d6c:	03e80a03 	mvneq	r0, #12288	; 0x3000
     d70:	87d80c00 	ldrbhi	r0, [r8, r0, lsl #24]
     d74:	07b20000 	ldreq	r0, [r2, r0]!
     d78:	02530000 	subseq	r0, r3, #0
     d7c:	010d0000 	mrseq	r0, (UNDEF: 13)
     d80:	20080251 	andcs	r0, r8, r1, asr r2
     d84:	0150010d 	cmpeq	r0, sp, lsl #2
     d88:	e00c0030 	and	r0, ip, r0, lsr r0
     d8c:	c8000087 	stmdagt	r0, {r0, r1, r2, r7}
     d90:	67000007 	strvs	r0, [r0, -r7]
     d94:	0d000002 	stceq	0, cr0, [r0, #-8]
     d98:	74025001 	strvc	r5, [r2], #-1
     d9c:	e40e0000 	str	r0, [lr], #-0
     da0:	dd000087 	stcle	0, cr0, [r0, #-540]	; 0xfffffde4
     da4:	00000007 	andeq	r0, r0, r7
     da8:	00042105 	andeq	r2, r4, r5, lsl #2
     dac:	e8520100 	ldmda	r2, {r8}^
     db0:	40000087 	andmi	r0, r0, r7, lsl #1
     db4:	01000000 	mrseq	r0, (UNDEF: 0)
     db8:	0002f29c 	muleq	r2, ip, r2
     dbc:	87f80c00 	ldrbhi	r0, [r8, r0, lsl #24]!
     dc0:	07f50000 	ldrbeq	r0, [r5, r0]!
     dc4:	029e0000 	addseq	r0, lr, #0
     dc8:	010d0000 	mrseq	r0, (UNDEF: 13)
     dcc:	0d310151 	ldfeqs	f0, [r1, #-324]!	; 0xfffffebc
     dd0:	40015001 	andmi	r5, r1, r1
     dd4:	88000c00 	stmdahi	r0, {sl, fp}
     dd8:	07e40000 	strbeq	r0, [r4, r0]!
     ddc:	02b10000 	adcseq	r0, r1, #0
     de0:	010d0000 	mrseq	r0, (UNDEF: 13)
     de4:	00400150 	subeq	r0, r0, r0, asr r1
     de8:	00880c0e 	addeq	r0, r8, lr, lsl #24
     dec:	00007300 	andeq	r7, r0, r0, lsl #6
     df0:	88140c00 	ldmdahi	r4, {sl, fp}
     df4:	07a10000 	streq	r0, [r1, r0]!
     df8:	02cd0000 	sbceq	r0, sp, #0
     dfc:	010d0000 	mrseq	r0, (UNDEF: 13)
     e00:	00400150 	subeq	r0, r0, r0, asr r1
     e04:	00881c0c 	addeq	r1, r8, ip, lsl #24
     e08:	00007300 	andeq	r7, r0, r0, lsl #6
     e0c:	0002e200 	andeq	lr, r2, r0, lsl #4
     e10:	50010d00 	andpl	r0, r1, r0, lsl #26
     e14:	c3500a03 	cmpgt	r0, #12288	; 0x3000
     e18:	88240f00 	stmdahi	r4!, {r8, r9, sl, fp}
     e1c:	07e40000 	strbeq	r0, [r4, r0]!
     e20:	010d0000 	mrseq	r0, (UNDEF: 13)
     e24:	00400150 	subeq	r0, r0, r0, asr r1
     e28:	020e0500 	andeq	r0, lr, #0, 10
     e2c:	71010000 	mrsvc	r0, (UNDEF: 1)
     e30:	00008828 	andeq	r8, r0, r8, lsr #16
     e34:	00000110 	andeq	r0, r0, r0, lsl r1
     e38:	05809c01 	streq	r9, [r0, #3073]	; 0xc01
     e3c:	300e0000 	andcc	r0, lr, r0
     e40:	71000088 	smlabbvc	r0, r8, r0, r0
     e44:	0c000002 	stceq	0, cr0, [r0], {2}
     e48:	0000883c 	andeq	r8, r0, ip, lsr r8
     e4c:	000007f5 	strdeq	r0, [r0], -r5
     e50:	00000328 	andeq	r0, r0, r8, lsr #6
     e54:	0151010d 	cmpeq	r1, sp, lsl #2
     e58:	50010d31 	andpl	r0, r1, r1, lsr sp
     e5c:	0c004001 	stceq	0, cr4, [r0], {1}
     e60:	00008848 	andeq	r8, r0, r8, asr #16
     e64:	000007f5 	strdeq	r0, [r0], -r5
     e68:	00000340 	andeq	r0, r0, r0, asr #6
     e6c:	0151010d 	cmpeq	r1, sp, lsl #2
     e70:	50010d31 	andpl	r0, r1, r1, lsr sp
     e74:	0c003901 	stceq	9, cr3, [r0], {1}
     e78:	00008850 	andeq	r8, r0, r0, asr r8
     e7c:	000007e4 	andeq	r0, r0, r4, ror #15
     e80:	00000353 	andeq	r0, r0, r3, asr r3
     e84:	0150010d 	cmpeq	r0, sp, lsl #2
     e88:	580c0040 	stmdapl	ip, {r6}
     e8c:	a1000088 	smlabbge	r0, r8, r0, r0
     e90:	66000007 	strvs	r0, [r0], -r7
     e94:	0d000003 	stceq	0, cr0, [r0, #-12]
     e98:	39015001 	stmdbcc	r1, {r0, ip, lr}
     e9c:	88600c00 	stmdahi	r0!, {sl, fp}^
     ea0:	00730000 	rsbseq	r0, r3, r0
     ea4:	037b0000 	cmneq	fp, #0
     ea8:	010d0000 	mrseq	r0, (UNDEF: 13)
     eac:	100a0350 	andne	r0, sl, r0, asr r3
     eb0:	6c0c0027 	stcvs	0, cr0, [ip], {39}	; 0x27
     eb4:	0b000088 	bleq	10dc <__start-0x6f24>
     eb8:	94000008 	strls	r0, [r0], #-8
     ebc:	0d000003 	stceq	0, cr0, [r0, #-12]
     ec0:	08025101 	stmdaeq	r2, {r0, r8, ip, lr}
     ec4:	50010d20 	andpl	r0, r1, r0, lsr #26
     ec8:	0c003001 	stceq	0, cr3, [r0], {1}
     ecc:	00008874 	andeq	r8, r0, r4, ror r8
     ed0:	0000016b 	andeq	r0, r0, fp, ror #2
     ed4:	000003a8 	andeq	r0, r0, r8, lsr #7
     ed8:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     edc:	0c00ae09 	stceq	14, cr10, [r0], {9}
     ee0:	0000887c 	andeq	r8, r0, ip, ror r8
     ee4:	0000016b 	andeq	r0, r0, fp, ror #2
     ee8:	000003bc 			; <UNDEFINED> instruction: 0x000003bc
     eec:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     ef0:	0c00d509 	cfstr32eq	mvfx13, [r0], {9}
     ef4:	00008884 	andeq	r8, r0, r4, lsl #17
     ef8:	0000016b 	andeq	r0, r0, fp, ror #2
     efc:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     f00:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f04:	0c008009 	stceq	0, cr8, [r0], {9}
     f08:	0000888c 	andeq	r8, r0, ip, lsl #17
     f0c:	0000016b 	andeq	r0, r0, fp, ror #2
     f10:	000003e4 	andeq	r0, r0, r4, ror #7
     f14:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     f18:	0c00a809 	stceq	8, cr10, [r0], {9}
     f1c:	00008894 	muleq	r0, r4, r8
     f20:	0000016b 	andeq	r0, r0, fp, ror #2
     f24:	000003f7 	strdeq	r0, [r0], -r7
     f28:	0150010d 	cmpeq	r0, sp, lsl #2
     f2c:	9c0c004f 	stcls	0, cr0, [ip], {79}	; 0x4f
     f30:	6b000088 	blvs	1158 <__start-0x6ea8>
     f34:	0b000001 	bleq	f40 <__start-0x70c0>
     f38:	0d000004 	stceq	0, cr0, [r0, #-16]
     f3c:	09025001 	stmdbeq	r2, {r0, ip, lr}
     f40:	a40c00d3 	strge	r0, [ip], #-211	; 0xd3
     f44:	6b000088 	blvs	116c <__start-0x6e94>
     f48:	1e000001 	cdpne	0, 0, cr0, cr0, cr1, {0}
     f4c:	0d000004 	stceq	0, cr0, [r0, #-16]
     f50:	30015001 	andcc	r5, r1, r1
     f54:	88ac0c00 	stmiahi	ip!, {sl, fp}
     f58:	016b0000 	cmneq	fp, r0
     f5c:	04320000 	ldrteq	r0, [r2], #-0
     f60:	010d0000 	mrseq	r0, (UNDEF: 13)
     f64:	40080250 	andmi	r0, r8, r0, asr r2
     f68:	88b40c00 	ldmhi	r4!, {sl, fp}
     f6c:	016b0000 	cmneq	fp, r0
     f70:	04460000 	strbeq	r0, [r6], #-0
     f74:	010d0000 	mrseq	r0, (UNDEF: 13)
     f78:	8d090250 	sfmhi	f0, 4, [r9, #-320]	; 0xfffffec0
     f7c:	88bc0c00 	ldmhi	ip!, {sl, fp}
     f80:	016b0000 	cmneq	fp, r0
     f84:	04590000 	ldrbeq	r0, [r9], #-0
     f88:	010d0000 	mrseq	r0, (UNDEF: 13)
     f8c:	00440150 	subeq	r0, r4, r0, asr r1
     f90:	0088c40c 	addeq	ip, r8, ip, lsl #8
     f94:	00016b00 	andeq	r6, r1, r0, lsl #22
     f98:	00046d00 	andeq	r6, r4, r0, lsl #26
     f9c:	50010d00 	andpl	r0, r1, r0, lsl #26
     fa0:	00200802 	eoreq	r0, r0, r2, lsl #16
     fa4:	0088cc0c 	addeq	ip, r8, ip, lsl #24
     fa8:	00016b00 	andeq	r6, r1, r0, lsl #22
     fac:	00048000 	andeq	r8, r4, r0
     fb0:	50010d00 	andpl	r0, r1, r0, lsl #26
     fb4:	0c003001 	stceq	0, cr3, [r0], {1}
     fb8:	000088d4 	ldrdeq	r8, [r0], -r4
     fbc:	0000016b 	andeq	r0, r0, fp, ror #2
     fc0:	00000494 	muleq	r0, r4, r4
     fc4:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     fc8:	0c00a109 	stfeqd	f2, [r0], {9}
     fcc:	000088dc 	ldrdeq	r8, [r0], -ip
     fd0:	0000016b 	andeq	r0, r0, fp, ror #2
     fd4:	000004a8 	andeq	r0, r0, r8, lsr #9
     fd8:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     fdc:	0c00c809 	stceq	8, cr12, [r0], {9}
     fe0:	000088e4 	andeq	r8, r0, r4, ror #17
     fe4:	0000016b 	andeq	r0, r0, fp, ror #2
     fe8:	000004bc 			; <UNDEFINED> instruction: 0x000004bc
     fec:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
     ff0:	0c00da09 	stceq	10, cr13, [r0], {9}
     ff4:	000088ec 	andeq	r8, r0, ip, ror #17
     ff8:	0000016b 	andeq	r0, r0, fp, ror #2
     ffc:	000004cf 	andeq	r0, r0, pc, asr #9
    1000:	0150010d 	cmpeq	r0, sp, lsl #2
    1004:	f40c0032 	vst4.8	{d0-d3}, [ip :256], r2
    1008:	6b000088 	blvs	1230 <__start-0x6dd0>
    100c:	e3000001 	movw	r0, #1
    1010:	0d000004 	stceq	0, cr0, [r0, #-16]
    1014:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1018:	fc0c0081 	stc2	0, cr0, [ip], {129}	; 0x81
    101c:	6b000088 	blvs	1244 <__start-0x6dbc>
    1020:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
    1024:	0d000004 	stceq	0, cr0, [r0, #-16]
    1028:	09025001 	stmdbeq	r2, {r0, ip, lr}
    102c:	040c008f 	streq	r0, [ip], #-143	; 0x8f
    1030:	6b000089 	blvs	125c <__start-0x6da4>
    1034:	0b000001 	bleq	1040 <__start-0x6fc0>
    1038:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    103c:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1040:	0c0c00d9 	stceq	0, cr0, [ip], {217}	; 0xd9
    1044:	6b000089 	blvs	1270 <__start-0x6d90>
    1048:	1f000001 	svcne	0x00000001
    104c:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    1050:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1054:	140c00f1 	strne	r0, [ip], #-241	; 0xf1
    1058:	6b000089 	blvs	1284 <__start-0x6d7c>
    105c:	33000001 	movwcc	r0, #1
    1060:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    1064:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1068:	1c0c00db 	stcne	0, cr0, [ip], {219}	; 0xdb
    106c:	6b000089 	blvs	1298 <__start-0x6d68>
    1070:	47000001 	strmi	r0, [r0, -r1]
    1074:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    1078:	08025001 	stmdaeq	r2, {r0, ip, lr}
    107c:	240c0040 	strcs	r0, [ip], #-64	; 0x40
    1080:	6b000089 	blvs	12ac <__start-0x6d54>
    1084:	5b000001 	blpl	1090 <__start-0x6f70>
    1088:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    108c:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1090:	2c0c00a4 	stccs	0, cr0, [ip], {164}	; 0xa4
    1094:	6b000089 	blvs	12c0 <__start-0x6d40>
    1098:	6f000001 	svcvs	0x00000001
    109c:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
    10a0:	09025001 	stmdbeq	r2, {r0, ip, lr}
    10a4:	340f00a6 	strcc	r0, [pc], #-166	; 10ac <__start-0x6f54>
    10a8:	6b000089 	blvs	12d4 <__start-0x6d2c>
    10ac:	0d000001 	stceq	0, cr0, [r0, #-4]
    10b0:	09025001 	stmdbeq	r2, {r0, ip, lr}
    10b4:	050000af 	streq	r0, [r0, #-175]	; 0xaf
    10b8:	000003fa 	strdeq	r0, [r0], -sl
    10bc:	89389701 	ldmdbhi	r8!, {r0, r8, r9, sl, ip, pc}
    10c0:	00380000 	eorseq	r0, r8, r0
    10c4:	9c010000 	stcls	0, cr0, [r1], {-0}
    10c8:	00000607 	andeq	r0, r0, r7, lsl #12
    10cc:	0089440c 	addeq	r4, r9, ip, lsl #8
    10d0:	00016b00 	andeq	r6, r1, r0, lsl #22
    10d4:	0005a900 	andeq	sl, r5, r0, lsl #18
    10d8:	50010d00 	andpl	r0, r1, r0, lsl #26
    10dc:	00210802 	eoreq	r0, r1, r2, lsl #16
    10e0:	00894c0c 	addeq	r4, r9, ip, lsl #24
    10e4:	00016b00 	andeq	r6, r1, r0, lsl #22
    10e8:	0005bc00 	andeq	fp, r5, r0, lsl #24
    10ec:	50010d00 	andpl	r0, r1, r0, lsl #26
    10f0:	0c003001 	stceq	0, cr3, [r0], {1}
    10f4:	00008954 	andeq	r8, r0, r4, asr r9
    10f8:	0000016b 	andeq	r0, r0, fp, ror #2
    10fc:	000005d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    1100:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
    1104:	0c007f08 	stceq	15, cr7, [r0], {8}
    1108:	0000895c 	andeq	r8, r0, ip, asr r9
    110c:	0000016b 	andeq	r0, r0, fp, ror #2
    1110:	000005e4 	andeq	r0, r0, r4, ror #11
    1114:	0250010d 	subseq	r0, r0, #1073741827	; 0x40000003
    1118:	0c002208 	sfmeq	f2, 4, [r0], {8}
    111c:	00008964 	andeq	r8, r0, r4, ror #18
    1120:	0000016b 	andeq	r0, r0, fp, ror #2
    1124:	000005f7 	strdeq	r0, [r0], -r7
    1128:	0150010d 	cmpeq	r0, sp, lsl #2
    112c:	6c0f0030 	stcvs	0, cr0, [pc], {48}	; 0x30
    1130:	6b000089 	blvs	135c <__start-0x6ca4>
    1134:	0d000001 	stceq	0, cr0, [r0, #-4]
    1138:	33015001 	movwcc	r5, #4097	; 0x1001
    113c:	ed0a0000 	stc	0, cr0, [sl, #-0]
    1140:	01000001 	tsteq	r0, r1
    1144:	00004130 	andeq	r4, r0, r0, lsr r1
    1148:	00897000 	addeq	r7, r9, r0
    114c:	00004400 	andeq	r4, r0, r0, lsl #8
    1150:	779c0100 	ldrvc	r0, [ip, r0, lsl #2]
    1154:	09000006 	stmdbeq	r0, {r1, r2}
    1158:	000003e1 	andeq	r0, r0, r1, ror #7
    115c:	00333201 	eorseq	r3, r3, r1, lsl #4
    1160:	07420000 	strbeq	r0, [r2, -r0]
    1164:	780e0000 	stmdavc	lr, {}	; <UNPREDICTABLE>
    1168:	80000089 	andhi	r0, r0, r9, lsl #1
    116c:	0c000005 	stceq	0, cr0, [r0], {5}
    1170:	00008980 	andeq	r8, r0, r0, lsl #19
    1174:	000007e4 	andeq	r0, r0, r4, ror #15
    1178:	0000064b 	andeq	r0, r0, fp, asr #12
    117c:	0150010d 	cmpeq	r0, sp, lsl #2
    1180:	8c0c0039 	stchi	0, cr0, [ip], {57}	; 0x39
    1184:	b2000089 	andlt	r0, r0, #137	; 0x89
    1188:	64000007 	strvs	r0, [r0], #-7
    118c:	0d000006 	stceq	0, cr0, [r0, #-24]	; 0xffffffe8
    1190:	08025101 	stmdaeq	r2, {r0, r8, ip, lr}
    1194:	50010d20 	andpl	r0, r1, r0, lsr #26
    1198:	0e003001 	cdpeq	0, 0, cr3, cr0, cr1, {0}
    119c:	0000899c 	muleq	r0, ip, r9
    11a0:	000007c8 	andeq	r0, r0, r8, asr #15
    11a4:	0089a80e 	addeq	sl, r9, lr, lsl #16
    11a8:	0007dd00 	andeq	sp, r7, r0, lsl #26
    11ac:	be050000 	cdplt	0, 0, cr0, cr5, cr0, {0}
    11b0:	01000003 	tsteq	r0, r3
    11b4:	0089b45b 	addeq	fp, r9, fp, asr r4
    11b8:	00006000 	andeq	r6, r0, r0
    11bc:	f29c0100 	vaddw.s16	q0, q6, d0
    11c0:	0b000006 	bleq	11e0 <__start-0x6e20>
    11c4:	5c010069 	stcpl	0, cr0, [r1], {105}	; 0x69
    11c8:	00000033 	andeq	r0, r0, r3, lsr r0
    11cc:	0000078f 	andeq	r0, r0, pc, lsl #15
    11d0:	746e6310 	strbtvc	r6, [lr], #-784	; 0x310
    11d4:	335d0100 	cmpcc	sp, #0, 2
    11d8:	05000000 	streq	r0, [r0, #-0]
    11dc:	00b00003 	adcseq	r0, r0, r3
    11e0:	89bc0e00 	ldmibhi	ip!, {r9, sl, fp}
    11e4:	05800000 	streq	r0, [r0]
    11e8:	c40c0000 	strgt	r0, [ip], #-0
    11ec:	e4000089 	str	r0, [r0], #-137	; 0x89
    11f0:	c6000007 	strgt	r0, [r0], -r7
    11f4:	0d000006 	stceq	0, cr0, [r0, #-24]	; 0xffffffe8
    11f8:	39015001 	stmdbcc	r1, {r0, ip, lr}
    11fc:	89d00c00 	ldmibhi	r0, {sl, fp}^
    1200:	07b20000 	ldreq	r0, [r2, r0]!
    1204:	06df0000 	ldrbeq	r0, [pc], r0
    1208:	010d0000 	mrseq	r0, (UNDEF: 13)
    120c:	20080251 	andcs	r0, r8, r1, asr r2
    1210:	0150010d 	cmpeq	r0, sp, lsl #2
    1214:	f00e0030 			; <UNDEFINED> instruction: 0xf00e0030
    1218:	c8000089 	stmdagt	r0, {r0, r3, r7}
    121c:	0e000007 	cdpeq	0, 0, cr0, cr0, cr7, {0}
    1220:	000089fc 	strdeq	r8, [r0], -ip
    1224:	000007dd 	ldrdeq	r0, [r0], -sp
    1228:	03cf0500 	biceq	r0, pc, #0, 10
    122c:	67010000 	strvs	r0, [r1, -r0]
    1230:	00008a14 	andeq	r8, r0, r4, lsl sl
    1234:	0000003c 	andeq	r0, r0, ip, lsr r0
    1238:	07679c01 	strbeq	r9, [r7, -r1, lsl #24]!
    123c:	690b0000 	stmdbvs	fp, {}	; <UNPREDICTABLE>
    1240:	33680100 	cmncc	r8, #0, 2
    1244:	d6000000 	strle	r0, [r0], -r0
    1248:	0e000007 	cdpeq	0, 0, cr0, cr0, cr7, {0}
    124c:	00008a1c 	andeq	r8, r0, ip, lsl sl
    1250:	00000580 	andeq	r0, r0, r0, lsl #11
    1254:	008a240c 	addeq	r2, sl, ip, lsl #8
    1258:	0007e400 	andeq	lr, r7, r0, lsl #8
    125c:	00073000 	andeq	r3, r7, r0
    1260:	50010d00 	andpl	r0, r1, r0, lsl #26
    1264:	0c003901 	stceq	9, cr3, [r0], {1}
    1268:	00008a30 	andeq	r8, r0, r0, lsr sl
    126c:	000007b2 			; <UNDEFINED> instruction: 0x000007b2
    1270:	00000749 	andeq	r0, r0, r9, asr #14
    1274:	0251010d 	subseq	r0, r1, #1073741827	; 0x40000003
    1278:	010d2008 	tsteq	sp, r8
    127c:	00300150 	eorseq	r0, r0, r0, asr r1
    1280:	008a400c 	addeq	r4, sl, ip
    1284:	0007c800 	andeq	ip, r7, r0, lsl #16
    1288:	00075d00 	andeq	r5, r7, r0, lsl #26
    128c:	50010d00 	andpl	r0, r1, r0, lsl #26
    1290:	00007502 	andeq	r7, r0, r2, lsl #10
    1294:	008a4c0e 	addeq	r4, sl, lr, lsl #24
    1298:	0007dd00 	andeq	sp, r7, r0, lsl #26
    129c:	63110000 	tstvs	r1, #0
    12a0:	0100746e 	tsteq	r0, lr, ror #8
    12a4:	00004106 	andeq	r4, r0, r6, lsl #2
    12a8:	00030500 	andeq	r0, r3, r0, lsl #10
    12ac:	120000a0 	andne	r0, r0, #160	; 0xa0
    12b0:	00000041 	andeq	r0, r0, r1, asr #32
    12b4:	00000789 	andeq	r0, r0, r9, lsl #15
    12b8:	00078913 	andeq	r8, r7, r3, lsl r9
    12bc:	0001ff00 	andeq	pc, r1, r0, lsl #30
    12c0:	7f070402 	svcvc	0x00070402
    12c4:	14000002 	strne	r0, [r0], #-2
    12c8:	000003e7 	andeq	r0, r0, r7, ror #7
    12cc:	07780e01 	ldrbeq	r0, [r8, -r1, lsl #28]!
    12d0:	03050000 	movweq	r0, #20480	; 0x5000
    12d4:	0000b004 	andeq	fp, r0, r4
    12d8:	00004115 	andeq	r4, r0, r5, lsl r1
    12dc:	b2430300 	sublt	r0, r3, #0, 6
    12e0:	16000007 	strne	r0, [r0], -r7
    12e4:	00000041 	andeq	r0, r0, r1, asr #32
    12e8:	03461500 	movteq	r1, #25856	; 0x6500
    12ec:	74040000 	strvc	r0, [r4], #-0
    12f0:	000007c8 	andeq	r0, r0, r8, asr #15
    12f4:	00004116 	andeq	r4, r0, r6, lsl r1
    12f8:	005a1600 	subseq	r1, sl, r0, lsl #12
    12fc:	17000000 	strne	r0, [r0, -r0]
    1300:	00000350 	andeq	r0, r0, r0, asr r3
    1304:	00418204 	subeq	r8, r1, r4, lsl #4
    1308:	07dd0000 	ldrbeq	r0, [sp, r0]
    130c:	41160000 	tstmi	r6, r0
    1310:	00000000 	andeq	r0, r0, r0
    1314:	00037e18 	andeq	r7, r3, r8, lsl lr
    1318:	157a0400 	ldrbne	r0, [sl, #-1024]!	; 0x400
    131c:	00000021 	andeq	r0, r0, r1, lsr #32
    1320:	07f53d03 	ldrbeq	r3, [r5, r3, lsl #26]!
    1324:	41160000 	tstmi	r6, r0
    1328:	00000000 	andeq	r0, r0, r0
    132c:	00010e15 	andeq	r0, r1, r5, lsl lr
    1330:	0b370300 	bleq	dc1f38 <__user_program+0xac1f38>
    1334:	16000008 	strne	r0, [r0], -r8
    1338:	00000041 	andeq	r0, r0, r1, asr #32
    133c:	00004116 	andeq	r4, r0, r6, lsl r1
    1340:	5d190000 	ldcpl	0, cr0, [r9, #-0]
    1344:	04000003 	streq	r0, [r0], #-3
    1348:	005a166e 	subseq	r1, sl, lr, ror #12
    134c:	5a160000 	bpl	581354 <__user_program+0x281354>
    1350:	00000000 	andeq	r0, r0, r0
    1354:	00006a00 	andeq	r6, r0, r0, lsl #20
    1358:	a8000200 	stmdage	r0, {r9}
    135c:	04000007 	streq	r0, [r0], #-7
    1360:	0004d401 	andeq	sp, r4, r1, lsl #8
    1364:	00800000 	addeq	r0, r0, r0
    1368:	00805400 	addeq	r5, r0, r0, lsl #8
    136c:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
    1370:	6b62696c 	blvs	189b928 <__user_program+0x159b928>
    1374:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
    1378:	6f6f622f 	svcvs	0x006f622f
    137c:	00532e74 	subseq	r2, r3, r4, ror lr
    1380:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 12cc <__start-0x6d34>
    1384:	69762f65 	ldmdbvs	r6!, {r0, r2, r5, r6, r8, r9, sl, fp, sp}^
    1388:	2f6b6576 	svccs	0x006b6576
    138c:	75636f44 	strbvc	r6, [r3, #-3908]!	; 0xf44
    1390:	746e656d 	strbtvc	r6, [lr], #-1389	; 0x56d
    1394:	38312f73 	ldmdacc	r1!, {r0, r1, r4, r5, r6, r8, r9, sl, fp, sp}
    1398:	3934332d 	ldmdbcc	r4!, {r0, r2, r3, r5, r8, r9, ip, sp}
    139c:	3631662d 	ldrtcc	r6, [r1], -sp, lsr #12
    13a0:	62616c2f 	rsbvs	r6, r1, #12032	; 0x2f00
    13a4:	61685f33 	cmnvs	r8, r3, lsr pc
    13a8:	756f646e 	strbvc	r6, [pc, #-1134]!	; f42 <__start-0x70be>
    13ac:	6f632f74 	svcvs	0x00632f74
    13b0:	47006564 	strmi	r6, [r0, -r4, ror #10]
    13b4:	4120554e 	teqmi	r0, lr, asr #10
    13b8:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    13bc:	302e3432 	eorcc	r3, lr, r2, lsr r4
    13c0:	69800100 	stmibvs	r0, {r8}
    13c4:	02000000 	andeq	r0, r0, #0
    13c8:	0007bc00 	andeq	fp, r7, r0, lsl #24
    13cc:	2c010400 	cfstrscs	mvf0, [r1], {-0}
    13d0:	50000005 	andpl	r0, r0, r5
    13d4:	9400008a 	strls	r0, [r0], #-138	; 0x8a
    13d8:	3300008a 	movwcc	r0, #138	; 0x8a
    13dc:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
    13e0:	732f6b62 	teqvc	pc, #100352	; 0x18800
    13e4:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
    13e8:	532e6d72 	teqpl	lr, #7296	; 0x1c80
    13ec:	6f682f00 	svcvs	0x00682f00
    13f0:	762f656d 	strtvc	r6, [pc], -sp, ror #10
    13f4:	6b657669 	blvs	195eda0 <__user_program+0x165eda0>
    13f8:	636f442f 	cmnvs	pc, #788529152	; 0x2f000000
    13fc:	6e656d75 	mcrvs	13, 3, r6, cr5, cr5, {3}
    1400:	312f7374 	teqcc	pc, r4, ror r3	; <UNPREDICTABLE>
    1404:	34332d38 	ldrtcc	r2, [r3], #-3384	; 0xd38
    1408:	31662d39 	cmncc	r6, r9, lsr sp
    140c:	616c2f36 	cmnvs	ip, r6, lsr pc
    1410:	685f3362 	ldmdavs	pc, {r1, r5, r6, r8, r9, ip, sp}^	; <UNPREDICTABLE>
    1414:	6f646e61 	svcvs	0x00646e61
    1418:	632f7475 	teqvs	pc, #1962934272	; 0x75000000
    141c:	0065646f 	rsbeq	r6, r5, pc, ror #8
    1420:	20554e47 	subscs	r4, r5, r7, asr #28
    1424:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    1428:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    142c:	80010030 	andhi	r0, r1, r0, lsr r0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1930ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a187c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	03000506 	movweq	r0, #1286	; 0x506
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a187c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000017 	smladeq	r0, r7, r0, r0
  60:	08030005 	stmdaeq	r3, {r0, r2}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a080300 	bcc	200c78 <__end+0xd3c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00170213 	andseq	r0, r7, r3, lsl r2
  7c:	00340900 	eorseq	r0, r4, r0, lsl #18
  80:	0b3a0e03 	bleq	e83894 <__user_program+0xb83894>
  84:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  88:	00001702 	andeq	r1, r0, r2, lsl #14
  8c:	0300050a 	movweq	r0, #1290	; 0x50a
  90:	3b0b3a0e 	blcc	2ce8d0 <__end+0x1a18d0>
  94:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  98:	0b000017 	bleq	fc <__start-0x7f04>
  9c:	01018289 	smlabbeq	r1, r9, r2, r8
  a0:	13310111 	teqne	r1, #1073741828	; 0x40000004
  a4:	00001301 	andeq	r1, r0, r1, lsl #6
  a8:	01828a0c 	orreq	r8, r2, ip, lsl #20
  ac:	91180200 	tstls	r8, r0, lsl #4
  b0:	00001842 	andeq	r1, r0, r2, asr #16
  b4:	0182890d 	orreq	r8, r2, sp, lsl #18
  b8:	31011101 	tstcc	r1, r1, lsl #2
  bc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
  c0:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  c4:	0b3b0b3a 	bleq	ec2db4 <__user_program+0xbc2db4>
  c8:	061c1349 	ldreq	r1, [ip], -r9, asr #6
  cc:	260f0000 	strcs	r0, [pc], -r0
  d0:	00134900 	andseq	r4, r3, r0, lsl #18
  d4:	000f1000 	andeq	r1, pc, r0
  d8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  dc:	35110000 	ldrcc	r0, [r1, #-0]
  e0:	00134900 	andseq	r4, r3, r0, lsl #18
  e4:	012e1200 	teqeq	lr, r0, lsl #4
  e8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  ec:	0b3b0b3a 	bleq	ec2ddc <__user_program+0xbc2ddc>
  f0:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
  f4:	05130000 	ldreq	r0, [r3, #-0]
  f8:	00134900 	andseq	r4, r3, r0, lsl #18
  fc:	11010000 	mrsne	r0, (UNDEF: 1)
 100:	130e2501 	movwne	r2, #58625	; 0xe501
 104:	1b0e030b 	blne	380d38 <__user_program+0x80d38>
 108:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 10c:	00171006 	andseq	r1, r7, r6
 110:	00240200 	eoreq	r0, r4, r0, lsl #4
 114:	0b3e0b0b 	bleq	f82d48 <__user_program+0xc82d48>
 118:	00000e03 	andeq	r0, r0, r3, lsl #28
 11c:	0b002403 	bleq	9130 <__rodata_start+0x130>
 120:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 124:	04000008 	streq	r0, [r0], #-8
 128:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 12c:	0b3b0b3a 	bleq	ec2e1c <__user_program+0xbc2e1c>
 130:	00001349 	andeq	r1, r0, r9, asr #6
 134:	3f012e05 	svccc	0x00012e05
 138:	3a0e0319 	bcc	380da4 <__user_program+0x80da4>
 13c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 140:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 144:	97184006 	ldrls	r4, [r8, -r6]
 148:	13011942 	movwne	r1, #6466	; 0x1942
 14c:	34060000 	strcc	r0, [r6], #-0
 150:	3a080300 	bcc	200d58 <__end+0xd3d58>
 154:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 158:	00170213 	andseq	r0, r7, r3, lsl r2
 15c:	82890700 	addhi	r0, r9, #0, 14
 160:	01110001 	tsteq	r1, r1
 164:	00001331 	andeq	r1, r0, r1, lsr r3
 168:	01828908 	orreq	r8, r2, r8, lsl #18
 16c:	31011101 	tstcc	r1, r1, lsl #2
 170:	00130113 	andseq	r0, r3, r3, lsl r1
 174:	828a0900 	addhi	r0, sl, #0, 18
 178:	18020001 	stmdane	r2, {r0}
 17c:	00184291 	mulseq	r8, r1, r2
 180:	82890a00 	addhi	r0, r9, #0, 20
 184:	01110101 	tsteq	r1, r1, lsl #2
 188:	00001331 	andeq	r1, r0, r1, lsr r3
 18c:	3f002e0b 	svccc	0x00002e0b
 190:	3a0e0319 	bcc	380dfc <__user_program+0x80dfc>
 194:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 198:	00193c19 	andseq	r3, r9, r9, lsl ip
 19c:	012e0c00 	teqeq	lr, r0, lsl #24
 1a0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 1a4:	0b3b0b3a 	bleq	ec2e94 <__user_program+0xbc2e94>
 1a8:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 1ac:	00001301 	andeq	r1, r0, r1, lsl #6
 1b0:	0000180d 	andeq	r1, r0, sp, lsl #16
 1b4:	012e0e00 	teqeq	lr, r0, lsl #28
 1b8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 1bc:	0b3b0b3a 	bleq	ec2eac <__user_program+0xbc2eac>
 1c0:	13491927 	movtne	r1, #39207	; 0x9927
 1c4:	1301193c 	movwne	r1, #6460	; 0x193c
 1c8:	050f0000 	streq	r0, [pc, #-0]	; 1d0 <__start-0x7e30>
 1cc:	00134900 	andseq	r4, r3, r0, lsl #18
 1d0:	012e1000 	teqeq	lr, r0
 1d4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 1d8:	0b3b0b3a 	bleq	ec2ec8 <__user_program+0xbc2ec8>
 1dc:	13491927 	movtne	r1, #39207	; 0x9927
 1e0:	0000193c 	andeq	r1, r0, ip, lsr r9
 1e4:	01110100 	tsteq	r1, r0, lsl #2
 1e8:	0b130e25 	bleq	4c3a84 <__user_program+0x1c3a84>
 1ec:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 1f0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1f4:	00001710 	andeq	r1, r0, r0, lsl r7
 1f8:	03001602 	movweq	r1, #1538	; 0x602
 1fc:	3b0b3a0e 	blcc	2cea3c <__end+0x1a1a3c>
 200:	0013490b 	andseq	r4, r3, fp, lsl #18
 204:	00240300 	eoreq	r0, r4, r0, lsl #6
 208:	0b3e0b0b 	bleq	f82e3c <__user_program+0xc82e3c>
 20c:	00000e03 	andeq	r0, r0, r3, lsl #28
 210:	0b002404 	bleq	9228 <__rodata_start+0x228>
 214:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 218:	05000008 	streq	r0, [r0, #-8]
 21c:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 220:	0b3a0b0b 	bleq	e82e54 <__user_program+0xb82e54>
 224:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 228:	0d060000 	stceq	0, cr0, [r6, #-0]
 22c:	490e0300 	stmdbmi	lr, {r8, r9}
 230:	340b3813 	strcc	r3, [fp], #-2067	; 0x813
 234:	07000019 	smladeq	r0, r9, r0, r0
 238:	0b0b000f 	bleq	2c027c <__end+0x19327c>
 23c:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 240:	3a0e0301 	bcc	380e4c <__user_program+0x80e4c>
 244:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 248:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 24c:	96184006 	ldrls	r4, [r8], -r6
 250:	13011942 	movwne	r1, #6466	; 0x1942
 254:	05090000 	streq	r0, [r9, #-0]
 258:	3a0e0300 	bcc	380e60 <__user_program+0x80e60>
 25c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 260:	00170213 	andseq	r0, r7, r3, lsl r2
 264:	00050a00 	andeq	r0, r5, r0, lsl #20
 268:	0b3a0803 	bleq	e8227c <__user_program+0xb8227c>
 26c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 270:	00001702 	andeq	r1, r0, r2, lsl #14
 274:	0300340b 	movweq	r3, #1035	; 0x40b
 278:	3b0b3a0e 	blcc	2ceab8 <__end+0x1a1ab8>
 27c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 280:	0c000017 	stceq	0, cr0, [r0], {23}
 284:	08030034 	stmdaeq	r3, {r2, r4, r5}
 288:	0b3b0b3a 	bleq	ec2f78 <__user_program+0xbc2f78>
 28c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 290:	340d0000 	strcc	r0, [sp], #-0
 294:	3a080300 	bcc	200e9c <__end+0xd3e9c>
 298:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 29c:	00170213 	andseq	r0, r7, r3, lsl r2
 2a0:	82890e00 	addhi	r0, r9, #0, 28
 2a4:	01110001 	tsteq	r1, r1
 2a8:	00001331 	andeq	r1, r0, r1, lsr r3
 2ac:	0b000f0f 	bleq	3ef0 <__start-0x4110>
 2b0:	0013490b 	andseq	r4, r3, fp, lsl #18
 2b4:	01011000 	mrseq	r1, (UNDEF: 1)
 2b8:	13011349 	movwne	r1, #4937	; 0x1349
 2bc:	21110000 	tstcs	r1, r0
 2c0:	2f134900 	svccs	0x00134900
 2c4:	1200000b 	andne	r0, r0, #11
 2c8:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 2cc:	0b3a0e03 	bleq	e83ae0 <__user_program+0xb83ae0>
 2d0:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2d4:	01111349 	tsteq	r1, r9, asr #6
 2d8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 2dc:	01194297 			; <UNDEFINED> instruction: 0x01194297
 2e0:	13000013 	movwne	r0, #19
 2e4:	00000018 	andeq	r0, r0, r8, lsl r0
 2e8:	03003414 	movweq	r3, #1044	; 0x414
 2ec:	3b0b3a0e 	blcc	2ceb2c <__end+0x1a1b2c>
 2f0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 2f4:	15000018 	strne	r0, [r0, #-24]
 2f8:	1755010b 	ldrbne	r0, [r5, -fp, lsl #2]
 2fc:	00001301 	andeq	r1, r0, r1, lsl #6
 300:	01828916 	orreq	r8, r2, r6, lsl r9
 304:	31011101 	tstcc	r1, r1, lsl #2
 308:	17000013 	smladne	r0, r3, r0, r0
 30c:	0001828a 	andeq	r8, r1, sl, lsl #5
 310:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 314:	18000018 	stmdane	r0, {r3, r4}
 318:	0111010b 	tsteq	r1, fp, lsl #2
 31c:	13010612 	movwne	r0, #5650	; 0x1612
 320:	89190000 	ldmdbhi	r9, {}	; <UNPREDICTABLE>
 324:	11010182 	smlabbne	r1, r2, r1, r0
 328:	01133101 	tsteq	r3, r1, lsl #2
 32c:	1a000013 	bne	380 <__start-0x7c80>
 330:	13490026 	movtne	r0, #36902	; 0x9026
 334:	2e1b0000 	cdpcs	0, 1, cr0, cr11, cr0, {0}
 338:	03193f01 	tsteq	r9, #1, 30
 33c:	3b0b3a0e 	blcc	2ceb7c <__end+0x1a1b7c>
 340:	3c19270b 	ldccc	7, cr2, [r9], {11}
 344:	1c000019 	stcne	0, cr0, [r0], {25}
 348:	13490005 	movtne	r0, #36869	; 0x9005
 34c:	01000000 	mrseq	r0, (UNDEF: 0)
 350:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 354:	0e030b13 	vmoveq.32	d3[0], r0
 358:	01110e1b 	tsteq	r1, fp, lsl lr
 35c:	17100612 			; <UNDEFINED> instruction: 0x17100612
 360:	24020000 	strcs	r0, [r2], #-0
 364:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 368:	000e030b 	andeq	r0, lr, fp, lsl #6
 36c:	00240300 	eoreq	r0, r4, r0, lsl #6
 370:	0b3e0b0b 	bleq	f82fa4 <__user_program+0xc82fa4>
 374:	00000803 	andeq	r0, r0, r3, lsl #16
 378:	03001604 	movweq	r1, #1540	; 0x604
 37c:	3b0b3a0e 	blcc	2cebbc <__end+0x1a1bbc>
 380:	0013490b 	andseq	r4, r3, fp, lsl #18
 384:	002e0500 	eoreq	r0, lr, r0, lsl #10
 388:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 38c:	0b3b0b3a 	bleq	ec307c <__user_program+0xbc307c>
 390:	01111927 	tsteq	r1, r7, lsr #18
 394:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 398:	00194297 	mulseq	r9, r7, r2
 39c:	012e0600 	teqeq	lr, r0, lsl #12
 3a0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 3a4:	0b3b0b3a 	bleq	ec3094 <__user_program+0xbc3094>
 3a8:	01111927 	tsteq	r1, r7, lsr #18
 3ac:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 3b0:	01194297 			; <UNDEFINED> instruction: 0x01194297
 3b4:	07000013 	smladeq	r0, r3, r0, r0
 3b8:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 3bc:	0b3b0b3a 	bleq	ec30ac <__user_program+0xbc30ac>
 3c0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 3c4:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 3c8:	03193f00 	tsteq	r9, #0, 30
 3cc:	3b0b3a0e 	blcc	2cec0c <__end+0x1a1c0c>
 3d0:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 3d4:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 3d8:	97184006 	ldrls	r4, [r8, -r6]
 3dc:	00001942 	andeq	r1, r0, r2, asr #18
 3e0:	01110100 	tsteq	r1, r0, lsl #2
 3e4:	0b130e25 	bleq	4c3c80 <__user_program+0x1c3c80>
 3e8:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 3ec:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3f0:	00001710 	andeq	r1, r0, r0, lsl r7
 3f4:	0b002402 	bleq	9404 <__rodata_start+0x404>
 3f8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 3fc:	0300000e 	movweq	r0, #14
 400:	0b0b0024 	bleq	2c0498 <__end+0x193498>
 404:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 408:	16040000 	strne	r0, [r4], -r0
 40c:	3a0e0300 	bcc	381014 <__user_program+0x81014>
 410:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 414:	05000013 	streq	r0, [r0, #-19]
 418:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 41c:	0b3a0e03 	bleq	e83c30 <__user_program+0xb83c30>
 420:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 424:	06120111 			; <UNDEFINED> instruction: 0x06120111
 428:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 42c:	00130119 	andseq	r0, r3, r9, lsl r1
 430:	00050600 	andeq	r0, r5, r0, lsl #12
 434:	0b3a0803 	bleq	e82448 <__user_program+0xb82448>
 438:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 43c:	00001802 	andeq	r1, r0, r2, lsl #16
 440:	3f012e07 	svccc	0x00012e07
 444:	3a0e0319 	bcc	3810b0 <__user_program+0x810b0>
 448:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 44c:	11134919 	tstne	r3, r9, lsl r9
 450:	40061201 	andmi	r1, r6, r1, lsl #4
 454:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 458:	00001301 	andeq	r1, r0, r1, lsl #6
 45c:	03000508 	movweq	r0, #1288	; 0x508
 460:	3b0b3a08 	blcc	2cec88 <__end+0x1a1c88>
 464:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 468:	09000017 	stmdbeq	r0, {r0, r1, r2, r4}
 46c:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 470:	0b3b0b3a 	bleq	ec3160 <__user_program+0xbc3160>
 474:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 478:	0f0a0000 	svceq	0x000a0000
 47c:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 480:	0b000013 	bleq	4d4 <__start-0x7b2c>
 484:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 488:	0b3a0e03 	bleq	e83c9c <__user_program+0xb83c9c>
 48c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 490:	01111349 	tsteq	r1, r9, asr #6
 494:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 498:	00194297 	mulseq	r9, r7, r2
 49c:	11010000 	mrsne	r0, (UNDEF: 1)
 4a0:	130e2501 	movwne	r2, #58625	; 0xe501
 4a4:	1b0e030b 	blne	3810d8 <__user_program+0x810d8>
 4a8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 4ac:	00171006 	andseq	r1, r7, r6
 4b0:	00240200 	eoreq	r0, r4, r0, lsl #4
 4b4:	0b3e0b0b 	bleq	f830e8 <__user_program+0xc830e8>
 4b8:	00000e03 	andeq	r0, r0, r3, lsl #28
 4bc:	0b002403 	bleq	94d0 <__rodata_start+0x4d0>
 4c0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 4c4:	04000008 	streq	r0, [r0], #-8
 4c8:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 4cc:	0b3b0b3a 	bleq	ec31bc <__user_program+0xbc31bc>
 4d0:	00001349 	andeq	r1, r0, r9, asr #6
 4d4:	3f002e05 	svccc	0x00002e05
 4d8:	3a0e0319 	bcc	381144 <__user_program+0x81144>
 4dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4e0:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 4e4:	97184006 	ldrls	r4, [r8, -r6]
 4e8:	00001942 	andeq	r1, r0, r2, asr #18
 4ec:	3f012e06 	svccc	0x00012e06
 4f0:	3a0e0319 	bcc	38115c <__user_program+0x8115c>
 4f4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4f8:	11134919 	tstne	r3, r9, lsl r9
 4fc:	40061201 	andmi	r1, r6, r1, lsl #4
 500:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 504:	05070000 	streq	r0, [r7, #-0]
 508:	3a0e0300 	bcc	381110 <__user_program+0x81110>
 50c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 510:	00170213 	andseq	r0, r7, r3, lsl r2
 514:	11010000 	mrsne	r0, (UNDEF: 1)
 518:	130e2501 	movwne	r2, #58625	; 0xe501
 51c:	1b0e030b 	blne	381150 <__user_program+0x81150>
 520:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 524:	00171006 	andseq	r1, r7, r6
 528:	00240200 	eoreq	r0, r4, r0, lsl #4
 52c:	0b3e0b0b 	bleq	f83160 <__user_program+0xc83160>
 530:	00000e03 	andeq	r0, r0, r3, lsl #28
 534:	0b002403 	bleq	9548 <__rodata_start+0x548>
 538:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 53c:	04000008 	streq	r0, [r0], #-8
 540:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 544:	0b3b0b3a 	bleq	ec3234 <__user_program+0xbc3234>
 548:	00001349 	andeq	r1, r0, r9, asr #6
 54c:	3f012e05 	svccc	0x00012e05
 550:	3a0e0319 	bcc	3811bc <__user_program+0x811bc>
 554:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 558:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 55c:	97184006 	ldrls	r4, [r8, -r6]
 560:	13011942 	movwne	r1, #6466	; 0x1942
 564:	05060000 	streq	r0, [r6, #-0]
 568:	3a0e0300 	bcc	381170 <__user_program+0x81170>
 56c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 570:	00170213 	andseq	r0, r7, r3, lsl r2
 574:	00050700 	andeq	r0, r5, r0, lsl #14
 578:	0b3a0803 	bleq	e8258c <__user_program+0xb8258c>
 57c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 580:	00001702 	andeq	r1, r0, r2, lsl #14
 584:	03003408 	movweq	r3, #1032	; 0x408
 588:	3b0b3a08 	blcc	2cedb0 <__end+0x1a1db0>
 58c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 590:	09000017 	stmdbeq	r0, {r0, r1, r2, r4}
 594:	01018289 	smlabbeq	r1, r9, r2, r8
 598:	13310111 	teqne	r1, #1073741828	; 0x40000004
 59c:	00001301 	andeq	r1, r0, r1, lsl #6
 5a0:	01828a0a 	orreq	r8, r2, sl, lsl #20
 5a4:	91180200 	tstls	r8, r0, lsl #4
 5a8:	00001842 	andeq	r1, r0, r2, asr #16
 5ac:	0182890b 	orreq	r8, r2, fp, lsl #18
 5b0:	31011101 	tstcc	r1, r1, lsl #2
 5b4:	0c000013 	stceq	0, cr0, [r0], {19}
 5b8:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 5bc:	0b3b0b3a 	bleq	ec32ac <__user_program+0xbc32ac>
 5c0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 5c4:	050d0000 	streq	r0, [sp, #-0]
 5c8:	3a080300 	bcc	2011d0 <__end+0xd41d0>
 5cc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 5d0:	00180213 	andseq	r0, r8, r3, lsl r2
 5d4:	002e0e00 	eoreq	r0, lr, r0, lsl #28
 5d8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 5dc:	0b3b0b3a 	bleq	ec32cc <__user_program+0xbc32cc>
 5e0:	01111927 	tsteq	r1, r7, lsr #18
 5e4:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 5e8:	00194297 	mulseq	r9, r7, r2
 5ec:	012e0f00 	teqeq	lr, r0, lsl #30
 5f0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 5f4:	0b3b0b3a 	bleq	ec32e4 <__user_program+0xbc32e4>
 5f8:	13491927 	movtne	r1, #39207	; 0x9927
 5fc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 600:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 604:	00130119 	andseq	r0, r3, r9, lsl r1
 608:	012e1000 	teqeq	lr, r0
 60c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 610:	0b3b0b3a 	bleq	ec3300 <__user_program+0xbc3300>
 614:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 618:	05110000 	ldreq	r0, [r1, #-0]
 61c:	00134900 	andseq	r4, r3, r0, lsl #18
 620:	11010000 	mrsne	r0, (UNDEF: 1)
 624:	130e2501 	movwne	r2, #58625	; 0xe501
 628:	1b0e030b 	blne	38125c <__user_program+0x8125c>
 62c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 630:	00171006 	andseq	r1, r7, r6
 634:	00240200 	eoreq	r0, r4, r0, lsl #4
 638:	0b3e0b0b 	bleq	f8326c <__user_program+0xc8326c>
 63c:	00000e03 	andeq	r0, r0, r3, lsl #28
 640:	0b002403 	bleq	9654 <__rodata_start+0x654>
 644:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 648:	04000008 	streq	r0, [r0], #-8
 64c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 650:	0b3b0b3a 	bleq	ec3340 <__user_program+0xbc3340>
 654:	00001349 	andeq	r1, r0, r9, asr #6
 658:	3f012e05 	svccc	0x00012e05
 65c:	3a0e0319 	bcc	3812c8 <__user_program+0x812c8>
 660:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 664:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 668:	97184006 	ldrls	r4, [r8, -r6]
 66c:	13011942 	movwne	r1, #6466	; 0x1942
 670:	05060000 	streq	r0, [r6, #-0]
 674:	3a0e0300 	bcc	38127c <__user_program+0x8127c>
 678:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 67c:	00170213 	andseq	r0, r7, r3, lsl r2
 680:	012e0700 	teqeq	lr, r0, lsl #14
 684:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 688:	0b3b0b3a 	bleq	ec3378 <__user_program+0xbc3378>
 68c:	13491927 	movtne	r1, #39207	; 0x9927
 690:	06120111 			; <UNDEFINED> instruction: 0x06120111
 694:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 698:	00130119 	andseq	r0, r3, r9, lsl r1
 69c:	00050800 	andeq	r0, r5, r0, lsl #16
 6a0:	0b3a0803 	bleq	e826b4 <__user_program+0xb826b4>
 6a4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6a8:	00001702 	andeq	r1, r0, r2, lsl #14
 6ac:	03003409 	movweq	r3, #1033	; 0x409
 6b0:	3b0b3a0e 	blcc	2ceef0 <__end+0x1a1ef0>
 6b4:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 6b8:	0a000017 	beq	71c <__start-0x78e4>
 6bc:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 6c0:	0b3a0e03 	bleq	e83ed4 <__user_program+0xb83ed4>
 6c4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6c8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 6cc:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 6d0:	00130119 	andseq	r0, r3, r9, lsl r1
 6d4:	00340b00 	eorseq	r0, r4, r0, lsl #22
 6d8:	0b3a0803 	bleq	e826ec <__user_program+0xb826ec>
 6dc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6e0:	00001702 	andeq	r1, r0, r2, lsl #14
 6e4:	0182890c 	orreq	r8, r2, ip, lsl #18
 6e8:	31011101 	tstcc	r1, r1, lsl #2
 6ec:	00130113 	andseq	r0, r3, r3, lsl r1
 6f0:	828a0d00 	addhi	r0, sl, #0, 26
 6f4:	18020001 	stmdane	r2, {r0}
 6f8:	00184291 	mulseq	r8, r1, r2
 6fc:	82890e00 	addhi	r0, r9, #0, 28
 700:	01110001 	tsteq	r1, r1
 704:	00001331 	andeq	r1, r0, r1, lsr r3
 708:	0182890f 	orreq	r8, r2, pc, lsl #18
 70c:	31011101 	tstcc	r1, r1, lsl #2
 710:	10000013 	andne	r0, r0, r3, lsl r0
 714:	08030034 	stmdaeq	r3, {r2, r4, r5}
 718:	0b3b0b3a 	bleq	ec3408 <__user_program+0xbc3408>
 71c:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 720:	34110000 	ldrcc	r0, [r1], #-0
 724:	3a080300 	bcc	20132c <__end+0xd432c>
 728:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 72c:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 730:	12000018 	andne	r0, r0, #24
 734:	13490101 	movtne	r0, #37121	; 0x9101
 738:	00001301 	andeq	r1, r0, r1, lsl #6
 73c:	49002113 	stmdbmi	r0, {r0, r1, r4, r8, sp}
 740:	00052f13 	andeq	r2, r5, r3, lsl pc
 744:	00341400 	eorseq	r1, r4, r0, lsl #8
 748:	0b3a0e03 	bleq	e83f5c <__user_program+0xb83f5c>
 74c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 750:	1802193f 	stmdane	r2, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 754:	2e150000 	cdpcs	0, 1, cr0, cr5, cr0, {0}
 758:	03193f01 	tsteq	r9, #1, 30
 75c:	3b0b3a0e 	blcc	2cef9c <__end+0x1a1f9c>
 760:	3c19270b 	ldccc	7, cr2, [r9], {11}
 764:	00130119 	andseq	r0, r3, r9, lsl r1
 768:	00051600 	andeq	r1, r5, r0, lsl #12
 76c:	00001349 	andeq	r1, r0, r9, asr #6
 770:	3f012e17 	svccc	0x00012e17
 774:	3a0e0319 	bcc	3813e0 <__user_program+0x813e0>
 778:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 77c:	3c134919 	ldccc	9, cr4, [r3], {25}
 780:	00130119 	andseq	r0, r3, r9, lsl r1
 784:	002e1800 	eoreq	r1, lr, r0, lsl #16
 788:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 78c:	0b3b0b3a 	bleq	ec347c <__user_program+0xbc347c>
 790:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 794:	2e190000 	cdpcs	0, 1, cr0, cr9, cr0, {0}
 798:	03193f01 	tsteq	r9, #1, 30
 79c:	3b0b3a0e 	blcc	2cefdc <__end+0x1a1fdc>
 7a0:	3c19270b 	ldccc	7, cr2, [r9], {11}
 7a4:	00000019 	andeq	r0, r0, r9, lsl r0
 7a8:	10001101 	andne	r1, r0, r1, lsl #2
 7ac:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 7b0:	1b080301 	blne	2013bc <__end+0xd43bc>
 7b4:	13082508 	movwne	r2, #34056	; 0x8508
 7b8:	00000005 	andeq	r0, r0, r5
 7bc:	10001101 	andne	r1, r0, r1, lsl #2
 7c0:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 7c4:	1b080301 	blne	2013d0 <__end+0xd43d0>
 7c8:	13082508 	movwne	r2, #34056	; 0x8508
 7cc:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000038 	andeq	r0, r0, r8, lsr r0
   8:	38500001 	ldmdacc	r0, {r0}^
   c:	54000000 	strpl	r0, [r0], #-0
  10:	04000000 	streq	r0, [r0], #-0
  14:	5001f300 	andpl	pc, r1, r0, lsl #6
  18:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  1c:	00000000 	andeq	r0, r0, r0
  20:	00000c00 	andeq	r0, r0, r0, lsl #24
  24:	00003800 	andeq	r3, r0, r0, lsl #16
  28:	70000e00 	andvc	r0, r0, r0, lsl #28
  2c:	3a25f700 	bcc	97dc34 <__user_program+0x67dc34>
  30:	f71b25f7 			; <UNDEFINED> instruction: 0xf71b25f7
  34:	1aff0800 	bne	fffc203c <__user_program+0xffcc203c>
  38:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
  3c:	00005400 	andeq	r5, r0, r0, lsl #8
  40:	f3000f00 	vpmax.f32	d0, d0, d0
  44:	25f75001 	ldrbcs	r5, [r7, #1]!
  48:	1b25f73a 	blne	97dd38 <__user_program+0x67dd38>
  4c:	ff0800f7 			; <UNDEFINED> instruction: 0xff0800f7
  50:	00009f1a 	andeq	r9, r0, sl, lsl pc
  54:	00000000 	andeq	r0, r0, r0
  58:	00300000 	eorseq	r0, r0, r0
  5c:	004c0000 	subeq	r0, ip, r0
  60:	00010000 	andeq	r0, r1, r0
  64:	00004c52 	andeq	r4, r0, r2, asr ip
  68:	00005400 	andeq	r5, r0, r0, lsl #8
  6c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
  78:	00000040 	andeq	r0, r0, r0, asr #32
  7c:	0000004c 	andeq	r0, r0, ip, asr #32
  80:	00500001 	subseq	r0, r0, r1
  84:	00000000 	andeq	r0, r0, r0
  88:	54000000 	strpl	r0, [r0], #-0
  8c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
  90:	01000000 	mrseq	r0, (UNDEF: 0)
  94:	00685000 	rsbeq	r5, r8, r0
  98:	00800000 	addeq	r0, r0, r0
  9c:	00040000 	andeq	r0, r4, r0
  a0:	9f5001f3 	svcls	0x005001f3
  a4:	00000080 	andeq	r0, r0, r0, lsl #1
  a8:	00000088 	andeq	r0, r0, r8, lsl #1
  ac:	88500001 	ldmdahi	r0, {r0}^
  b0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
  b4:	04000000 	streq	r0, [r0], #-0
  b8:	5001f300 	andpl	pc, r1, r0, lsl #6
  bc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  c0:	00000000 	andeq	r0, r0, r0
  c4:	00009800 	andeq	r9, r0, r0, lsl #16
  c8:	0000ac00 	andeq	sl, r0, r0, lsl #24
  cc:	50000100 	andpl	r0, r0, r0, lsl #2
  d0:	000000ac 	andeq	r0, r0, ip, lsr #1
  d4:	000000c4 	andeq	r0, r0, r4, asr #1
  d8:	01f30004 	mvnseq	r0, r4
  dc:	00c49f50 	sbceq	r9, r4, r0, asr pc
  e0:	00cc0000 	sbceq	r0, ip, r0
  e4:	00010000 	andeq	r0, r1, r0
  e8:	0000cc50 	andeq	ip, r0, r0, asr ip
  ec:	0000dc00 	andeq	sp, r0, r0, lsl #24
  f0:	f3000400 	vshl.u8	d0, d0, d0
  f4:	009f5001 	addseq	r5, pc, r1
  f8:	00000000 	andeq	r0, r0, r0
  fc:	dc000000 	stcle	0, cr0, [r0], {-0}
 100:	00000000 	andeq	r0, r0, r0
 104:	01000001 	tsteq	r0, r1
 108:	01005000 	mrseq	r5, (UNDEF: 0)
 10c:	01600000 	cmneq	r0, r0
 110:	00040000 	andeq	r0, r4, r0
 114:	9f5001f3 	svcls	0x005001f3
	...
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	00000103 	andeq	r0, r0, r3, lsl #2
 128:	03510001 	cmpeq	r1, #1
 12c:	60000001 	andvs	r0, r0, r1
 130:	04000001 	streq	r0, [r0], #-1
 134:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 138:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 13c:	00000000 	andeq	r0, r0, r0
 140:	00000400 	andeq	r0, r0, r0, lsl #8
 144:	00002000 	andeq	r2, r0, r0
 148:	30000200 	andcc	r0, r0, r0, lsl #4
 14c:	0000209f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 150:	0000b400 	andeq	fp, r0, r0, lsl #8
 154:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
 160:	00000004 	andeq	r0, r0, r4
 164:	00000020 	andeq	r0, r0, r0, lsr #32
 168:	9f300002 	svcls	0x00300002
 16c:	00000020 	andeq	r0, r0, r0, lsr #32
 170:	00000024 	andeq	r0, r0, r4, lsr #32
 174:	24540001 	ldrbcs	r0, [r4], #-1
 178:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
 17c:	03000000 	movweq	r0, #0
 180:	9f017700 	svcls	0x00017700
 184:	00000028 	andeq	r0, r0, r8, lsr #32
 188:	00000030 	andeq	r0, r0, r0, lsr r0
 18c:	34540001 	ldrbcc	r0, [r4], #-1
 190:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 194:	01000000 	mrseq	r0, (UNDEF: 0)
 198:	00485400 	subeq	r5, r8, r0, lsl #8
 19c:	00a40000 	adceq	r0, r4, r0
 1a0:	00010000 	andeq	r0, r1, r0
 1a4:	0000a457 	andeq	sl, r0, r7, asr r4
 1a8:	0000b400 	andeq	fp, r0, r0, lsl #8
 1ac:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 1bc:	00000048 	andeq	r0, r0, r8, asr #32
 1c0:	48500001 	ldmdami	r0, {r0}^
 1c4:	e0000000 	and	r0, r0, r0
 1c8:	04000000 	streq	r0, [r0], #-0
 1cc:	5001f300 	andpl	pc, r1, r0, lsl #6
 1d0:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
 1dc:	00004800 	andeq	r4, r0, r0, lsl #16
 1e0:	52000600 	andpl	r0, r0, #0, 12
 1e4:	93530493 	cmpls	r3, #-1828716544	; 0x93000000
 1e8:	00004804 	andeq	r4, r0, r4, lsl #16
 1ec:	00007c00 	andeq	r7, r0, r0, lsl #24
 1f0:	56000600 	strpl	r0, [r0], -r0, lsl #12
 1f4:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
 1f8:	00008004 	andeq	r8, r0, r4
 1fc:	0000e000 	andeq	lr, r0, r0
 200:	56000600 	strpl	r0, [r0], -r0, lsl #12
 204:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
 208:	00000004 	andeq	r0, r0, r4
 20c:	00000000 	andeq	r0, r0, r0
 210:	00001000 	andeq	r1, r0, r0
 214:	00004800 	andeq	r4, r0, r0, lsl #16
 218:	30000200 	andcc	r0, r0, r0, lsl #4
 21c:	0000909f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 220:	00009c00 	andeq	r9, r0, r0, lsl #24
 224:	58000100 	stmdapl	r0, {r8}
 228:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 22c:	000000b8 	strheq	r0, [r0], -r8
 230:	b8580001 	ldmdalt	r8, {r0}^
 234:	c4000000 	strgt	r0, [r0], #-0
 238:	03000000 	movweq	r0, #0
 23c:	9f7f7800 	svcls	0x007f7800
	...
 248:	00000010 	andeq	r0, r0, r0, lsl r0
 24c:	00000038 	andeq	r0, r0, r8, lsr r0
 250:	57910003 	ldrpl	r0, [r1, r3]
 254:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 258:	00006400 	andeq	r6, r0, r0, lsl #8
 25c:	54000100 	strpl	r0, [r0], #-256	; 0x100
 260:	00000064 	andeq	r0, r0, r4, rrx
 264:	0000009c 	muleq	r0, ip, r0
 268:	01740003 	cmneq	r4, r3
 26c:	00009c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 270:	0000b000 	andeq	fp, r0, r0
 274:	54000100 	strpl	r0, [r0], #-256	; 0x100
 278:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 27c:	000000c4 	andeq	r0, r0, r4, asr #1
 280:	01740003 	cmneq	r4, r3
 284:	0000c49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
 288:	0000c800 	andeq	ip, r0, r0, lsl #16
 28c:	54000100 	strpl	r0, [r0], #-256	; 0x100
 290:	000000c8 	andeq	r0, r0, r8, asr #1
 294:	000000cc 	andeq	r0, r0, ip, asr #1
 298:	7f740003 	svcvc	0x00740003
 29c:	0000cc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 2a0:	0000e000 	andeq	lr, r0, r0
 2a4:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 2b0:	000000e0 	andeq	r0, r0, r0, ror #1
 2b4:	00000108 	andeq	r0, r0, r8, lsl #2
 2b8:	70910002 	addsvc	r0, r1, r2
 2bc:	00000108 	andeq	r0, r0, r8, lsl #2
 2c0:	0000011c 	andeq	r0, r0, ip, lsl r1
 2c4:	1c540001 	mrrcne	0, 0, r0, r4, cr1
 2c8:	7c000001 	stcvc	0, cr0, [r0], {1}
 2cc:	03000002 	movweq	r0, #2
 2d0:	9f017400 	svcls	0x00017400
 2d4:	0000027c 	andeq	r0, r0, ip, ror r2
 2d8:	00000288 	andeq	r0, r0, r8, lsl #5
 2dc:	00540001 	subseq	r0, r4, r1
 2e0:	00000000 	andeq	r0, r0, r0
 2e4:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
 2e8:	f4000001 	vst4.8	{d0-d3}, [r0], r1
 2ec:	02000001 	andeq	r0, r0, #1
 2f0:	f4007300 	vst2.8	{d7-d10}, [r0], r0
 2f4:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
 2f8:	01000001 	tsteq	r0, r1
 2fc:	00005200 	andeq	r5, r0, r0, lsl #4
 300:	00000000 	andeq	r0, r0, r0
 304:	02080000 	andeq	r0, r8, #0
 308:	02140000 	andseq	r0, r4, #0
 30c:	00020000 	andeq	r0, r2, r0
 310:	02140073 	andseq	r0, r4, #115	; 0x73
 314:	02170000 	andseq	r0, r7, #0
 318:	00010000 	andeq	r0, r1, r0
 31c:	00000052 	andeq	r0, r0, r2, asr r0
 320:	00000000 	andeq	r0, r0, r0
 324:	00018400 	andeq	r8, r1, r0, lsl #8
 328:	0001bc00 	andeq	fp, r1, r0, lsl #24
 32c:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
 338:	000001c8 	andeq	r0, r0, r8, asr #3
 33c:	000001d4 	ldrdeq	r0, [r0], -r4
 340:	00730002 	rsbseq	r0, r3, r2
 344:	000001d4 	ldrdeq	r0, [r0], -r4
 348:	000001d7 	ldrdeq	r0, [r0], -r7
 34c:	00520001 	subseq	r0, r2, r1
 350:	00000000 	andeq	r0, r0, r0
 354:	2c000000 	stccs	0, cr0, [r0], {-0}
 358:	40000002 	andmi	r0, r0, r2
 35c:	01000002 	tsteq	r0, r2
 360:	02405500 	subeq	r5, r0, #0, 10
 364:	024c0000 	subeq	r0, ip, #0
 368:	00030000 	andeq	r0, r3, r0
 36c:	009f7f75 	addseq	r7, pc, r5, ror pc	; <UNPREDICTABLE>
 370:	00000000 	andeq	r0, r0, r0
 374:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 378:	5f000002 	svcpl	0x00000002
 37c:	02000002 	andeq	r0, r0, #2
 380:	00007300 	andeq	r7, r0, r0, lsl #6
 384:	00000000 	andeq	r0, r0, r0
 388:	04000000 	streq	r0, [r0], #-0
 38c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 390:	01000000 	mrseq	r0, (UNDEF: 0)
 394:	00085000 	andeq	r5, r8, r0
 398:	000c0000 	andeq	r0, ip, r0
 39c:	00040000 	andeq	r0, r4, r0
 3a0:	9f5001f3 	svcls	0x005001f3
	...
 3ac:	0000000c 	andeq	r0, r0, ip
 3b0:	00000010 	andeq	r0, r0, r0, lsl r0
 3b4:	10500001 	subsne	r0, r0, r1
 3b8:	14000000 	strne	r0, [r0], #-0
 3bc:	04000000 	streq	r0, [r0], #-0
 3c0:	5001f300 	andpl	pc, r1, r0, lsl #6
 3c4:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 3c8:	00000000 	andeq	r0, r0, r0
 3cc:	00000400 	andeq	r0, r0, r0, lsl #8
 3d0:	00000800 	andeq	r0, r0, r0, lsl #16
 3d4:	50000100 	andpl	r0, r0, r0, lsl #2
 3d8:	00000008 	andeq	r0, r0, r8
 3dc:	0000000c 	andeq	r0, r0, ip
 3e0:	01f30004 	mvnseq	r0, r4
 3e4:	00009f50 	andeq	r9, r0, r0, asr pc
	...
 3f0:	00040000 	andeq	r0, r4, r0
 3f4:	00010000 	andeq	r0, r1, r0
 3f8:	00000450 	andeq	r0, r0, r0, asr r4
 3fc:	00002000 	andeq	r2, r0, r0
 400:	53000100 	movwpl	r0, #256	; 0x100
	...
 40c:	00000020 	andeq	r0, r0, r0, lsr #32
 410:	0000002c 	andeq	r0, r0, ip, lsr #32
 414:	2c500001 	mrrccs	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
 418:	94000000 	strls	r0, [r0], #-0
 41c:	04000000 	streq	r0, [r0], #-0
 420:	5001f300 	andpl	pc, r1, r0, lsl #6
 424:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 428:	00000000 	andeq	r0, r0, r0
 42c:	00002000 	andeq	r2, r0, r0
 430:	00003000 	andeq	r3, r0, r0
 434:	51000100 	mrspl	r0, (UNDEF: 16)
 438:	00000030 	andeq	r0, r0, r0, lsr r0
 43c:	00000094 	muleq	r0, r4, r0
 440:	00540001 	subseq	r0, r4, r1
 444:	00000000 	andeq	r0, r0, r0
 448:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
 44c:	7c000000 	stcvc	0, cr0, [r0], {-0}
 450:	06000000 	streq	r0, [r0], -r0
 454:	09007200 	stmdbeq	r0, {r9, ip, sp, lr}
 458:	7c9f1af3 	vldmiavc	pc, {s2-s244}
 45c:	8f000000 	svchi	0x00000000
 460:	01000000 	mrseq	r0, (UNDEF: 0)
 464:	00005200 	andeq	r5, r0, r0, lsl #4
 468:	00000000 	andeq	r0, r0, r0
 46c:	00b40000 	adcseq	r0, r4, r0
 470:	00b80000 	adcseq	r0, r8, r0
 474:	00060000 	andeq	r0, r6, r0
 478:	f3090072 	vqadd.u8	q0, <illegal reg q4.5>, q9
 47c:	00b89f1a 	adcseq	r9, r8, sl, lsl pc
 480:	00c80000 	sbceq	r0, r8, r0
 484:	00010000 	andeq	r0, r1, r0
 488:	00000052 	andeq	r0, r0, r2, asr r0
 48c:	00000000 	andeq	r0, r0, r0
 490:	0000e000 	andeq	lr, r0, r0
 494:	00011400 	andeq	r1, r1, r0, lsl #8
 498:	50000100 	andpl	r0, r0, r0, lsl #2
 49c:	00000114 	andeq	r0, r0, r4, lsl r1
 4a0:	00000180 	andeq	r0, r0, r0, lsl #3
 4a4:	01f30004 	mvnseq	r0, r4
 4a8:	00009f50 	andeq	r9, r0, r0, asr pc
 4ac:	00000000 	andeq	r0, r0, r0
 4b0:	00e80000 	rsceq	r0, r8, r0
 4b4:	00f40000 	rscseq	r0, r4, r0
 4b8:	00020000 	andeq	r0, r2, r0
 4bc:	00f49f30 	rscseq	r9, r4, r0, lsr pc
 4c0:	00f80000 	rscseq	r0, r8, r0
 4c4:	00060000 	andeq	r0, r6, r0
 4c8:	30080072 	andcc	r0, r8, r2, ror r0
 4cc:	00f89f21 	rscseq	r9, r8, r1, lsr #30
 4d0:	01140000 	tsteq	r4, r0
 4d4:	00010000 	andeq	r0, r1, r0
 4d8:	00017052 	andeq	r7, r1, r2, asr r0
 4dc:	00018000 	andeq	r8, r1, r0
 4e0:	52000100 	andpl	r0, r0, #0, 2
	...
 4ec:	000000e8 	andeq	r0, r0, r8, ror #1
 4f0:	0000016c 	andeq	r0, r0, ip, ror #2
 4f4:	9f300002 	svcls	0x00300002
 4f8:	0000016c 	andeq	r0, r0, ip, ror #2
 4fc:	0000017c 	andeq	r0, r0, ip, ror r1
 500:	00500001 	subseq	r0, r0, r1
	...
 50c:	04000000 	streq	r0, [r0], #-0
 510:	01000000 	mrseq	r0, (UNDEF: 0)
 514:	00045000 	andeq	r5, r4, r0
 518:	00200000 	eoreq	r0, r0, r0
 51c:	00010000 	andeq	r0, r1, r0
 520:	00000053 	andeq	r0, r0, r3, asr r0
 524:	00000000 	andeq	r0, r0, r0
 528:	00002000 	andeq	r2, r0, r0
 52c:	00003000 	andeq	r3, r0, r0
 530:	50000100 	andpl	r0, r0, r0, lsl #2
 534:	00000030 	andeq	r0, r0, r0, lsr r0
 538:	0000004c 	andeq	r0, r0, ip, asr #32
 53c:	4c500001 	mrrcmi	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
 540:	5c000000 	stcpl	0, cr0, [r0], {-0}
 544:	06000000 	streq	r0, [r0], -r0
 548:	01f34f00 	mvnseq	r4, r0, lsl #30
 54c:	5c9f1c50 	ldcpl	12, cr1, [pc], {80}	; 0x50
 550:	60000000 	andvs	r0, r0, r0
 554:	01000000 	mrseq	r0, (UNDEF: 0)
 558:	00605000 	rsbeq	r5, r0, r0
 55c:	00640000 	rsbeq	r0, r4, r0
 560:	00040000 	andeq	r0, r4, r0
 564:	9f5001f3 	svcls	0x005001f3
	...
 570:	00000020 	andeq	r0, r0, r0, lsr #32
 574:	0000002c 	andeq	r0, r0, ip, lsr #32
 578:	2c510001 	mrrccs	0, 0, r0, r1, cr1
 57c:	34000000 	strcc	r0, [r0], #-0
 580:	06000000 	streq	r0, [r0], -r0
 584:	717f0800 	cmnvc	pc, r0, lsl #16
 588:	349f1c00 	ldrcc	r1, [pc], #3072	; 590 <__start-0x7a70>
 58c:	3c000000 	stccc	0, cr0, [r0], {-0}
 590:	01000000 	mrseq	r0, (UNDEF: 0)
 594:	003c5100 	eorseq	r5, ip, r0, lsl #2
 598:	005c0000 	subseq	r0, ip, r0
 59c:	00070000 	andeq	r0, r7, r0
 5a0:	01f37f08 	mvnseq	r7, r8, lsl #30
 5a4:	5c9f1c51 	ldcpl	12, cr1, [pc], {81}	; 0x51
 5a8:	64000000 	strvs	r0, [r0], #-0
 5ac:	01000000 	mrseq	r0, (UNDEF: 0)
 5b0:	00005100 	andeq	r5, r0, r0, lsl #2
 5b4:	00000000 	andeq	r0, r0, r0
 5b8:	003c0000 	eorseq	r0, ip, r0
 5bc:	00480000 	subeq	r0, r8, r0
 5c0:	00050000 	andeq	r0, r5, r0
 5c4:	1a370070 	bne	dc078c <__user_program+0xac078c>
 5c8:	0000489f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 5cc:	00005400 	andeq	r5, r0, r0, lsl #8
 5d0:	53000100 	movwpl	r0, #256	; 0x100
 5d4:	00000054 	andeq	r0, r0, r4, asr r0
 5d8:	0000005c 	andeq	r0, r0, ip, asr r0
 5dc:	f34f0008 	vhadd.u8	d16, d15, d8
 5e0:	371c5001 	ldrcc	r5, [ip, -r1]
 5e4:	00009f1a 	andeq	r9, r0, sl, lsl pc
 5e8:	00000000 	andeq	r0, r0, r0
 5ec:	003c0000 	eorseq	r0, ip, r0
 5f0:	005c0000 	subseq	r0, ip, r0
 5f4:	00010000 	andeq	r0, r1, r0
 5f8:	00000051 	andeq	r0, r0, r1, asr r0
 5fc:	00000000 	andeq	r0, r0, r0
 600:	00006400 	andeq	r6, r0, r0, lsl #8
 604:	00007400 	andeq	r7, r0, r0, lsl #8
 608:	50000100 	andpl	r0, r0, r0, lsl #2
 60c:	00000074 	andeq	r0, r0, r4, ror r0
 610:	00000090 	muleq	r0, r0, r0
 614:	90500001 	subsls	r0, r0, r1
 618:	a0000000 	andge	r0, r0, r0
 61c:	06000000 	streq	r0, [r0], -r0
 620:	01f34f00 	mvnseq	r4, r0, lsl #30
 624:	a09f1c50 	addsge	r1, pc, r0, asr ip	; <UNPREDICTABLE>
 628:	a4000000 	strge	r0, [r0], #-0
 62c:	01000000 	mrseq	r0, (UNDEF: 0)
 630:	00a45000 	adceq	r5, r4, r0
 634:	00a80000 	adceq	r0, r8, r0
 638:	00040000 	andeq	r0, r4, r0
 63c:	9f5001f3 	svcls	0x005001f3
	...
 648:	00000064 	andeq	r0, r0, r4, rrx
 64c:	00000070 	andeq	r0, r0, r0, ror r0
 650:	70510001 	subsvc	r0, r1, r1
 654:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
 658:	06000000 	streq	r0, [r0], -r0
 65c:	717f0800 	cmnvc	pc, r0, lsl #16
 660:	789f1c00 	ldmvc	pc, {sl, fp, ip}	; <UNPREDICTABLE>
 664:	80000000 	andhi	r0, r0, r0
 668:	01000000 	mrseq	r0, (UNDEF: 0)
 66c:	00805100 	addeq	r5, r0, r0, lsl #2
 670:	00a00000 	adceq	r0, r0, r0
 674:	00070000 	andeq	r0, r7, r0
 678:	01f37f08 	mvnseq	r7, r8, lsl #30
 67c:	a09f1c51 	addsge	r1, pc, r1, asr ip	; <UNPREDICTABLE>
 680:	a8000000 	stmdage	r0, {}	; <UNPREDICTABLE>
 684:	01000000 	mrseq	r0, (UNDEF: 0)
 688:	00005100 	andeq	r5, r0, r0, lsl #2
 68c:	00000000 	andeq	r0, r0, r0
 690:	00800000 	addeq	r0, r0, r0
 694:	008c0000 	addeq	r0, ip, r0
 698:	00050000 	andeq	r0, r5, r0
 69c:	1a370070 	bne	dc0864 <__user_program+0xac0864>
 6a0:	00008c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 6a4:	00009800 	andeq	r9, r0, r0, lsl #16
 6a8:	53000100 	movwpl	r0, #256	; 0x100
 6ac:	00000098 	muleq	r0, r8, r0
 6b0:	000000a0 	andeq	r0, r0, r0, lsr #1
 6b4:	f34f0008 	vhadd.u8	d16, d15, d8
 6b8:	371c5001 	ldrcc	r5, [ip, -r1]
 6bc:	00009f1a 	andeq	r9, r0, sl, lsl pc
 6c0:	00000000 	andeq	r0, r0, r0
 6c4:	00800000 	addeq	r0, r0, r0
 6c8:	00a00000 	adceq	r0, r0, r0
 6cc:	00010000 	andeq	r0, r1, r0
 6d0:	00000051 	andeq	r0, r0, r1, asr r0
 6d4:	00000000 	andeq	r0, r0, r0
 6d8:	0000a800 	andeq	sl, r0, r0, lsl #16
 6dc:	0000b400 	andeq	fp, r0, r0, lsl #8
 6e0:	30000200 	andcc	r0, r0, r0, lsl #4
 6e4:	0000b49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
 6e8:	0000cc00 	andeq	ip, r0, r0, lsl #24
 6ec:	73000900 	movwvc	r0, #2304	; 0x900
 6f0:	b0030300 	andlt	r0, r3, r0, lsl #6
 6f4:	9f1c0000 	svcls	0x001c0000
	...
 700:	000000cc 	andeq	r0, r0, ip, asr #1
 704:	000000d8 	ldrdeq	r0, [r0], -r8
 708:	d8500001 	ldmdale	r0, {r0}^
 70c:	00000000 	andeq	r0, r0, r0
 710:	04000001 	streq	r0, [r0], #-1
 714:	5001f300 	andpl	pc, r1, r0, lsl #6
 718:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 71c:	00000000 	andeq	r0, r0, r0
 720:	00010000 	andeq	r0, r1, r0
 724:	00010c00 	andeq	r0, r1, r0, lsl #24
 728:	50000100 	andpl	r0, r0, r0, lsl #2
 72c:	0000010c 	andeq	r0, r0, ip, lsl #2
 730:	00000134 	andeq	r0, r0, r4, lsr r1
 734:	01f30004 	mvnseq	r0, r4
 738:	00009f50 	andeq	r9, r0, r0, asr pc
 73c:	00000000 	andeq	r0, r0, r0
 740:	02d80000 	sbcseq	r0, r8, #0
 744:	02e00000 	rsceq	r0, r0, #0
 748:	00020000 	andeq	r0, r2, r0
 74c:	02e09f30 	rsceq	r9, r0, #48, 30	; 0xc0
 750:	02e40000 	rsceq	r0, r4, #0
 754:	00090000 	andeq	r0, r9, r0
 758:	03030074 	movweq	r0, #12404	; 0x3074
 75c:	1c0000b0 	stcne	0, cr0, [r0], {176}	; 0xb0
 760:	0002e49f 	muleq	r2, pc, r4	; <UNPREDICTABLE>
 764:	0002e800 	andeq	lr, r2, r0, lsl #16
 768:	74000900 	strvc	r0, [r0], #-2304	; 0x900
 76c:	b0040300 	andlt	r0, r4, r0, lsl #6
 770:	9f1c0000 	svcls	0x001c0000
 774:	000002e8 	andeq	r0, r0, r8, ror #5
 778:	00000300 	andeq	r0, r0, r0, lsl #6
 77c:	00740009 	rsbseq	r0, r4, r9
 780:	00b00303 	adcseq	r0, r0, r3, lsl #6
 784:	009f1c00 	addseq	r1, pc, r0, lsl #24
 788:	00000000 	andeq	r0, r0, r0
 78c:	1c000000 	stcne	0, cr0, [r0], {-0}
 790:	28000003 	stmdacs	r0, {r0, r1}
 794:	02000003 	andeq	r0, r0, #3
 798:	289f3000 	ldmcs	pc, {ip, sp}	; <UNPREDICTABLE>
 79c:	3c000003 	stccc	0, cr0, [r0], {3}
 7a0:	07000003 	streq	r0, [r0, -r3]
 7a4:	02000a00 	andeq	r0, r0, #0, 20
 7a8:	9f1c0074 	svcls	0x001c0074
 7ac:	0000033c 	andeq	r0, r0, ip, lsr r3
 7b0:	00000340 	andeq	r0, r0, r0, asr #6
 7b4:	010a0007 	tsteq	sl, r7
 7b8:	1c007402 	cfstrsne	mvf7, [r0], {2}
 7bc:	0003409f 	muleq	r3, pc, r0	; <UNPREDICTABLE>
 7c0:	00036000 	andeq	r6, r3, r0
 7c4:	0a000700 	beq	23cc <__start-0x5c34>
 7c8:	00740200 	rsbseq	r0, r4, r0, lsl #4
 7cc:	00009f1c 	andeq	r9, r0, ip, lsl pc
 7d0:	00000000 	andeq	r0, r0, r0
 7d4:	037c0000 	cmneq	ip, #0
 7d8:	03840000 	orreq	r0, r4, #0
 7dc:	00020000 	andeq	r0, r2, r0
 7e0:	03849f30 	orreq	r9, r4, #48, 30	; 0xc0
 7e4:	038c0000 	orreq	r0, ip, #0
 7e8:	00070000 	andeq	r0, r7, r0
 7ec:	7402000a 	strvc	r0, [r2], #-10
 7f0:	8c9f1c00 	ldchi	12, cr1, [pc], {0}
 7f4:	90000003 	andls	r0, r0, r3
 7f8:	07000003 	streq	r0, [r0, -r3]
 7fc:	02010a00 	andeq	r0, r1, #0, 20
 800:	9f1c0074 	svcls	0x001c0074
 804:	00000390 	muleq	r0, r0, r3
 808:	0000039c 	muleq	r0, ip, r3
 80c:	000a0007 	andeq	r0, sl, r7
 810:	1c007402 	cfstrsne	mvf7, [r0], {2}
 814:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 818:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000160 	andeq	r0, r0, r0, ror #2
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01b50002 			; <UNDEFINED> instruction: 0x01b50002
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  34:	000000b4 	strheq	r0, [r0], -r4
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	039d0002 	orrseq	r0, sp, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008268 	andeq	r8, r0, r8, ror #4
  54:	00000298 	muleq	r0, r8, r2
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	06910002 	ldreq	r0, [r1], r2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008500 	andeq	r8, r0, r0, lsl #10
  74:	00000014 	andeq	r0, r0, r4, lsl r0
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	07540002 	ldrbeq	r0, [r4, -r2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008514 	andeq	r8, r0, r4, lsl r5
  94:	00000014 	andeq	r0, r0, r4, lsl r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	08730002 	ldmdaeq	r3!, {r1}^
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008528 	andeq	r8, r0, r8, lsr #10
  b4:	0000000c 	andeq	r0, r0, ip
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	091d0002 	ldmdbeq	sp, {r1}
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008534 	andeq	r8, r0, r4, lsr r5
  d4:	00000180 	andeq	r0, r0, r0, lsl #3
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	0b370002 	bleq	dc00f4 <__user_program+0xac00f4>
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	000086b4 			; <UNDEFINED> instruction: 0x000086b4
  f4:	0000039c 	muleq	r0, ip, r3
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	13550002 	cmpne	r5, #2
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00008000 	andeq	r8, r0, r0
 114:	00000054 	andeq	r0, r0, r4, asr r0
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	13c30002 	bicne	r0, r3, #2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008a50 	andeq	r8, r0, r0, asr sl
 134:	00000044 	andeq	r0, r0, r4, asr #32
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000082 	andeq	r0, r0, r2, lsl #1
   4:	004f0002 	subeq	r0, pc, r2
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
  4c:	61000002 	tstvs	r0, r2
  50:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
  54:	00000200 	andeq	r0, r0, r0, lsl #4
  58:	02050000 	andeq	r0, r5, #0
  5c:	00008054 	andeq	r8, r0, r4, asr r0
  60:	0100d303 	tsteq	r0, r3, lsl #6
  64:	84a06a13 	strthi	r6, [r0], #2579	; 0xa13
  68:	4e2f4b83 	vmulmi.f64	d4, d31, d3
  6c:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  70:	4b4d13bf 	blmi	1344f74 <__user_program+0x1044f74>
  74:	6513bfd8 	ldrvs	fp, [r3, #-4056]	; 0xfd8
  78:	4b4b674f 	blmi	12d9dbc <__user_program+0xfd9dbc>
  7c:	9f684bbb 	svcls	0x00684bbb
  80:	0006024b 	andeq	r0, r6, fp, asr #4
  84:	00890101 	addeq	r0, r9, r1, lsl #2
  88:	00020000 	andeq	r0, r2, r0
  8c:	00000062 	andeq	r0, r0, r2, rrx
  90:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  94:	0101000d 	tsteq	r1, sp
  98:	00000101 	andeq	r0, r0, r1, lsl #2
  9c:	00000100 	andeq	r0, r0, r0, lsl #2
  a0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
  a4:	2f6c656e 	svccs	0x006c656e
  a8:	00637273 	rsbeq	r7, r3, r3, ror r2
  ac:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
  b0:	2f6b6269 	svccs	0x006b6269
  b4:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
  b8:	00656475 	rsbeq	r6, r5, r5, ror r4
  bc:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
  c0:	692f6c65 	stmdbvs	pc!, {r0, r2, r5, r6, sl, fp, sp, lr}	; <UNPREDICTABLE>
  c4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  c8:	00006564 	andeq	r6, r0, r4, ror #10
  cc:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
  d0:	632e6c65 	teqvs	lr, #25856	; 0x6500
  d4:	00000100 	andeq	r0, r0, r0, lsl #2
  d8:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
  dc:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
  e0:	00020068 	andeq	r0, r2, r8, rrx
  e4:	72637300 	rsbvc	r7, r3, #0, 6
  e8:	2e6e6565 	cdpcs	5, 6, cr6, cr14, cr5, {3}
  ec:	00030068 	andeq	r0, r3, r8, rrx
  f0:	05000000 	streq	r0, [r0, #-0]
  f4:	0081b402 	addeq	fp, r1, r2, lsl #8
  f8:	01100300 	tsteq	r0, r0, lsl #6
  fc:	512a3031 	teqpl	sl, r1, lsr r0
 100:	83684b65 	cmnhi	r8, #103424	; 0x19400
 104:	30688383 	rsbcc	r8, r8, r3, lsl #7
 108:	03676767 	cmneq	r7, #27000832	; 0x19c0000
 10c:	08026673 	stmdaeq	r2, {r0, r1, r4, r5, r6, r9, sl, sp, lr}
 110:	e0010100 	and	r0, r1, r0, lsl #2
 114:	02000000 	andeq	r0, r0, #0
 118:	00007b00 	andeq	r7, r0, r0, lsl #22
 11c:	fb010200 	blx	40926 <__bss_end+0x34926>
 120:	01000d0e 	tsteq	r0, lr, lsl #26
 124:	00010101 	andeq	r0, r1, r1, lsl #2
 128:	00010000 	andeq	r0, r1, r0
 12c:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 130:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 134:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 138:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 13c:	6b62696c 	blvs	189a6f4 <__user_program+0x159a6f4>
 140:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 144:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 148:	72656b00 	rsbvc	r6, r5, #0, 22
 14c:	2f6c656e 	svccs	0x006c656e
 150:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 154:	00656475 	rsbeq	r6, r5, r5, ror r4
 158:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 15c:	2e6b746e 	cdpcs	4, 6, cr7, cr11, cr14, {3}
 160:	00010063 	andeq	r0, r1, r3, rrx
 164:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 168:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 16c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 170:	736b0000 	cmnvc	fp, #0
 174:	72616474 	rsbvc	r6, r1, #116, 8	; 0x74000000
 178:	00682e67 	rsbeq	r2, r8, r7, ror #28
 17c:	3c000002 	stccc	0, cr0, [r0], {2}
 180:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 184:	6e692d74 	mcrvs	13, 3, r2, cr9, cr4, {3}
 188:	0000003e 	andeq	r0, r0, lr, lsr r0
 18c:	72617500 	rsbvc	r7, r1, #0, 10
 190:	00682e74 	rsbeq	r2, r8, r4, ror lr
 194:	00000003 	andeq	r0, r0, r3
 198:	68020500 	stmdavs	r2, {r8, sl}
 19c:	03000082 	movweq	r0, #130	; 0x82
 1a0:	4d880120 	stfmis	f0, [r8, #128]	; 0x80
 1a4:	0402009c 	streq	r0, [r2], #-156	; 0x9c
 1a8:	02004c01 	andeq	r4, r0, #256	; 0x100
 1ac:	00330104 	eorseq	r0, r3, r4, lsl #2
 1b0:	08010402 	stmdaeq	r1, {r1, sl}
 1b4:	04020059 	streq	r0, [r2], #-89	; 0x59
 1b8:	4b4dd701 	blmi	1375dc4 <__user_program+0x1075dc4>
 1bc:	872d9b6a 	strhi	r9, [sp, -sl, ror #22]!
 1c0:	854d6949 	strbhi	r6, [sp, #-2377]	; 0x949
 1c4:	514a2003 	cmppl	sl, r3
 1c8:	302e5c03 	eorcc	r5, lr, r3, lsl #24
 1cc:	02324b4b 	eorseq	r4, r2, #76800	; 0x12c00
 1d0:	4b83152c 	blmi	fe0c5688 <__user_program+0xfddc5688>
 1d4:	67a4a04b 	strvs	sl, [r4, fp, asr #32]!
 1d8:	83673283 	cmnhi	r7, #805306376	; 0x30000008
 1dc:	32836733 	addcc	r6, r3, #13369344	; 0xcc0000
 1e0:	8a2d6783 	bhi	b59ff4 <__user_program+0x859ff4>
 1e4:	4b324b67 	blmi	c92f88 <__user_program+0x992f88>
 1e8:	bf034d33 	svclt	0x00034d33
 1ec:	c6032e7f 			; <UNDEFINED> instruction: 0xc6032e7f
 1f0:	08026600 	stmdaeq	r2, {r9, sl, sp, lr}
 1f4:	5e010100 	adfpls	f0, f1, f0
 1f8:	02000000 	andeq	r0, r0, #0
 1fc:	00004500 	andeq	r4, r0, r0, lsl #10
 200:	fb010200 	blx	40a0a <__bss_end+0x34a0a>
 204:	01000d0e 	tsteq	r0, lr, lsl #26
 208:	00010101 	andeq	r0, r1, r1, lsl #2
 20c:	00010000 	andeq	r0, r1, r0
 210:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 214:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 218:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 21c:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 220:	6b62696c 	blvs	189a7d8 <__user_program+0x159a7d8>
 224:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 228:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 22c:	61750000 	cmnvs	r5, r0
 230:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 234:	00000100 	andeq	r0, r0, r0, lsl #2
 238:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 23c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 240:	00020068 	andeq	r0, r2, r8, rrx
 244:	05000000 	streq	r0, [r0, #-0]
 248:	00850002 	addeq	r0, r5, r2
 24c:	010c0300 	mrseq	r0, LR_mon
 250:	14323232 	ldrtne	r3, [r2], #-562	; 0x232
 254:	01000402 	tsteq	r0, r2, lsl #8
 258:	00005d01 	andeq	r5, r0, r1, lsl #26
 25c:	44000200 	strmi	r0, [r0], #-512	; 0x200
 260:	02000000 	andeq	r0, r0, #0
 264:	0d0efb01 	vstreq	d15, [lr, #-4]
 268:	01010100 	mrseq	r0, (UNDEF: 17)
 26c:	00000001 	andeq	r0, r0, r1
 270:	01000001 	tsteq	r0, r1
 274:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 278:	732f6c65 	teqvc	pc, #25856	; 0x6500
 27c:	33006372 	movwcc	r6, #882	; 0x372
 280:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 284:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 288:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 28c:	00006564 	andeq	r6, r0, r4, ror #10
 290:	2e633269 	cdpcs	2, 6, cr3, cr3, cr9, {3}
 294:	00010063 	andeq	r0, r1, r3, rrx
 298:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 29c:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 2a0:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 2a4:	00000000 	andeq	r0, r0, r0
 2a8:	85140205 	ldrhi	r0, [r4, #-517]	; 0x205
 2ac:	0c030000 	stceq	0, cr0, [r3], {-0}
 2b0:	4c143201 	lfmmi	f3, 4, [r4], {1}
 2b4:	00040214 	andeq	r0, r4, r4, lsl r2
 2b8:	005f0101 	subseq	r0, pc, r1, lsl #2
 2bc:	00020000 	andeq	r0, r2, r0
 2c0:	00000048 	andeq	r0, r0, r8, asr #32
 2c4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 2c8:	0101000d 	tsteq	r1, sp
 2cc:	00000101 	andeq	r0, r0, r1, lsl #2
 2d0:	00000100 	andeq	r0, r0, r0, lsl #2
 2d4:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 2d8:	2f6c656e 	svccs	0x006c656e
 2dc:	00637273 	rsbeq	r7, r3, r3, ror r2
 2e0:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 2e4:	2f6b6269 	svccs	0x006b6269
 2e8:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 2ec:	00656475 	rsbeq	r6, r5, r5, ror r4
 2f0:	73646100 	cmnvc	r4, #0, 2
 2f4:	35313031 	ldrcc	r3, [r1, #-49]!	; 0x31
 2f8:	0100632e 	tsteq	r0, lr, lsr #6
 2fc:	736b0000 	cmnvc	fp, #0
 300:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 304:	00682e74 	rsbeq	r2, r8, r4, ror lr
 308:	00000002 	andeq	r0, r0, r2
 30c:	28020500 	stmdacs	r2, {r8, sl}
 310:	03000085 	movweq	r0, #133	; 0x85
 314:	1432010c 	ldrtne	r0, [r2], #-268	; 0x10c
 318:	01000402 	tsteq	r0, r2, lsl #8
 31c:	00009301 	andeq	r9, r0, r1, lsl #6
 320:	4e000200 	cdpmi	2, 0, cr0, cr0, cr0, {0}
 324:	02000000 	andeq	r0, r0, #0
 328:	0d0efb01 	vstreq	d15, [lr, #-4]
 32c:	01010100 	mrseq	r0, (UNDEF: 17)
 330:	00000001 	andeq	r0, r0, r1
 334:	01000001 	tsteq	r0, r1
 338:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 33c:	732f6c65 	teqvc	pc, #25856	; 0x6500
 340:	33006372 	movwcc	r6, #882	; 0x372
 344:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 348:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 34c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 350:	00006564 	andeq	r6, r0, r4, ror #10
 354:	2e697073 	mcrcs	0, 3, r7, cr9, cr3, {3}
 358:	00010063 	andeq	r0, r1, r3, rrx
 35c:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 360:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 364:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 368:	70670000 	rsbvc	r0, r7, r0
 36c:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 370:	00000200 	andeq	r0, r0, r0, lsl #4
 374:	02050000 	andeq	r0, r5, #0
 378:	00008534 	andeq	r8, r0, r4, lsr r5
 37c:	13013503 	movwne	r3, #5379	; 0x1503
 380:	4e872d67 	cdpmi	13, 8, cr2, cr7, cr7, {3}
 384:	6a686767 	bvs	1a1a128 <__user_program+0x171a128>
 388:	31346885 	teqcc	r4, r5, lsl #17
 38c:	692f3130 	stmdbvs	pc!, {r4, r5, r8, ip, sp}	; <UNPREDICTABLE>
 390:	85010d03 	strhi	r0, [r1, #-3331]	; 0xd03
 394:	30313468 	eorscc	r3, r1, r8, ror #8
 398:	be144e31 	mrclt	14, 0, r4, cr4, cr1, {1}
 39c:	312f6a4e 	teqcc	pc, lr, asr #20
 3a0:	494b2d67 	stmdbmi	fp, {r0, r1, r2, r5, r6, r8, sl, fp, sp}^
 3a4:	2d67696b 	stclcs	9, cr6, [r7, #-428]!	; 0xfffffe54
 3a8:	696b494b 	stmdbvs	fp!, {r0, r1, r3, r6, r8, fp, lr}^
 3ac:	02322f2f 	eorseq	r2, r2, #47, 30	; 0xbc
 3b0:	01010004 	tsteq	r1, r4
 3b4:	0000011c 	andeq	r0, r0, ip, lsl r1
 3b8:	00690002 	rsbeq	r0, r9, r2
 3bc:	01020000 	mrseq	r0, (UNDEF: 2)
 3c0:	000d0efb 	strdeq	r0, [sp], -fp
 3c4:	01010101 	tsteq	r1, r1, lsl #2
 3c8:	01000000 	mrseq	r0, (UNDEF: 0)
 3cc:	6b010000 	blvs	403d4 <__bss_end+0x343d4>
 3d0:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 3d4:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 3d8:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 3dc:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 3e0:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 3e4:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 3e8:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 3ec:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 3f0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 3f4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 3f8:	63730000 	cmnvs	r3, #0
 3fc:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 400:	0100632e 	tsteq	r0, lr, lsr #6
 404:	736b0000 	cmnvc	fp, #0
 408:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 40c:	00682e74 	rsbeq	r2, r8, r4, ror lr
 410:	67000002 	strvs	r0, [r0, -r2]
 414:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
 418:	00020068 	andeq	r0, r2, r8, rrx
 41c:	69707300 	ldmdbvs	r0!, {r8, r9, ip, sp, lr}^
 420:	0300682e 	movweq	r6, #2094	; 0x82e
 424:	00000000 	andeq	r0, r0, r0
 428:	86b40205 	ldrthi	r0, [r4], r5, lsl #4
 42c:	13190000 	tstne	r9, #0
 430:	148a2d67 	strne	r2, [sl], #3431	; 0xd67
 434:	4c302d68 	ldcmi	13, cr2, [r0], #-416	; 0xfffffe60
 438:	03832f49 	orreq	r2, r3, #292	; 0x124
 43c:	31352e7a 	teqcc	r5, sl, ror lr
 440:	302d6814 	eorcc	r6, sp, r4, lsl r8
 444:	832f494c 	teqhi	pc, #76, 18	; 0x130000
 448:	352e7a03 	strcc	r7, [lr, #-2563]!	; 0xa03
 44c:	02004c32 	andeq	r4, r0, #12800	; 0x3200
 450:	2e060304 	cdpcs	3, 0, cr0, cr6, cr4, {0}
 454:	11036806 	tstne	r3, r6, lsl #16
 458:	4b4b4c66 	blmi	12d35f8 <__user_program+0xfd35f8>
 45c:	4c4e4b67 	mcrrmi	11, 6, r4, lr, cr7
 460:	4b674b4b 	blmi	19d3194 <__user_program+0x16d3194>
 464:	4b672f4d 	blmi	19cc1a0 <__user_program+0x16cc1a0>
 468:	034b4b67 	movteq	r4, #47975	; 0xbb67
 46c:	2f2f6619 	svccs	0x002f6619
 470:	4b4b6767 	blmi	12da214 <__user_program+0xfda214>
 474:	4b4b694c 	blmi	12da9ac <__user_program+0xfda9ac>
 478:	4b4b4b4b 	blmi	12d31ac <__user_program+0xfd31ac>
 47c:	4b4b4b4b 	blmi	12d31b0 <__user_program+0xfd31b0>
 480:	4b4b4b4b 	blmi	12d31b4 <__user_program+0xfd31b4>
 484:	4b4b4b4b 	blmi	12d31b8 <__user_program+0xfd31b8>
 488:	4b4b4b4b 	blmi	12d31bc <__user_program+0xfd31bc>
 48c:	2f694b4b 	svccs	0x00694b4b
 490:	4b4b4b4b 	blmi	12d31c4 <__user_program+0xfd31c4>
 494:	7f94034b 	svcvc	0x0094034b
 498:	4b2f3166 	blmi	bcca38 <__user_program+0x8cca38>
 49c:	03040200 	movweq	r0, #16896	; 0x4200
 4a0:	040200a1 	streq	r0, [r2], #-161	; 0xa1
 4a4:	304d4903 	subcc	r4, sp, r3, lsl #18
 4a8:	31661e03 	cmncc	r6, r3, lsl #28
 4ac:	00844b2f 	addeq	r4, r4, pc, lsr #22
 4b0:	06030402 	streq	r0, [r3], -r2, lsl #8
 4b4:	0402004a 	streq	r0, [r2], #-74	; 0x4a
 4b8:	4c9d0603 	ldcmi	6, cr0, [sp], {3}
 4bc:	2f30bd2f 	svccs	0x0030bd2f
 4c0:	0200844b 	andeq	r8, r0, #1258291200	; 0x4b000000
 4c4:	2e060304 	cdpcs	3, 0, cr0, cr6, cr4, {0}
 4c8:	03040200 	movweq	r0, #16896	; 0x4200
 4cc:	024c4906 	subeq	r4, ip, #98304	; 0x18000
 4d0:	01010004 	tsteq	r1, r4
 4d4:	00000054 	andeq	r0, r0, r4, asr r0
 4d8:	00290002 	eoreq	r0, r9, r2
 4dc:	01020000 	mrseq	r0, (UNDEF: 2)
 4e0:	000d0efb 	strdeq	r0, [sp], -fp
 4e4:	01010101 	tsteq	r1, r1, lsl #2
 4e8:	01000000 	mrseq	r0, (UNDEF: 0)
 4ec:	33010000 	movwcc	r0, #4096	; 0x1000
 4f0:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 4f4:	732f6b62 	teqvc	pc, #100352	; 0x18800
 4f8:	00006372 	andeq	r6, r0, r2, ror r3
 4fc:	746f6f62 	strbtvc	r6, [pc], #-3938	; 504 <__start-0x7afc>
 500:	0100532e 	tsteq	r0, lr, lsr #6
 504:	00000000 	andeq	r0, r0, r0
 508:	80000205 	andhi	r0, r0, r5, lsl #4
 50c:	1b030000 	blne	c0514 <__bss_end+0xb4514>
 510:	2f2f2f01 	svccs	0x002f2f01
 514:	2f2f2f30 	svccs	0x002f2f30
 518:	312f2f2f 	teqcc	pc, pc, lsr #30
 51c:	33312f2f 	teqcc	r1, #47, 30	; 0xbc
 520:	2e69032f 	cdpcs	3, 6, cr0, cr9, cr15, {1}
 524:	022f2f31 	eoreq	r2, pc, #49, 30	; 0xc4
 528:	01010002 	tsteq	r1, r2
 52c:	0000004d 	andeq	r0, r0, sp, asr #32
 530:	00280002 	eoreq	r0, r8, r2
 534:	01020000 	mrseq	r0, (UNDEF: 2)
 538:	000d0efb 	strdeq	r0, [sp], -fp
 53c:	01010101 	tsteq	r1, r1, lsl #2
 540:	01000000 	mrseq	r0, (UNDEF: 0)
 544:	33010000 	movwcc	r0, #4096	; 0x1000
 548:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 54c:	732f6b62 	teqvc	pc, #100352	; 0x18800
 550:	00006372 	andeq	r6, r0, r2, ror r3
 554:	2e6d7261 	cdpcs	2, 6, cr7, cr13, cr1, {3}
 558:	00010053 	andeq	r0, r1, r3, asr r0
 55c:	05000000 	streq	r0, [r0, #-0]
 560:	008a5002 	addeq	r5, sl, r2
 564:	01100300 	tsteq	r0, r0, lsl #6
 568:	2f332f2f 	svccs	0x00332f2f
 56c:	2f332f33 	svccs	0x00332f33
 570:	332f2f2f 	teqcc	pc, #47, 30	; 0xbc
 574:	2f2f2f2f 	svccs	0x002f2f2f
 578:	01000202 	tsteq	r0, r2, lsl #4
 57c:	Address 0x0000057c is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	70670074 	rsbvc	r0, r7, r4, ror r0
  10:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  14:	705f7465 	subsvc	r7, pc, r5, ror #8
  18:	006c6c75 	rsbeq	r6, ip, r5, ror ip
  1c:	6f697067 	svcvs	0x00697067
  20:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  24:	65735f6f 	ldrbvs	r5, [r3, #-3951]!	; 0xf6f
  28:	6f6c0074 	svcvs	0x006c0074
  2c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
  30:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  34:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  38:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  3c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  40:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  44:	6c635f6f 	stclvs	15, cr5, [r3], #-444	; 0xfffffe44
  48:	4e470072 	mcrmi	0, 2, r0, cr7, cr2, {3}
  4c:	20432055 	subcs	r2, r3, r5, asr r0
  50:	2e392e34 	mrccs	14, 1, r2, cr9, cr4, {1}
  54:	30322033 	eorscc	r2, r2, r3, lsr r0
  58:	35303531 	ldrcc	r3, [r0, #-1329]!	; 0x531
  5c:	28203932 	stmdacs	r0!, {r1, r4, r5, r8, fp, ip, sp}
  60:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0x572
  64:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
  68:	52415b20 	subpl	r5, r1, #32, 22	; 0x8000
  6c:	6d652f4d 	stclvs	15, cr2, [r5, #-308]!	; 0xfffffecc
  70:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
  74:	342d6465 	strtcc	r6, [sp], #-1125	; 0x465
  78:	622d395f 	eorvs	r3, sp, #1556480	; 0x17c000
  7c:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
  80:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0x68
  84:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
  88:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
  8c:	38323432 	ldmdacc	r2!, {r1, r4, r5, sl, ip, sp}
  90:	2d205d38 	stccs	13, cr5, [r0, #-224]!	; 0xffffff20
  94:	6f6c666d 	svcvs	0x006c666d
  98:	612d7461 	teqvs	sp, r1, ror #8
  9c:	733d6962 	teqvc	sp, #1605632	; 0x188000
  a0:	2074666f 	rsbscs	r6, r4, pc, ror #12
  a4:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
  a8:	613d6863 	teqvs	sp, r3, ror #16
  ac:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
  b0:	2d20612d 	stfcss	f6, [r0, #-180]!	; 0xffffff4c
  b4:	4f2d2067 	svcmi	0x002d2067
  b8:	662d2031 			; <UNDEFINED> instruction: 0x662d2031
  bc:	65657266 	strbvs	r7, [r5, #-614]!	; 0x266
  c0:	6e617473 	mcrvs	4, 3, r7, cr1, cr3, {3}
  c4:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
  c8:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
  cc:	745f3874 	ldrbvc	r3, [pc], #-2164	; d4 <__start-0x7f2c>
  d0:	736e7500 	cmnvc	lr, #0, 10
  d4:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  d8:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
  dc:	75007261 	strvc	r7, [r0, #-609]	; 0x261
  e0:	33746e69 	cmncc	r4, #1680	; 0x690
  e4:	00745f32 	rsbseq	r5, r4, r2, lsr pc
  e8:	616c6564 	cmnvs	ip, r4, ror #10
  ec:	79635f79 	stmdbvc	r3!, {r0, r3, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
  f0:	73656c63 	cmnvc	r5, #25344	; 0x6300
  f4:	6f687300 	svcvs	0x00687300
  f8:	75207472 	strvc	r7, [r0, #-1138]!	; 0x472
  fc:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
 100:	2064656e 	rsbcs	r6, r4, lr, ror #10
 104:	00746e69 	rsbseq	r6, r4, r9, ror #28
 108:	74617473 	strbtvc	r7, [r1], #-1139	; 0x473
 10c:	70670065 	rsbvc	r0, r7, r5, rrx
 110:	635f6f69 	cmpvs	pc, #420	; 0x1a4
 114:	69666e6f 	stmdbvs	r6!, {r0, r1, r2, r3, r5, r6, r9, sl, fp, sp, lr}^
 118:	68730067 	ldmdavs	r3!, {r0, r1, r2, r5, r6}^
 11c:	2074726f 	rsbscs	r7, r4, pc, ror #4
 120:	00746e69 	rsbseq	r6, r4, r9, ror #28
 124:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
 128:	33007465 	movwcc	r7, #1125	; 0x465
 12c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 130:	732f6b62 	teqvc	pc, #100352	; 0x18800
 134:	672f6372 			; <UNDEFINED> instruction: 0x672f6372
 138:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
 13c:	682f0063 	stmdavs	pc!, {r0, r1, r5, r6}	; <UNPREDICTABLE>
 140:	2f656d6f 	svccs	0x00656d6f
 144:	65766976 	ldrbvs	r6, [r6, #-2422]!	; 0x976
 148:	6f442f6b 	svcvs	0x00442f6b
 14c:	656d7563 	strbvs	r7, [sp, #-1379]!	; 0x563
 150:	2f73746e 	svccs	0x0073746e
 154:	332d3831 	teqcc	sp, #3211264	; 0x310000
 158:	662d3934 			; <UNDEFINED> instruction: 0x662d3934
 15c:	6c2f3631 	stcvs	6, cr3, [pc], #-196	; a0 <__start-0x7f60>
 160:	5f336261 	svcpl	0x00336261
 164:	646e6168 	strbtvs	r6, [lr], #-360	; 0x168
 168:	2f74756f 	svccs	0x0074756f
 16c:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 170:	72656b00 	rsbvc	r6, r5, #0, 22
 174:	2f6c656e 	svccs	0x006c656e
 178:	2f637273 	svccs	0x00637273
 17c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 180:	632e6c65 	teqvs	lr, #25856	; 0x6500
 184:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 188:	75625f64 	strbvc	r5, [r2, #-3940]!	; 0xf64
 18c:	6c635f66 	stclvs	15, cr5, [r3], #-408	; 0xfffffe68
 190:	6c6f0072 	stclvs	0, cr0, [pc], #-456	; ffffffd0 <__user_program+0xffcfffd0>
 194:	625f6465 	subsvs	r6, pc, #1694498816	; 0x65000000
 198:	705f6675 	subsvc	r6, pc, r5, ror r6	; <UNPREDICTABLE>
 19c:	6c657869 	stclvs	8, cr7, [r5], #-420	; 0xfffffe5c
 1a0:	7465735f 	strbtvc	r7, [r5], #-863	; 0x35f
 1a4:	72656b00 	rsbvc	r6, r5, #0, 22
 1a8:	5f6c656e 	svcpl	0x006c656e
 1ac:	6e69616d 	powvsez	f6, f1, #5.0
 1b0:	6f682f00 	svcvs	0x00682f00
 1b4:	762f656d 	strtvc	r6, [pc], -sp, ror #10
 1b8:	6b657669 	blvs	195db64 <__user_program+0x165db64>
 1bc:	636f442f 	cmnvs	pc, #788529152	; 0x2f000000
 1c0:	6e656d75 	mcrvs	13, 3, r6, cr5, cr5, {3}
 1c4:	312f7374 	teqcc	pc, r4, ror r3	; <UNPREDICTABLE>
 1c8:	34332d38 	ldrtcc	r2, [r3], #-3384	; 0xd38
 1cc:	31662d39 	cmncc	r6, r9, lsr sp
 1d0:	6f632f36 	svcvs	0x00632f36
 1d4:	6f2f6564 	svcvs	0x002f6564
 1d8:	5f64656c 	svcpl	0x0064656c
 1dc:	65726373 	ldrbvs	r6, [r2, #-883]!	; 0x373
 1e0:	745f6e65 	ldrbvc	r6, [pc], #-3685	; 1e8 <__start-0x7e18>
 1e4:	2f747365 	svccs	0x00747365
 1e8:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 1ec:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 1f0:	75625f64 	strbvc	r5, [r2, #-3940]!	; 0xf64
 1f4:	72645f66 	rsbvc	r5, r4, #408	; 0x198
 1f8:	6f007761 	svcvs	0x00007761
 1fc:	5f64656c 	svcpl	0x0064656c
 200:	5f667562 	svcpl	0x00667562
 204:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0x970
 208:	6c635f6c 	stclvs	15, cr5, [r3], #-432	; 0xfffffe50
 20c:	6c6f0072 	stclvs	0, cr0, [pc], #-456	; 4c <__start-0x7fb4>
 210:	695f6465 	ldmdbvs	pc, {r0, r2, r5, r6, sl, sp, lr}^	; <UNPREDICTABLE>
 214:	0074696e 	rsbseq	r6, r4, lr, ror #18
 218:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 21c:	7274705f 	rsbsvc	r7, r4, #95	; 0x5f
 220:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 224:	5f343674 	svcpl	0x00343674
 228:	656b0074 	strbvs	r0, [fp, #-116]!	; 0x74
 22c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 230:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 234:	6972702f 	ldmdbvs	r2!, {r0, r1, r2, r3, r5, ip, sp, lr}^
 238:	2e6b746e 	cdpcs	4, 6, cr7, cr11, cr14, {3}
 23c:	5f5f0063 	svcpl	0x005f0063
 240:	6c5f6176 	ldfvse	f6, [pc], {118}	; 0x76
 244:	00747369 	rsbseq	r7, r4, r9, ror #6
 248:	69676964 	stmdbvs	r7!, {r2, r5, r6, r8, fp, sp, lr}^
 24c:	75007374 	strvc	r7, [r0, #-884]	; 0x374
 250:	5f747261 	svcpl	0x00747261
 254:	5f747570 	svcpl	0x00747570
 258:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 25c:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 260:	756e746e 	strbvc	r7, [lr, #-1134]!	; 0x46e
 264:	70006b6d 	andvc	r6, r0, sp, ror #22
 268:	69666572 	stmdbvs	r6!, {r1, r4, r5, r6, r8, sl, sp, lr}^
 26c:	61620078 	smcvs	8200	; 0x2008
 270:	70006573 	andvc	r6, r0, r3, ror r5
 274:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 278:	7261006b 	rsbvc	r0, r1, #107	; 0x6b
 27c:	73007367 	movwvc	r7, #871	; 0x367
 280:	74657a69 	strbtvc	r7, [r5], #-2665	; 0xa69
 284:	00657079 	rsbeq	r7, r5, r9, ror r0
 288:	70615f5f 	rsbvc	r5, r1, pc, asr pc
 28c:	72617500 	rsbvc	r7, r1, #0, 10
 290:	65675f74 	strbvs	r5, [r7, #-3956]!	; 0xf74
 294:	79625f74 	stmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 298:	75006574 	strvc	r6, [r0, #-1396]	; 0x574
 29c:	5f747261 	svcpl	0x00747261
 2a0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 2a4:	72656b00 	rsbvc	r6, r5, #0, 22
 2a8:	2f6c656e 	svccs	0x006c656e
 2ac:	2f637273 	svccs	0x00637273
 2b0:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 2b4:	7500632e 	strvc	r6, [r0, #-814]	; 0x32e
 2b8:	5f747261 	svcpl	0x00747261
 2bc:	736f6c63 	cmnvc	pc, #25344	; 0x6300
 2c0:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 2c4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 2c8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 2cc:	6332692f 	teqvs	r2, #770048	; 0xbc000
 2d0:	6900632e 	stmdbvs	r0, {r1, r2, r3, r5, r8, r9, sp, lr}
 2d4:	6d5f6332 	ldclvs	3, cr6, [pc, #-200]	; 214 <__start-0x7dec>
 2d8:	65747361 	ldrbvs	r7, [r4, #-865]!	; 0x361
 2dc:	6e695f72 	mcrvs	15, 3, r5, cr9, cr2, {3}
 2e0:	61007469 	tstvs	r0, r9, ror #8
 2e4:	00726464 	rsbseq	r6, r2, r4, ror #8
 2e8:	5f633269 	svcpl	0x00633269
 2ec:	7473616d 	ldrbtvc	r6, [r3], #-365	; 0x16d
 2f0:	725f7265 	subsvc	r7, pc, #1342177286	; 0x50000006
 2f4:	00646165 	rsbeq	r6, r4, r5, ror #2
 2f8:	746e6975 	strbtvc	r6, [lr], #-2421	; 0x975
 2fc:	745f3631 	ldrbvc	r3, [pc], #-1585	; 304 <__start-0x7cfc>
 300:	63326900 	teqvs	r2, #0, 18
 304:	73616d5f 	cmnvc	r1, #6080	; 0x17c0
 308:	5f726574 	svcpl	0x00726574
 30c:	74697277 	strbtvc	r7, [r9], #-631	; 0x277
 310:	68630065 	stmdavs	r3!, {r0, r2, r5, r6}^
 314:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xe61
 318:	6461006c 	strbtvs	r0, [r1], #-108	; 0x6c
 31c:	65725f63 	ldrbvs	r5, [r2, #-3939]!	; 0xf63
 320:	61006461 	tstvs	r0, r1, ror #8
 324:	695f6364 	ldmdbvs	pc, {r2, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 328:	0074696e 	rsbseq	r6, r4, lr, ror #18
 32c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 330:	732f6c65 	teqvc	pc, #25856	; 0x6500
 334:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
 338:	30317364 	eorscc	r7, r1, r4, ror #6
 33c:	632e3531 	teqvs	lr, #205520896	; 0xc400000
 340:	646f6d00 	strbtvs	r6, [pc], #-3328	; 348 <__start-0x7cb8>
 344:	70730065 	rsbsvc	r0, r3, r5, rrx
 348:	65625f69 	strbvs	r5, [r2, #-3945]!	; 0xf69
 34c:	006e6967 	rsbeq	r6, lr, r7, ror #18
 350:	5f697073 	svcpl	0x00697073
 354:	6e617274 	mcrvs	2, 3, r7, cr1, cr4, {3}
 358:	72656673 	rsbvc	r6, r5, #120586240	; 0x7300000
 35c:	69707300 	ldmdbvs	r0!, {r8, r9, ip, sp, lr}^
 360:	73616d5f 	cmnvc	r1, #6080	; 0x17c0
 364:	5f726574 	svcpl	0x00726574
 368:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 36c:	72656b00 	rsbvc	r6, r5, #0, 22
 370:	2f6c656e 	svccs	0x006c656e
 374:	2f637273 	svccs	0x00637273
 378:	2e697073 	mcrcs	0, 3, r7, cr9, cr3, {3}
 37c:	70730063 	rsbsvc	r0, r3, r3, rrx
 380:	6e655f69 	cdpvs	15, 6, cr5, cr5, cr9, {3}
 384:	6d630064 	stclvs	0, cr0, [r3, #-400]!	; 0xfffffe70
 388:	646f4d64 	strbtvs	r4, [pc], #-3428	; 390 <__start-0x7c70>
 38c:	65640065 	strbvs	r0, [r4, #-101]!	; 0x65
 390:	0079616c 	rsbseq	r6, r9, ip, ror #2
 394:	69617774 	stmdbvs	r1!, {r2, r4, r5, r6, r8, r9, sl, ip, sp, lr}^
 398:	6c6f0074 	stclvs	0, cr0, [pc], #-464	; 1d0 <__start-0x7e30>
 39c:	775f6465 	ldrbvc	r6, [pc, -r5, ror #8]
 3a0:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0x972
 3a4:	7461645f 	strbtvc	r6, [r1], #-1119	; 0x45f
 3a8:	656b0061 	strbvs	r0, [fp, #-97]!	; 0x61
 3ac:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 3b0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 3b4:	7263732f 	rsbvc	r7, r3, #-1140850688	; 0xbc000000
 3b8:	2e6e6565 	cdpcs	5, 6, cr6, cr14, cr5, {3}
 3bc:	6c6f0063 	stclvs	0, cr0, [pc], #-396	; 238 <__start-0x7dc8>
 3c0:	735f6465 	cmpvc	pc, #1694498816	; 0x65000000
 3c4:	6c6f7263 	sfmvs	f7, 2, [pc], #-396	; 240 <__start-0x7dc0>
 3c8:	65745f6c 	ldrbvs	r5, [r4, #-3948]!	; 0xf6c
 3cc:	6f007473 	svcvs	0x00007473
 3d0:	5f64656c 	svcpl	0x0064656c
 3d4:	61656c63 	cmnvs	r5, r3, ror #24
 3d8:	63735f72 	cmnvs	r3, #456	; 0x1c8
 3dc:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 3e0:	646e6900 	strbtvs	r6, [lr], #-2304	; 0x900
 3e4:	5f007865 	svcpl	0x00007865
 3e8:	64656c6f 	strbtvs	r6, [r5], #-3183	; 0xc6f
 3ec:	6172665f 	cmnvs	r2, pc, asr r6
 3f0:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
 3f4:	65666675 	strbvs	r6, [r6, #-1653]!	; 0x675
 3f8:	6c6f0072 	stclvs	0, cr0, [pc], #-456	; 238 <__start-0x7dc8>
 3fc:	735f6465 	cmpvc	pc, #1694498816	; 0x65000000
 400:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 404:	7165735f 	cmnvc	r5, pc, asr r3
 408:	636e6575 	cmnvs	lr, #490733568	; 0x1d400000
 40c:	6c6f0065 	stclvs	0, cr0, [pc], #-404	; 280 <__start-0x7d80>
 410:	775f6465 	ldrbvc	r6, [pc, -r5, ror #8]
 414:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0x972
 418:	6d6f635f 	stclvs	3, cr6, [pc, #-380]!	; 2a4 <__start-0x7d5c>
 41c:	646e616d 	strbtvs	r6, [lr], #-365	; 0x16d
 420:	656c6f00 	strbvs	r6, [ip, #-3840]!	; 0xf00
 424:	65725f64 	ldrbvs	r5, [r2, #-3940]!	; 0xf64
 428:	00746573 	rsbseq	r6, r4, r3, ror r5

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
  24:	1a011803 	bne	46038 <__bss_end+0x3a038>
  28:	22011e01 	andcs	r1, r1, #1, 28
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000054 	andeq	r0, r0, r4, asr r0
  20:	0000000c 	andeq	r0, r0, ip
  24:	00000000 	andeq	r0, r0, r0
  28:	000080a8 	andeq	r8, r0, r8, lsr #1
  2c:	00000044 	andeq	r0, r0, r4, asr #32
  30:	0000000c 	andeq	r0, r0, ip
  34:	00000000 	andeq	r0, r0, r0
  38:	000080ec 	andeq	r8, r0, ip, ror #1
  3c:	00000044 	andeq	r0, r0, r4, asr #32
  40:	00000018 	andeq	r0, r0, r8, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008130 	andeq	r8, r0, r0, lsr r1
  4c:	00000084 	andeq	r0, r0, r4, lsl #1
  50:	83100e48 	tsthi	r0, #72, 28	; 0x480
  54:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  58:	00018e02 	andeq	r8, r1, r2, lsl #28
  5c:	0000000c 	andeq	r0, r0, ip
  60:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  64:	7c020001 	stcvc	0, cr0, [r2], {1}
  68:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  6c:	00000020 	andeq	r0, r0, r0, lsr #32
  70:	0000005c 	andeq	r0, r0, ip, asr r0
  74:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  78:	000000b4 	strheq	r0, [r0], -r4
  7c:	83200e42 	teqhi	r0, #1056	; 0x420
  80:	85078408 	strhi	r8, [r7, #-1032]	; 0x408
  84:	87058606 	strhi	r8, [r5, -r6, lsl #12]
  88:	89038804 	stmdbhi	r3, {r2, fp, pc}
  8c:	00018e02 	andeq	r8, r1, r2, lsl #28
  90:	0000000c 	andeq	r0, r0, ip
  94:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  98:	7c020001 	stcvc	0, cr0, [r2], {1}
  9c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  a0:	00000028 	andeq	r0, r0, r8, lsr #32
  a4:	00000090 	muleq	r0, r0, r0
  a8:	00008268 	andeq	r8, r0, r8, ror #4
  ac:	000000e0 	andeq	r0, r0, r0, ror #1
  b0:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
  b4:	86078508 	strhi	r8, [r7], -r8, lsl #10
  b8:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
  bc:	8a038904 	bhi	e24d4 <__bss_end+0xd64d4>
  c0:	42018e02 	andmi	r8, r1, #2, 28
  c4:	6a02280e 	bvs	8a104 <__bss_end+0x7e104>
  c8:	0000200e 	andeq	r2, r0, lr
  cc:	00000040 	andeq	r0, r0, r0, asr #32
  d0:	00000090 	muleq	r0, r0, r0
  d4:	00008348 	andeq	r8, r0, r8, asr #6
  d8:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
  dc:	80100e42 	andshi	r0, r0, r2, asr #28
  e0:	82038104 	andhi	r8, r3, #4, 2
  e4:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
  e8:	0a84280e 	beq	fe10a128 <__user_program+0xfde0a128>
  ec:	08860985 	stmeq	r6, {r0, r2, r7, r8, fp}
  f0:	06880787 	streq	r0, [r8], r7, lsl #15
  f4:	0e42058e 	cdpeq	5, 4, cr0, cr2, cr14, {4}
  f8:	0ed00230 	mrceq	2, 6, r0, cr0, cr0, {1}
  fc:	c8ce4228 	stmiagt	lr, {r3, r5, r9, lr}^
 100:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 104:	c342100e 	movtgt	r1, #8206	; 0x200e
 108:	0ec0c1c2 	acseqdm	f4, f2
 10c:	00000000 	andeq	r0, r0, r0
 110:	0000000c 	andeq	r0, r0, ip
 114:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 118:	7c020001 	stcvc	0, cr0, [r2], {1}
 11c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 120:	0000000c 	andeq	r0, r0, ip
 124:	00000110 	andeq	r0, r0, r0, lsl r1
 128:	00008500 	andeq	r8, r0, r0, lsl #10
 12c:	00000004 	andeq	r0, r0, r4
 130:	0000000c 	andeq	r0, r0, ip
 134:	00000110 	andeq	r0, r0, r0, lsl r1
 138:	00008504 	andeq	r8, r0, r4, lsl #10
 13c:	00000004 	andeq	r0, r0, r4
 140:	0000000c 	andeq	r0, r0, ip
 144:	00000110 	andeq	r0, r0, r0, lsl r1
 148:	00008508 	andeq	r8, r0, r8, lsl #10
 14c:	00000004 	andeq	r0, r0, r4
 150:	0000000c 	andeq	r0, r0, ip
 154:	00000110 	andeq	r0, r0, r0, lsl r1
 158:	0000850c 	andeq	r8, r0, ip, lsl #10
 15c:	00000008 	andeq	r0, r0, r8
 160:	0000000c 	andeq	r0, r0, ip
 164:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 168:	7c020001 	stcvc	0, cr0, [r2], {1}
 16c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 170:	0000000c 	andeq	r0, r0, ip
 174:	00000160 	andeq	r0, r0, r0, ror #2
 178:	00008514 	andeq	r8, r0, r4, lsl r5
 17c:	00000004 	andeq	r0, r0, r4
 180:	0000000c 	andeq	r0, r0, ip
 184:	00000160 	andeq	r0, r0, r0, ror #2
 188:	00008518 	andeq	r8, r0, r8, lsl r5
 18c:	00000008 	andeq	r0, r0, r8
 190:	0000000c 	andeq	r0, r0, ip
 194:	00000160 	andeq	r0, r0, r0, ror #2
 198:	00008520 	andeq	r8, r0, r0, lsr #10
 19c:	00000008 	andeq	r0, r0, r8
 1a0:	0000000c 	andeq	r0, r0, ip
 1a4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1a8:	7c020001 	stcvc	0, cr0, [r2], {1}
 1ac:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b0:	0000000c 	andeq	r0, r0, ip
 1b4:	000001a0 	andeq	r0, r0, r0, lsr #3
 1b8:	00008528 	andeq	r8, r0, r8, lsr #10
 1bc:	00000004 	andeq	r0, r0, r4
 1c0:	0000000c 	andeq	r0, r0, ip
 1c4:	000001a0 	andeq	r0, r0, r0, lsr #3
 1c8:	0000852c 	andeq	r8, r0, ip, lsr #10
 1cc:	00000008 	andeq	r0, r0, r8
 1d0:	0000000c 	andeq	r0, r0, ip
 1d4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d8:	7c020001 	stcvc	0, cr0, [r2], {1}
 1dc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1e0:	0000000c 	andeq	r0, r0, ip
 1e4:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 1e8:	00008534 	andeq	r8, r0, r4, lsr r5
 1ec:	00000020 	andeq	r0, r0, r0, lsr #32
 1f0:	00000014 	andeq	r0, r0, r4, lsl r0
 1f4:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 1f8:	00008554 	andeq	r8, r0, r4, asr r5
 1fc:	00000074 	andeq	r0, r0, r4, ror r0
 200:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 204:	00018e02 	andeq	r8, r1, r2, lsl #28
 208:	0000000c 	andeq	r0, r0, ip
 20c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 210:	000085c8 	andeq	r8, r0, r8, asr #11
 214:	00000034 	andeq	r0, r0, r4, lsr r0
 218:	0000000c 	andeq	r0, r0, ip
 21c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 220:	000085fc 	strdeq	r8, [r0], -ip
 224:	00000018 	andeq	r0, r0, r8, lsl r0
 228:	00000018 	andeq	r0, r0, r8, lsl r0
 22c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 230:	00008614 	andeq	r8, r0, r4, lsl r6
 234:	000000a0 	andeq	r0, r0, r0, lsr #1
 238:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xe42
 23c:	86038504 	strhi	r8, [r3], -r4, lsl #10
 240:	00018e02 	andeq	r8, r1, r2, lsl #28
 244:	0000000c 	andeq	r0, r0, ip
 248:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 24c:	7c020001 	stcvc	0, cr0, [r2], {1}
 250:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 254:	0000000c 	andeq	r0, r0, ip
 258:	00000244 	andeq	r0, r0, r4, asr #4
 25c:	000086b4 			; <UNDEFINED> instruction: 0x000086b4
 260:	00000020 	andeq	r0, r0, r0, lsr #32
 264:	0000000c 	andeq	r0, r0, ip
 268:	00000244 	andeq	r0, r0, r4, asr #4
 26c:	000086d4 	ldrdeq	r8, [r0], -r4
 270:	00000044 	andeq	r0, r0, r4, asr #32
 274:	0000000c 	andeq	r0, r0, ip
 278:	00000244 	andeq	r0, r0, r4, asr #4
 27c:	00008718 	andeq	r8, r0, r8, lsl r7
 280:	00000044 	andeq	r0, r0, r4, asr #32
 284:	0000000c 	andeq	r0, r0, ip
 288:	00000244 	andeq	r0, r0, r4, asr #4
 28c:	0000875c 	andeq	r8, r0, ip, asr r7
 290:	00000024 	andeq	r0, r0, r4, lsr #32
 294:	00000014 	andeq	r0, r0, r4, lsl r0
 298:	00000244 	andeq	r0, r0, r4, asr #4
 29c:	00008780 	andeq	r8, r0, r0, lsl #15
 2a0:	00000034 	andeq	r0, r0, r4, lsr r0
 2a4:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 2a8:	00018e02 	andeq	r8, r1, r2, lsl #28
 2ac:	00000014 	andeq	r0, r0, r4, lsl r0
 2b0:	00000244 	andeq	r0, r0, r4, asr #4
 2b4:	000087b4 			; <UNDEFINED> instruction: 0x000087b4
 2b8:	00000034 	andeq	r0, r0, r4, lsr r0
 2bc:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 2c0:	00018e02 	andeq	r8, r1, r2, lsl #28
 2c4:	00000014 	andeq	r0, r0, r4, lsl r0
 2c8:	00000244 	andeq	r0, r0, r4, asr #4
 2cc:	000087e8 	andeq	r8, r0, r8, ror #15
 2d0:	00000040 	andeq	r0, r0, r0, asr #32
 2d4:	83080e42 	movwhi	r0, #36418	; 0x8e42
 2d8:	00018e02 	andeq	r8, r1, r2, lsl #28
 2dc:	00000014 	andeq	r0, r0, r4, lsl r0
 2e0:	00000244 	andeq	r0, r0, r4, asr #4
 2e4:	00008828 	andeq	r8, r0, r8, lsr #16
 2e8:	00000110 	andeq	r0, r0, r0, lsl r1
 2ec:	83080e42 	movwhi	r0, #36418	; 0x8e42
 2f0:	00018e02 	andeq	r8, r1, r2, lsl #28
 2f4:	00000014 	andeq	r0, r0, r4, lsl r0
 2f8:	00000244 	andeq	r0, r0, r4, asr #4
 2fc:	00008938 	andeq	r8, r0, r8, lsr r9
 300:	00000038 	andeq	r0, r0, r8, lsr r0
 304:	83080e42 	movwhi	r0, #36418	; 0x8e42
 308:	00018e02 	andeq	r8, r1, r2, lsl #28
 30c:	00000018 	andeq	r0, r0, r8, lsl r0
 310:	00000244 	andeq	r0, r0, r4, asr #4
 314:	00008970 	andeq	r8, r0, r0, ror r9
 318:	00000044 	andeq	r0, r0, r4, asr #32
 31c:	83100e42 	tsthi	r0, #1056	; 0x420
 320:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 324:	00018e02 	andeq	r8, r1, r2, lsl #28
 328:	00000018 	andeq	r0, r0, r8, lsl r0
 32c:	00000244 	andeq	r0, r0, r4, asr #4
 330:	000089b4 			; <UNDEFINED> instruction: 0x000089b4
 334:	00000060 	andeq	r0, r0, r0, rrx
 338:	83100e42 	tsthi	r0, #1056	; 0x420
 33c:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 340:	00018e02 	andeq	r8, r1, r2, lsl #28
 344:	00000018 	andeq	r0, r0, r8, lsl r0
 348:	00000244 	andeq	r0, r0, r4, asr #4
 34c:	00008a14 	andeq	r8, r0, r4, lsl sl
 350:	0000003c 	andeq	r0, r0, ip, lsr r0
 354:	83100e42 	tsthi	r0, #1056	; 0x420
 358:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 35c:	00018e02 	andeq	r8, r1, r2, lsl #28
 360:	0000000c 	andeq	r0, r0, ip
 364:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 368:	7c010001 	stcvc	0, cr0, [r1], {1}
 36c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 370:	00000014 	andeq	r0, r0, r4, lsl r0
 374:	00000360 	andeq	r0, r0, r0, ror #6
 378:	00008a94 	muleq	r0, r4, sl
 37c:	0000003c 	andeq	r0, r0, ip, lsr r0
 380:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 384:	00000010 	andeq	r0, r0, r0, lsl r0
 388:	0000000c 	andeq	r0, r0, ip
 38c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 390:	7c020001 	stcvc	0, cr0, [r2], {1}
 394:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 398:	0000002c 	andeq	r0, r0, ip, lsr #32
 39c:	00000388 	andeq	r0, r0, r8, lsl #7
 3a0:	00008ad0 	ldrdeq	r8, [r0], -r0
 3a4:	00000044 	andeq	r0, r0, r4, asr #32
 3a8:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 3ac:	86078508 	strhi	r8, [r7], -r8, lsl #10
 3b0:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 3b4:	8a038904 	bhi	e27cc <__bss_end+0xd67cc>
 3b8:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 3bc:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 3c0:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 3c4:	0000000e 	andeq	r0, r0, lr
 3c8:	00000024 	andeq	r0, r0, r4, lsr #32
 3cc:	00000388 	andeq	r0, r0, r8, lsl #7
 3d0:	00008b14 	andeq	r8, r0, r4, lsl fp
 3d4:	00000040 	andeq	r0, r0, r0, asr #32
 3d8:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 3dc:	86058506 	strhi	r8, [r5], -r6, lsl #10
 3e0:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 3e4:	5c018e02 	stcpl	14, cr8, [r1], {2}
 3e8:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 3ec:	000ec4c5 	andeq	ip, lr, r5, asr #9
 3f0:	0000000c 	andeq	r0, r0, ip
 3f4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3f8:	7c020001 	stcvc	0, cr0, [r2], {1}
 3fc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 400:	00000034 	andeq	r0, r0, r4, lsr r0
 404:	000003f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 408:	00008b58 	andeq	r8, r0, r8, asr fp
 40c:	00000178 	andeq	r0, r0, r8, ror r1
 410:	83280e44 	teqhi	r8, #68, 28	; 0x440
 414:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 418:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 41c:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 420:	8b038a04 	blhi	e2c38 <__bss_end+0xd6c38>
 424:	02018e02 	andeq	r8, r1, #2, 28
 428:	cbce0aa6 	blgt	ff382ec8 <__user_program+0xff082ec8>
 42c:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 430:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 434:	0b42000e 	bleq	1080474 <__user_program+0xd80474>
 438:	0000000c 	andeq	r0, r0, ip
 43c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 440:	7c020001 	stcvc	0, cr0, [r2], {1}
 444:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 448:	0000002c 	andeq	r0, r0, ip, lsr #32
 44c:	00000438 	andeq	r0, r0, r8, lsr r4
 450:	00008cd0 	ldrdeq	r8, [r0], -r0
 454:	00000120 	andeq	r0, r0, r0, lsr #2
 458:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 45c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 460:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 464:	8a038904 	bhi	e287c <__bss_end+0xd687c>
 468:	02018e02 	andeq	r8, r1, #2, 28
 46c:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 470:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 474:	00000ec4 	andeq	r0, r0, r4, asr #29

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
