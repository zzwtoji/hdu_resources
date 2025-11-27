`timescale 1ns / 1ps

module sim;

  reg clk, rst, clk_RR, clk_F, clk_WB;
  reg [4:0] R_Addr_A, R_Addr_B, W_Addr;
  reg [3:0] ALU_OP;
  reg Reg_Write;
  wire [3:0] leds;
  wire [3:0] which;
  wire [7:0] seg;

  TOP uut (
      .clk(clk),
      .rst(rst),
      .clk_RR(clk_RR),
      .clk_F(clk_F),
      .clk_WB(clk_WB),
      .R_Addr_A(R_Addr_A),
      .R_Addr_B(R_Addr_B),
      .W_Addr(W_Addr),
      .ALU_OP(ALU_OP),
      .Reg_Write(Reg_Write),
      .leds(leds),
      .which(which),
      .seg(seg)
  );

  always #5 clk = ~clk;
  always #5 clk_RR = ~clk_RR;
  always #5 clk_F = ~clk_F;
  always #5 clk_WB = ~clk_WB;

  initial begin
    $monitor("Time=%0t rst=%b R_Addr_A=%d R_Addr_B=%d W_Addr=%d ALU_OP=%b Reg_Write=%b Data_A=%h Data_B=%h F=%h leds=%b",
             $time, rst, R_Addr_A, R_Addr_B, W_Addr, ALU_OP, Reg_Write, uut.u1.R_Data_A, uut.u1.R_Data_B, uut.u2.F, leds);

    clk = 0; clk_RR = 0; clk_F = 0; clk_WB = 0;
    rst = 1; Reg_Write = 0;
    R_Addr_A = 0; R_Addr_B = 0; W_Addr = 0;
    ALU_OP = 4'b0000;

    #10 rst = 0;

    #20 R_Addr_A = 5'd1; R_Addr_B = 5'd2;

    #20 ALU_OP = 4'b0000; Reg_Write = 1; W_Addr = 5'd3;
    #30 R_Addr_A = 5'd3;

    #20 R_Addr_A = 5'd2; R_Addr_B = 5'd1; ALU_OP = 4'b1000; W_Addr = 5'd4;
    #30 R_Addr_B = 5'd4;

    #20 W_Addr = 5'd0; ALU_OP = 4'b0000; R_Addr_A = 5'd1; R_Addr_B = 5'd2;
    #30 R_Addr_A = 5'd0;

    #20 R_Addr_A = 5'd3; R_Addr_B = 5'd1; ALU_OP = 4'b0001; W_Addr = 5'd5;
    #30 R_Addr_B = 5'd5;

    #20 R_Addr_A = 5'd1; R_Addr_B = 5'd2; ALU_OP = 4'b1000; W_Addr = 5'd6;
    #30;

    #50 $finish;
  end

endmodule