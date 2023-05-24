`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 02:22:07 PM
// Design Name: 
// Module Name: random
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


module random(
    
    );
    integer y;
    integer x;
    initial begin
	y = {$random} %400 + 15 ; // random numbers between 0 and 9.
	x = {$random} %600 + 15 ;
    end
endmodule
