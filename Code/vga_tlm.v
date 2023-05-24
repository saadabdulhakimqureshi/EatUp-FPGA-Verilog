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


module vga_tlm(clk, PS2_CLK, PS2_DATA, h_sync, v_sync, red, green, blue, seg, an);
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
  wire [9:0] E1x,E2x,E3x,E4x, F1x;
  wire [9:0] E1y,E2y,E3y,E4y, F1y;
  //Keyboard signlas.
  wire up, down, left, right, plus, minus, enter, escape, pause, reset, col1, col2, col3, col4, col5;
  //GameState:
  wire gamemenu, gamerun, gamepause;
  
  //VGA:
  output h_sync;
  output v_sync;
  output [3:0] red;
  output [3:0] green;
  output [3:0] blue;
  output wire [7:0] seg;
  output wire [3:0] an;
      reg [15:0]	stat_bcd = 16'b0;

    //Instantiation wires
    wire			en;
    wire [11:0] bin_d_in;
    wire [15:0] bcd_d_out;
    wire 			rdy;


  clk_div g0(clk, clk_d);
  Keyboard g1(clk_d, PS2_CLK, PS2_DATA, r, up, down, left, right, plus, minus, enter, escape, reset, pause);//F.S.M
  gamestate g2(enter, escape, pause, clk, reset, gamemenu, gamerun, gamepause);


    
  //Timer 
    example_count EC_0(
         clk_d,
         gamemenu,
         gamerun,
         gamepause,
         en,
         bin_d_in
        );
    
    BCDConvert BCDConv_0(
        .clk(clk_d),
        .en(en),
        .bin_d_in(bin_d_in),
        .bcd_d_out(bcd_d_out),
        .rdy(rdy)
        );
         
    multi_seg_drive MSD_0(
        .clk(clk_d),
        .bcd_in(stat_bcd),
         .sseg_a_o(an),
         .sseg_c_o(seg)
        );
    
    always @(posedge clk_d)
        begin
        if(rdy)
            begin
            stat_bcd <= bcd_d_out;
            end
        end
        
  //Player:
  player_position g4(up, down, left, right, r, clk_d, gamemenu, gamerun, gamepause, x, y);
  //Enemy:
  enemy_position1 e1(clk_d, gamemenu, gamerun, gamepause, x, y, r, col1, E1x, E1y);
  enemy_position2 e2(clk_d, gamemenu, gamerun, gamepause, x, y, r, col2, E2x, E2y);
  enemy_position3 e3(clk_d, gamemenu, gamerun, gamepause, x, y, r, col3, E3x, E3y);
  enemy_position4 e4(clk_d, gamemenu, gamerun, gamepause, x, y, r, col4, E4x, E4y);
  food_position f1(clk_d, gamemenu, gamerun, gamepause, x, y, r, col5, F1x, F1y);
  
  //Radius Decrease
  radius g3(clk_d, col1, col2, col3, col4, col5, gamemenu, gamerun, gamepause, r);
  //VGA:
  h_counter g8(clk_d, h_count, trig_v);
  v_counter g9(clk_d, v_count, trig_v);
  vga_sync g10(v_count, h_count, h_sync, v_sync, video_on, x_loc, y_loc);
  
  //Generator:
  circle_gen g11(clk_d, x_loc, y_loc, video_on, x, y, r, E1x, E1y, E2x, E2y, E3x, E3y, E4x, E4y, F1x, F1y, gamemenu, gamerun, gamepause, red, green, blue);
endmodule
