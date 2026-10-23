	.file	"depthconv.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	DepthwiseConvPerChannel.constprop.0, @function
DepthwiseConvPerChannel.constprop.0:
	lui	a1,%hi(.LANCHOR0)
	lui	a2,%hi(.LANCHOR1)
	addi	sp,sp,-16
	addi	a2,a2,%lo(.LANCHOR1)
	addi	a1,a1,%lo(.LANCHOR0)
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	s2,4(sp)
	sw	s3,0(sp)
	addi	t3,a1,128
	addi	t1,a2,128
	addi	a7,a2,256
	addi	a0,a2,512
	li	a6,0
	li	s0,30
	li	t4,1
	li	t2,31
	li	t0,-128
	li	t6,127
	li	t5,32
.L9:
	addi	a3,a0,-128
	mv	s1,a7
	li	a4,0
.L2:
	lb	a5,0(a3)
	lb	s2,0(s1)
	addi	a3,a3,32
	addi	a5,a5,128
	mul	a5,a5,s2
	addi	s1,s1,32
	add	a4,a4,a5
	bne	a0,a3,.L2
	lw	s2,0(t1)
	lw	a3,0(a1)
	lw	s3,0(a2)
	sub	a5,s0,s2
	add	a3,a4,a3
	addi	s1,a5,-32
	mul	a4,a3,s3
	mulh	a3,a3,s3
	blt	s1,zero,.L3
	li	a5,0
	sll	s1,t4,s1
	add	a5,a4,a5
	sub	s3,t2,s2
	add	a3,a3,s1
	sltu	a4,a5,a4
	addi	s1,s3,-32
	add	a4,a4,a3
	blt	s1,zero,.L5
.L18:
	sra	a5,a4,s1
.L6:
	bge	a5,t0,.L7
	li	a5,-128
.L7:
	ble	a5,t6,.L8
	li	a5,127
.L8:
	sb	a5,0(t3)
	addi	a6,a6,1
	addi	a1,a1,4
	addi	a2,a2,4
	addi	t1,t1,4
	addi	t3,t3,1
	addi	a7,a7,1
	addi	a0,a0,1
	bne	a6,t5,.L9
	lw	s0,12(sp)
	lw	s1,8(sp)
	lw	s2,4(sp)
	lw	s3,0(sp)
	addi	sp,sp,16
	jr	ra
.L3:
	sll	a5,t4,a5
	li	s1,0
	add	a5,a4,a5
	sub	s3,t2,s2
	add	a3,a3,s1
	sltu	a4,a5,a4
	addi	s1,s3,-32
	add	a4,a4,a3
	bge	s1,zero,.L18
.L5:
	slli	a4,a4,1
	sll	a4,a4,s2
	srl	a5,a5,s3
	or	a5,a4,a5
	j	.L6
	.size	DepthwiseConvPerChannel.constprop.0, .-DepthwiseConvPerChannel.constprop.0
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
	beq	a0,zero,.L27
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	li	s0,0
.L21:
	addi	s0,s0,1
	call	DepthwiseConvPerChannel.constprop.0
	bne	s0,s1,.L21
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L27:
	ret
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	ret
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	tail	benchmark_body.constprop.0.isra.0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	li	a0,1639
	sw	ra,12(sp)
	call	benchmark_body.constprop.0.isra.0
	lw	ra,12(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	benchmark, .-benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a1,%hi(.LANCHOR1)
	addi	a1,a1,%lo(.LANCHOR1)
	lui	a4,%hi(.LANCHOR0+128)
	addi	a5,a1,512
	addi	a4,a4,%lo(.LANCHOR0+128)
	addi	a1,a1,544
	j	.L36
.L40:
	beq	a5,a1,.L39
.L36:
	lb	a2,0(a5)
	lb	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	beq	a2,a3,.L40
	li	a0,0
	ret
.L39:
	li	a0,1
	ret
	.size	verify_benchmark, .-verify_benchmark
	.globl	EXPECTED_OUTPUT
	.globl	OUTPUT_DATA
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	OUTPUT_MULTIPLIER, @object
	.size	OUTPUT_MULTIPLIER, 128
OUTPUT_MULTIPLIER:
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.word	1152862902
	.type	OUTPUT_SHIFT, @object
	.size	OUTPUT_SHIFT, 128
OUTPUT_SHIFT:
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.word	-8
	.type	FILTER_DATA, @object
	.size	FILTER_DATA, 128
FILTER_DATA:
	.ascii	"\317\305+\272\345/\001\\\315).\315\326,74\305?D\304\2678<0L6"
	.ascii	"\277\322?\251=K\203\357\236\356\343=\340*\263\317'\311\365+\356"
	.ascii	"G\375\177'\272\275\360\3017\324%&\340\351%\037-R4\307\3122\255"
	.ascii	":?\246\262\240\006\371I\363\024\311<=\326\3064(+()\326\314(\316"
	.ascii	"*\031\325\3416\016>\276\322\321.e^\302\302\343\316%\036)\317"
	.ascii	"\3232\311.&\365\332*\r@\252\340\273"
	.type	INPUT_DATA, @object
	.size	INPUT_DATA, 128
INPUT_DATA:
	.string	"<9>D8\"\"*?9\034\032$\030\007\031\037"
	.string	"\035#\001\013\001\036\033\022\f\023\t\b\376\375;=<?4\036\036,?9\030\026\035\027\367\033#\f\034\"\376\022\n\034\031\032\030\r\006\017\374\37319=;*%&->5\023\021\"\031\367 '\b\035#"
	.string	"\031\021\032\030\033\030\b\t\027\370\375A<67)\033\033&6.\022\026&\036"
	.ascii	"\035%\n\036#\004$\033!\037\026\021\t\023#\376\001"
	.type	EXPECTED_OUTPUT, @object
	.size	EXPECTED_OUTPUT, 32
EXPECTED_OUTPUT:
	.ascii	"\311\352\351\314\022\362\3736\272\004\033\315\326)\372;\342S"
	.ascii	"'\266\331\t\031=\024\036\370\335+\305\032\023"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	BIAS_DATA, @object
	.size	BIAS_DATA, 128
BIAS_DATA:
	.zero	128
	.type	OUTPUT_DATA, @object
	.size	OUTPUT_DATA, 32
OUTPUT_DATA:
	.zero	32
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
