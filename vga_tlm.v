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
  input PS2_CLK;
  input PS2_DATA;
  wire clk_d; 
  wire [9:0] h_count; 
  wire [9:0] v_count; 
  wire trig_v;
  wire video_on;
  wire [9:0] x;
  wire [9:0] y;
  wire [9:0] x_loc;
  wire [9:0] y_loc;
  wire [5:0] r;
  wire up, down, left, right, plus, minus;
  output h_sync;
  output v_sync;
  output [3:0] red;
  output [3:0] green;
  output [3:0] blue;
  
  clk_div g0(clk, clk_d);
  Keyboard g1(clk_d, PS2_CLK, PS2_DATA, up, down, left, right, plus, minus);
  radius g2(clk_d, plus, minus, r);
  player_position g3(up, down, left, right, r, clk_d, x, y);
  h_counter g4(clk_d, h_count, trig_v);
  v_counter g5(clk_d, v_count, trig_v);
  vga_sync g6(v_count, h_count, h_sync, v_sync, video_on, x_loc, y_loc);
  pixel_gen g7(clk_d, x_loc, y_loc, video_on, x, y, r, red, green, blue);
  
endmodule
