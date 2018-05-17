// $Id: $
// File name:   shift_register.sv
// Created:     2/28/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: initial shift_regsiter design

module shift_register 
(
	input wire clk,n_rst,shift_enable,d_orig, 
	output wire [7:0] rcv_data
); 

flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) eight_bit_sr (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(rcv_data)); 

endmodule 
