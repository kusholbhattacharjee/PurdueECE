// $Id: $
// File name:   rcv_block.sv
// Created:     2/6/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: receiver block that serially receives data and stores it parallel into a register

module rcv_block (
	
	input wire clk, n_rst, serial_in, data_read,
	output reg [7:0] rx_data,
	output reg data_ready, overrun_error, framing_error
);

//stop
wire sbc_clear;
wire sbc_enable;
wire stop_bit;

//start
wire start_bit_detected;

//rx
wire load_buffer;
wire [7:0] packet_data;

//sr9
wire shift_strobe;

//rcu
wire enable_timer;
wire packet_done;

//timer


stop_bit_chk stop ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(framing_error) );

start_bit_det start ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), .start_bit_detected(start_bit_detected) );

rx_data_buff rx ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), .packet_data(packet_data), .data_read(data_read),  .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error) );

sr_9bit sr ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit) ); 

rcu r ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_detected), .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), .enable_timer(enable_timer) ); 

timer timer_thing ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .shift_strobe(shift_strobe), .packet_done(packet_done) ); 

endmodule 


