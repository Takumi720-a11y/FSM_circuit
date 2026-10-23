// prim_clock_gating wrapper for Xilinx FPGA
module prim_clock_gating #(
  parameter bit NoFpgaGate    = 1'b0,
  parameter bit FpgaBufGlobal = 1'b1
) (
  input        clk_i,
  input        en_i,
  input        test_en_i,
  output logic clk_o
);
  prim_xilinx_clock_gating #(
    .NoFpgaGate   (NoFpgaGate),
    .FpgaBufGlobal(FpgaBufGlobal)
  ) u_impl (
    .clk_i    (clk_i),
    .en_i     (en_i),
    .test_en_i(test_en_i),
    .clk_o    (clk_o)
  );
endmodule
