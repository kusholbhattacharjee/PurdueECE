// $Id: $
// File name:   timer.sv
// Created:     2/6/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: timer code

module timer( input wire clk, input wire n_rst, input wire enable_timer, output reg shift_strobe, output reg packet_done);

localparam ROLL_CLK = 4'd10;
localparam ROLL_BIT = 4'd9;
reg [3:0] temp_clk;
reg [3:0] temp_bit;

flex_counter clk_cnt ( .clk(clk), .n_rst(n_rst), .clear(~enable_timer), .count_enable(enable_timer), .rollover_val(ROLL_CLK), .count_out(temp_clk), .rollover_flag(shift_strobe) );
flex_counter bit_cnt ( .clk(clk), .n_rst(n_rst), .clear(~enable_timer), .count_enable(shift_strobe), .rollover_val(ROLL_BIT), .count_out(temp_bit), .rollover_flag(packet_done) );

endmodule
