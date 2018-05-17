// $Id: $
// File name:   adder_1bit.sv
// Created:     1/23/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: 1 bit Full Adder module with the following specs
// 

module adder_1bit (

	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);

//s = c_in xor (a xor b)
//c_out = ((not c_in) and b and a) or (c_in and (b or a))

	wire temp;
	
	XOR2X1 one ( .A(a), .B(b), .Y(temp) );
	XOR2X1 two ( .A(carry_in), .B(temp), .Y(sum) );

	assign carry_out = ((~carry_in) && b && a) || (carry_in && (b || a));

endmodule