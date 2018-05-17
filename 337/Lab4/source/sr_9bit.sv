// $Id: $
// File name:   sr_9bit.sv
// Created:     2/6/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: special case of shift register designed in lab 3

module sr_9bit (

	input clk, n_rst, shift_strobe, serial_in,
	output reg [7:0] packet_data,
	output reg stop_bit
);

reg [8:0] p_data;

flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0)) main_statement (.clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out(p_data));

assign packet_data = p_data[7:0];

assign stop_bit = p_data[8];

endmodule
