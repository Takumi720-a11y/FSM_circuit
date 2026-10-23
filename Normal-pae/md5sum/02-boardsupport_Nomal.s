	.file	"boardsupport.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
	ret
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
 #APP
# 11 "/mnt/c/Users/c3165/ibex_src/benchmarks/embench_ibex/boardsupport.c" 1
	nop
# 0 "" 2
 #NO_APP
	ret
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
 #APP
# 17 "/mnt/c/Users/c3165/ibex_src/benchmarks/embench_ibex/boardsupport.c" 1
	nop
# 0 "" 2
 #NO_APP
	ret
	.size	stop_trigger, .-stop_trigger
	.ident	"GCC: (14.2.0+19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
