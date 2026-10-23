	.file	"testbench.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	beq	a0,zero,.L7
	mv	s4,a0
	li	s7,0
	li	s3,0
	li	s0,127
	lui	s6,%hi(X_test)
	lui	s5,%hi(Y_test)
.L6:
	sw	zero,12(sp)
	lw	a5,12(sp)
	bgtu	a5,s0,.L3
	addi	s2,s6,%lo(X_test)
	addi	s1,s5,%lo(Y_test)
.L5:
	lw	a0,12(sp)
	slli	a0,a0,6
	add	a0,s2,a0
	call	predict
	lw	a5,12(sp)
	lw	a4,12(sp)
	add	a5,s1,a5
	addi	a4,a4,1
	lbu	a5,0(a5)
	sw	a4,12(sp)
	lw	a4,12(sp)
	sub	a5,a5,a0
	seqz	a5,a5
	add	s7,s7,a5
	bleu	a4,s0,.L5
.L3:
	addi	s3,s3,1
	bne	s3,s4,.L6
.L1:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	mv	a0,s7
	lw	s7,28(sp)
	addi	sp,sp,64
	jr	ra
.L7:
	li	s7,0
	j	.L1
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	tail	benchmark_body.constprop.0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	li	a0,1
	tail	benchmark_body.constprop.0
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
	not	a0,a0
	srli	a0,a0,31
	ret
	.size	verify_benchmark, .-verify_benchmark
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
