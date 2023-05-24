`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2021 11:24:21 AM
// Design Name: 
// Module Name: collision
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


module collision1(
  input clk,
  input [9:0] aX, 
  input [9:0] aY,
  input [9:0] aR,
  input [9:0] bX, 
  input [9:0] bY,
  output reg collide
);
    wire [9:0] leftA;
    wire [9:0] leftB;
    wire [9:0] rightA;
    wire [9:0] rightB;
    wire [9:0] topA;
    wire [9:0] topB;
    wire [9:0] bottomA;
    wire [9:0] bottomB;
    
    assign leftA = aX-aR;
    assign rightA = aX + aR;
    assign topA = aY - aR;
    assign bottomA = aY + aR;
    
    assign leftB = bX - 20;
    assign rightB = bX + 20;
    assign topB = bY - 20;
    assign bottomB = bY + 20;
    
    always @(posedge clk) begin
        collide = 1;
        if (bottomA <= topB)
        begin
            collide = 0;
        end
        if (topA >= bottomB)
        begin
            collide = 0;
        end
        if (rightA <= leftB)
        begin
            collide = 0;
        end
        if (leftA >= rightB)
        begin
            collide = 0;
        end
     end
endmodule
