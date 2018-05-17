// $Id: $
// File name:   sensor_s.sv
// Created:     1/19/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: Sensor Error Detector
// 

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);

wire one;
wire two;
wire three;

AND2X1 A1( .A(sensors[1]), .B(sensors[2]), .Y(one) );
AND2X1 A2( .A(sensors[1]), .B(sensors[3]), .Y(two) );
OR2X1 O1(.A(one), .B(two), .Y(three));
OR2X1 O2(.A(three), .B(sensors[0]), .Y(error));

endmodule
