// $Id: $
// File name:   flex_counter.sv
// Created:     1/31/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: flext counter

module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_CNT_BITS-1:0] rollover_val,
	output reg [NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 0)
		begin
			count_out <= '0;
			rollover_flag <= 0;
		end
		
		else if (clear == 1) begin
			count_out <= '0;
			rollover_flag <= 0;
		end
		else if (count_enable == 1)
		begin
			count_out <= count_out + 1;
			if (count_out + 1 == rollover_val)
				rollover_flag <= 1;
			else	
				rollover_flag <= 0;

			if (rollover_flag == 1)
				count_out <= 1;
		end
	end
endmodule
