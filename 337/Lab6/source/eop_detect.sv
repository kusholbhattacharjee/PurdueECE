// $Id: $
// File name:   eop_detect.sv
// Created:     2/21/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: eop kinda shizz

module eop_detect(input wire d_plus, d_minus, output reg eop);

assign eop = (~d_plus  & ~d_minus);
 
endmodule 
