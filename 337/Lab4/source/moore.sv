// $Id: $
// File name:   moore.sv
// Created:     2/4/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: moore thing state machine

module moore (
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
parameter [2:0] seq1101 = 4;

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 0)
		current <= start;
	else
		current <= next;
end


always_comb begin

	//if (current == seq1101)
	//	o = 1;
	//else
	//	o = 0; 

	next = current;
	
	case (current)
	start 	: next = (i==1) ? seq1:start;
	seq1  	: next = (i==1) ? seq11:start;
	seq11  	: next = (i==0) ? seq110:seq11;
	seq110  : next = (i==1) ? seq1101:start;
	seq1101 : next = (i==1) ? seq11:start;
	endcase
	
end

assign o = (current == seq1101);

endmodule









