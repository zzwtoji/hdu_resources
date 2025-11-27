`timescale 1ns / 1ps

module IR (
    rst,
    clk,
    en,
    in,
    out
);
  input rst;
  input clk;
  input en;
  input [31:0] in;
  output reg [31:0] out;

  always @(posedge rst or posedge clk) begin
    if (rst) begin
      out <= 32'h0000_0013;
    end else if (en) begin
      out <= in;
    end
  end

endmodule
