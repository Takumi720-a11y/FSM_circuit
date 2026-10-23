	.file	"beebsc.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	rand_beebs
	.type	rand_beebs, @function
rand_beebs:
	lui	a4,%hi(seed)
	lw	a0,%lo(seed)(a4)
	li	a5,1103515648
	addi	a5,a5,-403
	mul	a0,a0,a5
	li	a5,12288
	addi	a5,a5,57
	add	a0,a0,a5
	slli	a0,a0,1
	srli	a0,a0,1
	sw	a0,%lo(seed)(a4)
	srli	a0,a0,16
	ret
	.size	rand_beebs, .-rand_beebs
	.align	2
	.globl	srand_beebs
	.type	srand_beebs, @function
srand_beebs:
	lui	a5,%hi(seed)
	sw	a0,%lo(seed)(a5)
	ret
	.size	srand_beebs, .-srand_beebs
	.align	2
	.globl	init_heap_beebs
	.type	init_heap_beebs, @function
init_heap_beebs:
	andi	a5,a1,3
	bne	a5,zero,.L6
	add	a1,a0,a1
	lui	a3,%hi(heap_end)
	lui	a4,%hi(heap_ptr)
	lui	a5,%hi(heap_requested)
	sw	a1,%lo(heap_end)(a3)
	sw	a0,%lo(heap_ptr)(a4)
	sw	zero,%lo(heap_requested)(a5)
	ret
.L6:
	j	.L6
	.size	init_heap_beebs, .-init_heap_beebs
	.align	2
	.globl	check_heap_beebs
	.type	check_heap_beebs, @function
check_heap_beebs:
	lui	a5,%hi(heap_requested)
	lw	a4,%lo(heap_requested)(a5)
	lui	a5,%hi(heap_end)
	lw	a5,%lo(heap_end)(a5)
	add	a0,a0,a4
	sltu	a0,a5,a0
	xori	a0,a0,1
	ret
	.size	check_heap_beebs, .-check_heap_beebs
	.align	2
	.globl	malloc_beebs
	.type	malloc_beebs, @function
malloc_beebs:
	mv	a5,a0
	beq	a0,zero,.L12
	lui	a2,%hi(heap_ptr)
	lw	a0,%lo(heap_ptr)(a2)
	lui	a3,%hi(heap_requested)
	lw	a1,%lo(heap_requested)(a3)
	add	a4,a0,a5
	andi	a6,a4,3
	add	a5,a5,a1
	bne	a6,zero,.L16
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bltu	a1,a4,.L12
.L17:
	sw	a4,%lo(heap_ptr)(a2)
	ret
.L16:
	li	a1,4
	sub	a1,a1,a6
	add	a5,a5,a1
	add	a4,a4,a1
	lui	a1,%hi(heap_end)
	lw	a1,%lo(heap_end)(a1)
	sw	a5,%lo(heap_requested)(a3)
	bgeu	a1,a4,.L17
.L12:
	li	a0,0
	ret
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.globl	calloc_beebs
	.type	calloc_beebs, @function
calloc_beebs:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mul	s0,a0,a1
	sw	ra,12(sp)
	mv	a0,s0
	call	malloc_beebs
	beq	a0,zero,.L18
	beq	s0,zero,.L18
	add	a1,a0,s0
	mv	a5,a0
.L20:
	addi	a5,a5,1
	sb	zero,-1(a5)
	bne	a5,a1,.L20
.L18:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	calloc_beebs, .-calloc_beebs
	.align	2
	.globl	realloc_beebs
	.type	realloc_beebs, @function
realloc_beebs:
	beq	a0,zero,.L44
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	mv	a0,a1
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a1
	call	malloc_beebs
	beq	a0,zero,.L30
	mv	a5,s0
	add	a2,s0,s1
	mv	a4,a0
	beq	s1,zero,.L29
.L33:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a5,a2,.L33
.L29:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L30:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L44:
	li	a0,0
	ret
	.size	realloc_beebs, .-realloc_beebs
	.align	2
	.globl	free_beebs
	.type	free_beebs, @function
free_beebs:
	ret
	.size	free_beebs, .-free_beebs
	.section	.sbss,"aw",@nobits
	.align	2
	.type	heap_requested, @object
	.size	heap_requested, 4
heap_requested:
	.zero	4
	.type	heap_end, @object
	.size	heap_end, 4
heap_end:
	.zero	4
	.type	heap_ptr, @object
	.size	heap_ptr, 4
heap_ptr:
	.zero	4
	.type	seed, @object
	.size	seed, 4
seed:
	.zero	4
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
