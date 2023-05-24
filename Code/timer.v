`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 03:36:03 PM
// Design Name: 
// Module Name: timer
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

module time_text(
input wire clk, reset, pause,
input wire refresh_tick,
input wire [20:0] pix_x, pix_y,
output wire time_on,
output wire [2:0] bit_addr,
output wire [10:0] rom_addr);
    
//variables 
wire [3:0] row_addr;    
reg [12:0] char_addr;
reg [23:0] time_tick;
reg [30:0] raceTime;
reg [3:0] dig_10th, dig_1s, dig_10s, dig_100s, dig_1000s, dig_10000s;

assign time_on = (pix_y [9: 5] ==0) && (pix_x [9: 4] <9) ;
assign row_addr = pix_y [4:1];
assign bit_addr = pix_x [3:1];
assign rom_addr = {char_addr, row_addr};
 
//measure time in miliseonds
always@(posedge clk)
begin
time_tick <= time_tick + 1;
if(reset)
    raceTime<=0;
else if(pause)
    raceTime <=raceTime;
else if(time_tick==10000000) //0.1 second
begin
    time_tick<=0;
    raceTime <= raceTime + 1;
end

//calculate decimal digits
if(refresh_tick)
    begin
    dig_10th <= raceTime%10;
    dig_1s <= (raceTime%100)/10;
    dig_10s <= (raceTime%1000)/100;
    dig_100s <= (raceTime%10000)/1000;
    dig_1000s <= (raceTime%100000)/10000;
    dig_10000s <= (raceTime%100000)/10000;
    end
end 


always @*
case (pix_x [7:4])
4'h0: char_addr = 7'h53; // S
//4'h1: char_addr = 7'h43; // c
//4'h2: char_addr = 7'h4F; // o
//4'h3: char_addr = 7'h52; // r
//4'h4: char_addr = 7'h45; // e
4'h1: char_addr = 7'h3A; // :
4'h2: char_addr = {3'b011, dig_10000s}; // d i g i t 10000
4'h3: char_addr = {3'b011, dig_1000s}; // d i g i t 1000
4'h4: char_addr = {3'b011, dig_100s}; // d i g i t 100
4'h5: char_addr = {3'b011, dig_10s}; // d i g i t 10
4'h6: char_addr = {3'b011, dig_1s}; // d i g i t 1
//4'hA: char_addr = 7'h2e; // .
4'h7: char_addr = {3'b011, dig_10th}; // d i g i t 10th
default: char_addr = 7'h00; // 
endcase

endmodule

module text(
input wire clk, reset, pause,
input wire refresh_tick,
input wire start_en, crash_en, finish_en,
input wire [20:0] pix_x, pix_y,
output wire text_on,
output reg [11:0] text_rgb);

// signal declaration
wire [7:0] font_word;
wire font_bit, time_on, start_on, crash_on, finish_on;
wire [10:0] time_rom_addr, start_rom_addr, 
        crash_rom_addr, finish_rom_addr;
wire [2:0] time_bit_addr, start_bit_addr, 
        crash_bit_addr, finish_bit_addr;
reg [10:0] rom_addr;
reg [2:0] bit_addr;


assign font_bit = font_word[~bit_addr];

assign text_on = time_on | (start_on&font_bit)
             |  (crash_on&font_bit) | (finish_on&font_bit);

// instantiate modules
font_rom font_unit
(.clk(clk), .addr(rom_addr), .data(font_word));

time_text mytime(clk, reset, pause, refresh_tick, 
    pix_x, pix_y, time_on, time_bit_addr, time_rom_addr);

start mystart(clk, start_en, pix_x, pix_y, start_on, 
            start_bit_addr, start_rom_addr);

finish myfinish(clk, finish_en, pix_x, pix_y, finish_on, 
            finish_bit_addr, finish_rom_addr);

game_over crash(clk, crash_en, pix_x, pix_y, crash_on, 
            crash_bit_addr, crash_rom_addr);


always @*
begin
    if(time_on)
        begin
        bit_addr <= time_bit_addr;
        rom_addr <= time_rom_addr;
        text_rgb <= 12'h001; // background
        if (font_bit)
        text_rgb <= 12'hFFF; //font color
        end
    else if(start_on)
        begin
        bit_addr <= start_bit_addr;
        rom_addr <= start_rom_addr;
        text_rgb <= 12'h000; //font color
        end  
    else if(crash_on)
        begin
        bit_addr <= crash_bit_addr;
        rom_addr <= crash_rom_addr;
        text_rgb <= 12'h000; //font color
        end
    else if(finish_on)
        begin
        bit_addr <= finish_bit_addr;
        rom_addr <= finish_rom_addr;
        text_rgb <= 12'h000; //font color
        end

    
end

endmodule

module example_count(
	 input clk,
	 input gamemenu,
	 input gamerun,
	 input gamepause,
	 output	done,
	 output	[11:0]	bin_cnt
    );

parameter c_reg_size = 34;

reg [c_reg_size - 1:0]	count = 0;
reg 							fin	= 0;
reg 							old_b	= 0;

always @(posedge clk)
	begin
	if (gamemenu == 1 && gamerun == 0 && gamepause == 0)
	begin
	count = 0;
    fin	= 0;
    old_b = 0;   
	end
	   
    else if (gamemenu == 0 && gamerun == 1 && gamepause == 0) begin
        count <= count + 1;
        if((old_b && !count[c_reg_size - 12]) || (!old_b && count[c_reg_size - 12]))
            begin
            fin <= 1;
            end
        else
            begin
            fin <= 0;
            end
        old_b <= count[c_reg_size - 12];
        end
	end
	

assign bin_cnt = count[c_reg_size - 1: c_reg_size - 12];
assign done		= fin;
endmodule
module BCDConvert(
    input           clk,
    input           en,
    input   [11:0]  bin_d_in,
    output  [15:0]  bcd_d_out,
    output          rdy
    );
    
    //State variables
    parameter IDLE      = 3'b000;
    parameter SETUP     = 3'b001;
    parameter ADD       = 3'b010;
    parameter SHIFT     = 3'b011;
    parameter DONE      = 3'b100;
    
    //reg [11:0]  bin_data    = 0;
    reg [27:0]  bcd_data    = 0;
    reg [2:0]   state       = 0;
    reg         busy        = 0;
    reg [3:0]   sh_counter  = 0;
    reg [1:0]   add_counter = 0;
    reg         result_rdy  = 0;
    
    
    always @(posedge clk)
        begin
        if(en)
            begin
                if(~busy)
                    begin
                    bcd_data    <= {16'b0, bin_d_in};
                    state       <= SETUP;
                    end
            end
        
        case(state)
        
            IDLE:
                begin
                    result_rdy  <= 0;
                    busy        <= 0;
                end
                
            SETUP:
                begin
                busy        <= 1;
                state       <= ADD;
                end
                    
            ADD:
                begin
                
                case(add_counter)
                    0:
                        begin
                        if(bcd_data[15:12] > 4)
                            begin
                                bcd_data[27:12] <= bcd_data[27:12] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                    
                    1:
                        begin
                        if(bcd_data[19:16] > 4)
                            begin
                                bcd_data[27:16] <= bcd_data[27:16] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                        
                    2:
                        begin
                        if(bcd_data[23:20] > 4)
                            begin
                                bcd_data[27:20] <= bcd_data[27:20] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                        
                    3:
                        begin
                        if(bcd_data[27:24] > 4)
                            begin
                                bcd_data[27:24] <= bcd_data[27:24] + 3;
                            end
                            add_counter <= 0;
                            state   <= SHIFT;
                        end
                    endcase
                end
                
            SHIFT:
                begin
                sh_counter  <= sh_counter + 1;
                bcd_data    <= bcd_data << 1;
                
                if(sh_counter == 11)
                    begin
                    sh_counter  <= 0;
                    state       <= DONE;
                    end
                else
                    begin
                    state   <= ADD;
                    end

                end
 
            
            DONE:
                begin
                result_rdy  <= 1;
                state       <= IDLE;
                end
            default:
                begin
                state <= IDLE;
                end
            
            endcase
            
        end
    assign bcd_d_out    = bcd_data[27:12];
    assign rdy          = result_rdy;
endmodule
module multi_seg_drive(
    input 			clk,
    input [15:0]	bcd_in,
	 output [3:0]	sseg_a_o,
	 output [7:0]	sseg_c_o
    );
parameter g_s = 5;
parameter gt  = 4;

wire [7:0] 	sseg_o;

reg [3:0] 	anode 	= 4'b0001;
reg [3:0] 	bcd_seg	= 4'b0000;
reg [g_s - 1:0]	g_count	= 0;

ss_decode ss_dec(
	 .clk(clk),
	 .BCD(bcd_seg),
	 .sseg_o(sseg_o)
	 );

always @(posedge clk)
	begin
	g_count = g_count + 1;
		if(g_count == 0)
			begin
			if(anode == 4'b0001)
				begin
				anode = 4'b1000;
				end
			else
				begin
				anode		= anode >> 1;
				end
			end

		if(&g_count[g_s - 1:gt])
			begin
			case(anode)
				4'b1000: bcd_seg	= bcd_in[15:12];
				4'b0100: bcd_seg	= bcd_in[11:8];					
				4'b0010: bcd_seg	= bcd_in[7:4];
				4'b0001: bcd_seg	= bcd_in[3:0];			
				default:	bcd_seg	= 4'b1111;
				endcase
			end
		else
			begin
			bcd_seg	= 4'b1111;
			end
	end
	
assign sseg_a_o = ~anode;
assign sseg_c_o = sseg_o;


endmodule
module ss_decode(
    input 			clk,
    input [3:0]	BCD,
	 output [7:0]	sseg_o
    );

	reg [7:0]	sseg = 8'b11111111;

	always @(posedge clk)
		begin
			case(BCD)
				4'b0000: sseg <= 8'b11000000;//00000011;
				4'b0001: sseg <= 8'b11111001;//10011111;
				4'b0010: sseg <= 8'b10100100;//00100101;
				4'b0011: sseg <= 8'b10110000;//00001101;
				4'b0100: sseg <= 8'b10011001;//10011001;
				4'b0101: sseg <= 8'b10010010;//01001001;
				4'b0110: sseg <= 8'b10000010;//01000001;
				4'b0111: sseg <= 8'b11111000;//00011111;
				4'b1000: sseg <= 8'b10000000;//00000001;
				4'b1001: sseg <= 8'b10010000;//00001001;
				default sseg <= 8'b11111111;
				endcase
		end

assign sseg_o = sseg;
endmodule
