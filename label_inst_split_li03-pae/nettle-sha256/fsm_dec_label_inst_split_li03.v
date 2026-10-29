module fsm_dec (
	clk_i,
	rst_ni,
	ex_valid_i,
	lsu_resp_valid_i,
	lsu_rdata_valid_i,
	ready_wb_i,
	outstanding_load_wb_i,
	outstanding_store_wb_i,
	rf_rdata_a_i,
	rf_rdata_b_i,
	rf_wdata_fwd_wb_i,
	rf_write_wb_i,
	rf_waddr_wb_i,
	result_ex_i,
	csr_rdata_i,
	instr_exec_i,
	branch_decision_i,
	lsu_req_done_i,
	lsu_addr_incr_req_i,
	lsu_addr_last_i,
	lsu_load_err_i,
	lsu_load_resp_intg_err_i,
	lsu_store_err_i,
	lsu_store_resp_intg_err_i,
	illegal_csr_insn_i,
	csr_mstatus_mie_i,
	irq_pending_i,
	irqs_i,
	irq_nm_i,
	debug_req_i,
	debug_single_step_i,
	debug_ebreakm_i,
	debug_ebreaku_i,
	trigger_match_i,
	priv_mode_i,
	csr_mstatus_tw_i,
	data_ind_timing_i,
	instr_fetch_err_i,
	instr_fetch_err_plus2_i,
	illegal_c_insn_i,
	pc_id_i,
	imd_val_d_ex_i,
	imd_val_we_ex_i,
	ctrl_busy_o,
	illegal_insn_o,
	instr_first_cycle_id_o,
	instr_valid_clear_o,
	id_in_ready_o,
	instr_req_o,
	pc_set_o,
	pc_mux_o,
	nt_branch_mispredict_o,
	nt_branch_addr_o,
	exc_pc_mux_o,
	exc_cause_o,
	icache_inval_o,
	alu_operator_ex_o,
	alu_operand_a_ex_o,
	alu_operand_b_ex_o,
	imd_val_q_ex_o,
	bt_a_operand_o,
	bt_b_operand_o,
	mult_en_ex_o,
	div_en_ex_o,
	mult_sel_ex_o,
	div_sel_ex_o,
	multdiv_operator_ex_o,
	multdiv_signed_mode_ex_o,
	multdiv_operand_a_ex_o,
	multdiv_operand_b_ex_o,
	multdiv_ready_id_o,
	csr_access_o,
	csr_op_o,
	csr_addr_o,
	csr_op_en_o,
	csr_save_if_o,
	csr_save_id_o,
	csr_save_wb_o,
	csr_restore_mret_id_o,
	csr_restore_dret_id_o,
	csr_save_cause_o,
	csr_mtval_o,
	lsu_req_o,
	lsu_we_o,
	lsu_type_o,
	lsu_sign_ext_o,
	lsu_wdata_o,
	expecting_load_resp_o,
	expecting_store_resp_o,
	nmi_mode_o,
	debug_mode_o,
	debug_mode_entering_o,
	debug_cause_o,
	debug_csr_save_o,
	rf_raddr_a_o,
	rf_raddr_b_o,
	rf_ren_a_o,
	rf_ren_b_o,
	rf_waddr_id_o,
	rf_wdata_id_o,
	rf_we_id_o,
	rf_rd_a_wb_match_o,
	rf_rd_b_wb_match_o,
	en_wb_o,
	instr_type_wb_o,
	instr_perf_count_id_o,
	perf_jump_o,
	perf_branch_o,
	perf_tbranch_o,
	perf_dside_wait_o,
	perf_mul_wait_o,
	perf_div_wait_o,
	instr_id_done_o
);
	reg _sv2v_0;
	parameter [0:0] WritebackStage = 1'b1;
	input wire clk_i;
	input wire rst_ni;
	input wire ex_valid_i;
	input wire lsu_resp_valid_i;
	input wire lsu_rdata_valid_i;
	input wire ready_wb_i;
	input wire outstanding_load_wb_i;
	input wire outstanding_store_wb_i;
	input wire [31:0] rf_rdata_a_i;
	input wire [31:0] rf_rdata_b_i;
	input wire [31:0] rf_wdata_fwd_wb_i;
	input wire rf_write_wb_i;
	input wire [4:0] rf_waddr_wb_i;
	input wire [31:0] result_ex_i;
	input wire [31:0] csr_rdata_i;
	input wire instr_exec_i;
	input wire branch_decision_i;
	input wire lsu_req_done_i;
	input wire lsu_addr_incr_req_i;
	input wire [31:0] lsu_addr_last_i;
	input wire lsu_load_err_i;
	input wire lsu_load_resp_intg_err_i;
	input wire lsu_store_err_i;
	input wire lsu_store_resp_intg_err_i;
	input wire illegal_csr_insn_i;
	input wire csr_mstatus_mie_i;
	input wire irq_pending_i;
	input wire [14:0] irqs_i;
	input wire irq_nm_i;
	input wire debug_req_i;
	input wire debug_single_step_i;
	input wire debug_ebreakm_i;
	input wire debug_ebreaku_i;
	input wire trigger_match_i;
	input wire priv_mode_i;
	input wire csr_mstatus_tw_i;
	input wire data_ind_timing_i;
	input wire instr_fetch_err_i;
	input wire instr_fetch_err_plus2_i;
	input wire illegal_c_insn_i;
	input wire [31:0] pc_id_i;
	input wire [67:0] imd_val_d_ex_i;
	input wire [1:0] imd_val_we_ex_i;
	output wire ctrl_busy_o;
	output wire illegal_insn_o;
	output wire instr_first_cycle_id_o;
	output wire instr_valid_clear_o;
	output wire id_in_ready_o;
	output wire instr_req_o;
	output wire pc_set_o;
	output wire [2:0] pc_mux_o;
	output wire nt_branch_mispredict_o;
	output wire [31:0] nt_branch_addr_o;
	output wire [1:0] exc_pc_mux_o;
	output wire [6:0] exc_cause_o;
	output wire icache_inval_o;
	output reg [6:0] alu_operator_ex_o;
	output reg [31:0] alu_operand_a_ex_o;
	output reg [31:0] alu_operand_b_ex_o;
	output wire [67:0] imd_val_q_ex_o;
	output wire [31:0] bt_a_operand_o;
	output wire [31:0] bt_b_operand_o;
	output reg mult_en_ex_o;
	output reg div_en_ex_o;
	output reg mult_sel_ex_o;
	output reg div_sel_ex_o;
	output reg [1:0] multdiv_operator_ex_o;
	output reg [1:0] multdiv_signed_mode_ex_o;
	output reg [31:0] multdiv_operand_a_ex_o;
	output reg [31:0] multdiv_operand_b_ex_o;
	output wire multdiv_ready_id_o;
	output wire csr_access_o;
	output wire [1:0] csr_op_o;
	output wire [11:0] csr_addr_o;
	output wire csr_op_en_o;
	output wire csr_save_if_o;
	output wire csr_save_id_o;
	output wire csr_save_wb_o;
	output wire csr_restore_mret_id_o;
	output wire csr_restore_dret_id_o;
	output wire csr_save_cause_o;
	output wire [31:0] csr_mtval_o;
	output reg lsu_req_o;
	output reg lsu_we_o;
	output reg [1:0] lsu_type_o;
	output reg lsu_sign_ext_o;
	output reg [31:0] lsu_wdata_o;
	output reg expecting_load_resp_o;
	output wire expecting_store_resp_o;
	output wire nmi_mode_o;
	output wire debug_mode_o;
	output wire debug_mode_entering_o;
	output wire [2:0] debug_cause_o;
	output wire debug_csr_save_o;
	output reg [4:0] rf_raddr_a_o;
	output reg [4:0] rf_raddr_b_o;
	output reg rf_ren_a_o;
	output reg rf_ren_b_o;
	output reg [4:0] rf_waddr_id_o;
	output reg [31:0] rf_wdata_id_o;
	output reg rf_we_id_o;
	output reg rf_rd_a_wb_match_o;
	output reg rf_rd_b_wb_match_o;
	output reg en_wb_o;
	output reg [1:0] instr_type_wb_o;
	output wire instr_perf_count_id_o;
	output wire perf_jump_o;
	output wire perf_branch_o;
	output wire perf_tbranch_o;
	output wire perf_dside_wait_o;
	output wire perf_mul_wait_o;
	output wire perf_div_wait_o;
	output wire instr_id_done_o;
	(* fsm_encoding = "none" *) reg [6:0] L_q;
	reg [6:0] L_d;
	(* fsm_encoding = "none" *) reg [9:0] I_q;
	reg [9:0] I_d;
	wire [16:0] state_q;
	wire [16:0] state_d;
	function automatic [16:0] sv2v_cast_17;
		input reg [16:0] inp;
		sv2v_cast_17 = inp;
	endfunction
	assign state_q = sv2v_cast_17({L_q, I_q});
	assign state_d = sv2v_cast_17({L_d, I_d});
	wire [31:0] rf_rdata_a;
	wire [31:0] rf_rdata_b;
	assign rf_rdata_a = rf_rdata_a_i;
	assign rf_rdata_b = rf_rdata_b_i;
	(* dont_touch = "yes" *) reg [16:0] state_q_prev;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			state_q_prev <= 17'b01011010000000000;
		else
			state_q_prev <= state_q;
	(* dont_touch = "yes" *) wire first_cycle;
	assign first_cycle = state_q != state_q_prev;
	(* dont_touch = "yes" *) reg lsu_req_sent;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			lsu_req_sent <= 1'b0;
		else if (lsu_resp_valid_i)
			lsu_req_sent <= 1'b0;
		else if (first_cycle)
			lsu_req_sent <= 1'b1;
	(* dont_touch = "yes" *) wire lsu_req_actual;
	assign lsu_req_actual = first_cycle;
	(* dont_touch = "yes" *) reg [4:0] rf_waddr_latch;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			rf_waddr_latch <= 5'b00000;
		else if (lsu_resp_valid_i & ~lsu_we_o)
			rf_waddr_latch <= rf_waddr_id_o;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			L_q <= 7'd45;
			I_q <= 10'd0;
		end
		else if ((((ready_wb_i && ex_valid_i) && !((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 17'b01010010000000001) || (state_q == 17'b00010100000000001)) || (state_q == 17'b00010100000001100)) || (state_q == 17'b00010100000001111)) || (state_q == 17'b00010100000001010)) || (state_q == 17'b01001100000000001)) || (state_q == 17'b01001100000001111)) || (state_q == 17'b01111000000000001)) || (state_q == 17'b01011000000000101)) || (state_q == 17'b01011000000000100)) || (state_q == 17'b01011000000001100)) || (state_q == 17'b01100010000000001)) || (state_q == 17'b01100010000000010)) || (state_q == 17'b00110000000000010)) || (state_q == 17'b00110000000000111)) || (state_q == 17'b00110000000001110)) || (state_q == 17'b00110000000001010)) || (state_q == 17'b01111110000000000)) || (state_q == 17'b01100100000000111)) || (state_q == 17'b01100100000000101)) || (state_q == 17'b01011110000000001)) || (state_q == 17'b01011110000000010)) || (state_q == 17'b01111010000000001)) || (state_q == 17'b01110100000000000)) || (state_q == 17'b01110100000000001)) || (state_q == 17'b01001000000000011)) || (state_q == 17'b01001000000000111)) || (state_q == 17'b01001000000000101)) || (state_q == 17'b01101100000000000)) || (state_q == 17'b01101100000000010)) || (state_q == 17'b01101110000000000)) || (state_q == 17'b01101110000000001)) || (state_q == 17'b01101110000000011)) || (state_q == 17'b01101000000000000)) || (state_q == 17'b01101000000000001)) || (state_q == 17'b01101000000000011)) || (state_q == 17'b01001110000000000)) || (state_q == 17'b01001110000000010)) || (state_q == 17'b01001110000000100)) || (state_q == 17'b01001110000001100)) || (state_q == 17'b01001110000001101)) || (state_q == 17'b00001110000000000)) || (state_q == 17'b00001110000000010)) || (state_q == 17'b00001110000000110)) || (state_q == 17'b00001110000000111)) || (state_q == 17'b00001110000000101)) || (state_q == 17'b00001110000001100)) || (state_q == 17'b00001110000001101)) || (state_q == 17'b00001110000001111)) || (state_q == 17'b00011110000000110)) || (state_q == 17'b00011110000001101)) || (state_q == 17'b10000100000000001)) || (state_q == 17'b10000110000000001)) || (state_q == 17'b00000100000000001)) || (state_q == 17'b00000100000000011)) || (state_q == 17'b00000100000000010)) || (state_q == 17'b00000100000000110)) || (state_q == 17'b00000100000000111)) || (state_q == 17'b00000100000000101)) || (state_q == 17'b00000100000000100)) || (state_q == 17'b00000100000001100)) || (state_q == 17'b00000100000001101)) || (state_q == 17'b00000100000001111)) || (state_q == 17'b00000100000001110)) || (state_q == 17'b00000100000001010)) || (state_q == 17'b00000110000000000)) || (state_q == 17'b00000110000000001)) || (state_q == 17'b00000110000000011)) || (state_q == 17'b00000110000000010)) || (state_q == 17'b00000110000001111)) || (state_q == 17'b00000110000001000)) || (state_q == 17'b00000110000011000)) || (state_q == 17'b00000110000011001)) || (state_q == 17'b00000110000011011)) || (state_q == 17'b00000110000011010)) || (state_q == 17'b00000110000011110)) || (state_q == 17'b00000110000011111)) || (state_q == 17'b00000110000011101)) || (state_q == 17'b00000110000011100)) || (state_q == 17'b00000110000010100)) || (state_q == 17'b00000110000010101)) || (state_q == 17'b00000010000000110)) || (state_q == 17'b00000010000000101)) || (state_q == 17'b00000010000111010)) || (state_q == 17'b00000010000111001)) || (state_q == 17'b00000010001101010)) || (state_q == 17'b00000010001101001)) || (state_q == 17'b00000010001001011)) || (state_q == 17'b00000010001001110)) || (state_q == 17'b00000010011011110)) || (state_q == 17'b00000010011011111)) || (state_q == 17'b00000010011100010)) || (state_q == 17'b00000010011100011)) || (state_q == 17'b00000010010010011)) || (state_q == 17'b00000010010010010)) || (state_q == 17'b00000010110000101)) || (state_q == 17'b00000010110001100)) || (state_q == 17'b00000010110101010)) || (state_q == 17'b00000010110101110)) || (state_q == 17'b00000010110101111)) || (state_q == 17'b00000010110101101)) || (state_q == 17'b00000010110101100)) || (state_q == 17'b00000010110100100)) || (state_q == 17'b00000010110100101)) || (state_q == 17'b00000010110100111)) || (state_q == 17'b00000010110100110)) || (state_q == 17'b00000010110100010)) || (state_q == 17'b00000010110100011)) || (state_q == 17'b00000010110100001)) || (state_q == 17'b00000010110100000)) || (state_q == 17'b00000010111100000)) || (state_q == 17'b00000010111100001)) || (state_q == 17'b00000010111100011)) || (state_q == 17'b00000010111100010)) || (state_q == 17'b00000010111100110)) || (state_q == 17'b00000010111100111)) || (state_q == 17'b00000010111100101)) || (state_q == 17'b00000010111100100)) || (state_q == 17'b00000010111101101)) || (state_q == 17'b00000010111101111)) || (state_q == 17'b00000010111101110)) || (state_q == 17'b00000010111101010)) || (state_q == 17'b00000010111101011)) || (state_q == 17'b00000010111101001)) || (state_q == 17'b00000010111101000)) || (state_q == 17'b00000010111111000)) || (state_q == 17'b00000010111111001)) || (state_q == 17'b00000000000010010)) || (state_q == 17'b00000000000010000)) || (state_q == 17'b00000000000110111)) || (state_q == 17'b00000000000111111)) || (state_q == 17'b00000000001101000)) || (state_q == 17'b00000000001001100)) || (state_q == 17'b00000000011000111)) || (state_q == 17'b00000000010100100)) || (state_q == 17'b00000000010101011)) || (state_q == 17'b00000000010011110)) || (state_q == 17'b00000000010000110)) || (state_q == 17'b00000000110001100)) || (state_q == 17'b00000000110110100)) || (state_q == 17'b00000000110111000)) || (state_q == 17'b00000000110100110)) || (state_q == 17'b00000000111100001)) || (state_q == 17'b00000000111100111)) || (state_q == 17'b00000000111100100)) || (state_q == 17'b00000000111111000)) || (state_q == 17'b00000000111011100)) || (state_q == 17'b00000000111011000)) || (state_q == 17'b00000000111000010)) || (state_q == 17'b00000000101000001)) || (state_q == 17'b00000000101000111)) || (state_q == 17'b00000000101001100)) || (state_q == 17'b00000000101110011)) || (state_q == 17'b00000000101101101)) || (state_q == 17'b00000000101101100)) || (state_q == 17'b00000000101100110)) || (state_q == 17'b00000000100010000)) || (state_q == 17'b00000000100001010)) || (state_q == 17'b00000000100000100)) || (state_q == 17'b00000001100000000)) || (state_q == 17'b00000001100101100)) || (state_q == 17'b00000001100100101)) || (state_q == 17'b00000001101110100)) || (state_q == 17'b00000001101011011)) || (state_q == 17'b00000001111110101)) || (state_q == 17'b00000001110110001)) || (state_q == 17'b00000001110010010)) || (state_q == 17'b00000001010010001)) || (state_q == 17'b00000001010110001)) || (state_q == 17'b00000001011110100)) || (state_q == 17'b00000001011110101)) || (state_q == 17'b00000001011010101)) || (state_q == 17'b00000001001011110)) || (state_q == 17'b00000001001011100)) || (state_q == 17'b00000001001100000)) || (state_q == 17'b00000001000100010)) || (state_q == 17'b00000001000100110)) || (state_q == 17'b00000001000100111)) || (state_q == 17'b00000001000100100)) || (state_q == 17'b00000001000101100)) || (state_q == 17'b00000001000101101)) || (state_q == 17'b00000001000101110)) || (state_q == 17'b00000001000101011)) || (state_q == 17'b00000001000101000)) || (state_q == 17'b00000001000111000)) || (state_q == 17'b00000001000111111)) || (state_q == 17'b00000001000111101)) || (state_q == 17'b00000001000111100)) || (state_q == 17'b00000001000110100)) || (state_q == 17'b00000001000110101)) || (state_q == 17'b00000001000110111)) || (state_q == 17'b00000001000110110)) || (state_q == 17'b00000001000110010)) || (state_q == 17'b00000001000110011)) || (state_q == 17'b00000001000110001)) || (state_q == 17'b00000001000110000)) || (state_q == 17'b00000001000010000)) || (state_q == 17'b00000001000010001)) || (state_q == 17'b00000001000010011)) || (state_q == 17'b00000001000010010)) || (state_q == 17'b00000001000010110)) || (state_q == 17'b00000001000010111)) || (state_q == 17'b00000001000010101)) || (state_q == 17'b00000001000010100)) || (state_q == 17'b00101110000000001)) || (state_q == 17'b00101110000000011)) || (state_q == 17'b00101110000000010)) || (state_q == 17'b00101110000000110)) || (state_q == 17'b00101110000000111)) || (state_q == 17'b00101110000000101)) || (state_q == 17'b00101110000000100)) || (state_q == 17'b00101110000001100)) || (state_q == 17'b01110010000000000)) || (state_q == 17'b01110010000000010)) || (state_q == 17'b00110010000000111)) || (state_q == 17'b00110010000000101)) || (state_q == 17'b00110010000001011)) || (state_q == 17'b00110010000001001)) || (state_q == 17'b00101010000000011)) || (state_q == 17'b00101010000000111)) || (state_q == 17'b00101000000000110)) || (state_q == 17'b00101000000000111)) || (state_q == 17'b00101000000001111)) || (state_q == 17'b00101000000001110)) || (state_q == 17'b00101000000011000)) || (state_q == 17'b00101000000011001)) || (state_q == 17'b00111110000000000)) || (state_q == 17'b00111110000000010)) || (state_q == 17'b00110110000000000)) || (state_q == 17'b00110110000000001)) || (state_q == 17'b00110110000000011)) || (state_q == 17'b00110110000000010)) || (state_q == 17'b00110110000000110)) || (state_q == 17'b00110110000000111)) || (state_q == 17'b00110110000000101)) || (state_q == 17'b00110110000000100)) || (state_q == 17'b01101010000000000)) || (state_q == 17'b01101010000000010)) || (state_q == 17'b01101010000000111)) || (state_q == 17'b00100010000000011)) || (state_q == 17'b00100010000000110)) || (state_q == 17'b00100010000000111)) || (state_q == 17'b00100010000000101)) || (state_q == 17'b00100010000000100)) || (state_q == 17'b00100010000001100)) || (state_q == 17'b00100000000000010)) || (state_q == 17'b00011000000000001)) || (state_q == 17'b00011000000000010)) || (state_q == 17'b00001000000000000)) || (state_q == 17'b00001000000000001)) || (state_q == 17'b00001000000011011)) || (state_q == 17'b00001000000011010)) || (state_q == 17'b00001000000011111)) || (state_q == 17'b00001000000011101)) || (state_q == 17'b00001000000011100)) || (state_q == 17'b00001000000010100)) || (state_q == 17'b00001000000010101)) || (state_q == 17'b00001000000010110)) || (state_q == 17'b00001000000010010)) || (state_q == 17'b00001000000010000)) || (state_q == 17'b00001000000110000)) || (state_q == 17'b00001000000110011)) || (state_q == 17'b00101100000000001)) || (state_q == 17'b00001100000000110)) || (state_q == 17'b00001100000000101)) || (state_q == 17'b01100000000000001)) || (state_q == 17'b01100000000000011)) || (state_q == 17'b01001010000000000)) || (state_q == 17'b01001010000000010)) || (state_q == 17'b01001010000000100)) || (state_q == 17'b01001010000001100)) || (state_q == 17'b01001010000001101)) || (state_q == 17'b01001010000001111)) || (state_q == 17'b01001010000001110)) || (state_q == 17'b01000000000000011)) || (state_q == 17'b01000000000000010)) || (state_q == 17'b01000000000000110)) || (state_q == 17'b01000000000001100)) || (state_q == 17'b01000000000001101)) || (state_q == 17'b01000000000001111)) || (state_q == 17'b01000000000001110)) || (state_q == 17'b01000000000001010)) || (state_q == 17'b01000000000001011)) || (state_q == 17'b01000000000001001)) || (state_q == 17'b01000000000001000)) || (state_q == 17'b01000000000011000)) || (state_q == 17'b01000000000011001)) || (state_q == 17'b01100110000000000)) || (state_q == 17'b00100110000000000)) || (state_q == 17'b00100110000000010)) || (state_q == 17'b00100110000001111)) || (state_q == 17'b00100110000001110)) || (state_q == 17'b00100110000001010)) || (state_q == 17'b00010010000000000)) || (state_q == 17'b00010010000000010)) || (state_q == 17'b00010010000001101)) || (state_q == 17'b00010010000001111)) || (state_q == 17'b00010010000001110)) || (state_q == 17'b00010010000001010)) || (state_q == 17'b00010010000001011)) || (state_q == 17'b00010010000001001)) || (state_q == 17'b00010010000001000)) || (state_q == 17'b00010010000011000)) || (state_q == 17'b00010010000011001)) || (state_q == 17'b00010010000011011)) || (state_q == 17'b00010010000011010)) || (state_q == 17'b00010010000011110)) || (state_q == 17'b00010010000011111)) || (state_q == 17'b00111100000000000)) || (state_q == 17'b00111100000000001)) || (state_q == 17'b00010000000000010)) || (state_q == 17'b00010000000000111))) || ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 17'b01010010000000001) || (state_q == 17'b00010100000000001)) || (state_q == 17'b00010100000001100)) || (state_q == 17'b01001100000001111)) || (state_q == 17'b01111000000000001)) || (state_q == 17'b01011000000000101)) || (state_q == 17'b01011000000000100)) || (state_q == 17'b01011000000001100)) || (state_q == 17'b00110000000001010)) || (state_q == 17'b01111110000000000)) || (state_q == 17'b01100100000000101)) || (state_q == 17'b01011110000000001)) || (state_q == 17'b01011110000000010)) || (state_q == 17'b01111010000000001)) || (state_q == 17'b01001000000000011)) || (state_q == 17'b01001000000000111)) || (state_q == 17'b01001000000000101)) || (state_q == 17'b01101100000000010)) || (state_q == 17'b01001110000000010)) || (state_q == 17'b01001110000000100)) || (state_q == 17'b01001110000001100)) || (state_q == 17'b01001110000001101)) || (state_q == 17'b00001110000000010)) || (state_q == 17'b00001110000000111)) || (state_q == 17'b00001110000001100)) || (state_q == 17'b00001110000001111)) || (state_q == 17'b00011110000001101)) || (state_q == 17'b10000100000000001)) || (state_q == 17'b10000110000000001)) || (state_q == 17'b00000100000000001)) || (state_q == 17'b00000100000000011)) || (state_q == 17'b00000100000000010)) || (state_q == 17'b00000100000000110)) || (state_q == 17'b00000100000000111)) || (state_q == 17'b00000100000000101)) || (state_q == 17'b00000100000000100)) || (state_q == 17'b00000100000001100)) || (state_q == 17'b00000100000001101)) || (state_q == 17'b00000100000001111)) || (state_q == 17'b00000100000001110)) || (state_q == 17'b00000100000001010)) || (state_q == 17'b00000110000001111)) || (state_q == 17'b00000110000011100)) || (state_q == 17'b00000110000010100)) || (state_q == 17'b00000110000010101)) || (state_q == 17'b00000010110101101)) || (state_q == 17'b00000010110100111)) || (state_q == 17'b00000010110100001)) || (state_q == 17'b00000010111100011)) || (state_q == 17'b00000010111100101)) || (state_q == 17'b00000010111101101)) || (state_q == 17'b00000010111101111)) || (state_q == 17'b00000010111101110)) || (state_q == 17'b00000010111101011)) || (state_q == 17'b00000010111101001)) || (state_q == 17'b00000010111101000)) || (state_q == 17'b00000010111111000)) || (state_q == 17'b00000010111111001)) || (state_q == 17'b00000000000110111)) || (state_q == 17'b00000000111100001)) || (state_q == 17'b00000000101000001)) || (state_q == 17'b00000001100000000)) || (state_q == 17'b00000001100101100)) || (state_q == 17'b00000001000111111)) || (state_q == 17'b00000001000111101)) || (state_q == 17'b00000001000111100)) || (state_q == 17'b00000001000110100)) || (state_q == 17'b00000001000110101)) || (state_q == 17'b00000001000110111)) || (state_q == 17'b00000001000110110)) || (state_q == 17'b00000001000110010)) || (state_q == 17'b00101110000000001)) || (state_q == 17'b00101110000000010)) || (state_q == 17'b00101110000000110)) || (state_q == 17'b00101110000000111)) || (state_q == 17'b00101110000000101)) || (state_q == 17'b00101110000000100)) || (state_q == 17'b00101110000001100)) || (state_q == 17'b01110010000000010)) || (state_q == 17'b00110010000001011)) || (state_q == 17'b00110010000001001)) || (state_q == 17'b00101010000000011)) || (state_q == 17'b00101010000000111)) || (state_q == 17'b00101000000001111)) || (state_q == 17'b00101000000001110)) || (state_q == 17'b00111110000000010)) || (state_q == 17'b00110110000000011)) || (state_q == 17'b01101010000000010)) || (state_q == 17'b00100010000000110)) || (state_q == 17'b00100010000000111)) || (state_q == 17'b00100010000000101)) || (state_q == 17'b00100010000000100)) || (state_q == 17'b00100010000001100)) || (state_q == 17'b00100000000000010)) || (state_q == 17'b00011000000000001)) || (state_q == 17'b00001000000011011)) || (state_q == 17'b00001000000011010)) || (state_q == 17'b00001000000011111)) || (state_q == 17'b00001000000011101)) || (state_q == 17'b00001000000011100)) || (state_q == 17'b00001000000010100)) || (state_q == 17'b00001000000010101)) || (state_q == 17'b00101100000000001)) || (state_q == 17'b00001100000000110)) || (state_q == 17'b01100000000000001)) || (state_q == 17'b01100000000000011)) || (state_q == 17'b01001010000000010)) || (state_q == 17'b01001010000001100)) || (state_q == 17'b01001010000001101)) || (state_q == 17'b01001010000001111)) || (state_q == 17'b01000000000000011)) || (state_q == 17'b01000000000000010)) || (state_q == 17'b01000000000000110)) || (state_q == 17'b01000000000001100)) || (state_q == 17'b01000000000001101)) || (state_q == 17'b01000000000001111)) || (state_q == 17'b01000000000001110)) || (state_q == 17'b01000000000001010)) || (state_q == 17'b01000000000001011)) || (state_q == 17'b01000000000001001)) || (state_q == 17'b01000000000001000)) || (state_q == 17'b01000000000011000)) || (state_q == 17'b01000000000011001)) || (state_q == 17'b01100110000000000)) || (state_q == 17'b00100110000000010)) || (state_q == 17'b00100110000001111)) || (state_q == 17'b00100110000001110)) || (state_q == 17'b00100110000001010)) || (state_q == 17'b00010010000000010)) || (state_q == 17'b00010000000000010)) && lsu_resp_valid_i) && !first_cycle)) || ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 17'b00010100000001111) || (state_q == 17'b00010100000001010)) || (state_q == 17'b01001100000000001)) || (state_q == 17'b01100010000000001)) || (state_q == 17'b01100010000000010)) || (state_q == 17'b00110000000000010)) || (state_q == 17'b00110000000000111)) || (state_q == 17'b00110000000001110)) || (state_q == 17'b01100100000000111)) || (state_q == 17'b01110100000000000)) || (state_q == 17'b01110100000000001)) || (state_q == 17'b01101100000000000)) || (state_q == 17'b01101110000000000)) || (state_q == 17'b01101110000000001)) || (state_q == 17'b01101110000000011)) || (state_q == 17'b01101000000000000)) || (state_q == 17'b01101000000000001)) || (state_q == 17'b01101000000000011)) || (state_q == 17'b01001110000000000)) || (state_q == 17'b00001110000000000)) || (state_q == 17'b00001110000000110)) || (state_q == 17'b00001110000000101)) || (state_q == 17'b00001110000001101)) || (state_q == 17'b00011110000000110)) || (state_q == 17'b00000110000000000)) || (state_q == 17'b00000110000000001)) || (state_q == 17'b00000110000000011)) || (state_q == 17'b00000110000000010)) || (state_q == 17'b00000110000001000)) || (state_q == 17'b00000110000011000)) || (state_q == 17'b00000110000011001)) || (state_q == 17'b00000110000011011)) || (state_q == 17'b00000110000011010)) || (state_q == 17'b00000110000011110)) || (state_q == 17'b00000110000011111)) || (state_q == 17'b00000110000011101)) || (state_q == 17'b00000010000000110)) || (state_q == 17'b00000010000000101)) || (state_q == 17'b00000010000111010)) || (state_q == 17'b00000010000111001)) || (state_q == 17'b00000010001101010)) || (state_q == 17'b00000010001101001)) || (state_q == 17'b00000010001001011)) || (state_q == 17'b00000010001001110)) || (state_q == 17'b00000010011011110)) || (state_q == 17'b00000010011011111)) || (state_q == 17'b00000010011100010)) || (state_q == 17'b00000010011100011)) || (state_q == 17'b00000010010010011)) || (state_q == 17'b00000010010010010)) || (state_q == 17'b00000010110000101)) || (state_q == 17'b00000010110001100)) || (state_q == 17'b00000010110101010)) || (state_q == 17'b00000010110101110)) || (state_q == 17'b00000010110101111)) || (state_q == 17'b00000010110101100)) || (state_q == 17'b00000010110100100)) || (state_q == 17'b00000010110100101)) || (state_q == 17'b00000010110100110)) || (state_q == 17'b00000010110100010)) || (state_q == 17'b00000010110100011)) || (state_q == 17'b00000010110100000)) || (state_q == 17'b00000010111100000)) || (state_q == 17'b00000010111100001)) || (state_q == 17'b00000010111100010)) || (state_q == 17'b00000010111100110)) || (state_q == 17'b00000010111100111)) || (state_q == 17'b00000010111100100)) || (state_q == 17'b00000010111101010)) || (state_q == 17'b00000000000010010)) || (state_q == 17'b00000000000010000)) || (state_q == 17'b00000000000111111)) || (state_q == 17'b00000000001101000)) || (state_q == 17'b00000000001001100)) || (state_q == 17'b00000000011000111)) || (state_q == 17'b00000000010100100)) || (state_q == 17'b00000000010101011)) || (state_q == 17'b00000000010011110)) || (state_q == 17'b00000000010000110)) || (state_q == 17'b00000000110001100)) || (state_q == 17'b00000000110110100)) || (state_q == 17'b00000000110111000)) || (state_q == 17'b00000000110100110)) || (state_q == 17'b00000000111100111)) || (state_q == 17'b00000000111100100)) || (state_q == 17'b00000000111111000)) || (state_q == 17'b00000000111011100)) || (state_q == 17'b00000000111011000)) || (state_q == 17'b00000000111000010)) || (state_q == 17'b00000000101000111)) || (state_q == 17'b00000000101001100)) || (state_q == 17'b00000000101110011)) || (state_q == 17'b00000000101101101)) || (state_q == 17'b00000000101101100)) || (state_q == 17'b00000000101100110)) || (state_q == 17'b00000000100010000)) || (state_q == 17'b00000000100001010)) || (state_q == 17'b00000000100000100)) || (state_q == 17'b00000001100100101)) || (state_q == 17'b00000001101110100)) || (state_q == 17'b00000001101011011)) || (state_q == 17'b00000001111110101)) || (state_q == 17'b00000001110110001)) || (state_q == 17'b00000001110010010)) || (state_q == 17'b00000001010010001)) || (state_q == 17'b00000001010110001)) || (state_q == 17'b00000001011110100)) || (state_q == 17'b00000001011110101)) || (state_q == 17'b00000001011010101)) || (state_q == 17'b00000001001011110)) || (state_q == 17'b00000001001011100)) || (state_q == 17'b00000001001100000)) || (state_q == 17'b00000001000100010)) || (state_q == 17'b00000001000100110)) || (state_q == 17'b00000001000100111)) || (state_q == 17'b00000001000100100)) || (state_q == 17'b00000001000101100)) || (state_q == 17'b00000001000101101)) || (state_q == 17'b00000001000101110)) || (state_q == 17'b00000001000101011)) || (state_q == 17'b00000001000101000)) || (state_q == 17'b00000001000111000)) || (state_q == 17'b00000001000110011)) || (state_q == 17'b00000001000110001)) || (state_q == 17'b00000001000110000)) || (state_q == 17'b00000001000010000)) || (state_q == 17'b00000001000010001)) || (state_q == 17'b00000001000010011)) || (state_q == 17'b00000001000010010)) || (state_q == 17'b00000001000010110)) || (state_q == 17'b00000001000010111)) || (state_q == 17'b00000001000010101)) || (state_q == 17'b00000001000010100)) || (state_q == 17'b00101110000000011)) || (state_q == 17'b01110010000000000)) || (state_q == 17'b00110010000000111)) || (state_q == 17'b00110010000000101)) || (state_q == 17'b00101000000000110)) || (state_q == 17'b00101000000000111)) || (state_q == 17'b00101000000011000)) || (state_q == 17'b00101000000011001)) || (state_q == 17'b00111110000000000)) || (state_q == 17'b00110110000000000)) || (state_q == 17'b00110110000000001)) || (state_q == 17'b00110110000000010)) || (state_q == 17'b00110110000000110)) || (state_q == 17'b00110110000000111)) || (state_q == 17'b00110110000000101)) || (state_q == 17'b00110110000000100)) || (state_q == 17'b01101010000000000)) || (state_q == 17'b01101010000000111)) || (state_q == 17'b00100010000000011)) || (state_q == 17'b00011000000000010)) || (state_q == 17'b00001000000000000)) || (state_q == 17'b00001000000000001)) || (state_q == 17'b00001000000010110)) || (state_q == 17'b00001000000010010)) || (state_q == 17'b00001000000010000)) || (state_q == 17'b00001000000110000)) || (state_q == 17'b00001000000110011)) || (state_q == 17'b00001100000000101)) || (state_q == 17'b01001010000000000)) || (state_q == 17'b01001010000000100)) || (state_q == 17'b01001010000001110)) || (state_q == 17'b00100110000000000)) || (state_q == 17'b00010010000000000)) || (state_q == 17'b00010010000001101)) || (state_q == 17'b00010010000001111)) || (state_q == 17'b00010010000001110)) || (state_q == 17'b00010010000001010)) || (state_q == 17'b00010010000001011)) || (state_q == 17'b00010010000001001)) || (state_q == 17'b00010010000001000)) || (state_q == 17'b00010010000011000)) || (state_q == 17'b00010010000011001)) || (state_q == 17'b00010010000011011)) || (state_q == 17'b00010010000011010)) || (state_q == 17'b00010010000011110)) || (state_q == 17'b00010010000011111)) || (state_q == 17'b00111100000000000)) || (state_q == 17'b00111100000000001)) || (state_q == 17'b00010000000000111)) && lsu_resp_valid_i) && !first_cycle)) begin
			L_q <= L_d;
			I_q <= I_d;
		end
	always @(*) begin
		if (_sv2v_0)
			;
		L_d = L_q;
		I_d = I_q;
		alu_operator_ex_o = 7'd0;
		alu_operand_a_ex_o = 1'sb0;
		alu_operand_b_ex_o = 1'sb0;
		rf_raddr_a_o = 1'sb0;
		rf_raddr_b_o = 1'sb0;
		rf_ren_a_o = 1'b0;
		rf_ren_b_o = 1'b0;
		rf_waddr_id_o = rf_waddr_latch;
		rf_we_id_o = 1'b0;
		rf_wdata_id_o = 1'sb0;
		en_wb_o = 1'b0;
		instr_type_wb_o = 2'd2;
		lsu_req_o = 1'b0;
		lsu_we_o = 1'b0;
		lsu_type_o = 2'b00;
		lsu_sign_ext_o = 1'b0;
		lsu_wdata_o = 1'sb0;
		rf_rd_a_wb_match_o = 1'b0;
		rf_rd_b_wb_match_o = 1'b0;
		expecting_load_resp_o = 1'b0;
		mult_en_ex_o = 1'b0;
		div_en_ex_o = 1'b0;
		mult_sel_ex_o = 1'b0;
		div_sel_ex_o = 1'b0;
		multdiv_operator_ex_o = 2'd0;
		multdiv_signed_mode_ex_o = 2'b00;
		multdiv_operand_a_ex_o = rf_rdata_a;
		multdiv_operand_b_ex_o = rf_rdata_b;
		case (state_q)
			17'b01011010000000000: begin
				alu_operand_b_ex_o = 32'h00020000;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01011010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01011010000000011: begin
				alu_operand_a_ex_o = 32'h00000088;
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01011010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000114;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01011010000000110: begin
				alu_operand_a_ex_o = 32'h00000090;
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01011010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000013c;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd41;
				I_d = 10'd0;
			end
			17'b01010010000000000: begin
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd43;
					I_d = 10'd0;
				end
				else
					I_d = 10'd1;
			end
			17'b01010010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b01010010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01010010000000010: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				I_d = 10'd0;
			end
			17'b01010110000000000: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000b800;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd10;
				I_d = 10'd0;
			end
			17'b01011100000000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			17'b00010100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffe0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00010100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b00010100000000011: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00002802;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd74;
				I_d = 10'd0;
			end
			17'b00010100000000010: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00002806;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd11;
				I_d = 10'd0;
			end
			17'b00010100000000110: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00010100000000111: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00002805;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd34;
				I_d = 10'd0;
			end
			17'b00010100000000101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00002804;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd26;
				I_d = 10'd0;
			end
			17'b00010100000000100: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000280c;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd8;
				I_d = 10'd0;
			end
			17'b00010100000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b00010100000001101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000280f;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd42;
				I_d = 10'd0;
			end
			17'b00010100000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd14;
			end
			17'b00010100000001110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000280a;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd28;
				I_d = 10'd0;
			end
			17'b00010100000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd11;
			end
			17'b00010100000001011: begin
				alu_operator_ex_o = 7'd44;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00010100000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd8;
			end
			17'b00010100000001000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01001100000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01001100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c8;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b01001100000000011: begin
				alu_operand_b_ex_o = 32'h41c65000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01001100000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe6d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01001100000000110: begin
				mult_en_ex_o = 1'b1;
				mult_sel_ex_o = 1'b1;
				multdiv_operator_ex_o = 2'd0;
				multdiv_signed_mode_ex_o = 2'b00;
				multdiv_operand_a_ex_o = rf_rdata_a;
				multdiv_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = ex_valid_i & ~first_cycle;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = ex_valid_i & ~first_cycle;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01001100000000111: begin
				alu_operand_b_ex_o = 32'h00003000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01001100000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000039;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b01001100000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b01001100000001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b01001100000001101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b01001100000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c8;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b01001100000001110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b01001100000001010: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01111000000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01111000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c8;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b01111000000000011: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01011000000000000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01011000000000001: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd70;
					I_d = 10'd0;
				end
				else
					I_d = 10'd3;
			end
			17'b01011000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01011000000000010: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01011000000000110: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01011000000000111: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01011000000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c0;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd4;
			end
			17'b01011000000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c4;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd12;
			end
			17'b01011000000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001bc;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b01011000000001101: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b10001100000000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			17'b01100010000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01100010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001bc;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b01100010000000011: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01100010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c0;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd6;
			end
			17'b01100010000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01100010000000111: begin
				alu_operator_ex_o = 7'd44;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01100010000000101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b01100010000000100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b00110000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00110000000000001: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd64;
					I_d = 10'd0;
				end
				else
					I_d = 10'd3;
			end
			17'b00110000000000011: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00110000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c4;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd6;
			end
			17'b00110000000000110: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00110000000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001bc;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd5;
			end
			17'b00110000000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00110000000000100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00110000000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00110000000001101: begin
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd50;
					I_d = 10'd0;
				end
				else
					I_d = 10'd15;
			end
			17'b00110000000001111: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00110000000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c0;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd10;
			end
			17'b00110000000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001bc;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd11;
			end
			17'b00110000000001011: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd64;
					I_d = 10'd0;
				end
				else begin
					L_d = 7'd63;
					I_d = 10'd0;
				end
			end
			17'b01111110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c4;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd1;
			end
			17'b01111110000000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01100100000000000: begin
				alu_operand_b_ex_o = 32'h00000004;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01100100000000001: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01100100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01100100000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01100100000000110: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01100100000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001c0;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd5;
			end
			17'b01100100000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001bc;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd4;
			end
			17'b01100100000000100: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd63;
					I_d = 10'd0;
				end
				else begin
					L_d = 7'd64;
					I_d = 10'd0;
				end
			end
			17'b10000000000000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b10000000000000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01011110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01011110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b01011110000000011: begin
				mult_en_ex_o = 1'b1;
				mult_sel_ex_o = 1'b1;
				multdiv_operator_ex_o = 2'd0;
				multdiv_signed_mode_ex_o = 2'b00;
				multdiv_operand_a_ex_o = rf_rdata_a;
				multdiv_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = ex_valid_i & ~first_cycle;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = ex_valid_i & ~first_cycle;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01011110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b01011110000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01011110000000111: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000bc05;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd24;
				I_d = 10'd0;
			end
			17'b01011110000000101: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd58;
					I_d = 10'd0;
				end
				else
					I_d = 10'd4;
			end
			17'b01011110000000100: begin
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd58;
					I_d = 10'd0;
				end
				else
					I_d = 10'd12;
			end
			17'b01011110000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b01011110000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd61;
				I_d = 10'd0;
			end
			17'b01111010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01111010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b01111010000000011: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else begin
					L_d = 7'd58;
					I_d = 10'd0;
				end
			end
			17'b01110100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01110100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b01110100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01110100000000010: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01001000000000000: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd65;
					I_d = 10'd0;
				end
				else
					I_d = 10'd1;
			end
			17'b01001000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01001000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd2;
			end
			17'b01001000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01001000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01001000000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd5;
			end
			17'b01001000000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd4;
			end
			17'b01001000000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b01001000000001100: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000900d;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd24;
				I_d = 10'd0;
			end
			17'b01001000000001101: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd52;
					I_d = 10'd0;
				end
				else
					I_d = 10'd15;
			end
			17'b01001000000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b01001000000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b01001000000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b01001000000001011: begin
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd55;
					I_d = 10'd0;
				end
				else begin
					L_d = 7'd54;
					I_d = 10'd0;
				end
			end
			17'b01101100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01101100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01101100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01101100000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b01101100000000110: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else begin
					L_d = 7'd55;
					I_d = 10'd0;
				end
			end
			17'b01101110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01101110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b01101110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd2;
			end
			17'b01101110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01101110000000110: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01101000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01101000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b01101000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd2;
			end
			17'b01101000000000010: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01101000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01101000000000111: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b10000010000000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b10000010000000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b10001110000000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b10010100000000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b00110100000000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				I_d = 10'd1;
			end
			17'b00110100000000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01010100000000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				I_d = 10'd1;
			end
			17'b01010100000000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01110000000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01110000000000001: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01110000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01110000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01110000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd39;
				I_d = 10'd0;
			end
			17'b01001110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01001110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01001110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01001110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b01001110000000110: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd7;
			end
			17'b01001110000000111: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01001110000000101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b01001110000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd12;
			end
			17'b01001110000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b01001110000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd15;
			end
			17'b01001110000001111: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b00001010000000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00001010000000001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00001010000000011: begin
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd15;
					I_d = 10'd0;
				end
				else
					I_d = 10'd2;
			end
			17'b00001010000000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00001010000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00001010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00001010000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd7;
				I_d = 10'd0;
			end
			17'b00001110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00001110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00001110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00001110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00001110000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffe;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b01;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd7;
			end
			17'b00001110000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffd;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd5;
			end
			17'b00001110000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd4;
			end
			17'b00001110000000100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00001110000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffe;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b00001110000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd15;
			end
			17'b00001110000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b00001110000001110: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd10;
			end
			17'b00001110000001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b00001110000001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd15;
				I_d = 10'd0;
			end
			17'b00011110000000000: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd13;
					I_d = 10'd0;
				end
				else
					I_d = 10'd1;
			end
			17'b00011110000000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00011110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00011110000000010: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00011110000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd7;
			end
			17'b00011110000000111: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd67;
					I_d = 10'd0;
				end
				else
					I_d = 10'd5;
			end
			17'b00011110000000101: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00011110000000100: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd66;
					I_d = 10'd0;
				end
				else
					I_d = 10'd12;
			end
			17'b00011110000001100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00011110000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				L_d = 7'd66;
				I_d = 10'd0;
			end
			17'b10000100000000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b10000100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				L_d = 7'd67;
				I_d = 10'd0;
			end
			17'b10000110000000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b10000110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				L_d = 7'd13;
				I_d = 10'd0;
			end
			17'b00011010000000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b00000100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffff50;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00000100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000088;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b00000100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ac;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd2;
			end
			17'b00000100000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a8;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00000100000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a4;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd7;
			end
			17'b00000100000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd5;
			end
			17'b00000100000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd4;
			end
			17'b00000100000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd12;
			end
			17'b00000100000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b00000100000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd15;
			end
			17'b00000100000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b00000100000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000084;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd10;
			end
			17'b00000100000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd11;
			end
			17'b00000100000001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00000100000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd3;
				I_d = 10'd0;
			end
			17'b00000110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00000110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b00000110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd2;
			end
			17'b00000110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd6;
			end
			17'b00000110000000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00000110000000111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00000110000000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00000110000000100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00000110000001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00000110000001101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00000110000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b00000110000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b00000110000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b00000110000001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00000110000001001: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd8;
			end
			17'b00000110000001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd24;
			end
			17'b00000110000011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd25;
			end
			17'b00000110000011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd27;
			end
			17'b00000110000011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd26;
			end
			17'b00000110000011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd30;
			end
			17'b00000110000011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd31;
			end
			17'b00000110000011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd29;
			end
			17'b00000110000011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd28;
			end
			17'b00000110000011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd20;
			end
			17'b00000110000010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd21;
			end
			17'b00000110000010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd23;
			end
			17'b00000110000010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd22;
			end
			17'b00000110000010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd18;
			end
			17'b00000110000010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd19;
			end
			17'b00000110000010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd17;
			end
			17'b00000110000010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd49;
			end
			17'b00000110000110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd48;
			end
			17'b00000110000110000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd16;
			end
			17'b00000110000010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd1;
				I_d = 10'd0;
			end
			17'b00000010000000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00000010000000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00000010000000011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00000010000000010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00000010000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd7;
			end
			17'b00000010000000111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00000010000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd4;
			end
			17'b00000010000000100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00000010000001100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00000010000001101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00000010000001111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00000010000001110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b00000010000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b00000010000001011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00000010000001001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd8;
			end
			17'b00000010000001000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd24;
			end
			17'b00000010000011000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd25;
			end
			17'b00000010000011001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd27;
			end
			17'b00000010000011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd26;
			end
			17'b00000010000011010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd30;
			end
			17'b00000010000011110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd31;
			end
			17'b00000010000011111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd29;
			end
			17'b00000010000011101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd28;
			end
			17'b00000010000011100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd20;
			end
			17'b00000010000010100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd21;
			end
			17'b00000010000010101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd23;
			end
			17'b00000010000010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd22;
			end
			17'b00000010000010110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd18;
			end
			17'b00000010000010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd19;
			end
			17'b00000010000010011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd17;
			end
			17'b00000010000010001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd16;
			end
			17'b00000010000010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd48;
			end
			17'b00000010000110000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd49;
			end
			17'b00000010000110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd51;
			end
			17'b00000010000110011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd50;
			end
			17'b00000010000110010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd54;
			end
			17'b00000010000110110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd55;
			end
			17'b00000010000110111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd53;
			end
			17'b00000010000110101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd52;
			end
			17'b00000010000110100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd60;
			end
			17'b00000010000111100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd61;
			end
			17'b00000010000111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd63;
			end
			17'b00000010000111111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd62;
			end
			17'b00000010000111110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd58;
			end
			17'b00000010000111010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd59;
			end
			17'b00000010000111011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd57;
			end
			17'b00000010000111001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd56;
			end
			17'b00000010000111000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd40;
			end
			17'b00000010000101000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd41;
			end
			17'b00000010000101001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd43;
			end
			17'b00000010000101011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd42;
			end
			17'b00000010000101010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd46;
			end
			17'b00000010000101110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd47;
			end
			17'b00000010000101111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd45;
			end
			17'b00000010000101101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd44;
			end
			17'b00000010000101100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd36;
			end
			17'b00000010000100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd37;
			end
			17'b00000010000100101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd39;
			end
			17'b00000010000100111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd38;
			end
			17'b00000010000100110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd34;
			end
			17'b00000010000100010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd35;
			end
			17'b00000010000100011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd33;
			end
			17'b00000010000100001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd32;
			end
			17'b00000010000100000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd96;
			end
			17'b00000010001100000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd97;
			end
			17'b00000010001100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd99;
			end
			17'b00000010001100011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd98;
			end
			17'b00000010001100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd102;
			end
			17'b00000010001100110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd103;
			end
			17'b00000010001100111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd101;
			end
			17'b00000010001100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd100;
			end
			17'b00000010001100100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd108;
			end
			17'b00000010001101100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd109;
			end
			17'b00000010001101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd111;
			end
			17'b00000010001101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd110;
			end
			17'b00000010001101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd106;
			end
			17'b00000010001101010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd107;
			end
			17'b00000010001101011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd105;
			end
			17'b00000010001101001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd104;
			end
			17'b00000010001101000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd120;
			end
			17'b00000010001111000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd121;
			end
			17'b00000010001111001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd123;
			end
			17'b00000010001111011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd122;
			end
			17'b00000010001111010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd126;
			end
			17'b00000010001111110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd127;
			end
			17'b00000010001111111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd125;
			end
			17'b00000010001111101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd124;
			end
			17'b00000010001111100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd116;
			end
			17'b00000010001110100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd117;
			end
			17'b00000010001110101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd119;
			end
			17'b00000010001110111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd118;
			end
			17'b00000010001110110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd114;
			end
			17'b00000010001110010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd115;
			end
			17'b00000010001110011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd113;
			end
			17'b00000010001110001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd112;
			end
			17'b00000010001110000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd80;
			end
			17'b00000010001010000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd81;
			end
			17'b00000010001010001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd83;
			end
			17'b00000010001010011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd82;
			end
			17'b00000010001010010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd86;
			end
			17'b00000010001010110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd87;
			end
			17'b00000010001010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd85;
			end
			17'b00000010001010101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd84;
			end
			17'b00000010001010100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd92;
			end
			17'b00000010001011100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd93;
			end
			17'b00000010001011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd95;
			end
			17'b00000010001011111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd94;
			end
			17'b00000010001011110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd90;
			end
			17'b00000010001011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd91;
			end
			17'b00000010001011011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd89;
			end
			17'b00000010001011001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd88;
			end
			17'b00000010001011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd72;
			end
			17'b00000010001001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd73;
			end
			17'b00000010001001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd75;
			end
			17'b00000010001001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd74;
			end
			17'b00000010001001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd78;
			end
			17'b00000010001001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd79;
			end
			17'b00000010001001111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd77;
			end
			17'b00000010001001101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd76;
			end
			17'b00000010001001100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd68;
			end
			17'b00000010001000100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd69;
			end
			17'b00000010001000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd71;
			end
			17'b00000010001000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd70;
			end
			17'b00000010001000110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd66;
			end
			17'b00000010001000010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd67;
			end
			17'b00000010001000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd65;
			end
			17'b00000010001000001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd64;
			end
			17'b00000010001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd192;
			end
			17'b00000010011000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd193;
			end
			17'b00000010011000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd195;
			end
			17'b00000010011000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd194;
			end
			17'b00000010011000010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd198;
			end
			17'b00000010011000110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd199;
			end
			17'b00000010011000111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd197;
			end
			17'b00000010011000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd196;
			end
			17'b00000010011000100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd204;
			end
			17'b00000010011001100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd205;
			end
			17'b00000010011001101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd207;
			end
			17'b00000010011001111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd206;
			end
			17'b00000010011001110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd202;
			end
			17'b00000010011001010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd203;
			end
			17'b00000010011001011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd201;
			end
			17'b00000010011001001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd200;
			end
			17'b00000010011001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd216;
			end
			17'b00000010011011000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd217;
			end
			17'b00000010011011001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd219;
			end
			17'b00000010011011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd218;
			end
			17'b00000010011011010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd222;
			end
			17'b00000010011011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd223;
			end
			17'b00000010011011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd221;
			end
			17'b00000010011011101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd220;
			end
			17'b00000010011011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd212;
			end
			17'b00000010011010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd213;
			end
			17'b00000010011010101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd215;
			end
			17'b00000010011010111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd214;
			end
			17'b00000010011010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd210;
			end
			17'b00000010011010010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd211;
			end
			17'b00000010011010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd209;
			end
			17'b00000010011010001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd208;
			end
			17'b00000010011010000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd240;
			end
			17'b00000010011110000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd241;
			end
			17'b00000010011110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd243;
			end
			17'b00000010011110011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd242;
			end
			17'b00000010011110010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd246;
			end
			17'b00000010011110110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd247;
			end
			17'b00000010011110111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd245;
			end
			17'b00000010011110101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd244;
			end
			17'b00000010011110100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd252;
			end
			17'b00000010011111100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd253;
			end
			17'b00000010011111101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd255;
			end
			17'b00000010011111111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd254;
			end
			17'b00000010011111110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd250;
			end
			17'b00000010011111010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd251;
			end
			17'b00000010011111011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd249;
			end
			17'b00000010011111001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd248;
			end
			17'b00000010011111000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd232;
			end
			17'b00000010011101000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd233;
			end
			17'b00000010011101001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd235;
			end
			17'b00000010011101011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd234;
			end
			17'b00000010011101010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd238;
			end
			17'b00000010011101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd239;
			end
			17'b00000010011101111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd237;
			end
			17'b00000010011101101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd236;
			end
			17'b00000010011101100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd228;
			end
			17'b00000010011100100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd229;
			end
			17'b00000010011100101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd231;
			end
			17'b00000010011100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd230;
			end
			17'b00000010011100110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd226;
			end
			17'b00000010011100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd227;
			end
			17'b00000010011100011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd225;
			end
			17'b00000010011100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd224;
			end
			17'b00000010011100000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd160;
			end
			17'b00000010010100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd161;
			end
			17'b00000010010100001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd163;
			end
			17'b00000010010100011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd162;
			end
			17'b00000010010100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd166;
			end
			17'b00000010010100110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd167;
			end
			17'b00000010010100111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd165;
			end
			17'b00000010010100101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd164;
			end
			17'b00000010010100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd172;
			end
			17'b00000010010101100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd173;
			end
			17'b00000010010101101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd175;
			end
			17'b00000010010101111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd174;
			end
			17'b00000010010101110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd170;
			end
			17'b00000010010101010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd171;
			end
			17'b00000010010101011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd169;
			end
			17'b00000010010101001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd168;
			end
			17'b00000010010101000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd184;
			end
			17'b00000010010111000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd185;
			end
			17'b00000010010111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd187;
			end
			17'b00000010010111011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd186;
			end
			17'b00000010010111010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd190;
			end
			17'b00000010010111110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd191;
			end
			17'b00000010010111111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd189;
			end
			17'b00000010010111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd188;
			end
			17'b00000010010111100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd180;
			end
			17'b00000010010110100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd181;
			end
			17'b00000010010110101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd183;
			end
			17'b00000010010110111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd182;
			end
			17'b00000010010110110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd178;
			end
			17'b00000010010110010: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd179;
			end
			17'b00000010010110011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd177;
			end
			17'b00000010010110001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd176;
			end
			17'b00000010010110000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd144;
			end
			17'b00000010010010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd145;
			end
			17'b00000010010010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd147;
			end
			17'b00000010010010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd146;
			end
			17'b00000010010010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd150;
			end
			17'b00000010010010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd151;
			end
			17'b00000010010010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd149;
			end
			17'b00000010010010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd148;
			end
			17'b00000010010010100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd156;
			end
			17'b00000010010011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd157;
			end
			17'b00000010010011101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd159;
			end
			17'b00000010010011111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd158;
			end
			17'b00000010010011110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd154;
			end
			17'b00000010010011010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd155;
			end
			17'b00000010010011011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd153;
			end
			17'b00000010010011001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd152;
			end
			17'b00000010010011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd136;
			end
			17'b00000010010001000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd137;
			end
			17'b00000010010001001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd139;
			end
			17'b00000010010001011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd138;
			end
			17'b00000010010001010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd142;
			end
			17'b00000010010001110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd143;
			end
			17'b00000010010001111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd141;
			end
			17'b00000010010001101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd140;
			end
			17'b00000010010001100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd132;
			end
			17'b00000010010000100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd133;
			end
			17'b00000010010000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd135;
			end
			17'b00000010010000111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd134;
			end
			17'b00000010010000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd130;
			end
			17'b00000010010000010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd131;
			end
			17'b00000010010000011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd129;
			end
			17'b00000010010000001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd128;
			end
			17'b00000010010000000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd384;
			end
			17'b00000010110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd385;
			end
			17'b00000010110000001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd387;
			end
			17'b00000010110000011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd386;
			end
			17'b00000010110000010: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd390;
			end
			17'b00000010110000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd391;
			end
			17'b00000010110000111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd389;
			end
			17'b00000010110000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd388;
			end
			17'b00000010110000100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd396;
			end
			17'b00000010110001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd397;
			end
			17'b00000010110001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd399;
			end
			17'b00000010110001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd398;
			end
			17'b00000010110001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd394;
			end
			17'b00000010110001010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd395;
			end
			17'b00000010110001011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd393;
			end
			17'b00000010110001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd392;
			end
			17'b00000010110001000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd408;
			end
			17'b00000010110011000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd409;
			end
			17'b00000010110011001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd411;
			end
			17'b00000010110011011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd410;
			end
			17'b00000010110011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd414;
			end
			17'b00000010110011110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd415;
			end
			17'b00000010110011111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd413;
			end
			17'b00000010110011101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd412;
			end
			17'b00000010110011100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd404;
			end
			17'b00000010110010100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd405;
			end
			17'b00000010110010101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd407;
			end
			17'b00000010110010111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd406;
			end
			17'b00000010110010110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd402;
			end
			17'b00000010110010010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd403;
			end
			17'b00000010110010011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd401;
			end
			17'b00000010110010001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd400;
			end
			17'b00000010110010000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd432;
			end
			17'b00000010110110000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd433;
			end
			17'b00000010110110001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd435;
			end
			17'b00000010110110011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd434;
			end
			17'b00000010110110010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd438;
			end
			17'b00000010110110110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd439;
			end
			17'b00000010110110111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd437;
			end
			17'b00000010110110101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd436;
			end
			17'b00000010110110100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd444;
			end
			17'b00000010110111100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd445;
			end
			17'b00000010110111101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd447;
			end
			17'b00000010110111111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd446;
			end
			17'b00000010110111110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd442;
			end
			17'b00000010110111010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd443;
			end
			17'b00000010110111011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd441;
			end
			17'b00000010110111001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd440;
			end
			17'b00000010110111000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd424;
			end
			17'b00000010110101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd425;
			end
			17'b00000010110101001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd427;
			end
			17'b00000010110101011: begin
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd426;
			end
			17'b00000010110101010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd430;
			end
			17'b00000010110101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000078;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd431;
			end
			17'b00000010110101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd429;
			end
			17'b00000010110101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd428;
			end
			17'b00000010110101100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000074;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd420;
			end
			17'b00000010110100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000044;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd421;
			end
			17'b00000010110100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd423;
			end
			17'b00000010110100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd422;
			end
			17'b00000010110100110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000054;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd418;
			end
			17'b00000010110100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd419;
			end
			17'b00000010110100011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000048;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd417;
			end
			17'b00000010110100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd416;
			end
			17'b00000010110100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd480;
			end
			17'b00000010111100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd481;
			end
			17'b00000010111100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000004c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd483;
			end
			17'b00000010111100011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd482;
			end
			17'b00000010111100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd486;
			end
			17'b00000010111100110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000070;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd487;
			end
			17'b00000010111100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd485;
			end
			17'b00000010111100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd484;
			end
			17'b00000010111100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000060;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd492;
			end
			17'b00000010111101100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000100;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd493;
			end
			17'b00000010111101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd495;
			end
			17'b00000010111101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd494;
			end
			17'b00000010111101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd490;
			end
			17'b00000010111101010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd491;
			end
			17'b00000010111101011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd489;
			end
			17'b00000010111101001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd488;
			end
			17'b00000010111101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd504;
			end
			17'b00000010111111000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd505;
			end
			17'b00000010111111001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				L_d = 7'd0;
				I_d = 10'd0;
			end
			17'b00000000000000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00000000000000001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00000000000000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00000000000000010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00000000000000110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00000000000000111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00000000000000101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00000000000000100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00000000000001100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00000000000001101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00000000000001111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00000000000001110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b00000000000001010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b00000000000001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00000000000001001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd8;
			end
			17'b00000000000001000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd24;
			end
			17'b00000000000011000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd25;
			end
			17'b00000000000011001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd27;
			end
			17'b00000000000011011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd26;
			end
			17'b00000000000011010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd30;
			end
			17'b00000000000011110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd31;
			end
			17'b00000000000011111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd29;
			end
			17'b00000000000011101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd28;
			end
			17'b00000000000011100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd20;
			end
			17'b00000000000010100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd21;
			end
			17'b00000000000010101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd23;
			end
			17'b00000000000010111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd22;
			end
			17'b00000000000010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd18;
			end
			17'b00000000000010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd19;
			end
			17'b00000000000010011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd17;
			end
			17'b00000000000010001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd16;
			end
			17'b00000000000010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd48;
			end
			17'b00000000000110000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd49;
			end
			17'b00000000000110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd51;
			end
			17'b00000000000110011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd50;
			end
			17'b00000000000110010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd54;
			end
			17'b00000000000110110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd55;
			end
			17'b00000000000110111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd53;
			end
			17'b00000000000110101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd52;
			end
			17'b00000000000110100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd60;
			end
			17'b00000000000111100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd61;
			end
			17'b00000000000111101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd63;
			end
			17'b00000000000111111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd62;
			end
			17'b00000000000111110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd58;
			end
			17'b00000000000111010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd59;
			end
			17'b00000000000111011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd57;
			end
			17'b00000000000111001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd56;
			end
			17'b00000000000111000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd40;
			end
			17'b00000000000101000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd41;
			end
			17'b00000000000101001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd43;
			end
			17'b00000000000101011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd42;
			end
			17'b00000000000101010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd46;
			end
			17'b00000000000101110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd47;
			end
			17'b00000000000101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd45;
			end
			17'b00000000000101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd44;
			end
			17'b00000000000101100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd36;
			end
			17'b00000000000100100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd37;
			end
			17'b00000000000100101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd39;
			end
			17'b00000000000100111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd38;
			end
			17'b00000000000100110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd34;
			end
			17'b00000000000100010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd35;
			end
			17'b00000000000100011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd33;
			end
			17'b00000000000100001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd32;
			end
			17'b00000000000100000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd96;
			end
			17'b00000000001100000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd97;
			end
			17'b00000000001100001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd99;
			end
			17'b00000000001100011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd98;
			end
			17'b00000000001100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd102;
			end
			17'b00000000001100110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd103;
			end
			17'b00000000001100111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd101;
			end
			17'b00000000001100101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd100;
			end
			17'b00000000001100100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd108;
			end
			17'b00000000001101100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd109;
			end
			17'b00000000001101101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd111;
			end
			17'b00000000001101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd110;
			end
			17'b00000000001101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd21;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd106;
			end
			17'b00000000001101010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd107;
			end
			17'b00000000001101011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd105;
			end
			17'b00000000001101001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd104;
			end
			17'b00000000001101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd120;
			end
			17'b00000000001111000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd121;
			end
			17'b00000000001111001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd123;
			end
			17'b00000000001111011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd122;
			end
			17'b00000000001111010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd126;
			end
			17'b00000000001111110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd127;
			end
			17'b00000000001111111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd125;
			end
			17'b00000000001111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd124;
			end
			17'b00000000001111100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd116;
			end
			17'b00000000001110100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd117;
			end
			17'b00000000001110101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd119;
			end
			17'b00000000001110111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd118;
			end
			17'b00000000001110110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd114;
			end
			17'b00000000001110010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd115;
			end
			17'b00000000001110011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd113;
			end
			17'b00000000001110001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd112;
			end
			17'b00000000001110000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd80;
			end
			17'b00000000001010000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd81;
			end
			17'b00000000001010001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd83;
			end
			17'b00000000001010011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd82;
			end
			17'b00000000001010010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd86;
			end
			17'b00000000001010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd87;
			end
			17'b00000000001010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd85;
			end
			17'b00000000001010101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd84;
			end
			17'b00000000001010100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd92;
			end
			17'b00000000001011100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd93;
			end
			17'b00000000001011101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd95;
			end
			17'b00000000001011111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd94;
			end
			17'b00000000001011110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd90;
			end
			17'b00000000001011010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd91;
			end
			17'b00000000001011011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd89;
			end
			17'b00000000001011001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd88;
			end
			17'b00000000001011000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd72;
			end
			17'b00000000001001000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd73;
			end
			17'b00000000001001001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd75;
			end
			17'b00000000001001011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd74;
			end
			17'b00000000001001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd78;
			end
			17'b00000000001001110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd79;
			end
			17'b00000000001001111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd77;
			end
			17'b00000000001001101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd76;
			end
			17'b00000000001001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd68;
			end
			17'b00000000001000100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd69;
			end
			17'b00000000001000101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd71;
			end
			17'b00000000001000111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd70;
			end
			17'b00000000001000110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd66;
			end
			17'b00000000001000010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd67;
			end
			17'b00000000001000011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd65;
			end
			17'b00000000001000001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd64;
			end
			17'b00000000001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd192;
			end
			17'b00000000011000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd193;
			end
			17'b00000000011000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd195;
			end
			17'b00000000011000011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd194;
			end
			17'b00000000011000010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd198;
			end
			17'b00000000011000110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd199;
			end
			17'b00000000011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd197;
			end
			17'b00000000011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd196;
			end
			17'b00000000011000100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd204;
			end
			17'b00000000011001100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd205;
			end
			17'b00000000011001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd207;
			end
			17'b00000000011001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd206;
			end
			17'b00000000011001110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd202;
			end
			17'b00000000011001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd203;
			end
			17'b00000000011001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd201;
			end
			17'b00000000011001001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd200;
			end
			17'b00000000011001000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd216;
			end
			17'b00000000011011000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd217;
			end
			17'b00000000011011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd219;
			end
			17'b00000000011011011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd218;
			end
			17'b00000000011011010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd222;
			end
			17'b00000000011011110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd223;
			end
			17'b00000000011011111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd221;
			end
			17'b00000000011011101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd220;
			end
			17'b00000000011011100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd212;
			end
			17'b00000000011010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd213;
			end
			17'b00000000011010101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd215;
			end
			17'b00000000011010111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd214;
			end
			17'b00000000011010110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd210;
			end
			17'b00000000011010010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd211;
			end
			17'b00000000011010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd209;
			end
			17'b00000000011010001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd208;
			end
			17'b00000000011010000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd240;
			end
			17'b00000000011110000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd241;
			end
			17'b00000000011110001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd243;
			end
			17'b00000000011110011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd242;
			end
			17'b00000000011110010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd246;
			end
			17'b00000000011110110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd247;
			end
			17'b00000000011110111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd245;
			end
			17'b00000000011110101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd244;
			end
			17'b00000000011110100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd252;
			end
			17'b00000000011111100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd253;
			end
			17'b00000000011111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd255;
			end
			17'b00000000011111111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd254;
			end
			17'b00000000011111110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd250;
			end
			17'b00000000011111010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd251;
			end
			17'b00000000011111011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd249;
			end
			17'b00000000011111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd248;
			end
			17'b00000000011111000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd232;
			end
			17'b00000000011101000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd233;
			end
			17'b00000000011101001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd235;
			end
			17'b00000000011101011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd234;
			end
			17'b00000000011101010: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd238;
			end
			17'b00000000011101110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd239;
			end
			17'b00000000011101111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd237;
			end
			17'b00000000011101101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd236;
			end
			17'b00000000011101100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd228;
			end
			17'b00000000011100100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd229;
			end
			17'b00000000011100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd231;
			end
			17'b00000000011100111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd230;
			end
			17'b00000000011100110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd226;
			end
			17'b00000000011100010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd227;
			end
			17'b00000000011100011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd225;
			end
			17'b00000000011100001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd224;
			end
			17'b00000000011100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd160;
			end
			17'b00000000010100000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd161;
			end
			17'b00000000010100001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd163;
			end
			17'b00000000010100011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd162;
			end
			17'b00000000010100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd166;
			end
			17'b00000000010100110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd167;
			end
			17'b00000000010100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd165;
			end
			17'b00000000010100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd164;
			end
			17'b00000000010100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd172;
			end
			17'b00000000010101100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd173;
			end
			17'b00000000010101101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd175;
			end
			17'b00000000010101111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd174;
			end
			17'b00000000010101110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd170;
			end
			17'b00000000010101010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd171;
			end
			17'b00000000010101011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd169;
			end
			17'b00000000010101001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd168;
			end
			17'b00000000010101000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd184;
			end
			17'b00000000010111000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd185;
			end
			17'b00000000010111001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd187;
			end
			17'b00000000010111011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd186;
			end
			17'b00000000010111010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd190;
			end
			17'b00000000010111110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd191;
			end
			17'b00000000010111111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd189;
			end
			17'b00000000010111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd188;
			end
			17'b00000000010111100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd180;
			end
			17'b00000000010110100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd181;
			end
			17'b00000000010110101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd183;
			end
			17'b00000000010110111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd182;
			end
			17'b00000000010110110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd178;
			end
			17'b00000000010110010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd179;
			end
			17'b00000000010110011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd177;
			end
			17'b00000000010110001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd176;
			end
			17'b00000000010110000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd144;
			end
			17'b00000000010010000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd145;
			end
			17'b00000000010010001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd147;
			end
			17'b00000000010010011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd146;
			end
			17'b00000000010010010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd150;
			end
			17'b00000000010010110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd151;
			end
			17'b00000000010010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd149;
			end
			17'b00000000010010101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd148;
			end
			17'b00000000010010100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd156;
			end
			17'b00000000010011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd157;
			end
			17'b00000000010011101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd159;
			end
			17'b00000000010011111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd158;
			end
			17'b00000000010011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd154;
			end
			17'b00000000010011010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd27;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd155;
			end
			17'b00000000010011011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd153;
			end
			17'b00000000010011001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd152;
			end
			17'b00000000010011000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd136;
			end
			17'b00000000010001000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd137;
			end
			17'b00000000010001001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd139;
			end
			17'b00000000010001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd138;
			end
			17'b00000000010001010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd142;
			end
			17'b00000000010001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd143;
			end
			17'b00000000010001111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd141;
			end
			17'b00000000010001101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd140;
			end
			17'b00000000010001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd132;
			end
			17'b00000000010000100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd133;
			end
			17'b00000000010000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd135;
			end
			17'b00000000010000111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd134;
			end
			17'b00000000010000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd130;
			end
			17'b00000000010000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd131;
			end
			17'b00000000010000011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd129;
			end
			17'b00000000010000001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd128;
			end
			17'b00000000010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd384;
			end
			17'b00000000110000000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd385;
			end
			17'b00000000110000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd387;
			end
			17'b00000000110000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd386;
			end
			17'b00000000110000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd390;
			end
			17'b00000000110000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd391;
			end
			17'b00000000110000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd389;
			end
			17'b00000000110000101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd388;
			end
			17'b00000000110000100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd396;
			end
			17'b00000000110001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd397;
			end
			17'b00000000110001101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd399;
			end
			17'b00000000110001111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd398;
			end
			17'b00000000110001110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd394;
			end
			17'b00000000110001010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd395;
			end
			17'b00000000110001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd393;
			end
			17'b00000000110001001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd392;
			end
			17'b00000000110001000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd408;
			end
			17'b00000000110011000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd409;
			end
			17'b00000000110011001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd411;
			end
			17'b00000000110011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd410;
			end
			17'b00000000110011010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd414;
			end
			17'b00000000110011110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd415;
			end
			17'b00000000110011111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd27;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd413;
			end
			17'b00000000110011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd412;
			end
			17'b00000000110011100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd404;
			end
			17'b00000000110010100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd405;
			end
			17'b00000000110010101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd407;
			end
			17'b00000000110010111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd406;
			end
			17'b00000000110010110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd402;
			end
			17'b00000000110010010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd403;
			end
			17'b00000000110010011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd401;
			end
			17'b00000000110010001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd400;
			end
			17'b00000000110010000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd432;
			end
			17'b00000000110110000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd433;
			end
			17'b00000000110110001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd435;
			end
			17'b00000000110110011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd434;
			end
			17'b00000000110110010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd438;
			end
			17'b00000000110110110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd439;
			end
			17'b00000000110110111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd437;
			end
			17'b00000000110110101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd436;
			end
			17'b00000000110110100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd444;
			end
			17'b00000000110111100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd445;
			end
			17'b00000000110111101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd447;
			end
			17'b00000000110111111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd446;
			end
			17'b00000000110111110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd442;
			end
			17'b00000000110111010: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd443;
			end
			17'b00000000110111011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd441;
			end
			17'b00000000110111001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd440;
			end
			17'b00000000110111000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd424;
			end
			17'b00000000110101000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd425;
			end
			17'b00000000110101001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd427;
			end
			17'b00000000110101011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd426;
			end
			17'b00000000110101010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd430;
			end
			17'b00000000110101110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd431;
			end
			17'b00000000110101111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd429;
			end
			17'b00000000110101101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd428;
			end
			17'b00000000110101100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd420;
			end
			17'b00000000110100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd421;
			end
			17'b00000000110100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd423;
			end
			17'b00000000110100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd422;
			end
			17'b00000000110100110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd418;
			end
			17'b00000000110100010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd419;
			end
			17'b00000000110100011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd417;
			end
			17'b00000000110100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd416;
			end
			17'b00000000110100000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd480;
			end
			17'b00000000111100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd481;
			end
			17'b00000000111100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd483;
			end
			17'b00000000111100011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd482;
			end
			17'b00000000111100010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd486;
			end
			17'b00000000111100110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd487;
			end
			17'b00000000111100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd485;
			end
			17'b00000000111100101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd484;
			end
			17'b00000000111100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd492;
			end
			17'b00000000111101100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd493;
			end
			17'b00000000111101101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd27;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd495;
			end
			17'b00000000111101111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd494;
			end
			17'b00000000111101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd490;
			end
			17'b00000000111101010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd491;
			end
			17'b00000000111101011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd27;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd489;
			end
			17'b00000000111101001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd488;
			end
			17'b00000000111101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd504;
			end
			17'b00000000111111000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd505;
			end
			17'b00000000111111001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd507;
			end
			17'b00000000111111011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd506;
			end
			17'b00000000111111010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd510;
			end
			17'b00000000111111110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd511;
			end
			17'b00000000111111111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd509;
			end
			17'b00000000111111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd508;
			end
			17'b00000000111111100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd500;
			end
			17'b00000000111110100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd501;
			end
			17'b00000000111110101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd503;
			end
			17'b00000000111110111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd502;
			end
			17'b00000000111110110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd498;
			end
			17'b00000000111110010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd499;
			end
			17'b00000000111110011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd497;
			end
			17'b00000000111110001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd496;
			end
			17'b00000000111110000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd464;
			end
			17'b00000000111010000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd465;
			end
			17'b00000000111010001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd467;
			end
			17'b00000000111010011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd466;
			end
			17'b00000000111010010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd470;
			end
			17'b00000000111010110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd471;
			end
			17'b00000000111010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd469;
			end
			17'b00000000111010101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd468;
			end
			17'b00000000111010100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd476;
			end
			17'b00000000111011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd477;
			end
			17'b00000000111011101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd479;
			end
			17'b00000000111011111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd478;
			end
			17'b00000000111011110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd474;
			end
			17'b00000000111011010: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd475;
			end
			17'b00000000111011011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd473;
			end
			17'b00000000111011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd472;
			end
			17'b00000000111011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd456;
			end
			17'b00000000111001000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd457;
			end
			17'b00000000111001001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd459;
			end
			17'b00000000111001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd458;
			end
			17'b00000000111001010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd462;
			end
			17'b00000000111001110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd463;
			end
			17'b00000000111001111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd461;
			end
			17'b00000000111001101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd460;
			end
			17'b00000000111001100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd452;
			end
			17'b00000000111000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd453;
			end
			17'b00000000111000101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd455;
			end
			17'b00000000111000111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd454;
			end
			17'b00000000111000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd450;
			end
			17'b00000000111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd451;
			end
			17'b00000000111000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd449;
			end
			17'b00000000111000001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd448;
			end
			17'b00000000111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd320;
			end
			17'b00000000101000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd321;
			end
			17'b00000000101000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd323;
			end
			17'b00000000101000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd322;
			end
			17'b00000000101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd326;
			end
			17'b00000000101000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd327;
			end
			17'b00000000101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd325;
			end
			17'b00000000101000101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd324;
			end
			17'b00000000101000100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd332;
			end
			17'b00000000101001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd333;
			end
			17'b00000000101001101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd335;
			end
			17'b00000000101001111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd334;
			end
			17'b00000000101001110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd330;
			end
			17'b00000000101001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd331;
			end
			17'b00000000101001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd329;
			end
			17'b00000000101001001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd328;
			end
			17'b00000000101001000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd344;
			end
			17'b00000000101011000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd345;
			end
			17'b00000000101011001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd347;
			end
			17'b00000000101011011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd346;
			end
			17'b00000000101011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd350;
			end
			17'b00000000101011110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd351;
			end
			17'b00000000101011111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd349;
			end
			17'b00000000101011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd348;
			end
			17'b00000000101011100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd340;
			end
			17'b00000000101010100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd341;
			end
			17'b00000000101010101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd343;
			end
			17'b00000000101010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd342;
			end
			17'b00000000101010110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd338;
			end
			17'b00000000101010010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd339;
			end
			17'b00000000101010011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd337;
			end
			17'b00000000101010001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd336;
			end
			17'b00000000101010000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd368;
			end
			17'b00000000101110000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd369;
			end
			17'b00000000101110001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd371;
			end
			17'b00000000101110011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd370;
			end
			17'b00000000101110010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd374;
			end
			17'b00000000101110110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd375;
			end
			17'b00000000101110111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd373;
			end
			17'b00000000101110101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd372;
			end
			17'b00000000101110100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd380;
			end
			17'b00000000101111100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd381;
			end
			17'b00000000101111101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd383;
			end
			17'b00000000101111111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd382;
			end
			17'b00000000101111110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd378;
			end
			17'b00000000101111010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd379;
			end
			17'b00000000101111011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd377;
			end
			17'b00000000101111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd376;
			end
			17'b00000000101111000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd360;
			end
			17'b00000000101101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd361;
			end
			17'b00000000101101001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd363;
			end
			17'b00000000101101011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd362;
			end
			17'b00000000101101010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd366;
			end
			17'b00000000101101110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd367;
			end
			17'b00000000101101111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd365;
			end
			17'b00000000101101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd364;
			end
			17'b00000000101101100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd356;
			end
			17'b00000000101100100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd357;
			end
			17'b00000000101100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd359;
			end
			17'b00000000101100111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd358;
			end
			17'b00000000101100110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd354;
			end
			17'b00000000101100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd355;
			end
			17'b00000000101100011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd353;
			end
			17'b00000000101100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd352;
			end
			17'b00000000101100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd288;
			end
			17'b00000000100100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd289;
			end
			17'b00000000100100001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd291;
			end
			17'b00000000100100011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd290;
			end
			17'b00000000100100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd294;
			end
			17'b00000000100100110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd295;
			end
			17'b00000000100100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd293;
			end
			17'b00000000100100101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd292;
			end
			17'b00000000100100100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd300;
			end
			17'b00000000100101100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd301;
			end
			17'b00000000100101101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd303;
			end
			17'b00000000100101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd302;
			end
			17'b00000000100101110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd298;
			end
			17'b00000000100101010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd299;
			end
			17'b00000000100101011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd297;
			end
			17'b00000000100101001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd296;
			end
			17'b00000000100101000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd312;
			end
			17'b00000000100111000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd313;
			end
			17'b00000000100111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd315;
			end
			17'b00000000100111011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd314;
			end
			17'b00000000100111010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd318;
			end
			17'b00000000100111110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd319;
			end
			17'b00000000100111111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd317;
			end
			17'b00000000100111101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd316;
			end
			17'b00000000100111100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd308;
			end
			17'b00000000100110100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd309;
			end
			17'b00000000100110101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd311;
			end
			17'b00000000100110111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd310;
			end
			17'b00000000100110110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd306;
			end
			17'b00000000100110010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd307;
			end
			17'b00000000100110011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd305;
			end
			17'b00000000100110001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd304;
			end
			17'b00000000100110000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd272;
			end
			17'b00000000100010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd273;
			end
			17'b00000000100010001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd275;
			end
			17'b00000000100010011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd274;
			end
			17'b00000000100010010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd278;
			end
			17'b00000000100010110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd279;
			end
			17'b00000000100010111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd277;
			end
			17'b00000000100010101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd276;
			end
			17'b00000000100010100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd284;
			end
			17'b00000000100011100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd285;
			end
			17'b00000000100011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd287;
			end
			17'b00000000100011111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd286;
			end
			17'b00000000100011110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd282;
			end
			17'b00000000100011010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd283;
			end
			17'b00000000100011011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd281;
			end
			17'b00000000100011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd280;
			end
			17'b00000000100011000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd264;
			end
			17'b00000000100001000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd265;
			end
			17'b00000000100001001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd267;
			end
			17'b00000000100001011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd266;
			end
			17'b00000000100001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd270;
			end
			17'b00000000100001110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd271;
			end
			17'b00000000100001111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd269;
			end
			17'b00000000100001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd268;
			end
			17'b00000000100001100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd260;
			end
			17'b00000000100000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd261;
			end
			17'b00000000100000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd263;
			end
			17'b00000000100000111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd262;
			end
			17'b00000000100000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd258;
			end
			17'b00000000100000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd259;
			end
			17'b00000000100000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd257;
			end
			17'b00000000100000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd256;
			end
			17'b00000000100000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd768;
			end
			17'b00000001100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd769;
			end
			17'b00000001100000001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd771;
			end
			17'b00000001100000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd770;
			end
			17'b00000001100000010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd774;
			end
			17'b00000001100000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd775;
			end
			17'b00000001100000111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd773;
			end
			17'b00000001100000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd772;
			end
			17'b00000001100000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd780;
			end
			17'b00000001100001100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd781;
			end
			17'b00000001100001101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd783;
			end
			17'b00000001100001111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd782;
			end
			17'b00000001100001110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd778;
			end
			17'b00000001100001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd779;
			end
			17'b00000001100001011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd777;
			end
			17'b00000001100001001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd776;
			end
			17'b00000001100001000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd792;
			end
			17'b00000001100011000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd793;
			end
			17'b00000001100011001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd795;
			end
			17'b00000001100011011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd794;
			end
			17'b00000001100011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd798;
			end
			17'b00000001100011110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd799;
			end
			17'b00000001100011111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd797;
			end
			17'b00000001100011101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd796;
			end
			17'b00000001100011100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd788;
			end
			17'b00000001100010100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd789;
			end
			17'b00000001100010101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd791;
			end
			17'b00000001100010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd790;
			end
			17'b00000001100010110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd786;
			end
			17'b00000001100010010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd787;
			end
			17'b00000001100010011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd785;
			end
			17'b00000001100010001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd784;
			end
			17'b00000001100010000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd816;
			end
			17'b00000001100110000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd817;
			end
			17'b00000001100110001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd819;
			end
			17'b00000001100110011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd818;
			end
			17'b00000001100110010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd822;
			end
			17'b00000001100110110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd823;
			end
			17'b00000001100110111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd821;
			end
			17'b00000001100110101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd820;
			end
			17'b00000001100110100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd828;
			end
			17'b00000001100111100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd829;
			end
			17'b00000001100111101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd831;
			end
			17'b00000001100111111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd830;
			end
			17'b00000001100111110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd826;
			end
			17'b00000001100111010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd827;
			end
			17'b00000001100111011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd825;
			end
			17'b00000001100111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd824;
			end
			17'b00000001100111000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd808;
			end
			17'b00000001100101000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd809;
			end
			17'b00000001100101001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd811;
			end
			17'b00000001100101011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd810;
			end
			17'b00000001100101010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd814;
			end
			17'b00000001100101110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd815;
			end
			17'b00000001100101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd813;
			end
			17'b00000001100101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd812;
			end
			17'b00000001100101100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd804;
			end
			17'b00000001100100100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd805;
			end
			17'b00000001100100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd807;
			end
			17'b00000001100100111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd806;
			end
			17'b00000001100100110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd802;
			end
			17'b00000001100100010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd803;
			end
			17'b00000001100100011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd801;
			end
			17'b00000001100100001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd800;
			end
			17'b00000001100100000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd864;
			end
			17'b00000001101100000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd865;
			end
			17'b00000001101100001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd867;
			end
			17'b00000001101100011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd866;
			end
			17'b00000001101100010: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd870;
			end
			17'b00000001101100110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd871;
			end
			17'b00000001101100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd869;
			end
			17'b00000001101100101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd868;
			end
			17'b00000001101100100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd876;
			end
			17'b00000001101101100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd877;
			end
			17'b00000001101101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd879;
			end
			17'b00000001101101111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd878;
			end
			17'b00000001101101110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd874;
			end
			17'b00000001101101010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd875;
			end
			17'b00000001101101011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd873;
			end
			17'b00000001101101001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd872;
			end
			17'b00000001101101000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd888;
			end
			17'b00000001101111000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd889;
			end
			17'b00000001101111001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd891;
			end
			17'b00000001101111011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd890;
			end
			17'b00000001101111010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd894;
			end
			17'b00000001101111110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd895;
			end
			17'b00000001101111111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd893;
			end
			17'b00000001101111101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd892;
			end
			17'b00000001101111100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd884;
			end
			17'b00000001101110100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd885;
			end
			17'b00000001101110101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd887;
			end
			17'b00000001101110111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd886;
			end
			17'b00000001101110110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd882;
			end
			17'b00000001101110010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd883;
			end
			17'b00000001101110011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd881;
			end
			17'b00000001101110001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd880;
			end
			17'b00000001101110000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd848;
			end
			17'b00000001101010000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd849;
			end
			17'b00000001101010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd851;
			end
			17'b00000001101010011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd850;
			end
			17'b00000001101010010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd854;
			end
			17'b00000001101010110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd855;
			end
			17'b00000001101010111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd853;
			end
			17'b00000001101010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd852;
			end
			17'b00000001101010100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd860;
			end
			17'b00000001101011100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd861;
			end
			17'b00000001101011101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd863;
			end
			17'b00000001101011111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd862;
			end
			17'b00000001101011110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd858;
			end
			17'b00000001101011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd859;
			end
			17'b00000001101011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd857;
			end
			17'b00000001101011001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd856;
			end
			17'b00000001101011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd840;
			end
			17'b00000001101001000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd841;
			end
			17'b00000001101001001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd843;
			end
			17'b00000001101001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd842;
			end
			17'b00000001101001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd846;
			end
			17'b00000001101001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd847;
			end
			17'b00000001101001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd845;
			end
			17'b00000001101001101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd844;
			end
			17'b00000001101001100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd836;
			end
			17'b00000001101000100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd837;
			end
			17'b00000001101000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd839;
			end
			17'b00000001101000111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd838;
			end
			17'b00000001101000110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd834;
			end
			17'b00000001101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd835;
			end
			17'b00000001101000011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd833;
			end
			17'b00000001101000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd832;
			end
			17'b00000001101000000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd960;
			end
			17'b00000001111000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd961;
			end
			17'b00000001111000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd963;
			end
			17'b00000001111000011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd962;
			end
			17'b00000001111000010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd966;
			end
			17'b00000001111000110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd967;
			end
			17'b00000001111000111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd965;
			end
			17'b00000001111000101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd964;
			end
			17'b00000001111000100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd972;
			end
			17'b00000001111001100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd973;
			end
			17'b00000001111001101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd975;
			end
			17'b00000001111001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd974;
			end
			17'b00000001111001110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd970;
			end
			17'b00000001111001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd971;
			end
			17'b00000001111001011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd969;
			end
			17'b00000001111001001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd968;
			end
			17'b00000001111001000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd984;
			end
			17'b00000001111011000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd985;
			end
			17'b00000001111011001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd987;
			end
			17'b00000001111011011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd986;
			end
			17'b00000001111011010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd990;
			end
			17'b00000001111011110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd991;
			end
			17'b00000001111011111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd989;
			end
			17'b00000001111011101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd988;
			end
			17'b00000001111011100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd980;
			end
			17'b00000001111010100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd981;
			end
			17'b00000001111010101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd983;
			end
			17'b00000001111010111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd982;
			end
			17'b00000001111010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd978;
			end
			17'b00000001111010010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd979;
			end
			17'b00000001111010011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd977;
			end
			17'b00000001111010001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd976;
			end
			17'b00000001111010000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1008;
			end
			17'b00000001111110000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1009;
			end
			17'b00000001111110001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1011;
			end
			17'b00000001111110011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1010;
			end
			17'b00000001111110010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1014;
			end
			17'b00000001111110110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1015;
			end
			17'b00000001111110111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1013;
			end
			17'b00000001111110101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1012;
			end
			17'b00000001111110100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1020;
			end
			17'b00000001111111100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1021;
			end
			17'b00000001111111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1023;
			end
			17'b00000001111111111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1022;
			end
			17'b00000001111111110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1018;
			end
			17'b00000001111111010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1019;
			end
			17'b00000001111111011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1017;
			end
			17'b00000001111111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1016;
			end
			17'b00000001111111000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1000;
			end
			17'b00000001111101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1001;
			end
			17'b00000001111101001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1003;
			end
			17'b00000001111101011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1002;
			end
			17'b00000001111101010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1006;
			end
			17'b00000001111101110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1007;
			end
			17'b00000001111101111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1005;
			end
			17'b00000001111101101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1004;
			end
			17'b00000001111101100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd996;
			end
			17'b00000001111100100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd997;
			end
			17'b00000001111100101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd999;
			end
			17'b00000001111100111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd998;
			end
			17'b00000001111100110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd994;
			end
			17'b00000001111100010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd995;
			end
			17'b00000001111100011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd993;
			end
			17'b00000001111100001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd992;
			end
			17'b00000001111100000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd928;
			end
			17'b00000001110100000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd929;
			end
			17'b00000001110100001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd931;
			end
			17'b00000001110100011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd930;
			end
			17'b00000001110100010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd934;
			end
			17'b00000001110100110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd935;
			end
			17'b00000001110100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd933;
			end
			17'b00000001110100101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd932;
			end
			17'b00000001110100100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd940;
			end
			17'b00000001110101100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd941;
			end
			17'b00000001110101101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd943;
			end
			17'b00000001110101111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd942;
			end
			17'b00000001110101110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd938;
			end
			17'b00000001110101010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd939;
			end
			17'b00000001110101011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd937;
			end
			17'b00000001110101001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd936;
			end
			17'b00000001110101000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd952;
			end
			17'b00000001110111000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd953;
			end
			17'b00000001110111001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd955;
			end
			17'b00000001110111011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd954;
			end
			17'b00000001110111010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd958;
			end
			17'b00000001110111110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd959;
			end
			17'b00000001110111111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd957;
			end
			17'b00000001110111101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd956;
			end
			17'b00000001110111100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd948;
			end
			17'b00000001110110100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd949;
			end
			17'b00000001110110101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd951;
			end
			17'b00000001110110111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd950;
			end
			17'b00000001110110110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd946;
			end
			17'b00000001110110010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd947;
			end
			17'b00000001110110011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd945;
			end
			17'b00000001110110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd944;
			end
			17'b00000001110110000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd912;
			end
			17'b00000001110010000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd913;
			end
			17'b00000001110010001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd915;
			end
			17'b00000001110010011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd914;
			end
			17'b00000001110010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd918;
			end
			17'b00000001110010110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd919;
			end
			17'b00000001110010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd917;
			end
			17'b00000001110010101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd916;
			end
			17'b00000001110010100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd924;
			end
			17'b00000001110011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd925;
			end
			17'b00000001110011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd927;
			end
			17'b00000001110011111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd926;
			end
			17'b00000001110011110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd922;
			end
			17'b00000001110011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd923;
			end
			17'b00000001110011011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd921;
			end
			17'b00000001110011001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd920;
			end
			17'b00000001110011000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd904;
			end
			17'b00000001110001000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd905;
			end
			17'b00000001110001001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd907;
			end
			17'b00000001110001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd906;
			end
			17'b00000001110001010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd910;
			end
			17'b00000001110001110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd911;
			end
			17'b00000001110001111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd909;
			end
			17'b00000001110001101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd908;
			end
			17'b00000001110001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd900;
			end
			17'b00000001110000100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd901;
			end
			17'b00000001110000101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd903;
			end
			17'b00000001110000111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd902;
			end
			17'b00000001110000110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd898;
			end
			17'b00000001110000010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd899;
			end
			17'b00000001110000011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd897;
			end
			17'b00000001110000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd896;
			end
			17'b00000001110000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd640;
			end
			17'b00000001010000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd641;
			end
			17'b00000001010000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd643;
			end
			17'b00000001010000011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd642;
			end
			17'b00000001010000010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd646;
			end
			17'b00000001010000110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd647;
			end
			17'b00000001010000111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd645;
			end
			17'b00000001010000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd644;
			end
			17'b00000001010000100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd652;
			end
			17'b00000001010001100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd653;
			end
			17'b00000001010001101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd655;
			end
			17'b00000001010001111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd654;
			end
			17'b00000001010001110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd650;
			end
			17'b00000001010001010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd651;
			end
			17'b00000001010001011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd649;
			end
			17'b00000001010001001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd648;
			end
			17'b00000001010001000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd664;
			end
			17'b00000001010011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd665;
			end
			17'b00000001010011001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd667;
			end
			17'b00000001010011011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd666;
			end
			17'b00000001010011010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd670;
			end
			17'b00000001010011110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd671;
			end
			17'b00000001010011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd669;
			end
			17'b00000001010011101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd668;
			end
			17'b00000001010011100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd660;
			end
			17'b00000001010010100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd661;
			end
			17'b00000001010010101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd663;
			end
			17'b00000001010010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd662;
			end
			17'b00000001010010110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd658;
			end
			17'b00000001010010010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd659;
			end
			17'b00000001010010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd657;
			end
			17'b00000001010010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd656;
			end
			17'b00000001010010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd688;
			end
			17'b00000001010110000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd689;
			end
			17'b00000001010110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd691;
			end
			17'b00000001010110011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd690;
			end
			17'b00000001010110010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd694;
			end
			17'b00000001010110110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd695;
			end
			17'b00000001010110111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd693;
			end
			17'b00000001010110101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd692;
			end
			17'b00000001010110100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd700;
			end
			17'b00000001010111100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd701;
			end
			17'b00000001010111101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd703;
			end
			17'b00000001010111111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd702;
			end
			17'b00000001010111110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd698;
			end
			17'b00000001010111010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd699;
			end
			17'b00000001010111011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd697;
			end
			17'b00000001010111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd696;
			end
			17'b00000001010111000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd680;
			end
			17'b00000001010101000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd681;
			end
			17'b00000001010101001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd683;
			end
			17'b00000001010101011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd682;
			end
			17'b00000001010101010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd686;
			end
			17'b00000001010101110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd687;
			end
			17'b00000001010101111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd685;
			end
			17'b00000001010101101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd684;
			end
			17'b00000001010101100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd676;
			end
			17'b00000001010100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd677;
			end
			17'b00000001010100101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd679;
			end
			17'b00000001010100111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd678;
			end
			17'b00000001010100110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd674;
			end
			17'b00000001010100010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd675;
			end
			17'b00000001010100011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd673;
			end
			17'b00000001010100001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd672;
			end
			17'b00000001010100000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd736;
			end
			17'b00000001011100000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd737;
			end
			17'b00000001011100001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd739;
			end
			17'b00000001011100011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd738;
			end
			17'b00000001011100010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd742;
			end
			17'b00000001011100110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd743;
			end
			17'b00000001011100111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd741;
			end
			17'b00000001011100101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd740;
			end
			17'b00000001011100100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd748;
			end
			17'b00000001011101100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd749;
			end
			17'b00000001011101101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd751;
			end
			17'b00000001011101111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd750;
			end
			17'b00000001011101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd746;
			end
			17'b00000001011101010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd747;
			end
			17'b00000001011101011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd745;
			end
			17'b00000001011101001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd744;
			end
			17'b00000001011101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd760;
			end
			17'b00000001011111000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd761;
			end
			17'b00000001011111001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd763;
			end
			17'b00000001011111011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd762;
			end
			17'b00000001011111010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd766;
			end
			17'b00000001011111110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd767;
			end
			17'b00000001011111111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd765;
			end
			17'b00000001011111101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd764;
			end
			17'b00000001011111100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd756;
			end
			17'b00000001011110100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd757;
			end
			17'b00000001011110101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd759;
			end
			17'b00000001011110111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd758;
			end
			17'b00000001011110110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd754;
			end
			17'b00000001011110010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd755;
			end
			17'b00000001011110011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd753;
			end
			17'b00000001011110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd752;
			end
			17'b00000001011110000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd720;
			end
			17'b00000001011010000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd721;
			end
			17'b00000001011010001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd723;
			end
			17'b00000001011010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd722;
			end
			17'b00000001011010010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd726;
			end
			17'b00000001011010110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd727;
			end
			17'b00000001011010111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd725;
			end
			17'b00000001011010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd724;
			end
			17'b00000001011010100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd732;
			end
			17'b00000001011011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd733;
			end
			17'b00000001011011101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd735;
			end
			17'b00000001011011111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd734;
			end
			17'b00000001011011110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd730;
			end
			17'b00000001011011010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd731;
			end
			17'b00000001011011011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd729;
			end
			17'b00000001011011001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd728;
			end
			17'b00000001011011000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd712;
			end
			17'b00000001011001000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd713;
			end
			17'b00000001011001001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd715;
			end
			17'b00000001011001011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd714;
			end
			17'b00000001011001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd718;
			end
			17'b00000001011001110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd719;
			end
			17'b00000001011001111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd717;
			end
			17'b00000001011001101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd716;
			end
			17'b00000001011001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd708;
			end
			17'b00000001011000100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd709;
			end
			17'b00000001011000101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd711;
			end
			17'b00000001011000111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd710;
			end
			17'b00000001011000110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd706;
			end
			17'b00000001011000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd707;
			end
			17'b00000001011000011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd705;
			end
			17'b00000001011000001: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd704;
			end
			17'b00000001011000000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd576;
			end
			17'b00000001001000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd577;
			end
			17'b00000001001000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd579;
			end
			17'b00000001001000011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd578;
			end
			17'b00000001001000010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd582;
			end
			17'b00000001001000110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd583;
			end
			17'b00000001001000111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd581;
			end
			17'b00000001001000101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd580;
			end
			17'b00000001001000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd588;
			end
			17'b00000001001001100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd589;
			end
			17'b00000001001001101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd591;
			end
			17'b00000001001001111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd590;
			end
			17'b00000001001001110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd586;
			end
			17'b00000001001001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd587;
			end
			17'b00000001001001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd585;
			end
			17'b00000001001001001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd584;
			end
			17'b00000001001001000: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd600;
			end
			17'b00000001001011000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd601;
			end
			17'b00000001001011001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd603;
			end
			17'b00000001001011011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd602;
			end
			17'b00000001001011010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd606;
			end
			17'b00000001001011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd607;
			end
			17'b00000001001011111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd605;
			end
			17'b00000001001011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd604;
			end
			17'b00000001001011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd596;
			end
			17'b00000001001010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd597;
			end
			17'b00000001001010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd599;
			end
			17'b00000001001010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd598;
			end
			17'b00000001001010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd594;
			end
			17'b00000001001010010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001a;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd595;
			end
			17'b00000001001010011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd593;
			end
			17'b00000001001010001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd592;
			end
			17'b00000001001010000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd624;
			end
			17'b00000001001110000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd625;
			end
			17'b00000001001110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd627;
			end
			17'b00000001001110011: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd626;
			end
			17'b00000001001110010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd630;
			end
			17'b00000001001110110: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd631;
			end
			17'b00000001001110111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001e;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd629;
			end
			17'b00000001001110101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd628;
			end
			17'b00000001001110100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd636;
			end
			17'b00000001001111100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd637;
			end
			17'b00000001001111101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd639;
			end
			17'b00000001001111111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd638;
			end
			17'b00000001001111110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd634;
			end
			17'b00000001001111010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd635;
			end
			17'b00000001001111011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd633;
			end
			17'b00000001001111001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000019;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd632;
			end
			17'b00000001001111000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd616;
			end
			17'b00000001001101000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd617;
			end
			17'b00000001001101001: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd619;
			end
			17'b00000001001101011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd618;
			end
			17'b00000001001101010: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd622;
			end
			17'b00000001001101110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd623;
			end
			17'b00000001001101111: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd621;
			end
			17'b00000001001101101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd620;
			end
			17'b00000001001101100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd612;
			end
			17'b00000001001100100: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd613;
			end
			17'b00000001001100101: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd615;
			end
			17'b00000001001100111: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd614;
			end
			17'b00000001001100110: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd610;
			end
			17'b00000001001100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd611;
			end
			17'b00000001001100011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd609;
			end
			17'b00000001001100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd608;
			end
			17'b00000001001100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd544;
			end
			17'b00000001000100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd545;
			end
			17'b00000001000100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd547;
			end
			17'b00000001000100011: begin
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd546;
			end
			17'b00000001000100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd550;
			end
			17'b00000001000100110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd551;
			end
			17'b00000001000100111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd549;
			end
			17'b00000001000100101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd548;
			end
			17'b00000001000100100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd556;
			end
			17'b00000001000101100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd557;
			end
			17'b00000001000101101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd559;
			end
			17'b00000001000101111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd558;
			end
			17'b00000001000101110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd554;
			end
			17'b00000001000101010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd555;
			end
			17'b00000001000101011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd553;
			end
			17'b00000001000101001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd552;
			end
			17'b00000001000101000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd568;
			end
			17'b00000001000111000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ac;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd569;
			end
			17'b00000001000111001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd571;
			end
			17'b00000001000111011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd27;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd570;
			end
			17'b00000001000111010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd574;
			end
			17'b00000001000111110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd575;
			end
			17'b00000001000111111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd573;
			end
			17'b00000001000111101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd572;
			end
			17'b00000001000111100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd564;
			end
			17'b00000001000110100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd565;
			end
			17'b00000001000110101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd567;
			end
			17'b00000001000110111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd566;
			end
			17'b00000001000110110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd562;
			end
			17'b00000001000110010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd563;
			end
			17'b00000001000110011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a8;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd561;
			end
			17'b00000001000110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a4;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd560;
			end
			17'b00000001000110000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd528;
			end
			17'b00000001000010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd529;
			end
			17'b00000001000010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd531;
			end
			17'b00000001000010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd530;
			end
			17'b00000001000010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd534;
			end
			17'b00000001000010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd535;
			end
			17'b00000001000010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000088;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd533;
			end
			17'b00000001000010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000084;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd532;
			end
			17'b00000001000010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd540;
			end
			17'b00000001000011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd541;
			end
			17'b00000001000011101: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b00101110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffd0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00101110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b00101110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd2;
			end
			17'b00101110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00101110000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd7;
			end
			17'b00101110000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd5;
			end
			17'b00101110000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd4;
			end
			17'b00101110000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd12;
			end
			17'b00101110000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b00101110000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00101110000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00101110000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b00101110000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b00101110000001011: begin
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd21;
					I_d = 10'd0;
				end
				else
					I_d = 10'd9;
			end
			17'b00101110000001001: begin
				alu_operand_b_ex_o = 32'h00000040;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd8;
			end
			17'b00101110000001000: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd24;
			end
			17'b00101110000011000: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd59;
					I_d = 10'd0;
				end
				else
					I_d = 10'd25;
			end
			17'b00101110000011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd27;
			end
			17'b00101110000011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd26;
			end
			17'b00101110000011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd30;
			end
			17'b00101110000011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd31;
			end
			17'b00101110000011111: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd69;
					I_d = 10'd0;
				end
				else begin
					L_d = 7'd57;
					I_d = 10'd0;
				end
			end
			17'b01110010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01110010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01110010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01110010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b01110010000000110: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else begin
					L_d = 7'd25;
					I_d = 10'd0;
				end
			end
			17'b00110010000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00110010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00110010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00110010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00110010000000110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00006407;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd2;
				I_d = 10'd0;
			end
			17'b00110010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd5;
			end
			17'b00110010000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd4;
			end
			17'b00110010000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffc0;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00110010000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00110010000001101: begin
				alu_operator_ex_o = 7'd44;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00110010000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00110010000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b00110010000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b00110010000001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd9;
			end
			17'b00110010000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				L_d = 7'd21;
				I_d = 10'd0;
			end
			17'b00101010000000000: begin
				alu_operand_b_ex_o = 32'h0000003f;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00101010000000001: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd29;
					I_d = 10'd0;
				end
				else
					I_d = 10'd3;
			end
			17'b00101010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd2;
			end
			17'b00101010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffc0;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00101010000000110: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffc0;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00101010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd5;
			end
			17'b00101010000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00101010000000100: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00101010000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00101010000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00101010000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd20;
				I_d = 10'd0;
			end
			17'b00101000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00101000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00101000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00101000000000010: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00005006;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd2;
				I_d = 10'd0;
			end
			17'b00101000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd7;
			end
			17'b00101000000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd5;
			end
			17'b00101000000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00101000000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00101000000001100: begin
				alu_operator_ex_o = 7'd44;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00101000000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00101000000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b00101000000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd10;
			end
			17'b00101000000001010: begin
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd11;
			end
			17'b00101000000001011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffc0;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00101000000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd8;
			end
			17'b00101000000001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd24;
			end
			17'b00101000000011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd25;
			end
			17'b00101000000011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd27;
			end
			17'b00101000000011011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003f;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd29;
				I_d = 10'd0;
			end
			17'b00111010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00111010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00111010000000011: begin
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd27;
					I_d = 10'd0;
				end
				else begin
					L_d = 7'd31;
					I_d = 10'd0;
				end
			end
			17'b00111110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00111110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00111110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00111110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00111110000000110: begin
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else begin
					L_d = 7'd27;
					I_d = 10'd0;
				end
			end
			17'b00110110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00110110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b00110110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd2;
			end
			17'b00110110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd6;
			end
			17'b00110110000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd7;
			end
			17'b00110110000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd5;
			end
			17'b00110110000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd4;
			end
			17'b00110110000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd12;
			end
			17'b00110110000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00110110000001101: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01110110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01110110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01110110000000011: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd68;
					I_d = 10'd0;
				end
				else
					I_d = 10'd2;
			end
			17'b01110110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd53;
				I_d = 10'd0;
			end
			17'b01101010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01101010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01101010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01101010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b01101010000000110: begin
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd7;
			end
			17'b01101010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				L_d = 7'd68;
				I_d = 10'd0;
			end
			17'b10001000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b10001000000000001: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd27;
				I_d = 10'd0;
			end
			17'b10001010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b10001010000000001: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd25;
				I_d = 10'd0;
			end
			17'b00100010000000000: begin
				alu_operand_b_ex_o = 32'h00000020;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00100010000000001: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd73;
					I_d = 10'd0;
				end
				else
					I_d = 10'd3;
			end
			17'b00100010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd2;
			end
			17'b00100010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffd0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00100010000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd7;
			end
			17'b00100010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd5;
			end
			17'b00100010000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd4;
			end
			17'b00100010000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd12;
			end
			17'b00100010000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b00100010000001101: begin
				alu_operand_b_ex_o = 32'h0000003f;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00100010000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00100010000001110: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd16;
					I_d = 10'd0;
				end
				else begin
					L_d = 7'd72;
					I_d = 10'd0;
				end
			end
			17'b10010000000000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			17'b10010010000000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			17'b00100000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00100000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00100000000000011: begin
				alu_operand_b_ex_o = 32'hffffff80;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00100000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00100000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00100000000000111: begin
				alu_operand_b_ex_o = 32'h00000038;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00100000000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00100000000000100: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd18;
					I_d = 10'd0;
				end
				else
					I_d = 10'd12;
			end
			17'b00100000000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00100000000001101: begin
				alu_operand_b_ex_o = 32'h00000037;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00100000000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00100000000001110: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b00100000000001010: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd62;
					I_d = 10'd0;
				end
				else
					I_d = 10'd11;
			end
			17'b00100000000001011: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00100000000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd14;
				I_d = 10'd0;
			end
			17'b00011100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00011100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd12;
				I_d = 10'd0;
			end
			17'b00011000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00011000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b00011000000000011: begin
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd2;
			end
			17'b00011000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				L_d = 7'd4;
				I_d = 10'd0;
			end
			17'b00001000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00001000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b00001000000000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00001000000000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000009;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00001000000000110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00001000000000111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00001000000000101: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000017;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00001000000000100: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00001000000001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000009;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00001000000001101: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00001000000001111: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd14;
			end
			17'b00001000000001110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd10;
			end
			17'b00001000000001010: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b00001000000001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd9;
			end
			17'b00001000000001001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd8;
			end
			17'b00001000000001000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd24;
			end
			17'b00001000000011000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd25;
			end
			17'b00001000000011001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd27;
			end
			17'b00001000000011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd26;
			end
			17'b00001000000011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000063;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd30;
			end
			17'b00001000000011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd31;
			end
			17'b00001000000011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000066;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b01;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd29;
			end
			17'b00001000000011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000060;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd28;
			end
			17'b00001000000011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd20;
			end
			17'b00001000000010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000062;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd21;
			end
			17'b00001000000010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000065;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd23;
			end
			17'b00001000000010111: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001016;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd2;
				I_d = 10'd0;
			end
			17'b00001000000010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd18;
			end
			17'b00001000000010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd19;
			end
			17'b00001000000010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd17;
			end
			17'b00001000000010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd16;
			end
			17'b00001000000010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd48;
			end
			17'b00001000000110000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd49;
			end
			17'b00001000000110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd51;
			end
			17'b00001000000110011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd50;
			end
			17'b00001000000110010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd54;
			end
			17'b00001000000110110: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd5;
				I_d = 10'd0;
			end
			17'b00100100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00100100000000001: begin
				alu_operand_b_ex_o = 32'h00000040;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00100100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00100100000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00100100000000110: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd6;
					I_d = 10'd0;
				end
				else begin
					L_d = 7'd22;
					I_d = 10'd0;
				end
			end
			17'b00101100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00101100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b00101100000000011: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else begin
					L_d = 7'd6;
					I_d = 10'd0;
				end
			end
			17'b00001100000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00001100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00001100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00001100000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00001100000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd7;
			end
			17'b00001100000000111: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001805;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd2;
				I_d = 10'd0;
			end
			17'b00001100000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd4;
			end
			17'b00001100000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00001100000001100: begin
				alu_operand_b_ex_o = 32'h00000037;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00001100000001101: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd14;
				I_d = 10'd0;
			end
			17'b01111100000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01111100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01111100000000011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd4;
				I_d = 10'd0;
			end
			17'b01100000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01100000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd3;
			end
			17'b01100000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd2;
			end
			17'b01100000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01100000000000110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000c007;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd17;
				I_d = 10'd0;
			end
			17'b01100000000000111: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01100000000000101: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b01100000000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b01100000000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b01100000000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd37;
				I_d = 10'd0;
			end
			17'b01001010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b01001010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01001010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b01001010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b01001010000000110: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd7;
			end
			17'b01001010000000111: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01001010000000101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b01001010000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd12;
			end
			17'b01001010000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b01001010000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd15;
			end
			17'b01001010000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b01001010000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd10;
			end
			17'b01001010000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd11;
			end
			17'b01001010000001011: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01000000000000000: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd40;
					I_d = 10'd0;
				end
				else
					I_d = 10'd1;
			end
			17'b01000000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffff50;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01000000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd2;
			end
			17'b01000000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000084;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b01000000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd7;
			end
			17'b01000000000000111: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01000000000000101: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b01000000000000100: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b01000000000001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd13;
			end
			17'b01000000000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd15;
			end
			17'b01000000000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b01000000000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd10;
			end
			17'b01000000000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd11;
			end
			17'b01000000000001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000088;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd9;
			end
			17'b01000000000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ac;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd8;
			end
			17'b01000000000001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a8;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd24;
			end
			17'b01000000000011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a4;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd25;
			end
			17'b01000000000011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd27;
			end
			17'b01000000000011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd26;
			end
			17'b01000000000011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd30;
			end
			17'b01000000000011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd31;
			end
			17'b01000000000011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000019c;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd29;
			end
			17'b01000000000011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001bc;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd28;
			end
			17'b01000000000011100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd20;
			end
			17'b01000000000010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd21;
			end
			17'b01000000000010101: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd33;
				I_d = 10'd0;
			end
			17'b01000010000000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd35;
				I_d = 10'd0;
			end
			17'b01000110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd51;
				I_d = 10'd0;
			end
			17'b01100110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd1;
			end
			17'b01100110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01100110000000011: begin
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd2;
			end
			17'b01100110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b01100110000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b01100110000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b01100110000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd19;
				I_d = 10'd0;
			end
			17'b00100110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00100110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00100110000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00100110000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00100110000000110: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd7;
			end
			17'b00100110000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000144;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00100110000000101: begin
				alu_operand_b_ex_o = 32'h00000038;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00100110000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00100110000001100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd13;
			end
			17'b00100110000001101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd15;
			end
			17'b00100110000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd14;
			end
			17'b00100110000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd10;
			end
			17'b00100110000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd11;
			end
			17'b00100110000001011: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00004c09;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd23;
				I_d = 10'd0;
			end
			17'b00100110000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000019c;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd8;
			end
			17'b00100110000001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd24;
			end
			17'b00100110000011000: begin
				alu_operand_b_ex_o = 32'h00000020;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd25;
			end
			17'b00100110000011001: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00002400;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd17;
				I_d = 10'd0;
			end
			17'b00010010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00010010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00010010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00010010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00010010000000110: begin
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd7;
			end
			17'b00010010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00010010000000101: begin
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd35;
					I_d = 10'd0;
				end
				else
					I_d = 10'd4;
			end
			17'b00010010000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00010010000001100: begin
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd33;
					I_d = 10'd0;
				end
				else
					I_d = 10'd13;
			end
			17'b00010010000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ac;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd15;
			end
			17'b00010010000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a8;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd14;
			end
			17'b00010010000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a4;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd10;
			end
			17'b00010010000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd11;
			end
			17'b00010010000001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd9;
			end
			17'b00010010000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd8;
			end
			17'b00010010000001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd24;
			end
			17'b00010010000011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd25;
			end
			17'b00010010000011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd27;
			end
			17'b00010010000011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000088;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd26;
			end
			17'b00010010000011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000084;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd30;
			end
			17'b00010010000011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd31;
			end
			17'b00010010000011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd29;
			end
			17'b00010010000011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd28;
			end
			17'b00010010000011100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01010000000000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b00111000000000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00111000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000144;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00111000000000011: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00111000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00111000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000019c;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00111000000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00111000000000101: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd30;
				I_d = 10'd0;
			end
			17'b00111100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd1;
			end
			17'b00111100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd3;
			end
			17'b00111100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00111100000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd6;
			end
			17'b00111100000000110: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd7;
			end
			17'b00111100000000111: begin
				alu_operator_ex_o = 7'd44;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd5;
			end
			17'b00111100000000101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00111100000000100: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 10'd0;
				else
					I_d = 10'd12;
			end
			17'b00111100000001100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b00010110000000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			17'b01000100000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b01000100000000001: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b01000100000000011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd32;
				I_d = 10'd0;
			end
			17'b00010000000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd1;
			end
			17'b00010000000000001: begin
				alu_operand_b_ex_o = 32'h00000232;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd3;
			end
			17'b00010000000000011: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd2;
			end
			17'b00010000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 10'd6;
			end
			17'b00010000000000110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00002007;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd32;
				I_d = 10'd0;
			end
			17'b00010000000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				expecting_load_resp_o = 1'b1;
				I_d = 10'd5;
			end
			17'b00010000000000101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd4;
			end
			17'b00010000000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 10'd12;
			end
			17'b00010000000001100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[16:10];
				I_d = rf_rdata_a[9:0];
			end
			default: begin
				L_d = 7'd45;
				I_d = 10'd0;
			end
		endcase
	end
	assign ctrl_busy_o = state_q != 17'b00010000000001100;
	assign illegal_insn_o = 1'b0;
	assign instr_first_cycle_id_o = first_cycle;
	assign instr_valid_clear_o = 1'b0;
	assign id_in_ready_o = 1'b1;
	assign instr_req_o = 1'b0;
	assign pc_set_o = 1'b0;
	assign pc_mux_o = 3'd0;
	assign nt_branch_mispredict_o = 1'b0;
	assign nt_branch_addr_o = 1'sb0;
	assign exc_pc_mux_o = 2'd0;
	assign exc_cause_o = 1'sb0;
	assign icache_inval_o = 1'b0;
	reg [67:0] imd_val_q;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			imd_val_q[34+:34] <= 1'sb0;
			imd_val_q[0+:34] <= 1'sb0;
		end
		else if (|imd_val_we_ex_i) begin
			imd_val_q[34+:34] <= imd_val_d_ex_i[34+:34];
			imd_val_q[0+:34] <= imd_val_d_ex_i[0+:34];
		end
	assign imd_val_q_ex_o = imd_val_q;
	assign bt_a_operand_o = 1'sb0;
	assign bt_b_operand_o = 1'sb0;
	assign multdiv_ready_id_o = 1'b1;
	assign csr_access_o = 1'b0;
	assign csr_op_o = 2'd0;
	assign csr_addr_o = 12'd0;
	assign csr_op_en_o = 1'b0;
	assign csr_save_if_o = 1'b0;
	assign csr_save_id_o = 1'b0;
	assign csr_save_wb_o = 1'b0;
	assign csr_restore_mret_id_o = 1'b0;
	assign csr_restore_dret_id_o = 1'b0;
	assign csr_save_cause_o = 1'b0;
	assign csr_mtval_o = 1'sb0;
	assign expecting_store_resp_o = 1'b0;
	assign nmi_mode_o = 1'b0;
	assign debug_mode_o = 1'b0;
	assign debug_mode_entering_o = 1'b0;
	assign debug_cause_o = 3'h0;
	assign debug_csr_save_o = 1'b0;
	assign instr_perf_count_id_o = 1'b0;
	assign perf_jump_o = 1'b0;
	assign perf_branch_o = 1'b0;
	assign perf_tbranch_o = 1'b0;
	assign perf_dside_wait_o = 1'b0;
	assign perf_mul_wait_o = 1'b0;
	assign perf_div_wait_o = 1'b0;
	assign instr_id_done_o = 1'b1;
	initial _sv2v_0 = 0;
endmodule
