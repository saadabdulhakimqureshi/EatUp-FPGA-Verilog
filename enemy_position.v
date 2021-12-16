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


module enemy_position1(
input clk, 
input gamemenu, 
input gamerun, 
input gamepause,
input [9:0] aX, 
input [9:0] aY,
input [9:0] aR,
output reg collide,
output [9:0] x, 
output [9:0] y);

  integer pos_x;
  integer pos_y;
  integer velocityx;
  integer velocityy;
  wire clk_d;
    wire [9:0] leftA;
    wire [9:0] leftB;
    wire [9:0] rightA;
    wire [9:0] rightB;
    wire [9:0] topA;
    wire [9:0] topB;
    wire [9:0] bottomA;
    wire [9:0] bottomB;

    assign leftA = aX - aR;
    assign rightA = aX + aR;
    assign topA = aY - aR;
    assign bottomA = aY + aR;
    
    assign leftB = pos_x - 10;
    assign rightB = pos_x + 10;
    assign topB = pos_y - 10;
    assign bottomB = pos_y + 10;
    
  clk_div_1_second g0(clk, clk_d);
  always @(posedge clk_d) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x = 160;
        pos_y = 120;
        velocityx = -20;
        velocityy = -20;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin
        
        collide = 0;
        if (bottomA <= topB)
        begin
            collide = 0;
        end
        else if (topA >= bottomB)
        begin
            collide = 0;
        end
        else if (rightA <= leftB)
        begin
            collide = 0;
        end
        else if (leftA >= rightB)
        begin
            collide = 0;
        end
        else
        begin
            if (rightB>=leftA && leftB < leftA)
                velocityx = -1*velocityx;
            else if (leftB<=rightA && rightB > rightA)
                velocityx = -1*velocityx;
            else if (topB <= bottomA && bottomB > bottomA)
                velocityy = -1*velocityy;
            else if (bottomB >= topA && topB < topA)  
                velocityy = -1*velocityy; 
            collide = 1;
            if (velocityx > 0)
                velocityx = velocityx + 2;
            else if (velocityx < 0)
                velocityx = velocityx - 2;
            
            if (velocityy > 0)
                velocityy = velocityy + 2;
            else if (velocityy < 0)
                velocityy = velocityy - 2;
        end
        if (pos_x + 10 > 626)
            velocityx = -1*velocityx;
        else if (pos_x - 10 < 15)
            velocityx = -1*velocityx;
         
        pos_x = pos_x + velocityx;
            
        if (pos_y + 10 > 466)
            velocityy = -1*velocityy;
        else if (pos_y - 10 < 15)
            velocityy = -1*velocityy;
            
        pos_y = pos_y + velocityy;        
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule

module enemy_position2(
input clk, 
input gamemenu, 
input gamerun, 
input gamepause,
input [9:0] aX, 
input [9:0] aY,
input [9:0] aR,
output reg collide,
output [9:0] x, 
output [9:0] y);

  integer pos_x;
  integer pos_y;
  integer velocityx;
  integer velocityy;
  wire clk_d;
    wire [9:0] leftA;
    wire [9:0] leftB;
    wire [9:0] rightA;
    wire [9:0] rightB;
    wire [9:0] topA;
    wire [9:0] topB;
    wire [9:0] bottomA;
    wire [9:0] bottomB;

    assign leftA = aX - aR;
    assign rightA = aX + aR;
    assign topA = aY - aR;
    assign bottomA = aY + aR;
    
    assign leftB = pos_x - 10;
    assign rightB = pos_x + 10;
    assign topB = pos_y - 10;
    assign bottomB = pos_y + 10;
    
  clk_div_1_second g0(clk, clk_d);
  always @(posedge clk_d) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x = 480;
        pos_y = 120;
        velocityx = 20;
        velocityy = -20;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin
        
        collide = 0;
        if (bottomA <= topB)
        begin
            collide = 0;
        end
        else if (topA >= bottomB)
        begin
            collide = 0;
        end
        else if (rightA <= leftB)
        begin
            collide = 0;
        end
        else if (leftA >= rightB)
        begin
            collide = 0;
        end
        else
        begin
            if (rightB>=leftA && leftB < leftA)
                velocityx = -1*velocityx;
            else if (leftB<=rightA && rightB > rightA)
                velocityx = -1*velocityx;
            else if (topB <= bottomA && bottomB > bottomA)
                velocityy = -1*velocityy;
            else if (bottomB >= topA && topB < topA)  
                velocityy = -1*velocityy; 
            collide = 1;
            if (velocityx > 0)
                velocityx = velocityx + 2;
            else if (velocityx < 0)
                velocityx = velocityx - 2;
            
            if (velocityy > 0)
                velocityy = velocityy + 2;
            else if (velocityy < 0)
                velocityy = velocityy - 2;

        end
        if (pos_x + 10 > 626)
            velocityx = -1*velocityx;
        else if (pos_x - 10 < 15)
            velocityx = -1*velocityx;
         
        pos_x = pos_x + velocityx;
            
        if (pos_y + 10 > 466)
            velocityy = -1*velocityy;
        else if (pos_y - 10 < 15)
            velocityy = -1*velocityy;
        pos_y = pos_y + velocityy;        
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule

module enemy_position3(
input clk, 
input gamemenu, 
input gamerun, 
input gamepause,
input [9:0] aX, 
input [9:0] aY,
input [9:0] aR,
output reg collide,
output [9:0] x, 
output [9:0] y);

  integer pos_x;
  integer pos_y;
  integer velocityx;
  integer velocityy;
  wire clk_d1, clk_d2;
    wire [9:0] leftA;
    wire [9:0] leftB;
    wire [9:0] rightA;
    wire [9:0] rightB;
    wire [9:0] topA;
    wire [9:0] topB;
    wire [9:0] bottomA;
    wire [9:0] bottomB;

    assign leftA = aX - aR;
    assign rightA = aX + aR;
    assign topA = aY - aR;
    assign bottomA = aY + aR;
    
    assign leftB = pos_x - 10;
    assign rightB = pos_x + 10;
    assign topB = pos_y - 10;
    assign bottomB = pos_y + 10;
    
  clk_div_1_second g0(clk, clk_d1);
  always @(posedge clk_d1) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x = 160;
        pos_y = 360;
        velocityx = -20;
        velocityy = 20;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin

        
        collide = 0;
        if (bottomA <= topB)
        begin
            collide = 0;
        end
        else if (topA >= bottomB)
        begin
            collide = 0;
        end
        else if (rightA <= leftB)
        begin
            collide = 0;
        end
        else if (leftA >= rightB)
        begin
            collide = 0;
        end
        else
        begin
            if (rightB>=leftA && leftB < leftA)
                velocityx = -1*velocityx;
            else if (leftB<=rightA && rightB > rightA)
                velocityx = -1*velocityx;
            else if (topB <= bottomA && bottomB > bottomA)
                velocityy = -1*velocityy;
            else if (bottomB >= topA && topB < topA)  
                velocityy = -1*velocityy; 
            collide = 1;
            if (velocityx > 0)
                velocityx = velocityx + 2;
            else if (velocityx < 0)
                velocityx = velocityx - 2;
            
            if (velocityy > 0)
                velocityy = velocityy + 2;
            else if (velocityy < 0)
                velocityy = velocityy - 2;
            
        end
        if (pos_x + 10 > 626)
            velocityx = -1*velocityx;
        else if (pos_x - 10 < 15)
            velocityx = -1*velocityx;
         
        pos_x = pos_x + velocityx;
            
        if (pos_y + 10 > 466)
            velocityy = -1*velocityy;
        else if (pos_y - 10 < 15)
            velocityy = -1*velocityy;
        pos_y = pos_y + velocityy;        
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule

module enemy_position4(
input clk, 
input gamemenu, 
input gamerun, 
input gamepause,
input [9:0] aX, 
input [9:0] aY,
input [9:0] aR,
output reg collide,
output [9:0] x, 
output [9:0] y);

  integer pos_x;
  integer pos_y;
  integer velocityx;
  integer velocityy;
  wire clk_d1, clk_d2;
    wire [9:0] leftA;
    wire [9:0] leftB;
    wire [9:0] rightA;
    wire [9:0] rightB;
    wire [9:0] topA;
    wire [9:0] topB;
    wire [9:0] bottomA;
    wire [9:0] bottomB;

    assign leftA = aX - aR;
    assign rightA = aX + aR;
    assign topA = aY - aR;
    assign bottomA = aY + aR;
    
    assign leftB = pos_x - 10;
    assign rightB = pos_x + 10;
    assign topB = pos_y - 10;
    assign bottomB = pos_y + 10;
    
  clk_div_1_second g0(clk, clk_d1);
  always @(posedge clk_d1) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x = 480;
        pos_y = 360;
        velocityx = 20;
        velocityy = 20;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin

        
        collide = 0;
        if (bottomA <= topB)
        begin
            collide = 0;
        end
        else if (topA >= bottomB)
        begin
            collide = 0;
        end
        else if (rightA <= leftB)
        begin
            collide = 0;
        end
        else if (leftA >= rightB)
        begin
            collide = 0;
        end
        else
        begin
            if (rightB>=leftA && leftB < leftA)
                velocityx = -1*velocityx;
            else if (leftB<=rightA && rightB > rightA)
                velocityx = -1*velocityx;
            else if (topB <= bottomA && bottomB > bottomA)
                velocityy = -1*velocityy;
            else if (bottomB >= topA && topB < topA)  
                velocityy = -1*velocityy; 
            collide = 1;
            if (velocityx > 0)
                velocityx = velocityx + 2;
            else if (velocityx < 0)
                velocityx = velocityx - 2;
            
            if (velocityy > 0)
                velocityy = velocityy + 2;
            else if (velocityy < 0)
                velocityy = velocityy - 2;
            
        end
        if (pos_x + 10 > 626)
            velocityx = -1*velocityx;
        else if (pos_x - 10 < 15)
            velocityx = -1*velocityx;
         
        pos_x = pos_x + velocityx;
            
        if (pos_y + 10 > 466)
            velocityy = -1*velocityy;
        else if (pos_y - 10 < 15)
            velocityy = -1*velocityy;
        pos_y = pos_y + velocityy;        
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule

module food_position(
input clk, 
input gamemenu, 
input gamerun, 
input gamepause,
input [9:0] aX, 
input [9:0] aY,
input [9:0] aR,
output reg collide,
output [9:0] x, 
output [9:0] y);

  integer pos_x;
  integer pos_y;
  integer count;
  wire clk_d1, clk_d2;
    wire [9:0] leftA;
    wire [9:0] leftB;
    wire [9:0] rightA;
    wire [9:0] rightB;
    wire [9:0] topA;
    wire [9:0] topB;
    wire [9:0] bottomA;
    wire [9:0] bottomB;

    assign leftA = aX - aR;
    assign rightA = aX + aR;
    assign topA = aY - aR;
    assign bottomA = aY + aR;
    
    assign leftB = pos_x - 10;
    assign rightB = pos_x + 10;
    assign topB = pos_y - 10;
    assign bottomB = pos_y + 10;
    
  clk_div_1_second g0(clk, clk_d1);
  always @(posedge clk_d1) begin
    if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
    begin
        pos_x = 250;
        pos_y = 250;
        count = 0;
    end
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0)
    begin

        
        collide = 0;
        if (bottomA <= topB)
        begin
            collide = 0;
        end
        else if (topA >= bottomB)
        begin
            collide = 0;
        end
        else if (rightA <= leftB)
        begin
            collide = 0;
        end
        else if (leftA >= rightB)
        begin
            collide = 0;
        end
        else
        begin
            collide = 1;
            if (count == 0)
            begin 
                pos_x = 320;
                pos_y = 200; 
                count = count + 1;
            end
            else if (count == 1)
            begin 
                pos_x = 400;
                pos_y = 100;
                count = count + 1;
            end   
            else if (count == 2)
            begin 
                pos_x = 200;
                pos_y = 320;
                count = count + 1;
            end         
            else if (count == 3)
            begin 
                pos_x = 400;
                pos_y = 190;
                count = count + 1;
            end
            else if (count == 4)
            begin 
                pos_x = 30;
                pos_y = 40;
                count = count + 1;
            end
            else if (count == 5)
            begin 
                pos_x = 70;
                pos_y = 200;
                count = count + 1;
            end
            else if (count == 6)
            begin 
                pos_x = 400;
                pos_y = 30;
                count = count + 1;
            end
            else if (count == 6)
            begin 
                pos_x = 600;
                pos_y = 440;
                count = count + 1;
            end
            else if (count == 8)
            begin 
                pos_x = 250;
                pos_y = 250;
                count = 0;
            end  
        end
                
    end
  end
  assign x = pos_x;
  assign y = pos_y;
endmodule
