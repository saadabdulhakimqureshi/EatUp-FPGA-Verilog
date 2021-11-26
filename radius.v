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


module radius( input clk, input plus, input minus, output [5:0] r);
    reg [5:0] radius = 25;
    
    always @(posedge clk)
    begin
        if (plus == 1 && r <= 50)
        begin
            radius  = radius + 5;
        end
        
        if (minus == 1 && radius >= 5)
        begin 
            radius = radius - 5;
        end
    end   
     
    assign r = radius;
endmodule
