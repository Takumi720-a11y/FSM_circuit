// 自動生成 fsm_gen.py — kind埋め込み＋二段デコード
// 符号 11bit = [10:5]kind 6bit / [4:0]seq 5bit
// フィールド 16bit = [15:7]レジスタ索引 9bit / [6:0]即値索引 7bit

(* keep_hierarchy = "yes" *)
module ctrl_dec import ibex_pkg::*; (
  input  logic [5:0] kind_i,
  input  logic [31:0] imm_val_i,
  input  logic [31:0] rf_rdata_a, rf_rdata_b, result_ex_i,
  input  logic lsu_req_actual, ex_valid_i, first_cycle,
  output logic rd_valid_o,
  output logic [31:0] alu_operand_a_ex_o,
  output logic [31:0] alu_operand_b_ex_o,
  output alu_op_e alu_operator_ex_o,
  output logic div_en_ex_o,
  output logic div_sel_ex_o,
  output logic en_wb_o,
  output logic expecting_load_resp_o,
  output wb_instr_type_e instr_type_wb_o,
  output logic lsu_req_o,
  output logic lsu_sign_ext_o,
  output logic [1:0] lsu_type_o,
  output logic [31:0] lsu_wdata_o,
  output logic lsu_we_o,
  output logic mult_en_ex_o,
  output logic mult_sel_ex_o,
  output logic [31:0] multdiv_operand_a_ex_o,
  output logic [31:0] multdiv_operand_b_ex_o,
  output md_op_e multdiv_operator_ex_o,
  output logic [1:0] multdiv_signed_mode_ex_o,
  output logic rf_rd_a_wb_match_o,
  output logic rf_rd_b_wb_match_o,
  output logic rf_ren_a_o,
  output logic rf_ren_b_o,
  output logic [31:0] rf_wdata_id_o,
  output logic rf_we_id_o
);
  always_comb begin
    alu_operand_a_ex_o = '0;
    alu_operand_b_ex_o = '0;
    alu_operator_ex_o = ALU_ADD;
    div_en_ex_o = 1'b0;
    div_sel_ex_o = 1'b0;
    en_wb_o = 1'b0;
    expecting_load_resp_o = 1'b0;
    instr_type_wb_o = WB_INSTR_OTHER;
    lsu_req_o = 1'b0;
    lsu_sign_ext_o = 1'b0;
    lsu_type_o = 2'b00;
    lsu_wdata_o = '0;
    lsu_we_o = 1'b0;
    mult_en_ex_o = 1'b0;
    mult_sel_ex_o = 1'b0;
    multdiv_operand_a_ex_o = rf_rdata_a;
    multdiv_operand_b_ex_o = rf_rdata_b;
    multdiv_operator_ex_o = MD_OP_MULL;
    multdiv_signed_mode_ex_o = 2'b00;
    rf_rd_a_wb_match_o = 1'b0;
    rf_rd_b_wb_match_o = 1'b0;
    rf_ren_a_o = 1'b0;
    rf_ren_b_o = 1'b0;
    rf_wdata_id_o = '0;
    rf_we_id_o = 1'b0;
    rd_valid_o = 1'b0;
    case (kind_i)
      6'd0: begin  // addi sp,sp,-16 (PC=0x84)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd1: begin  // addi a5,a5,-403 (PC=0xfc)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd2: begin  // addi t1,t1,-1132 (PC=0x94)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd3: begin  // addi t0,t0,1956 (PC=0x8c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd4: begin  // mv a5,a0 (PC=0x17c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd5: begin  // mv a6,a2 (PC=0x2d0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd6: begin  // mv a0,s0 (PC=0x1f4)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd7: begin  // addi s3,s3,-1760 (PC=0x111c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd8: begin  // lw ra,28(sp) (PC=0xe0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd9: begin  // lw a5,-1000(a5) (PC=0x168)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd10: begin  // lw a4,-1004(a5) (PC=0x160)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd11: begin  // lw s11,12(s0) (PC=0x518)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd12: begin  // lw a0,12(sp) (PC=0xd8)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd13: begin  // add s7,a2,s7 (PC=0x5f8)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd14: begin  // add a5,a2,t4 (PC=0x318)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd15: begin  // add a0,a0,a5 (PC=0x10c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd16: begin  // add a3,a5,a3 (PC=0x3e8)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd17: begin  // slli a5,a5,0x18 (PC=0x2e8)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SLL;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd18: begin  // slli t6,t6,0x8 (PC=0x504)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SLL;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd19: begin  // slli a3,a3,0x8 (PC=0x35c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SLL;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd20: begin  // slli a0,a0,0x1 (PC=0x110)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SLL;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd21: begin  // srli a0,a0,0x1 (PC=0x114)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SRL;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd22: begin  // srli t1,a5,0x18 (PC=0x3a0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SRL;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd23: begin  // srli t1,a4,0x8 (PC=0x3e0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SRL;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd24: begin  // lui a5,0x41c65 (PC=0xf8)
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd25: begin  // li a0,0 (PC=0xc0)
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd26: begin  // lui a3,0x13 (PC=0x18c)
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd27: begin  // lui sp,0x20 (PC=0x80)
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd28: begin  // sw ra,28(sp) (PC=0xb4)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_STORE;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_wdata_o = rf_rdata_b;
        lsu_we_o = 1'b1;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd29: begin  // sw s1,4(sp) (PC=0x23c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_STORE;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_wdata_o = rf_rdata_b;
        lsu_we_o = 1'b1;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd30: begin  // sw a0,12(sp) (PC=0xd0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_STORE;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_wdata_o = rf_rdata_b;
        lsu_we_o = 1'b1;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd31: begin  // sw zero,0(t0) (PC=0x9c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_STORE;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b00;
        lsu_wdata_o = rf_rdata_b;
        lsu_we_o = 1'b1;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd32: begin  // lbu a4,1(a3) (PC=0x2e4)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_sign_ext_o = 1'b0;
        lsu_type_o = 2'b10;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd33: begin  // lbu t3,6(a0) (PC=0x4d8)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_sign_ext_o = 1'b0;
        lsu_type_o = 2'b10;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd34: begin  // lbu a3,0(a5) (PC=0x260)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        expecting_load_resp_o = 1'b1;
        instr_type_wb_o = WB_INSTR_LOAD;
        lsu_req_o = lsu_req_actual;
        lsu_sign_ext_o = 1'b0;
        lsu_type_o = 2'b10;
        lsu_we_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd35: begin  // andi a5,a1,3 (PC=0x130)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_AND;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd36: begin  // andi a6,a4,3 (PC=0x198)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_AND;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd37: begin  // zext.b s4,a7 (PC=0xaf4)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_AND;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd38: begin  // or a5,a5,a4 (PC=0x2fc)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_OR;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd39: begin  // or a5,a5,a0 (PC=0x2f0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_OR;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd40: begin  // xor a4,a4,t1 (PC=0x36c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_XOR;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd41: begin  // xor t6,t2,a3 (PC=0x728)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_XOR;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd42: begin  // sb a6,11(a1) (PC=0x8fc)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_STORE;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b10;
        lsu_wdata_o = rf_rdata_b;
        lsu_we_o = 1'b1;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd43: begin  // sb zero,-1(a5) (PC=0x210)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_STORE;
        lsu_req_o = lsu_req_actual;
        lsu_type_o = 2'b10;
        lsu_wdata_o = rf_rdata_b;
        lsu_we_o = 1'b1;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd44: begin  // j 98 <bss_loop> (PC=0xa4)
        en_wb_o = 1'b0;
        rf_we_id_o = 1'b0;
      end
      6'd45: begin  // ret (PC=0xec)
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd46: begin  // jal b0 <main> (PC=0xa8)
        alu_operand_a_ex_o = 32'h00000000;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd47: begin  // beqz a0,1dc <malloc_beebs+0x60> (PC=0x180)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_EQ;
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd48: begin  // bne a5,a1,20c <calloc_beebs+0x28> (PC=0x214)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_NE;
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd49: begin  // bgeu a1,a4,1b4 <malloc_beebs+0x38> (PC=0x1d8)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_GEU;
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd50: begin  // bnez a5,158 <init_heap_beebs+0x28> (PC=0x134)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_NE;
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd51: begin  // sub a1,a1,a6 (PC=0x1c0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_SUB;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd52: begin  // beq a7,a6,448 <_aes_set_key.part.0+0x188> (PC=0x38c)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_EQ;
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd53: begin  // seqz a0,a0 (PC=0xe4)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_SLTU;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd54: begin  // mul a0,a0,a5 (PC=0x100)
        en_wb_o = ex_valid_i & ~first_cycle;
        instr_type_wb_o = WB_INSTR_OTHER;
        mult_en_ex_o = 1'b1;
        mult_sel_ex_o = 1'b1;
        multdiv_operand_a_ex_o = rf_rdata_a;
        multdiv_operand_b_ex_o = rf_rdata_b;
        multdiv_operator_ex_o = MD_OP_MULL;
        multdiv_signed_mode_ex_o = 2'b00;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = ex_valid_i & ~first_cycle;
        rd_valid_o = 1'b1;
      end
      6'd55: begin  // bltu a1,a4,1dc <malloc_beebs+0x60> (PC=0x1b0)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_LTU;
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd56: begin  // neg a4,a4 (PC=0x13b4)
        alu_operand_a_ex_o = 32'h00000000;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_SUB;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd57: begin  // and a0,a0,a4 (PC=0x13bc)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_AND;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd58: begin  // auipc t0,0x12 (PC=0x88)
        alu_operand_a_ex_o = 32'h00000088;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd59: begin  // auipc t1,0x13 (PC=0x90)
        alu_operand_a_ex_o = 32'h00000090;
        alu_operand_b_ex_o = imm_val_i;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd60: begin  // bge t0,t1,a8 <bss_done> (PC=0x98)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_GE;
        en_wb_o = 1'b0;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_we_id_o = 1'b0;
      end
      6'd61: begin  // sltu a0,a5,a0 (PC=0x170)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = rf_rdata_b;
        alu_operator_ex_o = ALU_SLTU;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd62: begin  // xori a0,a0,1 (PC=0x174)
        alu_operand_a_ex_o = rf_rdata_a;
        alu_operand_b_ex_o = imm_val_i;
        alu_operator_ex_o = ALU_XOR;
        en_wb_o = 1'b1;
        instr_type_wb_o = WB_INSTR_OTHER;
        rf_ren_a_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = 1'b1;
        rd_valid_o = 1'b1;
      end
      6'd63: begin  // remu t2,a6,a1 (PC=0x390)
        div_en_ex_o = 1'b1;
        div_sel_ex_o = 1'b1;
        en_wb_o = ex_valid_i & ~first_cycle;
        instr_type_wb_o = WB_INSTR_OTHER;
        multdiv_operand_a_ex_o = rf_rdata_a;
        multdiv_operand_b_ex_o = rf_rdata_b;
        multdiv_operator_ex_o = MD_OP_REM;
        multdiv_signed_mode_ex_o = 2'b00;
        rf_ren_a_o = 1'b1;
        rf_ren_b_o = 1'b1;
        rf_wdata_id_o = result_ex_i;
        rf_we_id_o = ex_valid_i & ~first_cycle;
        rd_valid_o = 1'b1;
      end
      default: ;
    endcase
  end
endmodule

(* keep_hierarchy = "yes" *)
module field_rom import ibex_pkg::*; (
  input  logic [10:0] state_q_i,
  output logic [15:0] field_o
);
  always_comb begin
    field_o = '0;
    case (state_q_i)
      11'd864: field_o = 16'd32185;  // S0 lui sp,0x20 (PC=0x80)
      11'd0: field_o = 16'd1173;  // S1 addi sp,sp,-16 (PC=0x84)
      11'd1856: field_o = 16'd32289;  // S2 auipc t0,0x12 (PC=0x88)
      11'd104: field_o = 16'd2362;  // S3 addi t0,t0,1956 (PC=0x8c)
      11'd1888: field_o = 16'd16010;  // S4 auipc t1,0x13 (PC=0x90)
      11'd80: field_o = 16'd571;  // S5 addi t1,t1,-1132 (PC=0x94)
      11'd1920: field_o = 16'd32384;  // S6 bge t0,t1,a8 <bss_done> (PC=0x98)
      11'd994: field_o = 16'd32512;  // S7 sw zero,0(t0) (PC=0x9c)
      11'd105: field_o = 16'd2309;  // S8 addi t0,t0,4 (PC=0xa0)
      11'd1408: field_o = 16'd128;  // S9 j 98 <bss_loop> (PC=0xa4)
      11'd1472: field_o = 16'd1340;  // S10 jal b0 <main> (PC=0xa8)
      11'd1409: field_o = 16'd128;  // S11 j ac <loop> (PC=0xac)
      11'd1: field_o = 16'd1213;  // S12 addi sp,sp,-32 (PC=0xb0)
      11'd920: field_o = 16'd4109;  // S13 sw ra,28(sp) (PC=0xb4)
      11'd1473: field_o = 16'd1342;  // S14 jal 2ac <initialise_board> (PC=0xb8)
      11'd1474: field_o = 16'd1343;  // S15 jal 13e0 <initialise_benchmark> (PC=0xbc)
      11'd800: field_o = 16'd1792;  // S16 li a0,0 (PC=0xc0)
      11'd1475: field_o = 16'd1344;  // S17 jal 13e4 <warm_caches> (PC=0xc4)
      11'd1476: field_o = 16'd1345;  // S18 jal 2b0 <start_trigger> (PC=0xc8)
      11'd1477: field_o = 16'd1346;  // S19 jal 13f0 <benchmark> (PC=0xcc)
      11'd984: field_o = 16'd16135;  // S20 sw a0,12(sp) (PC=0xd0)
      11'd1478: field_o = 16'd1347;  // S21 jal 2b8 <stop_trigger> (PC=0xd4)
      11'd396: field_o = 16'd32647;  // S22 lw a0,12(sp) (PC=0xd8)
      11'd1479: field_o = 16'd1348;  // S23 jal 1370 <verify_benchmark> (PC=0xdc)
      11'd264: field_o = 16'd3341;  // S24 lw ra,28(sp) (PC=0xe0)
      11'd1696: field_o = 16'd1928;  // S25 seqz a0,a0 (PC=0xe4)
      11'd2: field_o = 16'd1166;  // S26 addi sp,sp,32 (PC=0xe8)
      11'd1440: field_o = 16'd256;  // S27 ret (PC=0xec)
      11'd865: field_o = 16'd32778;  // S28 lui a4,0x13 (PC=0xf0)
      11'd397: field_o = 16'd32939;  // S29 lw a0,-992(a4) (PC=0xf4)
      11'd768: field_o = 16'd837;  // S30 lui a5,0x41c65 (PC=0xf8)
      11'd32: field_o = 16'd70;  // S31 addi a5,a5,-403 (PC=0xfc)
      11'd1728: field_o = 16'd9344;  // S32 mul a0,a0,a5 (PC=0x100)
      11'd769: field_o = 16'd839;  // S33 lui a5,0x3 (PC=0x104)
      11'd33: field_o = 16'd72;  // S34 addi a5,a5,57 (PC=0x108)
      11'd500: field_o = 16'd9344;  // S35 add a0,a0,a5 (PC=0x10c)
      11'd648: field_o = 16'd1928;  // S36 slli a0,a0,0x1 (PC=0x110)
      11'd700: field_o = 16'd1928;  // S37 srli a0,a0,0x1 (PC=0x114)
      11'd995: field_o = 16'd33067;  // S38 sw a0,-992(a4) (PC=0x118)
      11'd701: field_o = 16'd1922;  // S39 srli a0,a0,0x10 (PC=0x11c)
      11'd1441: field_o = 16'd256;  // S40 ret (PC=0x120)
      11'd770: field_o = 16'd778;  // S41 lui a5,0x13 (PC=0x124)
      11'd986: field_o = 16'd16299;  // S42 sw a0,-992(a5) (PC=0x128)
      11'd1442: field_o = 16'd256;  // S43 ret (PC=0x12c)
      11'd1148: field_o = 16'd9488;  // S44 andi a5,a1,3 (PC=0x130)
      11'd1603: field_o = 16'd5129;  // S45 bnez a5,158 <init_heap_beebs+0x28> (PC=0x134)
      11'd771: field_o = 16'd778;  // S46 lui a5,0x13 (PC=0x138)
      11'd501: field_o = 16'd33152;  // S47 add a1,a0,a1 (PC=0x13c)
      11'd987: field_o = 16'd16300;  // S48 sw a0,-996(a5) (PC=0x140)
      11'd772: field_o = 16'd778;  // S49 lui a5,0x13 (PC=0x144)
      11'd996: field_o = 16'd2850;  // S50 sw a1,-1000(a5) (PC=0x148)
      11'd773: field_o = 16'd778;  // S51 lui a5,0x13 (PC=0x14c)
      11'd997: field_o = 16'd5151;  // S52 sw zero,-1004(a5) (PC=0x150)
      11'd1443: field_o = 16'd256;  // S53 ret (PC=0x154)
      11'd1410: field_o = 16'd128;  // S54 j 158 <init_heap_beebs+0x28> (PC=0x158)
      11'd774: field_o = 16'd778;  // S55 lui a5,0x13 (PC=0x15c)
      11'd340: field_o = 16'd4255;  // S56 lw a4,-1004(a5) (PC=0x160)
      11'd775: field_o = 16'd778;  // S57 lui a5,0x13 (PC=0x164)
      11'd308: field_o = 16'd34;  // S58 lw a5,-1000(a5) (PC=0x168)
      11'd502: field_o = 16'd16384;  // S59 add a0,a0,a4 (PC=0x16c)
      11'd1952: field_o = 16'd33280;  // S60 sltu a0,a5,a0 (PC=0x170)
      11'd1984: field_o = 16'd1928;  // S61 xori a0,a0,1 (PC=0x174)
      11'd1444: field_o = 16'd256;  // S62 ret (PC=0x178)
      11'd156: field_o = 16'd3456;  // S63 mv a5,a0 (PC=0x17c)
      11'd1504: field_o = 16'd6153;  // S64 beqz a0,1dc <malloc_beebs+0x60> (PC=0x180)
      11'd828: field_o = 16'd6282;  // S65 lui a2,0x13 (PC=0x184)
      11'd398: field_o = 16'd33452;  // S66 lw a0,-996(a2) (PC=0x188)
      11'd836: field_o = 16'd9610;  // S67 lui a3,0x13 (PC=0x18c)
      11'd399: field_o = 16'd33567;  // S68 lw a1,-1004(a3) (PC=0x190)
      11'd503: field_o = 16'd33664;  // S69 add a4,a0,a5 (PC=0x194)
      11'd1174: field_o = 16'd9744;  // S70 andi a6,a4,3 (PC=0x198)
      11'd480: field_o = 16'd16512;  // S71 add a5,a5,a1 (PC=0x19c)
      11'd1600: field_o = 16'd9865;  // S72 bnez a6,1bc <malloc_beebs+0x40> (PC=0x1a0)
      11'd816: field_o = 16'd2058;  // S73 lui a1,0x13 (PC=0x1a4)
      11'd342: field_o = 16'd5282;  // S74 lw a1,-1000(a1) (PC=0x1a8)
      11'd988: field_o = 16'd10015;  // S75 sw a5,-1004(a3) (PC=0x1ac)
      11'd1760: field_o = 16'd4352;  // S76 bltu a1,a4,1dc <malloc_beebs+0x60> (PC=0x1b0)
      11'd998: field_o = 16'd33836;  // S77 sw a4,-996(a2) (PC=0x1b4)
      11'd1445: field_o = 16'd256;  // S78 ret (PC=0x1b8)
      11'd817: field_o = 16'd2053;  // S79 li a1,4 (PC=0x1bc)
      11'd1632: field_o = 16'd33920;  // S80 sub a1,a1,a6 (PC=0x1c0)
      11'd481: field_o = 16'd16512;  // S81 add a5,a5,a1 (PC=0x1c4)
      11'd504: field_o = 16'd34048;  // S82 add a4,a4,a1 (PC=0x1c8)
      11'd818: field_o = 16'd2058;  // S83 lui a1,0x13 (PC=0x1cc)
      11'd343: field_o = 16'd5282;  // S84 lw a1,-1000(a1) (PC=0x1d0)
      11'd989: field_o = 16'd10015;  // S85 sw a5,-1004(a3) (PC=0x1d4)
      11'd1576: field_o = 16'd4352;  // S86 bgeu a1,a4,1b4 <malloc_beebs+0x38> (PC=0x1d8)
      11'd801: field_o = 16'd1792;  // S87 li a0,0 (PC=0x1dc)
      11'd1446: field_o = 16'd256;  // S88 ret (PC=0x1e0)
      11'd3: field_o = 16'd1173;  // S89 addi sp,sp,-16 (PC=0x1e4)
      11'd912: field_o = 16'd3585;  // S90 sw s0,8(sp) (PC=0x1e8)
      11'd1729: field_o = 16'd34176;  // S91 mul s0,a0,a1 (PC=0x1ec)
      11'd921: field_o = 16'd4103;  // S92 sw ra,12(sp) (PC=0x1f0)
      11'd208: field_o = 16'd34304;  // S93 mv a0,s0 (PC=0x1f4)
      11'd1480: field_o = 16'd1353;  // S94 jal 17c <malloc_beebs> (PC=0x1f8)
      11'd1505: field_o = 16'd6153;  // S95 beqz a0,218 <calloc_beebs+0x34> (PC=0x1fc)
      11'd1516: field_o = 16'd34441;  // S96 beqz s0,218 <calloc_beebs+0x34> (PC=0x200)
      11'd505: field_o = 16'd34560;  // S97 add a1,a0,s0 (PC=0x204)
      11'd157: field_o = 16'd3456;  // S98 mv a5,a0 (PC=0x208)
      11'd34: field_o = 16'd8;  // S99 addi a5,a5,1 (PC=0x20c)
      11'd1376: field_o = 16'd5168;  // S100 sb zero,-1(a5) (PC=0x210)
      11'd1538: field_o = 16'd2816;  // S101 bne a5,a1,20c <calloc_beebs+0x28> (PC=0x214)
      11'd265: field_o = 16'd3335;  // S102 lw ra,12(sp) (PC=0x218)
      11'd256: field_o = 16'd2945;  // S103 lw s0,8(sp) (PC=0x21c)
      11'd4: field_o = 16'd1154;  // S104 addi sp,sp,16 (PC=0x220)
      11'd1447: field_o = 16'd256;  // S105 ret (PC=0x224)
      11'd1506: field_o = 16'd6153;  // S106 beqz a0,2a0 <realloc_beebs+0x78> (PC=0x228)
      11'd5: field_o = 16'd1173;  // S107 addi sp,sp,-16 (PC=0x22c)
      11'd913: field_o = 16'd3585;  // S108 sw s0,8(sp) (PC=0x230)
      11'd112: field_o = 16'd10112;  // S109 mv s0,a0 (PC=0x234)
      11'd158: field_o = 16'd16640;  // S110 mv a0,a1 (PC=0x238)
      11'd928: field_o = 16'd4485;  // S111 sw s1,4(sp) (PC=0x23c)
      11'd922: field_o = 16'd4103;  // S112 sw ra,12(sp) (PC=0x240)
      11'd209: field_o = 16'd16768;  // S113 mv s1,a1 (PC=0x244)
      11'd1481: field_o = 16'd1354;  // S114 jal 17c <malloc_beebs> (PC=0x248)
      11'd1507: field_o = 16'd6153;  // S115 beqz a0,288 <realloc_beebs+0x60> (PC=0x24c)
      11'd210: field_o = 16'd34688;  // S116 mv a5,s0 (PC=0x250)
      11'd211: field_o = 16'd10240;  // S117 mv a4,a0 (PC=0x254)
      11'd506: field_o = 16'd34816;  // S118 add a2,s0,s1 (PC=0x258)
      11'd1517: field_o = 16'd34953;  // S119 beqz s1,274 <realloc_beebs+0x4c> (PC=0x25c)
      11'd1098: field_o = 16'd4608;  // S120 lbu a3,0(a5) (PC=0x260)
      11'd35: field_o = 16'd8;  // S121 addi a5,a5,1 (PC=0x264)
      11'd108: field_o = 16'd392;  // S122 addi a4,a4,1 (PC=0x268)
      11'd1377: field_o = 16'd16944;  // S123 sb a3,-1(a4) (PC=0x26c)
      11'd1539: field_o = 16'd35072;  // S124 bne a5,a2,260 <realloc_beebs+0x38> (PC=0x270)
      11'd266: field_o = 16'd3335;  // S125 lw ra,12(sp) (PC=0x274)
      11'd257: field_o = 16'd2945;  // S126 lw s0,8(sp) (PC=0x278)
      11'd272: field_o = 16'd3717;  // S127 lw s1,4(sp) (PC=0x27c)
      11'd6: field_o = 16'd1154;  // S128 addi sp,sp,16 (PC=0x280)
      11'd1448: field_o = 16'd256;  // S129 ret (PC=0x284)
      11'd267: field_o = 16'd3335;  // S130 lw ra,12(sp) (PC=0x288)
      11'd258: field_o = 16'd2945;  // S131 lw s0,8(sp) (PC=0x28c)
      11'd273: field_o = 16'd3717;  // S132 lw s1,4(sp) (PC=0x290)
      11'd802: field_o = 16'd1792;  // S133 li a0,0 (PC=0x294)
      11'd7: field_o = 16'd1154;  // S134 addi sp,sp,16 (PC=0x298)
      11'd1449: field_o = 16'd256;  // S135 ret (PC=0x29c)
      11'd803: field_o = 16'd1792;  // S136 li a0,0 (PC=0x2a0)
      11'd1450: field_o = 16'd256;  // S137 ret (PC=0x2a4)
      11'd1451: field_o = 16'd256;  // S138 ret (PC=0x2a8)
      11'd1452: field_o = 16'd256;  // S139 ret (PC=0x2ac)
      11'd1411: field_o = 16'd128;  // S140 nop  (PC=0x2b0)
      11'd1453: field_o = 16'd256;  // S141 ret (PC=0x2b4)
      11'd1412: field_o = 16'd128;  // S142 nop  (PC=0x2b8)
      11'd1454: field_o = 16'd256;  // S143 ret (PC=0x2bc)
      11'd88: field_o = 16'd1928;  // S144 addi a0,a0,1 (PC=0x2c0)
      11'd658: field_o = 16'd10374;  // S145 slli a7,a0,0x2 (PC=0x2c4)
      11'd1508: field_o = 16'd10505;  // S146 beqz a1,310 <_aes_set_key.part.0+0x50> (PC=0x2c8)
      11'd659: field_o = 16'd35206;  // S147 slli t3,a1,0x2 (PC=0x2cc)
      11'd160: field_o = 16'd17024;  // S148 mv a6,a2 (PC=0x2d0)
      11'd507: field_o = 16'd35328;  // S149 add t3,a3,t3 (PC=0x2d4)
      11'd1099: field_o = 16'd5392;  // S150 lbu a5,3(a3) (PC=0x2d8)
      11'd1100: field_o = 16'd35462;  // S151 lbu a0,2(a3) (PC=0x2dc)
      11'd1101: field_o = 16'd10624;  // S152 lbu t1,0(a3) (PC=0x2e0)
      11'd1040: field_o = 16'd10760;  // S153 lbu a4,1(a3) (PC=0x2e4)
      11'd560: field_o = 16'd3;  // S154 slli a5,a5,0x18 (PC=0x2e8)
      11'd649: field_o = 16'd1922;  // S155 slli a0,a0,0x10 (PC=0x2ec)
      11'd1262: field_o = 16'd35584;  // S156 or a5,a5,a0 (PC=0x2f0)
      11'd1263: field_o = 16'd17152;  // S157 or a5,a5,t1 (PC=0x2f4)
      11'd544: field_o = 16'd385;  // S158 slli a4,a4,0x8 (PC=0x2f8)
      11'd1220: field_o = 16'd10880;  // S159 or a5,a5,a4 (PC=0x2fc)
      11'd999: field_o = 16'd35712;  // S160 sw a5,0(a6) (PC=0x300)
      11'd96: field_o = 16'd645;  // S161 addi a3,a3,4 (PC=0x304)
      11'd64: field_o = 16'd1541;  // S162 addi a6,a6,4 (PC=0x308)
      11'd1540: field_o = 16'd35840;  // S163 bne t3,a3,2d8 <_aes_set_key.part.0+0x18> (PC=0x30c)
      11'd1577: field_o = 16'd11008;  // S164 bgeu a1,a7,448 <_aes_set_key.part.0+0x188> (PC=0x310)
      11'd660: field_o = 16'd35974;  // S165 slli t4,a1,0x2 (PC=0x314)
      11'd468: field_o = 16'd11136;  // S166 add a5,a2,t4 (PC=0x318)
      11'd860: field_o = 16'd17315;  // S167 lui t3,0x10 (PC=0x31c)
      11'd804: field_o = 16'd1828;  // S168 lui a0,0x11 (PC=0x320)
      11'd341: field_o = 16'd4256;  // S169 lw a4,-4(a5) (PC=0x324)
      11'd162: field_o = 16'd17408;  // S170 mv a6,a1 (PC=0x328)
      11'd72: field_o = 16'd896;  // S171 mv t3,t3 (PC=0x32c)
      11'd866: field_o = 16'd36113;  // S172 li t5,6 (PC=0x330)
      11'd867: field_o = 16'd36229;  // S173 li t6,4 (PC=0x334)
      11'd89: field_o = 16'd1957;  // S174 addi a0,a0,1292 (PC=0x338)
      11'd1413: field_o = 16'd128;  // S175 j 390 <_aes_set_key.part.0+0xd0> (PC=0x33c)
      11'd1102: field_o = 16'd36352;  // S176 lbu a4,0(t0) (PC=0x340)
      11'd1024: field_o = 16'd640;  // S177 lbu a3,0(a3) (PC=0x344)
      11'd1103: field_o = 16'd36480;  // S178 lbu t0,0(t1) (PC=0x348)
      11'd1028: field_o = 16'd0;  // S179 lbu a5,0(a5) (PC=0x34c)
      11'd545: field_o = 16'd387;  // S180 slli a4,a4,0x18 (PC=0x350)
      11'd1104: field_o = 16'd17536;  // S181 lbu t1,0(t3) (PC=0x354)
      11'd1264: field_o = 16'd36608;  // S182 or a4,a4,t0 (PC=0x358)
      11'd616: field_o = 16'd641;  // S183 slli a3,a3,0x8 (PC=0x35c)
      11'd1216: field_o = 16'd5504;  // S184 or a4,a4,a3 (PC=0x360)
      11'd561: field_o = 16'd2;  // S185 slli a5,a5,0x10 (PC=0x364)
      11'd1265: field_o = 16'd36736;  // S186 or a4,a4,a5 (PC=0x368)
      11'd1308: field_o = 16'd17664;  // S187 xor a4,a4,t1 (PC=0x36c)
      11'd73: field_o = 16'd904;  // S188 addi t3,t3,1 (PC=0x370)
      11'd344: field_o = 16'd6400;  // S189 lw a3,0(a2) (PC=0x374)
      11'd469: field_o = 16'd11136;  // S190 add a5,a2,t4 (PC=0x378)
      11'd65: field_o = 16'd1544;  // S191 addi a6,a6,1 (PC=0x37c)
      11'd1280: field_o = 16'd5504;  // S192 xor a4,a4,a3 (PC=0x380)
      11'd990: field_o = 16'd17792;  // S193 sw a4,0(a5) (PC=0x384)
      11'd48: field_o = 16'd2437;  // S194 addi a2,a2,4 (PC=0x388)
      11'd1666: field_o = 16'd17920;  // S195 beq a7,a6,448 <_aes_set_key.part.0+0x188> (PC=0x38c)
      11'd2016: field_o = 16'd36864;  // S196 remu t2,a6,a1 (PC=0x390)
      11'd702: field_o = 16'd6529;  // S197 srli a3,a4,0x8 (PC=0x394)
      11'd661: field_o = 16'd36995;  // S198 slli a5,a4,0x18 (PC=0x398)
      11'd1222: field_o = 16'd18048;  // S199 or a5,a5,a3 (PC=0x39c)
      11'd704: field_o = 16'd6659;  // S200 srli t1,a5,0x18 (PC=0x3a0)
      11'd688: field_o = 16'd4609;  // S201 srli a3,a5,0x8 (PC=0x3a4)
      11'd508: field_o = 16'd37120;  // S202 add t0,a0,t1 (PC=0x3a8)
      11'd1175: field_o = 16'd6660;  // S203 zext.b t1,a5 (PC=0x3ac)
      11'd672: field_o = 16'd2;  // S204 srli a5,a5,0x10 (PC=0x3b0)
      11'd1136: field_o = 16'd644;  // S205 zext.b a3,a3 (PC=0x3b4)
      11'd1120: field_o = 16'd4;  // S206 zext.b a5,a5 (PC=0x3b8)
      11'd509: field_o = 16'd37248;  // S207 add t1,a0,t1 (PC=0x3bc)
      11'd510: field_o = 16'd37376;  // S208 add a3,a0,a3 (PC=0x3c0)
      11'd511: field_o = 16'd37504;  // S209 add a5,a0,a5 (PC=0x3c4)
      11'd1518: field_o = 16'd37641;  // S210 beqz t2,340 <_aes_set_key.part.0+0x80> (PC=0x3c8)
      11'd1578: field_o = 16'd37760;  // S211 bgeu t5,a1,374 <_aes_set_key.part.0+0xb4> (PC=0x3cc)
      11'd1541: field_o = 16'd37888;  // S212 bne t2,t6,374 <_aes_set_key.part.0+0xb4> (PC=0x3d0)
      11'd776: field_o = 16'd804;  // S213 lui a5,0x11 (PC=0x3d4)
      11'd36: field_o = 16'd37;  // S214 addi a5,a5,1292 (PC=0x3d8)
      11'd703: field_o = 16'd6531;  // S215 srli a3,a4,0x18 (PC=0x3dc)
      11'd738: field_o = 16'd11265;  // S216 srli t1,a4,0x8 (PC=0x3e0)
      11'd1176: field_o = 16'd18180;  // S217 zext.b t0,a4 (PC=0x3e4)
      11'd512: field_o = 16'd38016;  // S218 add a3,a5,a3 (PC=0x3e8)
      11'd1128: field_o = 16'd516;  // S219 zext.b t1,t1 (PC=0x3ec)
      11'd1025: field_o = 16'd640;  // S220 lbu a3,0(a3) (PC=0x3f0)
      11'd513: field_o = 16'd38144;  // S221 add t0,a5,t0 (PC=0x3f4)
      11'd514: field_o = 16'd38272;  // S222 add t1,a5,t1 (PC=0x3f8)
      11'd680: field_o = 16'd386;  // S223 srli a4,a4,0x10 (PC=0x3fc)
      11'd1152: field_o = 16'd388;  // S224 zext.b a4,a4 (PC=0x400)
      11'd1032: field_o = 16'd2304;  // S225 lbu t0,0(t0) (PC=0x404)
      11'd1036: field_o = 16'd512;  // S226 lbu t1,0(t1) (PC=0x408)
      11'd515: field_o = 16'd10880;  // S227 add a5,a5,a4 (PC=0x40c)
      11'd1105: field_o = 16'd4224;  // S228 lbu a4,0(a5) (PC=0x410)
      11'd662: field_o = 16'd5379;  // S229 slli a5,a3,0x18 (PC=0x414)
      11'd1266: field_o = 16'd11392;  // S230 or a5,a5,t0 (PC=0x418)
      11'd663: field_o = 16'd38401;  // S231 slli a3,t1,0x8 (PC=0x41c)
      11'd1223: field_o = 16'd18048;  // S232 or a5,a5,a3 (PC=0x420)
      11'd345: field_o = 16'd6400;  // S233 lw a3,0(a2) (PC=0x424)
      11'd546: field_o = 16'd386;  // S234 slli a4,a4,0x10 (PC=0x428)
      11'd1267: field_o = 16'd38528;  // S235 or a4,a5,a4 (PC=0x42c)
      11'd1281: field_o = 16'd5504;  // S236 xor a4,a4,a3 (PC=0x430)
      11'd470: field_o = 16'd11136;  // S237 add a5,a2,t4 (PC=0x434)
      11'd66: field_o = 16'd1544;  // S238 addi a6,a6,1 (PC=0x438)
      11'd991: field_o = 16'd17792;  // S239 sw a4,0(a5) (PC=0x43c)
      11'd49: field_o = 16'd2437;  // S240 addi a2,a2,4 (PC=0x440)
      11'd1542: field_o = 16'd17920;  // S241 bne a7,a6,390 <_aes_set_key.part.0+0xd0> (PC=0x444)
      11'd1455: field_o = 16'd256;  // S242 ret (PC=0x448)
      11'd1512: field_o = 16'd18313;  // S243 beqz a3,9a4 <_nettle_aes_encrypt.part.0+0x558> (PC=0x44c)
      11'd8: field_o = 16'd1201;  // S244 addi sp,sp,-64 (PC=0x450)
      11'd936: field_o = 16'd6806;  // S245 sw s2,52(sp) (PC=0x454)
      11'd164: field_o = 16'd18432;  // S246 mv s2,a0 (PC=0x458)
      11'd940: field_o = 16'd11543;  // S247 sw s3,48(sp) (PC=0x45c)
      11'd650: field_o = 16'd18565;  // S248 slli s3,s2,0x4 (PC=0x460)
      11'd116: field_o = 16'd11648;  // S249 mv a0,a5 (PC=0x464)
      11'd56: field_o = 16'd3845;  // S250 addi a5,s3,4 (PC=0x468)
      11'd896: field_o = 16'd2565;  // S251 sw a5,4(sp) (PC=0x46c)
      11'd57: field_o = 16'd3841;  // S252 addi a5,s3,8 (PC=0x470)
      11'd897: field_o = 16'd2561;  // S253 sw a5,8(sp) (PC=0x474)
      11'd58: field_o = 16'd3847;  // S254 addi a5,s3,12 (PC=0x478)
      11'd914: field_o = 16'd3608;  // S255 sw s0,60(sp) (PC=0x47c)
      11'd898: field_o = 16'd2567;  // S256 sw a5,12(sp) (PC=0x480)
      11'd166: field_o = 16'd18688;  // S257 mv s0,a1 (PC=0x484)
      11'd482: field_o = 16'd18816;  // S258 add a5,a4,a3 (PC=0x488)
      11'd929: field_o = 16'd4505;  // S259 sw s1,56(sp) (PC=0x48c)
      11'd944: field_o = 16'd11802;  // S260 sw s4,44(sp) (PC=0x490)
      11'd948: field_o = 16'd11931;  // S261 sw s5,40(sp) (PC=0x494)
      11'd952: field_o = 16'd12060;  // S262 sw s6,36(sp) (PC=0x498)
      11'd956: field_o = 16'd12174;  // S263 sw s7,32(sp) (PC=0x49c)
      11'd960: field_o = 16'd12301;  // S264 sw s8,28(sp) (PC=0x4a0)
      11'd964: field_o = 16'd12419;  // S265 sw s9,24(sp) (PC=0x4a4)
      11'd968: field_o = 16'd12573;  // S266 sw s10,20(sp) (PC=0x4a8)
      11'd972: field_o = 16'd12674;  // S267 sw s11,16(sp) (PC=0x4ac)
      11'd168: field_o = 16'd18944;  // S268 mv a1,a4 (PC=0x4b0)
      11'd484: field_o = 16'd19072;  // S269 add s1,s0,s3 (PC=0x4b4)
      11'd899: field_o = 16'd2560;  // S270 sw a5,0(sp) (PC=0x4b8)
      11'd1042: field_o = 16'd19208;  // S271 lbu t2,1(a0) (PC=0x4bc)
      11'd1044: field_o = 16'd19366;  // S272 lbu t0,5(a0) (PC=0x4c0)
      11'd1046: field_o = 16'd19495;  // S273 lbu t6,9(a0) (PC=0x4c4)
      11'd1048: field_o = 16'd19624;  // S274 lbu t5,13(a0) (PC=0x4c8)
      11'd1050: field_o = 16'd19712;  // S275 lbu s7,0(a0) (PC=0x4cc)
      11'd1052: field_o = 16'd12806;  // S276 lbu t4,2(a0) (PC=0x4d0)
      11'd1054: field_o = 16'd19845;  // S277 lbu s6,4(a0) (PC=0x4d4)
      11'd1056: field_o = 16'd12945;  // S278 lbu t3,6(a0) (PC=0x4d8)
      11'd1058: field_o = 16'd19969;  // S279 lbu s5,8(a0) (PC=0x4dc)
      11'd1060: field_o = 16'd20126;  // S280 lbu t1,10(a0) (PC=0x4e0)
      11'd1062: field_o = 16'd20231;  // S281 lbu s4,12(a0) (PC=0x4e4)
      11'd1064: field_o = 16'd6923;  // S282 lbu a6,14(a0) (PC=0x4e8)
      11'd1066: field_o = 16'd3472;  // S283 lbu a5,3(a0) (PC=0x4ec)
      11'd1068: field_o = 16'd10281;  // S284 lbu a4,7(a0) (PC=0x4f0)
      11'd1070: field_o = 16'd10410;  // S285 lbu a7,11(a0) (PC=0x4f4)
      11'd1072: field_o = 16'd20367;  // S286 lbu a3,15(a0) (PC=0x4f8)
      11'd644: field_o = 16'd3969;  // S287 slli t2,t2,0x8 (PC=0x4fc)
      11'd624: field_o = 16'd2305;  // S288 slli t0,t0,0x8 (PC=0x500)
      11'd584: field_o = 16'd2177;  // S289 slli t6,t6,0x8 (PC=0x504)
      11'd592: field_o = 16'd1665;  // S290 slli t5,t5,0x8 (PC=0x508)
      11'd346: field_o = 16'd20480;  // S291 lw s8,0(s0) (PC=0x50c)
      11'd348: field_o = 16'd20613;  // S292 lw s9,4(s0) (PC=0x510)
      11'd350: field_o = 16'd20737;  // S293 lw s10,8(s0) (PC=0x514)
      11'd352: field_o = 16'd20871;  // S294 lw s11,12(s0) (PC=0x518)
      11'd1224: field_o = 16'd20992;  // S295 or t2,t2,s7 (PC=0x51c)
      11'd568: field_o = 16'd1410;  // S296 slli t4,t4,0x10 (PC=0x520)
      11'd1226: field_o = 16'd21120;  // S297 or t0,t0,s6 (PC=0x524)
      11'd600: field_o = 16'd898;  // S298 slli t3,t3,0x10 (PC=0x528)
      11'd1228: field_o = 16'd21248;  // S299 or t6,t6,s5 (PC=0x52c)
      11'd608: field_o = 16'd514;  // S300 slli t1,t1,0x10 (PC=0x530)
      11'd1230: field_o = 16'd21376;  // S301 or t5,t5,s4 (PC=0x534)
      11'd628: field_o = 16'd1538;  // S302 slli a6,a6,0x10 (PC=0x538)
      11'd1232: field_o = 16'd21504;  // S303 or a6,a6,t5 (PC=0x53c)
      11'd1234: field_o = 16'd21632;  // S304 or t4,t4,t2 (PC=0x540)
      11'd562: field_o = 16'd3;  // S305 slli a5,a5,0x18 (PC=0x544)
      11'd1236: field_o = 16'd21760;  // S306 or t3,t3,t0 (PC=0x548)
      11'd547: field_o = 16'd387;  // S307 slli a4,a4,0x18 (PC=0x54c)
      11'd1238: field_o = 16'd21888;  // S308 or t1,t1,t6 (PC=0x550)
      11'd576: field_o = 16'd1027;  // S309 slli a7,a7,0x18 (PC=0x554)
      11'd617: field_o = 16'd643;  // S310 slli a3,a3,0x18 (PC=0x558)
      11'd1240: field_o = 16'd22016;  // S311 or a3,a3,a6 (PC=0x55c)
      11'd1268: field_o = 16'd38656;  // S312 or a5,a5,t4 (PC=0x560)
      11'd1269: field_o = 16'd38784;  // S313 or a4,a4,t3 (PC=0x564)
      11'd1242: field_o = 16'd22144;  // S314 or a7,a7,t1 (PC=0x568)
      11'd840: field_o = 16'd13064;  // S315 li a6,1 (PC=0x56c)
      11'd1309: field_o = 16'd38912;  // S316 xor a5,a5,s8 (PC=0x570)
      11'd1310: field_o = 16'd39040;  // S317 xor a4,a4,s9 (PC=0x574)
      11'd1282: field_o = 16'd22272;  // S318 xor a7,a7,s10 (PC=0x578)
      11'd1284: field_o = 16'd22400;  // S319 xor a3,a3,s11 (PC=0x57c)
      11'd1574: field_o = 16'd22528;  // S320 bgeu a6,s2,990 <_nettle_aes_encrypt.part.0+0x544> (PC=0x580)
      11'd212: field_o = 16'd39170;  // S321 addi s4,s0,16 (PC=0x584)
      11'd213: field_o = 16'd6656;  // S322 mv t1,a5 (PC=0x588)
      11'd214: field_o = 16'd13184;  // S323 mv t5,a7 (PC=0x58c)
      11'd706: field_o = 16'd22659;  // S324 srli s7,a3,0x18 (PC=0x590)
      11'd1177: field_o = 16'd39300;  // S325 zext.b s6,a4 (PC=0x594)
      11'd1178: field_o = 16'd39428;  // S326 zext.b t2,t5 (PC=0x598)
      11'd739: field_o = 16'd18179;  // S327 srli t0,a4,0x18 (PC=0x59c)
      11'd1156: field_o = 16'd22788;  // S328 zext.b s8,t1 (PC=0x5a0)
      11'd1158: field_o = 16'd22916;  // S329 zext.b s9,a3 (PC=0x5a4)
      11'd740: field_o = 16'd39555;  // S330 srli s5,t1,0x18 (PC=0x5a8)
      11'd741: field_o = 16'd39683;  // S331 srli t6,t5,0x18 (PC=0x5ac)
      11'd120: field_o = 16'd2706;  // S332 addi s7,s7,832 (PC=0x5b0)
      11'd170: field_o = 16'd3084;  // S333 addi s6,s6,64 (PC=0x5b4)
      11'd172: field_o = 16'd3980;  // S334 addi t2,t2,64 (PC=0x5b8)
      11'd106: field_o = 16'd2322;  // S335 addi t0,t0,832 (PC=0x5bc)
      11'd124: field_o = 16'd5644;  // S336 addi s8,s8,64 (PC=0x5c0)
      11'd174: field_o = 16'd3218;  // S337 addi s5,s5,832 (PC=0x5c4)
      11'd176: field_o = 16'd4748;  // S338 addi s9,s9,64 (PC=0x5c8)
      11'd178: field_o = 16'd2194;  // S339 addi t6,t6,832 (PC=0x5cc)
      11'd632: field_o = 16'd2694;  // S340 slli s7,s7,0x2 (PC=0x5d0)
      11'd636: field_o = 16'd3078;  // S341 slli s6,s6,0x2 (PC=0x5d4)
      11'd645: field_o = 16'd3974;  // S342 slli t2,t2,0x2 (PC=0x5d8)
      11'd625: field_o = 16'd2310;  // S343 slli t0,t0,0x2 (PC=0x5dc)
      11'd708: field_o = 16'd7042;  // S344 srli a6,a3,0x10 (PC=0x5e0)
      11'd215: field_o = 16'd39808;  // S345 mv a7,a4 (PC=0x5e4)
      11'd742: field_o = 16'd39937;  // S346 srli t4,t5,0x8 (PC=0x5e8)
      11'd681: field_o = 16'd385;  // S347 srli a4,a4,0x8 (PC=0x5ec)
      11'd743: field_o = 16'd1666;  // S348 srli t5,t5,0x10 (PC=0x5f0)
      11'd652: field_o = 16'd4742;  // S349 slli s9,s9,0x2 (PC=0x5f4)
      11'd416: field_o = 16'd7168;  // S350 add s7,a2,s7 (PC=0x5f8)
      11'd420: field_o = 16'd7296;  // S351 add s6,a2,s6 (PC=0x5fc)
      11'd472: field_o = 16'd13312;  // S352 add t2,a2,t2 (PC=0x600)
      11'd424: field_o = 16'd7424;  // S353 add t0,a2,t0 (PC=0x604)
      11'd654: field_o = 16'd5638;  // S354 slli s8,s8,0x2 (PC=0x608)
      11'd640: field_o = 16'd3206;  // S355 slli s5,s5,0x2 (PC=0x60c)
      11'd585: field_o = 16'd2182;  // S356 slli t6,t6,0x2 (PC=0x610)
      11'd354: field_o = 16'd23040;  // S357 lw s10,0(s7) (PC=0x614)
      11'd180: field_o = 16'd23168;  // S358 mv a5,t1 (PC=0x618)
      11'd400: field_o = 16'd40064;  // S359 lw s7,0(t2) (PC=0x61c)
      11'd744: field_o = 16'd40193;  // S360 srli t3,a3,0x8 (PC=0x620)
      11'd486: field_o = 16'd23296;  // S361 add s8,a2,s8 (PC=0x624)
      11'd1179: field_o = 16'd6532;  // S362 zext.b a3,a4 (PC=0x628)
      11'd428: field_o = 16'd7552;  // S363 add s5,a2,s5 (PC=0x62c)
      11'd1180: field_o = 16'd40324;  // S364 zext.b a4,t5 (PC=0x630)
      11'd432: field_o = 16'd7680;  // S365 add t6,a2,t6 (PC=0x634)
      11'd1160: field_o = 16'd23428;  // S366 zext.b t5,a6 (PC=0x638)
      11'd745: field_o = 16'd513;  // S367 srli t1,t1,0x8 (PC=0x63c)
      11'd488: field_o = 16'd23552;  // S368 add a6,a2,s9 (PC=0x640)
      11'd356: field_o = 16'd23680;  // S369 lw s9,0(s6) (PC=0x644)
      11'd358: field_o = 16'd23808;  // S370 lw s6,0(t0) (PC=0x648)
      11'd360: field_o = 16'd23936;  // S371 lw s11,0(s8) (PC=0x64c)
      11'd1140: field_o = 16'd1412;  // S372 zext.b t4,t4 (PC=0x650)
      11'd362: field_o = 16'd24064;  // S373 lw s8,0(s5) (PC=0x654)
      11'd1144: field_o = 16'd900;  // S374 zext.b t3,t3 (PC=0x658)
      11'd364: field_o = 16'd24192;  // S375 lw s5,0(t6) (PC=0x65c)
      11'd673: field_o = 16'd2;  // S376 srli a5,a5,0x10 (PC=0x660)
      11'd366: field_o = 16'd24321;  // S377 lw t6,8(s4) (PC=0x664)
      11'd1129: field_o = 16'd516;  // S378 zext.b t1,t1 (PC=0x668)
      11'd692: field_o = 16'd1026;  // S379 srli a7,a7,0x10 (PC=0x66c)
      11'd97: field_o = 16'd659;  // S380 addi a3,a3,320 (PC=0x670)
      11'd128: field_o = 16'd1427;  // S381 addi t4,t4,320 (PC=0x674)
      11'd74: field_o = 16'd915;  // S382 addi t3,t3,320 (PC=0x678)
      11'd1121: field_o = 16'd4;  // S383 zext.b a5,a5 (PC=0x67c)
      11'd81: field_o = 16'd531;  // S384 addi t1,t1,320 (PC=0x680)
      11'd1162: field_o = 16'd1028;  // S385 zext.b a7,a7 (PC=0x684)
      11'd368: field_o = 16'd1536;  // S386 lw a6,0(a6) (PC=0x688)
      11'd618: field_o = 16'd646;  // S387 slli a3,a3,0x2 (PC=0x68c)
      11'd109: field_o = 16'd404;  // S388 addi a4,a4,576 (PC=0x690)
      11'd569: field_o = 16'd1414;  // S389 slli t4,t4,0x2 (PC=0x694)
      11'd182: field_o = 16'd1684;  // S390 addi t5,t5,576 (PC=0x698)
      11'd601: field_o = 16'd902;  // S391 slli t3,t3,0x2 (PC=0x69c)
      11'd37: field_o = 16'd20;  // S392 addi a5,a5,576 (PC=0x6a0)
      11'd609: field_o = 16'd518;  // S393 slli t1,t1,0x2 (PC=0x6a4)
      11'd132: field_o = 16'd1044;  // S394 addi a7,a7,576 (PC=0x6a8)
      11'd1286: field_o = 16'd24448;  // S395 xor s6,s7,s6 (PC=0x6ac)
      11'd401: field_o = 16'd40448;  // S396 lw t2,0(s4) (PC=0x6b0)
      11'd402: field_o = 16'd40581;  // S397 lw t0,4(s4) (PC=0x6b4)
      11'd1288: field_o = 16'd24576;  // S398 xor s6,s6,t6 (PC=0x6b8)
      11'd436: field_o = 16'd7808;  // S399 add a3,a2,a3 (PC=0x6bc)
      11'd367: field_o = 16'd24327;  // S400 lw t6,12(s4) (PC=0x6c0)
      11'd548: field_o = 16'd390;  // S401 slli a4,a4,0x2 (PC=0x6c4)
      11'd440: field_o = 16'd7936;  // S402 add t4,a2,t4 (PC=0x6c8)
      11'd593: field_o = 16'd1670;  // S403 slli t5,t5,0x2 (PC=0x6cc)
      11'd444: field_o = 16'd8064;  // S404 add t3,a2,t3 (PC=0x6d0)
      11'd563: field_o = 16'd6;  // S405 slli a5,a5,0x2 (PC=0x6d4)
      11'd448: field_o = 16'd8192;  // S406 add t1,a2,t1 (PC=0x6d8)
      11'd577: field_o = 16'd1030;  // S407 slli a7,a7,0x2 (PC=0x6dc)
      11'd370: field_o = 16'd640;  // S408 lw a3,0(a3) (PC=0x6e0)
      11'd372: field_o = 16'd512;  // S409 lw t1,0(t1) (PC=0x6e4)
      11'd374: field_o = 16'd1408;  // S410 lw t4,0(t4) (PC=0x6e8)
      11'd376: field_o = 16'd896;  // S411 lw t3,0(t3) (PC=0x6ec)
      11'd452: field_o = 16'd8320;  // S412 add a4,a2,a4 (PC=0x6f0)
      11'd456: field_o = 16'd8448;  // S413 add t5,a2,t5 (PC=0x6f4)
      11'd460: field_o = 16'd8576;  // S414 add a5,a2,a5 (PC=0x6f8)
      11'd464: field_o = 16'd8704;  // S415 add a7,a2,a7 (PC=0x6fc)
      11'd378: field_o = 16'd384;  // S416 lw a4,0(a4) (PC=0x700)
      11'd380: field_o = 16'd1664;  // S417 lw t5,0(t5) (PC=0x704)
      11'd309: field_o = 16'd0;  // S418 lw a5,0(a5) (PC=0x708)
      11'd382: field_o = 16'd1024;  // S419 lw a7,0(a7) (PC=0x70c)
      11'd1290: field_o = 16'd24704;  // S420 xor s10,s11,s10 (PC=0x710)
      11'd1292: field_o = 16'd24832;  // S421 xor s8,s9,s8 (PC=0x714)
      11'd1294: field_o = 16'd24960;  // S422 xor a6,a6,s5 (PC=0x718)
      11'd1296: field_o = 16'd25088;  // S423 xor a6,a6,t6 (PC=0x71c)
      11'd1311: field_o = 16'd40704;  // S424 xor t2,s10,t2 (PC=0x720)
      11'd1298: field_o = 16'd25216;  // S425 xor t0,s8,t0 (PC=0x724)
      11'd1312: field_o = 16'd40832;  // S426 xor t6,t2,a3 (PC=0x728)
      11'd1313: field_o = 16'd40960;  // S427 xor t4,t0,t4 (PC=0x72c)
      11'd1314: field_o = 16'd41088;  // S428 xor a3,a6,t1 (PC=0x730)
      11'd1315: field_o = 16'd41216;  // S429 xor s6,s6,t3 (PC=0x734)
      11'd136: field_o = 16'd4866;  // S430 addi s4,s4,16 (PC=0x738)
      11'd1316: field_o = 16'd41344;  // S431 xor t1,t6,a4 (PC=0x73c)
      11'd1317: field_o = 16'd41472;  // S432 xor a3,a3,a7 (PC=0x740)
      11'd1318: field_o = 16'd41600;  // S433 xor a4,t4,t5 (PC=0x744)
      11'd1319: field_o = 16'd41728;  // S434 xor t5,s6,a5 (PC=0x748)
      11'd1543: field_o = 16'd41856;  // S435 bne s4,s1,590 <_nettle_aes_encrypt.part.0+0x144> (PC=0x74c)
      11'd280: field_o = 16'd5767;  // S436 lw s8,12(sp) (PC=0x750)
      11'd288: field_o = 16'd5889;  // S437 lw s9,8(sp) (PC=0x754)
      11'd296: field_o = 16'd6021;  // S438 lw s10,4(sp) (PC=0x758)
      11'd181: field_o = 16'd23168;  // S439 mv a5,t1 (PC=0x75c)
      11'd216: field_o = 16'd13440;  // S440 mv a7,t5 (PC=0x760)
      11'd184: field_o = 16'd25344;  // S441 mv s11,s3 (PC=0x764)
      11'd707: field_o = 16'd22659;  // S442 srli s7,a3,0x18 (PC=0x768)
      11'd746: field_o = 16'd41985;  // S443 srli t6,a4,0x8 (PC=0x76c)
      11'd747: field_o = 16'd42115;  // S444 srli s6,a5,0x18 (PC=0x770)
      11'd710: field_o = 16'd13185;  // S445 srli t5,a7,0x8 (PC=0x774)
      11'd748: field_o = 16'd42243;  // S446 srli s5,a4,0x18 (PC=0x778)
      11'd712: field_o = 16'd25473;  // S447 srli t4,a3,0x8 (PC=0x77c)
      11'd1181: field_o = 16'd42372;  // S448 zext.b s4,a5 (PC=0x780)
      11'd714: field_o = 16'd25602;  // S449 srli t3,a7,0x10 (PC=0x784)
      11'd1182: field_o = 16'd42500;  // S450 zext.b t2,a4 (PC=0x788)
      11'd716: field_o = 16'd10626;  // S451 srli t1,a3,0x10 (PC=0x78c)
      11'd1164: field_o = 16'd25732;  // S452 zext.b t0,a7 (PC=0x790)
      11'd696: field_o = 16'd13570;  // S453 srli a6,a5,0x10 (PC=0x794)
      11'd417: field_o = 16'd7168;  // S454 add s7,a2,s7 (PC=0x798)
      11'd1166: field_o = 16'd2180;  // S455 zext.b t6,t6 (PC=0x79c)
      11'd421: field_o = 16'd7296;  // S456 add s6,a2,s6 (PC=0x7a0)
      11'd1168: field_o = 16'd1668;  // S457 zext.b t5,t5 (PC=0x7a4)
      11'd429: field_o = 16'd7552;  // S458 add s5,a2,s5 (PC=0x7a8)
      11'd1141: field_o = 16'd1412;  // S459 zext.b t4,t4 (PC=0x7ac)
      11'd693: field_o = 16'd1027;  // S460 srli a7,a7,0x18 (PC=0x7b0)
      11'd674: field_o = 16'd1;  // S461 srli a5,a5,0x8 (PC=0x7b4)
      11'd1074: field_o = 16'd2688;  // S462 lbu s7,0(s7) (PC=0x7b8)
      11'd1076: field_o = 16'd3072;  // S463 lbu s6,0(s6) (PC=0x7bc)
      11'd1078: field_o = 16'd3200;  // S464 lbu s5,0(s5) (PC=0x7c0)
      11'd476: field_o = 16'd13696;  // S465 add s4,a2,s4 (PC=0x7c4)
      11'd433: field_o = 16'd7680;  // S466 add t6,a2,t6 (PC=0x7c8)
      11'd1145: field_o = 16'd900;  // S467 zext.b t3,t3 (PC=0x7cc)
      11'd473: field_o = 16'd13312;  // S468 add t2,a2,t2 (PC=0x7d0)
      11'd457: field_o = 16'd8448;  // S469 add t5,a2,t5 (PC=0x7d4)
      11'd1130: field_o = 16'd516;  // S470 zext.b t1,t1 (PC=0x7d8)
      11'd425: field_o = 16'd7424;  // S471 add t0,a2,t0 (PC=0x7dc)
      11'd441: field_o = 16'd7936;  // S472 add t4,a2,t4 (PC=0x7e0)
      11'd1170: field_o = 16'd1540;  // S473 zext.b a6,a6 (PC=0x7e4)
      11'd465: field_o = 16'd8704;  // S474 add a7,a2,a7 (PC=0x7e8)
      11'd1137: field_o = 16'd644;  // S475 zext.b a3,a3 (PC=0x7ec)
      11'd1122: field_o = 16'd4;  // S476 zext.b a5,a5 (PC=0x7f0)
      11'd682: field_o = 16'd386;  // S477 srli a4,a4,0x10 (PC=0x7f4)
      11'd1080: field_o = 16'd4864;  // S478 lbu s4,0(s4) (PC=0x7f8)
      11'd1082: field_o = 16'd3968;  // S479 lbu t2,0(t2) (PC=0x7fc)
      11'd1033: field_o = 16'd2304;  // S480 lbu t0,0(t0) (PC=0x800)
      11'd1084: field_o = 16'd2176;  // S481 lbu t6,0(t6) (PC=0x804)
      11'd1086: field_o = 16'd1664;  // S482 lbu t5,0(t5) (PC=0x808)
      11'd1088: field_o = 16'd1408;  // S483 lbu t4,0(t4) (PC=0x80c)
      11'd1090: field_o = 16'd1024;  // S484 lbu a7,0(a7) (PC=0x810)
      11'd445: field_o = 16'd8064;  // S485 add t3,a2,t3 (PC=0x814)
      11'd449: field_o = 16'd8192;  // S486 add t1,a2,t1 (PC=0x818)
      11'd490: field_o = 16'd25856;  // S487 add a6,a2,a6 (PC=0x81c)
      11'd437: field_o = 16'd7808;  // S488 add a3,a2,a3 (PC=0x820)
      11'd461: field_o = 16'd8576;  // S489 add a5,a2,a5 (PC=0x824)
      11'd1153: field_o = 16'd388;  // S490 zext.b a4,a4 (PC=0x828)
      11'd1026: field_o = 16'd640;  // S491 lbu a3,0(a3) (PC=0x82c)
      11'd1092: field_o = 16'd896;  // S492 lbu t3,0(t3) (PC=0x830)
      11'd1037: field_o = 16'd512;  // S493 lbu t1,0(t1) (PC=0x834)
      11'd1094: field_o = 16'd1536;  // S494 lbu a6,0(a6) (PC=0x838)
      11'd1029: field_o = 16'd0;  // S495 lbu a5,0(a5) (PC=0x83c)
      11'd453: field_o = 16'd8320;  // S496 add a4,a2,a4 (PC=0x840)
      11'd1096: field_o = 16'd384;  // S497 lbu a4,0(a4) (PC=0x844)
      11'd633: field_o = 16'd2691;  // S498 slli s7,s7,0x18 (PC=0x848)
      11'd492: field_o = 16'd25984;  // S499 add s11,s0,s11 (PC=0x84c)
      11'd637: field_o = 16'd3075;  // S500 slli s6,s6,0x18 (PC=0x850)
      11'd494: field_o = 16'd26112;  // S501 add s10,s0,s10 (PC=0x854)
      11'd641: field_o = 16'd3203;  // S502 slli s5,s5,0x18 (PC=0x858)
      11'd496: field_o = 16'd26240;  // S503 add s9,s0,s9 (PC=0x85c)
      11'd384: field_o = 16'd13824;  // S504 lw s11,0(s11) (PC=0x860)
      11'd386: field_o = 16'd26368;  // S505 lw s10,0(s10) (PC=0x864)
      11'd388: field_o = 16'd4736;  // S506 lw s9,0(s9) (PC=0x868)
      11'd1244: field_o = 16'd26496;  // S507 or s7,s7,s4 (PC=0x86c)
      11'd1246: field_o = 16'd26624;  // S508 or s6,s6,t2 (PC=0x870)
      11'd1248: field_o = 16'd26752;  // S509 or s5,s5,t0 (PC=0x874)
      11'd586: field_o = 16'd2177;  // S510 slli t6,t6,0x8 (PC=0x878)
      11'd594: field_o = 16'd1665;  // S511 slli t5,t5,0x8 (PC=0x87c)
      11'd570: field_o = 16'd1409;  // S512 slli t4,t4,0x8 (PC=0x880)
      11'd578: field_o = 16'd1027;  // S513 slli a7,a7,0x18 (PC=0x884)
      11'd498: field_o = 16'd26880;  // S514 add s8,s0,s8 (PC=0x888)
      11'd390: field_o = 16'd27008;  // S515 lw t0,0(s8) (PC=0x88c)
      11'd1270: field_o = 16'd42624;  // S516 or a7,a7,a3 (PC=0x890)
      11'd602: field_o = 16'd898;  // S517 slli t3,t3,0x10 (PC=0x894)
      11'd610: field_o = 16'd514;  // S518 slli t1,t1,0x10 (PC=0x898)
      11'd629: field_o = 16'd1538;  // S519 slli a6,a6,0x10 (PC=0x89c)
      11'd1250: field_o = 16'd27136;  // S520 or t6,s7,t6 (PC=0x8a0)
      11'd1252: field_o = 16'd27264;  // S521 or t5,s6,t5 (PC=0x8a4)
      11'd1254: field_o = 16'd27392;  // S522 or t4,s5,t4 (PC=0x8a8)
      11'd564: field_o = 16'd1;  // S523 slli a5,a5,0x8 (PC=0x8ac)
      11'd1256: field_o = 16'd27520;  // S524 or t6,t6,t3 (PC=0x8b0)
      11'd1258: field_o = 16'd27648;  // S525 or t5,t5,t1 (PC=0x8b4)
      11'd1260: field_o = 16'd27776;  // S526 or t4,t4,a6 (PC=0x8b8)
      11'd1271: field_o = 16'd42752;  // S527 or a5,a7,a5 (PC=0x8bc)
      11'd549: field_o = 16'd386;  // S528 slli a4,a4,0x10 (PC=0x8c0)
      11'd1300: field_o = 16'd27904;  // S529 xor t6,t6,s11 (PC=0x8c4)
      11'd1302: field_o = 16'd28032;  // S530 xor t5,t5,s10 (PC=0x8c8)
      11'd1304: field_o = 16'd28160;  // S531 xor t4,t4,s9 (PC=0x8cc)
      11'd1221: field_o = 16'd10880;  // S532 or a5,a5,a4 (PC=0x8d0)
      11'd1306: field_o = 16'd11392;  // S533 xor a5,a5,t0 (PC=0x8d4)
      11'd718: field_o = 16'd28291;  // S534 srli a6,t4,0x18 (PC=0x8d8)
      11'd720: field_o = 16'd28418;  // S535 srli a3,t4,0x10 (PC=0x8dc)
      11'd722: field_o = 16'd28545;  // S536 srli a4,t4,0x8 (PC=0x8e0)
      11'd724: field_o = 16'd28675;  // S537 srli s4,t6,0x18 (PC=0x8e4)
      11'd726: field_o = 16'd28802;  // S538 srli t2,t6,0x10 (PC=0x8e8)
      11'd728: field_o = 16'd28929;  // S539 srli t0,t6,0x8 (PC=0x8ec)
      11'd730: field_o = 16'd29059;  // S540 srli t3,t5,0x18 (PC=0x8f0)
      11'd732: field_o = 16'd29186;  // S541 srli t1,t5,0x10 (PC=0x8f4)
      11'd734: field_o = 16'd13441;  // S542 srli a7,t5,0x8 (PC=0x8f8)
      11'd1344: field_o = 16'd8874;  // S543 sb a6,11(a1) (PC=0x8fc)
      11'd1348: field_o = 16'd8990;  // S544 sb a3,10(a1) (PC=0x900)
      11'd1352: field_o = 16'd4391;  // S545 sb a4,9(a1) (PC=0x904)
      11'd1356: field_o = 16'd29328;  // S546 sb s4,3(a1) (PC=0x908)
      11'd1358: field_o = 16'd29446;  // S547 sb t2,2(a1) (PC=0x90c)
      11'd1360: field_o = 16'd29576;  // S548 sb t0,1(a1) (PC=0x910)
      11'd1362: field_o = 16'd29696;  // S549 sb t6,0(a1) (PC=0x914)
      11'd1364: field_o = 16'd29865;  // S550 sb t3,7(a1) (PC=0x918)
      11'd1366: field_o = 16'd29969;  // S551 sb t1,6(a1) (PC=0x91c)
      11'd1368: field_o = 16'd11046;  // S552 sb a7,5(a1) (PC=0x920)
      11'd1370: field_o = 16'd30085;  // S553 sb t5,4(a1) (PC=0x924)
      11'd1372: field_o = 16'd30209;  // S554 sb t4,8(a1) (PC=0x928)
      11'd697: field_o = 16'd13571;  // S555 srli a6,a5,0x18 (PC=0x92c)
      11'd1345: field_o = 16'd8847;  // S556 sb a6,15(a1) (PC=0x930)
      11'd689: field_o = 16'd4610;  // S557 srli a3,a5,0x10 (PC=0x934)
      11'd736: field_o = 16'd4225;  // S558 srli a4,a5,0x8 (PC=0x938)
      11'd1374: field_o = 16'd4999;  // S559 sb a5,12(a1) (PC=0x93c)
      11'd312: field_o = 16'd13952;  // S560 lw a5,0(sp) (PC=0x940)
      11'd1349: field_o = 16'd8971;  // S561 sb a3,14(a1) (PC=0x944)
      11'd1353: field_o = 16'd4392;  // S562 sb a4,13(a1) (PC=0x948)
      11'd140: field_o = 16'd5250;  // S563 addi a1,a1,16 (PC=0x94c)
      11'd90: field_o = 16'd1922;  // S564 addi a0,a0,16 (PC=0x950)
      11'd1536: field_o = 16'd4992;  // S565 bne a1,a5,4bc <_nettle_aes_encrypt.part.0+0x70> (PC=0x954)
      11'd259: field_o = 16'd2968;  // S566 lw s0,60(sp) (PC=0x958)
      11'd274: field_o = 16'd3737;  // S567 lw s1,56(sp) (PC=0x95c)
      11'd304: field_o = 16'd9110;  // S568 lw s2,52(sp) (PC=0x960)
      11'd316: field_o = 16'd14103;  // S569 lw s3,48(sp) (PC=0x964)
      11'd320: field_o = 16'd14234;  // S570 lw s4,44(sp) (PC=0x968)
      11'd324: field_o = 16'd14363;  // S571 lw s5,40(sp) (PC=0x96c)
      11'd328: field_o = 16'd14492;  // S572 lw s6,36(sp) (PC=0x970)
      11'd332: field_o = 16'd14606;  // S573 lw s7,32(sp) (PC=0x974)
      11'd281: field_o = 16'd5773;  // S574 lw s8,28(sp) (PC=0x978)
      11'd289: field_o = 16'd5891;  // S575 lw s9,24(sp) (PC=0x97c)
      11'd297: field_o = 16'd6045;  // S576 lw s10,20(sp) (PC=0x980)
      11'd336: field_o = 16'd14722;  // S577 lw s11,16(sp) (PC=0x984)
      11'd9: field_o = 16'd1164;  // S578 addi sp,sp,64 (PC=0x988)
      11'd1456: field_o = 16'd256;  // S579 ret (PC=0x98c)
      11'd844: field_o = 16'd14861;  // S580 li s8,28 (PC=0x990)
      11'd848: field_o = 16'd14979;  // S581 li s9,24 (PC=0x994)
      11'd852: field_o = 16'd15133;  // S582 li s10,20 (PC=0x998)
      11'd856: field_o = 16'd15234;  // S583 li s11,16 (PC=0x99c)
      11'd1414: field_o = 16'd128;  // S584 j 768 <_nettle_aes_encrypt.part.0+0x31c> (PC=0x9a0)
      11'd1457: field_o = 16'd256;  // S585 ret (PC=0x9a4)
      11'd1513: field_o = 16'd18313;  // S586 beqz a3,f00 <_nettle_aes_decrypt.part.0+0x558> (PC=0x9a8)
      11'd10: field_o = 16'd1201;  // S587 addi sp,sp,-64 (PC=0x9ac)
      11'd937: field_o = 16'd6806;  // S588 sw s2,52(sp) (PC=0x9b0)
      11'd165: field_o = 16'd18432;  // S589 mv s2,a0 (PC=0x9b4)
      11'd941: field_o = 16'd11543;  // S590 sw s3,48(sp) (PC=0x9b8)
      11'd651: field_o = 16'd18565;  // S591 slli s3,s2,0x4 (PC=0x9bc)
      11'd117: field_o = 16'd11648;  // S592 mv a0,a5 (PC=0x9c0)
      11'd59: field_o = 16'd3845;  // S593 addi a5,s3,4 (PC=0x9c4)
      11'd900: field_o = 16'd2565;  // S594 sw a5,4(sp) (PC=0x9c8)
      11'd60: field_o = 16'd3841;  // S595 addi a5,s3,8 (PC=0x9cc)
      11'd901: field_o = 16'd2561;  // S596 sw a5,8(sp) (PC=0x9d0)
      11'd61: field_o = 16'd3847;  // S597 addi a5,s3,12 (PC=0x9d4)
      11'd915: field_o = 16'd3608;  // S598 sw s0,60(sp) (PC=0x9d8)
      11'd902: field_o = 16'd2567;  // S599 sw a5,12(sp) (PC=0x9dc)
      11'd167: field_o = 16'd18688;  // S600 mv s0,a1 (PC=0x9e0)
      11'd483: field_o = 16'd18816;  // S601 add a5,a4,a3 (PC=0x9e4)
      11'd930: field_o = 16'd4505;  // S602 sw s1,56(sp) (PC=0x9e8)
      11'd945: field_o = 16'd11802;  // S603 sw s4,44(sp) (PC=0x9ec)
      11'd949: field_o = 16'd11931;  // S604 sw s5,40(sp) (PC=0x9f0)
      11'd953: field_o = 16'd12060;  // S605 sw s6,36(sp) (PC=0x9f4)
      11'd957: field_o = 16'd12174;  // S606 sw s7,32(sp) (PC=0x9f8)
      11'd961: field_o = 16'd12301;  // S607 sw s8,28(sp) (PC=0x9fc)
      11'd965: field_o = 16'd12419;  // S608 sw s9,24(sp) (PC=0xa00)
      11'd969: field_o = 16'd12573;  // S609 sw s10,20(sp) (PC=0xa04)
      11'd973: field_o = 16'd12674;  // S610 sw s11,16(sp) (PC=0xa08)
      11'd169: field_o = 16'd18944;  // S611 mv a1,a4 (PC=0xa0c)
      11'd485: field_o = 16'd19072;  // S612 add s1,s0,s3 (PC=0xa10)
      11'd903: field_o = 16'd2560;  // S613 sw a5,0(sp) (PC=0xa14)
      11'd1043: field_o = 16'd19208;  // S614 lbu t2,1(a0) (PC=0xa18)
      11'd1045: field_o = 16'd19366;  // S615 lbu t0,5(a0) (PC=0xa1c)
      11'd1047: field_o = 16'd19495;  // S616 lbu t6,9(a0) (PC=0xa20)
      11'd1049: field_o = 16'd19624;  // S617 lbu t5,13(a0) (PC=0xa24)
      11'd1051: field_o = 16'd19712;  // S618 lbu s7,0(a0) (PC=0xa28)
      11'd1053: field_o = 16'd12806;  // S619 lbu t4,2(a0) (PC=0xa2c)
      11'd1055: field_o = 16'd19845;  // S620 lbu s6,4(a0) (PC=0xa30)
      11'd1057: field_o = 16'd12945;  // S621 lbu t3,6(a0) (PC=0xa34)
      11'd1059: field_o = 16'd19969;  // S622 lbu s5,8(a0) (PC=0xa38)
      11'd1061: field_o = 16'd20126;  // S623 lbu t1,10(a0) (PC=0xa3c)
      11'd1063: field_o = 16'd20231;  // S624 lbu s4,12(a0) (PC=0xa40)
      11'd1065: field_o = 16'd6923;  // S625 lbu a6,14(a0) (PC=0xa44)
      11'd1069: field_o = 16'd10256;  // S626 lbu a4,3(a0) (PC=0xa48)
      11'd1067: field_o = 16'd3497;  // S627 lbu a5,7(a0) (PC=0xa4c)
      11'd1071: field_o = 16'd10410;  // S628 lbu a7,11(a0) (PC=0xa50)
      11'd1073: field_o = 16'd20367;  // S629 lbu a3,15(a0) (PC=0xa54)
      11'd646: field_o = 16'd3969;  // S630 slli t2,t2,0x8 (PC=0xa58)
      11'd626: field_o = 16'd2305;  // S631 slli t0,t0,0x8 (PC=0xa5c)
      11'd587: field_o = 16'd2177;  // S632 slli t6,t6,0x8 (PC=0xa60)
      11'd595: field_o = 16'd1665;  // S633 slli t5,t5,0x8 (PC=0xa64)
      11'd347: field_o = 16'd20480;  // S634 lw s8,0(s0) (PC=0xa68)
      11'd349: field_o = 16'd20613;  // S635 lw s9,4(s0) (PC=0xa6c)
      11'd351: field_o = 16'd20737;  // S636 lw s10,8(s0) (PC=0xa70)
      11'd353: field_o = 16'd20871;  // S637 lw s11,12(s0) (PC=0xa74)
      11'd1225: field_o = 16'd20992;  // S638 or t2,t2,s7 (PC=0xa78)
      11'd571: field_o = 16'd1410;  // S639 slli t4,t4,0x10 (PC=0xa7c)
      11'd1227: field_o = 16'd21120;  // S640 or t0,t0,s6 (PC=0xa80)
      11'd603: field_o = 16'd898;  // S641 slli t3,t3,0x10 (PC=0xa84)
      11'd1229: field_o = 16'd21248;  // S642 or t6,t6,s5 (PC=0xa88)
      11'd611: field_o = 16'd514;  // S643 slli t1,t1,0x10 (PC=0xa8c)
      11'd1231: field_o = 16'd21376;  // S644 or t5,t5,s4 (PC=0xa90)
      11'd630: field_o = 16'd1538;  // S645 slli a6,a6,0x10 (PC=0xa94)
      11'd1233: field_o = 16'd21504;  // S646 or a6,a6,t5 (PC=0xa98)
      11'd1235: field_o = 16'd21632;  // S647 or t4,t4,t2 (PC=0xa9c)
      11'd550: field_o = 16'd387;  // S648 slli a4,a4,0x18 (PC=0xaa0)
      11'd1237: field_o = 16'd21760;  // S649 or t3,t3,t0 (PC=0xaa4)
      11'd565: field_o = 16'd3;  // S650 slli a5,a5,0x18 (PC=0xaa8)
      11'd1239: field_o = 16'd21888;  // S651 or t1,t1,t6 (PC=0xaac)
      11'd579: field_o = 16'd1027;  // S652 slli a7,a7,0x18 (PC=0xab0)
      11'd619: field_o = 16'd643;  // S653 slli a3,a3,0x18 (PC=0xab4)
      11'd1241: field_o = 16'd22016;  // S654 or a3,a3,a6 (PC=0xab8)
      11'd1272: field_o = 16'd42880;  // S655 or a4,a4,t4 (PC=0xabc)
      11'd1273: field_o = 16'd43008;  // S656 or a5,a5,t3 (PC=0xac0)
      11'd1243: field_o = 16'd22144;  // S657 or a7,a7,t1 (PC=0xac4)
      11'd841: field_o = 16'd13064;  // S658 li a6,1 (PC=0xac8)
      11'd1320: field_o = 16'd43136;  // S659 xor a4,a4,s8 (PC=0xacc)
      11'd1321: field_o = 16'd43264;  // S660 xor a5,a5,s9 (PC=0xad0)
      11'd1283: field_o = 16'd22272;  // S661 xor a7,a7,s10 (PC=0xad4)
      11'd1285: field_o = 16'd22400;  // S662 xor a3,a3,s11 (PC=0xad8)
      11'd1575: field_o = 16'd22528;  // S663 bgeu a6,s2,eec <_nettle_aes_decrypt.part.0+0x544> (PC=0xadc)
      11'd217: field_o = 16'd43394;  // S664 addi t2,s0,16 (PC=0xae0)
      11'd218: field_o = 16'd11264;  // S665 mv t1,a4 (PC=0xae4)
      11'd219: field_o = 16'd43520;  // S666 mv t3,a5 (PC=0xae8)
      11'd749: field_o = 16'd43651;  // S667 srli s7,t3,0x18 (PC=0xaec)
      11'd1183: field_o = 16'd43780;  // S668 zext.b s6,t3 (PC=0xaf0)
      11'd1184: field_o = 16'd43908;  // S669 zext.b s4,a7 (PC=0xaf4)
      11'd750: field_o = 16'd44035;  // S670 srli t0,a3,0x18 (PC=0xaf8)
      11'd1157: field_o = 16'd22788;  // S671 zext.b s8,t1 (PC=0xafc)
      11'd751: field_o = 16'd44163;  // S672 srli s5,a7,0x18 (PC=0xb00)
      11'd1159: field_o = 16'd22916;  // S673 zext.b s9,a3 (PC=0xb04)
      11'd752: field_o = 16'd44291;  // S674 srli t6,t1,0x18 (PC=0xb08)
      11'd121: field_o = 16'd2706;  // S675 addi s7,s7,832 (PC=0xb0c)
      11'd171: field_o = 16'd3084;  // S676 addi s6,s6,64 (PC=0xb10)
      11'd137: field_o = 16'd4876;  // S677 addi s4,s4,64 (PC=0xb14)
      11'd107: field_o = 16'd2322;  // S678 addi t0,t0,832 (PC=0xb18)
      11'd125: field_o = 16'd5644;  // S679 addi s8,s8,64 (PC=0xb1c)
      11'd175: field_o = 16'd3218;  // S680 addi s5,s5,832 (PC=0xb20)
      11'd177: field_o = 16'd4748;  // S681 addi s9,s9,64 (PC=0xb24)
      11'd179: field_o = 16'd2194;  // S682 addi t6,t6,832 (PC=0xb28)
      11'd634: field_o = 16'd2694;  // S683 slli s7,s7,0x2 (PC=0xb2c)
      11'd638: field_o = 16'd3078;  // S684 slli s6,s6,0x2 (PC=0xb30)
      11'd664: field_o = 16'd4870;  // S685 slli s4,s4,0x2 (PC=0xb34)
      11'd627: field_o = 16'd2310;  // S686 slli t0,t0,0x2 (PC=0xb38)
      11'd186: field_o = 16'd30336;  // S687 mv a5,t3 (PC=0xb3c)
      11'd711: field_o = 16'd13186;  // S688 srli t5,a7,0x10 (PC=0xb40)
      11'd709: field_o = 16'd7042;  // S689 srli a6,a3,0x10 (PC=0xb44)
      11'd753: field_o = 16'd44417;  // S690 srli s10,a7,0x8 (PC=0xb48)
      11'd653: field_o = 16'd4742;  // S691 slli s9,s9,0x2 (PC=0xb4c)
      11'd418: field_o = 16'd7168;  // S692 add s7,a2,s7 (PC=0xb50)
      11'd422: field_o = 16'd7296;  // S693 add s6,a2,s6 (PC=0xb54)
      11'd477: field_o = 16'd13696;  // S694 add s4,a2,s4 (PC=0xb58)
      11'd426: field_o = 16'd7424;  // S695 add t0,a2,t0 (PC=0xb5c)
      11'd655: field_o = 16'd5638;  // S696 slli s8,s8,0x2 (PC=0xb60)
      11'd642: field_o = 16'd3206;  // S697 slli s5,s5,0x2 (PC=0xb64)
      11'd588: field_o = 16'd2182;  // S698 slli t6,t6,0x2 (PC=0xb68)
      11'd188: field_o = 16'd30464;  // S699 mv a4,t1 (PC=0xb6c)
      11'd713: field_o = 16'd25473;  // S700 srli t4,a3,0x8 (PC=0xb70)
      11'd754: field_o = 16'd44545;  // S701 srli t3,t1,0x8 (PC=0xb74)
      11'd1185: field_o = 16'd44676;  // S702 zext.b a7,s10 (PC=0xb78)
      11'd705: field_o = 16'd6657;  // S703 srli t1,a5,0x8 (PC=0xb7c)
      11'd355: field_o = 16'd23040;  // S704 lw s10,0(s7) (PC=0xb80)
      11'd487: field_o = 16'd23296;  // S705 add s8,a2,s8 (PC=0xb84)
      11'd403: field_o = 16'd44800;  // S706 lw s7,0(s4) (PC=0xb88)
      11'd1186: field_o = 16'd44932;  // S707 zext.b a3,t5 (PC=0xb8c)
      11'd430: field_o = 16'd7552;  // S708 add s5,a2,s5 (PC=0xb90)
      11'd1161: field_o = 16'd23428;  // S709 zext.b t5,a6 (PC=0xb94)
      11'd434: field_o = 16'd7680;  // S710 add t6,a2,t6 (PC=0xb98)
      11'd489: field_o = 16'd23552;  // S711 add a6,a2,s9 (PC=0xb9c)
      11'd357: field_o = 16'd23680;  // S712 lw s9,0(s6) (PC=0xba0)
      11'd359: field_o = 16'd23808;  // S713 lw s6,0(t0) (PC=0xba4)
      11'd361: field_o = 16'd23936;  // S714 lw s11,0(s8) (PC=0xba8)
      11'd1142: field_o = 16'd1412;  // S715 zext.b t4,t4 (PC=0xbac)
      11'd363: field_o = 16'd24064;  // S716 lw s8,0(s5) (PC=0xbb0)
      11'd1146: field_o = 16'd900;  // S717 zext.b t3,t3 (PC=0xbb4)
      11'd365: field_o = 16'd24192;  // S718 lw s5,0(t6) (PC=0xbb8)
      11'd1131: field_o = 16'd516;  // S719 zext.b t1,t1 (PC=0xbbc)
      11'd392: field_o = 16'd30593;  // S720 lw t6,8(t2) (PC=0xbc0)
      11'd683: field_o = 16'd386;  // S721 srli a4,a4,0x10 (PC=0xbc4)
      11'd675: field_o = 16'd2;  // S722 srli a5,a5,0x10 (PC=0xbc8)
      11'd129: field_o = 16'd1427;  // S723 addi t4,t4,320 (PC=0xbcc)
      11'd75: field_o = 16'd915;  // S724 addi t3,t3,320 (PC=0xbd0)
      11'd82: field_o = 16'd531;  // S725 addi t1,t1,320 (PC=0xbd4)
      11'd1154: field_o = 16'd388;  // S726 zext.b a4,a4 (PC=0xbd8)
      11'd133: field_o = 16'd1043;  // S727 addi a7,a7,320 (PC=0xbdc)
      11'd1123: field_o = 16'd4;  // S728 zext.b a5,a5 (PC=0xbe0)
      11'd369: field_o = 16'd1536;  // S729 lw a6,0(a6) (PC=0xbe4)
      11'd572: field_o = 16'd1414;  // S730 slli t4,t4,0x2 (PC=0xbe8)
      11'd98: field_o = 16'd660;  // S731 addi a3,a3,576 (PC=0xbec)
      11'd604: field_o = 16'd902;  // S732 slli t3,t3,0x2 (PC=0xbf0)
      11'd183: field_o = 16'd1684;  // S733 addi t5,t5,576 (PC=0xbf4)
      11'd612: field_o = 16'd518;  // S734 slli t1,t1,0x2 (PC=0xbf8)
      11'd110: field_o = 16'd404;  // S735 addi a4,a4,576 (PC=0xbfc)
      11'd580: field_o = 16'd1030;  // S736 slli a7,a7,0x2 (PC=0xc00)
      11'd38: field_o = 16'd20;  // S737 addi a5,a5,576 (PC=0xc04)
      11'd1287: field_o = 16'd24448;  // S738 xor s6,s7,s6 (PC=0xc08)
      11'd404: field_o = 16'd45056;  // S739 lw s4,0(t2) (PC=0xc0c)
      11'd405: field_o = 16'd45189;  // S740 lw t0,4(t2) (PC=0xc10)
      11'd1289: field_o = 16'd24576;  // S741 xor s6,s6,t6 (PC=0xc14)
      11'd442: field_o = 16'd7936;  // S742 add t4,a2,t4 (PC=0xc18)
      11'd393: field_o = 16'd30599;  // S743 lw t6,12(t2) (PC=0xc1c)
      11'd620: field_o = 16'd646;  // S744 slli a3,a3,0x2 (PC=0xc20)
      11'd446: field_o = 16'd8064;  // S745 add t3,a2,t3 (PC=0xc24)
      11'd596: field_o = 16'd1670;  // S746 slli t5,t5,0x2 (PC=0xc28)
      11'd450: field_o = 16'd8192;  // S747 add t1,a2,t1 (PC=0xc2c)
      11'd551: field_o = 16'd390;  // S748 slli a4,a4,0x2 (PC=0xc30)
      11'd466: field_o = 16'd8704;  // S749 add a7,a2,a7 (PC=0xc34)
      11'd566: field_o = 16'd6;  // S750 slli a5,a5,0x2 (PC=0xc38)
      11'd373: field_o = 16'd512;  // S751 lw t1,0(t1) (PC=0xc3c)
      11'd383: field_o = 16'd1024;  // S752 lw a7,0(a7) (PC=0xc40)
      11'd375: field_o = 16'd1408;  // S753 lw t4,0(t4) (PC=0xc44)
      11'd377: field_o = 16'd896;  // S754 lw t3,0(t3) (PC=0xc48)
      11'd438: field_o = 16'd7808;  // S755 add a3,a2,a3 (PC=0xc4c)
      11'd458: field_o = 16'd8448;  // S756 add t5,a2,t5 (PC=0xc50)
      11'd454: field_o = 16'd8320;  // S757 add a4,a2,a4 (PC=0xc54)
      11'd462: field_o = 16'd8576;  // S758 add a5,a2,a5 (PC=0xc58)
      11'd371: field_o = 16'd640;  // S759 lw a3,0(a3) (PC=0xc5c)
      11'd381: field_o = 16'd1664;  // S760 lw t5,0(t5) (PC=0xc60)
      11'd379: field_o = 16'd384;  // S761 lw a4,0(a4) (PC=0xc64)
      11'd310: field_o = 16'd0;  // S762 lw a5,0(a5) (PC=0xc68)
      11'd1291: field_o = 16'd24704;  // S763 xor s10,s11,s10 (PC=0xc6c)
      11'd1293: field_o = 16'd24832;  // S764 xor s8,s9,s8 (PC=0xc70)
      11'd1295: field_o = 16'd24960;  // S765 xor a6,a6,s5 (PC=0xc74)
      11'd1322: field_o = 16'd45312;  // S766 xor s4,s10,s4 (PC=0xc78)
      11'd1299: field_o = 16'd25216;  // S767 xor t0,s8,t0 (PC=0xc7c)
      11'd1297: field_o = 16'd25088;  // S768 xor a6,a6,t6 (PC=0xc80)
      11'd1323: field_o = 16'd45440;  // S769 xor s6,s6,t1 (PC=0xc84)
      11'd1324: field_o = 16'd45568;  // S770 xor a6,a6,a7 (PC=0xc88)
      11'd1325: field_o = 16'd45696;  // S771 xor t4,s4,t4 (PC=0xc8c)
      11'd1326: field_o = 16'd45824;  // S772 xor t3,t0,t3 (PC=0xc90)
      11'd173: field_o = 16'd3970;  // S773 addi t2,t2,16 (PC=0xc94)
      11'd1327: field_o = 16'd45952;  // S774 xor t1,t4,a3 (PC=0xc98)
      11'd1328: field_o = 16'd46080;  // S775 xor t3,t3,t5 (PC=0xc9c)
      11'd1329: field_o = 16'd46208;  // S776 xor a7,s6,a4 (PC=0xca0)
      11'd1330: field_o = 16'd46336;  // S777 xor a3,a6,a5 (PC=0xca4)
      11'd1544: field_o = 16'd46464;  // S778 bne t2,s1,aec <_nettle_aes_decrypt.part.0+0x144> (PC=0xca8)
      11'd282: field_o = 16'd5767;  // S779 lw s8,12(sp) (PC=0xcac)
      11'd290: field_o = 16'd5889;  // S780 lw s9,8(sp) (PC=0xcb0)
      11'd298: field_o = 16'd6021;  // S781 lw s10,4(sp) (PC=0xcb4)
      11'd189: field_o = 16'd30464;  // S782 mv a4,t1 (PC=0xcb8)
      11'd187: field_o = 16'd30336;  // S783 mv a5,t3 (PC=0xcbc)
      11'd185: field_o = 16'd25344;  // S784 mv s11,s3 (PC=0xcc0)
      11'd755: field_o = 16'd46595;  // S785 srli s7,a5,0x18 (PC=0xcc4)
      11'd756: field_o = 16'd46721;  // S786 srli t6,a3,0x8 (PC=0xcc8)
      11'd757: field_o = 16'd46851;  // S787 srli s6,a7,0x18 (PC=0xccc)
      11'd758: field_o = 16'd46977;  // S788 srli t5,a4,0x8 (PC=0xcd0)
      11'd759: field_o = 16'd47107;  // S789 srli s5,a3,0x18 (PC=0xcd4)
      11'd760: field_o = 16'd47233;  // S790 srli t4,a5,0x8 (PC=0xcd8)
      11'd1187: field_o = 16'd47364;  // S791 zext.b s4,a4 (PC=0xcdc)
      11'd715: field_o = 16'd25602;  // S792 srli t3,a7,0x10 (PC=0xce0)
      11'd1188: field_o = 16'd47492;  // S793 zext.b t2,a5 (PC=0xce4)
      11'd717: field_o = 16'd10626;  // S794 srli t1,a3,0x10 (PC=0xce8)
      11'd1165: field_o = 16'd25732;  // S795 zext.b t0,a7 (PC=0xcec)
      11'd761: field_o = 16'd9730;  // S796 srli a6,a4,0x10 (PC=0xcf0)
      11'd419: field_o = 16'd7168;  // S797 add s7,a2,s7 (PC=0xcf4)
      11'd1167: field_o = 16'd2180;  // S798 zext.b t6,t6 (PC=0xcf8)
      11'd423: field_o = 16'd7296;  // S799 add s6,a2,s6 (PC=0xcfc)
      11'd1169: field_o = 16'd1668;  // S800 zext.b t5,t5 (PC=0xd00)
      11'd431: field_o = 16'd7552;  // S801 add s5,a2,s5 (PC=0xd04)
      11'd1143: field_o = 16'd1412;  // S802 zext.b t4,t4 (PC=0xd08)
      11'd684: field_o = 16'd387;  // S803 srli a4,a4,0x18 (PC=0xd0c)
      11'd694: field_o = 16'd1025;  // S804 srli a7,a7,0x8 (PC=0xd10)
      11'd1075: field_o = 16'd2688;  // S805 lbu s7,0(s7) (PC=0xd14)
      11'd1077: field_o = 16'd3072;  // S806 lbu s6,0(s6) (PC=0xd18)
      11'd1079: field_o = 16'd3200;  // S807 lbu s5,0(s5) (PC=0xd1c)
      11'd478: field_o = 16'd13696;  // S808 add s4,a2,s4 (PC=0xd20)
      11'd435: field_o = 16'd7680;  // S809 add t6,a2,t6 (PC=0xd24)
      11'd1147: field_o = 16'd900;  // S810 zext.b t3,t3 (PC=0xd28)
      11'd474: field_o = 16'd13312;  // S811 add t2,a2,t2 (PC=0xd2c)
      11'd459: field_o = 16'd8448;  // S812 add t5,a2,t5 (PC=0xd30)
      11'd1132: field_o = 16'd516;  // S813 zext.b t1,t1 (PC=0xd34)
      11'd427: field_o = 16'd7424;  // S814 add t0,a2,t0 (PC=0xd38)
      11'd443: field_o = 16'd7936;  // S815 add t4,a2,t4 (PC=0xd3c)
      11'd1171: field_o = 16'd1540;  // S816 zext.b a6,a6 (PC=0xd40)
      11'd455: field_o = 16'd8320;  // S817 add a4,a2,a4 (PC=0xd44)
      11'd1138: field_o = 16'd644;  // S818 zext.b a3,a3 (PC=0xd48)
      11'd1163: field_o = 16'd1028;  // S819 zext.b a7,a7 (PC=0xd4c)
      11'd676: field_o = 16'd2;  // S820 srli a5,a5,0x10 (PC=0xd50)
      11'd1081: field_o = 16'd4864;  // S821 lbu s4,0(s4) (PC=0xd54)
      11'd1083: field_o = 16'd3968;  // S822 lbu t2,0(t2) (PC=0xd58)
      11'd1034: field_o = 16'd2304;  // S823 lbu t0,0(t0) (PC=0xd5c)
      11'd1085: field_o = 16'd2176;  // S824 lbu t6,0(t6) (PC=0xd60)
      11'd1087: field_o = 16'd1664;  // S825 lbu t5,0(t5) (PC=0xd64)
      11'd1089: field_o = 16'd1408;  // S826 lbu t4,0(t4) (PC=0xd68)
      11'd1097: field_o = 16'd384;  // S827 lbu a4,0(a4) (PC=0xd6c)
      11'd447: field_o = 16'd8064;  // S828 add t3,a2,t3 (PC=0xd70)
      11'd451: field_o = 16'd8192;  // S829 add t1,a2,t1 (PC=0xd74)
      11'd491: field_o = 16'd25856;  // S830 add a6,a2,a6 (PC=0xd78)
      11'd439: field_o = 16'd7808;  // S831 add a3,a2,a3 (PC=0xd7c)
      11'd467: field_o = 16'd8704;  // S832 add a7,a2,a7 (PC=0xd80)
      11'd1124: field_o = 16'd4;  // S833 zext.b a5,a5 (PC=0xd84)
      11'd1027: field_o = 16'd640;  // S834 lbu a3,0(a3) (PC=0xd88)
      11'd1093: field_o = 16'd896;  // S835 lbu t3,0(t3) (PC=0xd8c)
      11'd1038: field_o = 16'd512;  // S836 lbu t1,0(t1) (PC=0xd90)
      11'd1095: field_o = 16'd1536;  // S837 lbu a6,0(a6) (PC=0xd94)
      11'd1091: field_o = 16'd1024;  // S838 lbu a7,0(a7) (PC=0xd98)
      11'd463: field_o = 16'd8576;  // S839 add a5,a2,a5 (PC=0xd9c)
      11'd1030: field_o = 16'd0;  // S840 lbu a5,0(a5) (PC=0xda0)
      11'd635: field_o = 16'd2691;  // S841 slli s7,s7,0x18 (PC=0xda4)
      11'd493: field_o = 16'd25984;  // S842 add s11,s0,s11 (PC=0xda8)
      11'd639: field_o = 16'd3075;  // S843 slli s6,s6,0x18 (PC=0xdac)
      11'd495: field_o = 16'd26112;  // S844 add s10,s0,s10 (PC=0xdb0)
      11'd643: field_o = 16'd3203;  // S845 slli s5,s5,0x18 (PC=0xdb4)
      11'd497: field_o = 16'd26240;  // S846 add s9,s0,s9 (PC=0xdb8)
      11'd385: field_o = 16'd13824;  // S847 lw s11,0(s11) (PC=0xdbc)
      11'd387: field_o = 16'd26368;  // S848 lw s10,0(s10) (PC=0xdc0)
      11'd389: field_o = 16'd4736;  // S849 lw s9,0(s9) (PC=0xdc4)
      11'd1245: field_o = 16'd26496;  // S850 or s7,s7,s4 (PC=0xdc8)
      11'd1247: field_o = 16'd26624;  // S851 or s6,s6,t2 (PC=0xdcc)
      11'd1249: field_o = 16'd26752;  // S852 or s5,s5,t0 (PC=0xdd0)
      11'd589: field_o = 16'd2177;  // S853 slli t6,t6,0x8 (PC=0xdd4)
      11'd597: field_o = 16'd1665;  // S854 slli t5,t5,0x8 (PC=0xdd8)
      11'd573: field_o = 16'd1409;  // S855 slli t4,t4,0x8 (PC=0xddc)
      11'd552: field_o = 16'd387;  // S856 slli a4,a4,0x18 (PC=0xde0)
      11'd499: field_o = 16'd26880;  // S857 add s8,s0,s8 (PC=0xde4)
      11'd391: field_o = 16'd27008;  // S858 lw t0,0(s8) (PC=0xde8)
      11'd605: field_o = 16'd898;  // S859 slli t3,t3,0x10 (PC=0xdec)
      11'd613: field_o = 16'd514;  // S860 slli t1,t1,0x10 (PC=0xdf0)
      11'd631: field_o = 16'd1538;  // S861 slli a6,a6,0x10 (PC=0xdf4)
      11'd1217: field_o = 16'd5504;  // S862 or a4,a4,a3 (PC=0xdf8)
      11'd581: field_o = 16'd1025;  // S863 slli a7,a7,0x8 (PC=0xdfc)
      11'd1251: field_o = 16'd27136;  // S864 or t6,s7,t6 (PC=0xe00)
      11'd1253: field_o = 16'd27264;  // S865 or t5,s6,t5 (PC=0xe04)
      11'd1255: field_o = 16'd27392;  // S866 or t4,s5,t4 (PC=0xe08)
      11'd1274: field_o = 16'd47616;  // S867 or a4,a4,a7 (PC=0xe0c)
      11'd1257: field_o = 16'd27520;  // S868 or t6,t6,t3 (PC=0xe10)
      11'd1259: field_o = 16'd27648;  // S869 or t5,t5,t1 (PC=0xe14)
      11'd1261: field_o = 16'd27776;  // S870 or t4,t4,a6 (PC=0xe18)
      11'd567: field_o = 16'd2;  // S871 slli a5,a5,0x10 (PC=0xe1c)
      11'd1301: field_o = 16'd27904;  // S872 xor t6,t6,s11 (PC=0xe20)
      11'd1303: field_o = 16'd28032;  // S873 xor t5,t5,s10 (PC=0xe24)
      11'd1305: field_o = 16'd28160;  // S874 xor t4,t4,s9 (PC=0xe28)
      11'd1275: field_o = 16'd30720;  // S875 or a5,a4,a5 (PC=0xe2c)
      11'd1307: field_o = 16'd11392;  // S876 xor a5,a5,t0 (PC=0xe30)
      11'd719: field_o = 16'd28291;  // S877 srli a6,t4,0x18 (PC=0xe34)
      11'd721: field_o = 16'd28418;  // S878 srli a3,t4,0x10 (PC=0xe38)
      11'd723: field_o = 16'd28545;  // S879 srli a4,t4,0x8 (PC=0xe3c)
      11'd725: field_o = 16'd28675;  // S880 srli s4,t6,0x18 (PC=0xe40)
      11'd727: field_o = 16'd28802;  // S881 srli t2,t6,0x10 (PC=0xe44)
      11'd729: field_o = 16'd28929;  // S882 srli t0,t6,0x8 (PC=0xe48)
      11'd731: field_o = 16'd29059;  // S883 srli t3,t5,0x18 (PC=0xe4c)
      11'd733: field_o = 16'd29186;  // S884 srli t1,t5,0x10 (PC=0xe50)
      11'd735: field_o = 16'd13441;  // S885 srli a7,t5,0x8 (PC=0xe54)
      11'd1346: field_o = 16'd8874;  // S886 sb a6,11(a1) (PC=0xe58)
      11'd1350: field_o = 16'd8990;  // S887 sb a3,10(a1) (PC=0xe5c)
      11'd1354: field_o = 16'd4391;  // S888 sb a4,9(a1) (PC=0xe60)
      11'd1357: field_o = 16'd29328;  // S889 sb s4,3(a1) (PC=0xe64)
      11'd1359: field_o = 16'd29446;  // S890 sb t2,2(a1) (PC=0xe68)
      11'd1361: field_o = 16'd29576;  // S891 sb t0,1(a1) (PC=0xe6c)
      11'd1363: field_o = 16'd29696;  // S892 sb t6,0(a1) (PC=0xe70)
      11'd1365: field_o = 16'd29865;  // S893 sb t3,7(a1) (PC=0xe74)
      11'd1367: field_o = 16'd29969;  // S894 sb t1,6(a1) (PC=0xe78)
      11'd1369: field_o = 16'd11046;  // S895 sb a7,5(a1) (PC=0xe7c)
      11'd1371: field_o = 16'd30085;  // S896 sb t5,4(a1) (PC=0xe80)
      11'd1373: field_o = 16'd30209;  // S897 sb t4,8(a1) (PC=0xe84)
      11'd698: field_o = 16'd13571;  // S898 srli a6,a5,0x18 (PC=0xe88)
      11'd1347: field_o = 16'd8847;  // S899 sb a6,15(a1) (PC=0xe8c)
      11'd690: field_o = 16'd4610;  // S900 srli a3,a5,0x10 (PC=0xe90)
      11'd737: field_o = 16'd4225;  // S901 srli a4,a5,0x8 (PC=0xe94)
      11'd1375: field_o = 16'd4999;  // S902 sb a5,12(a1) (PC=0xe98)
      11'd313: field_o = 16'd13952;  // S903 lw a5,0(sp) (PC=0xe9c)
      11'd1351: field_o = 16'd8971;  // S904 sb a3,14(a1) (PC=0xea0)
      11'd1355: field_o = 16'd4392;  // S905 sb a4,13(a1) (PC=0xea4)
      11'd141: field_o = 16'd5250;  // S906 addi a1,a1,16 (PC=0xea8)
      11'd91: field_o = 16'd1922;  // S907 addi a0,a0,16 (PC=0xeac)
      11'd1537: field_o = 16'd4992;  // S908 bne a1,a5,a18 <_nettle_aes_decrypt.part.0+0x70> (PC=0xeb0)
      11'd260: field_o = 16'd2968;  // S909 lw s0,60(sp) (PC=0xeb4)
      11'd275: field_o = 16'd3737;  // S910 lw s1,56(sp) (PC=0xeb8)
      11'd305: field_o = 16'd9110;  // S911 lw s2,52(sp) (PC=0xebc)
      11'd317: field_o = 16'd14103;  // S912 lw s3,48(sp) (PC=0xec0)
      11'd321: field_o = 16'd14234;  // S913 lw s4,44(sp) (PC=0xec4)
      11'd325: field_o = 16'd14363;  // S914 lw s5,40(sp) (PC=0xec8)
      11'd329: field_o = 16'd14492;  // S915 lw s6,36(sp) (PC=0xecc)
      11'd333: field_o = 16'd14606;  // S916 lw s7,32(sp) (PC=0xed0)
      11'd283: field_o = 16'd5773;  // S917 lw s8,28(sp) (PC=0xed4)
      11'd291: field_o = 16'd5891;  // S918 lw s9,24(sp) (PC=0xed8)
      11'd299: field_o = 16'd6045;  // S919 lw s10,20(sp) (PC=0xedc)
      11'd337: field_o = 16'd14722;  // S920 lw s11,16(sp) (PC=0xee0)
      11'd11: field_o = 16'd1164;  // S921 addi sp,sp,64 (PC=0xee4)
      11'd1458: field_o = 16'd256;  // S922 ret (PC=0xee8)
      11'd845: field_o = 16'd14861;  // S923 li s8,28 (PC=0xeec)
      11'd849: field_o = 16'd14979;  // S924 li s9,24 (PC=0xef0)
      11'd853: field_o = 16'd15133;  // S925 li s10,20 (PC=0xef4)
      11'd857: field_o = 16'd15234;  // S926 li s11,16 (PC=0xef8)
      11'd1415: field_o = 16'd128;  // S927 j cc4 <_nettle_aes_decrypt.part.0+0x31c> (PC=0xefc)
      11'd1459: field_o = 16'd256;  // S928 ret (PC=0xf00)
      11'd1509: field_o = 16'd10505;  // S929 beqz a1,f0c <_aes_set_key+0x8> (PC=0xf04)
      11'd1416: field_o = 16'd128;  // S930 j 2c0 <_aes_set_key.part.0> (PC=0xf08)
      11'd1417: field_o = 16'd128;  // S931 j f0c <_aes_set_key+0x8> (PC=0xf0c)
      11'd777: field_o = 16'd783;  // S932 li a5,15 (PC=0xf10)
      11'd1568: field_o = 16'd2816;  // S933 bgeu a5,a1,f24 <aes_set_encrypt_key+0x14> (PC=0xf14)
      11'd778: field_o = 16'd782;  // S934 li a5,32 (PC=0xf18)
      11'd1569: field_o = 16'd2816;  // S935 bgeu a5,a1,f28 <aes_set_encrypt_key+0x18> (PC=0xf1c)
      11'd1418: field_o = 16'd128;  // S936 j f20 <aes_set_encrypt_key+0x10> (PC=0xf20)
      11'd1419: field_o = 16'd128;  // S937 j f24 <aes_set_encrypt_key+0x14> (PC=0xf24)
      11'd1664: field_o = 16'd4992;  // S938 beq a1,a5,f50 <aes_set_encrypt_key+0x40> (PC=0xf28)
      11'd779: field_o = 16'd818;  // S939 li a5,23 (PC=0xf2c)
      11'd1570: field_o = 16'd2816;  // S940 bgeu a5,a1,f5c <aes_set_encrypt_key+0x4c> (PC=0xf30)
      11'd780: field_o = 16'd775;  // S941 li a5,12 (PC=0xf34)
      11'd819: field_o = 16'd2065;  // S942 li a1,6 (PC=0xf38)
      11'd992: field_o = 16'd30848;  // S943 sw a5,0(a0) (PC=0xf3c)
      11'd190: field_o = 16'd6400;  // S944 mv a3,a2 (PC=0xf40)
      11'd220: field_o = 16'd47749;  // S945 addi a2,a0,4 (PC=0xf44)
      11'd118: field_o = 16'd11648;  // S946 mv a0,a5 (PC=0xf48)
      11'd1420: field_o = 16'd128;  // S947 j 2c0 <_aes_set_key.part.0> (PC=0xf4c)
      11'd781: field_o = 16'd779;  // S948 li a5,14 (PC=0xf50)
      11'd820: field_o = 16'd2049;  // S949 li a1,8 (PC=0xf54)
      11'd1421: field_o = 16'd128;  // S950 j f3c <aes_set_encrypt_key+0x2c> (PC=0xf58)
      11'd782: field_o = 16'd798;  // S951 li a5,10 (PC=0xf5c)
      11'd821: field_o = 16'd2053;  // S952 li a1,4 (PC=0xf60)
      11'd1422: field_o = 16'd128;  // S953 j f3c <aes_set_encrypt_key+0x2c> (PC=0xf64)
      11'd665: field_o = 16'd12934;  // S954 slli t3,a0,0x2 (PC=0xf68)
      11'd1667: field_o = 16'd47872;  // S955 beq a2,a1,1050 <_nettle_aes_invert+0xe8> (PC=0xf6c)
      11'd656: field_o = 16'd3461;  // S956 slli a5,a0,0x4 (PC=0xf70)
      11'd516: field_o = 16'd48000;  // S957 add a2,a2,a5 (PC=0xf74)
      11'd163: field_o = 16'd17408;  // S958 mv a6,a1 (PC=0xf78)
      11'd868: field_o = 16'd16000;  // S959 li t1,0 (PC=0xf7c)
      11'd862: field_o = 16'd30978;  // S960 li a7,16 (PC=0xf80)
      11'd783: field_o = 16'd768;  // S961 li a5,0 (PC=0xf84)
      11'd517: field_o = 16'd48128;  // S962 add a4,a2,a5 (PC=0xf88)
      11'd406: field_o = 16'd6528;  // S963 lw a3,0(a4) (PC=0xf8c)
      11'd518: field_o = 16'd48256;  // S964 add a4,a6,a5 (PC=0xf90)
      11'd39: field_o = 16'd5;  // S965 addi a5,a5,4 (PC=0xf94)
      11'd1000: field_o = 16'd16896;  // S966 sw a3,0(a4) (PC=0xf98)
      11'd1545: field_o = 16'd48384;  // S967 bne a5,a7,f88 <_nettle_aes_invert+0x20> (PC=0xf9c)
      11'd83: field_o = 16'd517;  // S968 addi t1,t1,4 (PC=0xfa0)
      11'd50: field_o = 16'd2453;  // S969 addi a2,a2,-16 (PC=0xfa4)
      11'd67: field_o = 16'd1538;  // S970 addi a6,a6,16 (PC=0xfa8)
      11'd1579: field_o = 16'd48512;  // S971 bgeu t3,t1,f84 <_nettle_aes_invert+0x1c> (PC=0xfac)
      11'd784: field_o = 16'd773;  // S972 li a5,4 (PC=0xfb0)
      11'd1580: field_o = 16'd48640;  // S973 bgeu a5,t3,10a8 <_nettle_aes_invert+0x140> (PC=0xfb4)
      11'd657: field_o = 16'd3461;  // S974 slli a5,a0,0x4 (PC=0xfb8)
      11'd842: field_o = 16'd13091;  // S975 lui a6,0x10 (PC=0xfbc)
      11'd159: field_o = 16'd16642;  // S976 addi a0,a1,16 (PC=0xfc0)
      11'd68: field_o = 16'd1536;  // S977 mv a6,a6 (PC=0xfc4)
      11'd519: field_o = 16'd48768;  // S978 add a1,a1,a5 (PC=0xfc8)
      11'd407: field_o = 16'd3456;  // S979 lw a5,0(a0) (PC=0xfcc)
      11'd92: field_o = 16'd1925;  // S980 addi a0,a0,4 (PC=0xfd0)
      11'd762: field_o = 16'd31107;  // S981 srli a2,a5,0x18 (PC=0xfd4)
      11'd691: field_o = 16'd4625;  // S982 srli a3,a5,0x6 (PC=0xfd8)
      11'd666: field_o = 16'd2438;  // S983 slli a2,a2,0x2 (PC=0xfdc)
      11'd520: field_o = 16'd48896;  // S984 add a2,a6,a2 (PC=0xfe0)
      11'd1189: field_o = 16'd4228;  // S985 zext.b a4,a5 (PC=0xfe4)
      11'd1139: field_o = 16'd691;  // S986 andi a3,a3,1020 (PC=0xfe8)
      11'd677: field_o = 16'd11;  // S987 srli a5,a5,0xe (PC=0xfec)
      11'd408: field_o = 16'd49031;  // S988 lw a7,12(a2) (PC=0xff0)
      11'd521: field_o = 16'd49152;  // S989 add a3,a6,a3 (PC=0xff4)
      11'd553: field_o = 16'd390;  // S990 slli a4,a4,0x2 (PC=0xff8)
      11'd1125: field_o = 16'd51;  // S991 andi a5,a5,1020 (PC=0xffc)
      11'd409: field_o = 16'd49287;  // S992 lw a2,12(a3) (PC=0x1000)
      11'd522: field_o = 16'd49408;  // S993 add a4,a6,a4 (PC=0x1004)
      11'd523: field_o = 16'd49536;  // S994 add a5,a6,a5 (PC=0x1008)
      11'd410: field_o = 16'd4615;  // S995 lw a3,12(a5) (PC=0x100c)
      11'd411: field_o = 16'd11271;  // S996 lw t1,12(a4) (PC=0x1010)
      11'd763: field_o = 16'd49665;  // S997 srli a5,a7,0x8 (PC=0x1014)
      11'd582: field_o = 16'd1027;  // S998 slli a7,a7,0x18 (PC=0x1018)
      11'd667: field_o = 16'd15361;  // S999 slli a4,a2,0x8 (PC=0x101c)
      11'd1276: field_o = 16'd31232;  // S1000 or a5,a5,a7 (PC=0x1020)
      11'd764: field_o = 16'd2435;  // S1001 srli a2,a2,0x18 (PC=0x1024)
      11'd1277: field_o = 16'd49792;  // S1002 or a2,a4,a2 (PC=0x1028)
      11'd1331: field_o = 16'd17152;  // S1003 xor a5,a5,t1 (PC=0x102c)
      11'd668: field_o = 16'd10754;  // S1004 slli a4,a3,0x10 (PC=0x1030)
      11'd765: field_o = 16'd642;  // S1005 srli a3,a3,0x10 (PC=0x1034)
      11'd1332: field_o = 16'd49920;  // S1006 xor a5,a5,a2 (PC=0x1038)
      11'd1218: field_o = 16'd5504;  // S1007 or a4,a4,a3 (PC=0x103c)
      11'd1333: field_o = 16'd30720;  // S1008 xor a5,a4,a5 (PC=0x1040)
      11'd993: field_o = 16'd30880;  // S1009 sw a5,-4(a0) (PC=0x1044)
      11'd1546: field_o = 16'd50048;  // S1010 bne a1,a0,fcc <_nettle_aes_invert+0x64> (PC=0x1048)
      11'd1460: field_o = 16'd256;  // S1011 ret (PC=0x104c)
      11'd1519: field_o = 16'd50185;  // S1012 beqz t3,10ac <_nettle_aes_invert+0x144> (PC=0x1050)
      11'd669: field_o = 16'd12816;  // S1013 slli t4,a0,0x3 (PC=0x1054)
      11'd524: field_o = 16'd50304;  // S1014 add t4,t4,a1 (PC=0x1058)
      11'd574: field_o = 16'd1416;  // S1015 slli t4,t4,0x1 (PC=0x105c)
      11'd144: field_o = 16'd15490;  // S1016 addi a3,a1,16 (PC=0x1060)
      11'd221: field_o = 16'd17536;  // S1017 mv t1,t3 (PC=0x1064)
      11'd863: field_o = 16'd30976;  // S1018 li a7,0 (PC=0x1068)
      11'd130: field_o = 16'd1410;  // S1019 addi t4,t4,16 (PC=0x106c)
      11'd148: field_o = 16'd5397;  // S1020 addi a5,a3,-16 (PC=0x1070)
      11'd1633: field_o = 16'd50432;  // S1021 sub a4,t4,a3 (PC=0x1074)
      11'd412: field_o = 16'd9728;  // S1022 lw a6,0(a4) (PC=0x1078)
      11'd413: field_o = 16'd31104;  // S1023 lw a2,0(a5) (PC=0x107c)
      11'd40: field_o = 16'd5;  // S1024 addi a5,a5,4 (PC=0x1080)
      11'd111: field_o = 16'd389;  // S1025 addi a4,a4,4 (PC=0x1084)
      11'd1001: field_o = 16'd50592;  // S1026 sw a6,-4(a5) (PC=0x1088)
      11'd1002: field_o = 16'd50720;  // S1027 sw a2,-4(a4) (PC=0x108c)
      11'd1547: field_o = 16'd9984;  // S1028 bne a3,a5,1078 <_nettle_aes_invert+0x110> (PC=0x1090)
      11'd134: field_o = 16'd1029;  // S1029 addi a7,a7,4 (PC=0x1094)
      11'd84: field_o = 16'd544;  // S1030 addi t1,t1,-4 (PC=0x1098)
      11'd99: field_o = 16'd642;  // S1031 addi a3,a3,16 (PC=0x109c)
      11'd1761: field_o = 16'd50816;  // S1032 bltu a7,t1,1070 <_nettle_aes_invert+0x108> (PC=0x10a0)
      11'd1423: field_o = 16'd128;  // S1033 j fb0 <_nettle_aes_invert+0x48> (PC=0x10a4)
      11'd1461: field_o = 16'd256;  // S1034 ret (PC=0x10a8)
      11'd1462: field_o = 16'd256;  // S1035 ret (PC=0x10ac)
      11'd12: field_o = 16'd1227;  // S1036 addi sp,sp,-80 (PC=0x10b0)
      11'd923: field_o = 16'd4141;  // S1037 sw ra,76(sp) (PC=0x10b4)
      11'd985: field_o = 16'd16135;  // S1038 sw a0,12(sp) (PC=0x10b8)
      11'd1510: field_o = 16'd10505;  // S1039 beqz a1,1200 <benchmark_body+0x150> (PC=0x10bc)
      11'd931: field_o = 16'd4532;  // S1040 sw s1,68(sp) (PC=0x10c0)
      11'd832: field_o = 16'd9226;  // S1041 lui s1,0x13 (PC=0x10c4)
      11'd942: field_o = 16'd11544;  // S1042 sw s3,60(sp) (PC=0x10c8)
      11'd946: field_o = 16'd11801;  // S1043 sw s4,56(sp) (PC=0x10cc)
      11'd958: field_o = 16'd12186;  // S1044 sw s7,44(sp) (PC=0x10d0)
      11'd962: field_o = 16'd12315;  // S1045 sw s8,40(sp) (PC=0x10d4)
      11'd222: field_o = 16'd50997;  // S1046 addi s1,s1,-2004 (PC=0x10d8)
      11'd869: field_o = 16'd51082;  // S1047 lui s4,0x13 (PC=0x10dc)
      11'd846: field_o = 16'd14881;  // S1048 lui s8,0x12 (PC=0x10e0)
      11'd870: field_o = 16'd51210;  // S1049 lui s3,0x13 (PC=0x10e4)
      11'd871: field_o = 16'd51338;  // S1050 lui s7,0x13 (PC=0x10e8)
      11'd916: field_o = 16'd3638;  // S1051 sw s0,72(sp) (PC=0x10ec)
      11'd938: field_o = 16'd6796;  // S1052 sw s2,64(sp) (PC=0x10f0)
      11'd950: field_o = 16'd11926;  // S1053 sw s5,52(sp) (PC=0x10f4)
      11'd954: field_o = 16'd12055;  // S1054 sw s6,48(sp) (PC=0x10f8)
      11'd966: field_o = 16'd12444;  // S1055 sw s9,36(sp) (PC=0x10fc)
      11'd970: field_o = 16'd12558;  // S1056 sw s10,32(sp) (PC=0x1100)
      11'd974: field_o = 16'd12685;  // S1057 sw s11,28(sp) (PC=0x1104)
      11'd223: field_o = 16'd51456;  // S1058 mv s6,a1 (PC=0x1108)
      11'd1003: field_o = 16'd51585;  // S1059 sw zero,8(sp) (PC=0x110c)
      11'd872: field_o = 16'd51745;  // S1060 lui s5,0x12 (PC=0x1110)
      11'd138: field_o = 16'd4940;  // S1061 addi s4,s4,-2000 (PC=0x1114)
      11'd126: field_o = 16'd5709;  // S1062 addi s8,s8,1580 (PC=0x1118)
      11'd224: field_o = 16'd51918;  // S1063 addi s3,s3,-1760 (PC=0x111c)
      11'd854: field_o = 16'd15140;  // S1064 lui s10,0x11 (PC=0x1120)
      11'd122: field_o = 16'd2767;  // S1065 addi s7,s7,-1260 (PC=0x1124)
      11'd850: field_o = 16'd15011;  // S1066 lui s9,0x10 (PC=0x1128)
      11'd873: field_o = 16'd51979;  // S1067 li s2,14 (PC=0x112c)
      11'd225: field_o = 16'd52176;  // S1068 addi s0,s1,504 (PC=0x1130)
      11'd858: field_o = 16'd15232;  // S1069 li s11,0 (PC=0x1134)
      11'd192: field_o = 16'd31406;  // S1070 addi a3,s5,1548 (PC=0x1138)
      11'd226: field_o = 16'd52224;  // S1071 mv a2,s4 (PC=0x113c)
      11'd822: field_o = 16'd2049;  // S1072 li a1,8 (PC=0x1140)
      11'd805: field_o = 16'd1803;  // S1073 li a0,14 (PC=0x1144)
      11'd976: field_o = 16'd15616;  // S1074 sw s2,0(s1) (PC=0x1148)
      11'd1482: field_o = 16'd1361;  // S1075 jal 2c0 <_aes_set_key.part.0> (PC=0x114c)
      11'd227: field_o = 16'd52352;  // S1076 mv a5,s8 (PC=0x1150)
      11'd228: field_o = 16'd52480;  // S1077 mv a4,s3 (PC=0x1154)
      11'd837: field_o = 16'd9655;  // S1078 li a3,256 (PC=0x1158)
      11'd229: field_o = 16'd52645;  // S1079 addi a2,s10,1292 (PC=0x115c)
      11'd230: field_o = 16'd52736;  // S1080 mv a1,s4 (PC=0x1160)
      11'd806: field_o = 16'd1803;  // S1081 li a0,14 (PC=0x1164)
      11'd1483: field_o = 16'd1362;  // S1082 jal 44c <_nettle_aes_encrypt.part.0> (PC=0x1168)
      11'd193: field_o = 16'd31406;  // S1083 addi a3,s5,1548 (PC=0x116c)
      11'd194: field_o = 16'd31488;  // S1084 mv a2,s0 (PC=0x1170)
      11'd823: field_o = 16'd2049;  // S1085 li a1,8 (PC=0x1174)
      11'd807: field_o = 16'd1803;  // S1086 li a0,14 (PC=0x1178)
      11'd977: field_o = 16'd15663;  // S1087 sw s2,500(s1) (PC=0x117c)
      11'd1484: field_o = 16'd1363;  // S1088 jal 2c0 <_aes_set_key.part.0> (PC=0x1180)
      11'd195: field_o = 16'd31488;  // S1089 mv a2,s0 (PC=0x1184)
      11'd196: field_o = 16'd31616;  // S1090 mv a1,s0 (PC=0x1188)
      11'd808: field_o = 16'd1803;  // S1091 li a0,14 (PC=0x118c)
      11'd1485: field_o = 16'd1364;  // S1092 jal f68 <_nettle_aes_invert> (PC=0x1190)
      11'd62: field_o = 16'd3840;  // S1093 mv a5,s3 (PC=0x1194)
      11'd231: field_o = 16'd52864;  // S1094 mv a4,s7 (PC=0x1198)
      11'd838: field_o = 16'd9655;  // S1095 li a3,256 (PC=0x119c)
      11'd232: field_o = 16'd53048;  // S1096 addi a2,s9,1036 (PC=0x11a0)
      11'd197: field_o = 16'd31616;  // S1097 mv a1,s0 (PC=0x11a4)
      11'd809: field_o = 16'd1803;  // S1098 li a0,14 (PC=0x11a8)
      11'd233: field_o = 16'd13832;  // S1099 addi s11,s11,1 (PC=0x11ac)
      11'd978: field_o = 16'd15663;  // S1100 sw s2,500(s1) (PC=0x11b0)
      11'd1486: field_o = 16'd1365;  // S1101 jal 9a8 <_nettle_aes_decrypt.part.0> (PC=0x11b4)
      11'd1548: field_o = 16'd53120;  // S1102 bne s6,s11,1138 <benchmark_body+0x88> (PC=0x11b8)
      11'd314: field_o = 16'd13953;  // S1103 lw a5,8(sp) (PC=0x11bc)
      11'd414: field_o = 16'd53255;  // S1104 lw a4,12(sp) (PC=0x11c0)
      11'd41: field_o = 16'd8;  // S1105 addi a5,a5,1 (PC=0x11c4)
      11'd904: field_o = 16'd2561;  // S1106 sw a5,8(sp) (PC=0x11c8)
      11'd1549: field_o = 16'd53376;  // S1107 bne a4,a5,1134 <benchmark_body+0x84> (PC=0x11cc)
      11'd261: field_o = 16'd2998;  // S1108 lw s0,72(sp) (PC=0x11d0)
      11'd276: field_o = 16'd3764;  // S1109 lw s1,68(sp) (PC=0x11d4)
      11'd306: field_o = 16'd9100;  // S1110 lw s2,64(sp) (PC=0x11d8)
      11'd318: field_o = 16'd14104;  // S1111 lw s3,60(sp) (PC=0x11dc)
      11'd322: field_o = 16'd14233;  // S1112 lw s4,56(sp) (PC=0x11e0)
      11'd326: field_o = 16'd14358;  // S1113 lw s5,52(sp) (PC=0x11e4)
      11'd330: field_o = 16'd14487;  // S1114 lw s6,48(sp) (PC=0x11e8)
      11'd334: field_o = 16'd14618;  // S1115 lw s7,44(sp) (PC=0x11ec)
      11'd284: field_o = 16'd5787;  // S1116 lw s8,40(sp) (PC=0x11f0)
      11'd292: field_o = 16'd5916;  // S1117 lw s9,36(sp) (PC=0x11f4)
      11'd300: field_o = 16'd6030;  // S1118 lw s10,32(sp) (PC=0x11f8)
      11'd338: field_o = 16'd14733;  // S1119 lw s11,28(sp) (PC=0x11fc)
      11'd268: field_o = 16'd3373;  // S1120 lw ra,76(sp) (PC=0x1200)
      11'd810: field_o = 16'd1792;  // S1121 li a0,0 (PC=0x1204)
      11'd13: field_o = 16'd1238;  // S1122 addi sp,sp,80 (PC=0x1208)
      11'd1463: field_o = 16'd256;  // S1123 ret (PC=0x120c)
      11'd14: field_o = 16'd1173;  // S1124 addi sp,sp,-16 (PC=0x1210)
      11'd932: field_o = 16'd4485;  // S1125 sw s1,4(sp) (PC=0x1214)
      11'd415: field_o = 16'd16768;  // S1126 lw s1,0(a1) (PC=0x1218)
      11'd917: field_o = 16'd3585;  // S1127 sw s0,8(sp) (PC=0x121c)
      11'd234: field_o = 16'd53509;  // S1128 addi a2,a1,4 (PC=0x1220)
      11'd113: field_o = 16'd10112;  // S1129 mv s0,a0 (PC=0x1224)
      11'd198: field_o = 16'd31749;  // S1130 addi a1,a0,4 (PC=0x1228)
      11'd152: field_o = 16'd15744;  // S1131 mv a0,s1 (PC=0x122c)
      11'd924: field_o = 16'd4103;  // S1132 sw ra,12(sp) (PC=0x1230)
      11'd1487: field_o = 16'd1367;  // S1133 jal f68 <_nettle_aes_invert> (PC=0x1234)
      11'd269: field_o = 16'd3335;  // S1134 lw ra,12(sp) (PC=0x1238)
      11'd980: field_o = 16'd15872;  // S1135 sw s1,0(s0) (PC=0x123c)
      11'd262: field_o = 16'd2945;  // S1136 lw s0,8(sp) (PC=0x1240)
      11'd277: field_o = 16'd3717;  // S1137 lw s1,4(sp) (PC=0x1244)
      11'd15: field_o = 16'd1154;  // S1138 addi sp,sp,16 (PC=0x1248)
      11'd1464: field_o = 16'd256;  // S1139 ret (PC=0x124c)
      11'd785: field_o = 16'd783;  // S1140 li a5,15 (PC=0x1250)
      11'd1571: field_o = 16'd2816;  // S1141 bgeu a5,a1,1264 <aes_set_decrypt_key+0x14> (PC=0x1254)
      11'd786: field_o = 16'd782;  // S1142 li a5,32 (PC=0x1258)
      11'd1572: field_o = 16'd2816;  // S1143 bgeu a5,a1,1268 <aes_set_decrypt_key+0x18> (PC=0x125c)
      11'd1424: field_o = 16'd128;  // S1144 j 1260 <aes_set_decrypt_key+0x10> (PC=0x1260)
      11'd1425: field_o = 16'd128;  // S1145 j 1264 <aes_set_decrypt_key+0x14> (PC=0x1264)
      11'd16: field_o = 16'd1173;  // S1146 addi sp,sp,-16 (PC=0x1268)
      11'd918: field_o = 16'd3585;  // S1147 sw s0,8(sp) (PC=0x126c)
      11'd925: field_o = 16'd4103;  // S1148 sw ra,12(sp) (PC=0x1270)
      11'd933: field_o = 16'd4485;  // S1149 sw s1,4(sp) (PC=0x1274)
      11'd939: field_o = 16'd6784;  // S1150 sw s2,0(sp) (PC=0x1278)
      11'd114: field_o = 16'd10112;  // S1151 mv s0,a0 (PC=0x127c)
      11'd1665: field_o = 16'd4992;  // S1152 beq a1,a5,12d8 <aes_set_decrypt_key+0x88> (PC=0x1280)
      11'd787: field_o = 16'd818;  // S1153 li a5,23 (PC=0x1284)
      11'd1573: field_o = 16'd2816;  // S1154 bgeu a5,a1,12e4 <aes_set_decrypt_key+0x94> (PC=0x1288)
      11'd833: field_o = 16'd9223;  // S1155 li s1,12 (PC=0x128c)
      11'd824: field_o = 16'd2065;  // S1156 li a1,6 (PC=0x1290)
      11'd235: field_o = 16'd53637;  // S1157 addi s2,s0,4 (PC=0x1294)
      11'd981: field_o = 16'd15872;  // S1158 sw s1,0(s0) (PC=0x1298)
      11'd191: field_o = 16'd6400;  // S1159 mv a3,a2 (PC=0x129c)
      11'd153: field_o = 16'd15744;  // S1160 mv a0,s1 (PC=0x12a0)
      11'd200: field_o = 16'd31872;  // S1161 mv a2,s2 (PC=0x12a4)
      11'd1488: field_o = 16'd1368;  // S1162 jal 2c0 <_aes_set_key.part.0> (PC=0x12a8)
      11'd201: field_o = 16'd31872;  // S1163 mv a2,s2 (PC=0x12ac)
      11'd236: field_o = 16'd53760;  // S1164 mv a1,s2 (PC=0x12b0)
      11'd154: field_o = 16'd15744;  // S1165 mv a0,s1 (PC=0x12b4)
      11'd1489: field_o = 16'd1369;  // S1166 jal f68 <_nettle_aes_invert> (PC=0x12b8)
      11'd270: field_o = 16'd3335;  // S1167 lw ra,12(sp) (PC=0x12bc)
      11'd982: field_o = 16'd15872;  // S1168 sw s1,0(s0) (PC=0x12c0)
      11'd263: field_o = 16'd2945;  // S1169 lw s0,8(sp) (PC=0x12c4)
      11'd278: field_o = 16'd3717;  // S1170 lw s1,4(sp) (PC=0x12c8)
      11'd307: field_o = 16'd9088;  // S1171 lw s2,0(sp) (PC=0x12cc)
      11'd17: field_o = 16'd1154;  // S1172 addi sp,sp,16 (PC=0x12d0)
      11'd1465: field_o = 16'd256;  // S1173 ret (PC=0x12d4)
      11'd834: field_o = 16'd9227;  // S1174 li s1,14 (PC=0x12d8)
      11'd825: field_o = 16'd2049;  // S1175 li a1,8 (PC=0x12dc)
      11'd1426: field_o = 16'd128;  // S1176 j 1294 <aes_set_decrypt_key+0x44> (PC=0x12e0)
      11'd835: field_o = 16'd9246;  // S1177 li s1,10 (PC=0x12e4)
      11'd826: field_o = 16'd2053;  // S1178 li a1,4 (PC=0x12e8)
      11'd1427: field_o = 16'd128;  // S1179 j 1294 <aes_set_decrypt_key+0x44> (PC=0x12ec)
      11'd1172: field_o = 16'd7055;  // S1180 andi a6,a3,15 (PC=0x12f0)
      11'd1601: field_o = 16'd9865;  // S1181 bnez a6,12fc <_nettle_aes_encrypt+0xc> (PC=0x12f4)
      11'd1428: field_o = 16'd128;  // S1182 j 44c <_nettle_aes_encrypt.part.0> (PC=0x12f8)
      11'd1429: field_o = 16'd128;  // S1183 j 12fc <_nettle_aes_encrypt+0xc> (PC=0x12fc)
      11'd1173: field_o = 16'd7055;  // S1184 andi a6,a3,15 (PC=0x1300)
      11'd1602: field_o = 16'd9865;  // S1185 bnez a6,130c <_nettle_aes_decrypt+0xc> (PC=0x1304)
      11'd1430: field_o = 16'd128;  // S1186 j 9a8 <_nettle_aes_decrypt.part.0> (PC=0x1308)
      11'd1431: field_o = 16'd128;  // S1187 j 130c <_nettle_aes_decrypt+0xc> (PC=0x130c)
      11'd1149: field_o = 16'd9487;  // S1188 andi a5,a1,15 (PC=0x1310)
      11'd202: field_o = 16'd6912;  // S1189 mv a6,a0 (PC=0x1314)
      11'd1514: field_o = 16'd5129;  // S1190 beqz a5,1320 <aes_encrypt+0x10> (PC=0x1318)
      11'd1432: field_o = 16'd128;  // S1191 j 131c <aes_encrypt+0xc> (PC=0x131c)
      11'd394: field_o = 16'd1920;  // S1192 lw a0,0(a0) (PC=0x1320)
      11'd204: field_o = 16'd15360;  // S1193 mv a4,a2 (PC=0x1324)
      11'd829: field_o = 16'd6308;  // S1194 lui a2,0x11 (PC=0x1328)
      11'd149: field_o = 16'd5376;  // S1195 mv a5,a3 (PC=0x132c)
      11'd51: field_o = 16'd2469;  // S1196 addi a2,a2,1292 (PC=0x1330)
      11'd145: field_o = 16'd15488;  // S1197 mv a3,a1 (PC=0x1334)
      11'd206: field_o = 16'd32005;  // S1198 addi a1,a6,4 (PC=0x1338)
      11'd1433: field_o = 16'd128;  // S1199 j 44c <_nettle_aes_encrypt.part.0> (PC=0x133c)
      11'd1150: field_o = 16'd9487;  // S1200 andi a5,a1,15 (PC=0x1340)
      11'd203: field_o = 16'd6912;  // S1201 mv a6,a0 (PC=0x1344)
      11'd1515: field_o = 16'd5129;  // S1202 beqz a5,1350 <aes_decrypt+0x10> (PC=0x1348)
      11'd1434: field_o = 16'd128;  // S1203 j 134c <aes_decrypt+0xc> (PC=0x134c)
      11'd395: field_o = 16'd1920;  // S1204 lw a0,0(a0) (PC=0x1350)
      11'd205: field_o = 16'd15360;  // S1205 mv a4,a2 (PC=0x1354)
      11'd830: field_o = 16'd6307;  // S1206 lui a2,0x10 (PC=0x1358)
      11'd150: field_o = 16'd5376;  // S1207 mv a5,a3 (PC=0x135c)
      11'd52: field_o = 16'd2488;  // S1208 addi a2,a2,1036 (PC=0x1360)
      11'd146: field_o = 16'd15488;  // S1209 mv a3,a1 (PC=0x1364)
      11'd207: field_o = 16'd32005;  // S1210 addi a1,a6,4 (PC=0x1368)
      11'd1435: field_o = 16'd128;  // S1211 j 9a8 <_nettle_aes_decrypt.part.0> (PC=0x136c)
      11'd861: field_o = 16'd17290;  // S1212 lui t3,0x13 (PC=0x1370)
      11'd831: field_o = 16'd6305;  // S1213 lui a2,0x12 (PC=0x1374)
      11'd76: field_o = 16'd949;  // S1214 addi t3,t3,-2004 (PC=0x1378)
      11'd53: field_o = 16'd2478;  // S1215 addi a2,a2,1548 (PC=0x137c)
      11'd237: field_o = 16'd53978;  // S1216 addi a3,t3,244 (PC=0x1380)
      11'd161: field_o = 16'd17115;  // S1217 addi a6,a2,288 (PC=0x1384)
      11'd238: field_o = 16'd54108;  // S1218 addi a1,t3,744 (PC=0x1388)
      11'd54: field_o = 16'd2446;  // S1219 addi a2,a2,32 (PC=0x138c)
      11'd77: field_o = 16'd943;  // S1220 addi t3,t3,500 (PC=0x1390)
      11'd811: field_o = 16'd1800;  // S1221 li a0,1 (PC=0x1394)
      11'd1041: field_o = 16'd10752;  // S1222 lbu a4,0(a3) (PC=0x1398)
      11'd1106: field_o = 16'd54144;  // S1223 lbu t1,0(a6) (PC=0x139c)
      11'd1107: field_o = 16'd54272;  // S1224 lbu a5,0(a2) (PC=0x13a0)
      11'd1108: field_o = 16'd54400;  // S1225 lbu a7,0(a1) (PC=0x13a4)
      11'd1634: field_o = 16'd17664;  // S1226 sub a4,a4,t1 (PC=0x13a8)
      11'd1697: field_o = 16'd392;  // S1227 seqz a4,a4 (PC=0x13ac)
      11'd1635: field_o = 16'd31232;  // S1228 sub a5,a5,a7 (PC=0x13b0)
      11'd1792: field_o = 16'd54528;  // S1229 neg a4,a4 (PC=0x13b4)
      11'd1698: field_o = 16'd8;  // S1230 seqz a5,a5 (PC=0x13b8)
      11'd1824: field_o = 16'd16384;  // S1231 and a0,a0,a4 (PC=0x13bc)
      11'd1793: field_o = 16'd54656;  // S1232 neg a5,a5 (PC=0x13c0)
      11'd100: field_o = 16'd648;  // S1233 addi a3,a3,1 (PC=0x13c4)
      11'd1825: field_o = 16'd9344;  // S1234 and a0,a0,a5 (PC=0x13c8)
      11'd69: field_o = 16'd1544;  // S1235 addi a6,a6,1 (PC=0x13cc)
      11'd55: field_o = 16'd2440;  // S1236 addi a2,a2,1 (PC=0x13d0)
      11'd142: field_o = 16'd5256;  // S1237 addi a1,a1,1 (PC=0x13d4)
      11'd1550: field_o = 16'd54784;  // S1238 bne a3,t3,1398 <verify_benchmark+0x28> (PC=0x13d8)
      11'd1466: field_o = 16'd256;  // S1239 ret (PC=0x13dc)
      11'd1467: field_o = 16'd256;  // S1240 ret (PC=0x13e0)
      11'd199: field_o = 16'd31744;  // S1241 mv a1,a0 (PC=0x13e4)
      11'd812: field_o = 16'd1800;  // S1242 li a0,1 (PC=0x13e8)
      11'd1436: field_o = 16'd128;  // S1243 j 10b0 <benchmark_body> (PC=0x13ec)
      11'd827: field_o = 16'd2056;  // S1244 li a1,1 (PC=0x13f0)
      11'd813: field_o = 16'd1837;  // S1245 li a0,76 (PC=0x13f4)
      11'd1437: field_o = 16'd128;  // S1246 j 10b0 <benchmark_body> (PC=0x13f8)
      default: ;
    endcase
  end
endmodule

(* keep_hierarchy = "yes" *)
module regs_rom import ibex_pkg::*; (
  input  logic [8:0] idx_i,
  output logic [4:0] rs1_o, rs2_o, rd_o
);
  always_comb begin
    rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd0;
    case (idx_i)
      9'd0: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd1: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd2: begin rs1_o = 5'd1; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd3: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd4: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd5: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd6: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd7: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd8: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd9: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd2; end
      9'd10: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd1; end
      9'd11: begin rs1_o = 5'd29; rs2_o = 5'd0; rd_o = 5'd29; end
      9'd12: begin rs1_o = 5'd16; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd13: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd30; end
      9'd14: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd15: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd16: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd17: begin rs1_o = 5'd31; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd18: begin rs1_o = 5'd5; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd19: begin rs1_o = 5'd12; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd20: begin rs1_o = 5'd2; rs2_o = 5'd15; rd_o = 5'd0; end
      9'd21: begin rs1_o = 5'd23; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd22: begin rs1_o = 5'd15; rs2_o = 5'd11; rd_o = 5'd0; end
      9'd23: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd8; end
      9'd24: begin rs1_o = 5'd22; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd25: begin rs1_o = 5'd21; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd26: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd1; end
      9'd27: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd28: begin rs1_o = 5'd2; rs2_o = 5'd8; rd_o = 5'd0; end
      9'd29: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd9; end
      9'd30: begin rs1_o = 5'd19; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd31: begin rs1_o = 5'd7; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd32: begin rs1_o = 5'd2; rs2_o = 5'd1; rd_o = 5'd0; end
      9'd33: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd34: begin rs1_o = 5'd11; rs2_o = 5'd14; rd_o = 5'd0; end
      9'd35: begin rs1_o = 5'd2; rs2_o = 5'd9; rd_o = 5'd0; end
      9'd36: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd37: begin rs1_o = 5'd25; rs2_o = 5'd0; rd_o = 5'd25; end
      9'd38: begin rs1_o = 5'd20; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd39: begin rs1_o = 5'd11; rs2_o = 5'd15; rd_o = 5'd0; end
      9'd40: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd41: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd42: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd43: begin rs1_o = 5'd14; rs2_o = 5'd13; rd_o = 5'd14; end
      9'd44: begin rs1_o = 5'd24; rs2_o = 5'd0; rd_o = 5'd24; end
      9'd45: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd24; end
      9'd46: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd25; end
      9'd47: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd26; end
      9'd48: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd49: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd50: begin rs1_o = 5'd12; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd51: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd52: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd53: begin rs1_o = 5'd2; rs2_o = 5'd18; rd_o = 5'd0; end
      9'd54: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd55: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd56: begin rs1_o = 5'd12; rs2_o = 5'd23; rd_o = 5'd23; end
      9'd57: begin rs1_o = 5'd12; rs2_o = 5'd22; rd_o = 5'd22; end
      9'd58: begin rs1_o = 5'd12; rs2_o = 5'd5; rd_o = 5'd5; end
      9'd59: begin rs1_o = 5'd12; rs2_o = 5'd21; rd_o = 5'd21; end
      9'd60: begin rs1_o = 5'd12; rs2_o = 5'd31; rd_o = 5'd31; end
      9'd61: begin rs1_o = 5'd12; rs2_o = 5'd13; rd_o = 5'd13; end
      9'd62: begin rs1_o = 5'd12; rs2_o = 5'd29; rd_o = 5'd29; end
      9'd63: begin rs1_o = 5'd12; rs2_o = 5'd28; rd_o = 5'd28; end
      9'd64: begin rs1_o = 5'd12; rs2_o = 5'd6; rd_o = 5'd6; end
      9'd65: begin rs1_o = 5'd12; rs2_o = 5'd14; rd_o = 5'd14; end
      9'd66: begin rs1_o = 5'd12; rs2_o = 5'd30; rd_o = 5'd30; end
      9'd67: begin rs1_o = 5'd12; rs2_o = 5'd15; rd_o = 5'd15; end
      9'd68: begin rs1_o = 5'd12; rs2_o = 5'd17; rd_o = 5'd17; end
      9'd69: begin rs1_o = 5'd11; rs2_o = 5'd16; rd_o = 5'd0; end
      9'd70: begin rs1_o = 5'd11; rs2_o = 5'd13; rd_o = 5'd0; end
      9'd71: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd18; end
      9'd72: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd9; end
      9'd73: begin rs1_o = 5'd10; rs2_o = 5'd15; rd_o = 5'd10; end
      9'd74: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd75: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd76: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd77: begin rs1_o = 5'd16; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd78: begin rs1_o = 5'd13; rs2_o = 5'd15; rd_o = 5'd0; end
      9'd79: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd8; end
      9'd80: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd81: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd82: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd83: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd84: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd85: begin rs1_o = 5'd15; rs2_o = 5'd14; rd_o = 5'd15; end
      9'd86: begin rs1_o = 5'd11; rs2_o = 5'd17; rd_o = 5'd0; end
      9'd87: begin rs1_o = 5'd12; rs2_o = 5'd29; rd_o = 5'd15; end
      9'd88: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd89: begin rs1_o = 5'd15; rs2_o = 5'd5; rd_o = 5'd15; end
      9'd90: begin rs1_o = 5'd2; rs2_o = 5'd19; rd_o = 5'd0; end
      9'd91: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd92: begin rs1_o = 5'd2; rs2_o = 5'd20; rd_o = 5'd0; end
      9'd93: begin rs1_o = 5'd2; rs2_o = 5'd21; rd_o = 5'd0; end
      9'd94: begin rs1_o = 5'd2; rs2_o = 5'd22; rd_o = 5'd0; end
      9'd95: begin rs1_o = 5'd2; rs2_o = 5'd23; rd_o = 5'd0; end
      9'd96: begin rs1_o = 5'd2; rs2_o = 5'd24; rd_o = 5'd0; end
      9'd97: begin rs1_o = 5'd2; rs2_o = 5'd25; rd_o = 5'd0; end
      9'd98: begin rs1_o = 5'd2; rs2_o = 5'd26; rd_o = 5'd0; end
      9'd99: begin rs1_o = 5'd2; rs2_o = 5'd27; rd_o = 5'd0; end
      9'd100: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd29; end
      9'd101: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd102: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd103: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd30; end
      9'd104: begin rs1_o = 5'd12; rs2_o = 5'd7; rd_o = 5'd7; end
      9'd105: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd106: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd107: begin rs1_o = 5'd12; rs2_o = 5'd20; rd_o = 5'd20; end
      9'd108: begin rs1_o = 5'd27; rs2_o = 5'd0; rd_o = 5'd27; end
      9'd109: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd110: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd19; end
      9'd111: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd112: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd113: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd114: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd115: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd27; end
      9'd116: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd24; end
      9'd117: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd25; end
      9'd118: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd26; end
      9'd119: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd27; end
      9'd120: begin rs1_o = 5'd12; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd121: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd122: begin rs1_o = 5'd9; rs2_o = 5'd18; rd_o = 5'd0; end
      9'd123: begin rs1_o = 5'd9; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd124: begin rs1_o = 5'd8; rs2_o = 5'd9; rd_o = 5'd0; end
      9'd125: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd126: begin rs1_o = 5'd2; rs2_o = 5'd10; rd_o = 5'd0; end
      9'd127: begin rs1_o = 5'd15; rs2_o = 5'd10; rd_o = 5'd0; end
      9'd128: begin rs1_o = 5'd10; rs2_o = 5'd14; rd_o = 5'd10; end
      9'd129: begin rs1_o = 5'd15; rs2_o = 5'd11; rd_o = 5'd15; end
      9'd130: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd131: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd9; end
      9'd132: begin rs1_o = 5'd14; rs2_o = 5'd13; rd_o = 5'd0; end
      9'd133: begin rs1_o = 5'd12; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd134: begin rs1_o = 5'd15; rs2_o = 5'd6; rd_o = 5'd15; end
      9'd135: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd136: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd137: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd138: begin rs1_o = 5'd14; rs2_o = 5'd6; rd_o = 5'd14; end
      9'd139: begin rs1_o = 5'd15; rs2_o = 5'd14; rd_o = 5'd0; end
      9'd140: begin rs1_o = 5'd17; rs2_o = 5'd16; rd_o = 5'd0; end
      9'd141: begin rs1_o = 5'd15; rs2_o = 5'd13; rd_o = 5'd15; end
      9'd142: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd143: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd144: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd18; end
      9'd145: begin rs1_o = 5'd18; rs2_o = 5'd0; rd_o = 5'd19; end
      9'd146: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd8; end
      9'd147: begin rs1_o = 5'd14; rs2_o = 5'd13; rd_o = 5'd15; end
      9'd148: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd149: begin rs1_o = 5'd8; rs2_o = 5'd19; rd_o = 5'd9; end
      9'd150: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd151: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd152: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd153: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd30; end
      9'd154: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd155: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd156: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd157: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd158: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd159: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd160: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd24; end
      9'd161: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd25; end
      9'd162: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd26; end
      9'd163: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd27; end
      9'd164: begin rs1_o = 5'd7; rs2_o = 5'd23; rd_o = 5'd7; end
      9'd165: begin rs1_o = 5'd5; rs2_o = 5'd22; rd_o = 5'd5; end
      9'd166: begin rs1_o = 5'd31; rs2_o = 5'd21; rd_o = 5'd31; end
      9'd167: begin rs1_o = 5'd30; rs2_o = 5'd20; rd_o = 5'd30; end
      9'd168: begin rs1_o = 5'd16; rs2_o = 5'd30; rd_o = 5'd16; end
      9'd169: begin rs1_o = 5'd29; rs2_o = 5'd7; rd_o = 5'd29; end
      9'd170: begin rs1_o = 5'd28; rs2_o = 5'd5; rd_o = 5'd28; end
      9'd171: begin rs1_o = 5'd6; rs2_o = 5'd31; rd_o = 5'd6; end
      9'd172: begin rs1_o = 5'd13; rs2_o = 5'd16; rd_o = 5'd13; end
      9'd173: begin rs1_o = 5'd17; rs2_o = 5'd6; rd_o = 5'd17; end
      9'd174: begin rs1_o = 5'd17; rs2_o = 5'd26; rd_o = 5'd17; end
      9'd175: begin rs1_o = 5'd13; rs2_o = 5'd27; rd_o = 5'd13; end
      9'd176: begin rs1_o = 5'd16; rs2_o = 5'd18; rd_o = 5'd0; end
      9'd177: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd178: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd24; end
      9'd179: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd25; end
      9'd180: begin rs1_o = 5'd23; rs2_o = 5'd0; rd_o = 5'd26; end
      9'd181: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd182: begin rs1_o = 5'd12; rs2_o = 5'd24; rd_o = 5'd24; end
      9'd183: begin rs1_o = 5'd16; rs2_o = 5'd0; rd_o = 5'd30; end
      9'd184: begin rs1_o = 5'd12; rs2_o = 5'd25; rd_o = 5'd16; end
      9'd185: begin rs1_o = 5'd22; rs2_o = 5'd0; rd_o = 5'd25; end
      9'd186: begin rs1_o = 5'd5; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd187: begin rs1_o = 5'd24; rs2_o = 5'd0; rd_o = 5'd27; end
      9'd188: begin rs1_o = 5'd21; rs2_o = 5'd0; rd_o = 5'd24; end
      9'd189: begin rs1_o = 5'd31; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd190: begin rs1_o = 5'd20; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd191: begin rs1_o = 5'd23; rs2_o = 5'd22; rd_o = 5'd22; end
      9'd192: begin rs1_o = 5'd22; rs2_o = 5'd31; rd_o = 5'd22; end
      9'd193: begin rs1_o = 5'd27; rs2_o = 5'd26; rd_o = 5'd26; end
      9'd194: begin rs1_o = 5'd25; rs2_o = 5'd24; rd_o = 5'd24; end
      9'd195: begin rs1_o = 5'd16; rs2_o = 5'd21; rd_o = 5'd16; end
      9'd196: begin rs1_o = 5'd16; rs2_o = 5'd31; rd_o = 5'd16; end
      9'd197: begin rs1_o = 5'd24; rs2_o = 5'd5; rd_o = 5'd5; end
      9'd198: begin rs1_o = 5'd19; rs2_o = 5'd0; rd_o = 5'd27; end
      9'd199: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd29; end
      9'd200: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd201: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd202: begin rs1_o = 5'd12; rs2_o = 5'd16; rd_o = 5'd16; end
      9'd203: begin rs1_o = 5'd8; rs2_o = 5'd27; rd_o = 5'd27; end
      9'd204: begin rs1_o = 5'd8; rs2_o = 5'd26; rd_o = 5'd26; end
      9'd205: begin rs1_o = 5'd8; rs2_o = 5'd25; rd_o = 5'd25; end
      9'd206: begin rs1_o = 5'd26; rs2_o = 5'd0; rd_o = 5'd26; end
      9'd207: begin rs1_o = 5'd23; rs2_o = 5'd20; rd_o = 5'd23; end
      9'd208: begin rs1_o = 5'd22; rs2_o = 5'd7; rd_o = 5'd22; end
      9'd209: begin rs1_o = 5'd21; rs2_o = 5'd5; rd_o = 5'd21; end
      9'd210: begin rs1_o = 5'd8; rs2_o = 5'd24; rd_o = 5'd24; end
      9'd211: begin rs1_o = 5'd24; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd212: begin rs1_o = 5'd23; rs2_o = 5'd31; rd_o = 5'd31; end
      9'd213: begin rs1_o = 5'd22; rs2_o = 5'd30; rd_o = 5'd30; end
      9'd214: begin rs1_o = 5'd21; rs2_o = 5'd29; rd_o = 5'd29; end
      9'd215: begin rs1_o = 5'd31; rs2_o = 5'd28; rd_o = 5'd31; end
      9'd216: begin rs1_o = 5'd30; rs2_o = 5'd6; rd_o = 5'd30; end
      9'd217: begin rs1_o = 5'd29; rs2_o = 5'd16; rd_o = 5'd29; end
      9'd218: begin rs1_o = 5'd31; rs2_o = 5'd27; rd_o = 5'd31; end
      9'd219: begin rs1_o = 5'd30; rs2_o = 5'd26; rd_o = 5'd30; end
      9'd220: begin rs1_o = 5'd29; rs2_o = 5'd25; rd_o = 5'd29; end
      9'd221: begin rs1_o = 5'd29; rs2_o = 5'd0; rd_o = 5'd16; end
      9'd222: begin rs1_o = 5'd29; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd223: begin rs1_o = 5'd29; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd224: begin rs1_o = 5'd31; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd225: begin rs1_o = 5'd31; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd226: begin rs1_o = 5'd31; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd227: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd228: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd229: begin rs1_o = 5'd11; rs2_o = 5'd20; rd_o = 5'd0; end
      9'd230: begin rs1_o = 5'd11; rs2_o = 5'd7; rd_o = 5'd0; end
      9'd231: begin rs1_o = 5'd11; rs2_o = 5'd5; rd_o = 5'd0; end
      9'd232: begin rs1_o = 5'd11; rs2_o = 5'd31; rd_o = 5'd0; end
      9'd233: begin rs1_o = 5'd11; rs2_o = 5'd28; rd_o = 5'd0; end
      9'd234: begin rs1_o = 5'd11; rs2_o = 5'd6; rd_o = 5'd0; end
      9'd235: begin rs1_o = 5'd11; rs2_o = 5'd30; rd_o = 5'd0; end
      9'd236: begin rs1_o = 5'd11; rs2_o = 5'd29; rd_o = 5'd0; end
      9'd237: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd238: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd239: begin rs1_o = 5'd7; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd240: begin rs1_o = 5'd14; rs2_o = 5'd15; rd_o = 5'd15; end
      9'd241: begin rs1_o = 5'd10; rs2_o = 5'd15; rd_o = 5'd0; end
      9'd242: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd243: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd244: begin rs1_o = 5'd15; rs2_o = 5'd17; rd_o = 5'd15; end
      9'd245: begin rs1_o = 5'd21; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd246: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd247: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd248: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd249: begin rs1_o = 5'd18; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd250: begin rs1_o = 5'd16; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd251: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd2; end
      9'd252: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd253: begin rs1_o = 5'd5; rs2_o = 5'd6; rd_o = 5'd0; end
      9'd254: begin rs1_o = 5'd5; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd255: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd256: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd257: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd258: begin rs1_o = 5'd14; rs2_o = 5'd10; rd_o = 5'd0; end
      9'd259: begin rs1_o = 5'd10; rs2_o = 5'd11; rd_o = 5'd11; end
      9'd260: begin rs1_o = 5'd15; rs2_o = 5'd10; rd_o = 5'd10; end
      9'd261: begin rs1_o = 5'd12; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd262: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd263: begin rs1_o = 5'd10; rs2_o = 5'd15; rd_o = 5'd14; end
      9'd264: begin rs1_o = 5'd12; rs2_o = 5'd14; rd_o = 5'd0; end
      9'd265: begin rs1_o = 5'd11; rs2_o = 5'd16; rd_o = 5'd11; end
      9'd266: begin rs1_o = 5'd14; rs2_o = 5'd11; rd_o = 5'd14; end
      9'd267: begin rs1_o = 5'd10; rs2_o = 5'd11; rd_o = 5'd8; end
      9'd268: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd269: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd270: begin rs1_o = 5'd10; rs2_o = 5'd8; rd_o = 5'd11; end
      9'd271: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd272: begin rs1_o = 5'd8; rs2_o = 5'd9; rd_o = 5'd12; end
      9'd273: begin rs1_o = 5'd9; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd274: begin rs1_o = 5'd15; rs2_o = 5'd12; rd_o = 5'd0; end
      9'd275: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd276: begin rs1_o = 5'd13; rs2_o = 5'd28; rd_o = 5'd28; end
      9'd277: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd10; end
      9'd278: begin rs1_o = 5'd15; rs2_o = 5'd10; rd_o = 5'd15; end
      9'd279: begin rs1_o = 5'd16; rs2_o = 5'd15; rd_o = 5'd0; end
      9'd280: begin rs1_o = 5'd28; rs2_o = 5'd13; rd_o = 5'd0; end
      9'd281: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd29; end
      9'd282: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd30; end
      9'd283: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd284: begin rs1_o = 5'd5; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd285: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd286: begin rs1_o = 5'd14; rs2_o = 5'd5; rd_o = 5'd14; end
      9'd287: begin rs1_o = 5'd14; rs2_o = 5'd15; rd_o = 5'd14; end
      9'd288: begin rs1_o = 5'd16; rs2_o = 5'd11; rd_o = 5'd7; end
      9'd289: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd290: begin rs1_o = 5'd10; rs2_o = 5'd6; rd_o = 5'd5; end
      9'd291: begin rs1_o = 5'd10; rs2_o = 5'd6; rd_o = 5'd6; end
      9'd292: begin rs1_o = 5'd10; rs2_o = 5'd13; rd_o = 5'd13; end
      9'd293: begin rs1_o = 5'd10; rs2_o = 5'd15; rd_o = 5'd15; end
      9'd294: begin rs1_o = 5'd7; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd295: begin rs1_o = 5'd30; rs2_o = 5'd11; rd_o = 5'd0; end
      9'd296: begin rs1_o = 5'd7; rs2_o = 5'd31; rd_o = 5'd0; end
      9'd297: begin rs1_o = 5'd15; rs2_o = 5'd13; rd_o = 5'd13; end
      9'd298: begin rs1_o = 5'd15; rs2_o = 5'd5; rd_o = 5'd5; end
      9'd299: begin rs1_o = 5'd15; rs2_o = 5'd6; rd_o = 5'd6; end
      9'd300: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd301: begin rs1_o = 5'd15; rs2_o = 5'd14; rd_o = 5'd14; end
      9'd302: begin rs1_o = 5'd15; rs2_o = 5'd29; rd_o = 5'd15; end
      9'd303: begin rs1_o = 5'd14; rs2_o = 5'd28; rd_o = 5'd14; end
      9'd304: begin rs1_o = 5'd15; rs2_o = 5'd24; rd_o = 5'd15; end
      9'd305: begin rs1_o = 5'd14; rs2_o = 5'd25; rd_o = 5'd14; end
      9'd306: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd307: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd308: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd309: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd310: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd311: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd312: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd29; end
      9'd313: begin rs1_o = 5'd7; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd314: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd315: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd316: begin rs1_o = 5'd20; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd317: begin rs1_o = 5'd20; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd318: begin rs1_o = 5'd26; rs2_o = 5'd7; rd_o = 5'd7; end
      9'd319: begin rs1_o = 5'd7; rs2_o = 5'd13; rd_o = 5'd31; end
      9'd320: begin rs1_o = 5'd5; rs2_o = 5'd29; rd_o = 5'd29; end
      9'd321: begin rs1_o = 5'd16; rs2_o = 5'd6; rd_o = 5'd13; end
      9'd322: begin rs1_o = 5'd22; rs2_o = 5'd28; rd_o = 5'd22; end
      9'd323: begin rs1_o = 5'd31; rs2_o = 5'd14; rd_o = 5'd6; end
      9'd324: begin rs1_o = 5'd13; rs2_o = 5'd17; rd_o = 5'd13; end
      9'd325: begin rs1_o = 5'd29; rs2_o = 5'd30; rd_o = 5'd14; end
      9'd326: begin rs1_o = 5'd22; rs2_o = 5'd15; rd_o = 5'd30; end
      9'd327: begin rs1_o = 5'd20; rs2_o = 5'd9; rd_o = 5'd0; end
      9'd328: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd329: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd330: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd331: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd332: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd333: begin rs1_o = 5'd17; rs2_o = 5'd13; rd_o = 5'd17; end
      9'd334: begin rs1_o = 5'd17; rs2_o = 5'd15; rd_o = 5'd15; end
      9'd335: begin rs1_o = 5'd14; rs2_o = 5'd29; rd_o = 5'd14; end
      9'd336: begin rs1_o = 5'd15; rs2_o = 5'd28; rd_o = 5'd15; end
      9'd337: begin rs1_o = 5'd14; rs2_o = 5'd24; rd_o = 5'd14; end
      9'd338: begin rs1_o = 5'd15; rs2_o = 5'd25; rd_o = 5'd15; end
      9'd339: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd340: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd341: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd342: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd343: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd344: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd345: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd346: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd347: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd26; end
      9'd348: begin rs1_o = 5'd6; rs2_o = 5'd0; rd_o = 5'd28; end
      9'd349: begin rs1_o = 5'd26; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd350: begin rs1_o = 5'd20; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd351: begin rs1_o = 5'd30; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd352: begin rs1_o = 5'd7; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd353: begin rs1_o = 5'd7; rs2_o = 5'd0; rd_o = 5'd5; end
      9'd354: begin rs1_o = 5'd26; rs2_o = 5'd20; rd_o = 5'd20; end
      9'd355: begin rs1_o = 5'd22; rs2_o = 5'd6; rd_o = 5'd22; end
      9'd356: begin rs1_o = 5'd16; rs2_o = 5'd17; rd_o = 5'd16; end
      9'd357: begin rs1_o = 5'd20; rs2_o = 5'd29; rd_o = 5'd29; end
      9'd358: begin rs1_o = 5'd5; rs2_o = 5'd28; rd_o = 5'd28; end
      9'd359: begin rs1_o = 5'd29; rs2_o = 5'd13; rd_o = 5'd6; end
      9'd360: begin rs1_o = 5'd28; rs2_o = 5'd30; rd_o = 5'd28; end
      9'd361: begin rs1_o = 5'd22; rs2_o = 5'd14; rd_o = 5'd17; end
      9'd362: begin rs1_o = 5'd16; rs2_o = 5'd15; rd_o = 5'd13; end
      9'd363: begin rs1_o = 5'd7; rs2_o = 5'd9; rd_o = 5'd0; end
      9'd364: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd365: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd31; end
      9'd366: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd367: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd30; end
      9'd368: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd369: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd29; end
      9'd370: begin rs1_o = 5'd14; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd371: begin rs1_o = 5'd15; rs2_o = 5'd0; rd_o = 5'd7; end
      9'd372: begin rs1_o = 5'd14; rs2_o = 5'd17; rd_o = 5'd14; end
      9'd373: begin rs1_o = 5'd10; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd374: begin rs1_o = 5'd12; rs2_o = 5'd11; rd_o = 5'd0; end
      9'd375: begin rs1_o = 5'd12; rs2_o = 5'd15; rd_o = 5'd12; end
      9'd376: begin rs1_o = 5'd12; rs2_o = 5'd15; rd_o = 5'd14; end
      9'd377: begin rs1_o = 5'd16; rs2_o = 5'd15; rd_o = 5'd14; end
      9'd378: begin rs1_o = 5'd15; rs2_o = 5'd17; rd_o = 5'd0; end
      9'd379: begin rs1_o = 5'd28; rs2_o = 5'd6; rd_o = 5'd0; end
      9'd380: begin rs1_o = 5'd15; rs2_o = 5'd28; rd_o = 5'd0; end
      9'd381: begin rs1_o = 5'd11; rs2_o = 5'd15; rd_o = 5'd11; end
      9'd382: begin rs1_o = 5'd16; rs2_o = 5'd12; rd_o = 5'd12; end
      9'd383: begin rs1_o = 5'd12; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd384: begin rs1_o = 5'd16; rs2_o = 5'd13; rd_o = 5'd13; end
      9'd385: begin rs1_o = 5'd13; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd386: begin rs1_o = 5'd16; rs2_o = 5'd14; rd_o = 5'd14; end
      9'd387: begin rs1_o = 5'd16; rs2_o = 5'd15; rd_o = 5'd15; end
      9'd388: begin rs1_o = 5'd17; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd389: begin rs1_o = 5'd14; rs2_o = 5'd12; rd_o = 5'd12; end
      9'd390: begin rs1_o = 5'd15; rs2_o = 5'd12; rd_o = 5'd15; end
      9'd391: begin rs1_o = 5'd11; rs2_o = 5'd10; rd_o = 5'd0; end
      9'd392: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd393: begin rs1_o = 5'd29; rs2_o = 5'd11; rd_o = 5'd29; end
      9'd394: begin rs1_o = 5'd29; rs2_o = 5'd13; rd_o = 5'd14; end
      9'd395: begin rs1_o = 5'd15; rs2_o = 5'd16; rd_o = 5'd0; end
      9'd396: begin rs1_o = 5'd14; rs2_o = 5'd12; rd_o = 5'd0; end
      9'd397: begin rs1_o = 5'd17; rs2_o = 5'd6; rd_o = 5'd0; end
      9'd398: begin rs1_o = 5'd9; rs2_o = 5'd0; rd_o = 5'd9; end
      9'd399: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd20; end
      9'd400: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd19; end
      9'd401: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd23; end
      9'd402: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd22; end
      9'd403: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd0; end
      9'd404: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd21; end
      9'd405: begin rs1_o = 5'd19; rs2_o = 5'd0; rd_o = 5'd19; end
      9'd406: begin rs1_o = 5'd0; rs2_o = 5'd0; rd_o = 5'd18; end
      9'd407: begin rs1_o = 5'd9; rs2_o = 5'd0; rd_o = 5'd8; end
      9'd408: begin rs1_o = 5'd20; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd409: begin rs1_o = 5'd24; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd410: begin rs1_o = 5'd19; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd411: begin rs1_o = 5'd26; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd412: begin rs1_o = 5'd20; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd413: begin rs1_o = 5'd23; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd414: begin rs1_o = 5'd25; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd415: begin rs1_o = 5'd22; rs2_o = 5'd27; rd_o = 5'd0; end
      9'd416: begin rs1_o = 5'd2; rs2_o = 5'd0; rd_o = 5'd14; end
      9'd417: begin rs1_o = 5'd14; rs2_o = 5'd15; rd_o = 5'd0; end
      9'd418: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd12; end
      9'd419: begin rs1_o = 5'd8; rs2_o = 5'd0; rd_o = 5'd18; end
      9'd420: begin rs1_o = 5'd18; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd421: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd13; end
      9'd422: begin rs1_o = 5'd28; rs2_o = 5'd0; rd_o = 5'd11; end
      9'd423: begin rs1_o = 5'd16; rs2_o = 5'd0; rd_o = 5'd6; end
      9'd424: begin rs1_o = 5'd12; rs2_o = 5'd0; rd_o = 5'd15; end
      9'd425: begin rs1_o = 5'd11; rs2_o = 5'd0; rd_o = 5'd17; end
      9'd426: begin rs1_o = 5'd0; rs2_o = 5'd14; rd_o = 5'd14; end
      9'd427: begin rs1_o = 5'd0; rs2_o = 5'd15; rd_o = 5'd15; end
      9'd428: begin rs1_o = 5'd13; rs2_o = 5'd28; rd_o = 5'd0; end
      default: ;
    endcase
  end
endmodule

(* keep_hierarchy = "yes" *)
module fsm_decoder import ibex_pkg::*; (
  input  logic [10:0] state_q_i,
  input  logic [31:0] rf_rdata_a_i, rf_rdata_b_i, result_ex_i,
  input  logic [4:0]  rf_waddr_latch_i,
  input  logic lsu_req_actual_i, ex_valid_i, first_cycle_i,
  output logic [4:0] rf_raddr_a_o, rf_raddr_b_o, rf_waddr_id_o,
  output logic [31:0] alu_operand_a_ex_o,
  output logic [31:0] alu_operand_b_ex_o,
  output alu_op_e alu_operator_ex_o,
  output logic div_en_ex_o,
  output logic div_sel_ex_o,
  output logic en_wb_o,
  output logic expecting_load_resp_o,
  output wb_instr_type_e instr_type_wb_o,
  output logic lsu_req_o,
  output logic lsu_sign_ext_o,
  output logic [1:0] lsu_type_o,
  output logic [31:0] lsu_wdata_o,
  output logic lsu_we_o,
  output logic mult_en_ex_o,
  output logic mult_sel_ex_o,
  output logic [31:0] multdiv_operand_a_ex_o,
  output logic [31:0] multdiv_operand_b_ex_o,
  output md_op_e multdiv_operator_ex_o,
  output logic [1:0] multdiv_signed_mode_ex_o,
  output logic rf_rd_a_wb_match_o,
  output logic rf_rd_b_wb_match_o,
  output logic rf_ren_a_o,
  output logic rf_ren_b_o,
  output logic [31:0] rf_wdata_id_o,
  output logic rf_we_id_o
);
  logic [31:0] rf_rdata_a, rf_rdata_b;
  assign rf_rdata_a = rf_rdata_a_i;
  assign rf_rdata_b = rf_rdata_b_i;
  logic [15:0] field;
  field_rom u_field (.state_q_i(state_q_i), .field_o(field));
  logic rd_valid;
  logic [4:0] rs1_w, rs2_w, rd_w;
  regs_rom u_regs (.idx_i(field[15:7]), .rs1_o(rs1_w), .rs2_o(rs2_w), .rd_o(rd_w));
  assign rf_raddr_a_o = rs1_w;
  assign rf_raddr_b_o = rs2_w;
  assign rf_waddr_id_o = rd_valid ? rd_w : rf_waddr_latch_i;

  logic [31:0] imm_val;
  always_comb begin
    imm_val = '0;
    case (field[6:0])
      7'd0: imm_val = 32'h00000000;
      7'd1: imm_val = 32'h00000008;
      7'd2: imm_val = 32'h00000010;
      7'd3: imm_val = 32'h00000018;
      7'd4: imm_val = 32'h000000FF;
      7'd5: imm_val = 32'h00000004;
      7'd6: imm_val = 32'h00000002;
      7'd7: imm_val = 32'h0000000C;
      7'd8: imm_val = 32'h00000001;
      7'd9: imm_val = 32'h0;
      7'd10: imm_val = 32'h00013000;
      7'd11: imm_val = 32'h0000000E;
      7'd12: imm_val = 32'h00000040;
      7'd13: imm_val = 32'h0000001C;
      7'd14: imm_val = 32'h00000020;
      7'd15: imm_val = 32'h0000000F;
      7'd16: imm_val = 32'h00000003;
      7'd17: imm_val = 32'h00000006;
      7'd18: imm_val = 32'h00000340;
      7'd19: imm_val = 32'h00000140;
      7'd20: imm_val = 32'h00000240;
      7'd21: imm_val = 32'hFFFFFFF0;
      7'd22: imm_val = 32'h00000034;
      7'd23: imm_val = 32'h00000030;
      7'd24: imm_val = 32'h0000003C;
      7'd25: imm_val = 32'h00000038;
      7'd26: imm_val = 32'h0000002C;
      7'd27: imm_val = 32'h00000028;
      7'd28: imm_val = 32'h00000024;
      7'd29: imm_val = 32'h00000014;
      7'd30: imm_val = 32'h0000000A;
      7'd31: imm_val = 32'hFFFFFC14;
      7'd32: imm_val = 32'hFFFFFFFC;
      7'd33: imm_val = 32'h00012000;
      7'd34: imm_val = 32'hFFFFFC18;
      7'd35: imm_val = 32'h00010000;
      7'd36: imm_val = 32'h00011000;
      7'd37: imm_val = 32'h0000050C;
      7'd38: imm_val = 32'h00000005;
      7'd39: imm_val = 32'h00000009;
      7'd40: imm_val = 32'h0000000D;
      7'd41: imm_val = 32'h00000007;
      7'd42: imm_val = 32'h0000000B;
      7'd43: imm_val = 32'hFFFFFC20;
      7'd44: imm_val = 32'hFFFFFC1C;
      7'd45: imm_val = 32'h0000004C;
      7'd46: imm_val = 32'h0000060C;
      7'd47: imm_val = 32'h000001F4;
      7'd48: imm_val = 32'hFFFFFFFF;
      7'd49: imm_val = 32'hFFFFFFC0;
      7'd50: imm_val = 32'h00000017;
      7'd51: imm_val = 32'h000003FC;
      7'd52: imm_val = 32'h00000044;
      7'd53: imm_val = 32'hFFFFF82C;
      7'd54: imm_val = 32'h00000048;
      7'd55: imm_val = 32'h00000100;
      7'd56: imm_val = 32'h0000040C;
      7'd57: imm_val = 32'h00020000;
      7'd58: imm_val = 32'h000007A4;
      7'd59: imm_val = 32'hFFFFFB94;
      7'd60: imm_val = 11'd1409;
      7'd61: imm_val = 32'hFFFFFFE0;
      7'd62: imm_val = 11'd1474;
      7'd63: imm_val = 11'd800;
      7'd64: imm_val = 11'd1476;
      7'd65: imm_val = 11'd1477;
      7'd66: imm_val = 11'd984;
      7'd67: imm_val = 11'd396;
      7'd68: imm_val = 11'd264;
      7'd69: imm_val = 32'h41C65000;
      7'd70: imm_val = 32'hFFFFFE6D;
      7'd71: imm_val = 32'h00003000;
      7'd72: imm_val = 32'h00000039;
      7'd73: imm_val = 11'd1505;
      7'd74: imm_val = 11'd1507;
      7'd75: imm_val = 32'hFFFFFFB0;
      7'd76: imm_val = 32'hFFFFF830;
      7'd77: imm_val = 32'h0000062C;
      7'd78: imm_val = 32'hFFFFF920;
      7'd79: imm_val = 32'hFFFFFB14;
      7'd80: imm_val = 32'h000001F8;
      7'd81: imm_val = 11'd227;
      7'd82: imm_val = 11'd193;
      7'd83: imm_val = 11'd195;
      7'd84: imm_val = 11'd62;
      7'd85: imm_val = 11'd1548;
      7'd86: imm_val = 32'h00000050;
      7'd87: imm_val = 11'd269;
      7'd88: imm_val = 11'd201;
      7'd89: imm_val = 11'd270;
      7'd90: imm_val = 32'h000000F4;
      7'd91: imm_val = 32'h00000120;
      7'd92: imm_val = 32'h000002E8;
      default: ;
    endcase
  end

  ctrl_dec u_ctrl (
    .kind_i(state_q_i[10:5]), .imm_val_i(imm_val),
    .rf_rdata_a(rf_rdata_a), .rf_rdata_b(rf_rdata_b), .result_ex_i(result_ex_i),
    .lsu_req_actual(lsu_req_actual_i), .ex_valid_i(ex_valid_i), .first_cycle(first_cycle_i),
    .rd_valid_o(rd_valid),
    .alu_operand_a_ex_o(alu_operand_a_ex_o),
    .alu_operand_b_ex_o(alu_operand_b_ex_o),
    .alu_operator_ex_o(alu_operator_ex_o),
    .div_en_ex_o(div_en_ex_o),
    .div_sel_ex_o(div_sel_ex_o),
    .en_wb_o(en_wb_o),
    .expecting_load_resp_o(expecting_load_resp_o),
    .instr_type_wb_o(instr_type_wb_o),
    .lsu_req_o(lsu_req_o),
    .lsu_sign_ext_o(lsu_sign_ext_o),
    .lsu_type_o(lsu_type_o),
    .lsu_wdata_o(lsu_wdata_o),
    .lsu_we_o(lsu_we_o),
    .mult_en_ex_o(mult_en_ex_o),
    .mult_sel_ex_o(mult_sel_ex_o),
    .multdiv_operand_a_ex_o(multdiv_operand_a_ex_o),
    .multdiv_operand_b_ex_o(multdiv_operand_b_ex_o),
    .multdiv_operator_ex_o(multdiv_operator_ex_o),
    .multdiv_signed_mode_ex_o(multdiv_signed_mode_ex_o),
    .rf_rd_a_wb_match_o(rf_rd_a_wb_match_o),
    .rf_rd_b_wb_match_o(rf_rd_b_wb_match_o),
    .rf_ren_a_o(rf_ren_a_o),
    .rf_ren_b_o(rf_ren_b_o),
    .rf_wdata_id_o(rf_wdata_id_o),
    .rf_we_id_o(rf_we_id_o)
  );
endmodule

(* keep_hierarchy = "yes" *)
module fsm_next_state import ibex_pkg::*; (
  input  logic [10:0] state_q_i,
  input  logic branch_decision_i,
  input  logic [31:0] rf_rdata_a_i,
  output logic [10:0] state_d_o
);
  always_comb begin
    state_d_o = state_q_i;
    case (state_q_i)
      11'd864: state_d_o = 11'd0;  // S0 lui sp,0x20 (PC=0x80)
      11'd0: state_d_o = 11'd1856;  // S1 addi sp,sp,-16 (PC=0x84)
      11'd1856: state_d_o = 11'd104;  // S2 auipc t0,0x12 (PC=0x88)
      11'd104: state_d_o = 11'd1888;  // S3 addi t0,t0,1956 (PC=0x8c)
      11'd1888: state_d_o = 11'd80;  // S4 auipc t1,0x13 (PC=0x90)
      11'd80: state_d_o = 11'd1920;  // S5 addi t1,t1,-1132 (PC=0x94)
      11'd1920: state_d_o = branch_decision_i ? 11'd1472 : 11'd994;  // S6
      11'd994: state_d_o = 11'd105;  // S7 sw zero,0(t0) (PC=0x9c)
      11'd105: state_d_o = 11'd1408;  // S8 addi t0,t0,4 (PC=0xa0)
      11'd1408: state_d_o = 11'd1920;  // S9 j 98 <bss_loop> (PC=0xa4)
      11'd1472: state_d_o = 11'd1;  // S10 jal b0 <main> (PC=0xa8)
      11'd1409: state_d_o = 11'd1409;  // S11 j ac <loop> (PC=0xac)
      11'd1: state_d_o = 11'd920;  // S12 addi sp,sp,-32 (PC=0xb0)
      11'd920: state_d_o = 11'd1473;  // S13 sw ra,28(sp) (PC=0xb4)
      11'd1473: state_d_o = 11'd1452;  // S14 jal 2ac <initialise_board> (PC=0xb8)
      11'd1474: state_d_o = 11'd1467;  // S15 jal 13e0 <initialise_benchmark> (PC=0xbc)
      11'd800: state_d_o = 11'd1475;  // S16 li a0,0 (PC=0xc0)
      11'd1475: state_d_o = 11'd199;  // S17 jal 13e4 <warm_caches> (PC=0xc4)
      11'd1476: state_d_o = 11'd1411;  // S18 jal 2b0 <start_trigger> (PC=0xc8)
      11'd1477: state_d_o = 11'd827;  // S19 jal 13f0 <benchmark> (PC=0xcc)
      11'd984: state_d_o = 11'd1478;  // S20 sw a0,12(sp) (PC=0xd0)
      11'd1478: state_d_o = 11'd1412;  // S21 jal 2b8 <stop_trigger> (PC=0xd4)
      11'd396: state_d_o = 11'd1479;  // S22 lw a0,12(sp) (PC=0xd8)
      11'd1479: state_d_o = 11'd861;  // S23 jal 1370 <verify_benchmark> (PC=0xdc)
      11'd264: state_d_o = 11'd1696;  // S24 lw ra,28(sp) (PC=0xe0)
      11'd1696: state_d_o = 11'd2;  // S25 seqz a0,a0 (PC=0xe4)
      11'd2: state_d_o = 11'd1440;  // S26 addi sp,sp,32 (PC=0xe8)
      11'd1440: state_d_o = rf_rdata_a_i[10:0];  // S27 ret
      11'd865: state_d_o = 11'd397;  // S28 lui a4,0x13 (PC=0xf0)
      11'd397: state_d_o = 11'd768;  // S29 lw a0,-992(a4) (PC=0xf4)
      11'd768: state_d_o = 11'd32;  // S30 lui a5,0x41c65 (PC=0xf8)
      11'd32: state_d_o = 11'd1728;  // S31 addi a5,a5,-403 (PC=0xfc)
      11'd1728: state_d_o = 11'd769;  // S32 mul a0,a0,a5 (PC=0x100)
      11'd769: state_d_o = 11'd33;  // S33 lui a5,0x3 (PC=0x104)
      11'd33: state_d_o = 11'd500;  // S34 addi a5,a5,57 (PC=0x108)
      11'd500: state_d_o = 11'd648;  // S35 add a0,a0,a5 (PC=0x10c)
      11'd648: state_d_o = 11'd700;  // S36 slli a0,a0,0x1 (PC=0x110)
      11'd700: state_d_o = 11'd995;  // S37 srli a0,a0,0x1 (PC=0x114)
      11'd995: state_d_o = 11'd701;  // S38 sw a0,-992(a4) (PC=0x118)
      11'd701: state_d_o = 11'd1441;  // S39 srli a0,a0,0x10 (PC=0x11c)
      11'd1441: state_d_o = rf_rdata_a_i[10:0];  // S40 ret
      11'd770: state_d_o = 11'd986;  // S41 lui a5,0x13 (PC=0x124)
      11'd986: state_d_o = 11'd1442;  // S42 sw a0,-992(a5) (PC=0x128)
      11'd1442: state_d_o = rf_rdata_a_i[10:0];  // S43 ret
      11'd1148: state_d_o = 11'd1603;  // S44 andi a5,a1,3 (PC=0x130)
      11'd1603: state_d_o = branch_decision_i ? 11'd1410 : 11'd771;  // S45
      11'd771: state_d_o = 11'd501;  // S46 lui a5,0x13 (PC=0x138)
      11'd501: state_d_o = 11'd987;  // S47 add a1,a0,a1 (PC=0x13c)
      11'd987: state_d_o = 11'd772;  // S48 sw a0,-996(a5) (PC=0x140)
      11'd772: state_d_o = 11'd996;  // S49 lui a5,0x13 (PC=0x144)
      11'd996: state_d_o = 11'd773;  // S50 sw a1,-1000(a5) (PC=0x148)
      11'd773: state_d_o = 11'd997;  // S51 lui a5,0x13 (PC=0x14c)
      11'd997: state_d_o = 11'd1443;  // S52 sw zero,-1004(a5) (PC=0x150)
      11'd1443: state_d_o = rf_rdata_a_i[10:0];  // S53 ret
      11'd1410: state_d_o = 11'd1410;  // S54 j 158 <init_heap_beebs+0x28> (PC=0x158)
      11'd774: state_d_o = 11'd340;  // S55 lui a5,0x13 (PC=0x15c)
      11'd340: state_d_o = 11'd775;  // S56 lw a4,-1004(a5) (PC=0x160)
      11'd775: state_d_o = 11'd308;  // S57 lui a5,0x13 (PC=0x164)
      11'd308: state_d_o = 11'd502;  // S58 lw a5,-1000(a5) (PC=0x168)
      11'd502: state_d_o = 11'd1952;  // S59 add a0,a0,a4 (PC=0x16c)
      11'd1952: state_d_o = 11'd1984;  // S60 sltu a0,a5,a0 (PC=0x170)
      11'd1984: state_d_o = 11'd1444;  // S61 xori a0,a0,1 (PC=0x174)
      11'd1444: state_d_o = rf_rdata_a_i[10:0];  // S62 ret
      11'd156: state_d_o = 11'd1504;  // S63 mv a5,a0 (PC=0x17c)
      11'd1504: state_d_o = branch_decision_i ? 11'd801 : 11'd828;  // S64
      11'd828: state_d_o = 11'd398;  // S65 lui a2,0x13 (PC=0x184)
      11'd398: state_d_o = 11'd836;  // S66 lw a0,-996(a2) (PC=0x188)
      11'd836: state_d_o = 11'd399;  // S67 lui a3,0x13 (PC=0x18c)
      11'd399: state_d_o = 11'd503;  // S68 lw a1,-1004(a3) (PC=0x190)
      11'd503: state_d_o = 11'd1174;  // S69 add a4,a0,a5 (PC=0x194)
      11'd1174: state_d_o = 11'd480;  // S70 andi a6,a4,3 (PC=0x198)
      11'd480: state_d_o = 11'd1600;  // S71 add a5,a5,a1 (PC=0x19c)
      11'd1600: state_d_o = branch_decision_i ? 11'd817 : 11'd816;  // S72
      11'd816: state_d_o = 11'd342;  // S73 lui a1,0x13 (PC=0x1a4)
      11'd342: state_d_o = 11'd988;  // S74 lw a1,-1000(a1) (PC=0x1a8)
      11'd988: state_d_o = 11'd1760;  // S75 sw a5,-1004(a3) (PC=0x1ac)
      11'd1760: state_d_o = branch_decision_i ? 11'd801 : 11'd998;  // S76
      11'd998: state_d_o = 11'd1445;  // S77 sw a4,-996(a2) (PC=0x1b4)
      11'd1445: state_d_o = rf_rdata_a_i[10:0];  // S78 ret
      11'd817: state_d_o = 11'd1632;  // S79 li a1,4 (PC=0x1bc)
      11'd1632: state_d_o = 11'd481;  // S80 sub a1,a1,a6 (PC=0x1c0)
      11'd481: state_d_o = 11'd504;  // S81 add a5,a5,a1 (PC=0x1c4)
      11'd504: state_d_o = 11'd818;  // S82 add a4,a4,a1 (PC=0x1c8)
      11'd818: state_d_o = 11'd343;  // S83 lui a1,0x13 (PC=0x1cc)
      11'd343: state_d_o = 11'd989;  // S84 lw a1,-1000(a1) (PC=0x1d0)
      11'd989: state_d_o = 11'd1576;  // S85 sw a5,-1004(a3) (PC=0x1d4)
      11'd1576: state_d_o = branch_decision_i ? 11'd998 : 11'd801;  // S86
      11'd801: state_d_o = 11'd1446;  // S87 li a0,0 (PC=0x1dc)
      11'd1446: state_d_o = rf_rdata_a_i[10:0];  // S88 ret
      11'd3: state_d_o = 11'd912;  // S89 addi sp,sp,-16 (PC=0x1e4)
      11'd912: state_d_o = 11'd1729;  // S90 sw s0,8(sp) (PC=0x1e8)
      11'd1729: state_d_o = 11'd921;  // S91 mul s0,a0,a1 (PC=0x1ec)
      11'd921: state_d_o = 11'd208;  // S92 sw ra,12(sp) (PC=0x1f0)
      11'd208: state_d_o = 11'd1480;  // S93 mv a0,s0 (PC=0x1f4)
      11'd1480: state_d_o = 11'd156;  // S94 jal 17c <malloc_beebs> (PC=0x1f8)
      11'd1505: state_d_o = branch_decision_i ? 11'd265 : 11'd1516;  // S95
      11'd1516: state_d_o = branch_decision_i ? 11'd265 : 11'd505;  // S96
      11'd505: state_d_o = 11'd157;  // S97 add a1,a0,s0 (PC=0x204)
      11'd157: state_d_o = 11'd34;  // S98 mv a5,a0 (PC=0x208)
      11'd34: state_d_o = 11'd1376;  // S99 addi a5,a5,1 (PC=0x20c)
      11'd1376: state_d_o = 11'd1538;  // S100 sb zero,-1(a5) (PC=0x210)
      11'd1538: state_d_o = branch_decision_i ? 11'd34 : 11'd265;  // S101
      11'd265: state_d_o = 11'd256;  // S102 lw ra,12(sp) (PC=0x218)
      11'd256: state_d_o = 11'd4;  // S103 lw s0,8(sp) (PC=0x21c)
      11'd4: state_d_o = 11'd1447;  // S104 addi sp,sp,16 (PC=0x220)
      11'd1447: state_d_o = rf_rdata_a_i[10:0];  // S105 ret
      11'd1506: state_d_o = branch_decision_i ? 11'd803 : 11'd5;  // S106
      11'd5: state_d_o = 11'd913;  // S107 addi sp,sp,-16 (PC=0x22c)
      11'd913: state_d_o = 11'd112;  // S108 sw s0,8(sp) (PC=0x230)
      11'd112: state_d_o = 11'd158;  // S109 mv s0,a0 (PC=0x234)
      11'd158: state_d_o = 11'd928;  // S110 mv a0,a1 (PC=0x238)
      11'd928: state_d_o = 11'd922;  // S111 sw s1,4(sp) (PC=0x23c)
      11'd922: state_d_o = 11'd209;  // S112 sw ra,12(sp) (PC=0x240)
      11'd209: state_d_o = 11'd1481;  // S113 mv s1,a1 (PC=0x244)
      11'd1481: state_d_o = 11'd156;  // S114 jal 17c <malloc_beebs> (PC=0x248)
      11'd1507: state_d_o = branch_decision_i ? 11'd267 : 11'd210;  // S115
      11'd210: state_d_o = 11'd211;  // S116 mv a5,s0 (PC=0x250)
      11'd211: state_d_o = 11'd506;  // S117 mv a4,a0 (PC=0x254)
      11'd506: state_d_o = 11'd1517;  // S118 add a2,s0,s1 (PC=0x258)
      11'd1517: state_d_o = branch_decision_i ? 11'd266 : 11'd1098;  // S119
      11'd1098: state_d_o = 11'd35;  // S120 lbu a3,0(a5) (PC=0x260)
      11'd35: state_d_o = 11'd108;  // S121 addi a5,a5,1 (PC=0x264)
      11'd108: state_d_o = 11'd1377;  // S122 addi a4,a4,1 (PC=0x268)
      11'd1377: state_d_o = 11'd1539;  // S123 sb a3,-1(a4) (PC=0x26c)
      11'd1539: state_d_o = branch_decision_i ? 11'd1098 : 11'd266;  // S124
      11'd266: state_d_o = 11'd257;  // S125 lw ra,12(sp) (PC=0x274)
      11'd257: state_d_o = 11'd272;  // S126 lw s0,8(sp) (PC=0x278)
      11'd272: state_d_o = 11'd6;  // S127 lw s1,4(sp) (PC=0x27c)
      11'd6: state_d_o = 11'd1448;  // S128 addi sp,sp,16 (PC=0x280)
      11'd1448: state_d_o = rf_rdata_a_i[10:0];  // S129 ret
      11'd267: state_d_o = 11'd258;  // S130 lw ra,12(sp) (PC=0x288)
      11'd258: state_d_o = 11'd273;  // S131 lw s0,8(sp) (PC=0x28c)
      11'd273: state_d_o = 11'd802;  // S132 lw s1,4(sp) (PC=0x290)
      11'd802: state_d_o = 11'd7;  // S133 li a0,0 (PC=0x294)
      11'd7: state_d_o = 11'd1449;  // S134 addi sp,sp,16 (PC=0x298)
      11'd1449: state_d_o = rf_rdata_a_i[10:0];  // S135 ret
      11'd803: state_d_o = 11'd1450;  // S136 li a0,0 (PC=0x2a0)
      11'd1450: state_d_o = rf_rdata_a_i[10:0];  // S137 ret
      11'd1451: state_d_o = rf_rdata_a_i[10:0];  // S138 ret
      11'd1452: state_d_o = rf_rdata_a_i[10:0];  // S139 ret
      11'd1411: state_d_o = 11'd1453;  // S140 nop  (PC=0x2b0)
      11'd1453: state_d_o = rf_rdata_a_i[10:0];  // S141 ret
      11'd1412: state_d_o = 11'd1454;  // S142 nop  (PC=0x2b8)
      11'd1454: state_d_o = rf_rdata_a_i[10:0];  // S143 ret
      11'd88: state_d_o = 11'd658;  // S144 addi a0,a0,1 (PC=0x2c0)
      11'd658: state_d_o = 11'd1508;  // S145 slli a7,a0,0x2 (PC=0x2c4)
      11'd1508: state_d_o = branch_decision_i ? 11'd1577 : 11'd659;  // S146
      11'd659: state_d_o = 11'd160;  // S147 slli t3,a1,0x2 (PC=0x2cc)
      11'd160: state_d_o = 11'd507;  // S148 mv a6,a2 (PC=0x2d0)
      11'd507: state_d_o = 11'd1099;  // S149 add t3,a3,t3 (PC=0x2d4)
      11'd1099: state_d_o = 11'd1100;  // S150 lbu a5,3(a3) (PC=0x2d8)
      11'd1100: state_d_o = 11'd1101;  // S151 lbu a0,2(a3) (PC=0x2dc)
      11'd1101: state_d_o = 11'd1040;  // S152 lbu t1,0(a3) (PC=0x2e0)
      11'd1040: state_d_o = 11'd560;  // S153 lbu a4,1(a3) (PC=0x2e4)
      11'd560: state_d_o = 11'd649;  // S154 slli a5,a5,0x18 (PC=0x2e8)
      11'd649: state_d_o = 11'd1262;  // S155 slli a0,a0,0x10 (PC=0x2ec)
      11'd1262: state_d_o = 11'd1263;  // S156 or a5,a5,a0 (PC=0x2f0)
      11'd1263: state_d_o = 11'd544;  // S157 or a5,a5,t1 (PC=0x2f4)
      11'd544: state_d_o = 11'd1220;  // S158 slli a4,a4,0x8 (PC=0x2f8)
      11'd1220: state_d_o = 11'd999;  // S159 or a5,a5,a4 (PC=0x2fc)
      11'd999: state_d_o = 11'd96;  // S160 sw a5,0(a6) (PC=0x300)
      11'd96: state_d_o = 11'd64;  // S161 addi a3,a3,4 (PC=0x304)
      11'd64: state_d_o = 11'd1540;  // S162 addi a6,a6,4 (PC=0x308)
      11'd1540: state_d_o = branch_decision_i ? 11'd1099 : 11'd1577;  // S163
      11'd1577: state_d_o = branch_decision_i ? 11'd1455 : 11'd660;  // S164
      11'd660: state_d_o = 11'd468;  // S165 slli t4,a1,0x2 (PC=0x314)
      11'd468: state_d_o = 11'd860;  // S166 add a5,a2,t4 (PC=0x318)
      11'd860: state_d_o = 11'd804;  // S167 lui t3,0x10 (PC=0x31c)
      11'd804: state_d_o = 11'd341;  // S168 lui a0,0x11 (PC=0x320)
      11'd341: state_d_o = 11'd162;  // S169 lw a4,-4(a5) (PC=0x324)
      11'd162: state_d_o = 11'd72;  // S170 mv a6,a1 (PC=0x328)
      11'd72: state_d_o = 11'd866;  // S171 mv t3,t3 (PC=0x32c)
      11'd866: state_d_o = 11'd867;  // S172 li t5,6 (PC=0x330)
      11'd867: state_d_o = 11'd89;  // S173 li t6,4 (PC=0x334)
      11'd89: state_d_o = 11'd1413;  // S174 addi a0,a0,1292 (PC=0x338)
      11'd1413: state_d_o = 11'd2016;  // S175 j 390 <_aes_set_key.part.0+0xd0> (PC=0x33c)
      11'd1102: state_d_o = 11'd1024;  // S176 lbu a4,0(t0) (PC=0x340)
      11'd1024: state_d_o = 11'd1103;  // S177 lbu a3,0(a3) (PC=0x344)
      11'd1103: state_d_o = 11'd1028;  // S178 lbu t0,0(t1) (PC=0x348)
      11'd1028: state_d_o = 11'd545;  // S179 lbu a5,0(a5) (PC=0x34c)
      11'd545: state_d_o = 11'd1104;  // S180 slli a4,a4,0x18 (PC=0x350)
      11'd1104: state_d_o = 11'd1264;  // S181 lbu t1,0(t3) (PC=0x354)
      11'd1264: state_d_o = 11'd616;  // S182 or a4,a4,t0 (PC=0x358)
      11'd616: state_d_o = 11'd1216;  // S183 slli a3,a3,0x8 (PC=0x35c)
      11'd1216: state_d_o = 11'd561;  // S184 or a4,a4,a3 (PC=0x360)
      11'd561: state_d_o = 11'd1265;  // S185 slli a5,a5,0x10 (PC=0x364)
      11'd1265: state_d_o = 11'd1308;  // S186 or a4,a4,a5 (PC=0x368)
      11'd1308: state_d_o = 11'd73;  // S187 xor a4,a4,t1 (PC=0x36c)
      11'd73: state_d_o = 11'd344;  // S188 addi t3,t3,1 (PC=0x370)
      11'd344: state_d_o = 11'd469;  // S189 lw a3,0(a2) (PC=0x374)
      11'd469: state_d_o = 11'd65;  // S190 add a5,a2,t4 (PC=0x378)
      11'd65: state_d_o = 11'd1280;  // S191 addi a6,a6,1 (PC=0x37c)
      11'd1280: state_d_o = 11'd990;  // S192 xor a4,a4,a3 (PC=0x380)
      11'd990: state_d_o = 11'd48;  // S193 sw a4,0(a5) (PC=0x384)
      11'd48: state_d_o = 11'd1666;  // S194 addi a2,a2,4 (PC=0x388)
      11'd1666: state_d_o = branch_decision_i ? 11'd1455 : 11'd2016;  // S195
      11'd2016: state_d_o = 11'd702;  // S196 remu t2,a6,a1 (PC=0x390)
      11'd702: state_d_o = 11'd661;  // S197 srli a3,a4,0x8 (PC=0x394)
      11'd661: state_d_o = 11'd1222;  // S198 slli a5,a4,0x18 (PC=0x398)
      11'd1222: state_d_o = 11'd704;  // S199 or a5,a5,a3 (PC=0x39c)
      11'd704: state_d_o = 11'd688;  // S200 srli t1,a5,0x18 (PC=0x3a0)
      11'd688: state_d_o = 11'd508;  // S201 srli a3,a5,0x8 (PC=0x3a4)
      11'd508: state_d_o = 11'd1175;  // S202 add t0,a0,t1 (PC=0x3a8)
      11'd1175: state_d_o = 11'd672;  // S203 zext.b t1,a5 (PC=0x3ac)
      11'd672: state_d_o = 11'd1136;  // S204 srli a5,a5,0x10 (PC=0x3b0)
      11'd1136: state_d_o = 11'd1120;  // S205 zext.b a3,a3 (PC=0x3b4)
      11'd1120: state_d_o = 11'd509;  // S206 zext.b a5,a5 (PC=0x3b8)
      11'd509: state_d_o = 11'd510;  // S207 add t1,a0,t1 (PC=0x3bc)
      11'd510: state_d_o = 11'd511;  // S208 add a3,a0,a3 (PC=0x3c0)
      11'd511: state_d_o = 11'd1518;  // S209 add a5,a0,a5 (PC=0x3c4)
      11'd1518: state_d_o = branch_decision_i ? 11'd1102 : 11'd1578;  // S210
      11'd1578: state_d_o = branch_decision_i ? 11'd344 : 11'd1541;  // S211
      11'd1541: state_d_o = branch_decision_i ? 11'd344 : 11'd776;  // S212
      11'd776: state_d_o = 11'd36;  // S213 lui a5,0x11 (PC=0x3d4)
      11'd36: state_d_o = 11'd703;  // S214 addi a5,a5,1292 (PC=0x3d8)
      11'd703: state_d_o = 11'd738;  // S215 srli a3,a4,0x18 (PC=0x3dc)
      11'd738: state_d_o = 11'd1176;  // S216 srli t1,a4,0x8 (PC=0x3e0)
      11'd1176: state_d_o = 11'd512;  // S217 zext.b t0,a4 (PC=0x3e4)
      11'd512: state_d_o = 11'd1128;  // S218 add a3,a5,a3 (PC=0x3e8)
      11'd1128: state_d_o = 11'd1025;  // S219 zext.b t1,t1 (PC=0x3ec)
      11'd1025: state_d_o = 11'd513;  // S220 lbu a3,0(a3) (PC=0x3f0)
      11'd513: state_d_o = 11'd514;  // S221 add t0,a5,t0 (PC=0x3f4)
      11'd514: state_d_o = 11'd680;  // S222 add t1,a5,t1 (PC=0x3f8)
      11'd680: state_d_o = 11'd1152;  // S223 srli a4,a4,0x10 (PC=0x3fc)
      11'd1152: state_d_o = 11'd1032;  // S224 zext.b a4,a4 (PC=0x400)
      11'd1032: state_d_o = 11'd1036;  // S225 lbu t0,0(t0) (PC=0x404)
      11'd1036: state_d_o = 11'd515;  // S226 lbu t1,0(t1) (PC=0x408)
      11'd515: state_d_o = 11'd1105;  // S227 add a5,a5,a4 (PC=0x40c)
      11'd1105: state_d_o = 11'd662;  // S228 lbu a4,0(a5) (PC=0x410)
      11'd662: state_d_o = 11'd1266;  // S229 slli a5,a3,0x18 (PC=0x414)
      11'd1266: state_d_o = 11'd663;  // S230 or a5,a5,t0 (PC=0x418)
      11'd663: state_d_o = 11'd1223;  // S231 slli a3,t1,0x8 (PC=0x41c)
      11'd1223: state_d_o = 11'd345;  // S232 or a5,a5,a3 (PC=0x420)
      11'd345: state_d_o = 11'd546;  // S233 lw a3,0(a2) (PC=0x424)
      11'd546: state_d_o = 11'd1267;  // S234 slli a4,a4,0x10 (PC=0x428)
      11'd1267: state_d_o = 11'd1281;  // S235 or a4,a5,a4 (PC=0x42c)
      11'd1281: state_d_o = 11'd470;  // S236 xor a4,a4,a3 (PC=0x430)
      11'd470: state_d_o = 11'd66;  // S237 add a5,a2,t4 (PC=0x434)
      11'd66: state_d_o = 11'd991;  // S238 addi a6,a6,1 (PC=0x438)
      11'd991: state_d_o = 11'd49;  // S239 sw a4,0(a5) (PC=0x43c)
      11'd49: state_d_o = 11'd1542;  // S240 addi a2,a2,4 (PC=0x440)
      11'd1542: state_d_o = branch_decision_i ? 11'd2016 : 11'd1455;  // S241
      11'd1455: state_d_o = rf_rdata_a_i[10:0];  // S242 ret
      11'd1512: state_d_o = branch_decision_i ? 11'd1457 : 11'd8;  // S243
      11'd8: state_d_o = 11'd936;  // S244 addi sp,sp,-64 (PC=0x450)
      11'd936: state_d_o = 11'd164;  // S245 sw s2,52(sp) (PC=0x454)
      11'd164: state_d_o = 11'd940;  // S246 mv s2,a0 (PC=0x458)
      11'd940: state_d_o = 11'd650;  // S247 sw s3,48(sp) (PC=0x45c)
      11'd650: state_d_o = 11'd116;  // S248 slli s3,s2,0x4 (PC=0x460)
      11'd116: state_d_o = 11'd56;  // S249 mv a0,a5 (PC=0x464)
      11'd56: state_d_o = 11'd896;  // S250 addi a5,s3,4 (PC=0x468)
      11'd896: state_d_o = 11'd57;  // S251 sw a5,4(sp) (PC=0x46c)
      11'd57: state_d_o = 11'd897;  // S252 addi a5,s3,8 (PC=0x470)
      11'd897: state_d_o = 11'd58;  // S253 sw a5,8(sp) (PC=0x474)
      11'd58: state_d_o = 11'd914;  // S254 addi a5,s3,12 (PC=0x478)
      11'd914: state_d_o = 11'd898;  // S255 sw s0,60(sp) (PC=0x47c)
      11'd898: state_d_o = 11'd166;  // S256 sw a5,12(sp) (PC=0x480)
      11'd166: state_d_o = 11'd482;  // S257 mv s0,a1 (PC=0x484)
      11'd482: state_d_o = 11'd929;  // S258 add a5,a4,a3 (PC=0x488)
      11'd929: state_d_o = 11'd944;  // S259 sw s1,56(sp) (PC=0x48c)
      11'd944: state_d_o = 11'd948;  // S260 sw s4,44(sp) (PC=0x490)
      11'd948: state_d_o = 11'd952;  // S261 sw s5,40(sp) (PC=0x494)
      11'd952: state_d_o = 11'd956;  // S262 sw s6,36(sp) (PC=0x498)
      11'd956: state_d_o = 11'd960;  // S263 sw s7,32(sp) (PC=0x49c)
      11'd960: state_d_o = 11'd964;  // S264 sw s8,28(sp) (PC=0x4a0)
      11'd964: state_d_o = 11'd968;  // S265 sw s9,24(sp) (PC=0x4a4)
      11'd968: state_d_o = 11'd972;  // S266 sw s10,20(sp) (PC=0x4a8)
      11'd972: state_d_o = 11'd168;  // S267 sw s11,16(sp) (PC=0x4ac)
      11'd168: state_d_o = 11'd484;  // S268 mv a1,a4 (PC=0x4b0)
      11'd484: state_d_o = 11'd899;  // S269 add s1,s0,s3 (PC=0x4b4)
      11'd899: state_d_o = 11'd1042;  // S270 sw a5,0(sp) (PC=0x4b8)
      11'd1042: state_d_o = 11'd1044;  // S271 lbu t2,1(a0) (PC=0x4bc)
      11'd1044: state_d_o = 11'd1046;  // S272 lbu t0,5(a0) (PC=0x4c0)
      11'd1046: state_d_o = 11'd1048;  // S273 lbu t6,9(a0) (PC=0x4c4)
      11'd1048: state_d_o = 11'd1050;  // S274 lbu t5,13(a0) (PC=0x4c8)
      11'd1050: state_d_o = 11'd1052;  // S275 lbu s7,0(a0) (PC=0x4cc)
      11'd1052: state_d_o = 11'd1054;  // S276 lbu t4,2(a0) (PC=0x4d0)
      11'd1054: state_d_o = 11'd1056;  // S277 lbu s6,4(a0) (PC=0x4d4)
      11'd1056: state_d_o = 11'd1058;  // S278 lbu t3,6(a0) (PC=0x4d8)
      11'd1058: state_d_o = 11'd1060;  // S279 lbu s5,8(a0) (PC=0x4dc)
      11'd1060: state_d_o = 11'd1062;  // S280 lbu t1,10(a0) (PC=0x4e0)
      11'd1062: state_d_o = 11'd1064;  // S281 lbu s4,12(a0) (PC=0x4e4)
      11'd1064: state_d_o = 11'd1066;  // S282 lbu a6,14(a0) (PC=0x4e8)
      11'd1066: state_d_o = 11'd1068;  // S283 lbu a5,3(a0) (PC=0x4ec)
      11'd1068: state_d_o = 11'd1070;  // S284 lbu a4,7(a0) (PC=0x4f0)
      11'd1070: state_d_o = 11'd1072;  // S285 lbu a7,11(a0) (PC=0x4f4)
      11'd1072: state_d_o = 11'd644;  // S286 lbu a3,15(a0) (PC=0x4f8)
      11'd644: state_d_o = 11'd624;  // S287 slli t2,t2,0x8 (PC=0x4fc)
      11'd624: state_d_o = 11'd584;  // S288 slli t0,t0,0x8 (PC=0x500)
      11'd584: state_d_o = 11'd592;  // S289 slli t6,t6,0x8 (PC=0x504)
      11'd592: state_d_o = 11'd346;  // S290 slli t5,t5,0x8 (PC=0x508)
      11'd346: state_d_o = 11'd348;  // S291 lw s8,0(s0) (PC=0x50c)
      11'd348: state_d_o = 11'd350;  // S292 lw s9,4(s0) (PC=0x510)
      11'd350: state_d_o = 11'd352;  // S293 lw s10,8(s0) (PC=0x514)
      11'd352: state_d_o = 11'd1224;  // S294 lw s11,12(s0) (PC=0x518)
      11'd1224: state_d_o = 11'd568;  // S295 or t2,t2,s7 (PC=0x51c)
      11'd568: state_d_o = 11'd1226;  // S296 slli t4,t4,0x10 (PC=0x520)
      11'd1226: state_d_o = 11'd600;  // S297 or t0,t0,s6 (PC=0x524)
      11'd600: state_d_o = 11'd1228;  // S298 slli t3,t3,0x10 (PC=0x528)
      11'd1228: state_d_o = 11'd608;  // S299 or t6,t6,s5 (PC=0x52c)
      11'd608: state_d_o = 11'd1230;  // S300 slli t1,t1,0x10 (PC=0x530)
      11'd1230: state_d_o = 11'd628;  // S301 or t5,t5,s4 (PC=0x534)
      11'd628: state_d_o = 11'd1232;  // S302 slli a6,a6,0x10 (PC=0x538)
      11'd1232: state_d_o = 11'd1234;  // S303 or a6,a6,t5 (PC=0x53c)
      11'd1234: state_d_o = 11'd562;  // S304 or t4,t4,t2 (PC=0x540)
      11'd562: state_d_o = 11'd1236;  // S305 slli a5,a5,0x18 (PC=0x544)
      11'd1236: state_d_o = 11'd547;  // S306 or t3,t3,t0 (PC=0x548)
      11'd547: state_d_o = 11'd1238;  // S307 slli a4,a4,0x18 (PC=0x54c)
      11'd1238: state_d_o = 11'd576;  // S308 or t1,t1,t6 (PC=0x550)
      11'd576: state_d_o = 11'd617;  // S309 slli a7,a7,0x18 (PC=0x554)
      11'd617: state_d_o = 11'd1240;  // S310 slli a3,a3,0x18 (PC=0x558)
      11'd1240: state_d_o = 11'd1268;  // S311 or a3,a3,a6 (PC=0x55c)
      11'd1268: state_d_o = 11'd1269;  // S312 or a5,a5,t4 (PC=0x560)
      11'd1269: state_d_o = 11'd1242;  // S313 or a4,a4,t3 (PC=0x564)
      11'd1242: state_d_o = 11'd840;  // S314 or a7,a7,t1 (PC=0x568)
      11'd840: state_d_o = 11'd1309;  // S315 li a6,1 (PC=0x56c)
      11'd1309: state_d_o = 11'd1310;  // S316 xor a5,a5,s8 (PC=0x570)
      11'd1310: state_d_o = 11'd1282;  // S317 xor a4,a4,s9 (PC=0x574)
      11'd1282: state_d_o = 11'd1284;  // S318 xor a7,a7,s10 (PC=0x578)
      11'd1284: state_d_o = 11'd1574;  // S319 xor a3,a3,s11 (PC=0x57c)
      11'd1574: state_d_o = branch_decision_i ? 11'd844 : 11'd212;  // S320
      11'd212: state_d_o = 11'd213;  // S321 addi s4,s0,16 (PC=0x584)
      11'd213: state_d_o = 11'd214;  // S322 mv t1,a5 (PC=0x588)
      11'd214: state_d_o = 11'd706;  // S323 mv t5,a7 (PC=0x58c)
      11'd706: state_d_o = 11'd1177;  // S324 srli s7,a3,0x18 (PC=0x590)
      11'd1177: state_d_o = 11'd1178;  // S325 zext.b s6,a4 (PC=0x594)
      11'd1178: state_d_o = 11'd739;  // S326 zext.b t2,t5 (PC=0x598)
      11'd739: state_d_o = 11'd1156;  // S327 srli t0,a4,0x18 (PC=0x59c)
      11'd1156: state_d_o = 11'd1158;  // S328 zext.b s8,t1 (PC=0x5a0)
      11'd1158: state_d_o = 11'd740;  // S329 zext.b s9,a3 (PC=0x5a4)
      11'd740: state_d_o = 11'd741;  // S330 srli s5,t1,0x18 (PC=0x5a8)
      11'd741: state_d_o = 11'd120;  // S331 srli t6,t5,0x18 (PC=0x5ac)
      11'd120: state_d_o = 11'd170;  // S332 addi s7,s7,832 (PC=0x5b0)
      11'd170: state_d_o = 11'd172;  // S333 addi s6,s6,64 (PC=0x5b4)
      11'd172: state_d_o = 11'd106;  // S334 addi t2,t2,64 (PC=0x5b8)
      11'd106: state_d_o = 11'd124;  // S335 addi t0,t0,832 (PC=0x5bc)
      11'd124: state_d_o = 11'd174;  // S336 addi s8,s8,64 (PC=0x5c0)
      11'd174: state_d_o = 11'd176;  // S337 addi s5,s5,832 (PC=0x5c4)
      11'd176: state_d_o = 11'd178;  // S338 addi s9,s9,64 (PC=0x5c8)
      11'd178: state_d_o = 11'd632;  // S339 addi t6,t6,832 (PC=0x5cc)
      11'd632: state_d_o = 11'd636;  // S340 slli s7,s7,0x2 (PC=0x5d0)
      11'd636: state_d_o = 11'd645;  // S341 slli s6,s6,0x2 (PC=0x5d4)
      11'd645: state_d_o = 11'd625;  // S342 slli t2,t2,0x2 (PC=0x5d8)
      11'd625: state_d_o = 11'd708;  // S343 slli t0,t0,0x2 (PC=0x5dc)
      11'd708: state_d_o = 11'd215;  // S344 srli a6,a3,0x10 (PC=0x5e0)
      11'd215: state_d_o = 11'd742;  // S345 mv a7,a4 (PC=0x5e4)
      11'd742: state_d_o = 11'd681;  // S346 srli t4,t5,0x8 (PC=0x5e8)
      11'd681: state_d_o = 11'd743;  // S347 srli a4,a4,0x8 (PC=0x5ec)
      11'd743: state_d_o = 11'd652;  // S348 srli t5,t5,0x10 (PC=0x5f0)
      11'd652: state_d_o = 11'd416;  // S349 slli s9,s9,0x2 (PC=0x5f4)
      11'd416: state_d_o = 11'd420;  // S350 add s7,a2,s7 (PC=0x5f8)
      11'd420: state_d_o = 11'd472;  // S351 add s6,a2,s6 (PC=0x5fc)
      11'd472: state_d_o = 11'd424;  // S352 add t2,a2,t2 (PC=0x600)
      11'd424: state_d_o = 11'd654;  // S353 add t0,a2,t0 (PC=0x604)
      11'd654: state_d_o = 11'd640;  // S354 slli s8,s8,0x2 (PC=0x608)
      11'd640: state_d_o = 11'd585;  // S355 slli s5,s5,0x2 (PC=0x60c)
      11'd585: state_d_o = 11'd354;  // S356 slli t6,t6,0x2 (PC=0x610)
      11'd354: state_d_o = 11'd180;  // S357 lw s10,0(s7) (PC=0x614)
      11'd180: state_d_o = 11'd400;  // S358 mv a5,t1 (PC=0x618)
      11'd400: state_d_o = 11'd744;  // S359 lw s7,0(t2) (PC=0x61c)
      11'd744: state_d_o = 11'd486;  // S360 srli t3,a3,0x8 (PC=0x620)
      11'd486: state_d_o = 11'd1179;  // S361 add s8,a2,s8 (PC=0x624)
      11'd1179: state_d_o = 11'd428;  // S362 zext.b a3,a4 (PC=0x628)
      11'd428: state_d_o = 11'd1180;  // S363 add s5,a2,s5 (PC=0x62c)
      11'd1180: state_d_o = 11'd432;  // S364 zext.b a4,t5 (PC=0x630)
      11'd432: state_d_o = 11'd1160;  // S365 add t6,a2,t6 (PC=0x634)
      11'd1160: state_d_o = 11'd745;  // S366 zext.b t5,a6 (PC=0x638)
      11'd745: state_d_o = 11'd488;  // S367 srli t1,t1,0x8 (PC=0x63c)
      11'd488: state_d_o = 11'd356;  // S368 add a6,a2,s9 (PC=0x640)
      11'd356: state_d_o = 11'd358;  // S369 lw s9,0(s6) (PC=0x644)
      11'd358: state_d_o = 11'd360;  // S370 lw s6,0(t0) (PC=0x648)
      11'd360: state_d_o = 11'd1140;  // S371 lw s11,0(s8) (PC=0x64c)
      11'd1140: state_d_o = 11'd362;  // S372 zext.b t4,t4 (PC=0x650)
      11'd362: state_d_o = 11'd1144;  // S373 lw s8,0(s5) (PC=0x654)
      11'd1144: state_d_o = 11'd364;  // S374 zext.b t3,t3 (PC=0x658)
      11'd364: state_d_o = 11'd673;  // S375 lw s5,0(t6) (PC=0x65c)
      11'd673: state_d_o = 11'd366;  // S376 srli a5,a5,0x10 (PC=0x660)
      11'd366: state_d_o = 11'd1129;  // S377 lw t6,8(s4) (PC=0x664)
      11'd1129: state_d_o = 11'd692;  // S378 zext.b t1,t1 (PC=0x668)
      11'd692: state_d_o = 11'd97;  // S379 srli a7,a7,0x10 (PC=0x66c)
      11'd97: state_d_o = 11'd128;  // S380 addi a3,a3,320 (PC=0x670)
      11'd128: state_d_o = 11'd74;  // S381 addi t4,t4,320 (PC=0x674)
      11'd74: state_d_o = 11'd1121;  // S382 addi t3,t3,320 (PC=0x678)
      11'd1121: state_d_o = 11'd81;  // S383 zext.b a5,a5 (PC=0x67c)
      11'd81: state_d_o = 11'd1162;  // S384 addi t1,t1,320 (PC=0x680)
      11'd1162: state_d_o = 11'd368;  // S385 zext.b a7,a7 (PC=0x684)
      11'd368: state_d_o = 11'd618;  // S386 lw a6,0(a6) (PC=0x688)
      11'd618: state_d_o = 11'd109;  // S387 slli a3,a3,0x2 (PC=0x68c)
      11'd109: state_d_o = 11'd569;  // S388 addi a4,a4,576 (PC=0x690)
      11'd569: state_d_o = 11'd182;  // S389 slli t4,t4,0x2 (PC=0x694)
      11'd182: state_d_o = 11'd601;  // S390 addi t5,t5,576 (PC=0x698)
      11'd601: state_d_o = 11'd37;  // S391 slli t3,t3,0x2 (PC=0x69c)
      11'd37: state_d_o = 11'd609;  // S392 addi a5,a5,576 (PC=0x6a0)
      11'd609: state_d_o = 11'd132;  // S393 slli t1,t1,0x2 (PC=0x6a4)
      11'd132: state_d_o = 11'd1286;  // S394 addi a7,a7,576 (PC=0x6a8)
      11'd1286: state_d_o = 11'd401;  // S395 xor s6,s7,s6 (PC=0x6ac)
      11'd401: state_d_o = 11'd402;  // S396 lw t2,0(s4) (PC=0x6b0)
      11'd402: state_d_o = 11'd1288;  // S397 lw t0,4(s4) (PC=0x6b4)
      11'd1288: state_d_o = 11'd436;  // S398 xor s6,s6,t6 (PC=0x6b8)
      11'd436: state_d_o = 11'd367;  // S399 add a3,a2,a3 (PC=0x6bc)
      11'd367: state_d_o = 11'd548;  // S400 lw t6,12(s4) (PC=0x6c0)
      11'd548: state_d_o = 11'd440;  // S401 slli a4,a4,0x2 (PC=0x6c4)
      11'd440: state_d_o = 11'd593;  // S402 add t4,a2,t4 (PC=0x6c8)
      11'd593: state_d_o = 11'd444;  // S403 slli t5,t5,0x2 (PC=0x6cc)
      11'd444: state_d_o = 11'd563;  // S404 add t3,a2,t3 (PC=0x6d0)
      11'd563: state_d_o = 11'd448;  // S405 slli a5,a5,0x2 (PC=0x6d4)
      11'd448: state_d_o = 11'd577;  // S406 add t1,a2,t1 (PC=0x6d8)
      11'd577: state_d_o = 11'd370;  // S407 slli a7,a7,0x2 (PC=0x6dc)
      11'd370: state_d_o = 11'd372;  // S408 lw a3,0(a3) (PC=0x6e0)
      11'd372: state_d_o = 11'd374;  // S409 lw t1,0(t1) (PC=0x6e4)
      11'd374: state_d_o = 11'd376;  // S410 lw t4,0(t4) (PC=0x6e8)
      11'd376: state_d_o = 11'd452;  // S411 lw t3,0(t3) (PC=0x6ec)
      11'd452: state_d_o = 11'd456;  // S412 add a4,a2,a4 (PC=0x6f0)
      11'd456: state_d_o = 11'd460;  // S413 add t5,a2,t5 (PC=0x6f4)
      11'd460: state_d_o = 11'd464;  // S414 add a5,a2,a5 (PC=0x6f8)
      11'd464: state_d_o = 11'd378;  // S415 add a7,a2,a7 (PC=0x6fc)
      11'd378: state_d_o = 11'd380;  // S416 lw a4,0(a4) (PC=0x700)
      11'd380: state_d_o = 11'd309;  // S417 lw t5,0(t5) (PC=0x704)
      11'd309: state_d_o = 11'd382;  // S418 lw a5,0(a5) (PC=0x708)
      11'd382: state_d_o = 11'd1290;  // S419 lw a7,0(a7) (PC=0x70c)
      11'd1290: state_d_o = 11'd1292;  // S420 xor s10,s11,s10 (PC=0x710)
      11'd1292: state_d_o = 11'd1294;  // S421 xor s8,s9,s8 (PC=0x714)
      11'd1294: state_d_o = 11'd1296;  // S422 xor a6,a6,s5 (PC=0x718)
      11'd1296: state_d_o = 11'd1311;  // S423 xor a6,a6,t6 (PC=0x71c)
      11'd1311: state_d_o = 11'd1298;  // S424 xor t2,s10,t2 (PC=0x720)
      11'd1298: state_d_o = 11'd1312;  // S425 xor t0,s8,t0 (PC=0x724)
      11'd1312: state_d_o = 11'd1313;  // S426 xor t6,t2,a3 (PC=0x728)
      11'd1313: state_d_o = 11'd1314;  // S427 xor t4,t0,t4 (PC=0x72c)
      11'd1314: state_d_o = 11'd1315;  // S428 xor a3,a6,t1 (PC=0x730)
      11'd1315: state_d_o = 11'd136;  // S429 xor s6,s6,t3 (PC=0x734)
      11'd136: state_d_o = 11'd1316;  // S430 addi s4,s4,16 (PC=0x738)
      11'd1316: state_d_o = 11'd1317;  // S431 xor t1,t6,a4 (PC=0x73c)
      11'd1317: state_d_o = 11'd1318;  // S432 xor a3,a3,a7 (PC=0x740)
      11'd1318: state_d_o = 11'd1319;  // S433 xor a4,t4,t5 (PC=0x744)
      11'd1319: state_d_o = 11'd1543;  // S434 xor t5,s6,a5 (PC=0x748)
      11'd1543: state_d_o = branch_decision_i ? 11'd706 : 11'd280;  // S435
      11'd280: state_d_o = 11'd288;  // S436 lw s8,12(sp) (PC=0x750)
      11'd288: state_d_o = 11'd296;  // S437 lw s9,8(sp) (PC=0x754)
      11'd296: state_d_o = 11'd181;  // S438 lw s10,4(sp) (PC=0x758)
      11'd181: state_d_o = 11'd216;  // S439 mv a5,t1 (PC=0x75c)
      11'd216: state_d_o = 11'd184;  // S440 mv a7,t5 (PC=0x760)
      11'd184: state_d_o = 11'd707;  // S441 mv s11,s3 (PC=0x764)
      11'd707: state_d_o = 11'd746;  // S442 srli s7,a3,0x18 (PC=0x768)
      11'd746: state_d_o = 11'd747;  // S443 srli t6,a4,0x8 (PC=0x76c)
      11'd747: state_d_o = 11'd710;  // S444 srli s6,a5,0x18 (PC=0x770)
      11'd710: state_d_o = 11'd748;  // S445 srli t5,a7,0x8 (PC=0x774)
      11'd748: state_d_o = 11'd712;  // S446 srli s5,a4,0x18 (PC=0x778)
      11'd712: state_d_o = 11'd1181;  // S447 srli t4,a3,0x8 (PC=0x77c)
      11'd1181: state_d_o = 11'd714;  // S448 zext.b s4,a5 (PC=0x780)
      11'd714: state_d_o = 11'd1182;  // S449 srli t3,a7,0x10 (PC=0x784)
      11'd1182: state_d_o = 11'd716;  // S450 zext.b t2,a4 (PC=0x788)
      11'd716: state_d_o = 11'd1164;  // S451 srli t1,a3,0x10 (PC=0x78c)
      11'd1164: state_d_o = 11'd696;  // S452 zext.b t0,a7 (PC=0x790)
      11'd696: state_d_o = 11'd417;  // S453 srli a6,a5,0x10 (PC=0x794)
      11'd417: state_d_o = 11'd1166;  // S454 add s7,a2,s7 (PC=0x798)
      11'd1166: state_d_o = 11'd421;  // S455 zext.b t6,t6 (PC=0x79c)
      11'd421: state_d_o = 11'd1168;  // S456 add s6,a2,s6 (PC=0x7a0)
      11'd1168: state_d_o = 11'd429;  // S457 zext.b t5,t5 (PC=0x7a4)
      11'd429: state_d_o = 11'd1141;  // S458 add s5,a2,s5 (PC=0x7a8)
      11'd1141: state_d_o = 11'd693;  // S459 zext.b t4,t4 (PC=0x7ac)
      11'd693: state_d_o = 11'd674;  // S460 srli a7,a7,0x18 (PC=0x7b0)
      11'd674: state_d_o = 11'd1074;  // S461 srli a5,a5,0x8 (PC=0x7b4)
      11'd1074: state_d_o = 11'd1076;  // S462 lbu s7,0(s7) (PC=0x7b8)
      11'd1076: state_d_o = 11'd1078;  // S463 lbu s6,0(s6) (PC=0x7bc)
      11'd1078: state_d_o = 11'd476;  // S464 lbu s5,0(s5) (PC=0x7c0)
      11'd476: state_d_o = 11'd433;  // S465 add s4,a2,s4 (PC=0x7c4)
      11'd433: state_d_o = 11'd1145;  // S466 add t6,a2,t6 (PC=0x7c8)
      11'd1145: state_d_o = 11'd473;  // S467 zext.b t3,t3 (PC=0x7cc)
      11'd473: state_d_o = 11'd457;  // S468 add t2,a2,t2 (PC=0x7d0)
      11'd457: state_d_o = 11'd1130;  // S469 add t5,a2,t5 (PC=0x7d4)
      11'd1130: state_d_o = 11'd425;  // S470 zext.b t1,t1 (PC=0x7d8)
      11'd425: state_d_o = 11'd441;  // S471 add t0,a2,t0 (PC=0x7dc)
      11'd441: state_d_o = 11'd1170;  // S472 add t4,a2,t4 (PC=0x7e0)
      11'd1170: state_d_o = 11'd465;  // S473 zext.b a6,a6 (PC=0x7e4)
      11'd465: state_d_o = 11'd1137;  // S474 add a7,a2,a7 (PC=0x7e8)
      11'd1137: state_d_o = 11'd1122;  // S475 zext.b a3,a3 (PC=0x7ec)
      11'd1122: state_d_o = 11'd682;  // S476 zext.b a5,a5 (PC=0x7f0)
      11'd682: state_d_o = 11'd1080;  // S477 srli a4,a4,0x10 (PC=0x7f4)
      11'd1080: state_d_o = 11'd1082;  // S478 lbu s4,0(s4) (PC=0x7f8)
      11'd1082: state_d_o = 11'd1033;  // S479 lbu t2,0(t2) (PC=0x7fc)
      11'd1033: state_d_o = 11'd1084;  // S480 lbu t0,0(t0) (PC=0x800)
      11'd1084: state_d_o = 11'd1086;  // S481 lbu t6,0(t6) (PC=0x804)
      11'd1086: state_d_o = 11'd1088;  // S482 lbu t5,0(t5) (PC=0x808)
      11'd1088: state_d_o = 11'd1090;  // S483 lbu t4,0(t4) (PC=0x80c)
      11'd1090: state_d_o = 11'd445;  // S484 lbu a7,0(a7) (PC=0x810)
      11'd445: state_d_o = 11'd449;  // S485 add t3,a2,t3 (PC=0x814)
      11'd449: state_d_o = 11'd490;  // S486 add t1,a2,t1 (PC=0x818)
      11'd490: state_d_o = 11'd437;  // S487 add a6,a2,a6 (PC=0x81c)
      11'd437: state_d_o = 11'd461;  // S488 add a3,a2,a3 (PC=0x820)
      11'd461: state_d_o = 11'd1153;  // S489 add a5,a2,a5 (PC=0x824)
      11'd1153: state_d_o = 11'd1026;  // S490 zext.b a4,a4 (PC=0x828)
      11'd1026: state_d_o = 11'd1092;  // S491 lbu a3,0(a3) (PC=0x82c)
      11'd1092: state_d_o = 11'd1037;  // S492 lbu t3,0(t3) (PC=0x830)
      11'd1037: state_d_o = 11'd1094;  // S493 lbu t1,0(t1) (PC=0x834)
      11'd1094: state_d_o = 11'd1029;  // S494 lbu a6,0(a6) (PC=0x838)
      11'd1029: state_d_o = 11'd453;  // S495 lbu a5,0(a5) (PC=0x83c)
      11'd453: state_d_o = 11'd1096;  // S496 add a4,a2,a4 (PC=0x840)
      11'd1096: state_d_o = 11'd633;  // S497 lbu a4,0(a4) (PC=0x844)
      11'd633: state_d_o = 11'd492;  // S498 slli s7,s7,0x18 (PC=0x848)
      11'd492: state_d_o = 11'd637;  // S499 add s11,s0,s11 (PC=0x84c)
      11'd637: state_d_o = 11'd494;  // S500 slli s6,s6,0x18 (PC=0x850)
      11'd494: state_d_o = 11'd641;  // S501 add s10,s0,s10 (PC=0x854)
      11'd641: state_d_o = 11'd496;  // S502 slli s5,s5,0x18 (PC=0x858)
      11'd496: state_d_o = 11'd384;  // S503 add s9,s0,s9 (PC=0x85c)
      11'd384: state_d_o = 11'd386;  // S504 lw s11,0(s11) (PC=0x860)
      11'd386: state_d_o = 11'd388;  // S505 lw s10,0(s10) (PC=0x864)
      11'd388: state_d_o = 11'd1244;  // S506 lw s9,0(s9) (PC=0x868)
      11'd1244: state_d_o = 11'd1246;  // S507 or s7,s7,s4 (PC=0x86c)
      11'd1246: state_d_o = 11'd1248;  // S508 or s6,s6,t2 (PC=0x870)
      11'd1248: state_d_o = 11'd586;  // S509 or s5,s5,t0 (PC=0x874)
      11'd586: state_d_o = 11'd594;  // S510 slli t6,t6,0x8 (PC=0x878)
      11'd594: state_d_o = 11'd570;  // S511 slli t5,t5,0x8 (PC=0x87c)
      11'd570: state_d_o = 11'd578;  // S512 slli t4,t4,0x8 (PC=0x880)
      11'd578: state_d_o = 11'd498;  // S513 slli a7,a7,0x18 (PC=0x884)
      11'd498: state_d_o = 11'd390;  // S514 add s8,s0,s8 (PC=0x888)
      11'd390: state_d_o = 11'd1270;  // S515 lw t0,0(s8) (PC=0x88c)
      11'd1270: state_d_o = 11'd602;  // S516 or a7,a7,a3 (PC=0x890)
      11'd602: state_d_o = 11'd610;  // S517 slli t3,t3,0x10 (PC=0x894)
      11'd610: state_d_o = 11'd629;  // S518 slli t1,t1,0x10 (PC=0x898)
      11'd629: state_d_o = 11'd1250;  // S519 slli a6,a6,0x10 (PC=0x89c)
      11'd1250: state_d_o = 11'd1252;  // S520 or t6,s7,t6 (PC=0x8a0)
      11'd1252: state_d_o = 11'd1254;  // S521 or t5,s6,t5 (PC=0x8a4)
      11'd1254: state_d_o = 11'd564;  // S522 or t4,s5,t4 (PC=0x8a8)
      11'd564: state_d_o = 11'd1256;  // S523 slli a5,a5,0x8 (PC=0x8ac)
      11'd1256: state_d_o = 11'd1258;  // S524 or t6,t6,t3 (PC=0x8b0)
      11'd1258: state_d_o = 11'd1260;  // S525 or t5,t5,t1 (PC=0x8b4)
      11'd1260: state_d_o = 11'd1271;  // S526 or t4,t4,a6 (PC=0x8b8)
      11'd1271: state_d_o = 11'd549;  // S527 or a5,a7,a5 (PC=0x8bc)
      11'd549: state_d_o = 11'd1300;  // S528 slli a4,a4,0x10 (PC=0x8c0)
      11'd1300: state_d_o = 11'd1302;  // S529 xor t6,t6,s11 (PC=0x8c4)
      11'd1302: state_d_o = 11'd1304;  // S530 xor t5,t5,s10 (PC=0x8c8)
      11'd1304: state_d_o = 11'd1221;  // S531 xor t4,t4,s9 (PC=0x8cc)
      11'd1221: state_d_o = 11'd1306;  // S532 or a5,a5,a4 (PC=0x8d0)
      11'd1306: state_d_o = 11'd718;  // S533 xor a5,a5,t0 (PC=0x8d4)
      11'd718: state_d_o = 11'd720;  // S534 srli a6,t4,0x18 (PC=0x8d8)
      11'd720: state_d_o = 11'd722;  // S535 srli a3,t4,0x10 (PC=0x8dc)
      11'd722: state_d_o = 11'd724;  // S536 srli a4,t4,0x8 (PC=0x8e0)
      11'd724: state_d_o = 11'd726;  // S537 srli s4,t6,0x18 (PC=0x8e4)
      11'd726: state_d_o = 11'd728;  // S538 srli t2,t6,0x10 (PC=0x8e8)
      11'd728: state_d_o = 11'd730;  // S539 srli t0,t6,0x8 (PC=0x8ec)
      11'd730: state_d_o = 11'd732;  // S540 srli t3,t5,0x18 (PC=0x8f0)
      11'd732: state_d_o = 11'd734;  // S541 srli t1,t5,0x10 (PC=0x8f4)
      11'd734: state_d_o = 11'd1344;  // S542 srli a7,t5,0x8 (PC=0x8f8)
      11'd1344: state_d_o = 11'd1348;  // S543 sb a6,11(a1) (PC=0x8fc)
      11'd1348: state_d_o = 11'd1352;  // S544 sb a3,10(a1) (PC=0x900)
      11'd1352: state_d_o = 11'd1356;  // S545 sb a4,9(a1) (PC=0x904)
      11'd1356: state_d_o = 11'd1358;  // S546 sb s4,3(a1) (PC=0x908)
      11'd1358: state_d_o = 11'd1360;  // S547 sb t2,2(a1) (PC=0x90c)
      11'd1360: state_d_o = 11'd1362;  // S548 sb t0,1(a1) (PC=0x910)
      11'd1362: state_d_o = 11'd1364;  // S549 sb t6,0(a1) (PC=0x914)
      11'd1364: state_d_o = 11'd1366;  // S550 sb t3,7(a1) (PC=0x918)
      11'd1366: state_d_o = 11'd1368;  // S551 sb t1,6(a1) (PC=0x91c)
      11'd1368: state_d_o = 11'd1370;  // S552 sb a7,5(a1) (PC=0x920)
      11'd1370: state_d_o = 11'd1372;  // S553 sb t5,4(a1) (PC=0x924)
      11'd1372: state_d_o = 11'd697;  // S554 sb t4,8(a1) (PC=0x928)
      11'd697: state_d_o = 11'd1345;  // S555 srli a6,a5,0x18 (PC=0x92c)
      11'd1345: state_d_o = 11'd689;  // S556 sb a6,15(a1) (PC=0x930)
      11'd689: state_d_o = 11'd736;  // S557 srli a3,a5,0x10 (PC=0x934)
      11'd736: state_d_o = 11'd1374;  // S558 srli a4,a5,0x8 (PC=0x938)
      11'd1374: state_d_o = 11'd312;  // S559 sb a5,12(a1) (PC=0x93c)
      11'd312: state_d_o = 11'd1349;  // S560 lw a5,0(sp) (PC=0x940)
      11'd1349: state_d_o = 11'd1353;  // S561 sb a3,14(a1) (PC=0x944)
      11'd1353: state_d_o = 11'd140;  // S562 sb a4,13(a1) (PC=0x948)
      11'd140: state_d_o = 11'd90;  // S563 addi a1,a1,16 (PC=0x94c)
      11'd90: state_d_o = 11'd1536;  // S564 addi a0,a0,16 (PC=0x950)
      11'd1536: state_d_o = branch_decision_i ? 11'd1042 : 11'd259;  // S565
      11'd259: state_d_o = 11'd274;  // S566 lw s0,60(sp) (PC=0x958)
      11'd274: state_d_o = 11'd304;  // S567 lw s1,56(sp) (PC=0x95c)
      11'd304: state_d_o = 11'd316;  // S568 lw s2,52(sp) (PC=0x960)
      11'd316: state_d_o = 11'd320;  // S569 lw s3,48(sp) (PC=0x964)
      11'd320: state_d_o = 11'd324;  // S570 lw s4,44(sp) (PC=0x968)
      11'd324: state_d_o = 11'd328;  // S571 lw s5,40(sp) (PC=0x96c)
      11'd328: state_d_o = 11'd332;  // S572 lw s6,36(sp) (PC=0x970)
      11'd332: state_d_o = 11'd281;  // S573 lw s7,32(sp) (PC=0x974)
      11'd281: state_d_o = 11'd289;  // S574 lw s8,28(sp) (PC=0x978)
      11'd289: state_d_o = 11'd297;  // S575 lw s9,24(sp) (PC=0x97c)
      11'd297: state_d_o = 11'd336;  // S576 lw s10,20(sp) (PC=0x980)
      11'd336: state_d_o = 11'd9;  // S577 lw s11,16(sp) (PC=0x984)
      11'd9: state_d_o = 11'd1456;  // S578 addi sp,sp,64 (PC=0x988)
      11'd1456: state_d_o = rf_rdata_a_i[10:0];  // S579 ret
      11'd844: state_d_o = 11'd848;  // S580 li s8,28 (PC=0x990)
      11'd848: state_d_o = 11'd852;  // S581 li s9,24 (PC=0x994)
      11'd852: state_d_o = 11'd856;  // S582 li s10,20 (PC=0x998)
      11'd856: state_d_o = 11'd1414;  // S583 li s11,16 (PC=0x99c)
      11'd1414: state_d_o = 11'd707;  // S584 j 768 <_nettle_aes_encrypt.part.0+0x31c> (PC=0x9a0)
      11'd1457: state_d_o = rf_rdata_a_i[10:0];  // S585 ret
      11'd1513: state_d_o = branch_decision_i ? 11'd1459 : 11'd10;  // S586
      11'd10: state_d_o = 11'd937;  // S587 addi sp,sp,-64 (PC=0x9ac)
      11'd937: state_d_o = 11'd165;  // S588 sw s2,52(sp) (PC=0x9b0)
      11'd165: state_d_o = 11'd941;  // S589 mv s2,a0 (PC=0x9b4)
      11'd941: state_d_o = 11'd651;  // S590 sw s3,48(sp) (PC=0x9b8)
      11'd651: state_d_o = 11'd117;  // S591 slli s3,s2,0x4 (PC=0x9bc)
      11'd117: state_d_o = 11'd59;  // S592 mv a0,a5 (PC=0x9c0)
      11'd59: state_d_o = 11'd900;  // S593 addi a5,s3,4 (PC=0x9c4)
      11'd900: state_d_o = 11'd60;  // S594 sw a5,4(sp) (PC=0x9c8)
      11'd60: state_d_o = 11'd901;  // S595 addi a5,s3,8 (PC=0x9cc)
      11'd901: state_d_o = 11'd61;  // S596 sw a5,8(sp) (PC=0x9d0)
      11'd61: state_d_o = 11'd915;  // S597 addi a5,s3,12 (PC=0x9d4)
      11'd915: state_d_o = 11'd902;  // S598 sw s0,60(sp) (PC=0x9d8)
      11'd902: state_d_o = 11'd167;  // S599 sw a5,12(sp) (PC=0x9dc)
      11'd167: state_d_o = 11'd483;  // S600 mv s0,a1 (PC=0x9e0)
      11'd483: state_d_o = 11'd930;  // S601 add a5,a4,a3 (PC=0x9e4)
      11'd930: state_d_o = 11'd945;  // S602 sw s1,56(sp) (PC=0x9e8)
      11'd945: state_d_o = 11'd949;  // S603 sw s4,44(sp) (PC=0x9ec)
      11'd949: state_d_o = 11'd953;  // S604 sw s5,40(sp) (PC=0x9f0)
      11'd953: state_d_o = 11'd957;  // S605 sw s6,36(sp) (PC=0x9f4)
      11'd957: state_d_o = 11'd961;  // S606 sw s7,32(sp) (PC=0x9f8)
      11'd961: state_d_o = 11'd965;  // S607 sw s8,28(sp) (PC=0x9fc)
      11'd965: state_d_o = 11'd969;  // S608 sw s9,24(sp) (PC=0xa00)
      11'd969: state_d_o = 11'd973;  // S609 sw s10,20(sp) (PC=0xa04)
      11'd973: state_d_o = 11'd169;  // S610 sw s11,16(sp) (PC=0xa08)
      11'd169: state_d_o = 11'd485;  // S611 mv a1,a4 (PC=0xa0c)
      11'd485: state_d_o = 11'd903;  // S612 add s1,s0,s3 (PC=0xa10)
      11'd903: state_d_o = 11'd1043;  // S613 sw a5,0(sp) (PC=0xa14)
      11'd1043: state_d_o = 11'd1045;  // S614 lbu t2,1(a0) (PC=0xa18)
      11'd1045: state_d_o = 11'd1047;  // S615 lbu t0,5(a0) (PC=0xa1c)
      11'd1047: state_d_o = 11'd1049;  // S616 lbu t6,9(a0) (PC=0xa20)
      11'd1049: state_d_o = 11'd1051;  // S617 lbu t5,13(a0) (PC=0xa24)
      11'd1051: state_d_o = 11'd1053;  // S618 lbu s7,0(a0) (PC=0xa28)
      11'd1053: state_d_o = 11'd1055;  // S619 lbu t4,2(a0) (PC=0xa2c)
      11'd1055: state_d_o = 11'd1057;  // S620 lbu s6,4(a0) (PC=0xa30)
      11'd1057: state_d_o = 11'd1059;  // S621 lbu t3,6(a0) (PC=0xa34)
      11'd1059: state_d_o = 11'd1061;  // S622 lbu s5,8(a0) (PC=0xa38)
      11'd1061: state_d_o = 11'd1063;  // S623 lbu t1,10(a0) (PC=0xa3c)
      11'd1063: state_d_o = 11'd1065;  // S624 lbu s4,12(a0) (PC=0xa40)
      11'd1065: state_d_o = 11'd1069;  // S625 lbu a6,14(a0) (PC=0xa44)
      11'd1069: state_d_o = 11'd1067;  // S626 lbu a4,3(a0) (PC=0xa48)
      11'd1067: state_d_o = 11'd1071;  // S627 lbu a5,7(a0) (PC=0xa4c)
      11'd1071: state_d_o = 11'd1073;  // S628 lbu a7,11(a0) (PC=0xa50)
      11'd1073: state_d_o = 11'd646;  // S629 lbu a3,15(a0) (PC=0xa54)
      11'd646: state_d_o = 11'd626;  // S630 slli t2,t2,0x8 (PC=0xa58)
      11'd626: state_d_o = 11'd587;  // S631 slli t0,t0,0x8 (PC=0xa5c)
      11'd587: state_d_o = 11'd595;  // S632 slli t6,t6,0x8 (PC=0xa60)
      11'd595: state_d_o = 11'd347;  // S633 slli t5,t5,0x8 (PC=0xa64)
      11'd347: state_d_o = 11'd349;  // S634 lw s8,0(s0) (PC=0xa68)
      11'd349: state_d_o = 11'd351;  // S635 lw s9,4(s0) (PC=0xa6c)
      11'd351: state_d_o = 11'd353;  // S636 lw s10,8(s0) (PC=0xa70)
      11'd353: state_d_o = 11'd1225;  // S637 lw s11,12(s0) (PC=0xa74)
      11'd1225: state_d_o = 11'd571;  // S638 or t2,t2,s7 (PC=0xa78)
      11'd571: state_d_o = 11'd1227;  // S639 slli t4,t4,0x10 (PC=0xa7c)
      11'd1227: state_d_o = 11'd603;  // S640 or t0,t0,s6 (PC=0xa80)
      11'd603: state_d_o = 11'd1229;  // S641 slli t3,t3,0x10 (PC=0xa84)
      11'd1229: state_d_o = 11'd611;  // S642 or t6,t6,s5 (PC=0xa88)
      11'd611: state_d_o = 11'd1231;  // S643 slli t1,t1,0x10 (PC=0xa8c)
      11'd1231: state_d_o = 11'd630;  // S644 or t5,t5,s4 (PC=0xa90)
      11'd630: state_d_o = 11'd1233;  // S645 slli a6,a6,0x10 (PC=0xa94)
      11'd1233: state_d_o = 11'd1235;  // S646 or a6,a6,t5 (PC=0xa98)
      11'd1235: state_d_o = 11'd550;  // S647 or t4,t4,t2 (PC=0xa9c)
      11'd550: state_d_o = 11'd1237;  // S648 slli a4,a4,0x18 (PC=0xaa0)
      11'd1237: state_d_o = 11'd565;  // S649 or t3,t3,t0 (PC=0xaa4)
      11'd565: state_d_o = 11'd1239;  // S650 slli a5,a5,0x18 (PC=0xaa8)
      11'd1239: state_d_o = 11'd579;  // S651 or t1,t1,t6 (PC=0xaac)
      11'd579: state_d_o = 11'd619;  // S652 slli a7,a7,0x18 (PC=0xab0)
      11'd619: state_d_o = 11'd1241;  // S653 slli a3,a3,0x18 (PC=0xab4)
      11'd1241: state_d_o = 11'd1272;  // S654 or a3,a3,a6 (PC=0xab8)
      11'd1272: state_d_o = 11'd1273;  // S655 or a4,a4,t4 (PC=0xabc)
      11'd1273: state_d_o = 11'd1243;  // S656 or a5,a5,t3 (PC=0xac0)
      11'd1243: state_d_o = 11'd841;  // S657 or a7,a7,t1 (PC=0xac4)
      11'd841: state_d_o = 11'd1320;  // S658 li a6,1 (PC=0xac8)
      11'd1320: state_d_o = 11'd1321;  // S659 xor a4,a4,s8 (PC=0xacc)
      11'd1321: state_d_o = 11'd1283;  // S660 xor a5,a5,s9 (PC=0xad0)
      11'd1283: state_d_o = 11'd1285;  // S661 xor a7,a7,s10 (PC=0xad4)
      11'd1285: state_d_o = 11'd1575;  // S662 xor a3,a3,s11 (PC=0xad8)
      11'd1575: state_d_o = branch_decision_i ? 11'd845 : 11'd217;  // S663
      11'd217: state_d_o = 11'd218;  // S664 addi t2,s0,16 (PC=0xae0)
      11'd218: state_d_o = 11'd219;  // S665 mv t1,a4 (PC=0xae4)
      11'd219: state_d_o = 11'd749;  // S666 mv t3,a5 (PC=0xae8)
      11'd749: state_d_o = 11'd1183;  // S667 srli s7,t3,0x18 (PC=0xaec)
      11'd1183: state_d_o = 11'd1184;  // S668 zext.b s6,t3 (PC=0xaf0)
      11'd1184: state_d_o = 11'd750;  // S669 zext.b s4,a7 (PC=0xaf4)
      11'd750: state_d_o = 11'd1157;  // S670 srli t0,a3,0x18 (PC=0xaf8)
      11'd1157: state_d_o = 11'd751;  // S671 zext.b s8,t1 (PC=0xafc)
      11'd751: state_d_o = 11'd1159;  // S672 srli s5,a7,0x18 (PC=0xb00)
      11'd1159: state_d_o = 11'd752;  // S673 zext.b s9,a3 (PC=0xb04)
      11'd752: state_d_o = 11'd121;  // S674 srli t6,t1,0x18 (PC=0xb08)
      11'd121: state_d_o = 11'd171;  // S675 addi s7,s7,832 (PC=0xb0c)
      11'd171: state_d_o = 11'd137;  // S676 addi s6,s6,64 (PC=0xb10)
      11'd137: state_d_o = 11'd107;  // S677 addi s4,s4,64 (PC=0xb14)
      11'd107: state_d_o = 11'd125;  // S678 addi t0,t0,832 (PC=0xb18)
      11'd125: state_d_o = 11'd175;  // S679 addi s8,s8,64 (PC=0xb1c)
      11'd175: state_d_o = 11'd177;  // S680 addi s5,s5,832 (PC=0xb20)
      11'd177: state_d_o = 11'd179;  // S681 addi s9,s9,64 (PC=0xb24)
      11'd179: state_d_o = 11'd634;  // S682 addi t6,t6,832 (PC=0xb28)
      11'd634: state_d_o = 11'd638;  // S683 slli s7,s7,0x2 (PC=0xb2c)
      11'd638: state_d_o = 11'd664;  // S684 slli s6,s6,0x2 (PC=0xb30)
      11'd664: state_d_o = 11'd627;  // S685 slli s4,s4,0x2 (PC=0xb34)
      11'd627: state_d_o = 11'd186;  // S686 slli t0,t0,0x2 (PC=0xb38)
      11'd186: state_d_o = 11'd711;  // S687 mv a5,t3 (PC=0xb3c)
      11'd711: state_d_o = 11'd709;  // S688 srli t5,a7,0x10 (PC=0xb40)
      11'd709: state_d_o = 11'd753;  // S689 srli a6,a3,0x10 (PC=0xb44)
      11'd753: state_d_o = 11'd653;  // S690 srli s10,a7,0x8 (PC=0xb48)
      11'd653: state_d_o = 11'd418;  // S691 slli s9,s9,0x2 (PC=0xb4c)
      11'd418: state_d_o = 11'd422;  // S692 add s7,a2,s7 (PC=0xb50)
      11'd422: state_d_o = 11'd477;  // S693 add s6,a2,s6 (PC=0xb54)
      11'd477: state_d_o = 11'd426;  // S694 add s4,a2,s4 (PC=0xb58)
      11'd426: state_d_o = 11'd655;  // S695 add t0,a2,t0 (PC=0xb5c)
      11'd655: state_d_o = 11'd642;  // S696 slli s8,s8,0x2 (PC=0xb60)
      11'd642: state_d_o = 11'd588;  // S697 slli s5,s5,0x2 (PC=0xb64)
      11'd588: state_d_o = 11'd188;  // S698 slli t6,t6,0x2 (PC=0xb68)
      11'd188: state_d_o = 11'd713;  // S699 mv a4,t1 (PC=0xb6c)
      11'd713: state_d_o = 11'd754;  // S700 srli t4,a3,0x8 (PC=0xb70)
      11'd754: state_d_o = 11'd1185;  // S701 srli t3,t1,0x8 (PC=0xb74)
      11'd1185: state_d_o = 11'd705;  // S702 zext.b a7,s10 (PC=0xb78)
      11'd705: state_d_o = 11'd355;  // S703 srli t1,a5,0x8 (PC=0xb7c)
      11'd355: state_d_o = 11'd487;  // S704 lw s10,0(s7) (PC=0xb80)
      11'd487: state_d_o = 11'd403;  // S705 add s8,a2,s8 (PC=0xb84)
      11'd403: state_d_o = 11'd1186;  // S706 lw s7,0(s4) (PC=0xb88)
      11'd1186: state_d_o = 11'd430;  // S707 zext.b a3,t5 (PC=0xb8c)
      11'd430: state_d_o = 11'd1161;  // S708 add s5,a2,s5 (PC=0xb90)
      11'd1161: state_d_o = 11'd434;  // S709 zext.b t5,a6 (PC=0xb94)
      11'd434: state_d_o = 11'd489;  // S710 add t6,a2,t6 (PC=0xb98)
      11'd489: state_d_o = 11'd357;  // S711 add a6,a2,s9 (PC=0xb9c)
      11'd357: state_d_o = 11'd359;  // S712 lw s9,0(s6) (PC=0xba0)
      11'd359: state_d_o = 11'd361;  // S713 lw s6,0(t0) (PC=0xba4)
      11'd361: state_d_o = 11'd1142;  // S714 lw s11,0(s8) (PC=0xba8)
      11'd1142: state_d_o = 11'd363;  // S715 zext.b t4,t4 (PC=0xbac)
      11'd363: state_d_o = 11'd1146;  // S716 lw s8,0(s5) (PC=0xbb0)
      11'd1146: state_d_o = 11'd365;  // S717 zext.b t3,t3 (PC=0xbb4)
      11'd365: state_d_o = 11'd1131;  // S718 lw s5,0(t6) (PC=0xbb8)
      11'd1131: state_d_o = 11'd392;  // S719 zext.b t1,t1 (PC=0xbbc)
      11'd392: state_d_o = 11'd683;  // S720 lw t6,8(t2) (PC=0xbc0)
      11'd683: state_d_o = 11'd675;  // S721 srli a4,a4,0x10 (PC=0xbc4)
      11'd675: state_d_o = 11'd129;  // S722 srli a5,a5,0x10 (PC=0xbc8)
      11'd129: state_d_o = 11'd75;  // S723 addi t4,t4,320 (PC=0xbcc)
      11'd75: state_d_o = 11'd82;  // S724 addi t3,t3,320 (PC=0xbd0)
      11'd82: state_d_o = 11'd1154;  // S725 addi t1,t1,320 (PC=0xbd4)
      11'd1154: state_d_o = 11'd133;  // S726 zext.b a4,a4 (PC=0xbd8)
      11'd133: state_d_o = 11'd1123;  // S727 addi a7,a7,320 (PC=0xbdc)
      11'd1123: state_d_o = 11'd369;  // S728 zext.b a5,a5 (PC=0xbe0)
      11'd369: state_d_o = 11'd572;  // S729 lw a6,0(a6) (PC=0xbe4)
      11'd572: state_d_o = 11'd98;  // S730 slli t4,t4,0x2 (PC=0xbe8)
      11'd98: state_d_o = 11'd604;  // S731 addi a3,a3,576 (PC=0xbec)
      11'd604: state_d_o = 11'd183;  // S732 slli t3,t3,0x2 (PC=0xbf0)
      11'd183: state_d_o = 11'd612;  // S733 addi t5,t5,576 (PC=0xbf4)
      11'd612: state_d_o = 11'd110;  // S734 slli t1,t1,0x2 (PC=0xbf8)
      11'd110: state_d_o = 11'd580;  // S735 addi a4,a4,576 (PC=0xbfc)
      11'd580: state_d_o = 11'd38;  // S736 slli a7,a7,0x2 (PC=0xc00)
      11'd38: state_d_o = 11'd1287;  // S737 addi a5,a5,576 (PC=0xc04)
      11'd1287: state_d_o = 11'd404;  // S738 xor s6,s7,s6 (PC=0xc08)
      11'd404: state_d_o = 11'd405;  // S739 lw s4,0(t2) (PC=0xc0c)
      11'd405: state_d_o = 11'd1289;  // S740 lw t0,4(t2) (PC=0xc10)
      11'd1289: state_d_o = 11'd442;  // S741 xor s6,s6,t6 (PC=0xc14)
      11'd442: state_d_o = 11'd393;  // S742 add t4,a2,t4 (PC=0xc18)
      11'd393: state_d_o = 11'd620;  // S743 lw t6,12(t2) (PC=0xc1c)
      11'd620: state_d_o = 11'd446;  // S744 slli a3,a3,0x2 (PC=0xc20)
      11'd446: state_d_o = 11'd596;  // S745 add t3,a2,t3 (PC=0xc24)
      11'd596: state_d_o = 11'd450;  // S746 slli t5,t5,0x2 (PC=0xc28)
      11'd450: state_d_o = 11'd551;  // S747 add t1,a2,t1 (PC=0xc2c)
      11'd551: state_d_o = 11'd466;  // S748 slli a4,a4,0x2 (PC=0xc30)
      11'd466: state_d_o = 11'd566;  // S749 add a7,a2,a7 (PC=0xc34)
      11'd566: state_d_o = 11'd373;  // S750 slli a5,a5,0x2 (PC=0xc38)
      11'd373: state_d_o = 11'd383;  // S751 lw t1,0(t1) (PC=0xc3c)
      11'd383: state_d_o = 11'd375;  // S752 lw a7,0(a7) (PC=0xc40)
      11'd375: state_d_o = 11'd377;  // S753 lw t4,0(t4) (PC=0xc44)
      11'd377: state_d_o = 11'd438;  // S754 lw t3,0(t3) (PC=0xc48)
      11'd438: state_d_o = 11'd458;  // S755 add a3,a2,a3 (PC=0xc4c)
      11'd458: state_d_o = 11'd454;  // S756 add t5,a2,t5 (PC=0xc50)
      11'd454: state_d_o = 11'd462;  // S757 add a4,a2,a4 (PC=0xc54)
      11'd462: state_d_o = 11'd371;  // S758 add a5,a2,a5 (PC=0xc58)
      11'd371: state_d_o = 11'd381;  // S759 lw a3,0(a3) (PC=0xc5c)
      11'd381: state_d_o = 11'd379;  // S760 lw t5,0(t5) (PC=0xc60)
      11'd379: state_d_o = 11'd310;  // S761 lw a4,0(a4) (PC=0xc64)
      11'd310: state_d_o = 11'd1291;  // S762 lw a5,0(a5) (PC=0xc68)
      11'd1291: state_d_o = 11'd1293;  // S763 xor s10,s11,s10 (PC=0xc6c)
      11'd1293: state_d_o = 11'd1295;  // S764 xor s8,s9,s8 (PC=0xc70)
      11'd1295: state_d_o = 11'd1322;  // S765 xor a6,a6,s5 (PC=0xc74)
      11'd1322: state_d_o = 11'd1299;  // S766 xor s4,s10,s4 (PC=0xc78)
      11'd1299: state_d_o = 11'd1297;  // S767 xor t0,s8,t0 (PC=0xc7c)
      11'd1297: state_d_o = 11'd1323;  // S768 xor a6,a6,t6 (PC=0xc80)
      11'd1323: state_d_o = 11'd1324;  // S769 xor s6,s6,t1 (PC=0xc84)
      11'd1324: state_d_o = 11'd1325;  // S770 xor a6,a6,a7 (PC=0xc88)
      11'd1325: state_d_o = 11'd1326;  // S771 xor t4,s4,t4 (PC=0xc8c)
      11'd1326: state_d_o = 11'd173;  // S772 xor t3,t0,t3 (PC=0xc90)
      11'd173: state_d_o = 11'd1327;  // S773 addi t2,t2,16 (PC=0xc94)
      11'd1327: state_d_o = 11'd1328;  // S774 xor t1,t4,a3 (PC=0xc98)
      11'd1328: state_d_o = 11'd1329;  // S775 xor t3,t3,t5 (PC=0xc9c)
      11'd1329: state_d_o = 11'd1330;  // S776 xor a7,s6,a4 (PC=0xca0)
      11'd1330: state_d_o = 11'd1544;  // S777 xor a3,a6,a5 (PC=0xca4)
      11'd1544: state_d_o = branch_decision_i ? 11'd749 : 11'd282;  // S778
      11'd282: state_d_o = 11'd290;  // S779 lw s8,12(sp) (PC=0xcac)
      11'd290: state_d_o = 11'd298;  // S780 lw s9,8(sp) (PC=0xcb0)
      11'd298: state_d_o = 11'd189;  // S781 lw s10,4(sp) (PC=0xcb4)
      11'd189: state_d_o = 11'd187;  // S782 mv a4,t1 (PC=0xcb8)
      11'd187: state_d_o = 11'd185;  // S783 mv a5,t3 (PC=0xcbc)
      11'd185: state_d_o = 11'd755;  // S784 mv s11,s3 (PC=0xcc0)
      11'd755: state_d_o = 11'd756;  // S785 srli s7,a5,0x18 (PC=0xcc4)
      11'd756: state_d_o = 11'd757;  // S786 srli t6,a3,0x8 (PC=0xcc8)
      11'd757: state_d_o = 11'd758;  // S787 srli s6,a7,0x18 (PC=0xccc)
      11'd758: state_d_o = 11'd759;  // S788 srli t5,a4,0x8 (PC=0xcd0)
      11'd759: state_d_o = 11'd760;  // S789 srli s5,a3,0x18 (PC=0xcd4)
      11'd760: state_d_o = 11'd1187;  // S790 srli t4,a5,0x8 (PC=0xcd8)
      11'd1187: state_d_o = 11'd715;  // S791 zext.b s4,a4 (PC=0xcdc)
      11'd715: state_d_o = 11'd1188;  // S792 srli t3,a7,0x10 (PC=0xce0)
      11'd1188: state_d_o = 11'd717;  // S793 zext.b t2,a5 (PC=0xce4)
      11'd717: state_d_o = 11'd1165;  // S794 srli t1,a3,0x10 (PC=0xce8)
      11'd1165: state_d_o = 11'd761;  // S795 zext.b t0,a7 (PC=0xcec)
      11'd761: state_d_o = 11'd419;  // S796 srli a6,a4,0x10 (PC=0xcf0)
      11'd419: state_d_o = 11'd1167;  // S797 add s7,a2,s7 (PC=0xcf4)
      11'd1167: state_d_o = 11'd423;  // S798 zext.b t6,t6 (PC=0xcf8)
      11'd423: state_d_o = 11'd1169;  // S799 add s6,a2,s6 (PC=0xcfc)
      11'd1169: state_d_o = 11'd431;  // S800 zext.b t5,t5 (PC=0xd00)
      11'd431: state_d_o = 11'd1143;  // S801 add s5,a2,s5 (PC=0xd04)
      11'd1143: state_d_o = 11'd684;  // S802 zext.b t4,t4 (PC=0xd08)
      11'd684: state_d_o = 11'd694;  // S803 srli a4,a4,0x18 (PC=0xd0c)
      11'd694: state_d_o = 11'd1075;  // S804 srli a7,a7,0x8 (PC=0xd10)
      11'd1075: state_d_o = 11'd1077;  // S805 lbu s7,0(s7) (PC=0xd14)
      11'd1077: state_d_o = 11'd1079;  // S806 lbu s6,0(s6) (PC=0xd18)
      11'd1079: state_d_o = 11'd478;  // S807 lbu s5,0(s5) (PC=0xd1c)
      11'd478: state_d_o = 11'd435;  // S808 add s4,a2,s4 (PC=0xd20)
      11'd435: state_d_o = 11'd1147;  // S809 add t6,a2,t6 (PC=0xd24)
      11'd1147: state_d_o = 11'd474;  // S810 zext.b t3,t3 (PC=0xd28)
      11'd474: state_d_o = 11'd459;  // S811 add t2,a2,t2 (PC=0xd2c)
      11'd459: state_d_o = 11'd1132;  // S812 add t5,a2,t5 (PC=0xd30)
      11'd1132: state_d_o = 11'd427;  // S813 zext.b t1,t1 (PC=0xd34)
      11'd427: state_d_o = 11'd443;  // S814 add t0,a2,t0 (PC=0xd38)
      11'd443: state_d_o = 11'd1171;  // S815 add t4,a2,t4 (PC=0xd3c)
      11'd1171: state_d_o = 11'd455;  // S816 zext.b a6,a6 (PC=0xd40)
      11'd455: state_d_o = 11'd1138;  // S817 add a4,a2,a4 (PC=0xd44)
      11'd1138: state_d_o = 11'd1163;  // S818 zext.b a3,a3 (PC=0xd48)
      11'd1163: state_d_o = 11'd676;  // S819 zext.b a7,a7 (PC=0xd4c)
      11'd676: state_d_o = 11'd1081;  // S820 srli a5,a5,0x10 (PC=0xd50)
      11'd1081: state_d_o = 11'd1083;  // S821 lbu s4,0(s4) (PC=0xd54)
      11'd1083: state_d_o = 11'd1034;  // S822 lbu t2,0(t2) (PC=0xd58)
      11'd1034: state_d_o = 11'd1085;  // S823 lbu t0,0(t0) (PC=0xd5c)
      11'd1085: state_d_o = 11'd1087;  // S824 lbu t6,0(t6) (PC=0xd60)
      11'd1087: state_d_o = 11'd1089;  // S825 lbu t5,0(t5) (PC=0xd64)
      11'd1089: state_d_o = 11'd1097;  // S826 lbu t4,0(t4) (PC=0xd68)
      11'd1097: state_d_o = 11'd447;  // S827 lbu a4,0(a4) (PC=0xd6c)
      11'd447: state_d_o = 11'd451;  // S828 add t3,a2,t3 (PC=0xd70)
      11'd451: state_d_o = 11'd491;  // S829 add t1,a2,t1 (PC=0xd74)
      11'd491: state_d_o = 11'd439;  // S830 add a6,a2,a6 (PC=0xd78)
      11'd439: state_d_o = 11'd467;  // S831 add a3,a2,a3 (PC=0xd7c)
      11'd467: state_d_o = 11'd1124;  // S832 add a7,a2,a7 (PC=0xd80)
      11'd1124: state_d_o = 11'd1027;  // S833 zext.b a5,a5 (PC=0xd84)
      11'd1027: state_d_o = 11'd1093;  // S834 lbu a3,0(a3) (PC=0xd88)
      11'd1093: state_d_o = 11'd1038;  // S835 lbu t3,0(t3) (PC=0xd8c)
      11'd1038: state_d_o = 11'd1095;  // S836 lbu t1,0(t1) (PC=0xd90)
      11'd1095: state_d_o = 11'd1091;  // S837 lbu a6,0(a6) (PC=0xd94)
      11'd1091: state_d_o = 11'd463;  // S838 lbu a7,0(a7) (PC=0xd98)
      11'd463: state_d_o = 11'd1030;  // S839 add a5,a2,a5 (PC=0xd9c)
      11'd1030: state_d_o = 11'd635;  // S840 lbu a5,0(a5) (PC=0xda0)
      11'd635: state_d_o = 11'd493;  // S841 slli s7,s7,0x18 (PC=0xda4)
      11'd493: state_d_o = 11'd639;  // S842 add s11,s0,s11 (PC=0xda8)
      11'd639: state_d_o = 11'd495;  // S843 slli s6,s6,0x18 (PC=0xdac)
      11'd495: state_d_o = 11'd643;  // S844 add s10,s0,s10 (PC=0xdb0)
      11'd643: state_d_o = 11'd497;  // S845 slli s5,s5,0x18 (PC=0xdb4)
      11'd497: state_d_o = 11'd385;  // S846 add s9,s0,s9 (PC=0xdb8)
      11'd385: state_d_o = 11'd387;  // S847 lw s11,0(s11) (PC=0xdbc)
      11'd387: state_d_o = 11'd389;  // S848 lw s10,0(s10) (PC=0xdc0)
      11'd389: state_d_o = 11'd1245;  // S849 lw s9,0(s9) (PC=0xdc4)
      11'd1245: state_d_o = 11'd1247;  // S850 or s7,s7,s4 (PC=0xdc8)
      11'd1247: state_d_o = 11'd1249;  // S851 or s6,s6,t2 (PC=0xdcc)
      11'd1249: state_d_o = 11'd589;  // S852 or s5,s5,t0 (PC=0xdd0)
      11'd589: state_d_o = 11'd597;  // S853 slli t6,t6,0x8 (PC=0xdd4)
      11'd597: state_d_o = 11'd573;  // S854 slli t5,t5,0x8 (PC=0xdd8)
      11'd573: state_d_o = 11'd552;  // S855 slli t4,t4,0x8 (PC=0xddc)
      11'd552: state_d_o = 11'd499;  // S856 slli a4,a4,0x18 (PC=0xde0)
      11'd499: state_d_o = 11'd391;  // S857 add s8,s0,s8 (PC=0xde4)
      11'd391: state_d_o = 11'd605;  // S858 lw t0,0(s8) (PC=0xde8)
      11'd605: state_d_o = 11'd613;  // S859 slli t3,t3,0x10 (PC=0xdec)
      11'd613: state_d_o = 11'd631;  // S860 slli t1,t1,0x10 (PC=0xdf0)
      11'd631: state_d_o = 11'd1217;  // S861 slli a6,a6,0x10 (PC=0xdf4)
      11'd1217: state_d_o = 11'd581;  // S862 or a4,a4,a3 (PC=0xdf8)
      11'd581: state_d_o = 11'd1251;  // S863 slli a7,a7,0x8 (PC=0xdfc)
      11'd1251: state_d_o = 11'd1253;  // S864 or t6,s7,t6 (PC=0xe00)
      11'd1253: state_d_o = 11'd1255;  // S865 or t5,s6,t5 (PC=0xe04)
      11'd1255: state_d_o = 11'd1274;  // S866 or t4,s5,t4 (PC=0xe08)
      11'd1274: state_d_o = 11'd1257;  // S867 or a4,a4,a7 (PC=0xe0c)
      11'd1257: state_d_o = 11'd1259;  // S868 or t6,t6,t3 (PC=0xe10)
      11'd1259: state_d_o = 11'd1261;  // S869 or t5,t5,t1 (PC=0xe14)
      11'd1261: state_d_o = 11'd567;  // S870 or t4,t4,a6 (PC=0xe18)
      11'd567: state_d_o = 11'd1301;  // S871 slli a5,a5,0x10 (PC=0xe1c)
      11'd1301: state_d_o = 11'd1303;  // S872 xor t6,t6,s11 (PC=0xe20)
      11'd1303: state_d_o = 11'd1305;  // S873 xor t5,t5,s10 (PC=0xe24)
      11'd1305: state_d_o = 11'd1275;  // S874 xor t4,t4,s9 (PC=0xe28)
      11'd1275: state_d_o = 11'd1307;  // S875 or a5,a4,a5 (PC=0xe2c)
      11'd1307: state_d_o = 11'd719;  // S876 xor a5,a5,t0 (PC=0xe30)
      11'd719: state_d_o = 11'd721;  // S877 srli a6,t4,0x18 (PC=0xe34)
      11'd721: state_d_o = 11'd723;  // S878 srli a3,t4,0x10 (PC=0xe38)
      11'd723: state_d_o = 11'd725;  // S879 srli a4,t4,0x8 (PC=0xe3c)
      11'd725: state_d_o = 11'd727;  // S880 srli s4,t6,0x18 (PC=0xe40)
      11'd727: state_d_o = 11'd729;  // S881 srli t2,t6,0x10 (PC=0xe44)
      11'd729: state_d_o = 11'd731;  // S882 srli t0,t6,0x8 (PC=0xe48)
      11'd731: state_d_o = 11'd733;  // S883 srli t3,t5,0x18 (PC=0xe4c)
      11'd733: state_d_o = 11'd735;  // S884 srli t1,t5,0x10 (PC=0xe50)
      11'd735: state_d_o = 11'd1346;  // S885 srli a7,t5,0x8 (PC=0xe54)
      11'd1346: state_d_o = 11'd1350;  // S886 sb a6,11(a1) (PC=0xe58)
      11'd1350: state_d_o = 11'd1354;  // S887 sb a3,10(a1) (PC=0xe5c)
      11'd1354: state_d_o = 11'd1357;  // S888 sb a4,9(a1) (PC=0xe60)
      11'd1357: state_d_o = 11'd1359;  // S889 sb s4,3(a1) (PC=0xe64)
      11'd1359: state_d_o = 11'd1361;  // S890 sb t2,2(a1) (PC=0xe68)
      11'd1361: state_d_o = 11'd1363;  // S891 sb t0,1(a1) (PC=0xe6c)
      11'd1363: state_d_o = 11'd1365;  // S892 sb t6,0(a1) (PC=0xe70)
      11'd1365: state_d_o = 11'd1367;  // S893 sb t3,7(a1) (PC=0xe74)
      11'd1367: state_d_o = 11'd1369;  // S894 sb t1,6(a1) (PC=0xe78)
      11'd1369: state_d_o = 11'd1371;  // S895 sb a7,5(a1) (PC=0xe7c)
      11'd1371: state_d_o = 11'd1373;  // S896 sb t5,4(a1) (PC=0xe80)
      11'd1373: state_d_o = 11'd698;  // S897 sb t4,8(a1) (PC=0xe84)
      11'd698: state_d_o = 11'd1347;  // S898 srli a6,a5,0x18 (PC=0xe88)
      11'd1347: state_d_o = 11'd690;  // S899 sb a6,15(a1) (PC=0xe8c)
      11'd690: state_d_o = 11'd737;  // S900 srli a3,a5,0x10 (PC=0xe90)
      11'd737: state_d_o = 11'd1375;  // S901 srli a4,a5,0x8 (PC=0xe94)
      11'd1375: state_d_o = 11'd313;  // S902 sb a5,12(a1) (PC=0xe98)
      11'd313: state_d_o = 11'd1351;  // S903 lw a5,0(sp) (PC=0xe9c)
      11'd1351: state_d_o = 11'd1355;  // S904 sb a3,14(a1) (PC=0xea0)
      11'd1355: state_d_o = 11'd141;  // S905 sb a4,13(a1) (PC=0xea4)
      11'd141: state_d_o = 11'd91;  // S906 addi a1,a1,16 (PC=0xea8)
      11'd91: state_d_o = 11'd1537;  // S907 addi a0,a0,16 (PC=0xeac)
      11'd1537: state_d_o = branch_decision_i ? 11'd1043 : 11'd260;  // S908
      11'd260: state_d_o = 11'd275;  // S909 lw s0,60(sp) (PC=0xeb4)
      11'd275: state_d_o = 11'd305;  // S910 lw s1,56(sp) (PC=0xeb8)
      11'd305: state_d_o = 11'd317;  // S911 lw s2,52(sp) (PC=0xebc)
      11'd317: state_d_o = 11'd321;  // S912 lw s3,48(sp) (PC=0xec0)
      11'd321: state_d_o = 11'd325;  // S913 lw s4,44(sp) (PC=0xec4)
      11'd325: state_d_o = 11'd329;  // S914 lw s5,40(sp) (PC=0xec8)
      11'd329: state_d_o = 11'd333;  // S915 lw s6,36(sp) (PC=0xecc)
      11'd333: state_d_o = 11'd283;  // S916 lw s7,32(sp) (PC=0xed0)
      11'd283: state_d_o = 11'd291;  // S917 lw s8,28(sp) (PC=0xed4)
      11'd291: state_d_o = 11'd299;  // S918 lw s9,24(sp) (PC=0xed8)
      11'd299: state_d_o = 11'd337;  // S919 lw s10,20(sp) (PC=0xedc)
      11'd337: state_d_o = 11'd11;  // S920 lw s11,16(sp) (PC=0xee0)
      11'd11: state_d_o = 11'd1458;  // S921 addi sp,sp,64 (PC=0xee4)
      11'd1458: state_d_o = rf_rdata_a_i[10:0];  // S922 ret
      11'd845: state_d_o = 11'd849;  // S923 li s8,28 (PC=0xeec)
      11'd849: state_d_o = 11'd853;  // S924 li s9,24 (PC=0xef0)
      11'd853: state_d_o = 11'd857;  // S925 li s10,20 (PC=0xef4)
      11'd857: state_d_o = 11'd1415;  // S926 li s11,16 (PC=0xef8)
      11'd1415: state_d_o = 11'd755;  // S927 j cc4 <_nettle_aes_decrypt.part.0+0x31c> (PC=0xefc)
      11'd1459: state_d_o = rf_rdata_a_i[10:0];  // S928 ret
      11'd1509: state_d_o = branch_decision_i ? 11'd1417 : 11'd1416;  // S929
      11'd1416: state_d_o = 11'd88;  // S930 j 2c0 <_aes_set_key.part.0> (PC=0xf08)
      11'd1417: state_d_o = 11'd1417;  // S931 j f0c <_aes_set_key+0x8> (PC=0xf0c)
      11'd777: state_d_o = 11'd1568;  // S932 li a5,15 (PC=0xf10)
      11'd1568: state_d_o = branch_decision_i ? 11'd1419 : 11'd778;  // S933
      11'd778: state_d_o = 11'd1569;  // S934 li a5,32 (PC=0xf18)
      11'd1569: state_d_o = branch_decision_i ? 11'd1664 : 11'd1418;  // S935
      11'd1418: state_d_o = 11'd1418;  // S936 j f20 <aes_set_encrypt_key+0x10> (PC=0xf20)
      11'd1419: state_d_o = 11'd1419;  // S937 j f24 <aes_set_encrypt_key+0x14> (PC=0xf24)
      11'd1664: state_d_o = branch_decision_i ? 11'd781 : 11'd779;  // S938
      11'd779: state_d_o = 11'd1570;  // S939 li a5,23 (PC=0xf2c)
      11'd1570: state_d_o = branch_decision_i ? 11'd782 : 11'd780;  // S940
      11'd780: state_d_o = 11'd819;  // S941 li a5,12 (PC=0xf34)
      11'd819: state_d_o = 11'd992;  // S942 li a1,6 (PC=0xf38)
      11'd992: state_d_o = 11'd190;  // S943 sw a5,0(a0) (PC=0xf3c)
      11'd190: state_d_o = 11'd220;  // S944 mv a3,a2 (PC=0xf40)
      11'd220: state_d_o = 11'd118;  // S945 addi a2,a0,4 (PC=0xf44)
      11'd118: state_d_o = 11'd1420;  // S946 mv a0,a5 (PC=0xf48)
      11'd1420: state_d_o = 11'd88;  // S947 j 2c0 <_aes_set_key.part.0> (PC=0xf4c)
      11'd781: state_d_o = 11'd820;  // S948 li a5,14 (PC=0xf50)
      11'd820: state_d_o = 11'd1421;  // S949 li a1,8 (PC=0xf54)
      11'd1421: state_d_o = 11'd992;  // S950 j f3c <aes_set_encrypt_key+0x2c> (PC=0xf58)
      11'd782: state_d_o = 11'd821;  // S951 li a5,10 (PC=0xf5c)
      11'd821: state_d_o = 11'd1422;  // S952 li a1,4 (PC=0xf60)
      11'd1422: state_d_o = 11'd992;  // S953 j f3c <aes_set_encrypt_key+0x2c> (PC=0xf64)
      11'd665: state_d_o = 11'd1667;  // S954 slli t3,a0,0x2 (PC=0xf68)
      11'd1667: state_d_o = branch_decision_i ? 11'd1519 : 11'd656;  // S955
      11'd656: state_d_o = 11'd516;  // S956 slli a5,a0,0x4 (PC=0xf70)
      11'd516: state_d_o = 11'd163;  // S957 add a2,a2,a5 (PC=0xf74)
      11'd163: state_d_o = 11'd868;  // S958 mv a6,a1 (PC=0xf78)
      11'd868: state_d_o = 11'd862;  // S959 li t1,0 (PC=0xf7c)
      11'd862: state_d_o = 11'd783;  // S960 li a7,16 (PC=0xf80)
      11'd783: state_d_o = 11'd517;  // S961 li a5,0 (PC=0xf84)
      11'd517: state_d_o = 11'd406;  // S962 add a4,a2,a5 (PC=0xf88)
      11'd406: state_d_o = 11'd518;  // S963 lw a3,0(a4) (PC=0xf8c)
      11'd518: state_d_o = 11'd39;  // S964 add a4,a6,a5 (PC=0xf90)
      11'd39: state_d_o = 11'd1000;  // S965 addi a5,a5,4 (PC=0xf94)
      11'd1000: state_d_o = 11'd1545;  // S966 sw a3,0(a4) (PC=0xf98)
      11'd1545: state_d_o = branch_decision_i ? 11'd517 : 11'd83;  // S967
      11'd83: state_d_o = 11'd50;  // S968 addi t1,t1,4 (PC=0xfa0)
      11'd50: state_d_o = 11'd67;  // S969 addi a2,a2,-16 (PC=0xfa4)
      11'd67: state_d_o = 11'd1579;  // S970 addi a6,a6,16 (PC=0xfa8)
      11'd1579: state_d_o = branch_decision_i ? 11'd783 : 11'd784;  // S971
      11'd784: state_d_o = 11'd1580;  // S972 li a5,4 (PC=0xfb0)
      11'd1580: state_d_o = branch_decision_i ? 11'd1461 : 11'd657;  // S973
      11'd657: state_d_o = 11'd842;  // S974 slli a5,a0,0x4 (PC=0xfb8)
      11'd842: state_d_o = 11'd159;  // S975 lui a6,0x10 (PC=0xfbc)
      11'd159: state_d_o = 11'd68;  // S976 addi a0,a1,16 (PC=0xfc0)
      11'd68: state_d_o = 11'd519;  // S977 mv a6,a6 (PC=0xfc4)
      11'd519: state_d_o = 11'd407;  // S978 add a1,a1,a5 (PC=0xfc8)
      11'd407: state_d_o = 11'd92;  // S979 lw a5,0(a0) (PC=0xfcc)
      11'd92: state_d_o = 11'd762;  // S980 addi a0,a0,4 (PC=0xfd0)
      11'd762: state_d_o = 11'd691;  // S981 srli a2,a5,0x18 (PC=0xfd4)
      11'd691: state_d_o = 11'd666;  // S982 srli a3,a5,0x6 (PC=0xfd8)
      11'd666: state_d_o = 11'd520;  // S983 slli a2,a2,0x2 (PC=0xfdc)
      11'd520: state_d_o = 11'd1189;  // S984 add a2,a6,a2 (PC=0xfe0)
      11'd1189: state_d_o = 11'd1139;  // S985 zext.b a4,a5 (PC=0xfe4)
      11'd1139: state_d_o = 11'd677;  // S986 andi a3,a3,1020 (PC=0xfe8)
      11'd677: state_d_o = 11'd408;  // S987 srli a5,a5,0xe (PC=0xfec)
      11'd408: state_d_o = 11'd521;  // S988 lw a7,12(a2) (PC=0xff0)
      11'd521: state_d_o = 11'd553;  // S989 add a3,a6,a3 (PC=0xff4)
      11'd553: state_d_o = 11'd1125;  // S990 slli a4,a4,0x2 (PC=0xff8)
      11'd1125: state_d_o = 11'd409;  // S991 andi a5,a5,1020 (PC=0xffc)
      11'd409: state_d_o = 11'd522;  // S992 lw a2,12(a3) (PC=0x1000)
      11'd522: state_d_o = 11'd523;  // S993 add a4,a6,a4 (PC=0x1004)
      11'd523: state_d_o = 11'd410;  // S994 add a5,a6,a5 (PC=0x1008)
      11'd410: state_d_o = 11'd411;  // S995 lw a3,12(a5) (PC=0x100c)
      11'd411: state_d_o = 11'd763;  // S996 lw t1,12(a4) (PC=0x1010)
      11'd763: state_d_o = 11'd582;  // S997 srli a5,a7,0x8 (PC=0x1014)
      11'd582: state_d_o = 11'd667;  // S998 slli a7,a7,0x18 (PC=0x1018)
      11'd667: state_d_o = 11'd1276;  // S999 slli a4,a2,0x8 (PC=0x101c)
      11'd1276: state_d_o = 11'd764;  // S1000 or a5,a5,a7 (PC=0x1020)
      11'd764: state_d_o = 11'd1277;  // S1001 srli a2,a2,0x18 (PC=0x1024)
      11'd1277: state_d_o = 11'd1331;  // S1002 or a2,a4,a2 (PC=0x1028)
      11'd1331: state_d_o = 11'd668;  // S1003 xor a5,a5,t1 (PC=0x102c)
      11'd668: state_d_o = 11'd765;  // S1004 slli a4,a3,0x10 (PC=0x1030)
      11'd765: state_d_o = 11'd1332;  // S1005 srli a3,a3,0x10 (PC=0x1034)
      11'd1332: state_d_o = 11'd1218;  // S1006 xor a5,a5,a2 (PC=0x1038)
      11'd1218: state_d_o = 11'd1333;  // S1007 or a4,a4,a3 (PC=0x103c)
      11'd1333: state_d_o = 11'd993;  // S1008 xor a5,a4,a5 (PC=0x1040)
      11'd993: state_d_o = 11'd1546;  // S1009 sw a5,-4(a0) (PC=0x1044)
      11'd1546: state_d_o = branch_decision_i ? 11'd407 : 11'd1460;  // S1010
      11'd1460: state_d_o = rf_rdata_a_i[10:0];  // S1011 ret
      11'd1519: state_d_o = branch_decision_i ? 11'd1462 : 11'd669;  // S1012
      11'd669: state_d_o = 11'd524;  // S1013 slli t4,a0,0x3 (PC=0x1054)
      11'd524: state_d_o = 11'd574;  // S1014 add t4,t4,a1 (PC=0x1058)
      11'd574: state_d_o = 11'd144;  // S1015 slli t4,t4,0x1 (PC=0x105c)
      11'd144: state_d_o = 11'd221;  // S1016 addi a3,a1,16 (PC=0x1060)
      11'd221: state_d_o = 11'd863;  // S1017 mv t1,t3 (PC=0x1064)
      11'd863: state_d_o = 11'd130;  // S1018 li a7,0 (PC=0x1068)
      11'd130: state_d_o = 11'd148;  // S1019 addi t4,t4,16 (PC=0x106c)
      11'd148: state_d_o = 11'd1633;  // S1020 addi a5,a3,-16 (PC=0x1070)
      11'd1633: state_d_o = 11'd412;  // S1021 sub a4,t4,a3 (PC=0x1074)
      11'd412: state_d_o = 11'd413;  // S1022 lw a6,0(a4) (PC=0x1078)
      11'd413: state_d_o = 11'd40;  // S1023 lw a2,0(a5) (PC=0x107c)
      11'd40: state_d_o = 11'd111;  // S1024 addi a5,a5,4 (PC=0x1080)
      11'd111: state_d_o = 11'd1001;  // S1025 addi a4,a4,4 (PC=0x1084)
      11'd1001: state_d_o = 11'd1002;  // S1026 sw a6,-4(a5) (PC=0x1088)
      11'd1002: state_d_o = 11'd1547;  // S1027 sw a2,-4(a4) (PC=0x108c)
      11'd1547: state_d_o = branch_decision_i ? 11'd412 : 11'd134;  // S1028
      11'd134: state_d_o = 11'd84;  // S1029 addi a7,a7,4 (PC=0x1094)
      11'd84: state_d_o = 11'd99;  // S1030 addi t1,t1,-4 (PC=0x1098)
      11'd99: state_d_o = 11'd1761;  // S1031 addi a3,a3,16 (PC=0x109c)
      11'd1761: state_d_o = branch_decision_i ? 11'd148 : 11'd1423;  // S1032
      11'd1423: state_d_o = 11'd784;  // S1033 j fb0 <_nettle_aes_invert+0x48> (PC=0x10a4)
      11'd1461: state_d_o = rf_rdata_a_i[10:0];  // S1034 ret
      11'd1462: state_d_o = rf_rdata_a_i[10:0];  // S1035 ret
      11'd12: state_d_o = 11'd923;  // S1036 addi sp,sp,-80 (PC=0x10b0)
      11'd923: state_d_o = 11'd985;  // S1037 sw ra,76(sp) (PC=0x10b4)
      11'd985: state_d_o = 11'd1510;  // S1038 sw a0,12(sp) (PC=0x10b8)
      11'd1510: state_d_o = branch_decision_i ? 11'd268 : 11'd931;  // S1039
      11'd931: state_d_o = 11'd832;  // S1040 sw s1,68(sp) (PC=0x10c0)
      11'd832: state_d_o = 11'd942;  // S1041 lui s1,0x13 (PC=0x10c4)
      11'd942: state_d_o = 11'd946;  // S1042 sw s3,60(sp) (PC=0x10c8)
      11'd946: state_d_o = 11'd958;  // S1043 sw s4,56(sp) (PC=0x10cc)
      11'd958: state_d_o = 11'd962;  // S1044 sw s7,44(sp) (PC=0x10d0)
      11'd962: state_d_o = 11'd222;  // S1045 sw s8,40(sp) (PC=0x10d4)
      11'd222: state_d_o = 11'd869;  // S1046 addi s1,s1,-2004 (PC=0x10d8)
      11'd869: state_d_o = 11'd846;  // S1047 lui s4,0x13 (PC=0x10dc)
      11'd846: state_d_o = 11'd870;  // S1048 lui s8,0x12 (PC=0x10e0)
      11'd870: state_d_o = 11'd871;  // S1049 lui s3,0x13 (PC=0x10e4)
      11'd871: state_d_o = 11'd916;  // S1050 lui s7,0x13 (PC=0x10e8)
      11'd916: state_d_o = 11'd938;  // S1051 sw s0,72(sp) (PC=0x10ec)
      11'd938: state_d_o = 11'd950;  // S1052 sw s2,64(sp) (PC=0x10f0)
      11'd950: state_d_o = 11'd954;  // S1053 sw s5,52(sp) (PC=0x10f4)
      11'd954: state_d_o = 11'd966;  // S1054 sw s6,48(sp) (PC=0x10f8)
      11'd966: state_d_o = 11'd970;  // S1055 sw s9,36(sp) (PC=0x10fc)
      11'd970: state_d_o = 11'd974;  // S1056 sw s10,32(sp) (PC=0x1100)
      11'd974: state_d_o = 11'd223;  // S1057 sw s11,28(sp) (PC=0x1104)
      11'd223: state_d_o = 11'd1003;  // S1058 mv s6,a1 (PC=0x1108)
      11'd1003: state_d_o = 11'd872;  // S1059 sw zero,8(sp) (PC=0x110c)
      11'd872: state_d_o = 11'd138;  // S1060 lui s5,0x12 (PC=0x1110)
      11'd138: state_d_o = 11'd126;  // S1061 addi s4,s4,-2000 (PC=0x1114)
      11'd126: state_d_o = 11'd224;  // S1062 addi s8,s8,1580 (PC=0x1118)
      11'd224: state_d_o = 11'd854;  // S1063 addi s3,s3,-1760 (PC=0x111c)
      11'd854: state_d_o = 11'd122;  // S1064 lui s10,0x11 (PC=0x1120)
      11'd122: state_d_o = 11'd850;  // S1065 addi s7,s7,-1260 (PC=0x1124)
      11'd850: state_d_o = 11'd873;  // S1066 lui s9,0x10 (PC=0x1128)
      11'd873: state_d_o = 11'd225;  // S1067 li s2,14 (PC=0x112c)
      11'd225: state_d_o = 11'd858;  // S1068 addi s0,s1,504 (PC=0x1130)
      11'd858: state_d_o = 11'd192;  // S1069 li s11,0 (PC=0x1134)
      11'd192: state_d_o = 11'd226;  // S1070 addi a3,s5,1548 (PC=0x1138)
      11'd226: state_d_o = 11'd822;  // S1071 mv a2,s4 (PC=0x113c)
      11'd822: state_d_o = 11'd805;  // S1072 li a1,8 (PC=0x1140)
      11'd805: state_d_o = 11'd976;  // S1073 li a0,14 (PC=0x1144)
      11'd976: state_d_o = 11'd1482;  // S1074 sw s2,0(s1) (PC=0x1148)
      11'd1482: state_d_o = 11'd88;  // S1075 jal 2c0 <_aes_set_key.part.0> (PC=0x114c)
      11'd227: state_d_o = 11'd228;  // S1076 mv a5,s8 (PC=0x1150)
      11'd228: state_d_o = 11'd837;  // S1077 mv a4,s3 (PC=0x1154)
      11'd837: state_d_o = 11'd229;  // S1078 li a3,256 (PC=0x1158)
      11'd229: state_d_o = 11'd230;  // S1079 addi a2,s10,1292 (PC=0x115c)
      11'd230: state_d_o = 11'd806;  // S1080 mv a1,s4 (PC=0x1160)
      11'd806: state_d_o = 11'd1483;  // S1081 li a0,14 (PC=0x1164)
      11'd1483: state_d_o = 11'd1512;  // S1082 jal 44c <_nettle_aes_encrypt.part.0> (PC=0x1168)
      11'd193: state_d_o = 11'd194;  // S1083 addi a3,s5,1548 (PC=0x116c)
      11'd194: state_d_o = 11'd823;  // S1084 mv a2,s0 (PC=0x1170)
      11'd823: state_d_o = 11'd807;  // S1085 li a1,8 (PC=0x1174)
      11'd807: state_d_o = 11'd977;  // S1086 li a0,14 (PC=0x1178)
      11'd977: state_d_o = 11'd1484;  // S1087 sw s2,500(s1) (PC=0x117c)
      11'd1484: state_d_o = 11'd88;  // S1088 jal 2c0 <_aes_set_key.part.0> (PC=0x1180)
      11'd195: state_d_o = 11'd196;  // S1089 mv a2,s0 (PC=0x1184)
      11'd196: state_d_o = 11'd808;  // S1090 mv a1,s0 (PC=0x1188)
      11'd808: state_d_o = 11'd1485;  // S1091 li a0,14 (PC=0x118c)
      11'd1485: state_d_o = 11'd665;  // S1092 jal f68 <_nettle_aes_invert> (PC=0x1190)
      11'd62: state_d_o = 11'd231;  // S1093 mv a5,s3 (PC=0x1194)
      11'd231: state_d_o = 11'd838;  // S1094 mv a4,s7 (PC=0x1198)
      11'd838: state_d_o = 11'd232;  // S1095 li a3,256 (PC=0x119c)
      11'd232: state_d_o = 11'd197;  // S1096 addi a2,s9,1036 (PC=0x11a0)
      11'd197: state_d_o = 11'd809;  // S1097 mv a1,s0 (PC=0x11a4)
      11'd809: state_d_o = 11'd233;  // S1098 li a0,14 (PC=0x11a8)
      11'd233: state_d_o = 11'd978;  // S1099 addi s11,s11,1 (PC=0x11ac)
      11'd978: state_d_o = 11'd1486;  // S1100 sw s2,500(s1) (PC=0x11b0)
      11'd1486: state_d_o = 11'd1513;  // S1101 jal 9a8 <_nettle_aes_decrypt.part.0> (PC=0x11b4)
      11'd1548: state_d_o = branch_decision_i ? 11'd192 : 11'd314;  // S1102
      11'd314: state_d_o = 11'd414;  // S1103 lw a5,8(sp) (PC=0x11bc)
      11'd414: state_d_o = 11'd41;  // S1104 lw a4,12(sp) (PC=0x11c0)
      11'd41: state_d_o = 11'd904;  // S1105 addi a5,a5,1 (PC=0x11c4)
      11'd904: state_d_o = 11'd1549;  // S1106 sw a5,8(sp) (PC=0x11c8)
      11'd1549: state_d_o = branch_decision_i ? 11'd858 : 11'd261;  // S1107
      11'd261: state_d_o = 11'd276;  // S1108 lw s0,72(sp) (PC=0x11d0)
      11'd276: state_d_o = 11'd306;  // S1109 lw s1,68(sp) (PC=0x11d4)
      11'd306: state_d_o = 11'd318;  // S1110 lw s2,64(sp) (PC=0x11d8)
      11'd318: state_d_o = 11'd322;  // S1111 lw s3,60(sp) (PC=0x11dc)
      11'd322: state_d_o = 11'd326;  // S1112 lw s4,56(sp) (PC=0x11e0)
      11'd326: state_d_o = 11'd330;  // S1113 lw s5,52(sp) (PC=0x11e4)
      11'd330: state_d_o = 11'd334;  // S1114 lw s6,48(sp) (PC=0x11e8)
      11'd334: state_d_o = 11'd284;  // S1115 lw s7,44(sp) (PC=0x11ec)
      11'd284: state_d_o = 11'd292;  // S1116 lw s8,40(sp) (PC=0x11f0)
      11'd292: state_d_o = 11'd300;  // S1117 lw s9,36(sp) (PC=0x11f4)
      11'd300: state_d_o = 11'd338;  // S1118 lw s10,32(sp) (PC=0x11f8)
      11'd338: state_d_o = 11'd268;  // S1119 lw s11,28(sp) (PC=0x11fc)
      11'd268: state_d_o = 11'd810;  // S1120 lw ra,76(sp) (PC=0x1200)
      11'd810: state_d_o = 11'd13;  // S1121 li a0,0 (PC=0x1204)
      11'd13: state_d_o = 11'd1463;  // S1122 addi sp,sp,80 (PC=0x1208)
      11'd1463: state_d_o = rf_rdata_a_i[10:0];  // S1123 ret
      11'd14: state_d_o = 11'd932;  // S1124 addi sp,sp,-16 (PC=0x1210)
      11'd932: state_d_o = 11'd415;  // S1125 sw s1,4(sp) (PC=0x1214)
      11'd415: state_d_o = 11'd917;  // S1126 lw s1,0(a1) (PC=0x1218)
      11'd917: state_d_o = 11'd234;  // S1127 sw s0,8(sp) (PC=0x121c)
      11'd234: state_d_o = 11'd113;  // S1128 addi a2,a1,4 (PC=0x1220)
      11'd113: state_d_o = 11'd198;  // S1129 mv s0,a0 (PC=0x1224)
      11'd198: state_d_o = 11'd152;  // S1130 addi a1,a0,4 (PC=0x1228)
      11'd152: state_d_o = 11'd924;  // S1131 mv a0,s1 (PC=0x122c)
      11'd924: state_d_o = 11'd1487;  // S1132 sw ra,12(sp) (PC=0x1230)
      11'd1487: state_d_o = 11'd665;  // S1133 jal f68 <_nettle_aes_invert> (PC=0x1234)
      11'd269: state_d_o = 11'd980;  // S1134 lw ra,12(sp) (PC=0x1238)
      11'd980: state_d_o = 11'd262;  // S1135 sw s1,0(s0) (PC=0x123c)
      11'd262: state_d_o = 11'd277;  // S1136 lw s0,8(sp) (PC=0x1240)
      11'd277: state_d_o = 11'd15;  // S1137 lw s1,4(sp) (PC=0x1244)
      11'd15: state_d_o = 11'd1464;  // S1138 addi sp,sp,16 (PC=0x1248)
      11'd1464: state_d_o = rf_rdata_a_i[10:0];  // S1139 ret
      11'd785: state_d_o = 11'd1571;  // S1140 li a5,15 (PC=0x1250)
      11'd1571: state_d_o = branch_decision_i ? 11'd1425 : 11'd786;  // S1141
      11'd786: state_d_o = 11'd1572;  // S1142 li a5,32 (PC=0x1258)
      11'd1572: state_d_o = branch_decision_i ? 11'd16 : 11'd1424;  // S1143
      11'd1424: state_d_o = 11'd1424;  // S1144 j 1260 <aes_set_decrypt_key+0x10> (PC=0x1260)
      11'd1425: state_d_o = 11'd1425;  // S1145 j 1264 <aes_set_decrypt_key+0x14> (PC=0x1264)
      11'd16: state_d_o = 11'd918;  // S1146 addi sp,sp,-16 (PC=0x1268)
      11'd918: state_d_o = 11'd925;  // S1147 sw s0,8(sp) (PC=0x126c)
      11'd925: state_d_o = 11'd933;  // S1148 sw ra,12(sp) (PC=0x1270)
      11'd933: state_d_o = 11'd939;  // S1149 sw s1,4(sp) (PC=0x1274)
      11'd939: state_d_o = 11'd114;  // S1150 sw s2,0(sp) (PC=0x1278)
      11'd114: state_d_o = 11'd1665;  // S1151 mv s0,a0 (PC=0x127c)
      11'd1665: state_d_o = branch_decision_i ? 11'd834 : 11'd787;  // S1152
      11'd787: state_d_o = 11'd1573;  // S1153 li a5,23 (PC=0x1284)
      11'd1573: state_d_o = branch_decision_i ? 11'd835 : 11'd833;  // S1154
      11'd833: state_d_o = 11'd824;  // S1155 li s1,12 (PC=0x128c)
      11'd824: state_d_o = 11'd235;  // S1156 li a1,6 (PC=0x1290)
      11'd235: state_d_o = 11'd981;  // S1157 addi s2,s0,4 (PC=0x1294)
      11'd981: state_d_o = 11'd191;  // S1158 sw s1,0(s0) (PC=0x1298)
      11'd191: state_d_o = 11'd153;  // S1159 mv a3,a2 (PC=0x129c)
      11'd153: state_d_o = 11'd200;  // S1160 mv a0,s1 (PC=0x12a0)
      11'd200: state_d_o = 11'd1488;  // S1161 mv a2,s2 (PC=0x12a4)
      11'd1488: state_d_o = 11'd88;  // S1162 jal 2c0 <_aes_set_key.part.0> (PC=0x12a8)
      11'd201: state_d_o = 11'd236;  // S1163 mv a2,s2 (PC=0x12ac)
      11'd236: state_d_o = 11'd154;  // S1164 mv a1,s2 (PC=0x12b0)
      11'd154: state_d_o = 11'd1489;  // S1165 mv a0,s1 (PC=0x12b4)
      11'd1489: state_d_o = 11'd665;  // S1166 jal f68 <_nettle_aes_invert> (PC=0x12b8)
      11'd270: state_d_o = 11'd982;  // S1167 lw ra,12(sp) (PC=0x12bc)
      11'd982: state_d_o = 11'd263;  // S1168 sw s1,0(s0) (PC=0x12c0)
      11'd263: state_d_o = 11'd278;  // S1169 lw s0,8(sp) (PC=0x12c4)
      11'd278: state_d_o = 11'd307;  // S1170 lw s1,4(sp) (PC=0x12c8)
      11'd307: state_d_o = 11'd17;  // S1171 lw s2,0(sp) (PC=0x12cc)
      11'd17: state_d_o = 11'd1465;  // S1172 addi sp,sp,16 (PC=0x12d0)
      11'd1465: state_d_o = rf_rdata_a_i[10:0];  // S1173 ret
      11'd834: state_d_o = 11'd825;  // S1174 li s1,14 (PC=0x12d8)
      11'd825: state_d_o = 11'd1426;  // S1175 li a1,8 (PC=0x12dc)
      11'd1426: state_d_o = 11'd235;  // S1176 j 1294 <aes_set_decrypt_key+0x44> (PC=0x12e0)
      11'd835: state_d_o = 11'd826;  // S1177 li s1,10 (PC=0x12e4)
      11'd826: state_d_o = 11'd1427;  // S1178 li a1,4 (PC=0x12e8)
      11'd1427: state_d_o = 11'd235;  // S1179 j 1294 <aes_set_decrypt_key+0x44> (PC=0x12ec)
      11'd1172: state_d_o = 11'd1601;  // S1180 andi a6,a3,15 (PC=0x12f0)
      11'd1601: state_d_o = branch_decision_i ? 11'd1429 : 11'd1428;  // S1181
      11'd1428: state_d_o = 11'd1512;  // S1182 j 44c <_nettle_aes_encrypt.part.0> (PC=0x12f8)
      11'd1429: state_d_o = 11'd1429;  // S1183 j 12fc <_nettle_aes_encrypt+0xc> (PC=0x12fc)
      11'd1173: state_d_o = 11'd1602;  // S1184 andi a6,a3,15 (PC=0x1300)
      11'd1602: state_d_o = branch_decision_i ? 11'd1431 : 11'd1430;  // S1185
      11'd1430: state_d_o = 11'd1513;  // S1186 j 9a8 <_nettle_aes_decrypt.part.0> (PC=0x1308)
      11'd1431: state_d_o = 11'd1431;  // S1187 j 130c <_nettle_aes_decrypt+0xc> (PC=0x130c)
      11'd1149: state_d_o = 11'd202;  // S1188 andi a5,a1,15 (PC=0x1310)
      11'd202: state_d_o = 11'd1514;  // S1189 mv a6,a0 (PC=0x1314)
      11'd1514: state_d_o = branch_decision_i ? 11'd394 : 11'd1432;  // S1190
      11'd1432: state_d_o = 11'd1432;  // S1191 j 131c <aes_encrypt+0xc> (PC=0x131c)
      11'd394: state_d_o = 11'd204;  // S1192 lw a0,0(a0) (PC=0x1320)
      11'd204: state_d_o = 11'd829;  // S1193 mv a4,a2 (PC=0x1324)
      11'd829: state_d_o = 11'd149;  // S1194 lui a2,0x11 (PC=0x1328)
      11'd149: state_d_o = 11'd51;  // S1195 mv a5,a3 (PC=0x132c)
      11'd51: state_d_o = 11'd145;  // S1196 addi a2,a2,1292 (PC=0x1330)
      11'd145: state_d_o = 11'd206;  // S1197 mv a3,a1 (PC=0x1334)
      11'd206: state_d_o = 11'd1433;  // S1198 addi a1,a6,4 (PC=0x1338)
      11'd1433: state_d_o = 11'd1512;  // S1199 j 44c <_nettle_aes_encrypt.part.0> (PC=0x133c)
      11'd1150: state_d_o = 11'd203;  // S1200 andi a5,a1,15 (PC=0x1340)
      11'd203: state_d_o = 11'd1515;  // S1201 mv a6,a0 (PC=0x1344)
      11'd1515: state_d_o = branch_decision_i ? 11'd395 : 11'd1434;  // S1202
      11'd1434: state_d_o = 11'd1434;  // S1203 j 134c <aes_decrypt+0xc> (PC=0x134c)
      11'd395: state_d_o = 11'd205;  // S1204 lw a0,0(a0) (PC=0x1350)
      11'd205: state_d_o = 11'd830;  // S1205 mv a4,a2 (PC=0x1354)
      11'd830: state_d_o = 11'd150;  // S1206 lui a2,0x10 (PC=0x1358)
      11'd150: state_d_o = 11'd52;  // S1207 mv a5,a3 (PC=0x135c)
      11'd52: state_d_o = 11'd146;  // S1208 addi a2,a2,1036 (PC=0x1360)
      11'd146: state_d_o = 11'd207;  // S1209 mv a3,a1 (PC=0x1364)
      11'd207: state_d_o = 11'd1435;  // S1210 addi a1,a6,4 (PC=0x1368)
      11'd1435: state_d_o = 11'd1513;  // S1211 j 9a8 <_nettle_aes_decrypt.part.0> (PC=0x136c)
      11'd861: state_d_o = 11'd831;  // S1212 lui t3,0x13 (PC=0x1370)
      11'd831: state_d_o = 11'd76;  // S1213 lui a2,0x12 (PC=0x1374)
      11'd76: state_d_o = 11'd53;  // S1214 addi t3,t3,-2004 (PC=0x1378)
      11'd53: state_d_o = 11'd237;  // S1215 addi a2,a2,1548 (PC=0x137c)
      11'd237: state_d_o = 11'd161;  // S1216 addi a3,t3,244 (PC=0x1380)
      11'd161: state_d_o = 11'd238;  // S1217 addi a6,a2,288 (PC=0x1384)
      11'd238: state_d_o = 11'd54;  // S1218 addi a1,t3,744 (PC=0x1388)
      11'd54: state_d_o = 11'd77;  // S1219 addi a2,a2,32 (PC=0x138c)
      11'd77: state_d_o = 11'd811;  // S1220 addi t3,t3,500 (PC=0x1390)
      11'd811: state_d_o = 11'd1041;  // S1221 li a0,1 (PC=0x1394)
      11'd1041: state_d_o = 11'd1106;  // S1222 lbu a4,0(a3) (PC=0x1398)
      11'd1106: state_d_o = 11'd1107;  // S1223 lbu t1,0(a6) (PC=0x139c)
      11'd1107: state_d_o = 11'd1108;  // S1224 lbu a5,0(a2) (PC=0x13a0)
      11'd1108: state_d_o = 11'd1634;  // S1225 lbu a7,0(a1) (PC=0x13a4)
      11'd1634: state_d_o = 11'd1697;  // S1226 sub a4,a4,t1 (PC=0x13a8)
      11'd1697: state_d_o = 11'd1635;  // S1227 seqz a4,a4 (PC=0x13ac)
      11'd1635: state_d_o = 11'd1792;  // S1228 sub a5,a5,a7 (PC=0x13b0)
      11'd1792: state_d_o = 11'd1698;  // S1229 neg a4,a4 (PC=0x13b4)
      11'd1698: state_d_o = 11'd1824;  // S1230 seqz a5,a5 (PC=0x13b8)
      11'd1824: state_d_o = 11'd1793;  // S1231 and a0,a0,a4 (PC=0x13bc)
      11'd1793: state_d_o = 11'd100;  // S1232 neg a5,a5 (PC=0x13c0)
      11'd100: state_d_o = 11'd1825;  // S1233 addi a3,a3,1 (PC=0x13c4)
      11'd1825: state_d_o = 11'd69;  // S1234 and a0,a0,a5 (PC=0x13c8)
      11'd69: state_d_o = 11'd55;  // S1235 addi a6,a6,1 (PC=0x13cc)
      11'd55: state_d_o = 11'd142;  // S1236 addi a2,a2,1 (PC=0x13d0)
      11'd142: state_d_o = 11'd1550;  // S1237 addi a1,a1,1 (PC=0x13d4)
      11'd1550: state_d_o = branch_decision_i ? 11'd1041 : 11'd1466;  // S1238
      11'd1466: state_d_o = rf_rdata_a_i[10:0];  // S1239 ret
      11'd1467: state_d_o = rf_rdata_a_i[10:0];  // S1240 ret
      11'd199: state_d_o = 11'd812;  // S1241 mv a1,a0 (PC=0x13e4)
      11'd812: state_d_o = 11'd1436;  // S1242 li a0,1 (PC=0x13e8)
      11'd1436: state_d_o = 11'd12;  // S1243 j 10b0 <benchmark_body> (PC=0x13ec)
      11'd827: state_d_o = 11'd813;  // S1244 li a1,1 (PC=0x13f0)
      11'd813: state_d_o = 11'd1437;  // S1245 li a0,76 (PC=0x13f4)
      11'd1437: state_d_o = 11'd12;  // S1246 j 10b0 <benchmark_body> (PC=0x13f8)
      default: ;
    endcase
  end
endmodule

module fsm_dec import ibex_pkg::*; #(
  parameter bit WritebackStage = 1'b1
) (
  input  logic        clk_i,
  input  logic        rst_ni,
  input  logic        ex_valid_i,
  input  logic        lsu_resp_valid_i,
  input  logic        lsu_rdata_valid_i,
  input  logic        ready_wb_i,
  input  logic        outstanding_load_wb_i,
  input  logic        outstanding_store_wb_i,
  input  logic [31:0] rf_rdata_a_i,
  input  logic [31:0] rf_rdata_b_i,
  input  logic [31:0] rf_wdata_fwd_wb_i,
  input  logic        rf_write_wb_i,
  input  logic [4:0]  rf_waddr_wb_i,
  input  logic [31:0] result_ex_i,
  input  logic [31:0] csr_rdata_i,
  input  logic        instr_exec_i,
  input  logic        branch_decision_i,
  input  logic        lsu_req_done_i,
  input  logic        lsu_addr_incr_req_i,
  input  logic [31:0] lsu_addr_last_i,
  input  logic        lsu_load_err_i,
  input  logic        lsu_load_resp_intg_err_i,
  input  logic        lsu_store_err_i,
  input  logic        lsu_store_resp_intg_err_i,
  input  logic        illegal_csr_insn_i,
  input  logic        csr_mstatus_mie_i,
  input  logic        irq_pending_i,
  input  logic [14:0] irqs_i,
  input  logic        irq_nm_i,
  input  logic        debug_req_i,
  input  logic        debug_single_step_i,
  input  logic        debug_ebreakm_i,
  input  logic        debug_ebreaku_i,
  input  logic        trigger_match_i,
  input  logic        priv_mode_i,
  input  logic        csr_mstatus_tw_i,
  input  logic        data_ind_timing_i,
  input  logic        instr_fetch_err_i,
  input  logic        instr_fetch_err_plus2_i,
  input  logic        illegal_c_insn_i,
  input  logic [31:0] pc_id_i,
  input  logic [33:0] imd_val_d_ex_i[2],
  input  logic [1:0]  imd_val_we_ex_i,
  output logic        ctrl_busy_o,
  output logic        illegal_insn_o,
  output logic        instr_first_cycle_id_o,
  output logic        instr_valid_clear_o,
  output logic        id_in_ready_o,
  output logic        instr_req_o,
  output logic        pc_set_o,
  output pc_sel_e     pc_mux_o,
  output logic        nt_branch_mispredict_o,
  output logic [31:0] nt_branch_addr_o,
  output exc_pc_sel_e exc_pc_mux_o,
  output exc_cause_t  exc_cause_o,
  output logic        icache_inval_o,
  output alu_op_e     alu_operator_ex_o,
  output logic [31:0] alu_operand_a_ex_o,
  output logic [31:0] alu_operand_b_ex_o,
  output logic [33:0] imd_val_q_ex_o[2],
  output logic [31:0] bt_a_operand_o,
  output logic [31:0] bt_b_operand_o,
  output logic        mult_en_ex_o,
  output logic        div_en_ex_o,
  output logic        mult_sel_ex_o,
  output logic        div_sel_ex_o,
  output md_op_e      multdiv_operator_ex_o,
  output logic [1:0]  multdiv_signed_mode_ex_o,
  output logic [31:0] multdiv_operand_a_ex_o,
  output logic [31:0] multdiv_operand_b_ex_o,
  output logic        multdiv_ready_id_o,
  output logic        csr_access_o,
  output csr_op_e     csr_op_o,
  output csr_num_e    csr_addr_o,
  output logic        csr_op_en_o,
  output logic        csr_save_if_o,
  output logic        csr_save_id_o,
  output logic        csr_save_wb_o,
  output logic        csr_restore_mret_id_o,
  output logic        csr_restore_dret_id_o,
  output logic        csr_save_cause_o,
  output logic [31:0] csr_mtval_o,
  output logic        lsu_req_o,
  output logic        lsu_we_o,
  output logic [1:0]  lsu_type_o,
  output logic        lsu_sign_ext_o,
  output logic [31:0] lsu_wdata_o,
  output logic        expecting_load_resp_o,
  output logic        expecting_store_resp_o,
  output logic        nmi_mode_o,
  output logic        debug_mode_o,
  output logic        debug_mode_entering_o,
  output dbg_cause_e  debug_cause_o,
  output logic        debug_csr_save_o,
  output logic [4:0]  rf_raddr_a_o,
  output logic [4:0]  rf_raddr_b_o,
  output logic        rf_ren_a_o,
  output logic        rf_ren_b_o,
  output logic [4:0]  rf_waddr_id_o,
  output logic [31:0] rf_wdata_id_o,
  output logic        rf_we_id_o,
  output logic        rf_rd_a_wb_match_o,
  output logic        rf_rd_b_wb_match_o,
  output logic        en_wb_o,
  output wb_instr_type_e instr_type_wb_o,
  output logic        instr_perf_count_id_o,
  output logic        perf_jump_o,
  output logic        perf_branch_o,
  output logic        perf_tbranch_o,
  output logic        perf_dside_wait_o,
  output logic        perf_mul_wait_o,
  output logic        perf_div_wait_o,
  output logic        instr_id_done_o
);

  (* dont_touch = "yes" *) logic [10:0] state_q_w;
  logic [10:0] state_d_w;
  logic [31:0] rf_rdata_a, rf_rdata_b;
  assign rf_rdata_a = rf_rdata_a_i;
  assign rf_rdata_b = rf_rdata_b_i;
  (* dont_touch = "yes" *) logic [10:0] state_q_prev;
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) state_q_prev <= 11'd864;
    else         state_q_prev <= state_q_w;
  end
  (* dont_touch = "yes" *) logic first_cycle;
  assign first_cycle = (state_q_w != state_q_prev);
  (* dont_touch = "yes" *) logic lsu_req_sent;
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni)               lsu_req_sent <= 1'b0;
    else if (lsu_resp_valid_i) lsu_req_sent <= 1'b0;
    else if (first_cycle)      lsu_req_sent <= 1'b1;
  end
  (* dont_touch = "yes" *) logic lsu_req_actual;
  assign lsu_req_actual = first_cycle;
  (* dont_touch = "yes" *) logic [4:0] rf_waddr_latch;
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) rf_waddr_latch <= 5'b0;
    else if (lsu_resp_valid_i & ~lsu_we_o) rf_waddr_latch <= rf_waddr_id_o;
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) state_q_w <= 11'd864;
    else if ((ready_wb_i && ex_valid_i && !(state_q_w == 11'd994 || state_q_w == 11'd920 || state_q_w == 11'd984 || state_q_w == 11'd396 || state_q_w == 11'd264 || state_q_w == 11'd397 || state_q_w == 11'd995 || state_q_w == 11'd986 || state_q_w == 11'd987 || state_q_w == 11'd996 || state_q_w == 11'd997 || state_q_w == 11'd340 || state_q_w == 11'd308 || state_q_w == 11'd398 || state_q_w == 11'd399 || state_q_w == 11'd342 || state_q_w == 11'd988 || state_q_w == 11'd998 || state_q_w == 11'd343 || state_q_w == 11'd989 || state_q_w == 11'd912 || state_q_w == 11'd921 || state_q_w == 11'd1376 || state_q_w == 11'd265 || state_q_w == 11'd256 || state_q_w == 11'd913 || state_q_w == 11'd928 || state_q_w == 11'd922 || state_q_w == 11'd1098 || state_q_w == 11'd1377 || state_q_w == 11'd266 || state_q_w == 11'd257 || state_q_w == 11'd272 || state_q_w == 11'd267 || state_q_w == 11'd258 || state_q_w == 11'd273 || state_q_w == 11'd1099 || state_q_w == 11'd1100 || state_q_w == 11'd1101 || state_q_w == 11'd1040 || state_q_w == 11'd999 || state_q_w == 11'd341 || state_q_w == 11'd1102 || state_q_w == 11'd1024 || state_q_w == 11'd1103 || state_q_w == 11'd1028 || state_q_w == 11'd1104 || state_q_w == 11'd344 || state_q_w == 11'd990 || state_q_w == 11'd1025 || state_q_w == 11'd1032 || state_q_w == 11'd1036 || state_q_w == 11'd1105 || state_q_w == 11'd345 || state_q_w == 11'd991 || state_q_w == 11'd936 || state_q_w == 11'd940 || state_q_w == 11'd896 || state_q_w == 11'd897 || state_q_w == 11'd914 || state_q_w == 11'd898 || state_q_w == 11'd929 || state_q_w == 11'd944 || state_q_w == 11'd948 || state_q_w == 11'd952 || state_q_w == 11'd956 || state_q_w == 11'd960 || state_q_w == 11'd964 || state_q_w == 11'd968 || state_q_w == 11'd972 || state_q_w == 11'd899 || state_q_w == 11'd1042 || state_q_w == 11'd1044 || state_q_w == 11'd1046 || state_q_w == 11'd1048 || state_q_w == 11'd1050 || state_q_w == 11'd1052 || state_q_w == 11'd1054 || state_q_w == 11'd1056 || state_q_w == 11'd1058 || state_q_w == 11'd1060 || state_q_w == 11'd1062 || state_q_w == 11'd1064 || state_q_w == 11'd1066 || state_q_w == 11'd1068 || state_q_w == 11'd1070 || state_q_w == 11'd1072 || state_q_w == 11'd346 || state_q_w == 11'd348 || state_q_w == 11'd350 || state_q_w == 11'd352 || state_q_w == 11'd354 || state_q_w == 11'd400 || state_q_w == 11'd356 || state_q_w == 11'd358 || state_q_w == 11'd360 || state_q_w == 11'd362 || state_q_w == 11'd364 || state_q_w == 11'd366 || state_q_w == 11'd368 || state_q_w == 11'd401 || state_q_w == 11'd402 || state_q_w == 11'd367 || state_q_w == 11'd370 || state_q_w == 11'd372 || state_q_w == 11'd374 || state_q_w == 11'd376 || state_q_w == 11'd378 || state_q_w == 11'd380 || state_q_w == 11'd309 || state_q_w == 11'd382 || state_q_w == 11'd280 || state_q_w == 11'd288 || state_q_w == 11'd296 || state_q_w == 11'd1074 || state_q_w == 11'd1076 || state_q_w == 11'd1078 || state_q_w == 11'd1080 || state_q_w == 11'd1082 || state_q_w == 11'd1033 || state_q_w == 11'd1084 || state_q_w == 11'd1086 || state_q_w == 11'd1088 || state_q_w == 11'd1090 || state_q_w == 11'd1026 || state_q_w == 11'd1092 || state_q_w == 11'd1037 || state_q_w == 11'd1094 || state_q_w == 11'd1029 || state_q_w == 11'd1096 || state_q_w == 11'd384 || state_q_w == 11'd386 || state_q_w == 11'd388 || state_q_w == 11'd390 || state_q_w == 11'd1344 || state_q_w == 11'd1348 || state_q_w == 11'd1352 || state_q_w == 11'd1356 || state_q_w == 11'd1358 || state_q_w == 11'd1360 || state_q_w == 11'd1362 || state_q_w == 11'd1364 || state_q_w == 11'd1366 || state_q_w == 11'd1368 || state_q_w == 11'd1370 || state_q_w == 11'd1372 || state_q_w == 11'd1345 || state_q_w == 11'd1374 || state_q_w == 11'd312 || state_q_w == 11'd1349 || state_q_w == 11'd1353 || state_q_w == 11'd259 || state_q_w == 11'd274 || state_q_w == 11'd304 || state_q_w == 11'd316 || state_q_w == 11'd320 || state_q_w == 11'd324 || state_q_w == 11'd328 || state_q_w == 11'd332 || state_q_w == 11'd281 || state_q_w == 11'd289 || state_q_w == 11'd297 || state_q_w == 11'd336 || state_q_w == 11'd937 || state_q_w == 11'd941 || state_q_w == 11'd900 || state_q_w == 11'd901 || state_q_w == 11'd915 || state_q_w == 11'd902 || state_q_w == 11'd930 || state_q_w == 11'd945 || state_q_w == 11'd949 || state_q_w == 11'd953 || state_q_w == 11'd957 || state_q_w == 11'd961 || state_q_w == 11'd965 || state_q_w == 11'd969 || state_q_w == 11'd973 || state_q_w == 11'd903 || state_q_w == 11'd1043 || state_q_w == 11'd1045 || state_q_w == 11'd1047 || state_q_w == 11'd1049 || state_q_w == 11'd1051 || state_q_w == 11'd1053 || state_q_w == 11'd1055 || state_q_w == 11'd1057 || state_q_w == 11'd1059 || state_q_w == 11'd1061 || state_q_w == 11'd1063 || state_q_w == 11'd1065 || state_q_w == 11'd1069 || state_q_w == 11'd1067 || state_q_w == 11'd1071 || state_q_w == 11'd1073 || state_q_w == 11'd347 || state_q_w == 11'd349 || state_q_w == 11'd351 || state_q_w == 11'd353 || state_q_w == 11'd355 || state_q_w == 11'd403 || state_q_w == 11'd357 || state_q_w == 11'd359 || state_q_w == 11'd361 || state_q_w == 11'd363 || state_q_w == 11'd365 || state_q_w == 11'd392 || state_q_w == 11'd369 || state_q_w == 11'd404 || state_q_w == 11'd405 || state_q_w == 11'd393 || state_q_w == 11'd373 || state_q_w == 11'd383 || state_q_w == 11'd375 || state_q_w == 11'd377 || state_q_w == 11'd371 || state_q_w == 11'd381 || state_q_w == 11'd379 || state_q_w == 11'd310 || state_q_w == 11'd282 || state_q_w == 11'd290 || state_q_w == 11'd298 || state_q_w == 11'd1075 || state_q_w == 11'd1077 || state_q_w == 11'd1079 || state_q_w == 11'd1081 || state_q_w == 11'd1083 || state_q_w == 11'd1034 || state_q_w == 11'd1085 || state_q_w == 11'd1087 || state_q_w == 11'd1089 || state_q_w == 11'd1097 || state_q_w == 11'd1027 || state_q_w == 11'd1093 || state_q_w == 11'd1038 || state_q_w == 11'd1095 || state_q_w == 11'd1091 || state_q_w == 11'd1030 || state_q_w == 11'd385 || state_q_w == 11'd387 || state_q_w == 11'd389 || state_q_w == 11'd391 || state_q_w == 11'd1346 || state_q_w == 11'd1350 || state_q_w == 11'd1354 || state_q_w == 11'd1357 || state_q_w == 11'd1359 || state_q_w == 11'd1361 || state_q_w == 11'd1363 || state_q_w == 11'd1365 || state_q_w == 11'd1367 || state_q_w == 11'd1369 || state_q_w == 11'd1371 || state_q_w == 11'd1373 || state_q_w == 11'd1347 || state_q_w == 11'd1375 || state_q_w == 11'd313 || state_q_w == 11'd1351 || state_q_w == 11'd1355 || state_q_w == 11'd260 || state_q_w == 11'd275 || state_q_w == 11'd305 || state_q_w == 11'd317 || state_q_w == 11'd321 || state_q_w == 11'd325 || state_q_w == 11'd329 || state_q_w == 11'd333 || state_q_w == 11'd283 || state_q_w == 11'd291 || state_q_w == 11'd299 || state_q_w == 11'd337 || state_q_w == 11'd992 || state_q_w == 11'd406 || state_q_w == 11'd1000 || state_q_w == 11'd407 || state_q_w == 11'd408 || state_q_w == 11'd409 || state_q_w == 11'd410 || state_q_w == 11'd411 || state_q_w == 11'd993 || state_q_w == 11'd412 || state_q_w == 11'd413 || state_q_w == 11'd1001 || state_q_w == 11'd1002 || state_q_w == 11'd923 || state_q_w == 11'd985 || state_q_w == 11'd931 || state_q_w == 11'd942 || state_q_w == 11'd946 || state_q_w == 11'd958 || state_q_w == 11'd962 || state_q_w == 11'd916 || state_q_w == 11'd938 || state_q_w == 11'd950 || state_q_w == 11'd954 || state_q_w == 11'd966 || state_q_w == 11'd970 || state_q_w == 11'd974 || state_q_w == 11'd1003 || state_q_w == 11'd976 || state_q_w == 11'd977 || state_q_w == 11'd978 || state_q_w == 11'd314 || state_q_w == 11'd414 || state_q_w == 11'd904 || state_q_w == 11'd261 || state_q_w == 11'd276 || state_q_w == 11'd306 || state_q_w == 11'd318 || state_q_w == 11'd322 || state_q_w == 11'd326 || state_q_w == 11'd330 || state_q_w == 11'd334 || state_q_w == 11'd284 || state_q_w == 11'd292 || state_q_w == 11'd300 || state_q_w == 11'd338 || state_q_w == 11'd268 || state_q_w == 11'd932 || state_q_w == 11'd415 || state_q_w == 11'd917 || state_q_w == 11'd924 || state_q_w == 11'd269 || state_q_w == 11'd980 || state_q_w == 11'd262 || state_q_w == 11'd277 || state_q_w == 11'd918 || state_q_w == 11'd925 || state_q_w == 11'd933 || state_q_w == 11'd939 || state_q_w == 11'd981 || state_q_w == 11'd270 || state_q_w == 11'd982 || state_q_w == 11'd263 || state_q_w == 11'd278 || state_q_w == 11'd307 || state_q_w == 11'd394 || state_q_w == 11'd395 || state_q_w == 11'd1041 || state_q_w == 11'd1106 || state_q_w == 11'd1107 || state_q_w == 11'd1108)) ||
            ((state_q_w == 11'd994 || state_q_w == 11'd920 || state_q_w == 11'd984 || state_q_w == 11'd995 || state_q_w == 11'd986 || state_q_w == 11'd987 || state_q_w == 11'd996 || state_q_w == 11'd997 || state_q_w == 11'd988 || state_q_w == 11'd998 || state_q_w == 11'd989 || state_q_w == 11'd912 || state_q_w == 11'd921 || state_q_w == 11'd1376 || state_q_w == 11'd913 || state_q_w == 11'd928 || state_q_w == 11'd922 || state_q_w == 11'd1377 || state_q_w == 11'd999 || state_q_w == 11'd990 || state_q_w == 11'd991 || state_q_w == 11'd936 || state_q_w == 11'd940 || state_q_w == 11'd896 || state_q_w == 11'd897 || state_q_w == 11'd914 || state_q_w == 11'd898 || state_q_w == 11'd929 || state_q_w == 11'd944 || state_q_w == 11'd948 || state_q_w == 11'd952 || state_q_w == 11'd956 || state_q_w == 11'd960 || state_q_w == 11'd964 || state_q_w == 11'd968 || state_q_w == 11'd972 || state_q_w == 11'd899 || state_q_w == 11'd1344 || state_q_w == 11'd1348 || state_q_w == 11'd1352 || state_q_w == 11'd1356 || state_q_w == 11'd1358 || state_q_w == 11'd1360 || state_q_w == 11'd1362 || state_q_w == 11'd1364 || state_q_w == 11'd1366 || state_q_w == 11'd1368 || state_q_w == 11'd1370 || state_q_w == 11'd1372 || state_q_w == 11'd1345 || state_q_w == 11'd1374 || state_q_w == 11'd1349 || state_q_w == 11'd1353 || state_q_w == 11'd937 || state_q_w == 11'd941 || state_q_w == 11'd900 || state_q_w == 11'd901 || state_q_w == 11'd915 || state_q_w == 11'd902 || state_q_w == 11'd930 || state_q_w == 11'd945 || state_q_w == 11'd949 || state_q_w == 11'd953 || state_q_w == 11'd957 || state_q_w == 11'd961 || state_q_w == 11'd965 || state_q_w == 11'd969 || state_q_w == 11'd973 || state_q_w == 11'd903 || state_q_w == 11'd1346 || state_q_w == 11'd1350 || state_q_w == 11'd1354 || state_q_w == 11'd1357 || state_q_w == 11'd1359 || state_q_w == 11'd1361 || state_q_w == 11'd1363 || state_q_w == 11'd1365 || state_q_w == 11'd1367 || state_q_w == 11'd1369 || state_q_w == 11'd1371 || state_q_w == 11'd1373 || state_q_w == 11'd1347 || state_q_w == 11'd1375 || state_q_w == 11'd1351 || state_q_w == 11'd1355 || state_q_w == 11'd992 || state_q_w == 11'd1000 || state_q_w == 11'd993 || state_q_w == 11'd1001 || state_q_w == 11'd1002 || state_q_w == 11'd923 || state_q_w == 11'd985 || state_q_w == 11'd931 || state_q_w == 11'd942 || state_q_w == 11'd946 || state_q_w == 11'd958 || state_q_w == 11'd962 || state_q_w == 11'd916 || state_q_w == 11'd938 || state_q_w == 11'd950 || state_q_w == 11'd954 || state_q_w == 11'd966 || state_q_w == 11'd970 || state_q_w == 11'd974 || state_q_w == 11'd1003 || state_q_w == 11'd976 || state_q_w == 11'd977 || state_q_w == 11'd978 || state_q_w == 11'd904 || state_q_w == 11'd932 || state_q_w == 11'd917 || state_q_w == 11'd924 || state_q_w == 11'd980 || state_q_w == 11'd918 || state_q_w == 11'd925 || state_q_w == 11'd933 || state_q_w == 11'd939 || state_q_w == 11'd981 || state_q_w == 11'd982) && lsu_resp_valid_i && !first_cycle) ||
            ((state_q_w == 11'd396 || state_q_w == 11'd264 || state_q_w == 11'd397 || state_q_w == 11'd340 || state_q_w == 11'd308 || state_q_w == 11'd398 || state_q_w == 11'd399 || state_q_w == 11'd342 || state_q_w == 11'd343 || state_q_w == 11'd265 || state_q_w == 11'd256 || state_q_w == 11'd1098 || state_q_w == 11'd266 || state_q_w == 11'd257 || state_q_w == 11'd272 || state_q_w == 11'd267 || state_q_w == 11'd258 || state_q_w == 11'd273 || state_q_w == 11'd1099 || state_q_w == 11'd1100 || state_q_w == 11'd1101 || state_q_w == 11'd1040 || state_q_w == 11'd341 || state_q_w == 11'd1102 || state_q_w == 11'd1024 || state_q_w == 11'd1103 || state_q_w == 11'd1028 || state_q_w == 11'd1104 || state_q_w == 11'd344 || state_q_w == 11'd1025 || state_q_w == 11'd1032 || state_q_w == 11'd1036 || state_q_w == 11'd1105 || state_q_w == 11'd345 || state_q_w == 11'd1042 || state_q_w == 11'd1044 || state_q_w == 11'd1046 || state_q_w == 11'd1048 || state_q_w == 11'd1050 || state_q_w == 11'd1052 || state_q_w == 11'd1054 || state_q_w == 11'd1056 || state_q_w == 11'd1058 || state_q_w == 11'd1060 || state_q_w == 11'd1062 || state_q_w == 11'd1064 || state_q_w == 11'd1066 || state_q_w == 11'd1068 || state_q_w == 11'd1070 || state_q_w == 11'd1072 || state_q_w == 11'd346 || state_q_w == 11'd348 || state_q_w == 11'd350 || state_q_w == 11'd352 || state_q_w == 11'd354 || state_q_w == 11'd400 || state_q_w == 11'd356 || state_q_w == 11'd358 || state_q_w == 11'd360 || state_q_w == 11'd362 || state_q_w == 11'd364 || state_q_w == 11'd366 || state_q_w == 11'd368 || state_q_w == 11'd401 || state_q_w == 11'd402 || state_q_w == 11'd367 || state_q_w == 11'd370 || state_q_w == 11'd372 || state_q_w == 11'd374 || state_q_w == 11'd376 || state_q_w == 11'd378 || state_q_w == 11'd380 || state_q_w == 11'd309 || state_q_w == 11'd382 || state_q_w == 11'd280 || state_q_w == 11'd288 || state_q_w == 11'd296 || state_q_w == 11'd1074 || state_q_w == 11'd1076 || state_q_w == 11'd1078 || state_q_w == 11'd1080 || state_q_w == 11'd1082 || state_q_w == 11'd1033 || state_q_w == 11'd1084 || state_q_w == 11'd1086 || state_q_w == 11'd1088 || state_q_w == 11'd1090 || state_q_w == 11'd1026 || state_q_w == 11'd1092 || state_q_w == 11'd1037 || state_q_w == 11'd1094 || state_q_w == 11'd1029 || state_q_w == 11'd1096 || state_q_w == 11'd384 || state_q_w == 11'd386 || state_q_w == 11'd388 || state_q_w == 11'd390 || state_q_w == 11'd312 || state_q_w == 11'd259 || state_q_w == 11'd274 || state_q_w == 11'd304 || state_q_w == 11'd316 || state_q_w == 11'd320 || state_q_w == 11'd324 || state_q_w == 11'd328 || state_q_w == 11'd332 || state_q_w == 11'd281 || state_q_w == 11'd289 || state_q_w == 11'd297 || state_q_w == 11'd336 || state_q_w == 11'd1043 || state_q_w == 11'd1045 || state_q_w == 11'd1047 || state_q_w == 11'd1049 || state_q_w == 11'd1051 || state_q_w == 11'd1053 || state_q_w == 11'd1055 || state_q_w == 11'd1057 || state_q_w == 11'd1059 || state_q_w == 11'd1061 || state_q_w == 11'd1063 || state_q_w == 11'd1065 || state_q_w == 11'd1069 || state_q_w == 11'd1067 || state_q_w == 11'd1071 || state_q_w == 11'd1073 || state_q_w == 11'd347 || state_q_w == 11'd349 || state_q_w == 11'd351 || state_q_w == 11'd353 || state_q_w == 11'd355 || state_q_w == 11'd403 || state_q_w == 11'd357 || state_q_w == 11'd359 || state_q_w == 11'd361 || state_q_w == 11'd363 || state_q_w == 11'd365 || state_q_w == 11'd392 || state_q_w == 11'd369 || state_q_w == 11'd404 || state_q_w == 11'd405 || state_q_w == 11'd393 || state_q_w == 11'd373 || state_q_w == 11'd383 || state_q_w == 11'd375 || state_q_w == 11'd377 || state_q_w == 11'd371 || state_q_w == 11'd381 || state_q_w == 11'd379 || state_q_w == 11'd310 || state_q_w == 11'd282 || state_q_w == 11'd290 || state_q_w == 11'd298 || state_q_w == 11'd1075 || state_q_w == 11'd1077 || state_q_w == 11'd1079 || state_q_w == 11'd1081 || state_q_w == 11'd1083 || state_q_w == 11'd1034 || state_q_w == 11'd1085 || state_q_w == 11'd1087 || state_q_w == 11'd1089 || state_q_w == 11'd1097 || state_q_w == 11'd1027 || state_q_w == 11'd1093 || state_q_w == 11'd1038 || state_q_w == 11'd1095 || state_q_w == 11'd1091 || state_q_w == 11'd1030 || state_q_w == 11'd385 || state_q_w == 11'd387 || state_q_w == 11'd389 || state_q_w == 11'd391 || state_q_w == 11'd313 || state_q_w == 11'd260 || state_q_w == 11'd275 || state_q_w == 11'd305 || state_q_w == 11'd317 || state_q_w == 11'd321 || state_q_w == 11'd325 || state_q_w == 11'd329 || state_q_w == 11'd333 || state_q_w == 11'd283 || state_q_w == 11'd291 || state_q_w == 11'd299 || state_q_w == 11'd337 || state_q_w == 11'd406 || state_q_w == 11'd407 || state_q_w == 11'd408 || state_q_w == 11'd409 || state_q_w == 11'd410 || state_q_w == 11'd411 || state_q_w == 11'd412 || state_q_w == 11'd413 || state_q_w == 11'd314 || state_q_w == 11'd414 || state_q_w == 11'd261 || state_q_w == 11'd276 || state_q_w == 11'd306 || state_q_w == 11'd318 || state_q_w == 11'd322 || state_q_w == 11'd326 || state_q_w == 11'd330 || state_q_w == 11'd334 || state_q_w == 11'd284 || state_q_w == 11'd292 || state_q_w == 11'd300 || state_q_w == 11'd338 || state_q_w == 11'd268 || state_q_w == 11'd415 || state_q_w == 11'd269 || state_q_w == 11'd262 || state_q_w == 11'd277 || state_q_w == 11'd270 || state_q_w == 11'd263 || state_q_w == 11'd278 || state_q_w == 11'd307 || state_q_w == 11'd394 || state_q_w == 11'd395 || state_q_w == 11'd1041 || state_q_w == 11'd1106 || state_q_w == 11'd1107 || state_q_w == 11'd1108) && lsu_resp_valid_i && !first_cycle))
      state_q_w <= state_d_w;
  end



  fsm_next_state u_next_state (
    .state_q_i(state_q_w), .branch_decision_i(branch_decision_i),
    .rf_rdata_a_i(rf_rdata_a_i), .state_d_o(state_d_w));

  fsm_decoder u_decoder (
    .state_q_i(state_q_w), .rf_rdata_a_i(rf_rdata_a_i), .rf_rdata_b_i(rf_rdata_b_i),
    .result_ex_i(result_ex_i), .rf_waddr_latch_i(rf_waddr_latch),
    .lsu_req_actual_i(lsu_req_actual), .ex_valid_i(ex_valid_i), .first_cycle_i(first_cycle),
    .rf_raddr_a_o(rf_raddr_a_o), .rf_raddr_b_o(rf_raddr_b_o), .rf_waddr_id_o(rf_waddr_id_o),
    .alu_operand_a_ex_o(alu_operand_a_ex_o),
    .alu_operand_b_ex_o(alu_operand_b_ex_o),
    .alu_operator_ex_o(alu_operator_ex_o),
    .div_en_ex_o(div_en_ex_o),
    .div_sel_ex_o(div_sel_ex_o),
    .en_wb_o(en_wb_o),
    .expecting_load_resp_o(expecting_load_resp_o),
    .instr_type_wb_o(instr_type_wb_o),
    .lsu_req_o(lsu_req_o),
    .lsu_sign_ext_o(lsu_sign_ext_o),
    .lsu_type_o(lsu_type_o),
    .lsu_wdata_o(lsu_wdata_o),
    .lsu_we_o(lsu_we_o),
    .mult_en_ex_o(mult_en_ex_o),
    .mult_sel_ex_o(mult_sel_ex_o),
    .multdiv_operand_a_ex_o(multdiv_operand_a_ex_o),
    .multdiv_operand_b_ex_o(multdiv_operand_b_ex_o),
    .multdiv_operator_ex_o(multdiv_operator_ex_o),
    .multdiv_signed_mode_ex_o(multdiv_signed_mode_ex_o),
    .rf_rd_a_wb_match_o(rf_rd_a_wb_match_o),
    .rf_rd_b_wb_match_o(rf_rd_b_wb_match_o),
    .rf_ren_a_o(rf_ren_a_o),
    .rf_ren_b_o(rf_ren_b_o),
    .rf_wdata_id_o(rf_wdata_id_o),
    .rf_we_id_o(rf_we_id_o)
  );

  assign ctrl_busy_o             = (state_q_w != 11'd1437);
  assign illegal_insn_o          = 1'b0;
  assign instr_first_cycle_id_o  = first_cycle;
  assign instr_valid_clear_o     = 1'b0;
  assign id_in_ready_o           = 1'b1;
  assign instr_req_o             = 1'b0;
  assign pc_set_o                = 1'b0;
  assign pc_mux_o                = PC_BOOT;
  assign nt_branch_mispredict_o  = 1'b0;
  assign nt_branch_addr_o        = '0;
  assign exc_pc_mux_o            = EXC_PC_EXC;
  assign exc_cause_o             = '0;
  assign icache_inval_o          = 1'b0;
  logic [33:0] imd_val_q[2];
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      imd_val_q[0] <= '0;
      imd_val_q[1] <= '0;
    end else if (|imd_val_we_ex_i) begin
      imd_val_q[0] <= imd_val_d_ex_i[0];
      imd_val_q[1] <= imd_val_d_ex_i[1];
    end
  end
  assign imd_val_q_ex_o = imd_val_q;
  assign bt_a_operand_o          = '0;
  assign bt_b_operand_o          = '0;
  assign multdiv_ready_id_o      = 1'b1;
  assign csr_access_o            = 1'b0;
  assign csr_op_o                = CSR_OP_READ;
  assign csr_addr_o              = csr_num_e'(0);
  assign csr_op_en_o             = 1'b0;
  assign csr_save_if_o           = 1'b0;
  assign csr_save_id_o           = 1'b0;
  assign csr_save_wb_o           = 1'b0;
  assign csr_restore_mret_id_o   = 1'b0;
  assign csr_restore_dret_id_o   = 1'b0;
  assign csr_save_cause_o        = 1'b0;
  assign csr_mtval_o             = '0;
  assign expecting_store_resp_o  = 1'b0;
  assign nmi_mode_o              = 1'b0;
  assign debug_mode_o            = 1'b0;
  assign debug_mode_entering_o   = 1'b0;
  assign debug_cause_o           = DBG_CAUSE_NONE;
  assign debug_csr_save_o        = 1'b0;
  assign instr_perf_count_id_o   = 1'b0;
  assign perf_jump_o             = 1'b0;
  assign perf_branch_o           = 1'b0;
  assign perf_tbranch_o          = 1'b0;
  assign perf_dside_wait_o       = 1'b0;
  assign perf_mul_wait_o         = 1'b0;
  assign perf_div_wait_o         = 1'b0;
  assign instr_id_done_o         = 1'b1;

endmodule