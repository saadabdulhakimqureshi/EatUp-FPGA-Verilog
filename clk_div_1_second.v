`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 12:23:20 PM
// Design Name: 
// Module Name: clk_div_1_second
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


module clk_div_1_second(clk, clk_d);
    parameter div_value = 833332;//Slowing down our clock to update every 1 seconds.
    input clk;
    output clk_d;
    reg clk_d;
    reg [25:0] count;//We will need a 26 bit counter.
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
