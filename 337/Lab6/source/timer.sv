// $Id: $
// File name:   timer.sv
// Created:     2/28/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: timer block duhhh

module timer 
(
	input wire clk,n_rst,d_edge,rcving, 
	output wire shift_enable,byte_received 
); 

	localparam ROLLOVER= 4'd8; 
	reg [3:0] clk_out; 
	wire clear = (byte_received || ~rcving);
	assign shift_enable = (clk_out == 4'd3); 

	flex_counter clock (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(rcving), .rollover_val(ROLLOVER), .count_out(clk_out), .rollover_flag());  	 
	
	flex_counter bits (.clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(shift_enable), .rollover_val(ROLLOVER), .count_out(), .rollover_flag(byte_received)); 


endmodule 
