`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 01:01:19 PM
// Design Name: 
// Module Name: gamestate
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


module gamestate(input C, 
input D, 
input E,
input clk, 
input reset,
output gamemenu,
output gamerun,
output gamepause
    );
    wire dA, dB, A, B, clk_d;
//    clk_div_1_second g1(clk, clk_d);
//    assign dA = AE + AC'D' + ACD + BC'D'E;
    assign dA = A&E | A&~C&~D | A&C&D | B&~C&~D&E;
    dff g2(clk, reset, dA, A, ~A);
    
//    assign dB = BE' + BD + BC + CD'E';
    assign dB = B&~E | B&D | B&C | C&~D&~E;
    dff g3(clk, reset, dB, B, ~B);
    
    assign gamemenu = ~A&~B;
    assign gamepause = A;
    assign gamerun = B;
endmodule
