// $Id: $
// File name:   edge_detect.sv
// Created:     2/21/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: edge detection ohhh uyeah

module edge_detect 
( 
	input wire clk,n_rst,d_plus, 
	output reg d_edge 
); 

reg d_prev;

always_ff @ (posedge clk, negedge n_rst) 
begin
	if (n_rst == 1'b0) 
	begin 
		d_prev <= d_plus; 
		d_edge <= 0; 
	end 
	else
	begin 
		d_prev <= d_plus;
		d_edge <= (d_plus != d_prev); 
	end 
end

endmodule

