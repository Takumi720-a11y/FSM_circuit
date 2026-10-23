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
	reg [10:0] state_q;
	reg [10:0] state_d;
	wire [31:0] rf_rdata_a;
	wire [31:0] rf_rdata_b;
	assign rf_rdata_a = rf_rdata_a_i;
	assign rf_rdata_b = rf_rdata_b_i;
	(* dont_touch = "yes" *) wire first_cycle;
	(* dont_touch = "yes" *) reg [10:0] state_q_prev;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			state_q_prev <= 1'sb0;
		else
			state_q_prev <= state_q;
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
			state_q <= 1'sb0;
		else if ((((ready_wb_i && ex_valid_i) && !((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 7) || (state_q == 13)) || (state_q == 20)) || (state_q == 22)) || (state_q == 24)) || (state_q == 29)) || (state_q == 38)) || (state_q == 42)) || (state_q == 50)) || (state_q == 51)) || (state_q == 52)) || (state_q == 56)) || (state_q == 58)) || (state_q == 66)) || (state_q == 68)) || (state_q == 74)) || (state_q == 75)) || (state_q == 77)) || (state_q == 84)) || (state_q == 85)) || (state_q == 90)) || (state_q == 92)) || (state_q == 100)) || (state_q == 102)) || (state_q == 103)) || (state_q == 108)) || (state_q == 111)) || (state_q == 112)) || (state_q == 120)) || (state_q == 123)) || (state_q == 125)) || (state_q == 126)) || (state_q == 127)) || (state_q == 130)) || (state_q == 131)) || (state_q == 132)) || (state_q == 145)) || (state_q == 153)) || (state_q == 156)) || (state_q == 162)) || (state_q == 163)) || (state_q == 164)) || (state_q == 165)) || (state_q == 166)) || (state_q == 169)) || (state_q == 172)) || (state_q == 174)) || (state_q == 178)) || (state_q == 181)) || (state_q == 185)) || (state_q == 188)) || (state_q == 195)) || (state_q == 196)) || (state_q == 197)) || (state_q == 198)) || (state_q == 199)) || (state_q == 202)) || (state_q == 203)) || (state_q == 206)) || (state_q == 210)) || (state_q == 213)) || (state_q == 216)) || (state_q == 220)) || (state_q == 221)) || (state_q == 222)) || (state_q == 225)) || (state_q == 228)) || (state_q == 238)) || (state_q == 239)) || (state_q == 240)) || (state_q == 241)) || (state_q == 244)) || (state_q == 248)) || (state_q == 253)) || (state_q == 254)) || (state_q == 255)) || (state_q == 258)) || (state_q == 261)) || (state_q == 266)) || (state_q == 267)) || (state_q == 268)) || (state_q == 273)) || (state_q == 274)) || (state_q == 275)) || (state_q == 280)) || (state_q == 281)) || (state_q == 282)) || (state_q == 288)) || (state_q == 289)) || (state_q == 290)) || (state_q == 291)) || (state_q == 294)) || (state_q == 298)) || (state_q == 299)) || (state_q == 300)) || (state_q == 303)) || (state_q == 308)) || (state_q == 309)) || (state_q == 310)) || (state_q == 315)) || (state_q == 316)) || (state_q == 317)) || (state_q == 320)) || (state_q == 322)) || (state_q == 327)) || (state_q == 328)) || (state_q == 329)) || (state_q == 332)) || (state_q == 334)) || (state_q == 339)) || (state_q == 340)) || (state_q == 341)) || (state_q == 344)) || (state_q == 348)) || (state_q == 349)) || (state_q == 350)) || (state_q == 353)) || (state_q == 357)) || (state_q == 358)) || (state_q == 359)) || (state_q == 365)) || (state_q == 369)) || (state_q == 370)) || (state_q == 374)) || (state_q == 375)) || (state_q == 377)) || (state_q == 379)) || (state_q == 380)) || (state_q == 387)) || (state_q == 391)) || (state_q == 397)) || (state_q == 398)) || (state_q == 399)) || (state_q == 400)) || (state_q == 401)) || (state_q == 402)) || (state_q == 403)) || (state_q == 404)) || (state_q == 407)) || (state_q == 411)) || (state_q == 415)) || (state_q == 416)) || (state_q == 422)) || (state_q == 423)) || (state_q == 424)) || (state_q == 425)) || (state_q == 428)) || (state_q == 431)) || (state_q == 439)) || (state_q == 444)) || (state_q == 445)) || (state_q == 446)) || (state_q == 449)) || (state_q == 452)) || (state_q == 455)) || (state_q == 456)) || (state_q == 457)) || (state_q == 459)) || (state_q == 460)) || (state_q == 461)) || (state_q == 464)) || (state_q == 467)) || (state_q == 470)) || (state_q == 473)) || (state_q == 479)) || (state_q == 480)) || (state_q == 481)) || (state_q == 482)) || (state_q == 483)) || (state_q == 486)) || (state_q == 494)) || (state_q == 498)) || (state_q == 499)) || (state_q == 500)) || (state_q == 503)) || (state_q == 504)) || (state_q == 507)) || (state_q == 510)) || (state_q == 513)) || (state_q == 520)) || (state_q == 521)) || (state_q == 522)) || (state_q == 523)) || (state_q == 524)) || (state_q == 527)) || (state_q == 531)) || (state_q == 532)) || (state_q == 533)) || (state_q == 536)) || (state_q == 541)) || (state_q == 542)) || (state_q == 543)) || (state_q == 546)) || (state_q == 549)) || (state_q == 556)) || (state_q == 557)) || (state_q == 558)) || (state_q == 559)) || (state_q == 560)) || (state_q == 563)) || (state_q == 566)) || (state_q == 570)) || (state_q == 574)) || (state_q == 577)) || (state_q == 582)) || (state_q == 583)) || (state_q == 587)) || (state_q == 591)) || (state_q == 592)) || (state_q == 593)) || (state_q == 596)) || (state_q == 597)) || (state_q == 600)) || (state_q == 603)) || (state_q == 608)) || (state_q == 609)) || (state_q == 610)) || (state_q == 613)) || (state_q == 614)) || (state_q == 619)) || (state_q == 620)) || (state_q == 621)) || (state_q == 625)) || (state_q == 626)) || (state_q == 630)) || (state_q == 634)) || (state_q == 635)) || (state_q == 636)) || (state_q == 637)) || (state_q == 640)) || (state_q == 643)) || (state_q == 646)) || (state_q == 653)) || (state_q == 654)) || (state_q == 655)) || (state_q == 656)) || (state_q == 657)) || (state_q == 658)) || (state_q == 661)) || (state_q == 664)) || (state_q == 671)) || (state_q == 672)) || (state_q == 673)) || (state_q == 674)) || (state_q == 675)) || (state_q == 678)) || (state_q == 681)) || (state_q == 684)) || (state_q == 692)) || (state_q == 693)) || (state_q == 694)) || (state_q == 695)) || (state_q == 700)) || (state_q == 701)) || (state_q == 702)) || (state_q == 705)) || (state_q == 709)) || (state_q == 710)) || (state_q == 713)) || (state_q == 716)) || (state_q == 719)) || (state_q == 722)) || (state_q == 725)) || (state_q == 731)) || (state_q == 732)) || (state_q == 733)) || (state_q == 736)) || (state_q == 739)) || (state_q == 742)) || (state_q == 749)) || (state_q == 750)) || (state_q == 751)) || (state_q == 752)) || (state_q == 755)) || (state_q == 758)) || (state_q == 761)) || (state_q == 762)) || (state_q == 765)) || (state_q == 768)) || (state_q == 773)) || (state_q == 774)) || (state_q == 775)) || (state_q == 776)) || (state_q == 779)) || (state_q == 782)) || (state_q == 786)) || (state_q == 789)) || (state_q == 792)) || (state_q == 795)) || (state_q == 801)) || (state_q == 802)) || (state_q == 803)) || (state_q == 804)) || (state_q == 805)) || (state_q == 806)) || (state_q == 807)) || (state_q == 808)) || (state_q == 810)) || (state_q == 811)) || (state_q == 818)) || (state_q == 819)) || (state_q == 820)) || (state_q == 821)) || (state_q == 822)) || (state_q == 823)) || (state_q == 825)) || (state_q == 828)) || (state_q == 834)) || (state_q == 835)) || (state_q == 836)) || (state_q == 837)) || (state_q == 838)) || (state_q == 839)) || (state_q == 840)) || (state_q == 841)) || (state_q == 843)) || (state_q == 844)) || (state_q == 851)) || (state_q == 852)) || (state_q == 853)) || (state_q == 854)) || (state_q == 855)) || (state_q == 856)) || (state_q == 859)) || (state_q == 862)) || (state_q == 865)) || (state_q == 866)) || (state_q == 867)) || (state_q == 871)) || (state_q == 873)) || (state_q == 876)) || (state_q == 879)) || (state_q == 882)) || (state_q == 883)) || (state_q == 885)) || (state_q == 888)) || (state_q == 891)) || (state_q == 892)) || (state_q == 894)) || (state_q == 897)) || (state_q == 900)) || (state_q == 901)) || (state_q == 903)) || (state_q == 906)) || (state_q == 908)) || (state_q == 910)) || (state_q == 913)) || (state_q == 915)) || (state_q == 916)) || (state_q == 920)) || (state_q == 921)) || (state_q == 924)) || (state_q == 926)) || (state_q == 929)) || (state_q == 931)) || (state_q == 933)) || (state_q == 936)) || (state_q == 953)) || (state_q == 954)) || (state_q == 957)) || (state_q == 958)) || (state_q == 961)) || (state_q == 962)) || (state_q == 963)) || (state_q == 964)) || (state_q == 965)) || (state_q == 966)) || (state_q == 967)) || (state_q == 968)) || (state_q == 969)) || (state_q == 970)) || (state_q == 971)) || (state_q == 972)) || (state_q == 973)) || (state_q == 974)) || (state_q == 975)) || (state_q == 978)) || (state_q == 984)) || (state_q == 987)) || (state_q == 989)) || (state_q == 991)) || (state_q == 992)) || (state_q == 996)) || (state_q == 999)) || (state_q == 1005)) || (state_q == 1006)) || (state_q == 1009)) || (state_q == 1012)) || (state_q == 1013)) || (state_q == 1016)) || (state_q == 1019)) || (state_q == 1022)) || (state_q == 1025)) || (state_q == 1030)) || (state_q == 1031)) || (state_q == 1032)) || (state_q == 1036)) || (state_q == 1039)) || (state_q == 1045)) || (state_q == 1048)) || (state_q == 1051)) || (state_q == 1054)) || (state_q == 1057)) || (state_q == 1067)) || (state_q == 1068)) || (state_q == 1069)) || (state_q == 1070)) || (state_q == 1071)) || (state_q == 1073)) || (state_q == 1075)) || (state_q == 1077)) || (state_q == 1080)) || (state_q == 1081)) || (state_q == 1085)) || (state_q == 1086)) || (state_q == 1096)) || (state_q == 1097)) || (state_q == 1098)) || (state_q == 1099)) || (state_q == 1100)) || (state_q == 1101)) || (state_q == 1102)) || (state_q == 1107)) || (state_q == 1108)) || (state_q == 1109)) || (state_q == 1112)) || (state_q == 1113)) || (state_q == 1117)) || (state_q == 1120)) || (state_q == 1121)) || (state_q == 1124)) || (state_q == 1126)) || (state_q == 1132)) || (state_q == 1133)) || (state_q == 1134)) || (state_q == 1137)) || (state_q == 1140)) || (state_q == 1142)) || (state_q == 1144)) || (state_q == 1147)) || (state_q == 1148)) || (state_q == 1149)) || (state_q == 1150)) || (state_q == 1151)) || (state_q == 1152)) || (state_q == 1153)) || (state_q == 1154)) || (state_q == 1155)) || (state_q == 1156)) || (state_q == 1157)) || (state_q == 1158)) || (state_q == 1160)) || (state_q == 1161)) || (state_q == 1164)) || (state_q == 1165)) || (state_q == 1167)) || (state_q == 1168)) || (state_q == 1169)) || (state_q == 1170)) || (state_q == 1172)) || (state_q == 1174)) || (state_q == 1189)) || (state_q == 1190)) || (state_q == 1192)) || (state_q == 1199)) || (state_q == 1202)) || (state_q == 1205)) || (state_q == 1207)) || (state_q == 1210)) || (state_q == 1214)) || (state_q == 1217)) || (state_q == 1220)) || (state_q == 1221)) || (state_q == 1226)) || (state_q == 1228)) || (state_q == 1229)) || (state_q == 1232)) || (state_q == 1233)) || (state_q == 1234)) || (state_q == 1235)) || (state_q == 1236)) || (state_q == 1237)) || (state_q == 1238)) || (state_q == 1241)) || (state_q == 1243)) || (state_q == 1246)) || (state_q == 1247)) || (state_q == 1248)) || (state_q == 1249)) || (state_q == 1250)) || (state_q == 1251)) || (state_q == 1252)) || (state_q == 1255)) || (state_q == 1256)) || (state_q == 1259)) || (state_q == 1260)) || (state_q == 1261)) || (state_q == 1262)) || (state_q == 1263)) || (state_q == 1264)) || (state_q == 1271)) || (state_q == 1272)) || (state_q == 1273)) || (state_q == 1274)) || (state_q == 1275)) || (state_q == 1277)) || (state_q == 1282)) || (state_q == 1283)) || (state_q == 1284)) || (state_q == 1285)) || (state_q == 1286)) || (state_q == 1290)) || (state_q == 1291)) || (state_q == 1292)) || (state_q == 1294)) || (state_q == 1296)) || (state_q == 1297)) || (state_q == 1298)) || (state_q == 1299)) || (state_q == 1300)) || (state_q == 1301)) || (state_q == 1302)) || (state_q == 1303)) || (state_q == 1304)) || (state_q == 1305)) || (state_q == 1313)) || (state_q == 1316)) || (state_q == 1317)) || (state_q == 1319)) || (state_q == 1320)) || (state_q == 1321)) || (state_q == 1325)) || (state_q == 1326)) || (state_q == 1327)) || (state_q == 1328)) || (state_q == 1329)) || (state_q == 1330)) || (state_q == 1332)) || (state_q == 1333)) || (state_q == 1337)) || (state_q == 1338)) || (state_q == 1339)) || (state_q == 1340)) || (state_q == 1341)) || (state_q == 1342)) || (state_q == 1343)) || (state_q == 1344)) || (state_q == 1345)) || (state_q == 1346)) || (state_q == 1350)) || (state_q == 1352)) || (state_q == 1355)) || (state_q == 1356)) || (state_q == 1357)) || (state_q == 1364)) || (state_q == 1365)) || (state_q == 1366)) || (state_q == 1367)) || (state_q == 1368)) || (state_q == 1369)) || (state_q == 1370)) || (state_q == 1372)) || (state_q == 1374)) || (state_q == 1375)) || (state_q == 1376)) || (state_q == 1377)) || (state_q == 1378)) || (state_q == 1379)) || (state_q == 1380)) || (state_q == 1381)) || (state_q == 1382)) || (state_q == 1383)) || (state_q == 1384)) || (state_q == 1388)) || (state_q == 1389)) || (state_q == 1392)) || (state_q == 1393)) || (state_q == 1396)) || (state_q == 1397)) || (state_q == 1399)) || (state_q == 1400)) || (state_q == 1401)) || (state_q == 1404)) || (state_q == 1405)) || (state_q == 1409)) || (state_q == 1410)) || (state_q == 1411)) || (state_q == 1412)) || (state_q == 1413)) || (state_q == 1414)) || (state_q == 1415)) || (state_q == 1417)) || (state_q == 1418)) || (state_q == 1421)) || (state_q == 1422)) || (state_q == 1424)) || (state_q == 1425)) || (state_q == 1426)) || (state_q == 1427)) || (state_q == 1428)) || (state_q == 1429)) || (state_q == 1431)) || (state_q == 1432)) || (state_q == 1433)) || (state_q == 1434)) || (state_q == 1435)) || (state_q == 1436)) || (state_q == 1438)) || (state_q == 1440)) || (state_q == 1442)) || (state_q == 1444)) || (state_q == 1446)) || (state_q == 1448)) || (state_q == 1450)) || (state_q == 1452)) || (state_q == 1455)) || (state_q == 1456)) || (state_q == 1459)) || (state_q == 1460)) || (state_q == 1462)) || (state_q == 1465)) || (state_q == 1466)) || (state_q == 1468)) || (state_q == 1470)) || (state_q == 1472)) || (state_q == 1475)) || (state_q == 1476)) || (state_q == 1478)) || (state_q == 1481)) || (state_q == 1482)) || (state_q == 1484)) || (state_q == 1487)) || (state_q == 1488)) || (state_q == 1490)) || (state_q == 1492)) || (state_q == 1494)) || (state_q == 1496)) || (state_q == 1498)) || (state_q == 1500)) || (state_q == 1502)) || (state_q == 1504)) || (state_q == 1506)) || (state_q == 1508)) || (state_q == 1510)) || (state_q == 1511)) || (state_q == 1512)) || (state_q == 1515)) || (state_q == 1522)) || (state_q == 1525)) || (state_q == 1528)) || (state_q == 1531)) || (state_q == 1535)) || (state_q == 1536)) || (state_q == 1538)) || (state_q == 1540)) || (state_q == 1542)) || (state_q == 1543)) || (state_q == 1545)) || (state_q == 1548)) || (state_q == 1551)) || (state_q == 1554)) || (state_q == 1557)) || (state_q == 1560)) || (state_q == 1563)) || (state_q == 1566)) || (state_q == 1569)) || (state_q == 1571)) || (state_q == 1573)) || (state_q == 1575)) || (state_q == 1578)) || (state_q == 1582)) || (state_q == 1585)) || (state_q == 1587)) || (state_q == 1589)) || (state_q == 1590)) || (state_q == 1591)) || (state_q == 1592)) || (state_q == 1593)) || (state_q == 1594)) || (state_q == 1595)) || (state_q == 1596)) || (state_q == 1597)) || (state_q == 1598)) || (state_q == 1599)) || (state_q == 1600)) || (state_q == 1601)) || (state_q == 1606)) || (state_q == 1607)) || (state_q == 1610)) || (state_q == 1611)) || (state_q == 1612)) || (state_q == 1613)) || (state_q == 1614)) || (state_q == 1622)) || (state_q == 1632)) || (state_q == 1633)) || (state_q == 1634)) || (state_q == 1635)) || (state_q == 1636)) || (state_q == 1637)) || (state_q == 1638)) || (state_q == 1649)) || (state_q == 1651)) || (state_q == 1660)) || (state_q == 1661)) || (state_q == 1662)) || (state_q == 1663)) || (state_q == 1664)) || (state_q == 1665)) || (state_q == 1666)) || (state_q == 1667)) || (state_q == 1668)) || (state_q == 1669)) || (state_q == 1670)) || (state_q == 1671)) || (state_q == 1672)) || (state_q == 1673)) || (state_q == 1674)) || (state_q == 1675)) || (state_q == 1680)) || (state_q == 1681)) || (state_q == 1690)) || (state_q == 1691)) || (state_q == 1693)) || (state_q == 1699)) || (state_q == 1703)) || (state_q == 1707)) || (state_q == 1711)) || (state_q == 1714)) || (state_q == 1717)) || (state_q == 1721)) || (state_q == 1722)) || (state_q == 1724)) || (state_q == 1726)) || (state_q == 1729)) || (state_q == 1732)) || (state_q == 1735)) || (state_q == 1738)) || (state_q == 1740)) || (state_q == 1747))) || ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 7) || (state_q == 13)) || (state_q == 20)) || (state_q == 38)) || (state_q == 42)) || (state_q == 50)) || (state_q == 51)) || (state_q == 52)) || (state_q == 75)) || (state_q == 77)) || (state_q == 85)) || (state_q == 90)) || (state_q == 92)) || (state_q == 100)) || (state_q == 108)) || (state_q == 111)) || (state_q == 112)) || (state_q == 123)) || (state_q == 162)) || (state_q == 163)) || (state_q == 164)) || (state_q == 165)) || (state_q == 166)) || (state_q == 195)) || (state_q == 196)) || (state_q == 197)) || (state_q == 198)) || (state_q == 199)) || (state_q == 202)) || (state_q == 203)) || (state_q == 210)) || (state_q == 220)) || (state_q == 221)) || (state_q == 222)) || (state_q == 238)) || (state_q == 239)) || (state_q == 240)) || (state_q == 241)) || (state_q == 253)) || (state_q == 254)) || (state_q == 255)) || (state_q == 266)) || (state_q == 267)) || (state_q == 268)) || (state_q == 273)) || (state_q == 274)) || (state_q == 275)) || (state_q == 280)) || (state_q == 281)) || (state_q == 282)) || (state_q == 288)) || (state_q == 289)) || (state_q == 290)) || (state_q == 291)) || (state_q == 298)) || (state_q == 299)) || (state_q == 300)) || (state_q == 308)) || (state_q == 309)) || (state_q == 310)) || (state_q == 315)) || (state_q == 316)) || (state_q == 317)) || (state_q == 327)) || (state_q == 328)) || (state_q == 329)) || (state_q == 339)) || (state_q == 340)) || (state_q == 341)) || (state_q == 348)) || (state_q == 349)) || (state_q == 350)) || (state_q == 357)) || (state_q == 358)) || (state_q == 359)) || (state_q == 369)) || (state_q == 374)) || (state_q == 375)) || (state_q == 379)) || (state_q == 380)) || (state_q == 397)) || (state_q == 398)) || (state_q == 399)) || (state_q == 400)) || (state_q == 403)) || (state_q == 404)) || (state_q == 422)) || (state_q == 423)) || (state_q == 424)) || (state_q == 425)) || (state_q == 444)) || (state_q == 445)) || (state_q == 446)) || (state_q == 455)) || (state_q == 459)) || (state_q == 460)) || (state_q == 461)) || (state_q == 479)) || (state_q == 480)) || (state_q == 481)) || (state_q == 482)) || (state_q == 483)) || (state_q == 498)) || (state_q == 499)) || (state_q == 500)) || (state_q == 503)) || (state_q == 504)) || (state_q == 520)) || (state_q == 521)) || (state_q == 522)) || (state_q == 523)) || (state_q == 524)) || (state_q == 531)) || (state_q == 532)) || (state_q == 533)) || (state_q == 541)) || (state_q == 542)) || (state_q == 543)) || (state_q == 556)) || (state_q == 557)) || (state_q == 558)) || (state_q == 559)) || (state_q == 560)) || (state_q == 591)) || (state_q == 592)) || (state_q == 593)) || (state_q == 596)) || (state_q == 597)) || (state_q == 608)) || (state_q == 609)) || (state_q == 610)) || (state_q == 613)) || (state_q == 614)) || (state_q == 619)) || (state_q == 620)) || (state_q == 621)) || (state_q == 634)) || (state_q == 635)) || (state_q == 636)) || (state_q == 637)) || (state_q == 653)) || (state_q == 654)) || (state_q == 655)) || (state_q == 656)) || (state_q == 657)) || (state_q == 658)) || (state_q == 671)) || (state_q == 672)) || (state_q == 673)) || (state_q == 674)) || (state_q == 675)) || (state_q == 692)) || (state_q == 693)) || (state_q == 694)) || (state_q == 695)) || (state_q == 700)) || (state_q == 701)) || (state_q == 702)) || (state_q == 709)) || (state_q == 710)) || (state_q == 731)) || (state_q == 732)) || (state_q == 733)) || (state_q == 749)) || (state_q == 750)) || (state_q == 751)) || (state_q == 752)) || (state_q == 761)) || (state_q == 762)) || (state_q == 773)) || (state_q == 774)) || (state_q == 775)) || (state_q == 776)) || (state_q == 801)) || (state_q == 802)) || (state_q == 803)) || (state_q == 804)) || (state_q == 805)) || (state_q == 806)) || (state_q == 807)) || (state_q == 808)) || (state_q == 811)) || (state_q == 818)) || (state_q == 819)) || (state_q == 820)) || (state_q == 821)) || (state_q == 822)) || (state_q == 823)) || (state_q == 834)) || (state_q == 835)) || (state_q == 836)) || (state_q == 837)) || (state_q == 838)) || (state_q == 839)) || (state_q == 840)) || (state_q == 841)) || (state_q == 844)) || (state_q == 851)) || (state_q == 852)) || (state_q == 853)) || (state_q == 854)) || (state_q == 855)) || (state_q == 856)) || (state_q == 865)) || (state_q == 866)) || (state_q == 867)) || (state_q == 882)) || (state_q == 883)) || (state_q == 891)) || (state_q == 892)) || (state_q == 900)) || (state_q == 901)) || (state_q == 908)) || (state_q == 915)) || (state_q == 926)) || (state_q == 931)) || (state_q == 933)) || (state_q == 953)) || (state_q == 954)) || (state_q == 957)) || (state_q == 958)) || (state_q == 961)) || (state_q == 962)) || (state_q == 963)) || (state_q == 964)) || (state_q == 965)) || (state_q == 966)) || (state_q == 967)) || (state_q == 968)) || (state_q == 969)) || (state_q == 970)) || (state_q == 971)) || (state_q == 972)) || (state_q == 973)) || (state_q == 974)) || (state_q == 975)) || (state_q == 991)) || (state_q == 992)) || (state_q == 1006)) || (state_q == 1012)) || (state_q == 1013)) || (state_q == 1030)) || (state_q == 1031)) || (state_q == 1032)) || (state_q == 1067)) || (state_q == 1068)) || (state_q == 1069)) || (state_q == 1070)) || (state_q == 1071)) || (state_q == 1077)) || (state_q == 1080)) || (state_q == 1081)) || (state_q == 1096)) || (state_q == 1097)) || (state_q == 1098)) || (state_q == 1099)) || (state_q == 1100)) || (state_q == 1101)) || (state_q == 1102)) || (state_q == 1107)) || (state_q == 1108)) || (state_q == 1109)) || (state_q == 1113)) || (state_q == 1120)) || (state_q == 1121)) || (state_q == 1132)) || (state_q == 1133)) || (state_q == 1134)) || (state_q == 1142)) || (state_q == 1147)) || (state_q == 1148)) || (state_q == 1149)) || (state_q == 1150)) || (state_q == 1151)) || (state_q == 1152)) || (state_q == 1153)) || (state_q == 1154)) || (state_q == 1155)) || (state_q == 1156)) || (state_q == 1157)) || (state_q == 1158)) || (state_q == 1174)) || (state_q == 1190)) || (state_q == 1192)) || (state_q == 1205)) || (state_q == 1207)) || (state_q == 1210)) || (state_q == 1214)) || (state_q == 1217)) || (state_q == 1220)) || (state_q == 1221)) || (state_q == 1226)) || (state_q == 1228)) || (state_q == 1229)) || (state_q == 1232)) || (state_q == 1233)) || (state_q == 1234)) || (state_q == 1235)) || (state_q == 1236)) || (state_q == 1237)) || (state_q == 1238)) || (state_q == 1243)) || (state_q == 1246)) || (state_q == 1255)) || (state_q == 1256)) || (state_q == 1259)) || (state_q == 1260)) || (state_q == 1261)) || (state_q == 1262)) || (state_q == 1263)) || (state_q == 1264)) || (state_q == 1292)) || (state_q == 1294)) || (state_q == 1296)) || (state_q == 1297)) || (state_q == 1298)) || (state_q == 1299)) || (state_q == 1300)) || (state_q == 1301)) || (state_q == 1302)) || (state_q == 1303)) || (state_q == 1304)) || (state_q == 1305)) || (state_q == 1332)) || (state_q == 1333)) || (state_q == 1337)) || (state_q == 1338)) || (state_q == 1339)) || (state_q == 1340)) || (state_q == 1341)) || (state_q == 1342)) || (state_q == 1343)) || (state_q == 1344)) || (state_q == 1345)) || (state_q == 1346)) || (state_q == 1372)) || (state_q == 1374)) || (state_q == 1375)) || (state_q == 1376)) || (state_q == 1377)) || (state_q == 1378)) || (state_q == 1379)) || (state_q == 1380)) || (state_q == 1381)) || (state_q == 1382)) || (state_q == 1383)) || (state_q == 1384)) || (state_q == 1401)) || (state_q == 1405)) || (state_q == 1411)) || (state_q == 1415)) || (state_q == 1418)) || (state_q == 1421)) || (state_q == 1422)) || (state_q == 1424)) || (state_q == 1425)) || (state_q == 1426)) || (state_q == 1427)) || (state_q == 1428)) || (state_q == 1429)) || (state_q == 1431)) || (state_q == 1432)) || (state_q == 1433)) || (state_q == 1434)) || (state_q == 1440)) || (state_q == 1442)) || (state_q == 1444)) || (state_q == 1448)) || (state_q == 1450)) || (state_q == 1456)) || (state_q == 1460)) || (state_q == 1465)) || (state_q == 1466)) || (state_q == 1468)) || (state_q == 1470)) || (state_q == 1472)) || (state_q == 1476)) || (state_q == 1478)) || (state_q == 1481)) || (state_q == 1484)) || (state_q == 1487)) || (state_q == 1490)) || (state_q == 1492)) || (state_q == 1494)) || (state_q == 1496)) || (state_q == 1498)) || (state_q == 1506)) || (state_q == 1508)) || (state_q == 1510)) || (state_q == 1511)) || (state_q == 1512)) || (state_q == 1528)) || (state_q == 1536)) || (state_q == 1542)) || (state_q == 1543)) || (state_q == 1566)) || (state_q == 1569)) || (state_q == 1571)) || (state_q == 1582)) || (state_q == 1585)) || (state_q == 1587)) || (state_q == 1606)) || (state_q == 1607)) || (state_q == 1610)) || (state_q == 1611)) || (state_q == 1612)) || (state_q == 1613)) || (state_q == 1614)) || (state_q == 1622)) || (state_q == 1649)) || (state_q == 1660)) || (state_q == 1661)) || (state_q == 1662)) || (state_q == 1663)) || (state_q == 1664)) || (state_q == 1665)) || (state_q == 1666)) || (state_q == 1667)) || (state_q == 1668)) || (state_q == 1669)) || (state_q == 1670)) || (state_q == 1671)) || (state_q == 1672)) || (state_q == 1673)) || (state_q == 1674)) || (state_q == 1675)) && lsu_resp_valid_i) && !first_cycle)) || ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((state_q == 22) || (state_q == 24)) || (state_q == 29)) || (state_q == 56)) || (state_q == 58)) || (state_q == 66)) || (state_q == 68)) || (state_q == 74)) || (state_q == 84)) || (state_q == 102)) || (state_q == 103)) || (state_q == 120)) || (state_q == 125)) || (state_q == 126)) || (state_q == 127)) || (state_q == 130)) || (state_q == 131)) || (state_q == 132)) || (state_q == 145)) || (state_q == 153)) || (state_q == 156)) || (state_q == 169)) || (state_q == 172)) || (state_q == 174)) || (state_q == 178)) || (state_q == 181)) || (state_q == 185)) || (state_q == 188)) || (state_q == 206)) || (state_q == 213)) || (state_q == 216)) || (state_q == 225)) || (state_q == 228)) || (state_q == 244)) || (state_q == 248)) || (state_q == 258)) || (state_q == 261)) || (state_q == 294)) || (state_q == 303)) || (state_q == 320)) || (state_q == 322)) || (state_q == 332)) || (state_q == 334)) || (state_q == 344)) || (state_q == 353)) || (state_q == 365)) || (state_q == 370)) || (state_q == 377)) || (state_q == 387)) || (state_q == 391)) || (state_q == 401)) || (state_q == 402)) || (state_q == 407)) || (state_q == 411)) || (state_q == 415)) || (state_q == 416)) || (state_q == 428)) || (state_q == 431)) || (state_q == 439)) || (state_q == 449)) || (state_q == 452)) || (state_q == 456)) || (state_q == 457)) || (state_q == 464)) || (state_q == 467)) || (state_q == 470)) || (state_q == 473)) || (state_q == 486)) || (state_q == 494)) || (state_q == 507)) || (state_q == 510)) || (state_q == 513)) || (state_q == 527)) || (state_q == 536)) || (state_q == 546)) || (state_q == 549)) || (state_q == 563)) || (state_q == 566)) || (state_q == 570)) || (state_q == 574)) || (state_q == 577)) || (state_q == 582)) || (state_q == 583)) || (state_q == 587)) || (state_q == 600)) || (state_q == 603)) || (state_q == 625)) || (state_q == 626)) || (state_q == 630)) || (state_q == 640)) || (state_q == 643)) || (state_q == 646)) || (state_q == 661)) || (state_q == 664)) || (state_q == 678)) || (state_q == 681)) || (state_q == 684)) || (state_q == 705)) || (state_q == 713)) || (state_q == 716)) || (state_q == 719)) || (state_q == 722)) || (state_q == 725)) || (state_q == 736)) || (state_q == 739)) || (state_q == 742)) || (state_q == 755)) || (state_q == 758)) || (state_q == 765)) || (state_q == 768)) || (state_q == 779)) || (state_q == 782)) || (state_q == 786)) || (state_q == 789)) || (state_q == 792)) || (state_q == 795)) || (state_q == 810)) || (state_q == 825)) || (state_q == 828)) || (state_q == 843)) || (state_q == 859)) || (state_q == 862)) || (state_q == 871)) || (state_q == 873)) || (state_q == 876)) || (state_q == 879)) || (state_q == 885)) || (state_q == 888)) || (state_q == 894)) || (state_q == 897)) || (state_q == 903)) || (state_q == 906)) || (state_q == 910)) || (state_q == 913)) || (state_q == 916)) || (state_q == 920)) || (state_q == 921)) || (state_q == 924)) || (state_q == 929)) || (state_q == 936)) || (state_q == 978)) || (state_q == 984)) || (state_q == 987)) || (state_q == 989)) || (state_q == 996)) || (state_q == 999)) || (state_q == 1005)) || (state_q == 1009)) || (state_q == 1016)) || (state_q == 1019)) || (state_q == 1022)) || (state_q == 1025)) || (state_q == 1036)) || (state_q == 1039)) || (state_q == 1045)) || (state_q == 1048)) || (state_q == 1051)) || (state_q == 1054)) || (state_q == 1057)) || (state_q == 1073)) || (state_q == 1075)) || (state_q == 1085)) || (state_q == 1086)) || (state_q == 1112)) || (state_q == 1117)) || (state_q == 1124)) || (state_q == 1126)) || (state_q == 1137)) || (state_q == 1140)) || (state_q == 1144)) || (state_q == 1160)) || (state_q == 1161)) || (state_q == 1164)) || (state_q == 1165)) || (state_q == 1167)) || (state_q == 1168)) || (state_q == 1169)) || (state_q == 1170)) || (state_q == 1172)) || (state_q == 1189)) || (state_q == 1199)) || (state_q == 1202)) || (state_q == 1241)) || (state_q == 1247)) || (state_q == 1248)) || (state_q == 1249)) || (state_q == 1250)) || (state_q == 1251)) || (state_q == 1252)) || (state_q == 1271)) || (state_q == 1272)) || (state_q == 1273)) || (state_q == 1274)) || (state_q == 1275)) || (state_q == 1277)) || (state_q == 1282)) || (state_q == 1283)) || (state_q == 1284)) || (state_q == 1285)) || (state_q == 1286)) || (state_q == 1290)) || (state_q == 1291)) || (state_q == 1313)) || (state_q == 1316)) || (state_q == 1317)) || (state_q == 1319)) || (state_q == 1320)) || (state_q == 1321)) || (state_q == 1325)) || (state_q == 1326)) || (state_q == 1327)) || (state_q == 1328)) || (state_q == 1329)) || (state_q == 1330)) || (state_q == 1350)) || (state_q == 1352)) || (state_q == 1355)) || (state_q == 1356)) || (state_q == 1357)) || (state_q == 1364)) || (state_q == 1365)) || (state_q == 1366)) || (state_q == 1367)) || (state_q == 1368)) || (state_q == 1369)) || (state_q == 1370)) || (state_q == 1388)) || (state_q == 1389)) || (state_q == 1392)) || (state_q == 1393)) || (state_q == 1396)) || (state_q == 1397)) || (state_q == 1399)) || (state_q == 1400)) || (state_q == 1404)) || (state_q == 1409)) || (state_q == 1410)) || (state_q == 1412)) || (state_q == 1413)) || (state_q == 1414)) || (state_q == 1417)) || (state_q == 1435)) || (state_q == 1436)) || (state_q == 1438)) || (state_q == 1446)) || (state_q == 1452)) || (state_q == 1455)) || (state_q == 1459)) || (state_q == 1462)) || (state_q == 1475)) || (state_q == 1482)) || (state_q == 1488)) || (state_q == 1500)) || (state_q == 1502)) || (state_q == 1504)) || (state_q == 1515)) || (state_q == 1522)) || (state_q == 1525)) || (state_q == 1531)) || (state_q == 1535)) || (state_q == 1538)) || (state_q == 1540)) || (state_q == 1545)) || (state_q == 1548)) || (state_q == 1551)) || (state_q == 1554)) || (state_q == 1557)) || (state_q == 1560)) || (state_q == 1563)) || (state_q == 1573)) || (state_q == 1575)) || (state_q == 1578)) || (state_q == 1589)) || (state_q == 1590)) || (state_q == 1591)) || (state_q == 1592)) || (state_q == 1593)) || (state_q == 1594)) || (state_q == 1595)) || (state_q == 1596)) || (state_q == 1597)) || (state_q == 1598)) || (state_q == 1599)) || (state_q == 1600)) || (state_q == 1601)) || (state_q == 1632)) || (state_q == 1633)) || (state_q == 1634)) || (state_q == 1635)) || (state_q == 1636)) || (state_q == 1637)) || (state_q == 1638)) || (state_q == 1651)) || (state_q == 1680)) || (state_q == 1681)) || (state_q == 1690)) || (state_q == 1691)) || (state_q == 1693)) || (state_q == 1699)) || (state_q == 1703)) || (state_q == 1707)) || (state_q == 1711)) || (state_q == 1714)) || (state_q == 1717)) || (state_q == 1721)) || (state_q == 1722)) || (state_q == 1724)) || (state_q == 1726)) || (state_q == 1729)) || (state_q == 1732)) || (state_q == 1735)) || (state_q == 1738)) || (state_q == 1740)) || (state_q == 1747)) && lsu_resp_valid_i) && !first_cycle))
			state_q <= state_d;
	always @(*) begin
		if (_sv2v_0)
			;
		state_d = state_q + 1'b1;
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
			0: begin
				alu_operand_b_ex_o = 32'h00020000;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			2: begin
				alu_operand_a_ex_o = 32'h00000088;
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			3: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffff78;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			4: begin
				alu_operand_a_ex_o = 32'h00000090;
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			5: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000078;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			6: begin
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
					state_d = 10;
				else
					state_d = 7;
			end
			7: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			8: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			9: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 6;
			end
			10: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 12;
			end
			11: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 11;
			end
			12: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffe0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			13: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			14: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 139;
			end
			15: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1655;
			end
			16: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			17: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1642;
			end
			18: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 140;
			end
			19: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1645;
			end
			20: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			21: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 142;
			end
			22: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			23: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1656;
			end
			24: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			25: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			26: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			27: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			28: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			29: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000004c;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			30: begin
				alu_operand_b_ex_o = 32'h41c65000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			31: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffe6d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			32: begin
				mult_en_ex_o = 1'b1;
				mult_sel_ex_o = 1'b1;
				multdiv_operator_ex_o = 2'd0;
				multdiv_signed_mode_ex_o = 2'b11;
				multdiv_operand_a_ex_o = rf_rdata_a;
				multdiv_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			33: begin
				alu_operand_b_ex_o = 32'h00003000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			34: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000039;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			35: begin
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
			end
			36: begin
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
			end
			37: begin
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
			end
			38: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000004c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			39: begin
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
			end
			40: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			41: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			42: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000004c;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			43: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			44: begin
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
			end
			45: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 54;
				else
					state_d = 46;
			end
			46: begin
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
			end
			47: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			48: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			49: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			50: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000044;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			51: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000048;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			52: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			53: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			54: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 54;
			end
			55: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			56: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			57: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			58: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000044;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			59: begin
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
			end
			60: begin
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
			end
			61: begin
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
			end
			62: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			63: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			64: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 87;
				else
					state_d = 65;
			end
			65: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			66: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000048;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			67: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			68: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			69: begin
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
			end
			70: begin
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
			end
			71: begin
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
			end
			72: begin
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 79;
				else
					state_d = 73;
			end
			73: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			74: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000044;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			75: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			76: begin
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
					state_d = 87;
				else
					state_d = 77;
			end
			77: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000048;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			78: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			79: begin
				alu_operand_b_ex_o = 32'h00000004;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			80: begin
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
			end
			81: begin
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
			end
			82: begin
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
			end
			83: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			84: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000044;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			85: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			86: begin
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
					state_d = 77;
				else
					state_d = 87;
			end
			87: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			88: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			89: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			90: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			91: begin
				mult_en_ex_o = 1'b1;
				mult_sel_ex_o = 1'b1;
				multdiv_operator_ex_o = 2'd0;
				multdiv_signed_mode_ex_o = 2'b11;
				multdiv_operand_a_ex_o = rf_rdata_a;
				multdiv_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			92: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			93: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			94: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 63;
			end
			95: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 102;
				else
					state_d = 96;
			end
			96: begin
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 102;
				else
					state_d = 97;
			end
			97: begin
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
			end
			98: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			99: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			101: begin
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
					state_d = 99;
				else
					state_d = 102;
			end
			102: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			103: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			104: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			105: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			106: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 136;
				else
					state_d = 107;
			end
			107: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			108: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			109: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			110: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			111: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			112: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			113: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			114: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 63;
			end
			115: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 130;
				else
					state_d = 116;
			end
			116: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			117: begin
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
			end
			118: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			119: begin
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 125;
				else
					state_d = 120;
			end
			120: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			121: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			122: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			123: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			124: begin
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
					state_d = 120;
				else
					state_d = 125;
			end
			125: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			126: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			127: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			128: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			129: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			130: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			131: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			132: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			133: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			134: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			135: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			136: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			137: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			138: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			139: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			140: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			141: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			142: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
			end
			143: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			144: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			145: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			146: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			147: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 184;
				else
					state_d = 148;
			end
			148: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			149: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 168;
				else
					state_d = 150;
			end
			150: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			151: begin
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
					state_d = 201;
				else
					state_d = 152;
			end
			152: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			153: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			154: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 212;
				else
					state_d = 155;
			end
			155: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			156: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			157: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 257;
				else
					state_d = 158;
			end
			158: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			159: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			160: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			161: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			162: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			163: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			164: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			165: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			166: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			167: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			168: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			169: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			170: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 224;
				else
					state_d = 171;
			end
			171: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			172: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			173: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			174: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009a;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			175: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 233;
				else
					state_d = 176;
			end
			176: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 277;
				else
					state_d = 177;
			end
			177: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			178: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			179: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 302;
				else
					state_d = 180;
			end
			180: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			181: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			182: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 312;
				else
					state_d = 183;
			end
			183: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			184: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			185: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			186: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 205;
				else
					state_d = 187;
			end
			187: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			188: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			189: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 243;
				else
					state_d = 190;
			end
			190: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			191: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			192: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			193: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			194: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			195: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			196: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			197: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			198: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			199: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			200: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			201: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			202: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			203: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			204: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			205: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			206: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			207: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			208: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 293;
				else
					state_d = 209;
			end
			209: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			210: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			211: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			212: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			213: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			214: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 209;
				else
					state_d = 215;
			end
			215: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			216: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009b;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			217: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 319;
				else
					state_d = 218;
			end
			218: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			219: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			220: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			221: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			222: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			223: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			224: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			225: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			226: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 232;
				else
					state_d = 227;
			end
			227: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			228: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			229: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 284;
				else
					state_d = 230;
			end
			230: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			231: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 250;
				else
					state_d = 232;
			end
			232: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			233: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 270;
				else
					state_d = 234;
			end
			234: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			235: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			236: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			237: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			238: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			239: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			240: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			241: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			242: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			243: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			244: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			245: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			246: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 209;
				else
					state_d = 247;
			end
			247: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			248: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009d;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			249: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 352;
				else
					state_d = 250;
			end
			250: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			251: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			252: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			253: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			254: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			255: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			256: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			257: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			258: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			259: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 209;
				else
					state_d = 260;
			end
			260: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			261: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009f;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			262: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 343;
				else
					state_d = 263;
			end
			263: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			264: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			265: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			266: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			267: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			268: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			269: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			270: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			271: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			272: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			273: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			274: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			275: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			276: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			277: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			278: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			279: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			280: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			281: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			282: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			283: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			284: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			285: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			286: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			287: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			288: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			289: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			290: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			291: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			292: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			293: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			294: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000099;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			295: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 331;
				else
					state_d = 296;
			end
			296: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			297: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			298: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			299: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			300: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			301: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			302: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			303: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			304: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 284;
				else
					state_d = 305;
			end
			305: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			306: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			307: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			308: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			309: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			310: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			311: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			312: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			313: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			314: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			315: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			316: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			317: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			318: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			319: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			320: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			321: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			322: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009f;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			323: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 361;
				else
					state_d = 324;
			end
			324: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 232;
				else
					state_d = 325;
			end
			325: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			326: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			327: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			328: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			329: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			330: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			331: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			332: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			333: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			334: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009d;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			335: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 231;
				else
					state_d = 336;
			end
			336: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 232;
				else
					state_d = 337;
			end
			337: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			338: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			339: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			340: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			341: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			342: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			343: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			344: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009b;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			345: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 232;
				else
					state_d = 346;
			end
			346: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			347: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			348: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			349: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			350: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			351: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			352: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			353: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000099;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			354: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 232;
				else
					state_d = 355;
			end
			355: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			356: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			357: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			358: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			359: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			360: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			361: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 263;
				else
					state_d = 362;
			end
			362: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			363: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			364: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			365: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			366: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 370;
				else
					state_d = 367;
			end
			367: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			368: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			369: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			370: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			371: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 376;
				else
					state_d = 372;
			end
			372: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			373: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			374: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			375: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			376: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			377: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			378: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			379: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			380: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			381: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			382: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 463;
				else
					state_d = 383;
			end
			383: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			384: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 406;
				else
					state_d = 385;
			end
			385: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 502;
				else
					state_d = 386;
			end
			386: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			387: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			388: begin
				alu_operand_b_ex_o = 32'h0000003b;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			389: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 526;
				else
					state_d = 390;
			end
			390: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			391: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005a;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			392: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			393: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 448;
				else
					state_d = 394;
			end
			394: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			395: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			396: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			397: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005a;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			398: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			399: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			400: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			401: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			402: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			403: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000005;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			404: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			405: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			406: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			407: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			408: begin
				alu_operand_b_ex_o = 32'h0000003c;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			409: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 427;
				else
					state_d = 410;
			end
			410: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			411: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000e4;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			412: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd25;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 427;
				else
					state_d = 413;
			end
			413: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			414: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			415: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a3;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			416: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a5;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			417: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd11;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			418: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 427;
				else
					state_d = 419;
			end
			419: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			420: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			421: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			422: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			423: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			424: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			425: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			426: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			427: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			428: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000097;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			429: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 506;
				else
					state_d = 430;
			end
			430: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			431: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			432: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			433: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 660;
				else
					state_d = 434;
			end
			434: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			435: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 639;
				else
					state_d = 436;
			end
			436: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			437: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 612;
				else
					state_d = 438;
			end
			438: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			439: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			440: begin
				alu_operand_b_ex_o = 32'h00000194;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			441: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 704;
				else
					state_d = 442;
			end
			442: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			443: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			444: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			445: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			446: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			447: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			448: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			449: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000060;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			450: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 562;
				else
					state_d = 451;
			end
			451: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			452: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			453: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 401;
				else
					state_d = 454;
			end
			454: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			455: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			456: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			457: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			458: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			459: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			460: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000005;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			461: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000007;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			462: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			463: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			464: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000097;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			465: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 485;
				else
					state_d = 466;
			end
			466: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			467: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000095;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			468: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 485;
				else
					state_d = 469;
			end
			469: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			470: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			471: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 485;
				else
					state_d = 472;
			end
			472: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			473: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			474: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			475: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			476: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			477: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			478: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			479: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f0;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			480: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			481: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			482: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			483: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			484: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			485: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			486: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			487: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			488: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 535;
				else
					state_d = 489;
			end
			489: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			490: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 599;
				else
					state_d = 491;
			end
			491: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			492: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 595;
				else
					state_d = 493;
			end
			493: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			494: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			495: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 496;
			end
			496: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			497: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			498: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			499: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			500: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			501: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			502: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			503: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			504: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			505: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			506: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			507: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000095;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			508: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 430;
				else
					state_d = 509;
			end
			509: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			510: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			511: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 545;
				else
					state_d = 512;
			end
			512: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			513: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			514: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			515: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			516: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			517: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			518: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			519: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			520: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f8;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			521: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			522: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			523: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			524: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			525: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			526: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			527: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000e4;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			528: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 529;
			end
			529: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			530: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			531: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			532: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			533: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			534: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			535: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			536: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			537: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 538;
			end
			538: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			539: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			540: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			541: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			542: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			543: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			544: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			545: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			546: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			547: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 430;
				else
					state_d = 548;
			end
			548: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			549: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			550: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			551: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			552: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			553: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			554: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			555: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			556: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f4;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			557: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			558: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			559: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			560: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			561: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			562: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			563: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000100;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			564: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 569;
				else
					state_d = 565;
			end
			565: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			566: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			567: begin
				alu_operator_ex_o = 7'd1;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			568: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 623;
				else
					state_d = 569;
			end
			569: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			570: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			571: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			572: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 454;
				else
					state_d = 573;
			end
			573: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			574: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000fc;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			575: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 401;
				else
					state_d = 576;
			end
			576: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			577: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			578: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffffd;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			579: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 401;
				else
					state_d = 580;
			end
			580: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			581: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			582: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			583: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			584: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd11;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			585: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 401;
				else
					state_d = 586;
			end
			586: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			587: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			588: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_a;
				if (branch_decision_i)
					state_d = 401;
				else
					state_d = 589;
			end
			589: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			590: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			591: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			592: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			593: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			594: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 401;
			end
			595: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			596: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			597: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			598: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			599: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			600: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			601: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 616;
				else
					state_d = 602;
			end
			602: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			603: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			604: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 605;
			end
			605: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			606: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			607: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			608: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			609: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			610: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			611: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			612: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			613: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			614: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			615: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			616: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			617: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			618: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			619: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			620: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			621: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			622: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			623: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			624: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			625: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			626: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			627: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd11;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			628: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 569;
				else
					state_d = 629;
			end
			629: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			630: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			631: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			632: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			633: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			634: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005a;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			635: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			636: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			637: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			638: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 401;
			end
			639: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			640: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			641: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 677;
				else
					state_d = 642;
			end
			642: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			643: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000091;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			644: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 677;
				else
					state_d = 645;
			end
			645: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			646: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			647: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_a;
				if (branch_decision_i)
					state_d = 677;
				else
					state_d = 648;
			end
			648: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			649: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			650: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			651: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			652: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			653: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			654: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			655: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000054;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			656: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			657: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			658: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			659: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			660: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			661: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			662: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_a;
				if (branch_decision_i)
					state_d = 697;
				else
					state_d = 663;
			end
			663: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			664: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000054;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			665: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			666: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 712;
				else
					state_d = 667;
			end
			667: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 735;
				else
					state_d = 668;
			end
			668: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			669: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			670: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			671: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000054;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			672: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			673: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			674: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			675: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			676: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			677: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			678: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			679: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 680;
			end
			680: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			681: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			682: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 683;
			end
			683: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			684: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			685: begin
				alu_operand_b_ex_o = 32'h00000194;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			686: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd25;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 687;
			end
			687: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			688: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			689: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			690: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			691: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			692: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			693: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			694: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			695: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000055;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			696: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			697: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			698: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			699: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			700: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			701: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			702: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			703: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			704: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			705: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000055;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			706: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 764;
				else
					state_d = 707;
			end
			707: begin
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 754;
				else
					state_d = 708;
			end
			708: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			709: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000055;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			710: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			711: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			712: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			713: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			714: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 718;
				else
					state_d = 715;
			end
			715: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			716: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			717: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 697;
				else
					state_d = 718;
			end
			718: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			719: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			720: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 724;
				else
					state_d = 721;
			end
			721: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			722: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000091;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			723: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 697;
				else
					state_d = 724;
			end
			724: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			725: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000057;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			726: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			727: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 843;
				else
					state_d = 728;
			end
			728: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			729: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 825;
				else
					state_d = 730;
			end
			730: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			731: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000057;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			732: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			733: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			734: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			735: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			736: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			737: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 741;
				else
					state_d = 738;
			end
			738: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			739: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000091;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			740: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 697;
				else
					state_d = 741;
			end
			741: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			742: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			743: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			744: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 810;
				else
					state_d = 745;
			end
			745: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			746: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 792;
				else
					state_d = 747;
			end
			747: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			748: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			749: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			750: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			751: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			752: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			753: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			754: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			755: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			756: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 778;
				else
					state_d = 757;
			end
			757: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			758: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000091;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			759: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 778;
				else
					state_d = 760;
			end
			760: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			761: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000055;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			762: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			763: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			764: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			765: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			766: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 785;
				else
					state_d = 767;
			end
			767: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			768: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000091;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			769: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 785;
				else
					state_d = 770;
			end
			770: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			771: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			772: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			773: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000055;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			774: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			775: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			776: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			777: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			778: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			779: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			780: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 781;
			end
			781: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			782: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			783: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 770;
				else
					state_d = 784;
			end
			784: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			785: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			786: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			787: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 788;
			end
			788: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			789: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			790: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 791;
			end
			791: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 770;
			end
			792: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			793: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 858;
				else
					state_d = 794;
			end
			794: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			795: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			796: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			797: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			798: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			799: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			800: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			801: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000017;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			802: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			803: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			804: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000dc;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			805: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			806: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			807: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a2;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			808: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			809: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			810: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			811: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000017;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			812: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 813;
			end
			813: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			814: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			815: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			816: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			817: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			818: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			819: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			820: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a2;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			821: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			822: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			823: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			824: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			825: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			826: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 827;
			end
			827: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			828: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			829: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			830: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			831: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			832: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			833: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			834: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000017;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			835: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000057;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			836: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			837: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000e0;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			838: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			839: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a4;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			840: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			841: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			842: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			843: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000016;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			844: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000017;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			845: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 846;
			end
			846: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			847: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			848: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			849: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			850: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			851: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			852: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			853: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			854: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a4;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			855: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000057;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			856: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			857: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			858: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			859: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			860: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 861;
			end
			861: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			862: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008e;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			863: begin
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 390;
				else
					state_d = 864;
			end
			864: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			865: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000054;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			866: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			867: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			868: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 390;
			end
			869: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			870: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			871: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			872: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 928;
				else
					state_d = 873;
			end
			873: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			874: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 935;
				else
					state_d = 875;
			end
			875: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			876: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f8;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			877: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 884;
				else
					state_d = 878;
			end
			878: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			879: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			880: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 884;
				else
					state_d = 881;
			end
			881: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			882: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f8;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			883: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			884: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			885: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f4;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			886: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 893;
				else
					state_d = 887;
			end
			887: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			888: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			889: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 893;
				else
					state_d = 890;
			end
			890: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			891: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f4;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			892: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			893: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			894: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f0;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			895: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 902;
				else
					state_d = 896;
			end
			896: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			897: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			898: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 902;
				else
					state_d = 899;
			end
			899: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			900: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000f0;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			901: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			902: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			903: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000e0;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			904: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 909;
				else
					state_d = 905;
			end
			905: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			906: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			907: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 909;
				else
					state_d = 908;
			end
			908: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000e0;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			909: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			910: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000dc;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			911: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 916;
				else
					state_d = 912;
			end
			912: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			913: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			914: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 916;
				else
					state_d = 915;
			end
			915: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000dc;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			916: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			917: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 923;
				else
					state_d = 918;
			end
			918: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			919: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			920: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b0;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			921: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a8;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			922: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 927;
				else
					state_d = 923;
			end
			923: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			924: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			925: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			926: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000104;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			927: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			928: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			929: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			930: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			931: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000fc;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			932: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			933: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000100;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			934: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 875;
			end
			935: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			936: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			937: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 932;
			end
			938: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			939: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			940: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			941: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			942: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			943: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			944: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			945: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			946: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			947: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			948: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			949: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			950: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			951: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			952: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			953: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000104;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			954: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000100;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			955: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			956: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			957: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000fc;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			958: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			959: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			960: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			961: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			962: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			963: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			964: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			965: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005a;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			966: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			967: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			968: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000057;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			969: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			970: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000055;
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			971: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000054;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			972: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000053;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			973: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000052;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			974: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			975: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			976: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			977: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			978: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			979: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 981;
				else
					state_d = 980;
			end
			980: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 144;
			end
			981: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			982: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			983: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			984: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			985: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 987;
				else
					state_d = 986;
			end
			986: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 363;
			end
			987: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			988: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 993;
				else
					state_d = 989;
			end
			989: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			990: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 993;
				else
					state_d = 991;
			end
			991: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			992: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			993: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			994: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			995: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			996: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			997: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1014;
				else
					state_d = 998;
			end
			998: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			999: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000052;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1000: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1001: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1015;
				else
					state_d = 1002;
			end
			1002: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1003: begin
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
					state_d = 1011;
				else
					state_d = 1004;
			end
			1004: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1005: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000087;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1006: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1007: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1014;
				else
					state_d = 1008;
			end
			1008: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1009: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000086;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1010: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1014;
				else
					state_d = 1011;
			end
			1011: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1012: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000052;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1013: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1014: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1015: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1016: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000087;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1017: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1014;
				else
					state_d = 1018;
			end
			1018: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1019: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000086;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1020: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1014;
				else
					state_d = 1021;
			end
			1021: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1022: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1023: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1027;
				else
					state_d = 1024;
			end
			1024: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1025: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1026: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1014;
				else
					state_d = 1027;
			end
			1027: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1028: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1029: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1030: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1031: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1032: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000052;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1033: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1034: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1035: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1036: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1037: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1073;
				else
					state_d = 1038;
			end
			1038: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1039: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1040: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1041: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1083;
				else
					state_d = 1042;
			end
			1042: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1043: begin
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
					state_d = 1079;
				else
					state_d = 1044;
			end
			1044: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1045: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1046: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1050;
				else
					state_d = 1047;
			end
			1047: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1048: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000088;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1049: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1104;
				else
					state_d = 1050;
			end
			1050: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1051: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1052: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1056;
				else
					state_d = 1053;
			end
			1053: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1054: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008b;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1055: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1104;
				else
					state_d = 1056;
			end
			1056: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1057: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1058: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1059: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1123;
				else
					state_d = 1060;
			end
			1060: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1061: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1111;
				else
					state_d = 1062;
			end
			1062: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1063: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1082;
				else
					state_d = 1064;
			end
			1064: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1065: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1066: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1067: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1068: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1069: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1070: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b0;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1071: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b8;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1072: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1073: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1074: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1082;
				else
					state_d = 1075;
			end
			1075: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1076: begin
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1082;
				else
					state_d = 1077;
			end
			1077: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1078: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1079: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1080: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1081: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1082: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1083: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1084: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1085: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d4;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1086: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d0;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1087: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1082;
				else
					state_d = 1088;
			end
			1088: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd27;
				alu_operand_a_ex_o = 32'h00000000;
				alu_operand_b_ex_o = rf_rdata_a;
				if (branch_decision_i)
					state_d = 1082;
				else
					state_d = 1089;
			end
			1089: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1090: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1091: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1092: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1093: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1094: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1095: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1096: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1097: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1098: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000096;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1099: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1100: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b8;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1101: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b0;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1102: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1103: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1104: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1105: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1106: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1107: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1108: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1109: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1110: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1111: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1112: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b0;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1113: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1114: begin
				alu_operand_b_ex_o = 32'h0000000b;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1115: begin
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
					state_d = 1082;
				else
					state_d = 1116;
			end
			1116: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1117: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a8;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1118: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1082;
				else
					state_d = 1119;
			end
			1119: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1120: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1121: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1122: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1123: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1124: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b8;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1125: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1126: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d4;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1127: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1128: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd25;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1082;
				else
					state_d = 1129;
			end
			1129: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1130: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1131: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1132: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1133: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000096;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1134: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1135: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1136: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1137: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1138: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1139: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffc0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1140: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000078;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1141: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1142: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1143: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1144: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000075;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1145: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1146: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1147: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1148: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1149: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1150: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1151: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1152: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1153: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd23;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1154: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd24;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1155: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd25;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1156: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1157: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1158: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1159: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1160: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000074;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1161: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007b;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1162: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1163: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1164: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000077;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1165: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1166: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1167: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1168: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1169: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1170: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1171: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1172: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000076;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1173: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1174: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000064;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1175: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1176: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1177: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1178: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1179: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1180: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1181: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1182: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1183: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1184: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1185: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1186: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1187: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1188: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1189: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000053;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1190: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000060;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1191: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1192: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1193: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1194: begin
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1560;
				else
					state_d = 1195;
			end
			1195: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1196: begin
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1554;
				else
					state_d = 1197;
			end
			1197: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1198: begin
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1204;
				else
					state_d = 1199;
			end
			1199: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006d;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1200: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1211;
				else
					state_d = 1201;
			end
			1201: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1202: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006b;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1203: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1211;
				else
					state_d = 1204;
			end
			1204: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1205: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1206: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1207: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000cc;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1208: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1209: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1210: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000053;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1211: begin
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1215;
				else
					state_d = 1212;
			end
			1212: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1213: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1214: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1215: begin
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1218;
				else
					state_d = 1216;
			end
			1216: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1217: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000052;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1218: begin
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1222;
				else
					state_d = 1219;
			end
			1219: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1220: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1221: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1222: begin
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1235;
				else
					state_d = 1223;
			end
			1223: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1224: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1225: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1226: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1227: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1228: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1229: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005a;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1230: begin
				alu_operand_b_ex_o = 32'h00000100;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1231: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1232: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1233: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b01;
				lsu_wdata_o = rf_rdata_b;
			end
			1234: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1235: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1236: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1237: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1238: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1239: begin
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1522;
				else
					state_d = 1240;
			end
			1240: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1241: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000071;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1242: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1545;
				else
					state_d = 1243;
			end
			1243: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000082;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1244: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1529;
				else
					state_d = 1245;
			end
			1245: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1573;
				else
					state_d = 1246;
			end
			1246: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1247: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000012;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1248: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000015;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1249: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1250: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1251: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000072;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1252: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000073;
				rf_raddr_a_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1253: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1254: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1255: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1256: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1257: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1258: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1259: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd6;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1260: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd28;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1261: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1262: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1263: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009a;
				rf_raddr_a_o = 5'd16;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1264: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd17;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1265: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1266: begin
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1276;
				else
					state_d = 1267;
			end
			1267: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 144;
			end
			1268: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1269: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1270: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1271: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009a;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1272: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1273: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1274: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1275: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1276: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1277: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1278: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1279: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1280: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1281: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1282: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d4;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1283: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1284: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000087;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1285: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1286: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1287: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1288: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1289: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1290: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1291: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000097;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1292: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c0;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1293: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1294: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000083;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1295: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1296: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000072;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1297: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1298: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000073;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1299: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000082;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1300: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006a;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1301: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006d;
				rf_raddr_a_o = 5'd21;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1302: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007f;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1303: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c4;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1304: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1305: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000070;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1306: begin
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1538;
				else
					state_d = 1307;
			end
			1307: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 363;
			end
			1308: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1309: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1310: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1311: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1312: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1313: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1314: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1315: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1316: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1317: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000087;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1318: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1319: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1320: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1321: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1322: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1323: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1324: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1325: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1326: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d4;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1327: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1328: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1329: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1330: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000097;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1331: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1332: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1333: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000082;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1334: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1335: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1336: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1337: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c0;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1338: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000083;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1339: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000070;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1340: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006a;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1341: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006d;
				rf_raddr_a_o = 5'd21;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1342: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007f;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1343: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c4;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1344: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1345: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000072;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1346: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000073;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1347: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 994;
			end
			1348: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1349: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1350: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1351: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1352: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1353: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1354: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1355: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000087;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1356: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1357: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009a;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1358: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1359: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1360: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1361: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1362: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1363: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1364: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1365: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1366: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1367: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000097;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1368: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1369: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d4;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1370: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1371: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1372: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000083;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1373: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1374: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c0;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1375: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000070;
				rf_raddr_a_o = 5'd14;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1376: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006a;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1377: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006d;
				rf_raddr_a_o = 5'd21;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1378: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007f;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1379: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c4;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1380: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1381: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000072;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1382: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1383: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000073;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1384: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000082;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1385: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1034;
			end
			1386: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1387: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1388: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d8;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1389: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000098;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1390: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1391: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1392: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000094;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1393: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000ec;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1394: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1395: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1396: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1397: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c8;
				rf_raddr_a_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1398: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1399: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d4;
				rf_raddr_a_o = 5'd27;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1400: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009c;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1401: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000083;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1402: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1403: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1404: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009e;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1405: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000e4;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1406: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1407: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1408: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1409: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000087;
				rf_raddr_a_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1410: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a0;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1411: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000cc;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1412: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000a;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd28;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1413: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000d;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd16;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1414: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd6;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1415: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c4;
				rf_raddr_a_o = 5'd24;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1416: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1417: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000013;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd17;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1418: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000d0;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1419: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1420: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1421: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000c0;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1422: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000bc;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1423: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1424: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000080;
				rf_raddr_a_o = 5'd23;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1425: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007f;
				rf_raddr_a_o = 5'd25;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1426: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000072;
				rf_raddr_a_o = 5'd19;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1427: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1428: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000073;
				rf_raddr_a_o = 5'd18;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1429: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000082;
				rf_raddr_a_o = 5'd20;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1430: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1431: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000b;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd28;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1432: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd16;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1433: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000011;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd6;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1434: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd17;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1435: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000b0;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1436: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008f;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1437: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1438: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008c;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1439: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1440: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000a8;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1441: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1442: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009f;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1443: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1444: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009d;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1445: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1446: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007a;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1447: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1448: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000009b;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1449: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1450: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000099;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1451: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1452: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000075;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1453: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1454: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1455: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000096;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1456: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000086;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1457: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1458: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1459: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000092;
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1460: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007e;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1461: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1462: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006f;
				rf_raddr_a_o = 5'd26;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1463: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1464: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1465: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000097;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1466: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000095;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1467: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1468: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000093;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1469: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1470: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000091;
				rf_raddr_a_o = 5'd7;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1471: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1472: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000090;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1473: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1474: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1475: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000089;
				rf_raddr_a_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1476: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008e;
				rf_raddr_a_o = 5'd5;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1477: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1478: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008d;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1479: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1480: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1481: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008b;
				rf_raddr_a_o = 5'd31;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1482: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007d;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1483: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1484: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000008a;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1485: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1486: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1487: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000088;
				rf_raddr_a_o = 5'd30;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1488: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000077;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1489: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1490: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007b;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1491: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1492: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000078;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1493: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1494: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000076;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1495: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1496: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000074;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1497: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1498: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000070;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1499: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1500: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006c;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1501: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1502: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000069;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1503: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1504: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1505: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1506: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006e;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1507: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1508: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006b;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1509: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1510: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006d;
				rf_raddr_a_o = 5'd21;
				rf_raddr_b_o = 5'd30;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1511: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006a;
				rf_raddr_a_o = 5'd22;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1512: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1513: begin
				rf_raddr_a_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1589;
				else
					state_d = 1514;
			end
			1514: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1515: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000060;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1516: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd31;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1517: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1518: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd7;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1519: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd30;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1520: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1521: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1186;
			end
			1522: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000082;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1523: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1529;
				else
					state_d = 1524;
			end
			1524: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1525: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000071;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1526: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1245;
				else
					state_d = 1527;
			end
			1527: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1528: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007a;
				rf_raddr_a_o = 5'd11;
				rf_raddr_b_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1529: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1548;
				else
					state_d = 1530;
			end
			1530: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1531: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000071;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1532: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1246;
				else
					state_d = 1533;
			end
			1533: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1573;
				else
					state_d = 1534;
			end
			1534: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1535: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1536: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000007d;
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1537: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1247;
			end
			1538: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000f;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1539: begin
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1331;
				else
					state_d = 1540;
			end
			1540: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000e;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd5;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1541: begin
				rf_raddr_a_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1331;
				else
					state_d = 1542;
			end
			1542: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1543: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000006;
				rf_raddr_a_o = 5'd8;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1544: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1331;
			end
			1545: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000082;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1546: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd31;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1527;
				else
					state_d = 1547;
			end
			1547: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd5;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1533;
				else
					state_d = 1548;
			end
			1548: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1549: begin
				rf_raddr_a_o = 5'd10;
				rf_raddr_b_o = 5'd7;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1247;
				else
					state_d = 1550;
			end
			1550: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1551: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000071;
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1552: begin
				rf_raddr_a_o = 5'd12;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1534;
				else
					state_d = 1553;
			end
			1553: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1247;
			end
			1554: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006a;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1555: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1211;
				else
					state_d = 1556;
			end
			1556: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1557: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1558: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1204;
				else
					state_d = 1559;
			end
			1559: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1211;
			end
			1560: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006d;
				rf_raddr_a_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1561: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1575;
				else
					state_d = 1562;
			end
			1562: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1563: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006b;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1564: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1575;
				else
					state_d = 1565;
			end
			1565: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1566: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1567: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1568: begin
				alu_operand_b_ex_o = 32'hffffff9c;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1569: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000053;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1570: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1571: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000cc;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1572: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1211;
			end
			1573: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000081;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1574: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1247;
			end
			1575: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000006a;
				rf_raddr_a_o = 5'd22;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1576: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1211;
				else
					state_d = 1577;
			end
			1577: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1578: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000068;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1579: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1211;
				else
					state_d = 1580;
			end
			1580: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1581: begin
				alu_operand_b_ex_o = 32'h00000064;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1582: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000061;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1583: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1584: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1585: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000cc;
				rf_raddr_a_o = 5'd26;
				rf_raddr_b_o = 5'd29;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1586: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd29;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1587: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000053;
				rf_raddr_a_o = 5'd29;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b00;
				lsu_wdata_o = rf_rdata_b;
			end
			1588: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1211;
			end
			1589: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1590: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1591: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1592: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1593: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1594: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1595: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1596: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd22;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1597: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd23;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1598: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd24;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1599: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd25;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1600: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd26;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1601: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd27;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1602: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1603: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1604: begin
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1641;
				else
					state_d = 1605;
			end
			1605: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffe0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1606: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1607: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1608: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1609: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1610: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1611: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1612: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd21;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1613: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1614: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1615: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1616: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1617: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1618: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd8;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1619: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1620: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1621: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd19;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1622: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1623: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1624: begin
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
					state_d = 1622;
				else
					state_d = 1625;
			end
			1625: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd9;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1626: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 938;
			end
			1627: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 869;
			end
			1628: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1136;
			end
			1629: begin
				rf_raddr_a_o = 5'd9;
				rf_raddr_b_o = 5'd18;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1621;
				else
					state_d = 1630;
			end
			1630: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1631: begin
				rf_raddr_a_o = 5'd21;
				rf_raddr_b_o = 5'd20;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1620;
				else
					state_d = 1632;
			end
			1632: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1633: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd8;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1634: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd9;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1635: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd18;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1636: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd19;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1637: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd20;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1638: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd21;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1639: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1640: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1641: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1642: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1643: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1644: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1604;
			end
			1645: begin
				alu_operand_b_ex_o = 32'h00001000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1646: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffff0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1647: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hfffffd02;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1648: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1649: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1650: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1604;
			end
			1651: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1652: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1653: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1654: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1655: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1656: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1657: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffc0;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1658: begin
				alu_operand_b_ex_o = 32'h00000100;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1659: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1660: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000004;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1661: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1662: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000008;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1663: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000000c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1664: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000010;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1665: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000014;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1666: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000018;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1667: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000001c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1668: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000020;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1669: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000024;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1670: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000028;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1671: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000002c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1672: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000030;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1673: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000034;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1674: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000038;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1675: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000003c;
				rf_raddr_a_o = 5'd2;
				rf_raddr_b_o = 5'd0;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b1;
				lsu_type_o = 2'b10;
				lsu_wdata_o = rf_rdata_b;
			end
			1676: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1677: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1678: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1680;
			end
			1679: begin
				rf_raddr_a_o = 5'd15;
				rf_raddr_b_o = 5'd11;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1688;
				else
					state_d = 1680;
			end
			1680: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1681: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1682: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1683: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000001;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1684: begin
				rf_raddr_a_o = 5'd12;
				rf_raddr_b_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd29;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1679;
				else
					state_d = 1685;
			end
			1685: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1686: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000040;
				rf_raddr_a_o = 5'd2;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd2;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1687: begin
				rf_raddr_a_o = 5'd1;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = rf_rdata_a[10:0];
			end
			1688: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1689: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1690: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000100;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1691: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000104;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1692: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1693: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h000000fc;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b10;
				lsu_sign_ext_o = 1'b1;
				expecting_load_resp_o = 1'b1;
			end
			1694: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd13;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1695: begin
				alu_operand_b_ex_o = 32'h00000000;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1696: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd14;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1697: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1686;
				else
					state_d = 1698;
			end
			1698: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1699: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005c;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1700: begin
				alu_operand_b_ex_o = 32'h00000003;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1701: begin
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
					state_d = 1686;
				else
					state_d = 1702;
			end
			1702: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1703: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005b;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1704: begin
				alu_operand_b_ex_o = 32'h00000002;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1705: begin
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
					state_d = 1686;
				else
					state_d = 1706;
			end
			1706: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1707: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005a;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1708: begin
				alu_operand_b_ex_o = 32'h00000001;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1709: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1686;
				else
					state_d = 1710;
			end
			1710: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1711: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000059;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1712: begin
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
					state_d = 1686;
				else
					state_d = 1713;
			end
			1713: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1714: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000053;
				rf_raddr_a_o = 5'd13;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1715: begin
				rf_raddr_a_o = 5'd13;
				rf_raddr_b_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				if (branch_decision_i)
					state_d = 1686;
				else
					state_d = 1716;
			end
			1716: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1717: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000052;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1718: begin
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
					state_d = 1686;
				else
					state_d = 1719;
			end
			1719: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1720: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1721: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005e;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1722: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005f;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1723: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1724: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h0000005d;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1725: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1726: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000058;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1727: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1728: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd13;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1729: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000057;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1730: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1731: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd11;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1732: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000056;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd11;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1733: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1734: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd12;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1735: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000055;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd12;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1736: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1737: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd13;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1738: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000054;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd13;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1739: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1740: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000051;
				rf_raddr_a_o = 5'd14;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd14;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1741: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd11;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1742: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd12;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1743: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd13;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1744: begin
				alu_operator_ex_o = 7'd3;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = rf_rdata_b;
				rf_raddr_b_o = 5'd14;
				rf_ren_b_o = 1'b1;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1745: begin
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				alu_operator_ex_o = 7'd30;
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				if (branch_decision_i)
					state_d = 1685;
				else
					state_d = 1746;
			end
			1746: begin
				alu_operand_b_ex_o = 32'h00010000;
				rf_waddr_id_o = 5'd15;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1747: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000050;
				rf_raddr_a_o = 5'd15;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd0;
				lsu_req_o = lsu_req_actual;
				lsu_we_o = 1'b0;
				lsu_type_o = 2'b00;
				lsu_sign_ext_o = 1'b0;
				expecting_load_resp_o = 1'b1;
			end
			1748: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'hffffffff;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1749: begin
				alu_operand_a_ex_o = rf_rdata_a;
				alu_operand_b_ex_o = 32'h00000000;
				rf_raddr_a_o = 5'd10;
				rf_ren_a_o = 1'b1;
				rf_waddr_id_o = 5'd10;
				rf_we_id_o = 1'b1;
				rf_wdata_id_o = result_ex_i;
				en_wb_o = 1'b1;
				instr_type_wb_o = 2'd2;
			end
			1750: begin
				rf_we_id_o = 1'b0;
				en_wb_o = 1'b0;
				state_d = 1686;
			end
			default: state_d = 1'sb0;
		endcase
	end
	assign ctrl_busy_o = state_q != 1750;
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
