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
	reg [8:0] state_q;
	reg [8:0] state_d;
	wire [31:0] rf_rdata_a;
	wire [31:0] rf_rdata_b;
	assign rf_rdata_a = rf_rdata_a_i;
	assign rf_rdata_b = rf_rdata_b_i;
	(* dont_touch = "yes" *) reg [8:0] state_q_prev;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			state_q_prev <= 9'd0;
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
			state_q <= 9'd0;
		else if ((((ready_wb_i && ex_valid_i) && !((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 9'd7) || (state_q == 9'd13)) || (state_q == 9'd20)) || (state_q == 9'd22)) || (state_q == 9'd24)) || (state_q == 9'd29)) || (state_q == 9'd38)) || (state_q == 9'd42)) || (state_q == 9'd50)) || (state_q == 9'd51)) || (state_q == 9'd52)) || (state_q == 9'd56)) || (state_q == 9'd58)) || (state_q == 9'd66)) || (state_q == 9'd68)) || (state_q == 9'd74)) || (state_q == 9'd75)) || (state_q == 9'd77)) || (state_q == 9'd84)) || (state_q == 9'd85)) || (state_q == 9'd90)) || (state_q == 9'd92)) || (state_q == 9'd100)) || (state_q == 9'd102)) || (state_q == 9'd103)) || (state_q == 9'd108)) || (state_q == 9'd111)) || (state_q == 9'd112)) || (state_q == 9'd120)) || (state_q == 9'd123)) || (state_q == 9'd125)) || (state_q == 9'd126)) || (state_q == 9'd127)) || (state_q == 9'd130)) || (state_q == 9'd131)) || (state_q == 9'd132)) || (state_q == 9'd145)) || (state_q == 9'd146)) || (state_q == 9'd147)) || (state_q == 9'd148)) || (state_q == 9'd153)) || (state_q == 9'd157)) || (state_q == 9'd158)) || (state_q == 9'd159)) || (state_q == 9'd160)) || (state_q == 9'd161)) || (state_q == 9'd162)) || (state_q == 9'd163)) || (state_q == 9'd164)) || (state_q == 9'd165)) || (state_q == 9'd166)) || (state_q == 9'd167)) || (state_q == 9'd181)) || (state_q == 9'd189)) || (state_q == 9'd191)) || (state_q == 9'd202)) || (state_q == 9'd204)) || (state_q == 9'd210)) || (state_q == 9'd219)) || (state_q == 9'd225)) || (state_q == 9'd227)) || (state_q == 9'd239)) || (state_q == 9'd242)) || (state_q == 9'd243)) || (state_q == 9'd244)) || (state_q == 9'd245)) || (state_q == 9'd246)) || (state_q == 9'd247)) || (state_q == 9'd248)) || (state_q == 9'd249)) || (state_q == 9'd250)) || (state_q == 9'd251)) || (state_q == 9'd252)) || (state_q == 9'd254)) || (state_q == 9'd255)) || (state_q == 9'd259)) || (state_q == 9'd265)) || (state_q == 9'd268))) || ((((((((((((((((((((((((((((((((((((((((state_q == 9'd7) || (state_q == 9'd13)) || (state_q == 9'd20)) || (state_q == 9'd38)) || (state_q == 9'd42)) || (state_q == 9'd50)) || (state_q == 9'd51)) || (state_q == 9'd52)) || (state_q == 9'd75)) || (state_q == 9'd77)) || (state_q == 9'd85)) || (state_q == 9'd90)) || (state_q == 9'd92)) || (state_q == 9'd100)) || (state_q == 9'd108)) || (state_q == 9'd111)) || (state_q == 9'd112)) || (state_q == 9'd123)) || (state_q == 9'd145)) || (state_q == 9'd146)) || (state_q == 9'd147)) || (state_q == 9'd148)) || (state_q == 9'd153)) || (state_q == 9'd157)) || (state_q == 9'd158)) || (state_q == 9'd159)) || (state_q == 9'd160)) || (state_q == 9'd161)) || (state_q == 9'd162)) || (state_q == 9'd163)) || (state_q == 9'd164)) || (state_q == 9'd165)) || (state_q == 9'd166)) || (state_q == 9'd167)) || (state_q == 9'd189)) || (state_q == 9'd191)) || (state_q == 9'd202)) || (state_q == 9'd204)) && lsu_resp_valid_i) && !first_cycle)) || ((((((((((((((((((((((((((((((((((((((((((state_q == 9'd22) || (state_q == 9'd24)) || (state_q == 9'd29)) || (state_q == 9'd56)) || (state_q == 9'd58)) || (state_q == 9'd66)) || (state_q == 9'd68)) || (state_q == 9'd74)) || (state_q == 9'd84)) || (state_q == 9'd102)) || (state_q == 9'd103)) || (state_q == 9'd120)) || (state_q == 9'd125)) || (state_q == 9'd126)) || (state_q == 9'd127)) || (state_q == 9'd130)) || (state_q == 9'd131)) || (state_q == 9'd132)) || (state_q == 9'd181)) || (state_q == 9'd210)) || (state_q == 9'd219)) || (state_q == 9'd225)) || (state_q == 9'd227)) || (state_q == 9'd239)) || (state_q == 9'd242)) || (state_q == 9'd243)) || (state_q == 9'd244)) || (state_q == 9'd245)) || (state_q == 9'd246)) || (state_q == 9'd247)) || (state_q == 9'd248)) || (state_q == 9'd249)) || (state_q == 9'd250)) || (state_q == 9'd251)) || (state_q == 9'd252)) || (state_q == 9'd254)) || (state_q == 9'd255)) || (state_q == 9'd259)) || (state_q == 9'd265)) || (state_q == 9'd268)) && lsu_resp_valid_i) && !first_cycle))
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
			9'd0: begin
				alu_operand_b_ex_o = 32'h00020000;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd1;
			end
			9'd1: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd2;
			end
			9'd2: begin
				alu_operand_a_ex_o = 32'h00000088;
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd3;
			end
			9'd3: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffff78;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd4;
			end
			9'd4: begin
				alu_operand_a_ex_o = 32'h00000090;
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd5;
			end
			9'd5: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000002a4;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd6;
			end
			9'd6: begin
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
					state_d = 9'd10;
				else
					state_d = 9'd7;
			end
			9'd7: begin
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
				state_d = 9'd8;
			end
			9'd8: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd9;
			end
			9'd9: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd6;
			end
			9'd10: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd12;
			end
			9'd11: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd11;
			end
			9'd12: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffe0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd13;
			end
			9'd13: begin
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
				state_d = 9'd14;
			end
			9'd14: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd139;
			end
			9'd15: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000010;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd278;
			end
			9'd16: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd17;
			end
			9'd17: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000012;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd272;
			end
			9'd18: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000013;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd140;
			end
			9'd19: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000014;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd275;
			end
			9'd20: begin
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
				state_d = 9'd21;
			end
			9'd21: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000016;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd142;
			end
			9'd22: begin
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
				state_d = 9'd23;
			end
			9'd23: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000018;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd279;
			end
			9'd24: begin
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
				state_d = 9'd25;
			end
			9'd25: begin
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
				state_d = 9'd26;
			end
			9'd26: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd27;
			end
			9'd27: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd28: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd29;
			end
			9'd29: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000330;
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
				state_d = 9'd30;
			end
			9'd30: begin
				alu_operand_b_ex_o = 32'h41c65000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd31;
			end
			9'd31: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe6d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd32;
			end
			9'd32: begin
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
				state_d = 9'd33;
			end
			9'd33: begin
				alu_operand_b_ex_o = 32'h00003000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd34;
			end
			9'd34: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000039;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd35;
			end
			9'd35: begin
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
				state_d = 9'd36;
			end
			9'd36: begin
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
				state_d = 9'd37;
			end
			9'd37: begin
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
				state_d = 9'd38;
			end
			9'd38: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000330;
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
				state_d = 9'd39;
			end
			9'd39: begin
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
				state_d = 9'd40;
			end
			9'd40: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd41: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd42;
			end
			9'd42: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000330;
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
				state_d = 9'd43;
			end
			9'd43: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd44: begin
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
				state_d = 9'd45;
			end
			9'd45: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd54;
				else
					state_d = 9'd46;
			end
			9'd46: begin
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
				state_d = 9'd47;
			end
			9'd47: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd48;
			end
			9'd48: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd49;
			end
			9'd49: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd50;
			end
			9'd50: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000328;
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
				state_d = 9'd51;
			end
			9'd51: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000032c;
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
				state_d = 9'd52;
			end
			9'd52: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000324;
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
				state_d = 9'd53;
			end
			9'd53: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd54: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd54;
			end
			9'd55: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd56;
			end
			9'd56: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000324;
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
				state_d = 9'd57;
			end
			9'd57: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd58;
			end
			9'd58: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000328;
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
				state_d = 9'd59;
			end
			9'd59: begin
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
				state_d = 9'd60;
			end
			9'd60: begin
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
				state_d = 9'd61;
			end
			9'd61: begin
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
				state_d = 9'd62;
			end
			9'd62: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd63: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd64;
			end
			9'd64: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd87;
				else
					state_d = 9'd65;
			end
			9'd65: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd66;
			end
			9'd66: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000032c;
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
				state_d = 9'd67;
			end
			9'd67: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd68;
			end
			9'd68: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000324;
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
				state_d = 9'd69;
			end
			9'd69: begin
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
				state_d = 9'd70;
			end
			9'd70: begin
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
				state_d = 9'd71;
			end
			9'd71: begin
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
				state_d = 9'd72;
			end
			9'd72: begin
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd79;
				else
					state_d = 9'd73;
			end
			9'd73: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd74;
			end
			9'd74: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000328;
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
				state_d = 9'd75;
			end
			9'd75: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000324;
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
				state_d = 9'd76;
			end
			9'd76: begin
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
					state_d = 9'd87;
				else
					state_d = 9'd77;
			end
			9'd77: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000032c;
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
				state_d = 9'd78;
			end
			9'd78: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd79: begin
				alu_operand_b_ex_o = 32'h00000004;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd80;
			end
			9'd80: begin
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
				state_d = 9'd81;
			end
			9'd81: begin
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
				state_d = 9'd82;
			end
			9'd82: begin
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
				state_d = 9'd83;
			end
			9'd83: begin
				alu_operand_b_ex_o = 32'h00012000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd84;
			end
			9'd84: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000328;
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
				state_d = 9'd85;
			end
			9'd85: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000324;
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
				state_d = 9'd86;
			end
			9'd86: begin
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
					state_d = 9'd77;
				else
					state_d = 9'd87;
			end
			9'd87: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd88;
			end
			9'd88: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd89: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd90;
			end
			9'd90: begin
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
				state_d = 9'd91;
			end
			9'd91: begin
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
				state_d = 9'd92;
			end
			9'd92: begin
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
				state_d = 9'd93;
			end
			9'd93: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd94;
			end
			9'd94: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd63;
			end
			9'd95: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd102;
				else
					state_d = 9'd96;
			end
			9'd96: begin
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd102;
				else
					state_d = 9'd97;
			end
			9'd97: begin
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
				state_d = 9'd98;
			end
			9'd98: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd99;
			end
			9'd99: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd100;
			end
			9'd100: begin
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
				state_d = 9'd101;
			end
			9'd101: begin
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
					state_d = 9'd99;
				else
					state_d = 9'd102;
			end
			9'd102: begin
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
				state_d = 9'd103;
			end
			9'd103: begin
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
				state_d = 9'd104;
			end
			9'd104: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd105;
			end
			9'd105: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd106: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd136;
				else
					state_d = 9'd107;
			end
			9'd107: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd108;
			end
			9'd108: begin
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
				state_d = 9'd109;
			end
			9'd109: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd110;
			end
			9'd110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd111;
			end
			9'd111: begin
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
				state_d = 9'd112;
			end
			9'd112: begin
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
				state_d = 9'd113;
			end
			9'd113: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd114;
			end
			9'd114: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h00000073;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd63;
			end
			9'd115: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd130;
				else
					state_d = 9'd116;
			end
			9'd116: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd117;
			end
			9'd117: begin
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
				state_d = 9'd118;
			end
			9'd118: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd119;
			end
			9'd119: begin
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd125;
				else
					state_d = 9'd120;
			end
			9'd120: begin
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
				state_d = 9'd121;
			end
			9'd121: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd122;
			end
			9'd122: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd123;
			end
			9'd123: begin
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
				state_d = 9'd124;
			end
			9'd124: begin
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
					state_d = 9'd120;
				else
					state_d = 9'd125;
			end
			9'd125: begin
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
				state_d = 9'd126;
			end
			9'd126: begin
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
				state_d = 9'd127;
			end
			9'd127: begin
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
				state_d = 9'd128;
			end
			9'd128: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd129;
			end
			9'd129: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd130: begin
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
				state_d = 9'd131;
			end
			9'd131: begin
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
				state_d = 9'd132;
			end
			9'd132: begin
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
				state_d = 9'd133;
			end
			9'd133: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd134;
			end
			9'd134: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd135;
			end
			9'd135: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd136: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd137;
			end
			9'd137: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd138: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd139: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd140: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd141;
			end
			9'd141: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd142: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd143;
			end
			9'd143: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd144: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffb0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd145;
			end
			9'd145: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
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
				state_d = 9'd146;
			end
			9'd146: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000004c;
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
				state_d = 9'd147;
			end
			9'd147: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000048;
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
				state_d = 9'd148;
			end
			9'd148: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
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
				state_d = 9'd149;
			end
			9'd149: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd150;
			end
			9'd150: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd265;
				else
					state_d = 9'd151;
			end
			9'd151: begin
				alu_operand_b_ex_o = 32'h00002000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd152;
			end
			9'd152: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd153;
			end
			9'd153: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
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
				state_d = 9'd154;
			end
			9'd154: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000323;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd155;
			end
			9'd155: begin
				alu_operand_b_ex_o = 32'h4ec4f000;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd156;
			end
			9'd156: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000424;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd157;
			end
			9'd157: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
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
				state_d = 9'd158;
			end
			9'd158: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
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
				state_d = 9'd159;
			end
			9'd159: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
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
				state_d = 9'd160;
			end
			9'd160: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000044;
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
				state_d = 9'd161;
			end
			9'd161: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
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
				state_d = 9'd162;
			end
			9'd162: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
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
				state_d = 9'd163;
			end
			9'd163: begin
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
				state_d = 9'd164;
			end
			9'd164: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
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
				state_d = 9'd165;
			end
			9'd165: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
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
				state_d = 9'd166;
			end
			9'd166: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
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
				state_d = 9'd167;
			end
			9'd167: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
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
				state_d = 9'd168;
			end
			9'd168: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffc4f;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd169;
			end
			9'd169: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd170;
			end
			9'd170: begin
				alu_operand_b_ex_o = 32'h00000030;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd171;
			end
			9'd171: begin
				alu_operand_b_ex_o = 32'h0000001a;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd172;
			end
			9'd172: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd173;
			end
			9'd173: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd174;
			end
			9'd174: begin
				alu_operand_b_ex_o = 32'h00002000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd175;
			end
			9'd175: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd176;
			end
			9'd176: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000324;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd177;
			end
			9'd177: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h000000b2;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd44;
			end
			9'd178: begin
				alu_operand_b_ex_o = 32'h00002000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd179;
			end
			9'd179: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000323;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd180;
			end
			9'd180: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h000000b5;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd63;
			end
			9'd181: begin
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
				state_d = 9'd182;
			end
			9'd182: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd183;
			end
			9'd183: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000005;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd184;
			end
			9'd184: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd185;
			end
			9'd185: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000101;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd186;
			end
			9'd186: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd187;
			end
			9'd187: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd188;
			end
			9'd188: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd189;
			end
			9'd189: begin
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
				state_d = 9'd190;
			end
			9'd190: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd188;
				else
					state_d = 9'd191;
			end
			9'd191: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffff9b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				state_d = 9'd192;
			end
			9'd192: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd193;
			end
			9'd193: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h000000c2;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd28;
			end
			9'd194: begin
				mult_en_ex_o = 1'b1;
				mult_sel_ex_o = 1'b1;
				multdiv_operator_ex_o = 2'd1;
				multdiv_signed_mode_ex_o = 2'b11;
				multdiv_operand_a_ex_o = rf_rdata_a;
				multdiv_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = ex_valid_i & ~first_cycle;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = ex_valid_i & ~first_cycle;
				instr_type_wb_o = 2'd2;
				state_d = 9'd195;
			end
			9'd195: begin
				alu_operator_ex_o = 7'd8;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001f;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd196;
			end
			9'd196: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd197;
			end
			9'd197: begin
				alu_operator_ex_o = 7'd8;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000003;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd198;
			end
			9'd198: begin
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
				state_d = 9'd199;
			end
			9'd199: begin
				mult_en_ex_o = 1'b1;
				mult_sel_ex_o = 1'b1;
				multdiv_operator_ex_o = 2'd0;
				multdiv_signed_mode_ex_o = 2'b00;
				multdiv_operand_a_ex_o = rf_rdata_a;
				multdiv_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = ex_valid_i & ~first_cycle;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = ex_valid_i & ~first_cycle;
				instr_type_wb_o = 2'd2;
				state_d = 9'd200;
			end
			9'd200: begin
				alu_operator_ex_o = 7'd1;
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
				state_d = 9'd201;
			end
			9'd201: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000041;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd202;
			end
			9'd202: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd25;
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
				state_d = 9'd203;
			end
			9'd203: begin
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd193;
				else
					state_d = 9'd204;
			end
			9'd204: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffff7b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd1;
				state_d = 9'd205;
			end
			9'd205: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000101;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd206;
			end
			9'd206: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000101;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd207;
			end
			9'd207: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000102;
				rf_raddr_a_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd208;
			end
			9'd208: begin
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd187;
				else
					state_d = 9'd209;
			end
			9'd209: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd210;
			end
			9'd210: begin
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
				state_d = 9'd211;
			end
			9'd211: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd212;
			end
			9'd212: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000616;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd213;
			end
			9'd213: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000111;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd214;
			end
			9'd214: begin
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
				state_d = 9'd215;
			end
			9'd215: begin
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
				state_d = 9'd216;
			end
			9'd216: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd217;
			end
			9'd217: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd218;
			end
			9'd218: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd219;
			end
			9'd219: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
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
				state_d = 9'd220;
			end
			9'd220: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd221;
			end
			9'd221: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd222;
			end
			9'd222: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd227;
				else
					state_d = 9'd223;
			end
			9'd223: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd259;
			end
			9'd224: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd231;
				else
					state_d = 9'd225;
			end
			9'd225: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd13;
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
				state_d = 9'd226;
			end
			9'd226: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd259;
				else
					state_d = 9'd227;
			end
			9'd227: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
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
				state_d = 9'd228;
			end
			9'd228: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd229;
			end
			9'd229: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd230;
			end
			9'd230: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd224;
				else
					state_d = 9'd231;
			end
			9'd231: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000101;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd232;
			end
			9'd232: begin
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd219;
				else
					state_d = 9'd233;
			end
			9'd233: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000101;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd234;
			end
			9'd234: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd218;
				else
					state_d = 9'd235;
			end
			9'd235: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd236;
			end
			9'd236: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd237;
			end
			9'd237: begin
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = 32'h000000ee;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				state_d = 9'd138;
			end
			9'd238: begin
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd173;
				else
					state_d = 9'd239;
			end
			9'd239: begin
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
				state_d = 9'd240;
			end
			9'd240: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd241;
			end
			9'd241: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd172;
				else
					state_d = 9'd242;
			end
			9'd242: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000044;
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
				state_d = 9'd243;
			end
			9'd243: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
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
				state_d = 9'd244;
			end
			9'd244: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
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
				state_d = 9'd245;
			end
			9'd245: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
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
				state_d = 9'd246;
			end
			9'd246: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
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
				state_d = 9'd247;
			end
			9'd247: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
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
				state_d = 9'd248;
			end
			9'd248: begin
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
				state_d = 9'd249;
			end
			9'd249: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
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
				state_d = 9'd250;
			end
			9'd250: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
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
				state_d = 9'd251;
			end
			9'd251: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
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
				state_d = 9'd252;
			end
			9'd252: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000004c;
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
				state_d = 9'd253;
			end
			9'd253: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffb;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd254;
			end
			9'd254: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000048;
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
				state_d = 9'd255;
			end
			9'd255: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
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
				state_d = 9'd256;
			end
			9'd256: begin
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
				state_d = 9'd257;
			end
			9'd257: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd258;
			end
			9'd258: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd259: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
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
				state_d = 9'd260;
			end
			9'd260: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 9'd231;
				else
					state_d = 9'd261;
			end
			9'd261: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000101;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd262;
			end
			9'd262: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd263;
			end
			9'd263: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd218;
				else
					state_d = 9'd264;
			end
			9'd264: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd235;
			end
			9'd265: begin
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
				state_d = 9'd266;
			end
			9'd266: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd267;
			end
			9'd267: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd252;
				else
					state_d = 9'd268;
			end
			9'd268: begin
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
				state_d = 9'd269;
			end
			9'd269: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd270;
			end
			9'd270: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 9'd265;
				else
					state_d = 9'd271;
			end
			9'd271: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd252;
			end
			9'd272: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd273;
			end
			9'd273: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd274;
			end
			9'd274: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd144;
			end
			9'd275: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd276;
			end
			9'd276: begin
				alu_operand_b_ex_o = 32'h0000002e;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd277;
			end
			9'd277: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 9'd144;
			end
			9'd278: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			9'd279: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
				state_d = 9'd280;
			end
			9'd280: begin
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
				state_d = 9'd281;
			end
			9'd281: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[8:0];
			end
			default: state_d = 9'd0;
		endcase
	end
	assign ctrl_busy_o = state_q != 9'd281;
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
