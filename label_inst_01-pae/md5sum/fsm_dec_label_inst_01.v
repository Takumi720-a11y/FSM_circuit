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
	(* fsm_encoding = "none" *) reg [11:0] state_q;
	reg [11:0] state_d;
	wire [31:0] rf_rdata_a;
	wire [31:0] rf_rdata_b;
	assign rf_rdata_a = rf_rdata_a_i;
	assign rf_rdata_b = rf_rdata_b_i;
	(* dont_touch = "yes" *) reg [11:0] state_q_prev;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			state_q_prev <= 12'b100000000000;
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
		if (!rst_ni)
			state_q <= 12'b100000000000;
		else if ((((ready_wb_i && ex_valid_i) && !((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 12'b100001000001) || (state_q == 12'b011101000001)) || (state_q == 12'b011101001000)) || (state_q == 12'b011101001010)) || (state_q == 12'b011101001100)) || (state_q == 12'b100011000001)) || (state_q == 12'b100011001010)) || (state_q == 12'b101011000001)) || (state_q == 12'b000100000110)) || (state_q == 12'b000100000111)) || (state_q == 12'b000100001000)) || (state_q == 12'b100100000001)) || (state_q == 12'b100100000011)) || (state_q == 12'b010110000011)) || (state_q == 12'b010110000101)) || (state_q == 12'b010110001011)) || (state_q == 12'b010110001100)) || (state_q == 12'b010010000000)) || (state_q == 12'b100110000101)) || (state_q == 12'b100110000110)) || (state_q == 12'b010000000001)) || (state_q == 12'b010000000011)) || (state_q == 12'b010100000001)) || (state_q == 12'b010101000000)) || (state_q == 12'b010101000001)) || (state_q == 12'b100010000010)) || (state_q == 12'b100010000101)) || (state_q == 12'b100010000110)) || (state_q == 12'b101000000000)) || (state_q == 12'b101000000011)) || (state_q == 12'b101010000000)) || (state_q == 12'b101010000001)) || (state_q == 12'b101010000010)) || (state_q == 12'b100111000000)) || (state_q == 12'b100111000001)) || (state_q == 12'b100111000010)) || (state_q == 12'b010111000011)) || (state_q == 12'b010111000100)) || (state_q == 12'b010111000101)) || (state_q == 12'b010111000110)) || (state_q == 12'b010111000111)) || (state_q == 12'b010111001000)) || (state_q == 12'b010111001001)) || (state_q == 12'b010111001010)) || (state_q == 12'b010111001011)) || (state_q == 12'b010111001100)) || (state_q == 12'b010111001101)) || (state_q == 12'b010111001110)) || (state_q == 12'b010111001111)) || (state_q == 12'b010011000000)) || (state_q == 12'b010011000001)) || (state_q == 12'b010011000010)) || (state_q == 12'b010011000011)) || (state_q == 12'b010011000100)) || (state_q == 12'b010011000101)) || (state_q == 12'b010011000110)) || (state_q == 12'b010011000111)) || (state_q == 12'b010001000000)) || (state_q == 12'b010001000001)) || (state_q == 12'b010001000010)) || (state_q == 12'b010001000011)) || (state_q == 12'b010001000100)) || (state_q == 12'b010001000101)) || (state_q == 12'b010001000110)) || (state_q == 12'b010001000111)) || (state_q == 12'b010001010111)) || (state_q == 12'b010001011100)) || (state_q == 12'b010001011101)) || (state_q == 12'b010001011110)) || (state_q == 12'b011000000000)) || (state_q == 12'b011000000011)) || (state_q == 12'b011010000100)) || (state_q == 12'b011010000101)) || (state_q == 12'b001010000000)) || (state_q == 12'b001010000011)) || (state_q == 12'b001010000111)) || (state_q == 12'b001010001000)) || (state_q == 12'b001010001001)) || (state_q == 12'b001010001010)) || (state_q == 12'b001010010000)) || (state_q == 12'b000001000010)) || (state_q == 12'b000001000100)) || (state_q == 12'b000001000101)) || (state_q == 12'b001001000000)) || (state_q == 12'b001001001000)) || (state_q == 12'b001001001001)) || (state_q == 12'b001001001010)) || (state_q == 12'b001001001011)) || (state_q == 12'b001011000000)) || (state_q == 12'b001011000001)) || (state_q == 12'b001011000010)) || (state_q == 12'b001011000011)) || (state_q == 12'b001011000100)) || (state_q == 12'b001011000101)) || (state_q == 12'b001011000110)) || (state_q == 12'b001011000111)) || (state_q == 12'b001011001000)) || (state_q == 12'b001011001001)) || (state_q == 12'b001011001010)) || (state_q == 12'b001011001011)) || (state_q == 12'b001011001100)) || (state_q == 12'b001100000001)) || (state_q == 12'b001100000011)) || (state_q == 12'b001100000100)) || (state_q == 12'b001100000101)) || (state_q == 12'b001100000110)) || (state_q == 12'b001100000111)) || (state_q == 12'b001100001000)) || (state_q == 12'b001100001001)) || (state_q == 12'b000111000001)) || (state_q == 12'b000111001101)) || (state_q == 12'b000111001110)) || (state_q == 12'b000111001111)) || (state_q == 12'b000111010000)) || (state_q == 12'b000111010001)) || (state_q == 12'b000111010010)) || (state_q == 12'b000111010011)) || (state_q == 12'b001101000010)) || (state_q == 12'b001101000011)) || (state_q == 12'b001101000101)) || (state_q == 12'b001101000111)) || (state_q == 12'b001101001000))) || (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 12'b100001000001) || (state_q == 12'b011101000001)) || (state_q == 12'b011101001000)) || (state_q == 12'b100011001010)) || (state_q == 12'b101011000001)) || (state_q == 12'b000100000110)) || (state_q == 12'b000100000111)) || (state_q == 12'b000100001000)) || (state_q == 12'b010110001100)) || (state_q == 12'b010010000000)) || (state_q == 12'b100110000110)) || (state_q == 12'b010000000001)) || (state_q == 12'b010000000011)) || (state_q == 12'b010100000001)) || (state_q == 12'b100010000010)) || (state_q == 12'b100010000101)) || (state_q == 12'b100010000110)) || (state_q == 12'b101000000011)) || (state_q == 12'b010111000011)) || (state_q == 12'b010111000100)) || (state_q == 12'b010111000101)) || (state_q == 12'b010111000110)) || (state_q == 12'b010111000111)) || (state_q == 12'b010111001000)) || (state_q == 12'b010111001001)) || (state_q == 12'b010111001010)) || (state_q == 12'b010111001011)) || (state_q == 12'b010111001100)) || (state_q == 12'b010111001101)) || (state_q == 12'b010111001110)) || (state_q == 12'b010111001111)) || (state_q == 12'b010011000100)) || (state_q == 12'b010011000101)) || (state_q == 12'b010011000110)) || (state_q == 12'b010011000111)) || (state_q == 12'b010001000100)) || (state_q == 12'b010001000101)) || (state_q == 12'b010001000110)) || (state_q == 12'b010001000111)) || (state_q == 12'b010001010111)) || (state_q == 12'b010001011100)) || (state_q == 12'b010001011101)) || (state_q == 12'b010001011110)) || (state_q == 12'b011000000011)) || (state_q == 12'b011010000100)) || (state_q == 12'b011010000101)) || (state_q == 12'b001010000011)) || (state_q == 12'b001010010000)) || (state_q == 12'b001001001000)) || (state_q == 12'b001001001001)) || (state_q == 12'b001001001010)) || (state_q == 12'b001001001011)) || (state_q == 12'b001100000001)) || (state_q == 12'b001100000011)) || (state_q == 12'b001100000100)) || (state_q == 12'b001100000101)) || (state_q == 12'b001100000110)) || (state_q == 12'b001100000111)) || (state_q == 12'b001100001000)) || (state_q == 12'b001100001001)) || (state_q == 12'b000111000001)) && lsu_resp_valid_i) && !first_cycle)) || (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 12'b011101001010) || (state_q == 12'b011101001100)) || (state_q == 12'b100011000001)) || (state_q == 12'b100100000001)) || (state_q == 12'b100100000011)) || (state_q == 12'b010110000011)) || (state_q == 12'b010110000101)) || (state_q == 12'b010110001011)) || (state_q == 12'b100110000101)) || (state_q == 12'b010101000000)) || (state_q == 12'b010101000001)) || (state_q == 12'b101000000000)) || (state_q == 12'b101010000000)) || (state_q == 12'b101010000001)) || (state_q == 12'b101010000010)) || (state_q == 12'b100111000000)) || (state_q == 12'b100111000001)) || (state_q == 12'b100111000010)) || (state_q == 12'b010011000000)) || (state_q == 12'b010011000001)) || (state_q == 12'b010011000010)) || (state_q == 12'b010011000011)) || (state_q == 12'b010001000000)) || (state_q == 12'b010001000001)) || (state_q == 12'b010001000010)) || (state_q == 12'b010001000011)) || (state_q == 12'b011000000000)) || (state_q == 12'b001010000000)) || (state_q == 12'b001010000111)) || (state_q == 12'b001010001000)) || (state_q == 12'b001010001001)) || (state_q == 12'b001010001010)) || (state_q == 12'b000001000010)) || (state_q == 12'b000001000100)) || (state_q == 12'b000001000101)) || (state_q == 12'b001001000000)) || (state_q == 12'b001011000000)) || (state_q == 12'b001011000001)) || (state_q == 12'b001011000010)) || (state_q == 12'b001011000011)) || (state_q == 12'b001011000100)) || (state_q == 12'b001011000101)) || (state_q == 12'b001011000110)) || (state_q == 12'b001011000111)) || (state_q == 12'b001011001000)) || (state_q == 12'b001011001001)) || (state_q == 12'b001011001010)) || (state_q == 12'b001011001011)) || (state_q == 12'b001011001100)) || (state_q == 12'b000111001101)) || (state_q == 12'b000111001110)) || (state_q == 12'b000111001111)) || (state_q == 12'b000111010000)) || (state_q == 12'b000111010001)) || (state_q == 12'b000111010010)) || (state_q == 12'b000111010011)) || (state_q == 12'b001101000010)) || (state_q == 12'b001101000011)) || (state_q == 12'b001101000101)) || (state_q == 12'b001101000111)) || (state_q == 12'b001101001000)) && lsu_resp_valid_i) && !first_cycle))
			state_q <= state_d;
	always @(*) begin
		if (_sv2v_0)
			;
		state_d = state_q;
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
			12'b100000000000: begin
				alu_operand_b_ex_o = 32'h00020000;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100000000001;
			end
			12'b100000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100000000010;
			end
			12'b100000000010: begin
				alu_operand_a_ex_o = 32'h00000088;
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100000000011;
			end
			12'b100000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000178;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100000000100;
			end
			12'b100000000100: begin
				alu_operand_a_ex_o = 32'h00000090;
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100000000101;
			end
			12'b100000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffd98;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100001000000;
			end
			12'b100001000000: begin
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b101001000000;
				else
					state_d = 12'b100001000001;
			end
			12'b100001000001: begin
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
				state_d = 12'b100001000010;
			end
			12'b100001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100001000011;
			end
			12'b100001000011: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b100001000000;
			end
			12'b101001000000: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000940;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b011101000000;
			end
			12'b100101000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b100101000000;
			end
			12'b011101000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffe0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011101000001;
			end
			12'b011101000001: begin
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
				state_d = 12'b011101000010;
			end
			12'b011101000010: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000743;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b101101000000;
			end
			12'b011101000011: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000744;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b011110000000;
			end
			12'b011101000100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011101000101;
			end
			12'b011101000101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000746;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b011100000000;
			end
			12'b011101000110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000747;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b011111000000;
			end
			12'b011101000111: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000748;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b101100000000;
			end
			12'b011101001000: begin
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
				state_d = 12'b011101001001;
			end
			12'b011101001001: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000074a;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b011011000000;
			end
			12'b011101001010: begin
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
				state_d = 12'b011101001011;
			end
			12'b011101001011: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000074c;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b011001000000;
			end
			12'b011101001100: begin
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
				state_d = 12'b011101001101;
			end
			12'b011101001101: begin
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
				state_d = 12'b011101001110;
			end
			12'b011101001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011101001111;
			end
			12'b011101001111: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b100011000000: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100011000001;
			end
			12'b100011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe14;
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
				state_d = 12'b100011000010;
			end
			12'b100011000010: begin
				alu_operand_b_ex_o = 32'h41c65000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100011000011;
			end
			12'b100011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe6d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100011000100;
			end
			12'b100011000100: begin
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
				state_d = 12'b100011000101;
			end
			12'b100011000101: begin
				alu_operand_b_ex_o = 32'h00003000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100011000110;
			end
			12'b100011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000039;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100011000111;
			end
			12'b100011000111: begin
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
				state_d = 12'b100011001000;
			end
			12'b100011001000: begin
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
				state_d = 12'b100011001001;
			end
			12'b100011001001: begin
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
				state_d = 12'b100011001010;
			end
			12'b100011001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe14;
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
				state_d = 12'b100011001011;
			end
			12'b100011001011: begin
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
				state_d = 12'b100011001100;
			end
			12'b100011001100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b101011000000: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101011000001;
			end
			12'b101011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe14;
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
				state_d = 12'b101011000010;
			end
			12'b101011000010: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b000100000000: begin
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
				state_d = 12'b000100000001;
			end
			12'b000100000001: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b110000000000;
				else
					state_d = 12'b000100000010;
			end
			12'b000100000010: begin
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
				state_d = 12'b000100000011;
			end
			12'b000100000011: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000100000100;
			end
			12'b000100000100: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000100000101;
			end
			12'b000100000101: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000100000110;
			end
			12'b000100000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe0c;
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
				state_d = 12'b000100000111;
			end
			12'b000100000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
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
				state_d = 12'b000100001000;
			end
			12'b000100001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe08;
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
				state_d = 12'b000100001001;
			end
			12'b000100001001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b110000000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b110000000000;
			end
			12'b100100000000: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100100000001;
			end
			12'b100100000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe08;
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
				state_d = 12'b100100000010;
			end
			12'b100100000010: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100100000011;
			end
			12'b100100000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe0c;
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
				state_d = 12'b100100000100;
			end
			12'b100100000100: begin
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
				state_d = 12'b100100000101;
			end
			12'b100100000101: begin
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
				state_d = 12'b100100000110;
			end
			12'b100100000110: begin
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
				state_d = 12'b100100000111;
			end
			12'b100100000111: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b010110000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010110000001;
			end
			12'b010110000001: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b101110000000;
				else
					state_d = 12'b010110000010;
			end
			12'b010110000010: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010110000011;
			end
			12'b010110000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
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
				state_d = 12'b010110000100;
			end
			12'b010110000100: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010110000101;
			end
			12'b010110000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe08;
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
				state_d = 12'b010110000110;
			end
			12'b010110000110: begin
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
				state_d = 12'b010110000111;
			end
			12'b010110000111: begin
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
				state_d = 12'b010110001000;
			end
			12'b010110001000: begin
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
				state_d = 12'b010110001001;
			end
			12'b010110001001: begin
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b100110000000;
				else
					state_d = 12'b010110001010;
			end
			12'b010110001010: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010110001011;
			end
			12'b010110001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe0c;
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
				state_d = 12'b010110001100;
			end
			12'b010110001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe08;
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
				state_d = 12'b010110001101;
			end
			12'b010110001101: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b101110000000;
				else
					state_d = 12'b010010000000;
			end
			12'b010010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe10;
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
				state_d = 12'b010010000001;
			end
			12'b010010000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b100110000000: begin
				alu_operand_b_ex_o = 32'h00000004;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100110000001;
			end
			12'b100110000001: begin
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
				state_d = 12'b100110000010;
			end
			12'b100110000010: begin
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
				state_d = 12'b100110000011;
			end
			12'b100110000011: begin
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
				state_d = 12'b100110000100;
			end
			12'b100110000100: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100110000101;
			end
			12'b100110000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe0c;
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
				state_d = 12'b100110000110;
			end
			12'b100110000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe08;
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
				state_d = 12'b100110000111;
			end
			12'b100110000111: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b010010000000;
				else
					state_d = 12'b101110000000;
			end
			12'b101110000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101110000001;
			end
			12'b101110000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b010000000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010000000001;
			end
			12'b010000000001: begin
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
				state_d = 12'b010000000010;
			end
			12'b010000000010: begin
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
				state_d = 12'b010000000011;
			end
			12'b010000000011: begin
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
				state_d = 12'b010000000100;
			end
			12'b010000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010000000101;
			end
			12'b010000000101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000406;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b010110000000;
			end
			12'b010000000110: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b010101000000;
				else
					state_d = 12'b010000000111;
			end
			12'b010000000111: begin
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b010101000000;
				else
					state_d = 12'b010000001000;
			end
			12'b010000001000: begin
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
				state_d = 12'b010000001001;
			end
			12'b010000001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010100000000;
			end
			12'b010100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010100000001;
			end
			12'b010100000001: begin
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
				state_d = 12'b010100000010;
			end
			12'b010100000010: begin
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
					state_d = 12'b010100000000;
				else
					state_d = 12'b010101000000;
			end
			12'b010101000000: begin
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
				state_d = 12'b010101000001;
			end
			12'b010101000001: begin
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
				state_d = 12'b010101000010;
			end
			12'b010101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010101000011;
			end
			12'b010101000011: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b100010000000: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b101111000000;
				else
					state_d = 12'b100010000001;
			end
			12'b100010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100010000010;
			end
			12'b100010000010: begin
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
				state_d = 12'b100010000011;
			end
			12'b100010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100010000100;
			end
			12'b100010000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100010000101;
			end
			12'b100010000101: begin
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
				state_d = 12'b100010000110;
			end
			12'b100010000110: begin
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
				state_d = 12'b100010000111;
			end
			12'b100010000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100010001000;
			end
			12'b100010001000: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000889;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b010110000000;
			end
			12'b100010001001: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b100111000000;
				else
					state_d = 12'b100010001010;
			end
			12'b100010001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100010001011;
			end
			12'b100010001011: begin
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
				state_d = 12'b100010001100;
			end
			12'b100010001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100010001101;
			end
			12'b100010001101: begin
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b101010000000;
				else
					state_d = 12'b101000000000;
			end
			12'b101000000000: begin
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
				state_d = 12'b101000000001;
			end
			12'b101000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101000000010;
			end
			12'b101000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101000000011;
			end
			12'b101000000011: begin
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
				state_d = 12'b101000000100;
			end
			12'b101000000100: begin
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
					state_d = 12'b101000000000;
				else
					state_d = 12'b101010000000;
			end
			12'b101010000000: begin
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
				state_d = 12'b101010000001;
			end
			12'b101010000001: begin
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
				state_d = 12'b101010000010;
			end
			12'b101010000010: begin
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
				state_d = 12'b101010000011;
			end
			12'b101010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101010000100;
			end
			12'b101010000100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b100111000000: begin
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
				state_d = 12'b100111000001;
			end
			12'b100111000001: begin
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
				state_d = 12'b100111000010;
			end
			12'b100111000010: begin
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
				state_d = 12'b100111000011;
			end
			12'b100111000011: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100111000100;
			end
			12'b100111000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b100111000101;
			end
			12'b100111000101: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b101111000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101111000001;
			end
			12'b101111000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b001111000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b101101000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b011111000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b011111000001;
			end
			12'b011111000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b011011000000: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b011011000001;
			end
			12'b011011000001: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b010111000000: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010111000001;
			end
			12'b010111000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffda0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010111000010;
			end
			12'b010111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010111000011;
			end
			12'b010111000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000258;
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
				state_d = 12'b010111000100;
			end
			12'b010111000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000254;
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
				state_d = 12'b010111000101;
			end
			12'b010111000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000025c;
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
				state_d = 12'b010111000110;
			end
			12'b010111000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000250;
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
				state_d = 12'b010111000111;
			end
			12'b010111000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000024c;
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
				state_d = 12'b010111001000;
			end
			12'b010111001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000248;
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
				state_d = 12'b010111001001;
			end
			12'b010111001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000244;
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
				state_d = 12'b010111001010;
			end
			12'b010111001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000240;
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
				state_d = 12'b010111001011;
			end
			12'b010111001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000023c;
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
				state_d = 12'b010111001100;
			end
			12'b010111001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000238;
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
				state_d = 12'b010111001101;
			end
			12'b010111001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000234;
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
				state_d = 12'b010111001110;
			end
			12'b010111001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000230;
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
				state_d = 12'b010111001111;
			end
			12'b010111001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000022c;
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
				state_d = 12'b010111010000;
			end
			12'b010111010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010111010001;
			end
			12'b010111010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010111010010;
			end
			12'b010111010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010111010011;
			end
			12'b010111010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000100;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010111010100;
			end
			12'b010111010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010011000000;
			end
			12'b010011000000: begin
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
				state_d = 12'b010011000001;
			end
			12'b010011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b010011000010;
			end
			12'b010011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b010011000011;
			end
			12'b010011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b010011000100;
			end
			12'b010011000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
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
				state_d = 12'b010011000101;
			end
			12'b010011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				state_d = 12'b010011000110;
			end
			12'b010011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				state_d = 12'b010011000111;
			end
			12'b010011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd14;
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
				state_d = 12'b010011001000;
			end
			12'b010011001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010011001001;
			end
			12'b010011001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010011001010;
			end
			12'b010011001010: begin
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
					state_d = 12'b010011000000;
				else
					state_d = 12'b010011001011;
			end
			12'b010011001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000200;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010011001100;
			end
			12'b010011001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000120;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001000000;
			end
			12'b010001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b010001000001;
			end
			12'b010001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b010001000010;
			end
			12'b010001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b010001000011;
			end
			12'b010001000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b010001000100;
			end
			12'b010001000100: begin
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
				state_d = 12'b010001000101;
			end
			12'b010001000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				state_d = 12'b010001000110;
			end
			12'b010001000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd14;
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
				state_d = 12'b010001000111;
			end
			12'b010001000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				state_d = 12'b010001001000;
			end
			12'b010001001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001001001;
			end
			12'b010001001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001001010;
			end
			12'b010001001010: begin
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
					state_d = 12'b010001000000;
				else
					state_d = 12'b010001001011;
			end
			12'b010001001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001001100;
			end
			12'b010001001100: begin
				alu_operand_b_ex_o = 32'hefcdb000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001001101;
			end
			12'b010001001101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffc0;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001001110;
			end
			12'b010001001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffb89;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001001111;
			end
			12'b010001001111: begin
				alu_operand_b_ex_o = 32'h67452000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010000;
			end
			12'b010001010000: begin
				alu_operand_b_ex_o = 32'h98bae000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010001;
			end
			12'b010001010001: begin
				alu_operand_b_ex_o = 32'h10325000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010010;
			end
			12'b010001010010: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010011;
			end
			12'b010001010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000476;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010100;
			end
			12'b010001010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000078;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010101;
			end
			12'b010001010101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000301;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010110;
			end
			12'b010001010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffcfe;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001010111;
			end
			12'b010001010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe20;
				rf_raddr_a_o = 5'd23;
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
				state_d = 12'b010001011000;
			end
			12'b010001011000: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001011001;
			end
			12'b010001011001: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001011010;
			end
			12'b010001011010: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001011011;
			end
			12'b010001011011: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001011100;
			end
			12'b010001011100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe1c;
				rf_raddr_a_o = 5'd13;
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
				state_d = 12'b010001011101;
			end
			12'b010001011101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe18;
				rf_raddr_a_o = 5'd27;
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
				state_d = 12'b010001011110;
			end
			12'b010001011110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe24;
				rf_raddr_a_o = 5'd24;
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
				state_d = 12'b010001011111;
			end
			12'b010001011111: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000460;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b010000000000;
			end
			12'b010001100000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001100001;
			end
			12'b010001100001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001100010;
			end
			12'b010001100010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b010001100011;
			end
			12'b010001100011: begin
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b011010000000;
				else
					state_d = 12'b011000000000;
			end
			12'b011000000000: begin
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
				state_d = 12'b011000000001;
			end
			12'b011000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011000000010;
			end
			12'b011000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011000000011;
			end
			12'b011000000011: begin
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
				state_d = 12'b011000000100;
			end
			12'b011000000100: begin
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
					state_d = 12'b011000000000;
				else
					state_d = 12'b011010000000;
			end
			12'b011010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011010000001;
			end
			12'b011010000001: begin
				alu_operand_b_ex_o = 32'hffffff80;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011010000010;
			end
			12'b011010000010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011010000011;
			end
			12'b011010000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011010000100;
			end
			12'b011010000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				state_d = 12'b011010000101;
			end
			12'b011010000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
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
				state_d = 12'b011010000110;
			end
			12'b011010000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011010000111;
			end
			12'b011010000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010000000;
			end
			12'b001010000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				state_d = 12'b001010000001;
			end
			12'b001010000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010000010;
			end
			12'b001010000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010000011;
			end
			12'b001010000011: begin
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
				state_d = 12'b001010000100;
			end
			12'b001010000100: begin
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
					state_d = 12'b001010000000;
				else
					state_d = 12'b001010000101;
			end
			12'b001010000101: begin
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_a;
				if (branch_decision_i)
					state_d = 12'b001011000000;
				else
					state_d = 12'b001010000110;
			end
			12'b001010000110: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010000111;
			end
			12'b001010000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe24;
				rf_raddr_a_o = 5'd24;
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
				state_d = 12'b001010001000;
			end
			12'b001010001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe20;
				rf_raddr_a_o = 5'd23;
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
				state_d = 12'b001010001001;
			end
			12'b001010001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe1c;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b001010001010;
			end
			12'b001010001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe18;
				rf_raddr_a_o = 5'd27;
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
				state_d = 12'b001010001011;
			end
			12'b001010001011: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010001100;
			end
			12'b001010001100: begin
				alu_operand_b_ex_o = 32'h0000000f;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010001101;
			end
			12'b001010001101: begin
				alu_operand_b_ex_o = 32'h0000001f;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010001110;
			end
			12'b001010001110: begin
				alu_operand_b_ex_o = 32'h0000002f;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010001111;
			end
			12'b001010001111: begin
				alu_operand_b_ex_o = 32'h00000040;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001010010000;
			end
			12'b001010010000: begin
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
				state_d = 12'b001000000000;
			end
			12'b001000000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000000001;
			end
			12'b001000000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000120;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000000010;
			end
			12'b001000000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000000011;
			end
			12'b001000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000000100;
			end
			12'b001000000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000000101;
			end
			12'b001000000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000000110;
			end
			12'b001000000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000000111;
			end
			12'b001000000111: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000001000;
			end
			12'b001000001000: begin
				alu_operand_b_ex_o = 32'h00000005;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000001001;
			end
			12'b001000001001: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001000001010;
			end
			12'b001000001010: begin
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b000000000000;
				else
					state_d = 12'b000011000000;
			end
			12'b000011000000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000011000001;
			end
			12'b000011000001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000011000010;
			end
			12'b000011000010: begin
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd28;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b000101000000;
				else
					state_d = 12'b000011000011;
			end
			12'b000011000011: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000011000100;
			end
			12'b000011000100: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000011000101;
			end
			12'b000011000101: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000011000110;
			end
			12'b000011000110: begin
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b000010000000;
				else
					state_d = 12'b000001000000;
			end
			12'b000001000000: begin
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
				state_d = 12'b000001000001;
			end
			12'b000001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001000010;
			end
			12'b000001000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd28;
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
				state_d = 12'b000001000011;
			end
			12'b000001000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001000100;
			end
			12'b000001000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd13;
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
				state_d = 12'b000001000101;
			end
			12'b000001000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd6;
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
				state_d = 12'b000001000110;
			end
			12'b000001000110: begin
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
				state_d = 12'b000001000111;
			end
			12'b000001000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001001000;
			end
			12'b000001001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001001001;
			end
			12'b000001001001: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd13;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001001010;
			end
			12'b000001001010: begin
				alu_operator_ex_o = 7'd10;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001001011;
			end
			12'b000001001011: begin
				alu_operator_ex_o = 7'd9;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001001100;
			end
			12'b000001001100: begin
				alu_operator_ex_o = 7'd3;
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
				state_d = 12'b000001001101;
			end
			12'b000001001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001001110;
			end
			12'b000001001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000005;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001001111;
			end
			12'b000001001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001010000;
			end
			12'b000001010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001010001;
			end
			12'b000001010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001010010;
			end
			12'b000001010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001010011;
			end
			12'b000001010011: begin
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
				state_d = 12'b000001010100;
			end
			12'b000001010100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001010101;
			end
			12'b000001010101: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b001001000000;
				else
					state_d = 12'b000001010110;
			end
			12'b000001010110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001010111;
			end
			12'b000001010111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001011000;
			end
			12'b000001011000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000001011001;
			end
			12'b000001011001: begin
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd26;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b000011000000;
				else
					state_d = 12'b000000000000;
			end
			12'b000000000000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000000000001;
			end
			12'b000000000001: begin
				alu_operator_ex_o = 7'd4;
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
				state_d = 12'b000000000010;
			end
			12'b000000000010: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000000000011;
			end
			12'b000000000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000000000100;
			end
			12'b000000000100: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b000001000000;
			end
			12'b000101000000: begin
				alu_operator_ex_o = 7'd2;
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
				state_d = 12'b000101000001;
			end
			12'b000101000001: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000101000010;
			end
			12'b000101000010: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b000001000000;
			end
			12'b000010000000: begin
				alu_operator_ex_o = 7'd2;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000010000001;
			end
			12'b000010000001: begin
				alu_operator_ex_o = 7'd3;
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
				state_d = 12'b000010000010;
			end
			12'b000010000010: begin
				alu_operator_ex_o = 7'd2;
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
				state_d = 12'b000010000011;
			end
			12'b000010000011: begin
				alu_operator_ex_o = 7'd4;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000010000100;
			end
			12'b000010000100: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b000001000000;
			end
			12'b001001000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				state_d = 12'b001001000001;
			end
			12'b001001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001001000010;
			end
			12'b001001000010: begin
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
				state_d = 12'b001001000011;
			end
			12'b001001000011: begin
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
				state_d = 12'b001001000100;
			end
			12'b001001000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001001000101;
			end
			12'b001001000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001001000110;
			end
			12'b001001000110: begin
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd25;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b001000000000;
				else
					state_d = 12'b001001000111;
			end
			12'b001001000111: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001001001000;
			end
			12'b001001001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe24;
				rf_raddr_a_o = 5'd24;
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
				state_d = 12'b001001001001;
			end
			12'b001001001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe20;
				rf_raddr_a_o = 5'd23;
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
				state_d = 12'b001001001010;
			end
			12'b001001001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe1c;
				rf_raddr_a_o = 5'd15;
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
				state_d = 12'b001001001011;
			end
			12'b001001001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe18;
				rf_raddr_a_o = 5'd27;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				state_d = 12'b001011000000;
			end
			12'b001011000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000258;
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
				state_d = 12'b001011000001;
			end
			12'b001011000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000025c;
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
				state_d = 12'b001011000010;
			end
			12'b001011000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000254;
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
				state_d = 12'b001011000011;
			end
			12'b001011000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000250;
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
				state_d = 12'b001011000100;
			end
			12'b001011000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000024c;
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
				state_d = 12'b001011000101;
			end
			12'b001011000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000248;
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
				state_d = 12'b001011000110;
			end
			12'b001011000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000244;
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
				state_d = 12'b001011000111;
			end
			12'b001011000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000240;
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
				state_d = 12'b001011001000;
			end
			12'b001011001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000023c;
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
				state_d = 12'b001011001001;
			end
			12'b001011001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000238;
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
				state_d = 12'b001011001010;
			end
			12'b001011001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000234;
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
				state_d = 12'b001011001011;
			end
			12'b001011001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000230;
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
				state_d = 12'b001011001100;
			end
			12'b001011001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000022c;
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
				state_d = 12'b001011001101;
			end
			12'b001011001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000260;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001011001110;
			end
			12'b001011001110: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b001111000000;
			end
			12'b001100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffe0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001100000001;
			end
			12'b001100000001: begin
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
				state_d = 12'b001100000010;
			end
			12'b001100000010: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 12'b001101000000;
				else
					state_d = 12'b001100000011;
			end
			12'b001100000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
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
				state_d = 12'b001100000100;
			end
			12'b001100000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				state_d = 12'b001100000101;
			end
			12'b001100000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				state_d = 12'b001100000110;
			end
			12'b001100000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				state_d = 12'b001100000111;
			end
			12'b001100000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				state_d = 12'b001100001000;
			end
			12'b001100001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
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
				state_d = 12'b001100001001;
			end
			12'b001100001001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
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
				state_d = 12'b001100001010;
			end
			12'b001100001010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001100001011;
			end
			12'b001100001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001100001100;
			end
			12'b001100001100: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001100001101;
			end
			12'b001100001101: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001100001110;
			end
			12'b001100001110: begin
				alu_operand_b_ex_o = 32'h000003e8;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001110000000;
			end
			12'b001110000000: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000110000000;
			end
			12'b000110000000: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000110000001;
			end
			12'b000110000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffc08;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000110000010;
			end
			12'b000110000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000200;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000110000011;
			end
			12'b000110000011: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000184;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b000100000000;
			end
			12'b000110000100: begin
				alu_operand_b_ex_o = 32'h000003e8;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000110000101;
			end
			12'b000110000101: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000186;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b010110000000;
			end
			12'b000110000110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000110000111;
			end
			12'b000110000111: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111000000;
			end
			12'b000111000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111000001;
			end
			12'b000111000001: begin
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
				state_d = 12'b000111000010;
			end
			12'b000111000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111000011;
			end
			12'b000111000011: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b000111000000;
				else
					state_d = 12'b000111000100;
			end
			12'b000111000100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111000101;
			end
			12'b000111000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111000110;
			end
			12'b000111000110: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h000001c7;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b010111000000;
			end
			12'b000111000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111001000;
			end
			12'b000111001000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111001001;
			end
			12'b000111001001: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h000001ca;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 12'b001111000000;
			end
			12'b000111001010: begin
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b000110000000;
				else
					state_d = 12'b000111001011;
			end
			12'b000111001011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b000111001100;
			end
			12'b000111001100: begin
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 12'b001110000000;
				else
					state_d = 12'b000111001101;
			end
			12'b000111001101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
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
				state_d = 12'b000111001110;
			end
			12'b000111001110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
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
				state_d = 12'b000111001111;
			end
			12'b000111001111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
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
				state_d = 12'b000111010000;
			end
			12'b000111010000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				state_d = 12'b000111010001;
			end
			12'b000111010001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				state_d = 12'b000111010010;
			end
			12'b000111010010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				state_d = 12'b000111010011;
			end
			12'b000111010011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				state_d = 12'b001101000000;
			end
			12'b001101000000: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001101000001;
			end
			12'b001101000001: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001101000010;
			end
			12'b001101000010: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe20;
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
				state_d = 12'b001101000011;
			end
			12'b001101000011: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe24;
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
				state_d = 12'b001101000100;
			end
			12'b001101000100: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001101000101;
			end
			12'b001101000101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe1c;
				rf_raddr_a_o = 5'd14;
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
				state_d = 12'b001101000110;
			end
			12'b001101000110: begin
				alu_operand_b_ex_o = 32'h00011000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001101000111;
			end
			12'b001101000111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe18;
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
				state_d = 12'b001101001000;
			end
			12'b001101001000: begin
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
				state_d = 12'b001101001001;
			end
			12'b001101001001: begin
				alu_operator_ex_o = 7'd2;
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
				state_d = 12'b001101001010;
			end
			12'b001101001010: begin
				alu_operator_ex_o = 7'd2;
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
				state_d = 12'b001101001011;
			end
			12'b001101001011: begin
				alu_operator_ex_o = 7'd2;
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
				state_d = 12'b001101001100;
			end
			12'b001101001100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b001101001101;
			end
			12'b001101001101: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b011110000000: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			12'b011100000000: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011100000001;
			end
			12'b011100000001: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011100000010;
			end
			12'b011100000010: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b001100000000;
			end
			12'b101100000000: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101100000001;
			end
			12'b101100000001: begin
				alu_operand_b_ex_o = 32'h00000042;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b101100000010;
			end
			12'b101100000010: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12'b001100000000;
			end
			12'b011001000000: begin
				alu_operand_b_ex_o = 32'hcc099000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011001000001;
			end
			12'b011001000001: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffc4c;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 12'b011001000010;
			end
			12'b011001000010: begin
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
				state_d = 12'b011001000011;
			end
			12'b011001000011: begin
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
				state_d = 12'b011001000100;
			end
			12'b011001000100: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[11:0];
			end
			default: state_d = 12'b100000000000;
		endcase
	end
	assign ctrl_busy_o = state_q != 12'b011001000100;
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
