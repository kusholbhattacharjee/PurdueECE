// $Id: $
// File name:   decode.sv
// Created:     2/21/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: decode part of the lab

module decode(
	input wire clk, n_rst, d_plus, shift_enable, eop,
	output reg d_orig);

reg d_old;
reg d_curr;
reg stored;
reg current;

always_ff@(posedge clk, negedge n_rst) begin 
	if (!n_rst) begin
		d_old <= d_plus;
		d_curr <= d_plus; end 
	else  begin
		d_old <= stored; 
		d_curr <= current; end
end


always_comb begin 
	current = d_plus;
	stored = d_old;
	if (shift_enable) begin
		if (eop) begin
			stored = 1;
			current = 1; end
		else
			stored = d_plus;
	end	
end

   assign d_orig = (d_old == d_curr);

endmodule
	
		
