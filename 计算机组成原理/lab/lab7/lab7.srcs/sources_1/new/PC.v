`timescale 1ns / 1ps

module PC (
    rst,
    clk,
    en, 
    out 
);

  input rst;
  input clk;
  input en;
  output reg [5:0] out;


  wire [31:0] in; 
  reg  [31:0] PC_tmp; 


  ADDER adder (
      .in (PC_tmp),
      .out(in)
  );


  always @(posedge rst or posedge clk) begin
    if (rst) begin
      PC_tmp <= 32'h0000_0000;
      out <= 6'b000000;
    end else if (en) begin
      PC_tmp <= in;
      out <= in[7:2];
    end
  end

endmodule

module ADDER (
    in,
    out
);
  input [31:0] in;
  output [31:0] out;
  assign out = (in == 32'h0000_00FC) ? 32'h0000_0000 : in + 32'h0000_0004;
endmodule
