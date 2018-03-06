`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:20 01/15/2018 
// Design Name: 
// Module Name:    two_bit_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module two_bit_adder(x,y,z,carry
    );
	 input [1:0]x;
	 input [1:0]y;
	 output [1:0]z;
	 output carry;
	 wire carry;
	 wire carry0;
	 full_adder FA0 (.a(x[0]),.b(y[0]),.cin(1'b0),.sum(z[0]),.cout(carry0));
    full_adder FA1 (.a(x[1]),.b(y[1]),.cin(carry0),.sum(z[1]),.cout(carry));

endmodule
