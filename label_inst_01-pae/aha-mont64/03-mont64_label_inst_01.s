	.file	"mont64.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	mulul64
	.type	mulul64, @function
mulul64:
	mul	a6,a1,a2
	mulhu	t1,a0,a2
	mul	a7,a0,a3
	add	t1,a6,t1
	sltu	a6,t1,a6
	mulhu	t4,a1,a2
	add	t1,a7,t1
	sw	t1,4(a5)
	sltu	a7,t1,a7
	mulhu	t3,a0,a3
	add	a6,a6,t4
	mul	t1,a1,a3
	add	a7,a7,t3
	mulhu	a1,a1,a3
	add	a6,t1,a6
	add	a7,a6,a7
	sltu	t1,a6,t1
	sltu	a6,a7,a6
	mul	a0,a0,a2
	add	t1,t1,a1
	add	a6,a6,t1
	sw	a0,0(a5)
	sw	a6,4(a4)
	sw	a7,0(a4)
	ret
	.size	mulul64, .-mulul64
	.align	2
	.globl	modul64
	.type	modul64, @function
modul64:
	addi	sp,sp,-16
	sw	s0,12(sp)
	li	t3,0
	li	t0,64
.L6:
	srli	a7,a0,31
	slli	a6,a1,1
	or	a6,a7,a6
	srai	t1,a1,31
	srli	t4,a3,31
	slli	a7,a3,1
	slli	a0,a0,1
	srli	a3,a2,31
	or	a0,t4,a0
	or	a7,a3,a7
	or	t4,t1,a6
	mv	a1,a6
	addi	t3,t3,1
	slli	a2,a2,1
	or	t1,t1,a0
	mv	a3,a7
	bgtu	a5,t4,.L4
	sub	t6,a0,a4
	addi	t5,a2,1
	sgtu	s0,t6,a0
	sltu	t2,t5,a2
	sub	a6,a6,a5
	bne	a5,t4,.L7
	bgtu	a4,t1,.L4
.L7:
	mv	a0,t6
	sub	a1,a6,s0
	mv	a2,t5
	add	a3,t2,a7
.L4:
	bne	t3,t0,.L6
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	modul64, .-modul64
	.align	2
	.globl	montmul
	.type	montmul, @function
montmul:
	mul	t4,a1,a2
	mulhu	t3,a0,a2
	mul	t6,a0,a3
	add	t3,t4,t3
	sltu	t4,t3,t4
	mul	t5,a0,a2
	add	t3,t6,t3
	sltu	t6,t3,t6
	mulhu	a2,a1,a2
	mul	t0,t3,a6
	add	t4,t4,a2
	mul	t1,a7,t5
	mulhu	a7,a6,t5
	add	t1,t1,t0
	mul	a6,a6,t5
	add	t1,t1,a7
	mulhu	a0,a0,a3
	mul	a2,a1,a3
	add	t6,t6,a0
	add	a2,t4,a2
	mul	a7,t1,a4
	add	a0,a2,t6
	sltu	t6,a2,t4
	sltu	t0,a0,a2
	mulhu	t2,a6,a4
	mul	t4,a6,a5
	add	t2,a7,t2
	sltu	a2,t2,a7
	mulhu	a1,a1,a3
	add	a3,t6,a1
	add	t6,t4,t2
	mulhu	a1,t1,a4
	add	a7,t0,a3
	sltu	a3,t6,t4
	mul	t4,t1,a5
	add	a2,a2,a1
	mulhu	t1,t1,a5
	add	a1,t4,a0
	add	a2,a1,a2
	sltu	t4,a1,t4
	sltu	a1,a2,a1
	mulhu	t0,a6,a5
	add	t1,t1,a7
	add	t4,t4,t1
	add	a1,a1,t4
	mul	a6,a6,a4
	add	a3,a3,t0
	add	a3,a2,a3
	sltu	a2,a3,a2
	add	a2,a2,a1
	mv	t1,a2
	mv	a1,a3
	add	t4,a6,t5
	sltu	a6,t4,a6
	add	a6,a6,t3
	add	a6,a6,t6
	bgtu	t3,a6,.L19
	beq	t3,a6,.L20
.L11:
	xor	a2,t1,a7
	xor	a3,a1,a0
	or	a3,a3,a2
	seqz	a3,a3
	li	a2,1
	bgtu	t3,a6,.L13
	beq	t3,a6,.L21
	li	a2,0
.L13:
	and	a3,a3,a2
	li	a2,1
	bgtu	a7,t1,.L15
	beq	a7,t1,.L22
	li	a2,0
.L15:
	li	a0,1
	bgtu	a5,t1,.L18
	beq	a5,t1,.L23
.L17:
	or	a2,a2,a0
	or	a3,a3,a2
	andi	a3,a3,0xff
	neg	a0,a3
	and	a0,a0,a4
	neg	a3,a3
	sub	a0,a1,a0
	and	a5,a3,a5
	sgtu	a1,a0,a1
	sub	a5,t1,a5
	sub	a1,a5,a1
	ret
.L23:
	bleu	a4,a1,.L17
.L18:
	li	a0,0
	j	.L17
.L20:
	bleu	t5,t4,.L11
.L19:
	addi	a1,a3,1
	sltu	a3,a1,a3
	add	t1,a3,a2
	j	.L11
.L21:
	bgtu	t5,t4,.L13
	li	a2,0
	j	.L13
.L22:
	bgtu	a0,a1,.L15
	li	a2,0
	j	.L15
	.size	montmul, .-montmul
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-128
	lui	a3,%hi(in_a)
	lui	a2,%hi(in_b)
	sw	s8,88(sp)
	sw	s9,84(sp)
	lw	s8,%lo(in_a)(a3)
	lw	s9,%lo(in_b)(a2)
	sw	s11,76(sp)
	lw	s11,%lo(in_a+4)(a3)
	mul	a3,s8,s9
	lui	a4,%hi(in_m)
	sw	s0,120(sp)
	sw	s4,104(sp)
	sw	s10,80(sp)
	sw	ra,124(sp)
	lw	t4,%lo(in_b+4)(a2)
	lw	s4,%lo(in_m)(a4)
	lw	s0,%lo(in_m+4)(a4)
	mv	s10,a1
	sw	a3,32(sp)
	mv	a7,a0
	mulhu	a3,s8,s9
	beq	a1,zero,.L25
	sw	s2,112(sp)
	sw	s3,108(sp)
	sw	s6,96(sp)
	sw	s1,116(sp)
	sw	s5,100(sp)
	sw	s7,92(sp)
	li	s2,0
	li	s3,64
	mul	a5,s11,s9
	li	s6,-2147483648
	mul	a4,s8,t4
	add	a3,a5,a3
	sltu	a5,a3,a5
	mulhu	a2,s11,s9
	add	t5,a4,a3
	sltu	a3,t5,a4
	mulhu	a1,s8,t4
	add	a5,a5,a2
	mul	a4,s11,t4
	add	a3,a3,a1
	mulhu	a2,s11,t4
	add	a4,a5,a4
	sltu	a5,a4,a5
	add	t6,a4,a3
	sltu	a4,t6,a4
	add	a5,a5,a2
	add	a5,a4,a5
	sw	a5,36(sp)
.L48:
	li	s7,0
	sw	s2,40(sp)
	sw	a7,44(sp)
	sw	t4,12(sp)
	sw	t5,16(sp)
	sw	t6,20(sp)
.L47:
	lw	a2,32(sp)
	lw	a6,16(sp)
	lw	a5,20(sp)
	lw	a3,36(sp)
	li	a7,0
.L28:
	srli	a1,a5,31
	slli	a4,a3,1
	or	a4,a1,a4
	srai	a0,a3,31
	srli	t1,a6,31
	slli	a1,a6,1
	slli	a5,a5,1
	srli	a6,a2,31
	or	a5,t1,a5
	or	a1,a6,a1
	or	t1,a0,a4
	mv	a3,a4
	addi	a7,a7,1
	slli	a2,a2,1
	or	a0,a0,a5
	mv	a6,a1
	bgtu	s0,t1,.L26
	sub	t4,a5,s4
	addi	t3,a2,1
	sgtu	t6,t4,a5
	sltu	t5,t3,a2
	sub	a4,a4,s0
	bne	s0,t1,.L51
	bgtu	s4,a0,.L26
.L51:
	mv	a5,t4
	sub	a3,a4,t6
	mv	a2,t3
	add	a6,t5,a1
.L26:
	bne	a7,s3,.L28
	mul	a2,a3,a5
	li	a7,0
	mulhu	a4,a5,a5
	mulhu	t1,a3,a5
	add	a6,a4,a2
	sltu	a4,a6,a4
	add	a6,a2,a6
	sltu	a1,a6,a2
	mul	a0,a3,a3
	add	a2,a4,t1
	add	a4,a1,t1
	mulhu	a3,a3,a3
	add	a1,a2,a0
	sltu	a2,a1,a2
	add	a4,a1,a4
	sltu	a1,a4,a1
	mul	a5,a5,a5
	add	a3,a2,a3
	add	a2,a1,a3
.L31:
	srli	a1,a4,31
	slli	a3,a2,1
	or	a3,a1,a3
	srai	a0,a2,31
	srli	t1,a6,31
	slli	a1,a6,1
	slli	a4,a4,1
	srli	a6,a5,31
	or	a4,t1,a4
	or	a1,a6,a1
	or	t1,a0,a3
	mv	a2,a3
	addi	a7,a7,1
	slli	a5,a5,1
	or	a0,a0,a4
	mv	a6,a1
	bgtu	s0,t1,.L29
	sub	t4,a4,s4
	addi	t3,a5,1
	sgtu	t6,t4,a4
	sltu	t5,t3,a5
	sub	a3,a3,s0
	bne	s0,t1,.L52
	bgtu	s4,a0,.L29
.L52:
	mv	a4,t4
	sub	a2,a3,t6
	mv	a5,t3
	add	a6,t5,a1
.L29:
	bne	a7,s3,.L31
	mul	a3,a2,a4
	li	s2,0
	mulhu	a5,a4,a4
	add	a1,a5,a3
	mulhu	a0,a2,a4
	sltu	a5,a1,a5
	add	a1,a3,a1
	sltu	s1,a1,a3
	mul	a3,a2,a2
	add	a5,a5,a0
	add	s1,s1,a0
	mulhu	a2,a2,a2
	add	a3,a5,a3
	sltu	a5,a3,a5
	add	s1,a3,s1
	sltu	a3,s1,a3
	mul	a4,a4,a4
	add	a5,a5,a2
	add	s5,a3,a5
.L34:
	srli	a3,s1,31
	slli	a5,s5,1
	or	a5,a3,a5
	srai	a2,s5,31
	srli	a0,a1,31
	slli	a3,a1,1
	slli	s1,s1,1
	srli	a1,a4,31
	or	s1,a0,s1
	or	a3,a1,a3
	or	a0,a2,a5
	mv	s5,a5
	addi	s2,s2,1
	slli	a4,a4,1
	or	a2,a2,s1
	mv	a1,a3
	bgtu	s0,a0,.L32
	sub	a7,s1,s4
	addi	a6,a4,1
	sgtu	t3,a7,s1
	sltu	t1,a6,a4
	sub	a5,a5,s0
	bne	s0,a0,.L53
	bgtu	s4,a2,.L32
.L53:
	mv	s1,a7
	sub	s5,a5,t3
	mv	a4,a6
	add	a1,t1,a3
.L32:
	bne	s2,s3,.L34
	li	a2,0
	li	a3,0
	li	a4,1
	li	a5,0
	j	.L37
.L74:
	addi	s2,s2,-1
	or	a4,t3,t1
	mv	a5,t5
	beq	s2,zero,.L73
.L37:
	xor	a0,s0,a5
	xor	a1,s4,a4
	slli	a7,a0,31
	srli	a1,a1,1
	and	a6,s4,a4
	or	a1,a7,a1
	srli	a0,a0,1
	and	a7,s0,a5
	slli	t6,a3,31
	srli	t5,a2,1
	add	a1,a6,a1
	srli	t4,a3,1
	add	a7,a7,a0
	andi	a0,a4,1
	or	a2,t6,t5
	slli	t3,a5,31
	srli	t1,a4,1
	srli	t5,a5,1
	sltu	a6,a1,a6
	mv	a3,t4
	beq	a0,zero,.L74
	addi	s2,s2,-1
	mv	a4,a1
	add	a5,a6,a7
	add	a3,s6,t4
	bne	s2,zero,.L37
.L73:
	sw	a4,48(sp)
	sw	a5,52(sp)
	sw	a2,56(sp)
	sw	a3,60(sp)
	lw	a4,48(sp)
	lw	a5,52(sp)
	lw	a5,56(sp)
	lw	a6,60(sp)
	li	a7,0
	sw	a5,24(sp)
	sw	a6,28(sp)
	mv	a0,s8
	mv	a1,s11
	li	a4,0
	li	a6,0
.L40:
	srli	a3,a0,31
	slli	a5,a1,1
	or	a5,a3,a5
	srli	a2,a4,31
	srai	a3,a1,31
	srli	t3,a6,31
	slli	t1,a6,1
	slli	a0,a0,1
	or	t1,a2,t1
	or	a0,t3,a0
	or	a2,a3,a5
	mv	a1,a5
	addi	a7,a7,1
	slli	a4,a4,1
	or	a3,a3,a0
	mv	a6,t1
	bgtu	s0,a2,.L38
	sub	t4,a0,s4
	addi	t3,a4,1
	sgtu	t6,t4,a0
	sltu	t5,t3,a4
	sub	a5,a5,s0
	bne	s0,a2,.L54
	bgtu	s4,a3,.L38
.L54:
	mv	a0,t4
	sub	a1,a5,t6
	mv	a4,t3
	add	a6,t5,t1
.L38:
	bne	a7,s3,.L40
	lw	a3,12(sp)
	li	t3,0
	mv	a2,s9
	li	a4,0
	li	t1,0
.L43:
	srli	a6,a2,31
	slli	a5,a3,1
	or	a5,a6,a5
	srai	a7,a3,31
	srli	t4,t1,31
	slli	a6,t1,1
	slli	a2,a2,1
	srli	t1,a4,31
	or	a2,t4,a2
	or	a6,t1,a6
	or	t4,a7,a5
	mv	a3,a5
	addi	t3,t3,1
	slli	a4,a4,1
	or	a7,a7,a2
	mv	t1,a6
	bgtu	s0,t4,.L41
	sub	t6,a2,s4
	addi	t5,a4,1
	sgtu	t2,t6,a2
	sltu	t0,t5,a4
	sub	a5,a5,s0
	bne	s0,t4,.L55
	bgtu	s4,a7,.L41
.L55:
	mv	a2,t6
	sub	a3,a5,t2
	mv	a4,t5
	add	t1,t0,a6
.L41:
	bne	t3,s3,.L43
	lw	a6,56(sp)
	lw	a7,60(sp)
	mv	a4,s4
	mv	a5,s0
	call	montmul
	lw	a6,56(sp)
	lw	a7,60(sp)
	mv	a2,a0
	mv	a3,a1
	mv	a4,s4
	mv	a5,s0
	call	montmul
	lw	a6,56(sp)
	lw	a7,60(sp)
	mv	a2,a0
	mv	a3,a1
	mv	a5,s0
	mv	a4,s4
	call	montmul
	lw	t3,48(sp)
	lw	t4,52(sp)
	mul	a2,a1,t3
	mulhu	a6,a0,t3
	mulhu	t1,a1,t3
	add	a6,a2,a6
	sltu	a2,a6,a2
	mul	a3,a0,t4
	add	a2,a2,t1
	mul	a7,a1,t4
	add	a6,a3,a6
	sltu	a3,a6,a3
	mulhu	t1,a0,t4
	add	a7,a2,a7
	sltu	a2,a7,a2
	mulhu	a1,a1,t4
	add	a5,a3,t1
	add	a5,a7,a5
	sltu	a3,a5,a7
	mul	a0,a0,t3
	add	a2,a2,a1
	add	a3,a3,a2
.L46:
	srli	a2,a5,31
	slli	a4,a3,1
	or	a4,a2,a4
	srli	a1,a0,31
	srai	a2,a3,31
	srli	t1,a6,31
	slli	a7,a6,1
	slli	a5,a5,1
	or	a7,a1,a7
	or	a5,t1,a5
	or	a1,a2,a4
	mv	a3,a4
	addi	s2,s2,1
	slli	a0,a0,1
	or	a2,a2,a5
	mv	a6,a7
	bgtu	s0,a1,.L44
	sub	t3,a5,s4
	addi	t1,a0,1
	sgtu	t5,t3,a5
	sltu	t4,t1,a0
	sub	a4,a4,s0
	bne	s0,a1,.L56
	bgtu	s4,a2,.L44
.L56:
	mv	a5,t3
	sub	a3,a4,t5
	mv	a0,t1
	add	a6,t4,a7
.L44:
	bne	s2,s3,.L46
	addi	s7,s7,1
	bne	s10,s7,.L47
	lw	s2,40(sp)
	lw	a7,44(sp)
	lw	t4,12(sp)
	addi	s2,s2,1
	lw	t5,16(sp)
	lw	t6,20(sp)
	bne	a7,s2,.L48
	lw	a0,24(sp)
	lw	a1,28(sp)
	xor	s5,s5,a3
	mul	s0,s0,a0
	xor	a5,s1,a5
	or	a5,a5,s5
	lw	s1,116(sp)
	lw	s2,112(sp)
	lw	s3,108(sp)
	lw	s5,100(sp)
	lw	s6,96(sp)
	lw	s7,92(sp)
	snez	a5,a5
	mul	a3,a1,s4
	mulhu	a2,a0,s4
	add	a3,a3,s0
	mul	a4,a0,s4
	add	a3,a3,a2
	and	a4,a4,a3
	addi	a4,a4,1
	snez	a4,a4
	or	a5,a4,a5
.L24:
	lw	ra,124(sp)
	lw	s0,120(sp)
	lw	s4,104(sp)
	lw	s8,88(sp)
	lw	s9,84(sp)
	lw	s10,80(sp)
	lw	s11,76(sp)
	mv	a0,a5
	addi	sp,sp,128
	jr	ra
.L25:
	addi	s10,s10,1
	beq	a7,s10,.L24
	addi	s10,s10,1
	bne	a7,s10,.L25
	j	.L24
	.size	benchmark_body, .-benchmark_body
	.align	2
	.globl	xbinGCD
	.type	xbinGCD, @function
xbinGCD:
	or	a6,a0,a1
	beq	a6,zero,.L81
	addi	sp,sp,-48
	sw	s1,40(sp)
	sw	s0,44(sp)
	sw	s2,36(sp)
	sw	s3,32(sp)
	sw	s4,28(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	mv	t6,a0
	mv	s1,a1
	li	t3,0
	li	t4,0
	li	t1,1
	li	t2,0
	j	.L80
.L88:
	or	a6,t0,s2
	or	t1,s4,s3
	mv	t2,s6
	beq	a6,zero,.L87
.L80:
	xor	a7,a3,t2
	xor	a6,a2,t1
	slli	t5,a7,31
	slli	s6,t4,31
	srli	s5,t3,1
	srli	a6,a6,1
	or	a6,t5,a6
	slli	s2,s1,31
	or	t3,s6,s5
	and	t5,a2,t1
	srli	t0,t6,1
	add	s0,a6,t5
	and	t6,a3,t2
	or	t0,s2,t0
	srli	a7,a7,1
	srli	s2,s1,1
	add	s5,t3,a0
	srli	s1,t4,1
	andi	t5,t1,1
	add	a7,a7,t6
	mv	t4,s1
	add	s7,s1,a1
	slli	s4,t2,31
	srli	s3,t1,1
	srli	s6,t2,1
	sltu	a6,s0,a6
	mv	t6,t0
	sltu	s8,s5,t3
	mv	s1,s2
	beq	t5,zero,.L88
	add	t2,a6,a7
	or	a6,t0,s2
	mv	t1,s0
	mv	t3,s5
	add	t4,s8,s7
	bne	a6,zero,.L80
.L87:
	sw	t1,0(a4)
	sw	t2,4(a4)
	lw	s0,44(sp)
	sw	t3,0(a5)
	sw	t4,4(a5)
	lw	s1,40(sp)
	lw	s2,36(sp)
	lw	s3,32(sp)
	lw	s4,28(sp)
	lw	s5,24(sp)
	lw	s6,20(sp)
	lw	s7,16(sp)
	lw	s8,12(sp)
	addi	sp,sp,48
	jr	ra
.L81:
	li	t1,1
	sw	t1,0(a4)
	li	t2,0
	sw	t2,4(a4)
	sw	a0,0(a5)
	sw	a1,4(a5)
	ret
	.size	xbinGCD, .-xbinGCD
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	mv	a1,a0
	li	a0,1
	tail	benchmark_body
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	li	a1,1
	li	a0,472
	tail	benchmark_body
	.size	benchmark, .-benchmark
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	lui	a3,%hi(.LC0)
	lui	a4,%hi(.LC1)
	lui	a5,%hi(.LC2)
	lw	t1,%lo(.LC0)(a3)
	lw	t2,%lo(.LC0+4)(a3)
	lw	a0,%lo(.LC1)(a4)
	lw	a1,%lo(.LC1+4)(a4)
	lw	a2,%lo(.LC2)(a5)
	lw	a3,%lo(.LC2+4)(a5)
	lui	a6,%hi(in_m)
	lui	a4,%hi(in_b)
	lui	a5,%hi(in_a)
	sw	t1,%lo(in_m)(a6)
	sw	t2,%lo(in_m+4)(a6)
	sw	a0,%lo(in_b)(a4)
	sw	a1,%lo(in_b+4)(a4)
	sw	a2,%lo(in_a)(a5)
	sw	a3,%lo(in_a+4)(a5)
	ret
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	seqz	a0,a0
	ret
	.size	verify_benchmark, .-verify_benchmark
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	958986399
	.word	-85440217
	.align	3
.LC1:
	.word	-1187838605
	.word	343109103
	.align	3
.LC2:
	.word	-2027716625
	.word	88684321
	.section	.sbss,"aw",@nobits
	.align	3
	.type	in_m, @object
	.size	in_m, 8
in_m:
	.zero	8
	.type	in_b, @object
	.size	in_b, 8
in_b:
	.zero	8
	.type	in_a, @object
	.size	in_a, 8
in_a:
	.zero	8
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
