// Code your design here
// Code your design here
module v_counter(clk, v_count, enable_v);
  input clk;
  input enable_v;
  output v_count;
  reg [9:0] v_count;
  initial v_count = 0;

always @(posedge clk)

  begin
    if(v_count < 524)
      begin
        if (enable_v == 1)
          begin
        	v_count <= v_count + 1;
          end
      end
    else
      begin
		v_count <= 0;
      end  
  end
  
endmodule