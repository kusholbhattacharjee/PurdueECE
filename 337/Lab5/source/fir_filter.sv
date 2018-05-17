// $Id: $
// File name:   fir_filter.sv
// Created:     2/13/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: fir top level code to connect all the components

module fir_filter (
	input wire clk, n_reset, data_ready, load_coeff,
	input wire [15:0] sample_data, 
	input wire [15:0] fir_coefficient, 
	output wire one_k_samples, modwait, err,
	output wire [15:0] fir_out 
); 

wire dr, lc, overflow, cnt_up, clear;
wire [2:0] op;
wire [3:0] src1;
wire [3:0] src2;
wire [3:0] dest;
wire [16:0] outreg;


controller controller1 (.clk(clk), .n_reset(n_reset), .dr(dr), .lc(lc), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .op(op), .src1(src1), .src2(src2), .dest(dest), .err(err)); 

counter counter1 (.clk(clk), .n_reset(n_reset), .cnt_up(cnt_up), .clear(clear), .one_k_samples(one_k_samples)); 

sync_low sync1 (.clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(dr)); 

sync_low sync2 (.clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(lc)); 

magnitude magnitude1 (.in(outreg), .out(fir_out)); 

datapath datapath1 (.clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(fir_coefficient), .outreg_data(outreg), .overflow(overflow));

endmodule
