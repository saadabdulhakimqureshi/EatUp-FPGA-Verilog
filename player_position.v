`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2021 03:41:42 PM
// Design Name: 
// Module Name: player_position
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


module player_position(input up, input down, input left, input right , input [5:0] r, input clk, input gamemenu, input gamerun, input gamepause, output [9:0] x, output [9:0] y);
  reg [9:0] pos_x;
  reg [9:0] pos_y;
  always @(posedge clk) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
//        pos_x = {$random}%626 + 1;
//        pos_y = 480;
        pos_x = 320;
        pos_y = 240;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin
        if (up == 1 && pos_y - 25 >= 15)
            pos_y = pos_y - 15;
        if(down == 1 && pos_y + 25 <= 465)
            pos_y = pos_y + 15;
        else if (pos_y + 25>=466)
				pos_y = 465 - 25;
	    else if (pos_y - 25<=14)
				pos_y = 15 + 25;
				
		if (right == 1 && pos_x + 25 <= 625)
            pos_x = pos_x + 15;
        if(left == 1 && pos_x - 25 >= 15)
            pos_x = pos_x - 15;
        else if (pos_x + 25 >=626)
				pos_x = 626 - 25;
	    else if (pos_x - 25 <=14)
				pos_x = 15 + 25;	
				
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule
