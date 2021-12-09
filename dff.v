`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 01:05:36 PM
// Design Name: 
// Module Name: dff
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


module dff (clk, reset,
  d, q, qb);
  input      clk;
  input      reset;
  input      d;
  output     q;
  output     qb;

  reg        q;

  assign qb = ~q;

  always @(posedge clk or posedge reset)
  begin
    if (reset) begin
      // Asynchronous reset when reset goes high
      q <= 1'b0;
    end else begin
      // Assign D to Q on positive clock edge
      q <= d;
    end
  end
endmodule
