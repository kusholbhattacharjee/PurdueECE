// $Id: $
// File name:   tb_moore.sv
// Created:     2/5/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: test bench for moore.sv

`timescale 1ns / 10ps

module tb_moore(); 

	localparam CLK_PERIOD = 2.5; 

	reg tb_clk; 
	reg tb_n_rst; 
	reg tb_i; 
	reg tb_o; 

	//clk dvder
	always 
	begin 
		tb_clk = 1'b0; 
		#(CLK_PERIOD/2.0); 
		tb_clk = 1'b1; 
		#(CLK_PERIOD/2.0); 
	end  
	
	
	//run dat shi
	moore DUT(.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o)); 


	initial 
	begin 
		//reset all the shi
		tb_n_rst = 1'b1; @(posedge tb_clk); 
		tb_n_rst = 1'b0; @(posedge tb_clk); 
		tb_n_rst = 1'b1; 
		
 
		//0110  
		tb_i = 0;  
		@(posedge tb_clk); 
		tb_i = 1; 
		@(posedge tb_clk); 
		tb_i = 1; 
		@(posedge tb_clk); 
		tb_i = 0; 
		@(posedge tb_clk); 
		#1 
		

		//11011011
		tb_n_rst = 1'b1; @(posedge tb_clk); 
		tb_n_rst = 1'b0; @(posedge tb_clk); 
		tb_n_rst = 1'b1; 
		tb_i = 1;  
		@(posedge tb_clk); 
		tb_i = 1; 
		@(posedge tb_clk); 
		tb_i = 0; 
		@(posedge tb_clk); 
		tb_i = 1; 
		@(posedge tb_clk); 
		tb_i = 1;  
		@(posedge tb_clk); 
		tb_i = 0; 
		@(posedge tb_clk); 
		tb_i = 1; 
		@(posedge tb_clk); 
		tb_i = 1; 
		@(posedge tb_clk); 
		
		

	end 

endmodule 
