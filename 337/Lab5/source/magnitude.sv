// $Id: $
// File name:   magnitude.sv
// Created:     2/13/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: to do twos complement if negative output

module magnitude (
	input wire [16:0] in, 
	output wire [15:0] out 
); 

assign out = (in[16] == 1) ? ( ~(in[15:0]) + 1 ) : in[15:0];

endmodule
