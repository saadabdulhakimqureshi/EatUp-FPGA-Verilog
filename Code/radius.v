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


module radius(input clk, input col1, input col2, input col3, input col4, input col5, input gamemenu, input gamerun, input gamepause,  
output [5:0] r);
    reg [5:0] radius = 20;
    clk_div_1_second g0(clk, clk_d);
    always @(posedge clk_d) 
    begin

        if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
        begin
            radius = 20;
        end
        else if (gamerun == 1 && gamepause == 0 && gamemenu == 0)
        begin
            if (col1|col2|col3|col4 == 1 && radius > 10)
            begin 
                radius = radius-2;
            end
            if (col5 == 1 && radius < 20)
            begin
                radius = radius + 2;
            end
          
        end   
    end
    assign r = radius;
    
endmodule
