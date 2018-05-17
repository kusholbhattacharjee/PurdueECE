// $Id: $
// File name:   tb_decode.sv
// Created:     2/21/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: decode test bench

`timescale 1ns/ 100 ps

module tb_decode(); 
	localparam CLK_PERIOD = 2.5; 
	reg tb_clk, tb_n_rst, tb_d_plus, tb_shift_enable, tb_eop, tb_d_orig;
	
	//SET THE CLOCK TOGGLE
	always 
	begin 
		tb_clk = 1'b0; 
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1; 
		#(CLK_PERIOD/2.0);  
	end 
	
	decode DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .shift_enable(tb_shift_enable), .eop(tb_eop), .d_orig(tb_d_orig));

	initial 
	begin 
		tb_n_rst = 1; 
		tb_d_plus = 0; 
		tb_shift_enable = 0; 
		tb_eop = 0; 



		// TEST Reset
@(posedge tb_clk); 
		tb_n_rst = 0; 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(negedge tb_clk); 
		tb_n_rst = 1;  
		@(posedge tb_clk);
		@(posedge tb_clk); 

		// TEST dplus on and shift on
		tb_d_plus = 1; 
		@(posedge tb_clk); 
		tb_shift_enable = 1; 

		// TEST eop off shift off 
		@(posedge tb_clk); 		
		tb_eop = 0; 
		@(posedge tb_clk); 
		tb_shift_enable = 1; 
		tb_d_plus = 1; 
		@(posedge tb_clk);

		// TEST d_plus off shift off
		@(posedge tb_clk);   
		tb_d_plus = 0; 
		@(posedge tb_clk);  
		tb_shift_enable = 0;  

		// TEST eop on shift on 
		@(posedge tb_clk); 		
		tb_eop = 1; 
		@(posedge tb_clk); 
		tb_shift_enable = 1; 
		tb_d_plus = 1; 

		// TEST eop off shift on
		@(posedge tb_clk); 		
		tb_eop = 0; 
		@(posedge tb_clk); 
		tb_shift_enable = 1; 
		
		// TEST eop on shift off 
		@(posedge tb_clk); 		
		tb_eop = 1; 
		@(posedge tb_clk); 
		tb_shift_enable = 0; 

		
		// TEST Reset
		tb_n_rst = 0; 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(negedge tb_clk); 
		tb_n_rst = 1;  
		@(posedge tb_clk);
		@(posedge tb_clk); 

	end  

endmodule 
