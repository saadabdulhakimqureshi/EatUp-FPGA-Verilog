`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 01:41:22 PM
// Design Name: 
// Module Name: clk_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Code your design here
module clk_div(clk, clk_d);
	parameter div_value = 1;
  	input clk;
  	output clk_d;
  	reg clk_d;
  	reg count;
  initial
    begin
      clk_d = 0;
      count = 0;
    end
  always @(posedge clk)
    begin 
      if (count == div_value)
        count <= 0;
      else 
        count <= count + 1;
    end
  
  always @(posedge clk)
    begin 
      if (count == div_value)
        clk_d <= ~ clk_d;
    end
endmodule