// $Id: $
// File name:   adder_16bit.sv
// Created:     1/26/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: adder 16 bit

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);
	genvar i;

	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design

	adder_nbit #(.BIT_WIDTH(16)) IX ( .a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));
	//generate
	//	for(i=0; i<16; i=i+1)
	//	begin
	//		always @ (a,b,carry_in)
	//		begin
	//			assert(((a[i] + b[i] + carry_in) % 2) == sum[i])
	//			else $error("Output of 's' of 16 bit adder is not correct");
	//		end
	//	end
	//endgenerate

endmodule
