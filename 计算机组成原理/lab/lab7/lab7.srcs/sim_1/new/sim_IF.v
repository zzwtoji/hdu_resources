`timescale 1ns / 1ps

module sim_IF;
  reg rst;
  reg clk; 
  reg IR_Write = 1;
  reg PC_Write = 1;

  wire [31:0] inst; 
  
  IF uut (
      .rst(rst),
      .clk(clk),
      .IR_Write(IR_Write),
      .PC_Write(PC_Write),
      .inst(inst)
  );

  initial begin
    clk = 0;
    rst = 1;
    #1 rst = 0; 
    repeat (100) begin
      #5 clk = ~clk;
    end

  end

endmodule

