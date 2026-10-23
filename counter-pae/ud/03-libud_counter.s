	.file	"libud.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	lui	a5,%hi(.LANCHOR1)
	addi	sp,sp,-80
	addi	a5,a5,%lo(.LANCHOR1)
	addi	a3,a5,80
	mv	a4,sp
.L2:
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	sw	a7,0(a4)
	sw	a6,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,a3,.L2
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	mv	a4,sp
	addi	a1,a5,80
.L5:
	lbu	a3,0(a5)
	lbu	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a3,a2,.L10
	bne	a5,a1,.L5
	seqz	a0,a0
	addi	sp,sp,80
	jr	ra
.L10:
	sub	a3,a3,a2
	or	a0,a0,a3
	seqz	a0,a0
	addi	sp,sp,80
	jr	ra
	.size	verify_benchmark, .-verify_benchmark
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	ret
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	ludcmp
	.type	ludcmp, @function
ludcmp:
	addi	sp,sp,-448
	sw	s1,440(sp)
	lui	s1,%hi(.LANCHOR0)
	sw	s6,420(sp)
	addi	s1,s1,%lo(.LANCHOR0)
	lw	s6,80(s1)
	mv	t6,a1
	ble	a1,zero,.L13
	sw	s3,432(sp)
	slli	s3,a1,2
	sw	s2,436(sp)
	add	a7,s3,a1
	addi	s2,a1,20
	li	t5,0
	sw	s0,444(sp)
	sw	s4,428(sp)
	addi	s0,s1,240
	sw	s5,424(sp)
	sw	s7,416(sp)
	addi	s5,s1,160
	slli	a7,a7,4
	slli	s2,s2,2
	sw	s8,412(sp)
	sw	s9,408(sp)
	addi	t5,t5,1
	add	a7,a7,s0
	add	t3,s5,s2
	mv	t2,s0
	mv	a6,s5
	mv	t1,s0
	mv	t0,a1
	li	s7,0
	li	t4,0
	addi	s4,s1,156
	blt	t6,t5,.L14
.L44:
	mv	a0,t2
.L19:
	lw	a2,0(a0)
	bne	t4,zero,.L43
	lw	a5,0(a6)
	addi	a0,a0,80
	div	a5,a2,a5
	sw	a5,-80(a0)
	bne	a0,a7,.L19
.L17:
	addi	a6,a6,84
	addi	s8,s7,-80
	mv	a0,a6
	mv	s7,t2
.L21:
	lw	a2,4(s7)
	add	a5,s8,a0
	mv	a3,t1
.L20:
	lw	a4,0(a3)
	lw	a1,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	mul	a4,a4,a1
	sub	a2,a2,a4
	bne	a5,a0,.L20
	sw	a2,4(s7)
	addi	s7,s7,4
	addi	a0,a5,4
	bne	s7,t3,.L21
	addi	t4,t4,1
	addi	t3,t3,80
	addi	t1,t1,80
	addi	t2,t2,84
	addi	a7,a7,4
	beq	t6,t5,.L14
	addi	t5,t5,1
	mv	s7,s8
	bge	t6,t5,.L44
.L14:
	addi	a0,sp,4
	addi	t1,s2,-80
	sw	s6,0(sp)
	add	t3,a0,t1
	addi	a6,s1,84
	mv	a7,sp
.L25:
	lw	a2,0(a6)
	mv	a5,a7
	mv	a3,s0
.L24:
	lw	a4,0(a3)
	lw	a1,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	mul	a4,a4,a1
	sub	a2,a2,a4
	bne	a5,a0,.L24
	sw	a2,0(a5)
	addi	a0,a5,4
	addi	a6,a6,4
	addi	s0,s0,80
	bne	a0,t3,.L25
	li	a3,84
	mul	a4,t6,a3
	add	a5,a7,s3
	lw	a5,0(a5)
	addi	a6,t6,-1
	addi	s2,s2,-84
	add	s3,s1,s3
	addi	a0,s1,4
	add	a0,a0,t1
	add	a7,a7,s2
	add	t1,s1,t1
	add	a4,s1,a4
	lw	a4,160(a4)
	mul	a6,a6,a3
	div	a5,a5,a4
	addi	a6,a6,4
	add	a6,s5,a6
	sw	a5,0(s3)
.L28:
	lw	a2,0(a7)
	blt	t6,t0,.L26
	mv	a5,t1
	mv	a3,a6
.L27:
	lw	a4,0(a3)
	lw	a1,0(a5)
	addi	a5,a5,4
	addi	a3,a3,4
	mul	a4,a4,a1
	sub	a2,a2,a4
	bne	a0,a5,.L27
	lw	a5,-4(a6)
	addi	t0,t0,-1
	addi	a7,a7,-4
	div	a2,a2,a5
	addi	a6,a6,-84
	addi	t1,t1,-4
	sw	a2,0(t1)
	bne	t0,zero,.L28
	lw	s0,444(sp)
	lw	s2,436(sp)
	lw	s3,432(sp)
	lw	s4,428(sp)
	lw	s5,424(sp)
	lw	s7,416(sp)
	lw	s8,412(sp)
	lw	s9,408(sp)
	lw	s1,440(sp)
	lw	s6,420(sp)
	li	a0,0
	addi	sp,sp,448
	jr	ra
.L43:
	neg	s8,t5
	slli	s8,s8,2
	addi	s9,s8,4
	sub	s8,s4,s8
.L18:
	add	a3,a0,s9
	mv	a5,s8
.L16:
	lw	a4,0(a3)
	lw	a1,0(a5)
	addi	a5,a5,80
	addi	a3,a3,4
	mul	a4,a4,a1
	sub	a2,a2,a4
	bne	a5,a6,.L16
	lw	a5,0(a6)
	addi	a0,a0,80
	div	a5,a2,a5
	sw	a5,-80(a0)
	beq	a0,a7,.L17
	lw	a2,0(a0)
	j	.L18
.L26:
	lw	a5,-4(a6)
	addi	a7,a7,-4
	addi	t0,t0,-1
	div	a2,a2,a5
	addi	a6,a6,-84
	addi	t1,t1,-4
	sw	a2,0(t1)
	j	.L28
.L13:
	li	a5,84
	mul	a5,a1,a5
	slli	t6,a1,2
	sw	s6,0(sp)
	add	a4,t6,sp
	lw	a4,0(a4)
	add	t6,s1,t6
	lw	s6,420(sp)
	li	a0,0
	add	a5,s1,a5
	lw	a5,160(a5)
	lw	s1,440(sp)
	div	a5,a4,a5
	sw	a5,0(t6)
	addi	sp,sp,448
	jr	ra
	.size	ludcmp, .-ludcmp
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-48
	sw	s1,36(sp)
	sw	ra,44(sp)
	lui	s1,%hi(chkerr)
	beq	a1,zero,.L47
	sw	s2,32(sp)
	sw	s3,28(sp)
	lui	s2,%hi(.LANCHOR0+160)
	lui	s3,%hi(.LANCHOR0+80)
	sw	s0,40(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	mv	s0,a1
	mv	s5,a0
	addi	s3,s3,%lo(.LANCHOR0+80)
	addi	s2,s2,%lo(.LANCHOR0+160)
	li	s4,0
	lui	s1,%hi(chkerr)
	li	s7,-2
	li	s6,6
.L46:
	li	s8,0
.L53:
	mv	t3,s3
	mv	t1,s2
	li	a6,8
	li	a0,0
.L51:
	addi	a5,a0,2
	mv	a3,t1
	li	a1,0
	sub	a7,s7,a0
	j	.L50
.L59:
	sw	a5,0(a3)
	addi	a5,a5,1
	add	a1,a1,a2
	addi	a3,a3,4
	beq	a6,a5,.L58
.L50:
	add	a4,a7,a5
	mv	a2,a5
	bne	a0,a4,.L59
	slli	a2,a5,1
	sw	a2,0(a3)
	addi	a5,a5,1
	add	a1,a1,a2
	addi	a3,a3,4
	bne	a6,a5,.L50
.L58:
	sw	a1,0(t3)
	addi	a0,a0,1
	addi	t3,t3,4
	addi	a6,a6,1
	addi	t1,t1,80
	bne	a0,s6,.L51
	li	a1,5
	li	a0,20
	call	ludcmp
	addi	s8,s8,1
	sw	zero,%lo(chkerr)(s1)
	bne	s0,s8,.L53
	addi	s4,s4,1
	bne	s5,s4,.L46
	lw	s0,40(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
.L47:
	lw	ra,44(sp)
	lw	a0,%lo(chkerr)(s1)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	benchmark_body, .-benchmark_body
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
	li	a0,1785
	tail	benchmark_body
	.size	benchmark, .-benchmark
	.globl	chkerr
	.globl	x
	.globl	b
	.globl	a
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
.LC0:
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	x, @object
	.size	x, 80
x:
	.zero	80
	.type	b, @object
	.size	b, 80
b:
	.zero	80
	.type	a, @object
	.size	a, 1600
a:
	.zero	1600
	.section	.sbss,"aw",@nobits
	.align	2
	.type	chkerr, @object
	.size	chkerr, 4
chkerr:
	.zero	4
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
