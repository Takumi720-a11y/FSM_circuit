	.file	"libstatemate.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	generic_KINDERSICHERUNG_CTRL.part.0, @function
generic_KINDERSICHERUNG_CTRL.part.0:
	lui	a4,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	li	a3,2
	beq	a5,a3,.L2
	li	a2,3
	beq	a5,a2,.L3
	li	a3,1
	bne	a5,a3,.L4
	lui	a3,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a3)
	bne	a3,zero,.L5
	lui	a3,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a3)
	bne	a3,zero,.L6
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	lui	a5,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	sb	a2,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a5)
	ret
.L3:
	lui	a5,%hi(FH_TUERMODUL__KL_50)
	lbu	a5,%lo(FH_TUERMODUL__KL_50)(a5)
	bne	a5,zero,.L16
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	lui	a2,%hi(FH_TUERMODUL__SFHA_MEC)
	lbu	a2,%lo(FH_TUERMODUL__SFHA_MEC)(a2)
	bne	a5,zero,.L67
	bne	a2,zero,.L27
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	bne	a5,zero,.L19
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	bne	a5,zero,.L20
	ret
.L2:
	lui	a5,%hi(FH_TUERMODUL__SFHA_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_MEC)(a5)
	bne	a5,zero,.L12
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	bne	a5,zero,.L13
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	li	a3,3
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	ret
.L4:
	lui	a5,%hi(stable)
	sb	a2,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a5)
	ret
.L12:
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	li	a3,1
	beq	a4,a3,.L68
.L9:
	lui	a5,%hi(stable)
	sb	zero,%lo(stable)(a5)
	ret
.L5:
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	bne	a3,a5,.L9
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a5)
	bne	a5,zero,.L11
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	a3,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	ret
.L16:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	beq	a5,zero,.L1
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	bne	a5,zero,.L21
	ret
.L72:
	beq	a3,zero,.L31
.L1:
	ret
.L67:
	beq	a2,zero,.L18
	li	a5,1
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a1)
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	ret
.L13:
	lui	a5,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	li	a3,1
	bne	a4,a3,.L9
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a3)
	bne	a3,zero,.L69
.L31:
	li	a4,1
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a2)
	sb	a4,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	ret
.L6:
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	bne	a3,a5,.L9
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	bne	a5,zero,.L70
.L29:
	li	a5,1
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a2)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a5,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	ret
.L18:
	lui	a1,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_copy)
	li	a2,1
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a1)
	sb	a2,%lo(FH_TUERMODUL__SFHZ_copy)(a5)
	ret
.L27:
	lui	a1,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	li	a2,1
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a1)
	sb	a2,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	ret
.L21:
	li	a5,1
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__SFHA_copy)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a1)
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a2)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	ret
.L68:
	lui	a3,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC_old)(a3)
	bne	a3,zero,.L15
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	a4,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	ret
.L19:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	bne	a5,zero,.L21
	li	a5,1
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	zero,%lo(stable)(a2)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	ret
.L20:
	li	a5,1
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	sb	zero,%lo(stable)(a2)
	sb	a5,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	sb	a5,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
	ret
.L11:
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(a5)
	bne	a2,zero,.L71
	beq	a5,zero,.L1
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a5)
	ret
.L15:
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_MEC)(a3)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHZ_MEC_old)(a3)
	bne	a2,zero,.L72
	beq	a3,zero,.L1
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHZ_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHZ_copy)(a3)
	ret
.L70:
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(a5)
	beq	a5,zero,.L1
	lui	a2,%hi(stable)
	lui	a5,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a5)
	ret
.L69:
	lui	a3,%hi(FH_TUERMODUL__SFHA_MEC_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_MEC_old)(a3)
	beq	a3,zero,.L1
	lui	a2,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__SFHA_copy)
	sb	a4,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a5)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__SFHA_copy)(a3)
	ret
.L71:
	beq	a5,zero,.L29
	ret
	.size	generic_KINDERSICHERUNG_CTRL.part.0, .-generic_KINDERSICHERUNG_CTRL.part.0
	.align	2
	.type	generic_FH_TUERMODUL_CTRL.part.0, @function
generic_FH_TUERMODUL_CTRL.part.0:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,10(a5)
	bne	a4,zero,.L74
	lui	a4,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	li	a3,3
	sb	a3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a4)
.L74:
	lbu	a4,19(a5)
	bne	a4,zero,.L75
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	li	a3,1
	sb	zero,0(a5)
	sb	a3,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a4)
.L75:
	lui	a2,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	li	a4,1
	sb	a4,11(a5)
	sb	a4,20(a5)
	li	a1,2
	beq	a3,a1,.L76
	li	a0,3
	beq	a3,a0,.L77
	bne	a3,a4,.L78
	lui	a4,%hi(FH_TUERMODUL_CTRL__N)
	lw	a4,%lo(FH_TUERMODUL_CTRL__N)(a4)
	li	a3,59
	beq	a4,a3,.L191
.L80:
	lui	a3,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	li	a4,1
	beq	a2,a4,.L192
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL_CTRL__N)
	lui	a2,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	sb	a4,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a0)
	sw	zero,%lo(FH_TUERMODUL_CTRL__N)(a1)
	sb	a4,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a2)
.L119:
	lbu	a3,4(a5)
	lbu	a4,6(a5)
	sb	a3,5(a5)
	sb	a4,7(a5)
	ret
.L77:
	lui	a3,%hi(FH_TUERMODUL_CTRL__N)
	lw	a1,%lo(FH_TUERMODUL_CTRL__N)(a3)
	li	a3,60
	ble	a1,a3,.L87
	lui	a1,%hi(FH_TUERMODUL_CTRL__N_old)
	lw	a1,%lo(FH_TUERMODUL_CTRL__N_old)(a1)
	bgt	a1,a3,.L87
	lui	a3,%hi(FH_TUERMODUL_CTRL__INREVERS1)
	lui	a1,%hi(FH_TUERMODUL_CTRL__INREVERS2)
	lbu	a3,%lo(FH_TUERMODUL_CTRL__INREVERS1)(a3)
	lbu	a1,%lo(FH_TUERMODUL_CTRL__INREVERS2)(a1)
	or	a3,a3,a1
	bne	a3,zero,.L87
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a3)
	j	.L80
.L87:
	lui	a4,%hi(FH_TUERMODUL__BLOCK)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK)(a4)
	bne	a4,zero,.L193
.L88:
	lui	a3,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	lbu	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	li	a2,2
	beq	a4,a2,.L90
	li	a1,3
	beq	a4,a1,.L91
	li	a0,1
	bne	a4,a0,.L92
	lui	a0,%hi(FH_TUERMODUL__POSITION)
	lw	a6,%lo(FH_TUERMODUL__POSITION)(a0)
	li	a0,404
	ble	a6,a0,.L93
	lui	a2,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a1,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	j	.L80
.L192:
	lui	a4,%hi(step)
	lbu	a4,%lo(step)(a4)
	beq	a4,a2,.L194
	lui	a4,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	beq	a3,a2,.L119
.L121:
	li	a3,1
	sb	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	lbu	a3,4(a5)
	lbu	a4,6(a5)
	lui	a2,%hi(stable)
	sb	zero,%lo(stable)(a2)
	sb	a3,5(a5)
	sb	a4,7(a5)
	ret
.L76:
	lui	a4,%hi(FH_TUERMODUL__BLOCK)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK)(a4)
	beq	a4,zero,.L82
	lui	a4,%hi(FH_TUERMODUL__BLOCK_old)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK_old)(a4)
	bne	a4,zero,.L82
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	beq	a4,zero,.L82
	lui	a4,%hi(time)
	lw	a7,%lo(time)(a4)
	lui	a6,%hi(sc_FH_TUERMODUL_CTRL_2329_1)
	li	a4,3
	lui	a0,%hi(stable)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sw	a7,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a6)
	sb	zero,%lo(stable)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	j	.L80
.L82:
	lui	a3,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lbu	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	li	a2,2
	beq	a4,a2,.L83
	li	a1,3
	beq	a4,a1,.L84
	li	a2,1
	bne	a4,a2,.L85
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	bne	a4,zero,.L80
	lui	a2,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a1,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
	j	.L80
.L78:
	lui	a4,%hi(stable)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a4)
	j	.L80
.L193:
	lui	a4,%hi(FH_TUERMODUL__BLOCK_old)
	lbu	a4,%lo(FH_TUERMODUL__BLOCK_old)(a4)
	bne	a4,zero,.L88
	lui	a4,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHA)(a4)
	beq	a4,zero,.L89
	lui	a4,%hi(time)
	lw	t1,%lo(time)(a4)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_2375_2)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHA_copy)
	li	a1,2
	lui	a4,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	li	a3,3
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a7)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a0)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a3,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a4)
	j	.L80
.L191:
	lui	a3,%hi(FH_TUERMODUL_CTRL__N_old)
	lw	a3,%lo(FH_TUERMODUL_CTRL__N_old)(a3)
	beq	a3,a4,.L80
	lui	a3,%hi(stable)
	lui	a4,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	sb	a0,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a3)
	sb	a0,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a4)
	j	.L80
.L83:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L80
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHA_copy)
	li	a4,3
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a2)
	sb	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	j	.L80
.L89:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	beq	a4,zero,.L88
	lui	a4,%hi(time)
	lw	t1,%lo(time)(a4)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_2352_1)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHZ_copy)
	li	a1,2
	lui	a4,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	li	a3,3
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a7)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a0)
	sb	a1,%lo(B_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a3,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a4)
	j	.L80
.L194:
	lui	a2,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lw	a2,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a2)
	beq	a2,zero,.L118
	lui	a1,%hi(time)
	lw	a1,%lo(time)(a1)
	sub	a2,a1,a2
	beq	a2,a4,.L195
.L118:
	lui	a4,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	li	a2,1
	bne	a3,a2,.L121
	lui	a2,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lw	a2,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a2)
	beq	a2,zero,.L119
	lui	a1,%hi(time)
	lw	a1,%lo(time)(a1)
	addi	a1,a1,-3
	bne	a1,a2,.L119
	lui	a2,%hi(FH_TUERMODUL__MFHZ)
	lui	a1,%hi(FH_TUERMODUL__MFHA)
	lbu	a2,%lo(FH_TUERMODUL__MFHZ)(a2)
	lbu	a1,%lo(FH_TUERMODUL__MFHA)(a1)
	or	a2,a2,a1
	bne	a2,zero,.L119
	lui	a1,%hi(FH_TUERMODUL_CTRL__N)
	lw	a2,%lo(FH_TUERMODUL_CTRL__N)(a1)
	ble	a2,zero,.L119
	addi	a2,a2,-1
	lui	a0,%hi(stable)
	sw	a2,%lo(FH_TUERMODUL_CTRL__N)(a1)
	sb	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a4)
	sb	zero,%lo(stable)(a0)
	j	.L119
.L85:
	lui	a4,%hi(stable)
	sb	a1,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a4)
	j	.L80
.L84:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L196
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L80
	li	a4,1
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	zero,%lo(stable)(a1)
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a2)
	sb	a4,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	j	.L80
.L92:
	lui	a4,%hi(stable)
	sb	a1,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a4)
	j	.L80
.L196:
	lui	a0,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	li	a1,1
	sb	a2,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a3)
	sb	zero,%lo(stable)(a0)
	sb	a1,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	j	.L80
.L195:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lui	a1,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	lbu	a1,%lo(FH_TUERMODUL__MFHA)(a1)
	or	a4,a4,a1
	beq	a4,zero,.L118
	lui	a1,%hi(FH_TUERMODUL_CTRL__N)
	lw	a4,%lo(FH_TUERMODUL_CTRL__N)(a1)
	lui	a6,%hi(stable)
	lui	a0,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	addi	a4,a4,1
	sb	a2,%lo(A_FH_TUERMODUL_CTRL_next_state)(a3)
	sw	a4,%lo(FH_TUERMODUL_CTRL__N)(a1)
	sb	zero,%lo(stable)(a6)
	sb	a2,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a0)
	j	.L119
.L91:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L115
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	bne	a4,zero,.L115
	lui	a4,%hi(FH_TUERMODUL__POSITION)
	lw	a4,%lo(FH_TUERMODUL__POSITION)(a4)
	ble	a4,zero,.L115
	li	a4,1
	lui	a7,%hi(stable)
	lui	a6,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a0,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a2,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a7)
	sb	a2,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a6)
	sb	a2,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	a4,17(a5)
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	j	.L80
.L90:
	lui	a2,%hi(FH_TUERMODUL__POSITION)
	lw	a2,%lo(FH_TUERMODUL__POSITION)(a2)
	ble	a2,zero,.L105
	lui	a0,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	li	a1,1
	beq	a2,a1,.L101
	beq	a2,a4,.L102
	lui	a6,%hi(stable)
	lui	a2,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a3,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a4,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	a1,17(a5)
	sb	zero,%lo(stable)(a6)
	sb	a4,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a1,%lo(FH_TUERMODUL__MFHZ_copy)(a3)
	j	.L80
.L115:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L80
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	bne	a4,zero,.L80
	lui	a4,%hi(FH_TUERMODUL__POSITION)
	lw	a2,%lo(FH_TUERMODUL__POSITION)(a4)
	li	a4,404
	bgt	a2,a4,.L80
	li	a4,1
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHA_copy)
	lui	a2,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	li	a1,2
	sb	zero,%lo(stable)(a6)
	sb	a4,%lo(FH_TUERMODUL__MFHA_copy)(a0)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	sb	a1,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a2)
	j	.L80
.L105:
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHZ_copy)
	li	a4,3
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	j	.L80
.L93:
	lui	a0,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a1,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	beq	a1,a4,.L94
	beq	a1,a2,.L95
	lui	a4,%hi(stable)
	sb	a2,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a4)
	j	.L80
.L101:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L104
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	beq	a4,zero,.L105
.L104:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L106
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	beq	a4,zero,.L105
.L106:
	lui	a2,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	li	a4,1
	beq	a3,a4,.L107
	li	a1,2
	beq	a3,a1,.L108
	lui	a3,%hi(stable)
	sb	a1,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,17(a5)
	sb	zero,%lo(stable)(a3)
	j	.L80
.L102:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	bne	a4,zero,.L110
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	bne	a4,zero,.L105
.L110:
	lui	a2,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	li	a4,1
	beq	a3,a4,.L111
	li	a1,2
	beq	a3,a1,.L112
	lui	a0,%hi(stable)
	lui	a3,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a1,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	a4,17(a5)
	sb	zero,%lo(stable)(a0)
	sb	a4,%lo(FH_TUERMODUL__MFHZ_copy)(a3)
	j	.L80
.L95:
	lui	a2,%hi(FH_TUERMODUL__SFHZ)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ)(a2)
	beq	a2,zero,.L99
	lui	a2,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_old)(a2)
	bne	a2,zero,.L99
	lui	a3,%hi(stable)
	sb	a4,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a3)
	j	.L80
.L94:
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L97
	lui	a4,%hi(FH_TUERMODUL__SFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_old)(a4)
	bne	a4,zero,.L97
.L98:
	lui	a1,%hi(stable)
	lui	a2,%hi(FH_TUERMODUL__MFHA_copy)
	li	a4,3
	sb	zero,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(stable)(a1)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a2)
	sb	a4,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a3)
	j	.L80
.L99:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L80
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	bne	a4,zero,.L98
	j	.L80
.L97:
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	beq	a4,zero,.L80
	lui	a4,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHA_old)(a4)
	bne	a4,zero,.L80
	j	.L98
.L112:
	lbu	a3,24(a5)
	beq	a3,zero,.L114
	lui	a3,%hi(time)
	lw	t1,%lo(time)(a3)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_1739_10)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a1,%hi(FH_TUERMODUL_CTRL__INREVERS1_copy)
	lui	a3,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a4,23(a5)
	sb	a4,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,17(a5)
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a7)
	sb	zero,%lo(stable)(a6)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a0)
	sb	a4,%lo(FH_TUERMODUL_CTRL__INREVERS1_copy)(a1)
	sb	a4,%lo(FH_TUERMODUL__MFHA_copy)(a3)
	j	.L80
.L111:
	lbu	a4,22(a5)
	sb	zero,23(a5)
	beq	a4,zero,.L80
	lui	a7,%hi(stable)
	lui	a6,%hi(FH_TUERMODUL_CTRL__INREVERS1_copy)
	li	a0,2
	lui	a1,%hi(FH_TUERMODUL__MFHA_copy)
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sb	a3,17(a5)
	sb	zero,%lo(stable)(a7)
	sb	zero,%lo(FH_TUERMODUL_CTRL__INREVERS1_copy)(a6)
	sb	a0,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a1)
	sb	a3,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
	j	.L80
.L108:
	lbu	a3,24(a5)
	beq	a3,zero,.L80
	lui	a3,%hi(time)
	lw	t1,%lo(time)(a3)
	lui	a7,%hi(sc_FH_TUERMODUL_CTRL_1781_10)
	lui	a6,%hi(stable)
	lui	a0,%hi(FH_TUERMODUL_CTRL__INREVERS2_copy)
	lui	a1,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a3,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a4,23(a5)
	sb	a4,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,17(a5)
	sw	t1,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a7)
	sb	zero,%lo(stable)(a6)
	sb	a4,%lo(FH_TUERMODUL_CTRL__INREVERS2_copy)(a0)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a1)
	sb	a4,%lo(FH_TUERMODUL__MFHA_copy)(a3)
	j	.L80
.L107:
	lbu	a4,22(a5)
	sb	zero,23(a5)
	beq	a4,zero,.L80
	lui	a7,%hi(stable)
	lui	a6,%hi(FH_TUERMODUL__MFHZ_copy)
	lui	a0,%hi(FH_TUERMODUL_CTRL__INREVERS2_copy)
	li	a1,2
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sb	a3,17(a5)
	sb	zero,%lo(stable)(a7)
	sb	a3,%lo(FH_TUERMODUL__MFHZ_copy)(a6)
	sb	zero,%lo(FH_TUERMODUL_CTRL__INREVERS2_copy)(a0)
	sb	a1,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
	j	.L80
.L114:
	lui	a3,%hi(FH_TUERMODUL__SFHA)
	lbu	a3,%lo(FH_TUERMODUL__SFHA)(a3)
	beq	a3,zero,.L80
	lui	a3,%hi(FH_TUERMODUL__SFHA_old)
	lbu	a3,%lo(FH_TUERMODUL__SFHA_old)(a3)
	bne	a3,zero,.L80
	lui	a3,%hi(stable)
	sb	a4,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a2)
	sb	zero,%lo(stable)(a3)
	j	.L80
	.size	generic_FH_TUERMODUL_CTRL.part.0, .-generic_FH_TUERMODUL_CTRL.part.0
	.align	2
	.globl	interface
	.type	interface, @function
interface:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,4(a5)
	bne	a4,zero,.L198
	lbu	a4,6(a5)
	bne	a4,zero,.L226
.L199:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2375_2)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a3)
	beq	a4,zero,.L201
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L201
	lui	a4,%hi(FH_TUERMODUL__MFHA_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2375_2)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHA_copy)(a4)
.L201:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2352_1)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a3)
	beq	a4,zero,.L202
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L202
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2352_1)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
.L202:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_2329_1)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a3)
	beq	a4,zero,.L203
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L203
	lui	a4,%hi(FH_TUERMODUL__MFHZ_copy)
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_2329_1)(a3)
	sb	zero,%lo(FH_TUERMODUL__MFHZ_copy)(a4)
.L203:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_1781_10)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a3)
	beq	a4,zero,.L204
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L204
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_1781_10)(a3)
.L204:
	lui	a3,%hi(sc_FH_TUERMODUL_CTRL_1739_10)
	lw	a4,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a3)
	beq	a4,zero,.L205
	lui	a2,%hi(time)
	lw	a2,%lo(time)(a2)
	beq	a4,a2,.L205
	sw	zero,%lo(sc_FH_TUERMODUL_CTRL_1739_10)(a3)
.L205:
	lbu	a5,0(a5)
	bne	a5,zero,.L206
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	lw	a4,%lo(BLOCK_ERKENNUNG_CTRL__N)(a4)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(a5)
	beq	a4,a5,.L197
.L206:
	lui	a5,%hi(time)
	lw	a4,%lo(time)(a5)
	lui	a5,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	sw	a4,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a5)
.L197:
	ret
.L198:
	lui	a4,%hi(time)
	lw	a4,%lo(time)(a4)
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	sw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a3)
.L200:
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	sw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a3)
	j	.L199
.L226:
	lui	a4,%hi(time)
	lw	a4,%lo(time)(a4)
	j	.L200
	.size	interface, .-interface
	.align	2
	.globl	init
	.type	init, @function
init:
	lui	a2,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	lui	a3,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lui	a4,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lui	a5,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lui	t2,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lui	t0,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lui	t6,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lui	t5,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lui	t4,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lui	t3,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lui	t1,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	lui	a7,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a6,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	lui	a0,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	lui	a1,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	sw	zero,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a2)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a3)
	lui	a2,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	lui	a3,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	sw	zero,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a4)
	sb	zero,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a5)
	lui	a4,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(t2)
	sb	zero,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(t0)
	sb	zero,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(t6)
	sb	zero,%lo(B_FH_TUERMODUL_CTRL_next_state)(t5)
	sb	zero,%lo(A_FH_TUERMODUL_CTRL_next_state)(t4)
	sb	zero,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(t3)
	sb	zero,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(t1)
	sb	zero,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a7)
	sb	zero,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a6)
	sb	zero,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a0)
	sb	zero,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a1)
	sb	zero,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a2)
	sb	zero,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	sb	zero,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a4)
	sb	zero,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	ret
	.size	init, .-init
	.align	2
	.globl	generic_KINDERSICHERUNG_CTRL
	.type	generic_KINDERSICHERUNG_CTRL, @function
generic_KINDERSICHERUNG_CTRL:
	lui	a5,%hi(.LANCHOR0+10)
	lbu	a5,%lo(.LANCHOR0+10)(a5)
	beq	a5,zero,.L228
	tail	generic_KINDERSICHERUNG_CTRL.part.0
.L228:
	ret
	.size	generic_KINDERSICHERUNG_CTRL, .-generic_KINDERSICHERUNG_CTRL
	.align	2
	.globl	generic_FH_TUERMODUL_CTRL
	.type	generic_FH_TUERMODUL_CTRL, @function
generic_FH_TUERMODUL_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,13(a5)
	beq	a4,zero,.L231
	tail	generic_FH_TUERMODUL_CTRL.part.0
.L231:
	lbu	a4,15(a5)
	beq	a4,zero,.L230
	lbu	a4,14(a5)
	bne	a4,zero,.L230
	sb	zero,4(a5)
	sb	zero,6(a5)
.L230:
	ret
	.size	generic_FH_TUERMODUL_CTRL, .-generic_FH_TUERMODUL_CTRL
	.align	2
	.globl	generic_EINKLEMMSCHUTZ_CTRL
	.type	generic_EINKLEMMSCHUTZ_CTRL, @function
generic_EINKLEMMSCHUTZ_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,16(a5)
	beq	a4,zero,.L236
	lui	a3,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	lbu	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	li	a2,1
	beq	a4,a2,.L239
	li	a1,2
	bne	a4,a1,.L253
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a4)
	sb	zero,24(a5)
	bne	a4,zero,.L236
	lui	a5,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	lbu	a5,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(a5)
	beq	a5,zero,.L236
.L253:
	lui	a5,%hi(stable)
	sb	a2,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
.L236:
	ret
.L239:
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a4)
	beq	a4,zero,.L236
	lui	a4,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	lbu	a4,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(a4)
	bne	a4,zero,.L236
	lui	a4,%hi(FH_TUERMODUL__SFHZ)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ)(a4)
	beq	a4,zero,.L243
	lui	a4,%hi(FH_TUERMODUL__SFHA)
	lbu	a4,%lo(FH_TUERMODUL__SFHA)(a4)
	bne	a4,zero,.L236
.L243:
	lui	a1,%hi(stable)
	li	a2,1
	li	a4,2
	sb	zero,%lo(stable)(a1)
	sb	a2,24(a5)
	sb	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a3)
	ret
	.size	generic_EINKLEMMSCHUTZ_CTRL, .-generic_EINKLEMMSCHUTZ_CTRL
	.align	2
	.globl	generic_BLOCK_ERKENNUNG_CTRL
	.type	generic_BLOCK_ERKENNUNG_CTRL, @function
generic_BLOCK_ERKENNUNG_CTRL:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lbu	a4,19(a5)
	beq	a4,zero,.L255
	lui	a3,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	li	a2,1
	beq	a4,a2,.L256
	li	a1,2
	bne	a4,a1,.L273
	lui	a4,%hi(FH_TUERMODUL__MFHA)
	lbu	a4,%lo(FH_TUERMODUL__MFHA)(a4)
	bne	a4,zero,.L262
	lui	a4,%hi(FH_TUERMODUL__MFHA_old)
	lbu	a4,%lo(FH_TUERMODUL__MFHA_old)(a4)
	bne	a4,zero,.L263
.L262:
	lui	a4,%hi(FH_TUERMODUL__MFHZ)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ)(a4)
	bne	a4,zero,.L264
	lui	a4,%hi(FH_TUERMODUL__MFHZ_old)
	lbu	a4,%lo(FH_TUERMODUL__MFHZ_old)(a4)
	bne	a4,zero,.L263
.L264:
	lui	a3,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	li	a2,2
	beq	a4,a2,.L265
	li	a1,3
	beq	a4,a1,.L266
	li	a0,1
	beq	a4,a0,.L254
	lui	a7,%hi(stable)
	lui	a6,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	sb	a1,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	a0,0(a5)
	sb	zero,%lo(stable)(a7)
	sw	zero,%lo(BLOCK_ERKENNUNG_CTRL__N)(a6)
	sw	a2,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a4)
	ret
.L255:
	lbu	a4,21(a5)
	beq	a4,zero,.L254
	lbu	a4,20(a5)
	bne	a4,zero,.L254
	sb	zero,0(a5)
	ret
.L273:
	lui	a5,%hi(stable)
	sb	a2,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
.L254:
	ret
.L256:
	lui	a2,%hi(FH_TUERMODUL__I_EIN)
	lui	a1,%hi(FH_TUERMODUL__I_EIN_old)
	lw	a2,%lo(FH_TUERMODUL__I_EIN)(a2)
	lw	a1,%lo(FH_TUERMODUL__I_EIN_old)(a1)
	beq	a2,a1,.L254
	ble	a2,zero,.L254
	li	a2,2
	lui	t3,%hi(stable)
	lui	t1,%hi(FH_TUERMODUL__BLOCK_copy)
	lui	a7,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	lui	a6,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lui	a1,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	li	a0,3
	sb	a4,0(a5)
	sb	zero,%lo(stable)(t3)
	sb	zero,%lo(FH_TUERMODUL__BLOCK_copy)(t1)
	sb	a2,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sw	a2,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a7)
	sw	zero,%lo(BLOCK_ERKENNUNG_CTRL__N)(a6)
	sb	a0,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a1)
	ret
.L263:
	lui	a2,%hi(stable)
	li	a4,1
	lui	a5,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,%lo(stable)(a2)
	sb	a4,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	ret
.L266:
	lui	a4,%hi(BLOCK_ERKENNUNG_CTRL__N)
	lw	a4,%lo(BLOCK_ERKENNUNG_CTRL__N)(a4)
	sb	zero,0(a5)
	li	a5,11
	bne	a4,a5,.L254
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(a5)
	beq	a5,a4,.L254
	lui	a5,%hi(stable)
	sb	a2,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	sb	zero,%lo(stable)(a5)
	ret
.L265:
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)
	lw	a5,%lo(BLOCK_ERKENNUNG_CTRL__I_EIN_MAX)(a5)
	lui	a4,%hi(FH_TUERMODUL__I_EIN)
	lw	a4,%lo(FH_TUERMODUL__I_EIN)(a4)
	addi	a5,a5,-1
	bgt	a5,a4,.L254
	li	a5,1
	lui	a2,%hi(stable)
	lui	a4,%hi(FH_TUERMODUL__BLOCK_copy)
	sb	zero,%lo(stable)(a2)
	sb	a5,%lo(FH_TUERMODUL__BLOCK_copy)(a4)
	sb	a5,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a3)
	ret
	.size	generic_BLOCK_ERKENNUNG_CTRL, .-generic_BLOCK_ERKENNUNG_CTRL
	.align	2
	.globl	FH_DU
	.type	FH_DU, @function
FH_DU:
	lui	a5,%hi(FH_DU__S_FH_TMBFZUCAN)
	lbu	a4,%lo(FH_DU__S_FH_TMBFZUCAN)(a5)
	lui	a5,%hi(FH_DU__S_FH_TMBFZUCAN_old)
	addi	sp,sp,-64
	lbu	t5,%lo(FH_DU__S_FH_TMBFZUCAN_old)(a5)
	lui	a5,%hi(FH_DU__S_FH_TMBFAUFDISC)
	sw	s0,56(sp)
	lui	a3,%hi(FH_DU__S_FH_TMBFAUFCAN_old)
	lbu	a0,%lo(FH_DU__S_FH_TMBFAUFDISC)(a5)
	lui	s0,%hi(.LANCHOR0)
	lui	a5,%hi(FH_DU__S_FH_TMBFAUFDISC_old)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s11,12(sp)
	sw	ra,60(sp)
	sw	s10,16(sp)
	addi	s0,s0,%lo(.LANCHOR0)
	lbu	t2,%lo(FH_DU__S_FH_TMBFAUFDISC_old)(a5)
	lbu	t0,%lo(FH_DU__S_FH_TMBFAUFCAN_old)(a3)
	lui	a5,%hi(FH_DU__S_FH_TMBFAUFCAN)
	lui	a3,%hi(FH_DU__S_FH_TMBFZUDISC)
	lbu	a2,%lo(FH_DU__S_FH_TMBFZUDISC)(a3)
	lbu	t3,10(s0)
	lui	a3,%hi(FH_DU__S_FH_TMBFZUDISC_old)
	lbu	t1,16(s0)
	lbu	a7,19(s0)
	lbu	a6,13(s0)
	lbu	a5,%lo(FH_DU__S_FH_TMBFAUFCAN)(a5)
	lui	a1,%hi(time)
	lbu	t6,%lo(FH_DU__S_FH_TMBFZUDISC_old)(a3)
	li	a3,1
	sw	a3,%lo(time)(a1)
	lui	s5,%hi(FH_DU__MFHZ)
	li	a1,0
	lui	s6,%hi(FH_DU__MFHA)
	lui	s4,%hi(FH_DU__S_FH_FTZU)
	lui	s1,%hi(FH_DU__S_FH_FTAUF)
	lui	s3,%hi(FH_DU__S_FH_AUFDISC)
	lui	s2,%hi(FH_DU__S_FH_ZUDISC)
	lui	s11,%hi(FH_TUERMODUL__I_EIN)
	lui	s9,%hi(FH_DU__EKS_LEISTE_AKTIV)
	lui	s8,%hi(FH_DU__POSITION)
	lui	s7,%hi(FH_DU__FT)
.L301:
	lui	t4,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	addi	a1,a1,1
	lui	s10,%hi(step)
	lbu	t4,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(t4)
	sb	a1,%lo(step)(s10)
	lui	a1,%hi(stable)
	sb	a3,%lo(stable)(a1)
	li	a1,2
	beq	t4,a1,.L275
	li	a1,3
	beq	t4,a1,.L276
	li	a1,1
	bne	t4,a1,.L277
	lbu	a1,%lo(FH_DU__MFHZ)(s5)
	bne	a1,zero,.L278
	lui	a1,%hi(FH_DU__MFHZ_old)
	lbu	a1,%lo(FH_DU__MFHZ_old)(a1)
	beq	a1,zero,.L278
.L277:
	lui	a1,%hi(stable)
	sb	zero,%lo(stable)(a1)
	lui	a1,%hi(FH_DU__MFH)
	sw	zero,%lo(FH_DU__MFH)(a1)
	li	t4,2
	lui	a1,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	t4,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a1)
.L278:
	bne	t3,zero,.L281
	lui	a1,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	li	t3,3
	sb	t3,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a1)
.L281:
	bne	t1,zero,.L282
	lui	a1,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	sb	a3,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a1)
.L282:
	bne	a7,zero,.L283
	lui	a1,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	sb	zero,0(s0)
	sb	a3,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a1)
.L283:
	bne	a6,zero,.L284
	lui	a7,%hi(FH_TUERMODUL_CTRL__N)
	lui	a6,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lui	a1,%hi(A_FH_TUERMODUL_CTRL_next_state)
	sw	zero,%lo(FH_TUERMODUL_CTRL__N)(a7)
	li	a7,2
	sb	a7,%lo(B_FH_TUERMODUL_CTRL_next_state)(a6)
	sb	a3,%lo(A_FH_TUERMODUL_CTRL_next_state)(a1)
	li	a6,256
	lui	a1,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	sb	zero,6(s0)
	sh	a6,4(s0)
	sb	a3,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a1)
.L284:
	sb	a3,11(s0)
	sb	a3,17(s0)
	sb	a3,20(s0)
	sb	a3,14(s0)
	beq	a4,t5,.L328
	lui	a1,%hi(FH_DU__DOOR_ID)
	lbu	a1,%lo(FH_DU__DOOR_ID)(a1)
	bne	a1,zero,.L288
	sb	a4,%lo(FH_DU__S_FH_FTZU)(s4)
	beq	a2,t6,.L287
.L289:
	beq	a5,t0,.L325
.L303:
	sb	a5,%lo(FH_DU__S_FH_FTAUF)(s1)
.L292:
	lbu	a7,18(s0)
	lbu	a6,21(s0)
	lbu	a0,12(s0)
	lbu	t0,15(s0)
	lbu	a1,%lo(FH_DU__S_FH_AUFDISC)(s3)
	lbu	a2,%lo(FH_DU__S_FH_ZUDISC)(s2)
	lui	t1,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lui	t3,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	sb	a7,16(s0)
	sb	a6,19(s0)
	lui	a7,%hi(FH_TUERMODUL__SFHZ_MEC)
	lui	a6,%hi(FH_TUERMODUL__SFHA_MEC)
	sb	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(t1)
	sb	a4,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(t3)
	sb	a0,10(s0)
	sb	t0,13(s0)
	sb	a1,%lo(FH_TUERMODUL__SFHA_MEC)(a6)
	sb	a2,%lo(FH_TUERMODUL__SFHZ_MEC)(a7)
	mv	s10,a7
	beq	a0,zero,.L295
	call	generic_KINDERSICHERUNG_CTRL.part.0
	lui	a6,%hi(FH_TUERMODUL__SFHA_MEC)
	lui	t1,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lui	t3,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a1,%lo(FH_TUERMODUL__SFHA_MEC)(a6)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(t1)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_MEC)(s10)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(t3)
	lbu	t0,13(s0)
.L295:
	lui	a0,%hi(FH_TUERMODUL__MFHA)
	lbu	t6,%lo(FH_TUERMODUL__MFHA)(a0)
	lui	a6,%hi(FH_TUERMODUL__MFHZ)
	lui	a7,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lui	t2,%hi(FH_TUERMODUL__FT)
	lui	a0,%hi(FH_TUERMODUL__KL_50)
	lw	t4,%lo(FH_TUERMODUL__I_EIN)(s11)
	lbu	t5,%lo(FH_TUERMODUL__MFHZ)(a6)
	lbu	t3,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a7)
	lbu	a6,%lo(FH_TUERMODUL__KL_50)(a0)
	lbu	a7,%lo(FH_TUERMODUL__FT)(t2)
	lui	a3,%hi(FH_TUERMODUL__POSITION)
	lui	t2,%hi(FH_TUERMODUL__BLOCK)
	lui	s10,%hi(FH_DU__I_EIN)
	lw	t1,%lo(FH_TUERMODUL__POSITION)(a3)
	lbu	a0,%lo(FH_TUERMODUL__BLOCK)(t2)
	sw	t4,%lo(FH_DU__I_EIN)(s10)
	lui	s10,%hi(FH_DU__KL_50)
	sb	a6,%lo(FH_DU__KL_50)(s10)
	lui	s10,%hi(FH_DU__BLOCK)
	sb	a1,%lo(FH_DU__S_FH_AUFDISC)(s3)
	sb	a5,%lo(FH_DU__S_FH_FTAUF)(s1)
	sb	a2,%lo(FH_DU__S_FH_ZUDISC)(s2)
	sb	a4,%lo(FH_DU__S_FH_FTZU)(s4)
	sb	t6,%lo(FH_DU__MFHA)(s6)
	sb	t5,%lo(FH_DU__MFHZ)(s5)
	sb	t3,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sw	t1,%lo(FH_DU__POSITION)(s8)
	sb	a7,%lo(FH_DU__FT)(s7)
	sb	a0,%lo(FH_DU__BLOCK)(s10)
	beq	t0,zero,.L296
	call	generic_FH_TUERMODUL_CTRL.part.0
	lui	a5,%hi(FH_TUERMODUL__POSITION)
	lui	a0,%hi(FH_TUERMODUL__MFHA)
	lui	a7,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lui	t2,%hi(FH_TUERMODUL__FT)
	lui	a4,%hi(FH_TUERMODUL__SFHZ_MEC)
	lw	t1,%lo(FH_TUERMODUL__POSITION)(a5)
	lui	a5,%hi(FH_TUERMODUL__SFHA_MEC)
	lui	a6,%hi(FH_TUERMODUL__MFHZ)
	lbu	t6,%lo(FH_TUERMODUL__MFHA)(a0)
	lbu	t3,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a7)
	lui	a0,%hi(FH_TUERMODUL__KL_50)
	lbu	a7,%lo(FH_TUERMODUL__FT)(t2)
	lbu	a1,%lo(FH_TUERMODUL__SFHA_MEC)(a5)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_MEC)(a4)
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lui	a4,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lui	t2,%hi(FH_TUERMODUL__BLOCK)
	lbu	t5,%lo(FH_TUERMODUL__MFHZ)(a6)
	lw	t4,%lo(FH_TUERMODUL__I_EIN)(s11)
	lbu	a6,%lo(FH_TUERMODUL__KL_50)(a0)
	lbu	a5,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a4)
	lbu	a0,%lo(FH_TUERMODUL__BLOCK)(t2)
.L297:
	lui	a3,%hi(FH_DU__I_EIN)
	sb	a5,%lo(FH_DU__S_FH_FTAUF)(s1)
	sb	a4,%lo(FH_DU__S_FH_FTZU)(s4)
	lui	a5,%hi(FH_DU__KL_50)
	lui	a4,%hi(FH_DU__BLOCK)
	mv	s10,a5
	sw	t4,%lo(FH_DU__I_EIN)(a3)
	sb	a6,%lo(FH_DU__KL_50)(a5)
	sb	a0,%lo(FH_DU__BLOCK)(a4)
	sb	t6,%lo(FH_DU__MFHA)(s6)
	sb	t5,%lo(FH_DU__MFHZ)(s5)
	sb	t3,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sw	t1,%lo(FH_DU__POSITION)(s8)
	sb	a7,%lo(FH_DU__FT)(s7)
	sb	a1,%lo(FH_DU__S_FH_AUFDISC)(s3)
	sb	a2,%lo(FH_DU__S_FH_ZUDISC)(s2)
	call	generic_EINKLEMMSCHUTZ_CTRL
	lui	a0,%hi(FH_TUERMODUL__MFHZ)
	lui	t2,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lbu	t5,%lo(FH_TUERMODUL__MFHZ)(a0)
	lui	a6,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lbu	a0,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(t2)
	lui	t0,%hi(FH_TUERMODUL__SFHA_MEC)
	lui	t2,%hi(FH_TUERMODUL__KL_50)
	lbu	t3,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a6)
	lbu	a4,%lo(FH_TUERMODUL__KL_50)(t2)
	lbu	a6,%lo(FH_TUERMODUL__SFHA_MEC)(t0)
	lui	a1,%hi(FH_TUERMODUL__MFHA)
	lui	t0,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lui	a5,%hi(FH_TUERMODUL__POSITION)
	lui	a2,%hi(FH_TUERMODUL__SFHZ_MEC)
	lui	a3,%hi(FH_TUERMODUL__BLOCK)
	lui	a7,%hi(FH_TUERMODUL__FT)
	lbu	t6,%lo(FH_TUERMODUL__MFHA)(a1)
	lw	t1,%lo(FH_TUERMODUL__POSITION)(a5)
	lbu	a1,%lo(FH_TUERMODUL__SFHZ_MEC)(a2)
	lbu	a5,%lo(FH_TUERMODUL__BLOCK)(a3)
	lbu	a2,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(t0)
	lw	t4,%lo(FH_TUERMODUL__I_EIN)(s11)
	lbu	a7,%lo(FH_TUERMODUL__FT)(a7)
	lui	a3,%hi(FH_DU__I_EIN)
	sb	a4,%lo(FH_DU__KL_50)(s10)
	lui	a4,%hi(FH_DU__BLOCK)
	sw	t4,%lo(FH_DU__I_EIN)(a3)
	sb	a5,%lo(FH_DU__BLOCK)(a4)
	sb	t6,%lo(FH_DU__MFHA)(s6)
	sb	t5,%lo(FH_DU__MFHZ)(s5)
	sb	t3,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sw	t1,%lo(FH_DU__POSITION)(s8)
	sb	a7,%lo(FH_DU__FT)(s7)
	sb	a6,%lo(FH_DU__S_FH_AUFDISC)(s3)
	sb	a0,%lo(FH_DU__S_FH_FTAUF)(s1)
	sb	a1,%lo(FH_DU__S_FH_ZUDISC)(s2)
	sb	a2,%lo(FH_DU__S_FH_FTZU)(s4)
	call	generic_BLOCK_ERKENNUNG_CTRL
	lui	a5,%hi(FH_TUERMODUL__POSITION)
	lui	t1,%hi(FH_TUERMODUL__KL_50)
	lw	a7,%lo(FH_TUERMODUL__POSITION)(a5)
	lbu	t0,%lo(FH_TUERMODUL__KL_50)(t1)
	lui	a5,%hi(FH_TUERMODUL__FT)
	lui	t1,%hi(FH_TUERMODUL_CTRL__N)
	lbu	t2,%lo(FH_TUERMODUL__FT)(a5)
	lw	t6,%lo(FH_TUERMODUL_CTRL__N)(t1)
	lui	a5,%hi(FH_TUERMODUL__SFHA_MEC)
	lui	t1,%hi(FH_DU__MFH_copy)
	lbu	a0,%lo(FH_TUERMODUL__SFHA_MEC)(a5)
	lw	t5,%lo(FH_DU__MFH_copy)(t1)
	lui	a5,%hi(FH_TUERMODUL__SFHA_ZENTRAL)
	lw	t4,%lo(FH_TUERMODUL__I_EIN)(s11)
	lbu	a2,%lo(FH_TUERMODUL__SFHA_ZENTRAL)(a5)
	sb	t0,%lo(FH_DU__KL_50)(s10)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_MEC)
	lui	t0,%hi(FH_TUERMODUL_CTRL__N_old)
	lbu	a4,%lo(FH_TUERMODUL__SFHZ_MEC)(a5)
	sw	t6,%lo(FH_TUERMODUL_CTRL__N_old)(t0)
	lui	a6,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV)
	lui	t0,%hi(FH_DU__MFH)
	lui	a5,%hi(FH_TUERMODUL__SFHZ_ZENTRAL)
	lbu	a1,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV)(a6)
	lbu	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL)(a5)
	sw	t5,%lo(FH_DU__MFH)(t0)
	lbu	t3,10(s0)
	lbu	a6,13(s0)
	lbu	t1,16(s0)
	sw	a7,%lo(FH_DU__POSITION)(s8)
	lui	t0,%hi(FH_TUERMODUL__I_EIN_old)
	lbu	a7,19(s0)
	sw	t4,%lo(FH_TUERMODUL__I_EIN_old)(t0)
	lui	a3,%hi(FH_DU__I_EIN)
	lui	t0,%hi(FH_DU__I_EIN_old)
	sw	t4,%lo(FH_DU__I_EIN)(a3)
	sw	t4,%lo(FH_DU__I_EIN_old)(t0)
	lui	t4,%hi(BLOCK_ERKENNUNG_CTRL__N)
	sb	t2,%lo(FH_DU__FT)(s7)
	sb	a1,%lo(FH_DU__EKS_LEISTE_AKTIV)(s9)
	sb	a0,%lo(FH_DU__S_FH_AUFDISC)(s3)
	sb	a2,%lo(FH_DU__S_FH_FTAUF)(s1)
	sb	a4,%lo(FH_DU__S_FH_ZUDISC)(s2)
	sb	a5,%lo(FH_DU__S_FH_FTZU)(s4)
	lui	s10,%hi(FH_TUERMODUL__SFHA_copy)
	sb	t3,11(s0)
	sb	a6,14(s0)
	sb	t1,17(s0)
	sb	a7,20(s0)
	lw	t4,%lo(BLOCK_ERKENNUNG_CTRL__N)(t4)
	lbu	t6,%lo(FH_TUERMODUL__SFHA_copy)(s10)
	lui	s10,%hi(FH_TUERMODUL__MFHZ_copy)
	lbu	t5,%lo(FH_TUERMODUL__MFHZ_copy)(s10)
	lui	s10,%hi(BLOCK_ERKENNUNG_CTRL__N_old)
	sw	t4,%lo(BLOCK_ERKENNUNG_CTRL__N_old)(s10)
	lui	s10,%hi(FH_TUERMODUL__SFHZ_ZENTRAL_old)
	sb	a5,%lo(FH_TUERMODUL__SFHZ_ZENTRAL_old)(s10)
	lui	s10,%hi(FH_TUERMODUL__SFHZ_MEC_old)
	sb	a4,%lo(FH_TUERMODUL__SFHZ_MEC_old)(s10)
	lui	s10,%hi(FH_DU__S_FH_TMBFZUCAN)
	lbu	a4,%lo(FH_DU__S_FH_TMBFZUCAN)(s10)
	lui	s10,%hi(FH_TUERMODUL__SFHA_ZENTRAL_old)
	sb	a2,%lo(FH_TUERMODUL__SFHA_ZENTRAL_old)(s10)
	lui	s10,%hi(FH_TUERMODUL__SFHA_MEC_old)
	sb	a0,%lo(FH_TUERMODUL__SFHA_MEC_old)(s10)
	lui	s10,%hi(FH_DU__S_FH_TMBFAUFDISC)
	lbu	a0,%lo(FH_DU__S_FH_TMBFAUFDISC)(s10)
	lui	t0,%hi(FH_TUERMODUL__BLOCK_copy)
	lui	s10,%hi(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)
	lbu	t2,%lo(FH_TUERMODUL__BLOCK_copy)(t0)
	sb	a1,%lo(FH_TUERMODUL__EKS_LEISTE_AKTIV_old)(s10)
	lui	t0,%hi(FH_TUERMODUL__SFHZ_copy)
	lui	s10,%hi(FH_DU__EKS_LEISTE_AKTIV_old)
	lbu	t0,%lo(FH_TUERMODUL__SFHZ_copy)(t0)
	sb	a1,%lo(FH_DU__EKS_LEISTE_AKTIV_old)(s10)
	lui	s10,%hi(FH_DU__BLOCK_copy)
	lbu	a1,%lo(FH_DU__BLOCK_copy)(s10)
	lui	a3,%hi(FH_TUERMODUL__BLOCK)
	lui	s10,%hi(FH_TUERMODUL__BLOCK_old)
	sb	t2,%lo(FH_TUERMODUL__BLOCK)(a3)
	sb	t2,%lo(FH_TUERMODUL__BLOCK_old)(s10)
	lui	t2,%hi(FH_TUERMODUL__SFHZ)
	sb	t0,%lo(FH_TUERMODUL__SFHZ)(t2)
	lui	t2,%hi(FH_TUERMODUL__SFHZ_old)
	sb	t0,%lo(FH_TUERMODUL__SFHZ_old)(t2)
	lui	t0,%hi(FH_TUERMODUL__SFHA)
	sb	t6,%lo(FH_TUERMODUL__SFHA)(t0)
	lui	t4,%hi(FH_TUERMODUL__MFHA_copy)
	lui	t0,%hi(FH_TUERMODUL__SFHA_old)
	lbu	t4,%lo(FH_TUERMODUL__MFHA_copy)(t4)
	sb	t6,%lo(FH_TUERMODUL__SFHA_old)(t0)
	lui	t6,%hi(FH_TUERMODUL__MFHZ)
	sb	t5,%lo(FH_TUERMODUL__MFHZ)(t6)
	lui	a5,%hi(FH_DU__S_FH_TMBFAUFCAN)
	lui	t6,%hi(FH_TUERMODUL__MFHZ_old)
	sb	t5,%lo(FH_TUERMODUL__MFHZ_old)(t6)
	lbu	a5,%lo(FH_DU__S_FH_TMBFAUFCAN)(a5)
	lui	t5,%hi(FH_TUERMODUL__MFHA)
	sb	t4,%lo(FH_TUERMODUL__MFHA)(t5)
	lui	a2,%hi(FH_DU__S_FH_TMBFZUDISC)
	lui	t5,%hi(FH_TUERMODUL__MFHA_old)
	sb	t4,%lo(FH_TUERMODUL__MFHA_old)(t5)
	lbu	a2,%lo(FH_DU__S_FH_TMBFZUDISC)(a2)
	lui	t4,%hi(FH_DU__S_FH_TMBFAUFCAN_old)
	sb	a5,%lo(FH_DU__S_FH_TMBFAUFCAN_old)(t4)
	lui	t4,%hi(FH_DU__S_FH_TMBFZUCAN_old)
	sb	a4,%lo(FH_DU__S_FH_TMBFZUCAN_old)(t4)
	lui	t4,%hi(FH_DU__S_FH_TMBFZUDISC_old)
	sb	a2,%lo(FH_DU__S_FH_TMBFZUDISC_old)(t4)
	lui	t4,%hi(FH_DU__S_FH_TMBFAUFDISC_old)
	sb	a0,%lo(FH_DU__S_FH_TMBFAUFDISC_old)(t4)
	lui	a3,%hi(FH_DU__BLOCK)
	sb	a1,%lo(FH_DU__BLOCK)(a3)
	lui	a3,%hi(FH_DU__MFHZ_copy)
	lbu	t5,%lo(FH_DU__MFHZ_copy)(a3)
	lui	a3,%hi(FH_DU__MFHA_copy)
	lbu	t4,%lo(FH_DU__MFHA_copy)(a3)
	lui	a3,%hi(stable)
	lbu	t6,%lo(stable)(a3)
	lui	a3,%hi(FH_DU__BLOCK_old)
	sb	a1,%lo(FH_DU__BLOCK_old)(a3)
	lui	a3,%hi(FH_DU__MFHZ_old)
	sb	t5,%lo(FH_DU__MFHZ_old)(a3)
	lui	a3,%hi(FH_DU__MFHA_old)
	sb	t5,%lo(FH_DU__MFHZ)(s5)
	sb	t4,%lo(FH_DU__MFHA)(s6)
	sb	t4,%lo(FH_DU__MFHA_old)(a3)
	bne	t6,zero,.L274
	lui	a3,%hi(step)
	lbu	a1,%lo(step)(a3)
	mv	t6,a2
	mv	t0,a5
	mv	t2,a0
	mv	t5,a4
	li	a3,1
	j	.L301
.L328:
	lbu	a4,%lo(FH_DU__S_FH_FTZU)(s4)
	beq	a2,t6,.L287
	lui	a1,%hi(FH_DU__DOOR_ID)
	lbu	a1,%lo(FH_DU__DOOR_ID)(a1)
	beq	a1,zero,.L289
.L305:
	lui	a1,%hi(FH_DU__S_FH_TMBFZUCAN)
	sb	a2,%lo(FH_DU__S_FH_TMBFZUCAN)(a1)
.L287:
	beq	a5,t0,.L290
	lui	a2,%hi(FH_DU__DOOR_ID)
	lbu	a2,%lo(FH_DU__DOOR_ID)(a2)
	beq	a2,zero,.L303
.L291:
	beq	a0,t2,.L325
.L302:
	lui	a2,%hi(FH_DU__S_FH_TMBFAUFCAN)
	lbu	a5,%lo(FH_DU__S_FH_FTAUF)(s1)
	sb	a0,%lo(FH_DU__S_FH_TMBFAUFCAN)(a2)
	j	.L292
.L296:
	lbu	t0,15(s0)
	beq	t0,zero,.L297
	lbu	t0,14(s0)
	bne	t0,zero,.L297
	sb	zero,4(s0)
	sb	zero,6(s0)
	j	.L297
.L288:
	lbu	a4,%lo(FH_DU__S_FH_FTZU)(s4)
	bne	a2,t6,.L305
	bne	a5,t0,.L291
.L290:
	lbu	a5,%lo(FH_DU__S_FH_FTAUF)(s1)
	beq	a0,t2,.L292
	lui	a2,%hi(FH_DU__DOOR_ID)
	lbu	a2,%lo(FH_DU__DOOR_ID)(a2)
	bne	a2,zero,.L302
	j	.L292
.L276:
	lbu	a1,%lo(FH_DU__MFHA)(s6)
	bne	a1,zero,.L278
	lui	a1,%hi(FH_DU__MFHA_old)
	lbu	a1,%lo(FH_DU__MFHA_old)(a1)
	bne	a1,zero,.L277
	j	.L278
.L275:
	lbu	a1,%lo(FH_DU__MFHZ)(s5)
	beq	a1,zero,.L279
	lui	a1,%hi(FH_DU__MFHZ_old)
	lbu	a1,%lo(FH_DU__MFHZ_old)(a1)
	bne	a1,zero,.L279
	lui	t4,%hi(stable)
	sb	zero,%lo(stable)(t4)
	lui	t4,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	li	a1,-100
	sb	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(t4)
	lui	t4,%hi(FH_DU__MFH)
	sw	a1,%lo(FH_DU__MFH)(t4)
	j	.L278
.L325:
	lbu	a5,%lo(FH_DU__S_FH_FTAUF)(s1)
	j	.L292
.L279:
	lbu	a1,%lo(FH_DU__MFHA)(s6)
	beq	a1,zero,.L278
	lui	a1,%hi(FH_DU__MFHA_old)
	lbu	a1,%lo(FH_DU__MFHA_old)(a1)
	bne	a1,zero,.L278
	lui	s10,%hi(stable)
	li	t4,100
	sb	zero,%lo(stable)(s10)
	lui	s10,%hi(FH_DU__MFH)
	li	a1,3
	sw	t4,%lo(FH_DU__MFH)(s10)
	lui	t4,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	sb	a1,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(t4)
	j	.L278
.L274:
	lw	ra,60(sp)
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
	lw	s10,16(sp)
	lw	s11,12(sp)
	addi	sp,sp,64
	jr	ra
	.size	FH_DU, .-FH_DU
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
	beq	a1,zero,.L340
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s3,12(sp)
	lui	s0,%hi(.LANCHOR0+64)
	lui	s3,%hi(.LANCHOR0)
	sw	s2,16(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	ra,28(sp)
	sw	s1,20(sp)
	mv	s2,a1
	mv	s5,a0
	addi	s3,s3,%lo(.LANCHOR0)
	addi	s0,s0,%lo(.LANCHOR0+64)
	li	s4,0
.L330:
	li	s1,0
.L334:
	mv	a5,s3
.L332:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	s0,a5,.L332
	addi	s1,s1,1
	call	init
	call	interface
	call	FH_DU
	bne	s1,s2,.L334
	addi	s4,s4,1
	bne	s5,s4,.L330
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	addi	sp,sp,32
	jr	ra
.L340:
	ret
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
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
	li	a0,4096
	addi	sp,sp,-16
	addi	a0,a0,-766
	li	a1,1
	sw	ra,12(sp)
	call	benchmark_body.isra.0
	lw	ra,12(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
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
	lui	a5,%hi(.LANCHOR0)
	addi	sp,sp,-64
	li	a4,256
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a4,4(sp)
	sw	zero,0(sp)
	sw	zero,8(sp)
	sw	zero,12(sp)
	sw	zero,16(sp)
	sw	zero,20(sp)
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	zero,40(sp)
	sw	zero,44(sp)
	sw	zero,48(sp)
	sw	zero,52(sp)
	sw	zero,56(sp)
	sw	zero,60(sp)
	addi	a1,a5,64
	mv	a4,sp
	j	.L347
.L360:
	beq	a5,a1,.L359
.L347:
	lbu	a2,0(a5)
	lbu	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	beq	a2,a3,.L360
.L356:
	li	a0,0
.L345:
	addi	sp,sp,64
	jr	ra
.L359:
	lui	a4,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)
	lui	a5,%hi(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)
	lw	a3,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL)(a4)
	lw	a5,%lo(tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy)(a5)
	lui	a4,%hi(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)
	lw	a4,%lo(tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL)(a4)
	or	a5,a5,a3
	li	a0,0
	or	a5,a5,a4
	bne	a5,zero,.L345
	lui	a5,%hi(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)
	lbu	a4,%lo(KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state)(a5)
	li	a5,3
	bne	a4,a5,.L345
	lui	a5,%hi(B_FH_TUERMODUL_CTRL_next_state)
	lbu	a4,%lo(B_FH_TUERMODUL_CTRL_next_state)(a5)
	li	a5,2
	bne	a4,a5,.L345
	lui	a5,%hi(A_FH_TUERMODUL_CTRL_next_state)
	lbu	a3,%lo(A_FH_TUERMODUL_CTRL_next_state)(a5)
	li	a5,1
	bne	a3,a5,.L345
	lui	a5,%hi(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)
	lbu	a5,%lo(WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state)(a5)
	bne	a5,a3,.L345
	lui	a3,%hi(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)
	lbu	a3,%lo(FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state)(a3)
	bne	a3,a4,.L345
	lui	a4,%hi(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)
	lbu	a4,%lo(EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state)(a4)
	bne	a4,a5,.L345
	lui	a4,%hi(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)
	lui	a5,%hi(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)
	lbu	a3,%lo(ZENTRAL_KINDERSICHERUNG_CTRL_next_state)(a4)
	lbu	a5,%lo(NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state)(a5)
	lui	a4,%hi(MEC_KINDERSICHERUNG_CTRL_next_state)
	lbu	a1,%lo(MEC_KINDERSICHERUNG_CTRL_next_state)(a4)
	lui	a4,%hi(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)
	lbu	a2,%lo(INITIALISIERT_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a3
	lbu	a3,%lo(TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a1
	lbu	a1,%lo(MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(OEFFNEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a2
	lbu	a2,%lo(OEFFNEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)
	or	a5,a5,a3
	lbu	a3,%lo(SCHLIESSEN_FH_TUERMODUL_CTRL_next_state)(a4)
	lui	a4,%hi(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a4,%lo(BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state)(a4)
	or	a5,a5,a1
	or	a5,a5,a2
	or	a5,a5,a3
	or	a5,a5,a4
	bne	a5,zero,.L356
	lui	a5,%hi(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)
	lbu	a0,%lo(BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state)(a5)
	addi	a0,a0,-1
	seqz	a0,a0
	j	.L345
	.size	verify_benchmark, .-verify_benchmark
	.globl	BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state
	.globl	BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state
	.globl	EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state
	.globl	FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state
	.globl	SCHLIESSEN_FH_TUERMODUL_CTRL_next_state
	.globl	OEFFNEN_FH_TUERMODUL_CTRL_next_state
	.globl	MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state
	.globl	TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state
	.globl	INITIALISIERT_FH_TUERMODUL_CTRL_next_state
	.globl	WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state
	.globl	A_FH_TUERMODUL_CTRL_next_state
	.globl	B_FH_TUERMODUL_CTRL_next_state
	.globl	KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state
	.globl	MEC_KINDERSICHERUNG_CTRL_next_state
	.globl	ZENTRAL_KINDERSICHERUNG_CTRL_next_state
	.globl	NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state
	.globl	step
	.globl	stable
	.globl	time
	.globl	FH_DU__MFHA_old
	.globl	FH_DU__MFHA_copy
	.globl	FH_DU__MFHA
	.globl	FH_DU__MFHZ_old
	.globl	FH_DU__MFHZ_copy
	.globl	FH_DU__MFHZ
	.globl	FH_DU__BLOCK_old
	.globl	FH_DU__BLOCK_copy
	.globl	FH_DU__BLOCK
	.globl	FH_DU__DOOR_ID
	.globl	FH_DU__S_FH_AUFDISC
	.globl	FH_DU__S_FH_ZUDISC
	.globl	FH_DU__S_FH_TMBFAUFDISC_old
	.globl	FH_DU__S_FH_TMBFAUFDISC
	.globl	FH_DU__S_FH_TMBFZUDISC_old
	.globl	FH_DU__S_FH_TMBFZUDISC
	.globl	FH_DU__S_FH_TMBFZUCAN_old
	.globl	FH_DU__S_FH_TMBFZUCAN_copy
	.globl	FH_DU__S_FH_TMBFZUCAN
	.globl	FH_DU__S_FH_TMBFAUFCAN_old
	.globl	FH_DU__S_FH_TMBFAUFCAN_copy
	.globl	FH_DU__S_FH_TMBFAUFCAN
	.globl	FH_DU__EKS_LEISTE_AKTIV_old
	.globl	FH_DU__EKS_LEISTE_AKTIV
	.globl	FH_DU__FT
	.globl	FH_DU__S_FH_FTAUF
	.globl	FH_DU__S_FH_FTZU
	.globl	FH_DU__KL_50
	.globl	FH_TUERMODUL__COM_CLOSE
	.globl	FH_TUERMODUL__COM_OPEN
	.globl	FH_TUERMODUL__EKS_LEISTE_AKTIV_old
	.globl	FH_TUERMODUL__EKS_LEISTE_AKTIV
	.globl	FH_TUERMODUL__MFHA_old
	.globl	FH_TUERMODUL__MFHA_copy
	.globl	FH_TUERMODUL__MFHA
	.globl	FH_TUERMODUL__MFHZ_old
	.globl	FH_TUERMODUL__MFHZ_copy
	.globl	FH_TUERMODUL__MFHZ
	.globl	FH_TUERMODUL__SFHA_old
	.globl	FH_TUERMODUL__SFHA_copy
	.globl	FH_TUERMODUL__SFHA
	.globl	FH_TUERMODUL__SFHZ_old
	.globl	FH_TUERMODUL__SFHZ_copy
	.globl	FH_TUERMODUL__SFHZ
	.globl	FH_TUERMODUL__FT
	.globl	FH_TUERMODUL__BLOCK_old
	.globl	FH_TUERMODUL__BLOCK_copy
	.globl	FH_TUERMODUL__BLOCK
	.globl	FH_TUERMODUL__KL_50
	.globl	FH_TUERMODUL__SFHA_MEC_old
	.globl	FH_TUERMODUL__SFHA_MEC
	.globl	FH_TUERMODUL__SFHA_ZENTRAL_old
	.globl	FH_TUERMODUL__SFHA_ZENTRAL
	.globl	FH_TUERMODUL__SFHZ_MEC_old
	.globl	FH_TUERMODUL__SFHZ_MEC
	.globl	FH_TUERMODUL__SFHZ_ZENTRAL_old
	.globl	FH_TUERMODUL__SFHZ_ZENTRAL
	.globl	FH_TUERMODUL_CTRL__FT
	.globl	FH_TUERMODUL_CTRL__INREVERS1_copy
	.globl	FH_TUERMODUL_CTRL__INREVERS1
	.globl	FH_TUERMODUL_CTRL__INREVERS2_copy
	.globl	FH_TUERMODUL_CTRL__INREVERS2
	.globl	BLOCK_ERKENNUNG_CTRL__N_old
	.globl	BLOCK_ERKENNUNG_CTRL__N_copy
	.globl	BLOCK_ERKENNUNG_CTRL__N
	.globl	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy
	.globl	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX
	.globl	FH_DU__I_EIN_old
	.globl	FH_DU__I_EIN
	.globl	FH_DU__POSITION
	.globl	FH_DU__MFH_copy
	.globl	FH_DU__MFH
	.globl	FH_TUERMODUL__I_EIN_old
	.globl	FH_TUERMODUL__I_EIN
	.globl	FH_TUERMODUL__POSITION
	.globl	sc_FH_TUERMODUL_CTRL_1739_10
	.globl	sc_FH_TUERMODUL_CTRL_1781_10
	.globl	FH_TUERMODUL_CTRL__N_old
	.globl	FH_TUERMODUL_CTRL__N_copy
	.globl	FH_TUERMODUL_CTRL__N
	.globl	sc_FH_TUERMODUL_CTRL_2329_1
	.globl	sc_FH_TUERMODUL_CTRL_2352_1
	.globl	sc_FH_TUERMODUL_CTRL_2375_2
	.globl	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL
	.globl	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL
	.globl	tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	Bitlist, @object
	.size	Bitlist, 64
Bitlist:
	.zero	64
	.section	.sbss,"aw",@nobits
	.align	2
	.type	BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state, @object
	.size	BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state, 1
BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state:
	.zero	1
	.type	BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state, @object
	.size	BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state, 1
BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state:
	.zero	1
	.type	EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state, @object
	.size	EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state, 1
EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state:
	.zero	1
	.type	FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state, @object
	.size	FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state, 1
FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state:
	.zero	1
	.type	SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, 1
SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	OEFFNEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	OEFFNEN_FH_TUERMODUL_CTRL_next_state, 1
OEFFNEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, 1
MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, @object
	.size	TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state, 1
TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	INITIALISIERT_FH_TUERMODUL_CTRL_next_state, @object
	.size	INITIALISIERT_FH_TUERMODUL_CTRL_next_state, 1
INITIALISIERT_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state, @object
	.size	WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state, 1
WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	A_FH_TUERMODUL_CTRL_next_state, @object
	.size	A_FH_TUERMODUL_CTRL_next_state, 1
A_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	B_FH_TUERMODUL_CTRL_next_state, @object
	.size	B_FH_TUERMODUL_CTRL_next_state, 1
B_FH_TUERMODUL_CTRL_next_state:
	.zero	1
	.type	KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state, @object
	.size	KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state, 1
KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state:
	.zero	1
	.type	MEC_KINDERSICHERUNG_CTRL_next_state, @object
	.size	MEC_KINDERSICHERUNG_CTRL_next_state, 1
MEC_KINDERSICHERUNG_CTRL_next_state:
	.zero	1
	.type	ZENTRAL_KINDERSICHERUNG_CTRL_next_state, @object
	.size	ZENTRAL_KINDERSICHERUNG_CTRL_next_state, 1
ZENTRAL_KINDERSICHERUNG_CTRL_next_state:
	.zero	1
	.type	NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state, @object
	.size	NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state, 1
NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state:
	.zero	1
	.type	step, @object
	.size	step, 1
step:
	.zero	1
	.type	stable, @object
	.size	stable, 1
stable:
	.zero	1
	.zero	2
	.type	time, @object
	.size	time, 4
time:
	.zero	4
	.type	FH_DU__MFHA_old, @object
	.size	FH_DU__MFHA_old, 1
FH_DU__MFHA_old:
	.zero	1
	.type	FH_DU__MFHA_copy, @object
	.size	FH_DU__MFHA_copy, 1
FH_DU__MFHA_copy:
	.zero	1
	.type	FH_DU__MFHA, @object
	.size	FH_DU__MFHA, 1
FH_DU__MFHA:
	.zero	1
	.type	FH_DU__MFHZ_old, @object
	.size	FH_DU__MFHZ_old, 1
FH_DU__MFHZ_old:
	.zero	1
	.type	FH_DU__MFHZ_copy, @object
	.size	FH_DU__MFHZ_copy, 1
FH_DU__MFHZ_copy:
	.zero	1
	.type	FH_DU__MFHZ, @object
	.size	FH_DU__MFHZ, 1
FH_DU__MFHZ:
	.zero	1
	.type	FH_DU__BLOCK_old, @object
	.size	FH_DU__BLOCK_old, 1
FH_DU__BLOCK_old:
	.zero	1
	.type	FH_DU__BLOCK_copy, @object
	.size	FH_DU__BLOCK_copy, 1
FH_DU__BLOCK_copy:
	.zero	1
	.type	FH_DU__BLOCK, @object
	.size	FH_DU__BLOCK, 1
FH_DU__BLOCK:
	.zero	1
	.type	FH_DU__DOOR_ID, @object
	.size	FH_DU__DOOR_ID, 1
FH_DU__DOOR_ID:
	.zero	1
	.type	FH_DU__S_FH_AUFDISC, @object
	.size	FH_DU__S_FH_AUFDISC, 1
FH_DU__S_FH_AUFDISC:
	.zero	1
	.type	FH_DU__S_FH_ZUDISC, @object
	.size	FH_DU__S_FH_ZUDISC, 1
FH_DU__S_FH_ZUDISC:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFDISC_old, @object
	.size	FH_DU__S_FH_TMBFAUFDISC_old, 1
FH_DU__S_FH_TMBFAUFDISC_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFDISC, @object
	.size	FH_DU__S_FH_TMBFAUFDISC, 1
FH_DU__S_FH_TMBFAUFDISC:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUDISC_old, @object
	.size	FH_DU__S_FH_TMBFZUDISC_old, 1
FH_DU__S_FH_TMBFZUDISC_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUDISC, @object
	.size	FH_DU__S_FH_TMBFZUDISC, 1
FH_DU__S_FH_TMBFZUDISC:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUCAN_old, @object
	.size	FH_DU__S_FH_TMBFZUCAN_old, 1
FH_DU__S_FH_TMBFZUCAN_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUCAN_copy, @object
	.size	FH_DU__S_FH_TMBFZUCAN_copy, 1
FH_DU__S_FH_TMBFZUCAN_copy:
	.zero	1
	.type	FH_DU__S_FH_TMBFZUCAN, @object
	.size	FH_DU__S_FH_TMBFZUCAN, 1
FH_DU__S_FH_TMBFZUCAN:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFCAN_old, @object
	.size	FH_DU__S_FH_TMBFAUFCAN_old, 1
FH_DU__S_FH_TMBFAUFCAN_old:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFCAN_copy, @object
	.size	FH_DU__S_FH_TMBFAUFCAN_copy, 1
FH_DU__S_FH_TMBFAUFCAN_copy:
	.zero	1
	.type	FH_DU__S_FH_TMBFAUFCAN, @object
	.size	FH_DU__S_FH_TMBFAUFCAN, 1
FH_DU__S_FH_TMBFAUFCAN:
	.zero	1
	.type	FH_DU__EKS_LEISTE_AKTIV_old, @object
	.size	FH_DU__EKS_LEISTE_AKTIV_old, 1
FH_DU__EKS_LEISTE_AKTIV_old:
	.zero	1
	.type	FH_DU__EKS_LEISTE_AKTIV, @object
	.size	FH_DU__EKS_LEISTE_AKTIV, 1
FH_DU__EKS_LEISTE_AKTIV:
	.zero	1
	.type	FH_DU__FT, @object
	.size	FH_DU__FT, 1
FH_DU__FT:
	.zero	1
	.type	FH_DU__S_FH_FTAUF, @object
	.size	FH_DU__S_FH_FTAUF, 1
FH_DU__S_FH_FTAUF:
	.zero	1
	.type	FH_DU__S_FH_FTZU, @object
	.size	FH_DU__S_FH_FTZU, 1
FH_DU__S_FH_FTZU:
	.zero	1
	.type	FH_DU__KL_50, @object
	.size	FH_DU__KL_50, 1
FH_DU__KL_50:
	.zero	1
	.type	FH_TUERMODUL__COM_CLOSE, @object
	.size	FH_TUERMODUL__COM_CLOSE, 1
FH_TUERMODUL__COM_CLOSE:
	.zero	1
	.type	FH_TUERMODUL__COM_OPEN, @object
	.size	FH_TUERMODUL__COM_OPEN, 1
FH_TUERMODUL__COM_OPEN:
	.zero	1
	.type	FH_TUERMODUL__EKS_LEISTE_AKTIV_old, @object
	.size	FH_TUERMODUL__EKS_LEISTE_AKTIV_old, 1
FH_TUERMODUL__EKS_LEISTE_AKTIV_old:
	.zero	1
	.type	FH_TUERMODUL__EKS_LEISTE_AKTIV, @object
	.size	FH_TUERMODUL__EKS_LEISTE_AKTIV, 1
FH_TUERMODUL__EKS_LEISTE_AKTIV:
	.zero	1
	.type	FH_TUERMODUL__MFHA_old, @object
	.size	FH_TUERMODUL__MFHA_old, 1
FH_TUERMODUL__MFHA_old:
	.zero	1
	.type	FH_TUERMODUL__MFHA_copy, @object
	.size	FH_TUERMODUL__MFHA_copy, 1
FH_TUERMODUL__MFHA_copy:
	.zero	1
	.type	FH_TUERMODUL__MFHA, @object
	.size	FH_TUERMODUL__MFHA, 1
FH_TUERMODUL__MFHA:
	.zero	1
	.type	FH_TUERMODUL__MFHZ_old, @object
	.size	FH_TUERMODUL__MFHZ_old, 1
FH_TUERMODUL__MFHZ_old:
	.zero	1
	.type	FH_TUERMODUL__MFHZ_copy, @object
	.size	FH_TUERMODUL__MFHZ_copy, 1
FH_TUERMODUL__MFHZ_copy:
	.zero	1
	.type	FH_TUERMODUL__MFHZ, @object
	.size	FH_TUERMODUL__MFHZ, 1
FH_TUERMODUL__MFHZ:
	.zero	1
	.type	FH_TUERMODUL__SFHA_old, @object
	.size	FH_TUERMODUL__SFHA_old, 1
FH_TUERMODUL__SFHA_old:
	.zero	1
	.type	FH_TUERMODUL__SFHA_copy, @object
	.size	FH_TUERMODUL__SFHA_copy, 1
FH_TUERMODUL__SFHA_copy:
	.zero	1
	.type	FH_TUERMODUL__SFHA, @object
	.size	FH_TUERMODUL__SFHA, 1
FH_TUERMODUL__SFHA:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_old, @object
	.size	FH_TUERMODUL__SFHZ_old, 1
FH_TUERMODUL__SFHZ_old:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_copy, @object
	.size	FH_TUERMODUL__SFHZ_copy, 1
FH_TUERMODUL__SFHZ_copy:
	.zero	1
	.type	FH_TUERMODUL__SFHZ, @object
	.size	FH_TUERMODUL__SFHZ, 1
FH_TUERMODUL__SFHZ:
	.zero	1
	.type	FH_TUERMODUL__FT, @object
	.size	FH_TUERMODUL__FT, 1
FH_TUERMODUL__FT:
	.zero	1
	.type	FH_TUERMODUL__BLOCK_old, @object
	.size	FH_TUERMODUL__BLOCK_old, 1
FH_TUERMODUL__BLOCK_old:
	.zero	1
	.type	FH_TUERMODUL__BLOCK_copy, @object
	.size	FH_TUERMODUL__BLOCK_copy, 1
FH_TUERMODUL__BLOCK_copy:
	.zero	1
	.type	FH_TUERMODUL__BLOCK, @object
	.size	FH_TUERMODUL__BLOCK, 1
FH_TUERMODUL__BLOCK:
	.zero	1
	.type	FH_TUERMODUL__KL_50, @object
	.size	FH_TUERMODUL__KL_50, 1
FH_TUERMODUL__KL_50:
	.zero	1
	.type	FH_TUERMODUL__SFHA_MEC_old, @object
	.size	FH_TUERMODUL__SFHA_MEC_old, 1
FH_TUERMODUL__SFHA_MEC_old:
	.zero	1
	.type	FH_TUERMODUL__SFHA_MEC, @object
	.size	FH_TUERMODUL__SFHA_MEC, 1
FH_TUERMODUL__SFHA_MEC:
	.zero	1
	.type	FH_TUERMODUL__SFHA_ZENTRAL_old, @object
	.size	FH_TUERMODUL__SFHA_ZENTRAL_old, 1
FH_TUERMODUL__SFHA_ZENTRAL_old:
	.zero	1
	.type	FH_TUERMODUL__SFHA_ZENTRAL, @object
	.size	FH_TUERMODUL__SFHA_ZENTRAL, 1
FH_TUERMODUL__SFHA_ZENTRAL:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_MEC_old, @object
	.size	FH_TUERMODUL__SFHZ_MEC_old, 1
FH_TUERMODUL__SFHZ_MEC_old:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_MEC, @object
	.size	FH_TUERMODUL__SFHZ_MEC, 1
FH_TUERMODUL__SFHZ_MEC:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_ZENTRAL_old, @object
	.size	FH_TUERMODUL__SFHZ_ZENTRAL_old, 1
FH_TUERMODUL__SFHZ_ZENTRAL_old:
	.zero	1
	.type	FH_TUERMODUL__SFHZ_ZENTRAL, @object
	.size	FH_TUERMODUL__SFHZ_ZENTRAL, 1
FH_TUERMODUL__SFHZ_ZENTRAL:
	.zero	1
	.type	FH_TUERMODUL_CTRL__FT, @object
	.size	FH_TUERMODUL_CTRL__FT, 1
FH_TUERMODUL_CTRL__FT:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS1_copy, @object
	.size	FH_TUERMODUL_CTRL__INREVERS1_copy, 1
FH_TUERMODUL_CTRL__INREVERS1_copy:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS1, @object
	.size	FH_TUERMODUL_CTRL__INREVERS1, 1
FH_TUERMODUL_CTRL__INREVERS1:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS2_copy, @object
	.size	FH_TUERMODUL_CTRL__INREVERS2_copy, 1
FH_TUERMODUL_CTRL__INREVERS2_copy:
	.zero	1
	.type	FH_TUERMODUL_CTRL__INREVERS2, @object
	.size	FH_TUERMODUL_CTRL__INREVERS2, 1
FH_TUERMODUL_CTRL__INREVERS2:
	.zero	1
	.zero	2
	.type	BLOCK_ERKENNUNG_CTRL__N_old, @object
	.size	BLOCK_ERKENNUNG_CTRL__N_old, 4
BLOCK_ERKENNUNG_CTRL__N_old:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__N_copy, @object
	.size	BLOCK_ERKENNUNG_CTRL__N_copy, 4
BLOCK_ERKENNUNG_CTRL__N_copy:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__N, @object
	.size	BLOCK_ERKENNUNG_CTRL__N, 4
BLOCK_ERKENNUNG_CTRL__N:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy, @object
	.size	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy, 4
BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy:
	.zero	4
	.type	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX, @object
	.size	BLOCK_ERKENNUNG_CTRL__I_EIN_MAX, 4
BLOCK_ERKENNUNG_CTRL__I_EIN_MAX:
	.zero	4
	.type	FH_DU__I_EIN_old, @object
	.size	FH_DU__I_EIN_old, 4
FH_DU__I_EIN_old:
	.zero	4
	.type	FH_DU__I_EIN, @object
	.size	FH_DU__I_EIN, 4
FH_DU__I_EIN:
	.zero	4
	.type	FH_DU__POSITION, @object
	.size	FH_DU__POSITION, 4
FH_DU__POSITION:
	.zero	4
	.type	FH_DU__MFH_copy, @object
	.size	FH_DU__MFH_copy, 4
FH_DU__MFH_copy:
	.zero	4
	.type	FH_DU__MFH, @object
	.size	FH_DU__MFH, 4
FH_DU__MFH:
	.zero	4
	.type	FH_TUERMODUL__I_EIN_old, @object
	.size	FH_TUERMODUL__I_EIN_old, 4
FH_TUERMODUL__I_EIN_old:
	.zero	4
	.type	FH_TUERMODUL__I_EIN, @object
	.size	FH_TUERMODUL__I_EIN, 4
FH_TUERMODUL__I_EIN:
	.zero	4
	.type	FH_TUERMODUL__POSITION, @object
	.size	FH_TUERMODUL__POSITION, 4
FH_TUERMODUL__POSITION:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_1739_10, @object
	.size	sc_FH_TUERMODUL_CTRL_1739_10, 4
sc_FH_TUERMODUL_CTRL_1739_10:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_1781_10, @object
	.size	sc_FH_TUERMODUL_CTRL_1781_10, 4
sc_FH_TUERMODUL_CTRL_1781_10:
	.zero	4
	.type	FH_TUERMODUL_CTRL__N_old, @object
	.size	FH_TUERMODUL_CTRL__N_old, 4
FH_TUERMODUL_CTRL__N_old:
	.zero	4
	.type	FH_TUERMODUL_CTRL__N_copy, @object
	.size	FH_TUERMODUL_CTRL__N_copy, 4
FH_TUERMODUL_CTRL__N_copy:
	.zero	4
	.type	FH_TUERMODUL_CTRL__N, @object
	.size	FH_TUERMODUL_CTRL__N, 4
FH_TUERMODUL_CTRL__N:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_2329_1, @object
	.size	sc_FH_TUERMODUL_CTRL_2329_1, 4
sc_FH_TUERMODUL_CTRL_2329_1:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_2352_1, @object
	.size	sc_FH_TUERMODUL_CTRL_2352_1, 4
sc_FH_TUERMODUL_CTRL_2352_1:
	.zero	4
	.type	sc_FH_TUERMODUL_CTRL_2375_2, @object
	.size	sc_FH_TUERMODUL_CTRL_2375_2, 4
sc_FH_TUERMODUL_CTRL_2375_2:
	.zero	4
	.type	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL, @object
	.size	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL, 4
tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL:
	.zero	4
	.type	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL, @object
	.size	tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL, 4
tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL:
	.zero	4
	.type	tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy, @object
	.size	tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy, 4
tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy:
	.zero	4
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
