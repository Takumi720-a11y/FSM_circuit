	.file	"libslre.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	match_op, @function
match_op:
	lbu	a5,0(a0)
	li	a4,92
	beq	a5,a4,.L2
	bgtu	a5,a4,.L3
	li	a4,36
	li	a0,-1
	beq	a5,a4,.L1
	li	a4,46
	li	a0,1
	bne	a5,a4,.L46
.L1:
	ret
.L3:
	li	a4,124
	li	a0,-4
	beq	a5,a4,.L1
	li	a4,4096
	add	a2,a2,a4
	lw	a3,-1680(a2)
	lbu	a4,0(a1)
	andi	a3,a3,1
	beq	a3,zero,.L19
.L20:
	addi	a2,a4,-65
	li	a3,25
	bgtu	a2,a3,.L19
	addi	a4,a4,32
.L19:
	bne	a5,a4,.L34
.L42:
	li	a0,1
	ret
.L2:
	lbu	a4,1(a0)
	li	a3,115
	lbu	a5,0(a1)
	beq	a4,a3,.L7
	bgtu	a4,a3,.L8
	li	a3,83
	beq	a4,a3,.L9
	li	a3,100
	bne	a4,a3,.L19
	addi	a0,a5,-48
	li	a5,9
	sgtu	a0,a0,a5
	neg	a0,a0
	ori	a0,a0,1
	ret
.L46:
	li	a4,4096
	add	a2,a2,a4
	lw	a3,-1680(a2)
	lbu	a4,0(a1)
	andi	a3,a3,1
	beq	a3,zero,.L19
	addi	a2,a5,-65
	li	a3,25
	bgtu	a2,a3,.L20
	addi	a5,a5,32
	j	.L20
.L8:
	li	a3,120
	bne	a4,a3,.L19
	lbu	a3,2(a0)
	li	a4,25
	addi	a2,a3,-65
	bgtu	a2,a4,.L13
	addi	a3,a3,32
.L14:
	addi	a4,a3,-87
.L15:
	lbu	a3,3(a0)
	li	a2,25
	slli	a4,a4,4
	addi	a1,a3,-65
	bgtu	a1,a2,.L16
	addi	a3,a3,32
.L17:
	addi	a3,a3,-87
.L18:
	or	a4,a4,a3
	beq	a5,a4,.L42
.L34:
	li	a0,-1
	ret
.L7:
	addi	a5,a5,-9
	andi	a5,a5,0xff
	li	a4,23
	li	a0,-1
	bgtu	a5,a4,.L1
	li	a0,8388608
	addi	a0,a0,19
	srl	a0,a0,a5
	andi	a0,a0,1
	addi	a0,a0,-1
	ori	a0,a0,1
	ret
.L9:
	addi	a5,a5,-9
	andi	a5,a5,0xff
	li	a4,23
	li	a0,1
	bgtu	a5,a4,.L1
	li	a0,8388608
	addi	a0,a0,19
	srl	a0,a0,a5
	andi	a0,a0,1
	addi	a0,a0,-1
	andi	a0,a0,2
	addi	a0,a0,-1
	ret
.L16:
	addi	a2,a3,-48
	li	a1,9
	bgtu	a2,a1,.L17
	mv	a3,a2
	j	.L18
.L13:
	addi	a4,a3,-48
	li	a2,9
	bleu	a4,a2,.L15
	j	.L14
	.size	match_op, .-match_op
	.align	2
	.type	bar, @function
bar:
	addi	sp,sp,-96
	sw	s11,44(sp)
	sw	ra,92(sp)
	sw	a2,0(sp)
	li	s11,0
	ble	a1,zero,.L47
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s8,56(sp)
	sw	s10,48(sp)
	sw	s0,88(sp)
	sw	s7,60(sp)
	sw	s9,52(sp)
	mv	s1,a1
	mv	s5,a0
	mv	s3,a3
	mv	s2,a4
	mv	s4,a5
	li	s6,0
	li	s8,0
	li	s10,40
.L48:
	blt	s3,s6,.L146
	add	s9,s5,s8
	lbu	a4,0(s9)
	bne	a4,s10,.L50
	addi	a5,s4,1
	slli	a3,a5,4
	add	a3,s2,a3
	lw	s0,4(a3)
	addi	s0,s0,2
	ble	s0,zero,.L129
	add	s7,s0,s8
	bgt	s1,s7,.L54
.L65:
	lw	a4,1600(s2)
	ble	a4,a5,.L144
	lw	a3,0(sp)
	sub	a4,s1,s7
	sw	a4,12(sp)
	add	a0,a3,s6
	sw	a0,8(sp)
	sub	s9,s3,s6
	bgt	a4,zero,.L145
	mv	a3,a5
	mv	a1,s9
	mv	a2,s2
	sw	a5,4(sp)
	call	doh
	lw	a5,4(sp)
	mv	s11,a0
.L110:
	blt	s11,zero,.L174
	add	t1,s8,s0
	add	t5,s11,s6
.L113:
	li	a4,4096
	add	a4,s2,a4
	lw	a4,-1688(a4)
	beq	a4,zero,.L115
	lw	a3,8(sp)
	slli	s4,s4,3
	add	a4,a4,s4
	sw	a3,0(a4)
	sw	s11,4(a4)
.L115:
	mv	s6,t5
	mv	s4,a5
	j	.L69
.L50:
	li	a5,91
	beq	a4,a5,.L183
	li	a5,92
	beq	a4,a5,.L60
	addi	a3,a4,-42
	andi	a3,a3,0xff
	li	a5,1
	bgtu	a3,a5,.L184
.L131:
	li	s11,-2
.L174:
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
.L47:
	lw	ra,92(sp)
	mv	a0,s11
	lw	s11,44(sp)
	addi	sp,sp,96
	jr	ra
.L60:
	lbu	a3,1(s9)
	li	a5,120
	beq	a3,a5,.L63
	addi	s7,s8,2
	li	s0,2
	bge	s7,s1,.L64
.L54:
	mv	a5,s0
.L61:
	add	a5,s8,a5
	add	a5,s5,a5
	lbu	a3,0(a5)
	sw	a5,12(sp)
	li	a2,1
	addi	a5,a3,-42
	andi	a5,a5,0xff
	bleu	a5,a2,.L66
	li	a5,63
	beq	a3,a5,.L185
	li	a5,91
	beq	a4,a5,.L176
	li	a5,40
	beq	a4,a5,.L186
.L62:
	li	a5,94
	beq	a4,a5,.L187
	li	a5,36
	bne	a4,a5,.L64
	bne	s3,s6,.L90
.L177:
	add	t1,s8,s0
.L69:
	mv	s8,t1
	bgt	s1,t1,.L48
.L146:
	mv	s11,s6
	j	.L174
.L66:
	addi	s10,s7,1
	sw	zero,16(sp)
	ble	s1,s10,.L70
	add	a5,s5,s10
	lbu	a4,0(a5)
	li	a5,63
	beq	a4,a5,.L188
.L70:
	li	a5,-1
	sw	a5,20(sp)
	lw	a5,0(sp)
	sw	s6,4(sp)
	mv	s11,s6
	add	s8,a5,s6
	sub	a5,s1,s10
	sw	a5,24(sp)
	add	a5,s5,s10
	sub	s7,s3,s6
	sw	a5,28(sp)
.L85:
	mv	a5,s4
	mv	a4,s2
	mv	a3,s7
	mv	a2,s8
	mv	a1,s0
	mv	a0,s9
	call	bar
	mv	t3,a0
	ble	a0,zero,.L189
	add	s11,s11,a0
	bgt	s1,s10,.L77
	bge	s6,s11,.L138
	lw	a5,16(sp)
	bne	a5,zero,.L175
.L138:
	lw	a5,0(sp)
	sw	s11,4(sp)
	sub	s7,s3,s11
	add	s8,a5,s11
	j	.L85
.L64:
	beq	s3,s6,.L90
	lw	a5,0(sp)
	mv	a0,s9
	mv	a2,s2
	add	a1,a5,s6
	call	match_op
	li	a5,1
	mv	s11,a0
	bne	a0,a5,.L174
	add	s6,s6,a5
	j	.L177
.L184:
	li	a3,63
	beq	a4,a3,.L131
	add	s7,s8,a5
	mv	s0,a5
	blt	s7,s1,.L61
	j	.L62
.L189:
	lw	a5,12(sp)
	li	a4,43
	lbu	a5,0(a5)
	beq	a5,a4,.L72
	bgt	s1,s10,.L73
	bgt	s11,s6,.L74
	beq	a0,zero,.L75
	li	a4,42
	beq	a5,a4,.L76
.L75:
	bne	s6,s11,.L174
	ble	s1,s10,.L174
	lw	a5,20(sp)
	bge	a5,zero,.L174
.L90:
	li	s11,-1
	j	.L174
.L77:
	lw	a5,0(sp)
	sub	s7,s3,s11
	add	s8,a5,s11
.L73:
	lw	a1,24(sp)
	lw	a0,28(sp)
	mv	a5,s4
	mv	a4,s2
	mv	a3,s7
	mv	a2,s8
	sw	t3,8(sp)
	call	bar
	sw	a0,20(sp)
	lw	t3,8(sp)
	blt	a0,zero,.L81
	add	a5,a0,s11
	sw	a5,4(sp)
.L81:
	lw	a5,4(sp)
	ble	a5,s6,.L82
	lw	a5,16(sp)
	bne	a5,zero,.L84
.L82:
	bgt	t3,zero,.L85
.L84:
	lw	a5,12(sp)
	lw	s11,4(sp)
	lbu	a5,0(a5)
	blt	t3,zero,.L119
.L86:
	li	a4,43
	bne	a5,a4,.L75
	bne	s6,s11,.L174
.L190:
	li	s11,-1
	j	.L174
.L72:
	bne	a0,zero,.L139
	bgt	s1,s10,.L73
	bne	s6,s11,.L174
	j	.L190
.L183:
	sub	a1,s1,s8
	addi	a1,a1,-1
	li	s0,0
	li	a0,93
	li	a6,92
	li	t5,120
	bne	a1,zero,.L53
	j	.L191
.L56:
	add	s0,s0,a2
	ble	a1,s0,.L57
.L53:
	addi	a5,s0,1
	add	a5,s9,a5
	lbu	a3,0(a5)
	li	a2,1
	beq	a3,a0,.L57
	bne	a3,a6,.L56
	lbu	a5,1(a5)
	li	a2,4
	beq	a5,t5,.L56
	li	a2,2
	j	.L56
.L57:
	blt	a1,s0,.L129
	addi	s0,s0,2
	ble	s0,zero,.L129
	add	s7,s8,s0
	bgt	s1,s7,.L54
.L176:
	addi	a3,s8,2
.L55:
	addi	a5,s8,1
	sub	a3,s1,a3
	add	s11,s5,a5
	sw	a3,4(sp)
	lw	a3,0(sp)
	lbu	a4,0(s11)
	li	a5,94
	add	a3,a3,s6
	sw	a4,20(sp)
	sw	a3,12(sp)
	beq	a4,a5,.L192
	lw	a5,4(sp)
	blt	a5,zero,.L90
	lw	a6,20(sp)
.L118:
	li	a0,-1
	li	s9,0
	mv	a5,s11
	li	s7,45
.L104:
	li	a4,93
	beq	a6,a4,.L105
	li	a4,1
	beq	a0,a4,.L193
	beq	a6,s7,.L95
	lbu	a4,1(a5)
	beq	a4,s7,.L194
.L96:
	lw	a1,12(sp)
	mv	a0,a5
	mv	a2,s2
	sw	a6,8(sp)
	sw	a5,16(sp)
	call	match_op
	lw	a6,8(sp)
	li	a5,92
	li	a4,1
	bne	a6,a5,.L103
	lw	a5,16(sp)
	li	a3,120
	li	a4,4
	lbu	a5,1(a5)
	beq	a5,a3,.L103
	li	a4,2
.L103:
	add	s9,s9,a4
.L102:
	lw	a5,4(sp)
	bgt	s9,a5,.L105
	add	a5,s11,s9
	lbu	a6,0(a5)
	j	.L104
.L74:
	beq	a0,zero,.L174
.L119:
	li	a4,42
	bne	a5,a4,.L86
.L76:
	lw	a2,0(sp)
	mv	a5,s4
	mv	a4,s2
	sub	a3,s3,s6
	add	a2,a2,s6
	add	a0,s5,s10
	sub	a1,s1,s10
	call	bar
	sw	a0,20(sp)
	ble	a0,zero,.L175
	lw	a5,20(sp)
	add	s11,a5,s6
	j	.L174
.L187:
	beq	s6,zero,.L177
	li	s11,-1
	j	.L174
.L192:
	lw	a5,4(sp)
	addi	a5,a5,-1
	mv	a4,a5
	sw	a5,4(sp)
	addi	a5,s11,1
	blt	a4,zero,.L94
	lbu	a6,1(s11)
	mv	s11,a5
	j	.L118
.L188:
	addi	s10,s7,2
	sw	a2,16(sp)
	j	.L70
.L95:
	lw	a1,12(sp)
	mv	a0,a5
	mv	a2,s2
	call	match_op
	li	a4,1
	j	.L103
.L194:
	lbu	a4,2(a5)
	li	a3,93
	beq	a4,a3,.L96
	beq	a4,zero,.L96
	li	a5,4096
	add	a5,s2,a5
	lw	a0,-1680(a5)
	lw	a5,12(sp)
	lbu	a5,0(a5)
	beq	a0,zero,.L97
	li	a0,0
	bgtu	a6,a5,.L98
	sltu	a5,a4,a5
	seqz	a0,a5
.L98:
	addi	s9,s9,3
	j	.L102
.L108:
	li	a5,1
	beq	a0,a5,.L90
.L94:
	addi	s6,s6,1
	add	t1,s8,s0
	j	.L69
.L105:
	lw	a4,20(sp)
	li	a5,94
	beq	a4,a5,.L108
	li	a5,1
	beq	a0,a5,.L94
	li	s11,-1
	j	.L174
.L63:
	addi	s7,s8,4
	li	s0,4
	ble	s1,s7,.L64
	li	a5,4
	mv	s0,a5
	j	.L61
.L145:
	add	a4,s0,s8
	sw	a4,24(sp)
	add	a4,s5,a4
	sw	a4,28(sp)
	li	s7,0
.L109:
	lw	a0,8(sp)
	mv	a3,a5
	mv	a2,s2
	sub	a1,s9,s7
	sw	a5,4(sp)
	call	doh
	lw	a5,4(sp)
	mv	s11,a0
	bge	a0,zero,.L195
	addi	s7,s7,1
	ble	s7,s9,.L109
	j	.L174
.L195:
	lw	a4,0(sp)
	add	t5,a0,s6
	lw	t1,24(sp)
	lw	a1,12(sp)
	lw	a0,28(sp)
	add	a2,a4,t5
	sub	a3,s3,t5
	mv	a4,s2
	sw	a5,20(sp)
	sw	t5,16(sp)
	sw	t1,4(sp)
	call	bar
	lw	t1,4(sp)
	lw	t5,16(sp)
	lw	a5,20(sp)
	addi	s7,s7,1
	bge	a0,zero,.L113
	ble	s7,s9,.L109
	j	.L110
.L129:
	li	s11,-5
	j	.L174
.L139:
	lw	s11,4(sp)
	bne	s6,s11,.L174
	j	.L190
.L193:
	lw	a4,20(sp)
	li	a5,94
	bne	a4,a5,.L94
	j	.L90
.L97:
	addi	a1,a5,-65
	li	a2,25
	bgtu	a1,a2,.L99
	addi	a5,a5,32
.L99:
	addi	a1,a6,-65
	li	a2,25
	bgtu	a1,a2,.L100
	addi	a6,a6,32
.L100:
	bgt	a6,a5,.L98
	addi	a1,a4,-65
	li	a2,25
	bgtu	a1,a2,.L101
	addi	a4,a4,32
.L101:
	sgt	a5,a5,a4
	seqz	a0,a5
	addi	s9,s9,3
	j	.L102
.L175:
	lw	a5,12(sp)
	lbu	a5,0(a5)
	j	.L86
.L185:
	lw	a2,0(sp)
	mv	a5,s4
	sub	a3,s3,s6
	add	a2,a2,s6
	mv	a0,s9
	mv	a4,s2
	mv	a1,s0
	call	bar
	not	a5,a0
	srai	a5,a5,31
	addi	s8,s8,1
	and	a0,a0,a5
	add	t1,s8,s0
	add	s6,s6,a0
	j	.L69
.L191:
	addi	a3,s8,2
	mv	s7,a3
	li	s0,2
	bgt	s1,a3,.L54
	j	.L55
.L144:
	li	s11,-4
	j	.L174
.L186:
	addi	a5,s4,1
	j	.L65
	.size	bar, .-bar
	.align	2
	.type	doh, @function
doh:
	addi	sp,sp,-48
	sw	s1,36(sp)
	slli	s1,a3,4
	add	s1,a2,s1
	sw	s3,28(sp)
	lw	s3,12(s1)
	sw	s2,32(sp)
	sw	ra,44(sp)
	mv	a5,a3
	mv	a4,a2
	lw	s2,0(s1)
	mv	a2,a0
	mv	a3,a1
	beq	s3,zero,.L203
	lw	a7,8(s1)
	sw	s0,40(sp)
	mv	a0,s2
	li	s0,0
.L197:
	add	a7,s0,a7
	slli	a7,a7,3
	add	a7,a4,a7
	lw	a1,1608(a7)
	sw	a5,12(sp)
	sw	a4,8(sp)
	sub	a1,a1,a0
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	bar
	bgt	a0,zero,.L196
	addi	t1,s0,1
	ble	s3,s0,.L196
	lw	a7,8(s1)
	lw	a4,8(sp)
	lw	a2,0(sp)
	add	a6,t1,a7
	slli	a6,a6,3
	add	a6,a4,a6
	lw	a0,1600(a6)
	lw	a3,4(sp)
	lw	a5,12(sp)
	mv	s0,t1
	addi	a0,a0,1
	bne	t1,s3,.L197
	lw	a6,4(s1)
	lw	s0,40(sp)
	lw	ra,44(sp)
	add	a6,s2,a6
	mv	s2,a0
	lw	s1,36(sp)
	lw	s3,28(sp)
	sub	a1,a6,a0
	mv	a0,s2
	lw	s2,32(sp)
	addi	sp,sp,48
	tail	bar
.L203:
	lw	a1,4(s1)
	lw	ra,44(sp)
	lw	s1,36(sp)
	lw	s3,28(sp)
	mv	a0,s2
	lw	s2,32(sp)
	addi	sp,sp,48
	tail	bar
.L196:
	lw	s0,40(sp)
	lw	ra,44(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	addi	sp,sp,48
	jr	ra
	.size	doh, .-doh
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"(?i)"
	.align	2
.LC1:
	.string	"^$().[]*+?|\\Ssd"
	.text
	.align	2
	.globl	slre_match
	.type	slre_match, @function
slre_match:
	addi	sp,sp,-2032
	sw	s7,1996(sp)
	sw	s11,1980(sp)
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	sw	s1,2020(sp)
	sw	s2,2016(sp)
	sw	s3,2012(sp)
	sw	s4,2008(sp)
	sw	s5,2004(sp)
	sw	s6,2000(sp)
	sw	s8,1992(sp)
	sw	s9,1988(sp)
	sw	s10,1984(sp)
	li	a5,4096
	addi	sp,sp,-480
	addi	t1,sp,16
	mv	s7,a2
	addi	a2,a5,-1676
	add	a2,a2,t1
	addi	a7,a5,-1672
	sw	a3,0(a2)
	addi	a3,a5,-1680
	addi	a5,a5,-1668
	add	a7,a7,t1
	add	a3,a3,t1
	add	a5,a5,t1
	lui	a6,%hi(.LC0)
	sw	a4,0(a7)
	sw	zero,0(a3)
	sw	zero,0(a5)
	mv	s11,a1
	addi	a7,a0,4
	mv	a5,a0
	addi	a3,a6,%lo(.LC0)
.L208:
	lbu	a1,0(a5)
	lbu	a2,0(a3)
	addi	a5,a5,1
	addi	a3,a3,1
	bne	a1,a2,.L207
	bne	a5,a7,.L208
	mv	a0,a5
	li	a5,4096
	addi	a5,a5,-1668
	addi	a2,sp,16
	li	a3,1
	add	a5,a5,a2
	sw	a3,0(a5)
.L207:
	lbu	a5,0(a0)
	beq	a5,zero,.L209
	li	t1,0
.L210:
	mv	s3,t1
	addi	t1,t1,1
	add	a3,a0,t1
	lbu	a3,0(a3)
	bne	a3,zero,.L210
	li	t2,1
	sw	t2,1628(sp)
	sw	a0,28(sp)
	sw	t1,32(sp)
	addi	s0,sp,-1648
	ble	t1,zero,.L212
	li	s2,91
	sw	s11,12(sp)
	li	s8,0
	li	s4,0
	li	t6,0
	li	t0,0
	li	a7,0
	mv	a6,a0
	li	t4,92
	li	s6,124
	li	s10,40
	li	s5,-1
	li	a2,99
	li	s1,120
	addi	a3,s3,-2
	li	s9,9
	mv	t5,s7
	beq	a5,s2,.L294
.L213:
	beq	a5,t4,.L295
	beq	a5,s6,.L296
	bne	a5,s10,.L228
	bgt	t2,a2,.L263
	slli	a5,t2,4
	addi	a1,a7,1
	add	a5,s0,a5
	add	a1,a0,a1
	sw	s5,1680(a5)
	sw	a1,1676(a5)
	addi	t0,t0,1
	addi	a5,t2,1
	ble	a4,zero,.L264
	blt	a4,t2,.L265
.L264:
	li	s8,1
	mv	t2,a5
	mv	a5,s8
.L215:
	add	a7,a7,a5
	ble	t1,a7,.L232
.L298:
	add	a6,a0,a7
	lbu	a5,0(a6)
	bne	a5,s2,.L213
.L294:
	sub	s7,t1,a7
	addi	s7,s7,-1
	li	a5,0
	li	s11,93
	beq	s7,zero,.L297
	sw	s4,8(sp)
	j	.L214
.L216:
	add	a5,a5,s4
	bge	a5,s7,.L217
.L214:
	addi	a1,a5,1
	add	a1,a6,a1
	lbu	t3,0(a1)
	li	s4,1
	beq	t3,s11,.L217
	bne	t3,t4,.L216
	lbu	a1,1(a1)
	li	s4,4
	beq	a1,s1,.L216
	li	s4,2
	add	a5,a5,s4
	blt	a5,s7,.L214
.L217:
	lw	s4,8(sp)
	blt	s7,a5,.L256
	addi	a5,a5,2
	add	a7,a7,a5
	bgt	t1,a7,.L298
.L232:
	lw	s11,12(sp)
	mv	s7,t5
	beq	s8,zero,.L234
	sw	t2,1628(sp)
.L234:
	beq	s4,zero,.L235
	li	a5,4096
	addi	a5,a5,-1680
	addi	a4,sp,16
	add	a5,a5,a4
	sw	t6,0(a5)
	bne	t0,zero,.L236
	lw	a0,28(sp)
	lw	t1,1628(sp)
	mv	a6,t6
	ble	t6,zero,.L251
	slli	a5,t6,3
	addi	a1,sp,1632
	addi	a4,sp,1640
	addi	t0,t0,1
	add	a1,a1,a5
	mv	a5,a4
	bge	t0,t6,.L299
.L238:
	lw	a3,-8(a4)
	lw	a2,0(a5)
	ble	a3,a2,.L240
	sw	a2,-8(a4)
	lw	a7,4(a5)
	lw	a2,-4(a4)
	sw	a7,-4(a4)
	sw	a2,4(a5)
	sw	a3,0(a5)
.L240:
	addi	a5,a5,8
	bne	a5,a1,.L238
.L285:
	addi	a4,a4,8
	addi	t0,t0,1
	mv	a5,a4
	blt	t0,t6,.L238
.L299:
	bne	t0,t6,.L285
.L251:
	ble	t1,zero,.L248
.L242:
	addi	a7,sp,28
	addi	a2,a7,12
	li	a3,0
	li	a1,0
.L247:
	sw	zero,0(a2)
	sw	a3,-4(a2)
	ble	a6,a3,.L244
	slli	a4,a3,3
	addi	a4,a4,1604
	add	a4,a7,a4
	j	.L245
.L246:
	lw	a5,0(a2)
	addi	a3,a3,1
	addi	a5,a5,1
	sw	a5,0(a2)
	beq	a6,a3,.L244
.L245:
	lw	a5,0(a4)
	addi	a4,a4,8
	beq	a5,a1,.L246
.L244:
	addi	a1,a1,1
	addi	a2,a2,16
	bne	t1,a1,.L247
.L248:
	lbu	s3,0(a0)
	addi	s1,sp,28
	li	s0,0
	li	s2,94
	bge	s7,zero,.L243
	j	.L231
.L249:
	addi	s0,s0,1
	beq	s3,s2,.L204
	blt	s7,s0,.L204
.L243:
	li	a3,0
	mv	a2,s1
	sub	a1,s7,s0
	add	a0,s11,s0
	call	doh
	blt	a0,zero,.L249
	add	a0,a0,s0
	j	.L204
.L296:
	bgt	t6,a2,.L258
	addi	a1,t2,-1
	slli	a5,a1,4
	add	a5,s0,a5
	lw	a5,1680(a5)
	beq	a5,s5,.L225
	mv	a1,t0
.L225:
	addi	a5,t6,200
	slli	a5,a5,3
	add	a5,s0,a5
	li	s4,1
	sw	a1,1680(a5)
	sw	a6,1684(a5)
	add	t6,t6,s4
	mv	a5,s4
	j	.L215
.L295:
	lbu	a1,1(a6)
	li	a5,2
	beq	a1,s1,.L300
.L221:
	ble	s3,a7,.L262
	lbu	t3,1(a6)
	bne	t3,s1,.L260
	ble	a3,a7,.L262
	lbu	a1,2(a6)
	addi	t3,a1,-48
	bleu	t3,s9,.L227
	andi	a1,a1,-33
	addi	a1,a1,-65
	andi	a1,a1,0xff
	li	t3,5
	bgtu	a1,t3,.L262
.L227:
	lbu	a1,3(a6)
	addi	a6,a1,-48
	bleu	a6,s9,.L215
	andi	a1,a1,-33
	addi	a1,a1,-65
	andi	a1,a1,0xff
	li	a6,5
	bleu	a1,a6,.L215
.L262:
	li	a0,-6
.L204:
	addi	sp,sp,480
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
.L300:
	li	a5,4
	j	.L221
.L228:
	li	a1,41
	bne	a5,a1,.L267
	addi	a5,t2,-1
	slli	a5,a5,4
	add	a1,s0,a5
	lw	a1,1680(a1)
	beq	a1,s5,.L229
	slli	a5,t0,4
.L229:
	add	a5,s0,a5
	lw	a1,1676(a5)
	addi	t0,t0,-1
	sub	a1,a6,a1
	sw	a1,1680(a5)
	blt	t0,zero,.L236
	ble	a7,zero,.L267
	lbu	a1,-1(a6)
	li	a5,40
	beq	a1,a5,.L231
.L267:
	li	a5,1
	j	.L215
.L260:
	lui	a1,%hi(.LC1)
	addi	a1,a1,%lo(.LC1)
	li	a6,94
.L226:
	addi	a1,a1,1
	beq	t3,a6,.L215
	lbu	a6,0(a1)
	bne	a6,zero,.L226
	j	.L262
.L297:
	li	a5,2
	j	.L215
.L209:
	li	a4,1
	sw	a0,28(sp)
	sw	zero,32(sp)
	sw	a4,1628(sp)
.L212:
	li	t1,1
	li	a6,0
	j	.L242
.L258:
	li	a0,-8
	j	.L204
.L235:
	beq	t0,zero,.L301
.L236:
	li	a0,-3
	j	.L204
.L256:
	li	a5,0
	j	.L215
.L231:
	li	a0,-1
	j	.L204
.L301:
	li	a5,4096
	addi	a5,a5,-1680
	addi	a4,sp,16
	add	a5,a5,a4
	lw	a0,28(sp)
	lw	a6,0(a5)
	lw	t1,1628(sp)
	j	.L251
.L263:
	li	a0,-9
	j	.L204
.L265:
	li	a0,-7
	j	.L204
	.size	slre_match, .-slre_match
	.align	2
	.type	benchmark_body, @function
benchmark_body:
	addi	sp,sp,-64
	sw	ra,60(sp)
	beq	a1,zero,.L304
	sw	s1,52(sp)
	lui	s1,%hi(.LANCHOR0)
	sw	s4,40(sp)
	sw	s6,32(sp)
	addi	s4,s1,%lo(.LANCHOR0)
	lui	s6,%hi(.LANCHOR0+48)
	sw	s2,48(sp)
	sw	s5,36(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s0,56(sp)
	sw	s3,44(sp)
	sw	s9,20(sp)
	mv	s5,a1
	mv	s8,a0
	addi	s2,s4,64
	addi	s6,s6,%lo(.LANCHOR0+48)
	li	s7,0
.L303:
	li	s3,0
.L310:
	lbu	a4,0(s4)
	addi	a5,s4,2
	li	s9,0
	beq	a4,zero,.L309
.L305:
	mv	a2,a5
	lbu	a4,-1(a5)
	addi	a5,a5,1
	bne	a4,zero,.L305
	sub	a2,a2,s4
	addi	s9,a2,-1
.L309:
	sw	zero,4(sp)
	mv	s0,s6
.L306:
	lw	a0,0(s0)
	li	a4,1
	addi	a3,sp,8
	mv	a2,s9
	addi	a1,s1,%lo(.LANCHOR0)
	call	slre_match
	lw	a5,4(sp)
	addi	s0,s0,4
	add	a5,a5,a0
	sw	a5,4(sp)
	bne	s0,s2,.L306
	addi	s3,s3,1
	bne	s5,s3,.L310
	addi	s7,s7,1
	bne	s8,s7,.L303
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	lw	s8,24(sp)
	lw	s9,20(sp)
.L304:
	lw	ra,60(sp)
	lw	a0,4(sp)
	addi	sp,sp,64
	jr	ra
	.size	benchmark_body, .-benchmark_body
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
	tail	benchmark_body
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	li	a1,1
	li	a0,116
	tail	benchmark_body
	.size	benchmark, .-benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
	addi	a0,a0,-102
	seqz	a0,a0
	ret
	.size	verify_benchmark, .-verify_benchmark
	.globl	regexes
	.section	.rodata.str1.4
	.align	2
.LC2:
	.string	"(ab)+"
	.align	2
.LC3:
	.string	"(b.+)+"
	.align	2
.LC4:
	.string	"a[ab]*"
	.align	2
.LC5:
	.string	"([ab^c][ab^c])+"
	.globl	text
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	text, @object
	.size	text, 46
text:
	.string	"abbbababaabccababcacbcbcbabbabcbabcabcbbcbbac"
	.zero	2
	.type	regexes, @object
	.size	regexes, 16
regexes:
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
