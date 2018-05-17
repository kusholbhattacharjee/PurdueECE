// $Id: $
// File name:   counter.sv
// Created:     2/13/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: counter to call flex-counter module

module counter (
	input wire clk, n_reset, cnt_up, clear, 
	output wire one_k_samples 
);

reg [9:0] count_out;

flex_counter #(.NUM_CNT_BITS(10)) count_var (.clk(clk), .n_rst(n_reset), .clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), .count_out(count_out), .rollover_flag(one_k_samples)); 

endmodule 
