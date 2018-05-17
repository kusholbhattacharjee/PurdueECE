// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/21/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: eop detect test bench

`timescale 1ns/ 100 ps

module tb_eop_detect(); 

	localparam CLK_PERIOD = 2.5; 
	reg tb_d_plus,tb_d_minus,tb_eop; 
	eop_detect DUT(.d_plus(tb_d_plus), .d_minus(tb_d_minus), .eop(tb_eop));

	initial 
	begin 
		#5
		tb_d_plus = 0; 
		tb_d_minus = 0;
		#5		
		tb_d_plus = 1; 
		tb_d_minus = 0; 
		#5
		tb_d_plus = 0; 
		tb_d_minus = 1; 
		#5
		tb_d_plus = 1; 
		tb_d_minus = 1; 
		#5
		tb_d_plus = 0; 
		tb_d_plus = 0; 
		#5		
		tb_d_plus = 1; 
		tb_d_minus = 0; 
		#5
		tb_d_plus = 0; 
		tb_d_minus = 1; 
		#5
		tb_d_plus = 1; 
		tb_d_minus = 1; 
		
	end 

endmodule 
