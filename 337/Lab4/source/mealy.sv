// $Id: $
// File name:   mealy.sv
// Created:     2/5/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: mealy model for 1101

module mealy (
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

reg [2:0] current, next;

parameter [2:0] start = 0;
parameter [2:0] seq1 = 1;
parameter [2:0] seq11 = 2;
parameter [2:0] seq110 = 3;

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 0)
		current <= start;
	else
		current <= next;
end


always_comb begin 

	next = current;
	o = 0;
	
	case (current)
		start 	: next = (i==1) ? seq1:start;
		seq1  	: next = (i==1) ? seq11:start;
		seq11  	: next = (i==0) ? seq110:seq11;
		seq110  : begin
			if (i==1) begin
				o = 1;
				next = seq1;
			end else
				next = start;
		end
	endcase
	
end

endmodule









