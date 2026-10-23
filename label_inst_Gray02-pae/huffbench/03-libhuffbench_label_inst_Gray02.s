	.file	"libhuffbench.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	heap_adjust, @function
heap_adjust:
	srli	t5,a2,31
	addi	a1,a1,-4
	add	t5,t5,a2
	slli	a5,a3,2
	add	a5,a1,a5
	srai	t5,t5,1
	lw	t2,0(a5)
	bgt	a3,t5,.L2
	slli	t6,t2,2
	add	t6,a0,t6
	j	.L4
.L10:
	mv	a4,t3
	mv	a6,t4
	mv	a7,t0
.L3:
	lw	t3,0(t6)
	slli	a3,a3,2
	sub	a5,a5,a3
	bltu	t3,a6,.L2
.L11:
	sw	a7,0(a5)
	bgt	a4,t5,.L9
	mv	a3,a4
.L4:
	slli	a5,a3,3
	add	a5,a1,a5
	lw	a7,0(a5)
	slli	a4,a3,1
	addi	t3,a4,1
	slli	a6,a7,2
	add	a6,a0,a6
	lw	a6,0(a6)
	slli	t4,t3,2
	mv	t1,a5
	ble	a2,a4,.L3
	add	t1,a1,t4
	lw	t0,0(t1)
	slli	t4,t0,2
	add	t4,a0,t4
	lw	t4,0(t4)
	bltu	t4,a6,.L10
	lw	t3,0(t6)
	slli	a3,a3,2
	mv	t1,a5
	sub	a5,a5,a3
	bgeu	t3,a6,.L11
.L2:
	sw	t2,0(a5)
	ret
.L9:
	mv	a5,t1
	sw	t2,0(a5)
	ret
	.size	heap_adjust, .-heap_adjust
	.align	2
	.globl	compdecomp
	.type	compdecomp, @function
compdecomp:
	addi	sp,sp,-2032
	li	t0,-4096
	sw	s0,2024(sp)
	addi	t0,t0,-1632
	addi	s0,a1,1
	sw	s5,2004(sp)
	sw	ra,2028(sp)
	sw	s1,2020(sp)
	sw	s2,2016(sp)
	sw	s3,2012(sp)
	sw	s4,2008(sp)
	sw	s6,2000(sp)
	sw	s7,1996(sp)
	sw	s8,1992(sp)
	sw	s9,1988(sp)
	sw	s10,1984(sp)
	sw	s11,1980(sp)
	mv	s5,a0
	add	sp,sp,t0
	mv	a0,s0
	sw	a1,4(sp)
	sw	s5,12(sp)
	call	malloc_beebs
	sw	a0,8(sp)
	add	a4,a0,s0
	mv	a5,a0
	beq	s0,zero,.L16
.L15:
	addi	a5,a5,1
	sb	zero,-1(a5)
	bne	a5,a4,.L15
.L16:
	li	a4,4096
	addi	a5,a4,-496
	add	s0,a5,sp
	addi	a4,a4,1552
	mv	a5,s0
	add	s6,a4,sp
.L14:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	s6,a5,.L14
	addi	a5,sp,528
	addi	a4,sp,1552
.L17:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L17
	mv	s7,s6
	mv	a5,s6
.L18:
	li	a4,8192
	addi	a4,a4,-512
	addi	a3,sp,16
	sw	zero,0(a5)
	add	a4,a4,a3
	addi	a5,a5,4
	bne	a4,a5,.L18
	addi	s1,sp,1552
	addi	a4,s1,1024
	mv	a5,s1
.L19:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L19
	addi	s2,sp,16
	addi	a4,s2,256
	mv	a5,s2
.L20:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L20
	li	a5,4096
	addi	a5,a5,-496
	lw	a4,12(sp)
	add	a2,a5,sp
	lw	a5,4(sp)
	add	a1,a4,a5
	beq	a5,zero,.L24
.L23:
	lbu	a5,0(a4)
	addi	a4,a4,1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a3,0(a5)
	addi	a3,a3,1
	sw	a3,0(a5)
	bne	a4,a1,.L23
.L24:
	addi	a1,sp,-496
	mv	a3,s0
	li	s4,0
	li	a5,0
	li	a0,256
.L22:
	lw	a2,0(a3)
	slli	a4,s4,2
	add	a4,a1,a4
	beq	a2,zero,.L25
	sw	a5,1024(a4)
	addi	s4,s4,1
.L25:
	addi	a5,a5,1
	addi	a3,a3,4
	bne	a5,a0,.L22
	beq	s4,zero,.L26
	li	a5,4096
	addi	a5,a5,-496
	addi	s10,sp,528
	add	s9,a5,sp
	mv	s11,s4
.L27:
	mv	a3,s11
	mv	a2,s4
	mv	a1,s10
	mv	a0,s9
	addi	s11,s11,-1
	call	heap_adjust
	bne	s11,zero,.L27
	li	a5,1
	beq	s4,a5,.L28
	slli	t1,s4,2
	addi	a4,t1,1020
	addi	t1,t1,-4
	addi	s4,s4,255
	add	s8,s9,a4
	add	s11,s10,t1
	addi	s5,sp,-496
.L29:
	lw	a4,0(s11)
	addi	a2,s4,-256
	li	a3,1
	mv	a1,s10
	mv	a0,s9
	lw	s3,1024(s5)
	sw	a2,0(sp)
	sw	a4,1024(s5)
	call	heap_adjust
	lw	a4,1024(s5)
	slli	a3,s3,2
	add	a0,s9,a3
	slli	a4,a4,2
	add	a1,s9,a4
	lw	a0,0(a0)
	lw	a1,0(a1)
	lw	a2,0(sp)
	add	a3,s6,a3
	add	a1,a1,a0
	sw	s4,0(a3)
	sw	a1,0(s8)
	neg	a6,s4
	add	a4,s6,a4
	mv	a1,s10
	mv	a0,s9
	li	a3,1
	sw	s4,1024(s5)
	sw	a6,0(a4)
	call	heap_adjust
	addi	s4,s4,-1
	li	a5,256
	addi	s11,s11,-4
	addi	s8,s8,-4
	bne	s4,a5,.L29
.L28:
	li	a5,257
.L26:
	slli	a5,a5,2
	add	a5,s6,a5
	sw	zero,0(a5)
	addi	a6,s0,1024
	mv	a0,s2
	mv	a1,s1
	li	a7,0
	li	t1,0
	j	.L36
.L30:
	sw	a3,0(a1)
	sb	a4,0(a0)
	addi	s0,s0,4
	addi	a1,a1,4
	addi	a0,a0,1
	addi	s7,s7,4
	beq	s0,a6,.L122
.L36:
	lw	a3,0(s0)
	li	a4,0
	beq	a3,zero,.L30
	lw	a5,0(s7)
	li	a3,0
	beq	a5,zero,.L30
	li	a4,1
	li	a2,0
.L33:
	bge	a5,zero,.L32
	add	a3,a3,a4
	neg	a5,a5
.L32:
	slli	a5,a5,2
	add	a5,s6,a5
	lw	a5,0(a5)
	slli	a4,a4,1
	addi	a2,a2,1
	bne	a5,zero,.L33
	bgeu	t1,a3,.L34
	mv	t1,a3
.L34:
	andi	a4,a2,0xff
	bgeu	a7,a2,.L30
	sw	a3,0(a1)
	sb	a4,0(a0)
	addi	s0,s0,4
	mv	a7,a2
	addi	a1,a1,4
	addi	a0,a0,1
	addi	s7,s7,4
	bne	s0,a6,.L36
.L122:
	li	a5,32
	bgtu	a7,a5,.L12
	beq	t1,zero,.L12
	lw	a5,4(sp)
	beq	a5,zero,.L70
	lw	t5,12(sp)
	li	a4,4096
	addi	a4,a4,-496
	add	t4,a4,sp
	addi	t1,sp,-496
	add	t0,t5,a5
	li	a1,-1
	li	a4,0
	li	a7,0
	li	t6,1
	li	t3,7
.L44:
	lbu	a0,0(t5)
	add	a5,t1,a0
	lbu	a5,512(a5)
	addi	a3,a5,-1
	sll	a3,t6,a3
	beq	a5,zero,.L39
	li	a2,0
	j	.L43
.L40:
	addi	a1,a1,1
	andi	a4,a5,0xff
.L41:
	slli	a5,a0,2
	add	a5,t4,a5
	lw	a5,-2048(a5)
	add	a6,t1,a0
	addi	a2,a2,1
	and	a5,a3,a5
	beq	a5,zero,.L42
	ori	a4,a4,1
.L42:
	lbu	a5,512(a6)
	srli	a3,a3,1
	bleu	a5,a2,.L39
.L43:
	slli	a5,a4,1
	bne	a1,t3,.L40
	lw	a5,8(sp)
	add	a5,a5,a7
	sb	a4,0(a5)
	lw	a5,4(sp)
	addi	a7,a7,1
	beq	a5,a7,.L12
	lbu	a0,0(t5)
	li	a4,0
	li	a1,0
	j	.L41
.L12:
	li	t0,4096
	addi	t0,t0,1632
	add	sp,sp,t0
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	lw	s1,2020(sp)
	lw	s2,2016(sp)
	lw	s3,2012(sp)
	lw	s4,2008(sp)
	lw	s5,2004(sp)
	lw	s6,2000(sp)
	lw	s7,1996(sp)
	lw	s8,1992(sp)
	lw	s9,1988(sp)
	lw	s10,1984(sp)
	lw	s11,1980(sp)
	addi	sp,sp,2032
	jr	ra
.L39:
	addi	t5,t5,1
	bne	t0,t5,.L44
	li	a5,7
	sub	a5,a5,a1
	sll	a5,a4,a5
	lw	a4,8(sp)
	andi	a5,a5,0xff
	add	a7,a4,a7
.L38:
	li	a4,4096
	addi	a4,a4,-1520
	add	t3,a4,sp
	sb	a5,0(a7)
	addi	a4,t3,1024
	mv	a5,t3
.L45:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L45
	addi	t1,sp,272
	li	a6,0
	li	t5,1
	li	t4,256
	j	.L51
.L46:
	addi	a6,a6,1
	addi	s1,s1,4
	addi	s2,s2,1
	addi	t3,t3,4
	beq	a6,t4,.L123
.L51:
	lw	a0,0(s1)
	lbu	a1,0(s2)
	sb	a6,0(t1)
	addi	t1,t1,1
	or	a5,a0,a1
	beq	a5,zero,.L46
	addi	a3,a1,-1
	sll	a3,t5,a3
	li	a5,0
	beq	a1,zero,.L47
	li	a2,0
.L50:
	addi	a7,a5,1
	and	a4,a0,a3
	slli	a5,a5,1
	addi	a5,a5,1
	beq	a4,zero,.L49
	slli	a5,a7,1
.L49:
	addi	a2,a2,1
	srli	a3,a3,1
	bne	a1,a2,.L50
.L47:
	sw	a5,0(t3)
	j	.L46
.L123:
	li	a5,4096
	addi	a4,a5,-1516
	add	t0,a4,sp
	addi	a5,a5,-496
	mv	t1,t0
	addi	a6,sp,273
	add	t4,a5,sp
	addi	t5,sp,-496
	li	a7,1
	li	t6,256
.L55:
	lw	a0,0(t1)
	lbu	t3,0(a6)
	mv	a3,a6
	mv	a4,t1
	mv	a5,a7
.L52:
	lw	a2,-4(a4)
	mv	a1,a5
	addi	a5,a5,-1
	bleu	a2,a0,.L124
	lbu	a1,-1(a3)
	sw	a2,0(a4)
	addi	a3,a3,-1
	sb	a1,1(a3)
	addi	a4,a4,-4
	bne	a5,zero,.L52
.L53:
	slli	a4,a5,2
	add	a4,t4,a4
	add	a5,t5,a5
	addi	a7,a7,1
	sw	a0,-1024(a4)
	sb	t3,768(a5)
	addi	t1,t1,4
	addi	a6,a6,1
	bne	a7,t6,.L55
	lw	a0,-1024(t4)
	bne	a0,zero,.L72
.L57:
	lw	a5,0(t0)
	addi	t0,t0,4
	addi	a0,a0,1
	beq	a5,zero,.L57
.L56:
	lw	a5,4(sp)
	beq	a5,zero,.L67
	li	a5,4096
	lw	t3,8(sp)
	addi	a4,a5,-1520
	addi	a5,a5,-496
	add	a7,a4,sp
	add	t4,a5,sp
	addi	t5,sp,-496
	mv	a1,a0
	li	a2,0
	li	a6,128
	li	t1,0
	li	t6,1
.L58:
	lbu	a5,0(t3)
	and	a5,a5,a6
	beq	a5,zero,.L59
	addi	a2,a2,1
	slli	a2,a2,1
.L60:
	slli	a5,a1,2
	add	a5,t4,a5
	lw	a3,-1024(a5)
	addi	a4,a1,1
	slli	a5,a4,2
	add	a5,a7,a5
	bleu	a2,a3,.L62
.L61:
	lw	a3,0(a5)
	addi	a5,a5,4
	mv	a1,a4
	addi	a4,a4,1
	bltu	a3,a2,.L61
.L62:
	beq	a2,a3,.L125
	beq	a6,t6,.L65
.L126:
	srli	a6,a6,1
.L66:
	lw	a5,4(sp)
	bltu	t1,a5,.L58
.L67:
	li	t0,4096
	addi	t0,t0,1632
	lw	a0,8(sp)
	add	sp,sp,t0
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	lw	s1,2020(sp)
	lw	s2,2016(sp)
	lw	s3,2012(sp)
	lw	s4,2008(sp)
	lw	s5,2004(sp)
	lw	s6,2000(sp)
	lw	s7,1996(sp)
	lw	s8,1992(sp)
	lw	s9,1988(sp)
	lw	s10,1984(sp)
	lw	s11,1980(sp)
	addi	sp,sp,2032
	tail	free_beebs
.L125:
	add	a1,t5,a1
	lbu	a5,768(a1)
	lw	a4,12(sp)
	addi	t1,t1,1
	mv	a1,a0
	sb	a5,0(a4)
	addi	a5,a4,1
	sw	a5,12(sp)
	li	a2,0
	bne	a6,t6,.L126
.L65:
	addi	t3,t3,1
	li	a6,128
	j	.L66
.L124:
	mv	a5,a1
	j	.L53
.L59:
	slli	a2,a2,1
	addi	a2,a2,1
	j	.L60
.L70:
	lw	a7,8(sp)
	li	a5,0
	j	.L38
.L72:
	li	a0,0
	j	.L56
	.size	compdecomp, .-compdecomp
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	beq	a1,zero,.L139
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	lui	s3,%hi(.LANCHOR1)
	lui	s4,%hi(.LANCHOR0)
	lui	s0,%hi(.LANCHOR0+500)
	sw	s2,32(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	ra,44(sp)
	sw	s1,36(sp)
	mv	s2,a1
	mv	s7,a0
	addi	s6,s4,%lo(.LANCHOR0)
	addi	s3,s3,%lo(.LANCHOR1)
	addi	s0,s0,%lo(.LANCHOR0+500)
	li	s8,0
	lui	s5,%hi(heap)
.L131:
	li	s1,0
.L130:
	li	a1,8192
	addi	a0,s5,%lo(heap)
	call	init_heap_beebs
	mv	a5,s6
	mv	a4,s3
.L129:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	s0,a5,.L129
	li	a1,500
	addi	a0,s4,%lo(.LANCHOR0)
	addi	s1,s1,1
	call	compdecomp
	bne	s1,s2,.L130
	addi	s8,s8,1
	bne	s7,s8,.L131
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	addi	sp,sp,48
	jr	ra
.L139:
	ret
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lui	a4,%hi(.LANCHOR1)
	addi	a1,a5,500
	addi	a4,a4,%lo(.LANCHOR1)
.L145:
	lbu	a3,0(a5)
	lbu	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a3,a2,.L147
	bne	a5,a1,.L145
	li	a0,1
	ret
.L147:
	sub	a3,a3,a2
	seqz	a0,a3
	ret
	.size	verify_benchmark, .-verify_benchmark
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
	mv	a1,a0
	li	a0,1
	tail	benchmark_body.isra.0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	addi	sp,sp,-16
	li	a0,11
	li	a1,1
	sw	ra,12(sp)
	call	benchmark_body.isra.0
	lw	ra,12(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	benchmark, .-benchmark
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	orig_data, @object
	.size	orig_data, 500
orig_data:
	.ascii	"J2OZF50FYLD5UTVYYRMT0VXO01VC5FNIB1CG12MTIPT2CIV00BOUWFDRAYTA"
	.ascii	"3AI42KFXHRKPA3LCGA3ABLUYQXJRQ2RN2ZMYERPLC00CXFE3GB3HMS53JIOZ"
	.ascii	"E5HBYTZ2EJHGDBI0HMYNOVU0HUXR2FKBERC3E1ZIEBOHCWCJD0WRPLLX5DI1"
	.ascii	"IS2NE4KI0DR4E5GHWIQZCHKRSVIRYQMBDJOHHYPB1AAAAGHWOXPQ4ZBQOKBH"
	.ascii	"0OI3XWE4OUAJUAJUGQKUIZEGSFXBPYIKGQH3GM2UA23U2HJCXTW5N0G553AP"
	.ascii	"VIZ2YAZ4MVSMRQBNXKPO3FOK5UK5RKOGTHCLH2KUR2ADMBQDLASJFATFU3EF"
	.ascii	"ISL1ZOGAKQU1NV4ZWP3CPPLUP4ZD23IEPT5IBFJLW3HDSF2JUZLDIWYXUR0Q"
	.ascii	"PCU4WTHXZQDPNKSAPOJEIUHQK5I4RCPAFD41XFSQVV5D5RDP5MTHA0YK0AIL"
	.ascii	"CXLH1JCSPVCEKBHKSKZR"
	.bss
	.align	4
	.set	.LANCHOR0,. + 0
	.type	test_data, @object
	.size	test_data, 500
test_data:
	.zero	500
	.zero	12
	.type	heap, @object
	.size	heap, 8192
heap:
	.zero	8192
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
