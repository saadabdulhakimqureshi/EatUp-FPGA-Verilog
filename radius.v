`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2021 11:49:52 AM
// Design Name: 
// Module Name: radius
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


module radius(input clk, input plus, input minus, input gamemenu, input gamerun, input gamepause, output [5:0] r);
    reg [5:0] radius = 50;
    
    always @(posedge clk) 
    begin
        if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
        begin
            radius = 50;
        end
        else if (gamerun == 1 && gamepause == 0 && gamemenu == 0)
        begin
            if (plus == 1 && radius < 50)
            begin
                radius  = radius + 10;
            end
            
            if (minus == 1 && radius > 10)
            begin 
                radius = radius - 10;
            end
        end   
    end
    assign r = radius;
    
endmodule
