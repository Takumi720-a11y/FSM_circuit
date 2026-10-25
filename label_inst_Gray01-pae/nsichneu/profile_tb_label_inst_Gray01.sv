`timescale 1ns/1ps
module profile_tb;
  reg clk=0, rst=0;
  always #5 clk=~clk;
  reg [31:0] memory [0:32767];
  wire req, we; wire [3:0] be; wire [31:0] addr, wdata;
  reg valid=0; reg [31:0] rdata=0;
  wire [4:0] ra, rb, rd; wire rw; wire [31:0] rfa, rfb, rfdata;
  wire dummy_id, dummy_wb;
  integer f, cycle=0; reg [14-1:0] last;
  ibex_register_file_ff rf(.clk_i(clk),.rst_ni(rst),.test_en_i(1'b0),
    .dummy_instr_id_i(dummy_id),.dummy_instr_wb_i(dummy_wb),
    .raddr_a_i(ra),.raddr_b_i(rb),.rdata_a_o(rfa),.rdata_b_o(rfb),
    .waddr_a_i(rd),.wdata_a_i(rfdata),.we_a_i(rw),.err_o());
  ibex_core #(.RV32M(ibex_pkg::RV32MFast),.WritebackStage(1'b0)) dut(
    .clk_i(clk),.rst_ni(rst),.hart_id_i(32'b0),.boot_addr_i(32'b0),
    .instr_gnt_i(1'b0),.instr_rvalid_i(1'b0),.instr_rdata_i(32'b0),.instr_err_i(1'b0),
    .data_req_o(req),.data_gnt_i(req),.data_rvalid_i(valid),.data_we_o(we),
    .data_be_o(be),.data_addr_o(addr),.data_wdata_o(wdata),.data_rdata_i(rdata),.data_err_i(1'b0),
    .dummy_instr_id_o(dummy_id),.dummy_instr_wb_o(dummy_wb),
    .rf_raddr_a_o(ra),.rf_raddr_b_o(rb),.rf_waddr_wb_o(rd),.rf_we_wb_o(rw),
    .rf_wdata_wb_ecc_o(rfdata),.rf_rdata_a_ecc_i(rfa),.rf_rdata_b_ecc_i(rfb),
    .ic_tag_rdata_i('{default:'0}),.ic_data_rdata_i('{default:'0}),.ic_scr_key_valid_i(1'b0),
    .irq_software_i(1'b0),.irq_timer_i(1'b0),.irq_external_i(1'b0),
    .irq_fast_i(15'b0),.irq_nm_i(1'b0),.debug_req_i(1'b0),.fetch_enable_i(ibex_pkg::IbexMuBiOn));
  always @(posedge clk) begin
    if (!rst) valid <= 0;
    else begin
      valid <= req;
      if (req) begin
        if (addr >= 32'h20000) $fatal(1,"memory address outside RAM: %h",addr);
        rdata <= memory[addr[16:2]];
        if (we) for (integer b=0;b<4;b=b+1)
          if(be[b]) memory[addr[16:2]][8*b+:8] <= wdata[8*b+:8];
      end
    end
  end
  initial begin
    $readmemh("C:/Users/shing/OneDrive/デスクトップ/FSM-circuit-main/FSM_circuit-main/label_inst_Gray01-pae/nsichneu/memory_label_inst_Gray01.hex",memory);
    f=$fopen("C:/Users/shing/OneDrive/デスクトップ/FSM-circuit-main/FSM_circuit-main/label_inst_Gray01-pae/nsichneu/cycles_label_inst_Gray01.txt","w");
    if(!f) $fatal(1,"cannot open cycle samples");
    #1; rst=0; #6; rst=1;
  end
  always @(negedge clk) if(rst) begin
    if ($isunknown(dut.fsm_dec_i.state_q)) $fatal(1,"unknown FSM state");
    if(cycle==0 || last!==dut.fsm_dec_i.state_q)
      $fwrite(f,"%0d %h\n",cycle,dut.fsm_dec_i.state_q);
    last=dut.fsm_dec_i.state_q;
    cycle=cycle+1;
    if(dut.fsm_dec_i.state_q == 14'd15104) begin
      if(rf.rf_reg[10] !== 32'b0) $fatal(1,"verify_benchmark/main failed a0=%h",rf.rf_reg[10]);
      $fwrite(f,"END %0d\n",cycle); $fclose(f);
      $display("BENCHMARK_PASS cycles=%0d a0=0",cycle); $finish;
    end
    if(cycle >= 50000000) $fatal(1,"benchmark cycle limit reached");
  end
endmodule
