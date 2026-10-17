`timescale 1ns/1ps
module riscv_tb;
  reg clk=0, rst=1;
  rv32i_pipeline dut(.clk(clk), .rst(rst));
  always #5 clk = ~clk;
  initial begin
    $dumpfile("waveforms/riscv_pipeline.vcd");
    $dumpvars(0, riscv_tb);
    repeat (3) @(posedge clk);
    rst <= 0;
    repeat (30) @(posedge clk);
    $display("TB_FINISHED: starter smoke test only; add self-checking assertions.");
    $finish;
  end
endmodule
