	.file	"md5.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	md5
	.type	md5, @function
md5:
	lui	a5,%hi(.LANCHOR0)
	addi	sp,sp,-608
	addi	a3,a5,%lo(.LANCHOR0)
	sw	s0,600(sp)
	sw	s1,596(sp)
	sw	ra,604(sp)
	sw	s2,592(sp)
	sw	s3,588(sp)
	sw	s4,584(sp)
	sw	s5,580(sp)
	sw	s6,576(sp)
	sw	s7,572(sp)
	sw	s8,568(sp)
	sw	s9,564(sp)
	sw	s10,560(sp)
	sw	s11,556(sp)
	mv	s0,a0
	mv	s1,a1
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a2,a3,256
	addi	a4,sp,32
.L2:
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a0,8(a5)
	lw	a1,12(a5)
	sw	a7,0(a4)
	sw	a6,4(a4)
	sw	a0,8(a4)
	sw	a1,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,a2,.L2
	addi	a3,a3,512
	addi	a4,sp,288
.L3:
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	sw	a6,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,a3,.L3
	addi	s5,s1,8
	li	a3,-271732736
	andi	s5,s5,-64
	addi	a3,a3,-1143
	li	a2,1732583424
	li	a4,-1732583424
	li	a5,271732736
	lui	s7,%hi(h1)
	addi	a5,a5,1142
	addi	a0,s5,120
	addi	a2,a2,769
	addi	a4,a4,-770
	sw	a3,%lo(h1)(s7)
	lui	s8,%hi(h0)
	lui	a3,%hi(h2)
	lui	s11,%hi(h3)
	li	a1,1
	sw	a4,%lo(h2)(a3)
	sw	a5,%lo(h3)(s11)
	sw	a2,%lo(h0)(s8)
	call	calloc_beebs
	addi	s5,s5,56
	add	a3,s0,s1
	mv	a5,a0
	beq	s1,zero,.L7
.L6:
	lbu	a4,0(s0)
	addi	s0,s0,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	s0,a3,.L6
.L7:
	add	a4,a0,s1
	li	a3,-128
	slli	s1,s1,3
	add	a5,a0,s5
	sb	a3,0(a4)
	sw	s1,28(sp)
	addi	a2,a5,4
	addi	a4,sp,28
.L5:
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a5)
	bne	a5,a2,.L5
	ble	s5,zero,.L8
	lui	a5,%hi(h2)
	lw	s10,%lo(h0)(s8)
	lw	s9,%lo(h1)(s7)
	lw	s4,%lo(h2)(a5)
	lw	t0,%lo(h3)(s11)
	li	t2,0
	li	s1,15
	li	s2,31
	li	s3,47
	li	s0,64
	sw	s5,12(sp)
.L14:
	li	a2,0
	addi	t3,sp,288
	addi	t1,sp,32
	mv	a7,t0
	mv	a6,s4
	mv	a1,s9
	mv	a5,s10
	li	t6,0
	li	t5,5
	li	t4,1
	bleu	a2,s1,.L9
.L27:
	xor	a4,a1,a6
	and	a4,a4,a7
	bleu	a2,s2,.L10
	xor	a4,a1,a6
	xor	a4,a4,a7
	andi	a3,t5,15
	bgtu	a2,s3,.L25
.L12:
	slli	a3,a3,2
	add	a3,a0,a3
	lw	s6,0(t3)
	add	a3,a3,t2
	lw	s5,0(a3)
	lw	a3,0(t1)
	add	a4,a4,s6
	add	a4,a4,s5
	add	a4,a4,a5
	neg	a5,a3
	sll	a3,a4,a3
	srl	a4,a4,a5
	or	a3,a3,a4
	addi	a2,a2,1
	addi	t4,t4,5
	addi	t5,t5,3
	addi	t6,t6,7
	addi	t3,t3,4
	addi	t1,t1,4
	add	a3,a3,a1
	mv	a5,a7
	beq	a2,s0,.L26
	mv	a7,a6
	mv	a6,a1
	mv	a1,a3
	bgtu	a2,s1,.L27
.L9:
	xor	a4,a6,a7
	and	a4,a4,a1
	xor	a4,a4,a7
	mv	a3,a2
	j	.L12
.L10:
	xor	a4,a4,a6
	andi	a3,t4,15
	j	.L12
.L25:
	not	a4,a7
	or	a4,a4,a1
	xor	a4,a4,a6
	andi	a3,t6,15
	j	.L12
.L26:
	lw	a5,12(sp)
	addi	t2,t2,64
	add	s10,s10,a7
	add	s9,s9,a3
	add	s4,s4,a1
	add	t0,t0,a6
	bgt	a5,t2,.L14
	lui	a5,%hi(h2)
	sw	s10,%lo(h0)(s8)
	sw	s9,%lo(h1)(s7)
	sw	s4,%lo(h2)(a5)
	sw	t0,%lo(h3)(s11)
.L8:
	lw	s0,600(sp)
	lw	ra,604(sp)
	lw	s1,596(sp)
	lw	s2,592(sp)
	lw	s3,588(sp)
	lw	s4,584(sp)
	lw	s5,580(sp)
	lw	s6,576(sp)
	lw	s7,572(sp)
	lw	s8,568(sp)
	lw	s9,564(sp)
	lw	s10,560(sp)
	lw	s11,556(sp)
	addi	sp,sp,608
	tail	free_beebs
	.size	md5, .-md5
	.align	2
	.type	benchmark_body.constprop.0, @function
benchmark_body.constprop.0:
	addi	sp,sp,-32
	sw	ra,28(sp)
	beq	a1,zero,.L29
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)
	sw	s0,24(sp)
	sw	s2,16(sp)
	mv	s3,a1
	mv	s6,a0
	li	s5,0
	lui	s4,%hi(heap)
	li	s1,1000
.L32:
	li	s2,0
.L31:
	li	a1,4096
	addi	a1,a1,-1016
	addi	a0,s4,%lo(heap)
	call	init_heap_beebs
	li	a0,1000
	call	malloc_beebs
	mv	s0,a0
	li	a5,0
.L30:
	add	a4,s0,a5
	sb	a5,0(a4)
	addi	a5,a5,1
	bne	a5,s1,.L30
	mv	a1,s1
	mv	a0,s0
	call	md5
	mv	a0,s0
	addi	s2,s2,1
	call	free_beebs
	bne	s2,s3,.L31
	addi	s5,s5,1
	bne	s6,s5,.L32
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	lw	s6,0(sp)
.L29:
	lui	a4,%hi(h1)
	lui	a5,%hi(h0)
	lw	a3,%lo(h1)(a4)
	lw	a5,%lo(h0)(a5)
	lui	a4,%hi(h2)
	lw	a4,%lo(h2)(a4)
	lui	a2,%hi(h3)
	lw	a0,%lo(h3)(a2)
	lw	ra,28(sp)
	xor	a5,a5,a3
	xor	a5,a5,a4
	xor	a0,a5,a0
	addi	sp,sp,32
	jr	ra
	.size	benchmark_body.constprop.0, .-benchmark_body.constprop.0
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
	tail	benchmark_body.constprop.0
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	li	a1,1
	li	a0,66
	tail	benchmark_body.constprop.0
	.size	benchmark, .-benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	li	a5,-871788544
	addi	a5,a5,-948
	add	a0,a0,a5
	seqz	a0,a0
	ret
	.size	verify_benchmark, .-verify_benchmark
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
.LC1:
	.word	-680876936
	.word	-389564586
	.word	606105819
	.word	-1044525330
	.word	-176418897
	.word	1200080426
	.word	-1473231341
	.word	-45705983
	.word	1770035416
	.word	-1958414417
	.word	-42063
	.word	-1990404162
	.word	1804603682
	.word	-40341101
	.word	-1502002290
	.word	1236535329
	.word	-165796510
	.word	-1069501632
	.word	643717713
	.word	-373897302
	.word	-701558691
	.word	38016083
	.word	-660478335
	.word	-405537848
	.word	568446438
	.word	-1019803690
	.word	-187363961
	.word	1163531501
	.word	-1444681467
	.word	-51403784
	.word	1735328473
	.word	-1926607734
	.word	-378558
	.word	-2022574463
	.word	1839030562
	.word	-35309556
	.word	-1530992060
	.word	1272893353
	.word	-155497632
	.word	-1094730640
	.word	681279174
	.word	-358537222
	.word	-722521979
	.word	76029189
	.word	-640364487
	.word	-421815835
	.word	530742520
	.word	-995338651
	.word	-198630844
	.word	1126891415
	.word	-1416354905
	.word	-57434055
	.word	1700485571
	.word	-1894986606
	.word	-1051523
	.word	-2054922799
	.word	1873313359
	.word	-30611744
	.word	-1560198380
	.word	1309151649
	.word	-145523070
	.word	-1120210379
	.word	718787259
	.word	-343485551
	.bss
	.align	2
	.type	heap, @object
	.size	heap, 3080
heap:
	.zero	3080
	.section	.sbss,"aw",@nobits
	.align	2
	.type	h3, @object
	.size	h3, 4
h3:
	.zero	4
	.type	h2, @object
	.size	h2, 4
h2:
	.zero	4
	.type	h1, @object
	.size	h1, 4
h1:
	.zero	4
	.type	h0, @object
	.size	h0, 4
h0:
	.zero	4
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
