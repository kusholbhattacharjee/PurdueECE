// $Id: $
// File name:   sync_low.sv
// Created:     1/25/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: reset to logic low synchronizer

module sync_low (
	
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);


reg temp;
	
always_ff @ (posedge clk, negedge n_rst)
begin
	if (1'b0 == n_rst)
		begin
			temp <= 0;
		end
	else
		begin
			temp <= async_in;
		end
end

always_ff @ (posedge clk, negedge n_rst)
begin
	if (1'b0 == n_rst)
		begin
			sync_out <= 0;
		end
	else
		begin
			sync_out <= temp;
		end
end

endmodule

