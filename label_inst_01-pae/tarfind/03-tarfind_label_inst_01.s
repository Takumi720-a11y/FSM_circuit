	.file	"tarfind.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-80
	sw	s8,40(sp)
	sw	ra,76(sp)
	sw	s0,72(sp)
	sw	a0,4(sp)
	mv	s8,a1
	beq	a1,zero,.L2
	li	a4,8192
	mv	a5,a4
	sw	s2,64(sp)
	addi	a4,a4,803
	li	s2,1321529344
	addi	a5,a5,1060
	sw	s3,60(sp)
	sw	s5,52(sp)
	sw	s10,32(sp)
	sw	s1,68(sp)
	sw	s4,56(sp)
	sw	s6,48(sp)
	sw	s7,44(sp)
	sw	s9,36(sp)
	sw	s11,28(sp)
	sw	a4,12(sp)
	sw	a5,8(sp)
	addi	s2,s2,-945
	li	s10,0
	li	s5,48
	li	s3,26
.L14:
	li	s11,0
.L13:
	lui	a5,%hi(heap)
	li	a1,8192
	addi	a0,a5,%lo(heap)
	addi	a1,a1,804
	call	init_heap_beebs
	li	a0,8192
	addi	a0,a0,803
	call	malloc_beebs
	lw	a5,8(sp)
	mv	s7,a0
	addi	s1,a0,5
	add	s6,a0,a5
	addi	s0,a0,257
	mv	s4,a0
.L5:
	mv	a5,s4
.L3:
	addi	a5,a5,1
	sb	zero,-1(a5)
	bne	a5,s0,.L3
	sb	s5,-101(s0)
	mv	s9,s4
.L4:
	call	rand_beebs
	mulh	a5,a0,s2
	srai	a3,a0,31
	addi	s9,s9,1
	srai	a5,a5,3
	sub	a5,a5,a3
	mul	a5,a5,s3
	sub	a0,a0,a5
	addi	a0,a0,65
	sb	a0,-1(s9)
	bne	s9,s1,.L4
	sb	s5,-133(s0)
	addi	s0,s0,257
	addi	s4,s4,257
	addi	s1,s9,258
	bne	s0,s6,.L5
	li	a0,4096
	lw	a5,12(sp)
	mv	a7,a0
	addi	a7,a7,1558
	addi	a0,a0,273
	add	a0,s7,a0
	add	a7,s7,a7
	li	s0,0
	add	a6,s7,a5
.L12:
	mv	a1,s7
.L11:
	lbu	a4,0(a1)
	mv	a3,a1
	mv	a5,a0
	bne	a4,zero,.L6
	j	.L7
.L37:
	bne	a2,a4,.L8
	lbu	a4,0(a3)
	beq	a4,zero,.L7
.L6:
	lbu	a2,0(a5)
	addi	a3,a3,1
	addi	a5,a5,1
	bne	a2,zero,.L37
.L8:
	addi	a1,a1,257
	bne	a6,a1,.L11
	addi	a0,a0,257
	bne	a0,a7,.L12
.L38:
	mv	a0,s7
	addi	s11,s11,1
	call	free_beebs
	bne	s8,s11,.L13
	lw	a5,4(sp)
	addi	s10,s10,1
	bne	a5,s10,.L14
	lw	s1,68(sp)
	lw	s2,64(sp)
	lw	s3,60(sp)
	lw	s4,56(sp)
	lw	s5,52(sp)
	lw	s6,48(sp)
	lw	s7,44(sp)
	lw	s9,36(sp)
	lw	s10,32(sp)
	lw	s11,28(sp)
.L15:
	lw	ra,76(sp)
	addi	a0,s0,-5
	lw	s0,72(sp)
	lw	s8,40(sp)
	seqz	a0,a0
	addi	sp,sp,80
	jr	ra
.L7:
	lbu	a5,0(a5)
	bne	a5,zero,.L8
	addi	a0,a0,257
	addi	s0,s0,1
	bne	a0,a7,.L12
	j	.L38
.L2:
	lw	a5,4(sp)
	addi	s8,s8,1
	beq	a5,s8,.L15
	lw	a5,4(sp)
	addi	s8,s8,1
	bne	a5,s8,.L2
	j	.L15
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
	li	a0,46
	tail	benchmark_body
	.size	benchmark, .-benchmark
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
	ret
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-1
	seqz	a0,a0
	ret
	.size	verify_benchmark, .-verify_benchmark
	.bss
	.type	heap, @object
	.size	heap, 8996
heap:
	.zero	8996
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
