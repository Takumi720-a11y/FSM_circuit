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
	(* fsm_encoding = "none" *) reg [5:0] I_q;
	reg [5:0] I_d;
	wire [12:0] state_q;
	wire [12:0] state_d;
	function automatic [12:0] sv2v_cast_13;
		input reg [12:0] inp;
		sv2v_cast_13 = inp;
	endfunction
	assign state_q = sv2v_cast_13({L_q, I_q});
	assign state_d = sv2v_cast_13({L_d, I_d});
	wire [31:0] rf_rdata_a;
	wire [31:0] rf_rdata_b;
	assign rf_rdata_a = rf_rdata_a_i;
	assign rf_rdata_b = rf_rdata_b_i;
	(* dont_touch = "yes" *) reg [12:0] state_q_prev;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			state_q_prev <= 13'b1001001000000;
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
			L_q <= 7'd73;
			I_q <= 6'd0;
		end
		else if ((((ready_wb_i && ex_valid_i) && !((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 13'b1001101000001) || (state_q == 13'b1000110000001)) || (state_q == 13'b1000110001100)) || (state_q == 13'b1000110001111)) || (state_q == 13'b1000110000111)) || (state_q == 13'b1010000000001)) || (state_q == 13'b1010000001111)) || (state_q == 13'b1011010000001)) || (state_q == 13'b0101101000101)) || (state_q == 13'b0101101001101)) || (state_q == 13'b0101101001100)) || (state_q == 13'b1010010000001)) || (state_q == 13'b1010010000010)) || (state_q == 13'b1011000000010)) || (state_q == 13'b1011000000111)) || (state_q == 13'b1011000001110)) || (state_q == 13'b1011000001010)) || (state_q == 13'b1001100000000)) || (state_q == 13'b1001000000111)) || (state_q == 13'b1001000000101)) || (state_q == 13'b1010001000001)) || (state_q == 13'b1010001000010)) || (state_q == 13'b0001010000001)) || (state_q == 13'b1010111000000)) || (state_q == 13'b1010111000001)) || (state_q == 13'b1011001000011)) || (state_q == 13'b1011001000111)) || (state_q == 13'b1011001000101)) || (state_q == 13'b1010100000000)) || (state_q == 13'b1010100000010)) || (state_q == 13'b1010101000000)) || (state_q == 13'b1010101000001)) || (state_q == 13'b1010101000011)) || (state_q == 13'b1010011000000)) || (state_q == 13'b1010011000001)) || (state_q == 13'b1010011000011)) || (state_q == 13'b0111000000101)) || (state_q == 13'b0011110000000)) || (state_q == 13'b0111110000000)) || (state_q == 13'b0111010000011)) || (state_q == 13'b0111010000100)) || (state_q == 13'b0111010001010)) || (state_q == 13'b0111010001000)) || (state_q == 13'b0111010011001)) || (state_q == 13'b0011000000000)) || (state_q == 13'b0110100000001)) || (state_q == 13'b0101100000011)) || (state_q == 13'b0101100000111)) || (state_q == 13'b0101100000101)) || (state_q == 13'b0101100000100)) || (state_q == 13'b0101100001100)) || (state_q == 13'b0101100001101)) || (state_q == 13'b0101100001111)) || (state_q == 13'b0101100001110)) || (state_q == 13'b0101100001010)) || (state_q == 13'b0101100001011)) || (state_q == 13'b0101100001001)) || (state_q == 13'b0101100001000)) || (state_q == 13'b0101100011000)) || (state_q == 13'b0101100011110)) || (state_q == 13'b0101100011111)) || (state_q == 13'b0101100011100)) || (state_q == 13'b0100101000001)) || (state_q == 13'b0110001000000)) || (state_q == 13'b0111001000000)) || (state_q == 13'b0110010000010)) || (state_q == 13'b0110011000000)) || (state_q == 13'b0111011000000)) || (state_q == 13'b0111011000111)) || (state_q == 13'b0111011001101)) || (state_q == 13'b1011011000000)) || (state_q == 13'b1011011000110)) || (state_q == 13'b1011011000101)) || (state_q == 13'b0011101000000)) || (state_q == 13'b0011101000110)) || (state_q == 13'b0111100000000)) || (state_q == 13'b0111100000111)) || (state_q == 13'b0111100000101)) || (state_q == 13'b0111100000100)) || (state_q == 13'b0111100001101)) || (state_q == 13'b0111100001001)) || (state_q == 13'b0111100001000)) || (state_q == 13'b0111100011000)) || (state_q == 13'b0111100011010)) || (state_q == 13'b0111100011110)) || (state_q == 13'b0111100010111)) || (state_q == 13'b0111100010110)) || (state_q == 13'b0001110000011)) || (state_q == 13'b0000100000000)) || (state_q == 13'b0000100000001)) || (state_q == 13'b0001100000000)) || (state_q == 13'b0001100000010)) || (state_q == 13'b0001001000011)) || (state_q == 13'b0001101000011)) || (state_q == 13'b0001101000010)) || (state_q == 13'b0000110000010)) || (state_q == 13'b0000110000111)) || (state_q == 13'b0000111000000)) || (state_q == 13'b0000111000011)) || (state_q == 13'b0000000000011)) || (state_q == 13'b0000001000000)) || (state_q == 13'b0000011000011)) || (state_q == 13'b0000011000110)) || (state_q == 13'b0000011000111)) || (state_q == 13'b0000011001100)) || (state_q == 13'b1001011000010)) || (state_q == 13'b1001011000110)) || (state_q == 13'b1001011000111)) || (state_q == 13'b1001011000101)) || (state_q == 13'b1001011000100)) || (state_q == 13'b1001011001100)) || (state_q == 13'b1001011001101)) || (state_q == 13'b1001011001111)) || (state_q == 13'b1001011001110)) || (state_q == 13'b1001011001010)) || (state_q == 13'b1001011001011)) || (state_q == 13'b1001011001001)) || (state_q == 13'b1001011001000)) || (state_q == 13'b0000101000111)) || (state_q == 13'b0010101000111)) || (state_q == 13'b0010001000000)) || (state_q == 13'b0010000000000)) || (state_q == 13'b0010000000001)) || (state_q == 13'b0010000000011)) || (state_q == 13'b0110110000000)) || (state_q == 13'b0011011000000)) || (state_q == 13'b0011011000001)) || (state_q == 13'b0001011000000)) || (state_q == 13'b0001011000110)) || (state_q == 13'b0001011000111)) || (state_q == 13'b0001011001101)) || (state_q == 13'b0011111000110)) || (state_q == 13'b0011111000111)) || (state_q == 13'b0011111001101)) || (state_q == 13'b0010111000000)) || (state_q == 13'b0110111000000)) || (state_q == 13'b0110111000010)) || (state_q == 13'b0100111000000)) || (state_q == 13'b0100010000011)) || (state_q == 13'b0100100000000)) || (state_q == 13'b0100011000000)) || (state_q == 13'b0101011000011)) || (state_q == 13'b0101011000110)) || (state_q == 13'b0101011000111)) || (state_q == 13'b0101011000101)) || (state_q == 13'b0101011000100)) || (state_q == 13'b0101011001100)) || (state_q == 13'b0101011001101)) || (state_q == 13'b0101011001111)) || (state_q == 13'b0101011001110)) || (state_q == 13'b0101011001010)) || (state_q == 13'b0101011001011)) || (state_q == 13'b0101011001001)) || (state_q == 13'b0101011001000)) || (state_q == 13'b0101011011000)) || (state_q == 13'b0101000000001)) || (state_q == 13'b0101000000011)) || (state_q == 13'b0101000000111)) || (state_q == 13'b0101000001101)) || (state_q == 13'b1011100000000)) || (state_q == 13'b1011111000011)) || (state_q == 13'b1011111000010)) || (state_q == 13'b1011111000110)) || (state_q == 13'b1011111001100)) || (state_q == 13'b1011111001101)) || (state_q == 13'b1011111001111)) || (state_q == 13'b1011111001110)) || (state_q == 13'b1011111001010)) || (state_q == 13'b1011111001011)) || (state_q == 13'b1011111001001)) || (state_q == 13'b0101110000000)) || (state_q == 13'b0101110000010)) || (state_q == 13'b0101110001010)) || (state_q == 13'b0101110001011)) || (state_q == 13'b0101110001001)) || (state_q == 13'b0101110001000)) || (state_q == 13'b0101110011000)) || (state_q == 13'b0101110011001)) || (state_q == 13'b0101110011011)) || (state_q == 13'b0101110011010)) || (state_q == 13'b0101110011110)) || (state_q == 13'b0101110011100)) || (state_q == 13'b1000011000000)) || (state_q == 13'b1000011000001)) || (state_q == 13'b1001110000010)) || (state_q == 13'b1001110000111))) || (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 13'b1001101000001) || (state_q == 13'b1000110000001)) || (state_q == 13'b1000110001100)) || (state_q == 13'b1010000001111)) || (state_q == 13'b1011010000001)) || (state_q == 13'b0101101000101)) || (state_q == 13'b0101101001101)) || (state_q == 13'b0101101001100)) || (state_q == 13'b1011000001010)) || (state_q == 13'b1001100000000)) || (state_q == 13'b1001000000101)) || (state_q == 13'b1010001000001)) || (state_q == 13'b1010001000010)) || (state_q == 13'b0001010000001)) || (state_q == 13'b1011001000011)) || (state_q == 13'b1011001000111)) || (state_q == 13'b1011001000101)) || (state_q == 13'b1010100000010)) || (state_q == 13'b0111110000000)) || (state_q == 13'b0011000000000)) || (state_q == 13'b0110100000001)) || (state_q == 13'b0101100000011)) || (state_q == 13'b0101100000111)) || (state_q == 13'b0101100000101)) || (state_q == 13'b0101100000100)) || (state_q == 13'b0101100001100)) || (state_q == 13'b0101100001101)) || (state_q == 13'b0101100001111)) || (state_q == 13'b0101100001110)) || (state_q == 13'b0101100001010)) || (state_q == 13'b0101100001011)) || (state_q == 13'b0101100001001)) || (state_q == 13'b0101100001000)) || (state_q == 13'b0101100011000)) || (state_q == 13'b0101100011110)) || (state_q == 13'b0101100011111)) || (state_q == 13'b0101100011100)) || (state_q == 13'b0100101000001)) || (state_q == 13'b0110001000000)) || (state_q == 13'b0111001000000)) || (state_q == 13'b0110010000010)) || (state_q == 13'b0110011000000)) || (state_q == 13'b0111011000000)) || (state_q == 13'b1011011000101)) || (state_q == 13'b0011101000110)) || (state_q == 13'b0111100000101)) || (state_q == 13'b0111100000100)) || (state_q == 13'b0111100011010)) || (state_q == 13'b0111100011110)) || (state_q == 13'b0111100010111)) || (state_q == 13'b0111100010110)) || (state_q == 13'b0001110000011)) || (state_q == 13'b0000100000000)) || (state_q == 13'b0000100000001)) || (state_q == 13'b0001101000011)) || (state_q == 13'b0001101000010)) || (state_q == 13'b0000011000110)) || (state_q == 13'b0010101000111)) || (state_q == 13'b0010001000000)) || (state_q == 13'b0010000000011)) || (state_q == 13'b0110110000000)) || (state_q == 13'b0001011000111)) || (state_q == 13'b0001011001101)) || (state_q == 13'b0011111000110)) || (state_q == 13'b0011111000111)) || (state_q == 13'b0101000000111)) || (state_q == 13'b0101000001101)) || (state_q == 13'b1011111000011)) || (state_q == 13'b1011111000010)) || (state_q == 13'b1011111000110)) || (state_q == 13'b1011111001100)) || (state_q == 13'b1011111001101)) || (state_q == 13'b1011111001111)) || (state_q == 13'b1011111001110)) || (state_q == 13'b1011111001010)) || (state_q == 13'b1011111001011)) || (state_q == 13'b1011111001001)) || (state_q == 13'b0101110000010)) || (state_q == 13'b1001110000010)) && lsu_resp_valid_i) && !first_cycle)) || (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 13'b1000110001111) || (state_q == 13'b1000110000111)) || (state_q == 13'b1010000000001)) || (state_q == 13'b1010010000001)) || (state_q == 13'b1010010000010)) || (state_q == 13'b1011000000010)) || (state_q == 13'b1011000000111)) || (state_q == 13'b1011000001110)) || (state_q == 13'b1001000000111)) || (state_q == 13'b1010111000000)) || (state_q == 13'b1010111000001)) || (state_q == 13'b1010100000000)) || (state_q == 13'b1010101000000)) || (state_q == 13'b1010101000001)) || (state_q == 13'b1010101000011)) || (state_q == 13'b1010011000000)) || (state_q == 13'b1010011000001)) || (state_q == 13'b1010011000011)) || (state_q == 13'b0111000000101)) || (state_q == 13'b0011110000000)) || (state_q == 13'b0111010000011)) || (state_q == 13'b0111010000100)) || (state_q == 13'b0111010001010)) || (state_q == 13'b0111010001000)) || (state_q == 13'b0111010011001)) || (state_q == 13'b0111011000111)) || (state_q == 13'b0111011001101)) || (state_q == 13'b1011011000000)) || (state_q == 13'b1011011000110)) || (state_q == 13'b0011101000000)) || (state_q == 13'b0111100000000)) || (state_q == 13'b0111100000111)) || (state_q == 13'b0111100001101)) || (state_q == 13'b0111100001001)) || (state_q == 13'b0111100001000)) || (state_q == 13'b0111100011000)) || (state_q == 13'b0001100000000)) || (state_q == 13'b0001100000010)) || (state_q == 13'b0001001000011)) || (state_q == 13'b0000110000010)) || (state_q == 13'b0000110000111)) || (state_q == 13'b0000111000000)) || (state_q == 13'b0000111000011)) || (state_q == 13'b0000000000011)) || (state_q == 13'b0000001000000)) || (state_q == 13'b0000011000011)) || (state_q == 13'b0000011000111)) || (state_q == 13'b0000011001100)) || (state_q == 13'b1001011000010)) || (state_q == 13'b1001011000110)) || (state_q == 13'b1001011000111)) || (state_q == 13'b1001011000101)) || (state_q == 13'b1001011000100)) || (state_q == 13'b1001011001100)) || (state_q == 13'b1001011001101)) || (state_q == 13'b1001011001111)) || (state_q == 13'b1001011001110)) || (state_q == 13'b1001011001010)) || (state_q == 13'b1001011001011)) || (state_q == 13'b1001011001001)) || (state_q == 13'b1001011001000)) || (state_q == 13'b0000101000111)) || (state_q == 13'b0010000000000)) || (state_q == 13'b0010000000001)) || (state_q == 13'b0011011000000)) || (state_q == 13'b0011011000001)) || (state_q == 13'b0001011000000)) || (state_q == 13'b0001011000110)) || (state_q == 13'b0011111001101)) || (state_q == 13'b0010111000000)) || (state_q == 13'b0110111000000)) || (state_q == 13'b0110111000010)) || (state_q == 13'b0100111000000)) || (state_q == 13'b0100010000011)) || (state_q == 13'b0100100000000)) || (state_q == 13'b0100011000000)) || (state_q == 13'b0101011000011)) || (state_q == 13'b0101011000110)) || (state_q == 13'b0101011000111)) || (state_q == 13'b0101011000101)) || (state_q == 13'b0101011000100)) || (state_q == 13'b0101011001100)) || (state_q == 13'b0101011001101)) || (state_q == 13'b0101011001111)) || (state_q == 13'b0101011001110)) || (state_q == 13'b0101011001010)) || (state_q == 13'b0101011001011)) || (state_q == 13'b0101011001001)) || (state_q == 13'b0101011001000)) || (state_q == 13'b0101011011000)) || (state_q == 13'b0101000000001)) || (state_q == 13'b0101000000011)) || (state_q == 13'b1011100000000)) || (state_q == 13'b0101110000000)) || (state_q == 13'b0101110001010)) || (state_q == 13'b0101110001011)) || (state_q == 13'b0101110001001)) || (state_q == 13'b0101110001000)) || (state_q == 13'b0101110011000)) || (state_q == 13'b0101110011001)) || (state_q == 13'b0101110011011)) || (state_q == 13'b0101110011010)) || (state_q == 13'b0101110011110)) || (state_q == 13'b0101110011100)) || (state_q == 13'b1000011000000)) || (state_q == 13'b1000011000001)) || (state_q == 13'b1001110000111)) && lsu_resp_valid_i) && !first_cycle)) begin
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
			13'b1001001000000: begin
				alu_operand_b_ex_o = 32'h00020000;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1001001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1001001000011: begin
				alu_operand_a_ex_o = 32'h00000088;
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b1001001000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000178;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b1001001000110: begin
				alu_operand_a_ex_o = 32'h00000090;
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1001001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000380;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd77;
				I_d = 6'd0;
			end
			13'b1001101000000: begin
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
					L_d = 7'd69;
					I_d = 6'd0;
				end
				else
					I_d = 6'd1;
			end
			13'b1001101000001: begin
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
				I_d = 6'd3;
			end
			13'b1001101000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1001101000010: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				I_d = 6'd0;
			end
			13'b1000101000000: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001280;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd70;
				I_d = 6'd0;
			end
			13'b1001010000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			13'b1000110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffe0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1000110000001: begin
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
				I_d = 6'd3;
			end
			13'b1000110000011: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001182;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd86;
				I_d = 6'd0;
			end
			13'b1000110000010: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001186;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd64;
				I_d = 6'd0;
			end
			13'b1000110000110: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd10;
			end
			13'b1000110001010: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001184;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd71;
				I_d = 6'd0;
			end
			13'b1000110000100: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001185;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd66;
				I_d = 6'd0;
			end
			13'b1000110000101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000118c;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd78;
				I_d = 6'd0;
			end
			13'b1000110001100: begin
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
				I_d = 6'd13;
			end
			13'b1000110001101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000118f;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd68;
				I_d = 6'd0;
			end
			13'b1000110001111: begin
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
				I_d = 6'd14;
			end
			13'b1000110001110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001187;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd65;
				I_d = 6'd0;
			end
			13'b1000110000111: begin
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
				I_d = 6'd11;
			end
			13'b1000110001011: begin
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
				I_d = 6'd9;
			end
			13'b1000110001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd8;
			end
			13'b1000110001000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1010000000000: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000040c;
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
				I_d = 6'd3;
			end
			13'b1010000000011: begin
				alu_operand_b_ex_o = 32'h41c65000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1010000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe6d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b1010000000110: begin
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
				I_d = 6'd7;
			end
			13'b1010000000111: begin
				alu_operand_b_ex_o = 32'h00003000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b1010000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000039;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b1010000000100: begin
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
				I_d = 6'd12;
			end
			13'b1010000001100: begin
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
				I_d = 6'd13;
			end
			13'b1010000001101: begin
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
				I_d = 6'd15;
			end
			13'b1010000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000040c;
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
				I_d = 6'd14;
			end
			13'b1010000001110: begin
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
				I_d = 6'd10;
			end
			13'b1010000001010: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1011010000000: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1011010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000040c;
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
				I_d = 6'd3;
			end
			13'b1011010000011: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b0101101000000: begin
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
				I_d = 6'd1;
			end
			13'b0101101000001: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd98;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b0101101000011: begin
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
				I_d = 6'd2;
			end
			13'b0101101000010: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0101101000110: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0101101000111: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0101101000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000404;
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
				I_d = 6'd13;
			end
			13'b0101101001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000408;
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
				I_d = 6'd12;
			end
			13'b0101101001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
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
				I_d = 6'd4;
			end
			13'b0101101000100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1100010000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			13'b1010010000000: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1010010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
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
				I_d = 6'd3;
			end
			13'b1010010000011: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1010010000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000404;
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
				I_d = 6'd6;
			end
			13'b1010010000110: begin
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
				I_d = 6'd7;
			end
			13'b1010010000111: begin
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
				I_d = 6'd5;
			end
			13'b1010010000101: begin
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
				I_d = 6'd4;
			end
			13'b1010010000100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1011000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1011000000001: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd94;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b1011000000011: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1011000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000408;
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
				I_d = 6'd6;
			end
			13'b1011000000110: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b1011000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
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
				I_d = 6'd5;
			end
			13'b1011000000101: begin
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
				I_d = 6'd13;
			end
			13'b1011000001101: begin
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
				I_d = 6'd12;
			end
			13'b1011000001100: begin
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
				I_d = 6'd4;
			end
			13'b1011000000100: begin
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd72;
					I_d = 6'd0;
				end
				else
					I_d = 6'd15;
			end
			13'b1011000001111: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b1011000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000404;
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
				I_d = 6'd10;
			end
			13'b1011000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
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
				I_d = 6'd11;
			end
			13'b1011000001011: begin
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
					L_d = 7'd94;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd76;
					I_d = 6'd0;
				end
			end
			13'b1001100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000408;
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
				I_d = 6'd1;
			end
			13'b1001100000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1001000000000: begin
				alu_operand_b_ex_o = 32'h00000004;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1001000000001: begin
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
				I_d = 6'd3;
			end
			13'b1001000000011: begin
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
				I_d = 6'd2;
			end
			13'b1001000000010: begin
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
				I_d = 6'd6;
			end
			13'b1001000000110: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b1001000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000404;
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
				I_d = 6'd5;
			end
			13'b1001000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
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
				I_d = 6'd4;
			end
			13'b1001000000100: begin
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
					L_d = 7'd76;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd94;
					I_d = 6'd0;
				end
			end
			13'b1011110000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1011110000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1010001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1010001000001: begin
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
				I_d = 6'd3;
			end
			13'b1010001000011: begin
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
				I_d = 6'd2;
			end
			13'b1010001000010: begin
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
				I_d = 6'd6;
			end
			13'b1010001000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b1010001000111: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001445;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd88;
				I_d = 6'd0;
			end
			13'b1010001000101: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd87;
					I_d = 6'd0;
				end
				else
					I_d = 6'd4;
			end
			13'b1010001000100: begin
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd87;
					I_d = 6'd0;
				end
				else
					I_d = 6'd12;
			end
			13'b1010001001100: begin
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
				I_d = 6'd13;
			end
			13'b1010001001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd10;
				I_d = 6'd0;
			end
			13'b0001010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0001010000001: begin
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
				I_d = 6'd3;
			end
			13'b0001010000011: begin
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
					I_d = 6'd0;
				else begin
					L_d = 7'd87;
					I_d = 6'd0;
				end
			end
			13'b1010111000000: begin
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
				I_d = 6'd1;
			end
			13'b1010111000001: begin
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
				I_d = 6'd3;
			end
			13'b1010111000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1010111000010: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1011001000000: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd96;
					I_d = 6'd0;
				end
				else
					I_d = 6'd1;
			end
			13'b1011001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1011001000011: begin
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
				I_d = 6'd2;
			end
			13'b1011001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b1011001000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b1011001000111: begin
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
				I_d = 6'd5;
			end
			13'b1011001000101: begin
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
				I_d = 6'd4;
			end
			13'b1011001000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b1011001001100: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000164d;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd88;
				I_d = 6'd0;
			end
			13'b1011001001101: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd83;
					I_d = 6'd0;
				end
				else
					I_d = 6'd15;
			end
			13'b1011001001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b1011001001110: begin
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
				I_d = 6'd10;
			end
			13'b1011001001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd11;
			end
			13'b1011001001011: begin
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd85;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd84;
					I_d = 6'd0;
				end
			end
			13'b1010100000000: begin
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
				I_d = 6'd1;
			end
			13'b1010100000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1010100000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1010100000010: begin
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
				I_d = 6'd6;
			end
			13'b1010100000110: begin
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
					I_d = 6'd0;
				else begin
					L_d = 7'd85;
					I_d = 6'd0;
				end
			end
			13'b1010101000000: begin
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
				I_d = 6'd1;
			end
			13'b1010101000001: begin
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
				I_d = 6'd3;
			end
			13'b1010101000011: begin
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
				I_d = 6'd2;
			end
			13'b1010101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b1010101000110: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1010011000000: begin
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
				I_d = 6'd1;
			end
			13'b1010011000001: begin
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
				I_d = 6'd3;
			end
			13'b1010011000011: begin
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
				I_d = 6'd2;
			end
			13'b1010011000010: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b1010011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b1010011000111: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1100000000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1100000000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b0101010000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1010110000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1000010000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				I_d = 6'd1;
			end
			13'b1000010000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1000100000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				I_d = 6'd1;
			end
			13'b1000100000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b0111000000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001f;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0111000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0111000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0111000000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0111000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0111000000111: begin
				alu_operator_ex_o = 7'd8;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0111000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
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
				I_d = 6'd4;
			end
			13'b0111000000100: begin
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd25;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd24;
					I_d = 6'd0;
				end
				else
					I_d = 6'd12;
			end
			13'b0111000001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0111000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd15;
			end
			13'b0111000001111: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd58;
				I_d = 6'd0;
			end
			13'b0011010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0011010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0011010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd30;
				I_d = 6'd0;
			end
			13'b0011110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd31;
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
				I_d = 6'd1;
			end
			13'b0011110000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0011110000011: begin
				alu_operator_ex_o = 7'd1;
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
				I_d = 6'd2;
			end
			13'b0011110000010: begin
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd24;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd62;
					I_d = 6'd0;
				end
			end
			13'b0111110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
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
				I_d = 6'd1;
			end
			13'b0111110000001: begin
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd25;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd52;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b0111110000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd58;
				I_d = 6'd0;
			end
			13'b0111010000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0111010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0111010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
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
				I_d = 6'd2;
			end
			13'b0111010000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0111010000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0111010000111: begin
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
				I_d = 6'd5;
			end
			13'b0111010000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0111010000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd16;
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
				I_d = 6'd12;
			end
			13'b0111010001100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0111010001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd15;
			end
			13'b0111010001111: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd30;
					I_d = 6'd0;
				end
				else
					I_d = 6'd14;
			end
			13'b0111010001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd10;
			end
			13'b0111010001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd6;
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
				I_d = 6'd11;
			end
			13'b0111010001011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd9;
			end
			13'b0111010001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd8;
			end
			13'b0111010001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd29;
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
				I_d = 6'd24;
			end
			13'b0111010011000: begin
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd26;
					I_d = 6'd0;
				end
				else
					I_d = 6'd25;
			end
			13'b0111010011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd31;
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
				I_d = 6'd27;
			end
			13'b0111010011011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd31;
			end
			13'b0111010011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd30;
			end
			13'b0111010011110: begin
				alu_operator_ex_o = 7'd1;
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
				I_d = 6'd26;
			end
			13'b0111010011010: begin
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd62;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd24;
					I_d = 6'd0;
				end
			end
			13'b0011000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 6'd1;
			end
			13'b0011000000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b0110100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0110100000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 6'd3;
			end
			13'b0110100000011: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b0101100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffff810;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0101100000001: begin
				alu_operand_b_ex_o = 32'hfffff000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0101100000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e8;
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
				I_d = 6'd2;
			end
			13'b0101100000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffff9a0;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0101100000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0101100000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d4;
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
				I_d = 6'd5;
			end
			13'b0101100000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007ec;
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
				I_d = 6'd4;
			end
			13'b0101100000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e4;
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
				I_d = 6'd12;
			end
			13'b0101100001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e0;
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
				I_d = 6'd13;
			end
			13'b0101100001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007dc;
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
				I_d = 6'd15;
			end
			13'b0101100001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d8;
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
				I_d = 6'd14;
			end
			13'b0101100001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d0;
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
				I_d = 6'd10;
			end
			13'b0101100001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007cc;
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
				I_d = 6'd11;
			end
			13'b0101100001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c8;
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
				I_d = 6'd9;
			end
			13'b0101100001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c4;
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
				I_d = 6'd8;
			end
			13'b0101100001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c0;
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
				I_d = 6'd24;
			end
			13'b0101100011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007bc;
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
				I_d = 6'd25;
			end
			13'b0101100011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd27;
			end
			13'b0101100011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd26;
			end
			13'b0101100011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd30;
			end
			13'b0101100011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				I_d = 6'd31;
			end
			13'b0101100011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				I_d = 6'd29;
			end
			13'b0101100011101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000b1c;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd88;
				I_d = 6'd0;
			end
			13'b0101100011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				I_d = 6'd20;
			end
			13'b0101100010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd21;
			end
			13'b0101100010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd23;
			end
			13'b0101100010111: begin
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd53;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd37;
					I_d = 6'd0;
				end
			end
			13'b0100101000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0100101000001: begin
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
				I_d = 6'd3;
			end
			13'b0100101000011: begin
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
					I_d = 6'd0;
				else begin
					L_d = 7'd53;
					I_d = 6'd0;
				end
			end
			13'b0110101000000: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0110101000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0110101000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0110101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000610;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0110101000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0110101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd49;
				I_d = 6'd0;
			end
			13'b0110001000000: begin
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
				I_d = 6'd1;
			end
			13'b0110001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0110001000011: begin
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else
					I_d = 6'd2;
			end
			13'b0110001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000210;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0110001000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000610;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd57;
				I_d = 6'd0;
			end
			13'b0111001000000: begin
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
				I_d = 6'd1;
			end
			13'b0111001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0111001000011: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else
					I_d = 6'd2;
			end
			13'b0111001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0111001000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd50;
				I_d = 6'd0;
			end
			13'b0110010000000: begin
				alu_operand_b_ex_o = 32'h00002000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0110010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe00;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0110010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0110010000010: begin
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
				I_d = 6'd6;
			end
			13'b0110010000110: begin
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
				I_d = 6'd7;
			end
			13'b0110010000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0110010000101: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else
					I_d = 6'd13;
			end
			13'b0110010001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000610;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0110010001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0110010000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd51;
				I_d = 6'd0;
			end
			13'b0110011000000: begin
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
				I_d = 6'd1;
			end
			13'b0110011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0110011000011: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else
					I_d = 6'd7;
			end
			13'b0110011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0110011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000100;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0110011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd59;
				I_d = 6'd0;
			end
			13'b0111011000000: begin
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
				I_d = 6'd1;
			end
			13'b0111011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0111011000011: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else
					I_d = 6'd2;
			end
			13'b0111011000010: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0111011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0111011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				I_d = 6'd5;
			end
			13'b0111011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0111011001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				I_d = 6'd12;
			end
			13'b0111011001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0111011000100: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd25;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd91;
					I_d = 6'd0;
				end
			end
			13'b1011011000000: begin
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
				I_d = 6'd1;
			end
			13'b1011011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1011011000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1011011000010: begin
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
				I_d = 6'd6;
			end
			13'b1011011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
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
				I_d = 6'd7;
			end
			13'b1011011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b1011011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				I_d = 6'd4;
			end
			13'b1011011000100: begin
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
					I_d = 6'd0;
				else begin
					L_d = 7'd25;
					I_d = 6'd0;
				end
			end
			13'b0011001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0011001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0011001000011: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0011001000010: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0011001000110: begin
				alu_operand_b_ex_o = 32'h00000100;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd29;
				I_d = 6'd0;
			end
			13'b0011101000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd13;
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
				I_d = 6'd1;
			end
			13'b0011101000001: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0011101000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0011101000010: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd61;
					I_d = 6'd0;
				end
				else
					I_d = 6'd6;
			end
			13'b0011101000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
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
				I_d = 6'd7;
			end
			13'b0011101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd61;
				I_d = 6'd0;
			end
			13'b0111101000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0111101000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0111101000011: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd29;
					I_d = 6'd0;
				end
				else
					I_d = 6'd2;
			end
			13'b0111101000010: begin
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd14;
					I_d = 6'd0;
				end
				else
					I_d = 6'd6;
			end
			13'b0111101000110: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0111101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0111101000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000210;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0111101000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0111101001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd48;
				I_d = 6'd0;
			end
			13'b0110000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0110000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0110000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0110000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0110000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0110000000010: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000c03;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd56;
				I_d = 6'd0;
			end
			13'b0110000000011: begin
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					I_d = 6'd0;
				else
					I_d = 6'd4;
			end
			13'b0110000000100: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0110000001100: begin
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd28;
					I_d = 6'd0;
				end
				else
					I_d = 6'd13;
			end
			13'b0110000001101: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd15;
			end
			13'b0110000001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000003fc;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b0110000001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd10;
			end
			13'b0110000001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ff;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd11;
			end
			13'b0110000001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd9;
			end
			13'b0110000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd8;
			end
			13'b0110000001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd60;
				I_d = 6'd0;
			end
			13'b0111100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd27;
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
				I_d = 6'd1;
			end
			13'b0111100000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffff00;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0111100000011: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0111100000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0111100000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0111100000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd21;
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
				I_d = 6'd5;
			end
			13'b0111100000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				I_d = 6'd4;
			end
			13'b0111100000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd21;
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
				I_d = 6'd12;
			end
			13'b0111100001100: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000f0d;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd56;
				I_d = 6'd0;
			end
			13'b0111100001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd21;
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
				I_d = 6'd15;
			end
			13'b0111100001111: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b0111100001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd10;
			end
			13'b0111100001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd11;
			end
			13'b0111100001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd9;
			end
			13'b0111100001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
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
				I_d = 6'd8;
			end
			13'b0111100001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				I_d = 6'd24;
			end
			13'b0111100011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				I_d = 6'd25;
			end
			13'b0111100011001: begin
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
				I_d = 6'd27;
			end
			13'b0111100011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd26;
			end
			13'b0111100011010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd13;
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
				I_d = 6'd30;
			end
			13'b0111100011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd24;
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
				I_d = 6'd31;
			end
			13'b0111100011111: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd20;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd29;
			end
			13'b0111100011101: begin
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
				I_d = 6'd28;
			end
			13'b0111100011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd20;
			end
			13'b0111100010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd21;
			end
			13'b0111100010101: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd23;
			end
			13'b0111100010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd21;
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
				I_d = 6'd22;
			end
			13'b0111100010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
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
				I_d = 6'd18;
			end
			13'b0111100010010: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000f13;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd56;
				I_d = 6'd0;
			end
			13'b0111100010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd17;
			end
			13'b0111100010001: begin
				alu_operand_b_ex_o = 32'h00000100;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd49;
			end
			13'b0111100110001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd48;
			end
			13'b0111100110000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd16;
			end
			13'b0111100010000: begin
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else begin
					L_d = 7'd28;
					I_d = 6'd0;
				end
			end
			13'b0011100000000: begin
				alu_operand_b_ex_o = 32'h00000101;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd14;
				I_d = 6'd0;
			end
			13'b0001110000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0001110000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0001110000011: begin
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
				I_d = 6'd2;
			end
			13'b0001110000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0001110000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0001110000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0001110000101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0001110000100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0001110001100: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd12;
				I_d = 6'd0;
			end
			13'b0000100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
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
				I_d = 6'd1;
			end
			13'b0000100000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
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
				I_d = 6'd3;
			end
			13'b0000100000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0000100000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0000100000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0000100000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0000100000101: begin
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd6;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd12;
					I_d = 6'd0;
				end
			end
			13'b0001100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
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
				I_d = 6'd1;
			end
			13'b0001100000001: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0001100000011: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd4;
					I_d = 6'd0;
				end
				else
					I_d = 6'd2;
			end
			13'b0001100000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd23;
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
				I_d = 6'd6;
			end
			13'b0001100000110: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0001100000111: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd4;
					I_d = 6'd0;
				end
				else
					I_d = 6'd5;
			end
			13'b0001100000101: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0001100000100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd8;
				I_d = 6'd0;
			end
			13'b0001000000000: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd9;
					I_d = 6'd0;
				end
				else
					I_d = 6'd1;
			end
			13'b0001000000001: begin
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
				I_d = 6'd3;
			end
			13'b0001000000011: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd15;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd9;
				I_d = 6'd0;
			end
			13'b0001001000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0001001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0001001000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				I_d = 6'd2;
			end
			13'b0001001000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0001001000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0001001000100: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd8;
					I_d = 6'd0;
				end
				else
					I_d = 6'd5;
			end
			13'b0001001000101: begin
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd13;
					I_d = 6'd0;
				end
				else
					I_d = 6'd7;
			end
			13'b0001001000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd13;
				I_d = 6'd0;
			end
			13'b0001101000000: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ff;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0001101000001: begin
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd4;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b0001101000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
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
				I_d = 6'd2;
			end
			13'b0001101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
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
				I_d = 6'd6;
			end
			13'b0001101000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0001101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0001101000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0001101001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0001101001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0001101000100: begin
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd12;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd6;
					I_d = 6'd0;
				end
			end
			13'b0000110000000: begin
				alu_operand_b_ex_o = 32'h00000020;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0000110000001: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd75;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b0000110000011: begin
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd75;
					I_d = 6'd0;
				end
				else
					I_d = 6'd2;
			end
			13'b0000110000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				I_d = 6'd6;
			end
			13'b0000110000110: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd92;
					I_d = 6'd0;
				end
				else
					I_d = 6'd7;
			end
			13'b0000110000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				I_d = 6'd5;
			end
			13'b0000110000101: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0000110000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0000110001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0000110001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd15;
			end
			13'b0000110001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b0000110001110: begin
				alu_operand_b_ex_o = 32'hffffffff;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd10;
			end
			13'b0000110001010: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd11;
			end
			13'b0000110001011: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd9;
			end
			13'b0000110001001: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd8;
			end
			13'b0000110001000: begin
				alu_operand_b_ex_o = 32'h00000007;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd7;
				I_d = 6'd0;
			end
			13'b0000111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd30;
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
				I_d = 6'd1;
			end
			13'b0000111000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0000111000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000200;
				rf_raddr_a_o = 5'd15;
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
				I_d = 6'd2;
			end
			13'b0000111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0000111000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0000111000111: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd5;
					I_d = 6'd0;
				end
				else
					I_d = 6'd5;
			end
			13'b0000111000101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0000111000100: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd3;
				I_d = 6'd0;
			end
			13'b0000010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0000010000001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ff;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd0;
				I_d = 6'd0;
			end
			13'b0000000000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0000000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffff800;
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
				I_d = 6'd2;
			end
			13'b0000000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0000000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0000000000111: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0000000000101: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd1;
					I_d = 6'd0;
				end
				else
					I_d = 6'd4;
			end
			13'b0000000000100: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd1;
				I_d = 6'd0;
			end
			13'b0000001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000200;
				rf_raddr_a_o = 5'd16;
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
				I_d = 6'd1;
			end
			13'b0000001000001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0000001000011: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd5;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd3;
					I_d = 6'd0;
				end
			end
			13'b0000011000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0000011000001: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd2;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b0000011000011: begin
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
				I_d = 6'd2;
			end
			13'b0000011000010: begin
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
				I_d = 6'd6;
			end
			13'b0000011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				I_d = 6'd7;
			end
			13'b0000011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				I_d = 6'd5;
			end
			13'b0000011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0000011000100: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd75;
					I_d = 6'd0;
				end
				else
					I_d = 6'd12;
			end
			13'b0000011001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd30;
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
				I_d = 6'd13;
			end
			13'b0000011001101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd15;
			end
			13'b0000011001111: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b0000011001110: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd0;
				I_d = 6'd0;
			end
			13'b1001011000000: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1001011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000660;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1001011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1001011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007ec;
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
				I_d = 6'd6;
			end
			13'b1001011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e8;
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
				I_d = 6'd7;
			end
			13'b1001011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e4;
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
				I_d = 6'd5;
			end
			13'b1001011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e0;
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
				I_d = 6'd4;
			end
			13'b1001011000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007dc;
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
				I_d = 6'd12;
			end
			13'b1001011001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d8;
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
				I_d = 6'd13;
			end
			13'b1001011001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d4;
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
				I_d = 6'd15;
			end
			13'b1001011001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d0;
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
				I_d = 6'd14;
			end
			13'b1001011001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007cc;
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
				I_d = 6'd10;
			end
			13'b1001011001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c8;
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
				I_d = 6'd11;
			end
			13'b1001011001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c4;
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
				I_d = 6'd9;
			end
			13'b1001011001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c0;
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
				I_d = 6'd8;
			end
			13'b1001011001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007bc;
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
				I_d = 6'd24;
			end
			13'b1001011011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007f0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd25;
			end
			13'b1001011011001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b0000101000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0000101000001: begin
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd7;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b0000101000011: begin
				alu_operand_b_ex_o = 32'h00000007;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0000101000010: begin
				alu_operator_ex_o = 7'd1;
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
				I_d = 6'd6;
			end
			13'b0000101000110: begin
				alu_operator_ex_o = 7'd10;
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
				I_d = 6'd7;
			end
			13'b0000101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				I_d = 6'd5;
			end
			13'b0000101000101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ff;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0000101000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd21;
				I_d = 6'd0;
			end
			13'b0010101000000: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0010101000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffa10;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0010101000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0010101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd17;
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
				I_d = 6'd6;
			end
			13'b0010101000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0010101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd17;
				I_d = 6'd0;
			end
			13'b0010001000000: begin
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
				I_d = 6'd1;
			end
			13'b0010001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0010001000011: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else
					I_d = 6'd2;
			end
			13'b0010001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000110;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0010001000110: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0010001000111: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0010001000101: begin
				alu_operand_b_ex_o = 32'h00000100;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0010001000100: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd16;
				I_d = 6'd0;
			end
			13'b0010010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0010010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0010010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0010010000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0010010000110: begin
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd19;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd16;
					I_d = 6'd0;
				end
			end
			13'b0010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				I_d = 6'd1;
			end
			13'b0010000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 6'd3;
			end
			13'b0010000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd6;
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
				I_d = 6'd7;
			end
			13'b0010000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0010000000110: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0010000000010: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd18;
					I_d = 6'd0;
				end
				else
					I_d = 6'd5;
			end
			13'b0010000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0010000000100: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0010000001100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0010000001101: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd54;
					I_d = 6'd0;
				end
				else
					I_d = 6'd15;
			end
			13'b0010000001111: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd20;
				I_d = 6'd0;
			end
			13'b0010100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0010100000001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0010100000011: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0010100000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0010100000110: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd22;
					I_d = 6'd0;
				end
				else
					I_d = 6'd2;
			end
			13'b0010100000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd22;
				I_d = 6'd0;
			end
			13'b0010110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0010110000001: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0010110000011: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd20;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd54;
					I_d = 6'd0;
				end
			end
			13'b0110110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd28;
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
				I_d = 6'd1;
			end
			13'b0110110000001: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd18;
				I_d = 6'd0;
			end
			13'b0010011000000: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0010011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffa14;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0010011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0010011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0010011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0010011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000111;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0010011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0010011001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0010011001100: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0010011000100: begin
				alu_operand_b_ex_o = 32'h00000100;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd27;
				I_d = 6'd0;
			end
			13'b0011011000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd6;
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
				I_d = 6'd1;
			end
			13'b0011011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 6'd3;
			end
			13'b0011011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0011011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0011011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd11;
				I_d = 6'd0;
			end
			13'b0001011000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd14;
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
				I_d = 6'd1;
			end
			13'b0001011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0001011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0001011000010: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd15;
					I_d = 6'd0;
				end
				else
					I_d = 6'd6;
			end
			13'b0001011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b0;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				expecting_load_resp_o = 1'b1;
				I_d = 6'd7;
			end
			13'b0001011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
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
				I_d = 6'd5;
			end
			13'b0001011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0001011001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 6'd12;
			end
			13'b0001011001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffc;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0001011000100: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					I_d = 6'd0;
				else begin
					L_d = 7'd31;
					I_d = 6'd0;
				end
			end
			13'b0011111000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0011111000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0011111000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0011111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0011111000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffc00;
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
				I_d = 6'd7;
			end
			13'b0011111000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000300;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				I_d = 6'd5;
			end
			13'b0011111000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0011111000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0011111001100: begin
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd27;
					I_d = 6'd0;
				end
				else
					I_d = 6'd13;
			end
			13'b0011111001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffc00;
				rf_raddr_a_o = 5'd29;
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
				I_d = 6'd15;
			end
			13'b0011111001111: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd97;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd23;
					I_d = 6'd0;
				end
			end
			13'b0010111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd5;
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
				I_d = 6'd1;
			end
			13'b0010111000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0010111000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0010111000010: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					I_d = 6'd0;
				else begin
					L_d = 7'd55;
					I_d = 6'd0;
				end
			end
			13'b0110111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				I_d = 6'd1;
			end
			13'b0110111000001: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd43;
					I_d = 6'd0;
				end
				else
					I_d = 6'd3;
			end
			13'b0110111000011: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0110111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				I_d = 6'd6;
			end
			13'b0110111000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffa10;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0110111000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0110111000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0110111000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0110111001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0110111001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd15;
			end
			13'b0110111001111: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b0110111001110: begin
				alu_operand_b_ex_o = 32'h00000080;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd10;
			end
			13'b0110111001010: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd11;
			end
			13'b0110111001011: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd39;
				I_d = 6'd0;
			end
			13'b0100111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd28;
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
				I_d = 6'd1;
			end
			13'b0100111000001: begin
				alu_operator_ex_o = 7'd4;
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
				I_d = 6'd3;
			end
			13'b0100111000011: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd38;
					I_d = 6'd0;
				end
				else
					I_d = 6'd2;
			end
			13'b0100111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0100111000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd34;
				I_d = 6'd0;
			end
			13'b0100010000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0100010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0100010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffc00;
				rf_raddr_a_o = 5'd15;
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
				I_d = 6'd2;
			end
			13'b0100010000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0100010000110: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000002;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0100010000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0100010000101: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd32;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd36;
					I_d = 6'd0;
				end
			end
			13'b0100100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
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
				I_d = 6'd1;
			end
			13'b0100100000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0100100000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0100100000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0100100000110: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					I_d = 6'd0;
				else begin
					L_d = 7'd32;
					I_d = 6'd0;
				end
			end
			13'b0100000000000: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd40;
					I_d = 6'd0;
				end
				else
					I_d = 6'd1;
			end
			13'b0100000000001: begin
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd41;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd33;
					I_d = 6'd0;
				end
			end
			13'b0100001000000: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd35;
				I_d = 6'd0;
			end
			13'b0100011000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				I_d = 6'd1;
			end
			13'b0100011000001: begin
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd39;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd43;
					I_d = 6'd0;
				end
			end
			13'b0101011000000: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0101011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000660;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0101011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				I_d = 6'd2;
			end
			13'b0101011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0101011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007ec;
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
				I_d = 6'd7;
			end
			13'b0101011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e8;
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
				I_d = 6'd5;
			end
			13'b0101011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e4;
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
				I_d = 6'd4;
			end
			13'b0101011000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007e0;
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
				I_d = 6'd12;
			end
			13'b0101011001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007dc;
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
				I_d = 6'd13;
			end
			13'b0101011001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d8;
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
				I_d = 6'd15;
			end
			13'b0101011001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d4;
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
				I_d = 6'd14;
			end
			13'b0101011001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007d0;
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
				I_d = 6'd10;
			end
			13'b0101011001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007cc;
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
				I_d = 6'd11;
			end
			13'b0101011001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c8;
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
				I_d = 6'd9;
			end
			13'b0101011001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c4;
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
				I_d = 6'd8;
			end
			13'b0101011001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007c0;
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
				I_d = 6'd24;
			end
			13'b0101011011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007bc;
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
				I_d = 6'd25;
			end
			13'b0101011011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000007f0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd27;
			end
			13'b0101011011011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd42;
				I_d = 6'd0;
			end
			13'b0101000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0101000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000300;
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
				I_d = 6'd3;
			end
			13'b0101000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				I_d = 6'd2;
			end
			13'b0101000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b0101000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b0101000000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
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
				I_d = 6'd5;
			end
			13'b0101000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd13;
			end
			13'b0101000001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				I_d = 6'd12;
			end
			13'b0101000001100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0101000000100: begin
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd33;
					I_d = 6'd0;
				end
				else begin
					L_d = 7'd41;
					I_d = 6'd0;
				end
			end
			13'b0101001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0101001000001: begin
				alu_operand_b_ex_o = 32'h00000080;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0101001000011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd35;
				I_d = 6'd0;
			end
			13'b0001111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0001111000001: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd31;
				I_d = 6'd0;
			end
			13'b0100110000000: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0100110000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0100110000011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd34;
				I_d = 6'd0;
			end
			13'b1011100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				I_d = 6'd1;
			end
			13'b1011100000001: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1011100000011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd21;
				I_d = 6'd0;
			end
			13'b1100001000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1100001000001: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd55;
				I_d = 6'd0;
			end
			13'b1011111000000: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i) begin
					L_d = 7'd79;
					I_d = 6'd0;
				end
				else
					I_d = 6'd1;
			end
			13'b1011111000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffd0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1011111000011: begin
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
				I_d = 6'd2;
			end
			13'b1011111000010: begin
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
				I_d = 6'd6;
			end
			13'b1011111000110: begin
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
				I_d = 6'd7;
			end
			13'b1011111000111: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b1011111000101: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b1011111000100: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b1011111001100: begin
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
				I_d = 6'd13;
			end
			13'b1011111001101: begin
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
				I_d = 6'd15;
			end
			13'b1011111001111: begin
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
				I_d = 6'd14;
			end
			13'b1011111001110: begin
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
				I_d = 6'd10;
			end
			13'b1011111001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				I_d = 6'd11;
			end
			13'b1011111001011: begin
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
				I_d = 6'd9;
			end
			13'b1011111001001: begin
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
				I_d = 6'd8;
			end
			13'b1011111001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd24;
			end
			13'b1011111011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd25;
			end
			13'b1011111011001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000200;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd27;
			end
			13'b1011111011011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd31;
			end
			13'b1011111011111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000003f4;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd30;
			end
			13'b1011111011110: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd26;
			end
			13'b1011111011010: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd63;
				I_d = 6'd0;
			end
			13'b0111111000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd47;
				I_d = 6'd0;
			end
			13'b0101111000000: begin
				alu_operand_b_ex_o = 32'h00002000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b0101111000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000400;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0101111000011: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000bc6;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd45;
				I_d = 6'd0;
			end
			13'b0101111000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0101111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd46;
				I_d = 6'd0;
			end
			13'b0101110000000: begin
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
				I_d = 6'd1;
			end
			13'b0101110000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b0101110000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b0101110000010: begin
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
				I_d = 6'd6;
			end
			13'b0101110000110: begin
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
					I_d = 6'd0;
				else
					I_d = 6'd7;
			end
			13'b0101110000111: begin
				alu_operand_b_ex_o = 32'h000001f4;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd5;
			end
			13'b0101110000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000200;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b0101110000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b0101110001100: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000b8d;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd44;
				I_d = 6'd0;
			end
			13'b0101110001101: begin
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd47;
					I_d = 6'd0;
				end
				else
					I_d = 6'd15;
			end
			13'b0101110001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd14;
			end
			13'b0101110001110: begin
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd63;
					I_d = 6'd0;
				end
				else
					I_d = 6'd10;
			end
			13'b0101110001010: begin
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
				I_d = 6'd11;
			end
			13'b0101110001011: begin
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
				I_d = 6'd9;
			end
			13'b0101110001001: begin
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
				I_d = 6'd8;
			end
			13'b0101110001000: begin
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
				I_d = 6'd24;
			end
			13'b0101110011000: begin
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
				I_d = 6'd25;
			end
			13'b0101110011001: begin
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
				I_d = 6'd27;
			end
			13'b0101110011011: begin
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
				I_d = 6'd26;
			end
			13'b0101110011010: begin
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
				I_d = 6'd30;
			end
			13'b0101110011110: begin
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
				I_d = 6'd28;
			end
			13'b0101110011100: begin
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
				I_d = 6'd29;
			end
			13'b0101110011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd31;
			end
			13'b0101110011111: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1001111000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1000001000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1000001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000200;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1000001000011: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1000001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000001f4;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b1000001000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				L_d = 7'd67;
				I_d = 6'd0;
			end
			13'b1000011000000: begin
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
				I_d = 6'd1;
			end
			13'b1000011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
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
				I_d = 6'd3;
			end
			13'b1000011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1000011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd6;
			end
			13'b1000011000110: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i) begin
					L_d = 7'd93;
					I_d = 6'd0;
				end
				else
					I_d = 6'd4;
			end
			13'b1000011000100: begin
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
					I_d = 6'd0;
				else
					I_d = 6'd5;
			end
			13'b1000011000101: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd7;
			end
			13'b1000011000111: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1011101000000: begin
				alu_operator_ex_o = 7'd1;
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
				I_d = 6'd1;
			end
			13'b1011101000001: begin
				alu_operator_ex_o = 7'd44;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1011101000011: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1000000000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			13'b1000111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1000111000001: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1000111000011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = 7'd95;
				I_d = 6'd0;
			end
			13'b1001110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd1;
			end
			13'b1001110000001: begin
				alu_operand_b_ex_o = 32'h0000000b;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd3;
			end
			13'b1001110000011: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd2;
			end
			13'b1001110000010: begin
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
				I_d = 6'd6;
			end
			13'b1001110000110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00001387;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				L_d = 7'd95;
				I_d = 6'd0;
			end
			13'b1001110000111: begin
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
				I_d = 6'd5;
			end
			13'b1001110000101: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd4;
			end
			13'b1001110000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				I_d = 6'd12;
			end
			13'b1001110001100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				L_d = rf_rdata_a[12:6];
				I_d = rf_rdata_a[5:0];
			end
			default: begin
				L_d = 7'd73;
				I_d = 6'd0;
			end
		endcase
	end
	assign ctrl_busy_o = state_q != 13'b1001110001100;
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
