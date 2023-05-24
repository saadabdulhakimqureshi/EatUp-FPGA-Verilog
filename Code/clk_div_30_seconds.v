`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 02:08:09 AM
// Design Name: 
// Module Name: clk_div_30_seconds
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

module clk_div_30_seconds(clk, clk_d);
    parameter div_value = 1499999999;
    input clk;
    output clk_d;
    reg clk_d;
    reg [50:0] count;
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
