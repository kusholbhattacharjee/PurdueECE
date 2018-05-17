// $Id: $
// File name:   rx_fifo.sv
// Created:     2/21/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: rx fifo call

module rx_fifo 
(
	input wire clk, n_rst, r_enable, w_enable,  
	input wire [7:0] w_data, 
	output reg [7:0] r_data, 
	output reg empty, full
); 

fifo name (.r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), .w_data(w_data), .r_data(r_data), .empty(empty), .full(full)); 

endmodule 


