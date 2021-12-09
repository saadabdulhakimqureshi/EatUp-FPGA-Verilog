`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 01:36:50 PM
// Design Name: 
// Module Name: vga_tlm
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


module vga_tlm(clk, PS2_CLK, PS2_DATA, h_sync, v_sync, red, green, blue);
  input clk; 
  //Keyboard:
  input PS2_CLK;
  input PS2_DATA;
  //Clock:
  wire clk_d; 
  //VGA:
  wire [9:0] h_count; 
  wire [9:0] v_count; 
  wire trig_v;
  wire video_on;
  wire [9:0] x_loc;
  wire [9:0] y_loc;
   //Player position and radius:
  wire [9:0] x;
  wire [9:0] y;
  wire [5:0] r;
  //Enemy Position:
  wire [9:0] E1x,E2x,E3x;
  wire [9:0] E1y,E2y,E3y;
  //Keyboard signlas.
  wire up, down, left, right, plus, minus, enter, escape, pause, reset;
  //GameState:
  wire gamemenu, gamerun, gamepause;
  
  //VGA:
  output h_sync;
  output v_sync;
  output [3:0] red;
  output [3:0] green;
  output [3:0] blue;
  
  clk_div g0(clk, clk_d);
  Keyboard g1(clk_d, PS2_CLK, PS2_DATA, up, down, left, right, plus, minus, enter, escape, reset, pause);//F.S.M
  gamestate g2(enter, escape, pause, clk, reset, gamemenu, gamerun, gamepause);
  radius g3(clk_d, plus, minus, gamemenu, gamerun, gamepause, r);
  //Player:
  player_position g4(up, down, left, right, r, clk_d, gamemenu, gamerun, gamepause, x, y);
  //Enemy:
  enemy_position1 g5(clk_d, gamemenu, gamerun, gamepause, E1x, E1y);
  enemy_position2 g6(clk_d, gamemenu, gamerun, gamepause, E2x, E2y);
  enemy_position3 g7(clk_d, gamemenu, gamerun, gamepause, E3x, E3y);
  //VGA:
  h_counter g8(clk_d, h_count, trig_v);
  v_counter g9(clk_d, v_count, trig_v);
  vga_sync g10(v_count, h_count, h_sync, v_sync, video_on, x_loc, y_loc);
  
  //Generator:
  circle_gen g11(clk_d, x_loc, y_loc, video_on, x, y, r, E1x, E1y, E2x, E2y, E3x, E3y, gamemenu, gamerun, gamepause, red, green, blue);
endmodule
