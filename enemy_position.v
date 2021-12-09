`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 02:33:51 PM
// Design Name: 
// Module Name: enemy_position
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


module enemy_position1(input clk, input gamemenu, input gamerun, input gamepause, output [9:0] x, output [9:0] y);
  integer pos_x;
  integer pos_y;
  integer velocityx;
  integer velocityy;
  wire clk_d;
  
  clk_div_1_second g0(clk, clk_d);
  always @(posedge clk_d) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x = 300;
        pos_y = 200;
        velocityx = 20;
        velocityy = 20;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin
        if (pos_x + 10 > 626)
            velocityx = -20;
        else if (pos_x - 10 < 15)
            velocityx = 20;
         
        pos_x = pos_x + velocityx;
            
        if (pos_y + 10 > 466)
            velocityy = -20;
        else if (pos_y - 10 < 15)
            velocityy = 20;
         
        pos_y = pos_y + velocityy;		
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule

module enemy_position2(input clk, input gamemenu, input gamerun, input gamepause, output [9:0] x, output [9:0] y);
  integer pos_x;
  integer pos_y;
  integer velocityx;
  integer velocityy;
  wire clk_d;
  
  clk_div_1_second g0(clk, clk_d);
  always @(posedge clk_d) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x =  450;
        pos_y =  100;
        velocityx = 20;
        velocityy = 20;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin
        if (pos_x + 10 > 626)
            velocityx = -20;
        else if (pos_x - 10 < 15)
            velocityx = 20;
         
        pos_x = pos_x + velocityx;
            
        if (pos_y + 10 > 466)
            velocityy = -20;
        else if (pos_y - 10 < 15)
            velocityy = 20;
         
        pos_y = pos_y + velocityy;		
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule

module enemy_position3(input clk, input gamemenu, input gamerun, input gamepause, output [9:0] x, output [9:0] y);
  integer pos_x;
  integer pos_y;
  integer velocityx;
  integer velocityy;
  wire clk_d;
  
  clk_div_1_second g0(clk, clk_d);
  always @(posedge clk_d) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x = 200;
        pos_y = 300;
        velocityx = 20;
        velocityy = 20;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin
        if (pos_x + 10 > 626)
            velocityx = -20;
        else if (pos_x - 10 < 15)
            velocityx = 20;
         
        pos_x = pos_x + velocityx;
            
        if (pos_y + 10 > 466)
            velocityy = -20;
        else if (pos_y - 10 < 15)
            velocityy = 20;
         
        pos_y = pos_y + velocityy;		
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule