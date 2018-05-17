// $Id: $
// File name:   usb_receiver.sv
// Created:     2/28/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: usb_receiver code

module usb_receiver 
(
	input wire clk,n_rst,d_plus,d_minus,r_enable,
	output wire [7:0] r_data, 
	output wire empty,full,rcving,r_error
); 

wire shift_enable; 
wire eop; 
wire d_orig; 
wire d_edge; 
wire byte_received; 
wire [7:0] rcv_data; 
wire w_enable;

decode decoding (.clk(clk), .n_rst(n_rst), .d_plus(d_plus), .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig)); 

edge_detect edge_detecting (.clk(clk), .n_rst(n_rst), .d_plus(d_plus), .d_edge(d_edge)); 

timer timing (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .shift_enable(shift_enable), .byte_received(byte_received)); 

shift_register registering (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .d_orig(d_orig), .rcv_data(rcv_data)); 

rx_fifo fifoing (.clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), .w_data(rcv_data), .r_data(r_data), .empty(empty), .full(full)); 

eop_detect eop_detecting (.d_plus(d_plus), .d_minus(d_minus), .eop(eop)); 

rcu rcuing (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .shift_enable(shift_enable), .rcv_data(rcv_data), .byte_received(byte_received), .rcving(rcving), .w_enable(w_enable), .r_error(r_error)); 

endmodule 
