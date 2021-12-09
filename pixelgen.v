module circle_gen(
  input clk_d,
  input [9:0] pixel_x,
  input [9:0] pixel_y,
  input video_on,
  input [9:0] x, 
  input [9:0] y, 
  input [5:0] r,
  input [9:0] E1x, 
  input [9:0] E1y,
  input [9:0] E2x, 
  input [9:0] E2y,
  input [9:0] E3x, 
  input [9:0] E3y,
  input gamemenu,
  input gamerun,
  input gamepause,
  output reg [3:0] red = 0,
  output reg [3:0] green = 0,
  output reg [3:0] blue = 0
  );
  
  
  always @(posedge clk_d) 
  begin
          if ((pixel_x<=14 && pixel_x >=0)||(pixel_x >=626 && pixel_x <=640)||(pixel_y<=14&&pixel_y >=0)||(pixel_y>=466 && pixel_y <= 480)) 
        begin
          red <= gamemenu?(((pixel_x<=14 && pixel_x >=0)||(pixel_x >=626 && pixel_x <=640)||(pixel_y<=14&&pixel_y >=0)||(pixel_y>=466 && pixel_y <= 480))?(4'hF):(4'h0)):(4'h0);
          green <= gamepause?(((pixel_x<=14 && pixel_x >=0)||(pixel_x >=626 && pixel_x <=640)||(pixel_y<=14&&pixel_y >=0)||(pixel_y>=466 && pixel_y <= 480))?(4'hF):(4'h0)):(4'h0);
          blue <= gamerun?(((pixel_x<=14 && pixel_x >=0)||(pixel_x >=626 && pixel_x <=640)||(pixel_y<=14&&pixel_y >=0)||(pixel_y>=466 && pixel_y <= 480))?(4'hF):(4'h0)):(4'h0);
          end  
          else
       
 
          begin
              if (r == 50)
              begin
                  red <= video_on?((pixel_x - x)*(pixel_x - x) + (pixel_y - y) * (pixel_y - y) <= 50 * 50 ? 4'hF:4'h0):(4'h0);
                  green <= (video_on?((pixel_x - E1x)*(pixel_x - E1x) + (pixel_y - E1y) * (pixel_y - E1y) <= 10 * 10 ? 4'hF:4'h0):(4'h0)) | (video_on?((pixel_x - E2x)*(pixel_x - E2x) + (pixel_y - E2y) * (pixel_y - E2y) <= 10 * 10 ? 4'hF:4'h0):(4'h0))|(video_on?((pixel_x - E3x)*(pixel_x - E3x) + (pixel_y - E3y) * (pixel_y - E3y) <= 10 * 10 ? 4'hF:4'h0):(4'h0));
                  blue <= 4'h0;
              end
              else if (r == 40)
              begin 
                  red <= video_on?((pixel_x - x)*(pixel_x - x) + (pixel_y - y) * (pixel_y - y) <= 40 * 40 ? 4'hF:4'h0):(4'h0);
                  green <= (video_on?((pixel_x - E1x)*(pixel_x - E1x) + (pixel_y - E1y) * (pixel_y - E1y) <= 10 * 10 ? 4'hF:4'h0):(4'h0)) | (video_on?((pixel_x - E2x)*(pixel_x - E2x) + (pixel_y - E2y) * (pixel_y - E2y) <= 10 * 10 ? 4'hF:4'h0):(4'h0))|(video_on?((pixel_x - E3x)*(pixel_x - E3x) + (pixel_y - E3y) * (pixel_y - E3y) <= 10 * 10 ? 4'hF:4'h0):(4'h0));
                  blue <= 4'h0;
              end
              else if (r == 30)
              begin 
                  red <= video_on?((pixel_x - x)*(pixel_x - x) + (pixel_y - y) * (pixel_y - y) <= 30 * 30 ? 4'hF:4'h0):(4'h0);
                  green <= (video_on?((pixel_x - E1x)*(pixel_x - E1x) + (pixel_y - E1y) * (pixel_y - E1y) <= 10 * 10 ? 4'hF:4'h0):(4'h0)) | (video_on?((pixel_x - E2x)*(pixel_x - E2x) + (pixel_y - E2y) * (pixel_y - E2y) <= 10 * 10 ? 4'hF:4'h0):(4'h0))|(video_on?((pixel_x - E3x)*(pixel_x - E3x) + (pixel_y - E3y) * (pixel_y - E3y) <= 10 * 10 ? 4'hF:4'h0):(4'h0));
                  blue <= 4'h0;
              end
              else if (r == 20)
              begin 
                  red <= video_on?((pixel_x - x)*(pixel_x - x) + (pixel_y - y) * (pixel_y - y) <= 20 * 20 ? 4'hF:4'h0):(4'h0);
                  green <= (video_on?((pixel_x - E1x)*(pixel_x - E1x) + (pixel_y - E1y) * (pixel_y - E1y) <= 10 * 10 ? 4'hF:4'h0):(4'h0)) | (video_on?((pixel_x - E2x)*(pixel_x - E2x) + (pixel_y - E2y) * (pixel_y - E2y) <= 10 * 10 ? 4'hF:4'h0):(4'h0))|(video_on?((pixel_x - E3x)*(pixel_x - E3x) + (pixel_y - E3y) * (pixel_y - E3y) <= 10 * 10 ? 4'hF:4'h0):(4'h0));
                  blue <= 4'h0;
              end
              else if (r == 10)
              begin 
                  red <= video_on?((pixel_x - x)*(pixel_x - x) + (pixel_y - y) * (pixel_y - y) <= 10 * 10 ? 4'hF:4'h0):(4'h0);
                  green <= (video_on?((pixel_x - E1x)*(pixel_x - E1x) + (pixel_y - E1y) * (pixel_y - E1y) <= 10 * 10 ? 4'hF:4'h0):(4'h0)) | (video_on?((pixel_x - E2x)*(pixel_x - E2x) + (pixel_y - E2y) * (pixel_y - E2y) <= 10 * 10 ? 4'hF:4'h0):(4'h0))|(video_on?((pixel_x - E3x)*(pixel_x - E3x) + (pixel_y - E3y) * (pixel_y - E3y) <= 10 * 10 ? 4'hF:4'h0):(4'h0));
                  blue <= 4'h0;
              end
          end
  
   end

endmodule 