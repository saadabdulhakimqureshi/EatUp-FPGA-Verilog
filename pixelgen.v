module pixel_gen(
  input clk_d,
  input [9:0] pixel_x,
  input [9:0] pixel_y,
  input video_on,
  input [9:0] x, 
  input [9:0] y, 
  input [5:0] r,
  output reg [3:0] red = 0,
  output reg [3:0] green = 0,
  output reg [3:0] blue = 0
  );
  
  
  always @(posedge clk_d) begin
    begin
      if ((pixel_x<=14)||(pixel_x >=626)||(pixel_y<=14)||(pixel_y>=466)) begin
          red <= 4'hF;
          green <= 4'hF;
          blue <= 4'hF;
      end
      else
      begin
          red <= video_on?((pixel_x - 320)*(pixel_x - 320) + (pixel_y - 240) * (pixel_y - 240) <= r * r ? 4'hF:4'h0):(4'h0);
          green <= video_on?((pixel_x - x)*(pixel_x - x) + (pixel_y - y) * (pixel_y - y) <= 25 * 25 ? 4'hF:4'h0):(4'h0);
          blue <= 4'h0;
          
      end
    end
  end
endmodule 