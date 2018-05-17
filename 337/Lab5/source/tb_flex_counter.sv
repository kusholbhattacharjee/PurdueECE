// $Id: $
// File name:   tb_flex_counter.sv
// Created:     1/31/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: test bench for the biiiiiish



module tb_flex_counter ();

	//Define parameters
	//basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
	localparam	NUM_INPUT_BITS	= 4;
	
	// Shared Test Variables
	reg tb_clk;
	reg tb_n_rst;
	reg tb_clear;
	reg tb_count_enable;
	reg [NUM_INPUT_BITS-1:0] tb_rollover_val;
	reg tb_rollover_flag;
	reg [NUM_INPUT_BITS-1:0] tb_count_out;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	
	//DUT	
	flex_counter DUT ( .clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .rollover_flag(tb_rollover_flag), .count_out(tb_count_out));
	

	initial begin	
	
		tb_n_rst = 1;
		tb_clear = 0;
		tb_count_enable = 1;
		tb_rollover_val = 7;


	end
		
endmodule
