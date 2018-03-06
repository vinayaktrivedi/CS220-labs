`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:48 02/05/2018 
// Design Name: 
// Module Name:    six_bit_adder 
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
module six_bit_adder(X,carry1,Y,carry2,Z,carry
    );
    input [4:0]X;
	 input [3:0]Y;
	 input carry1;
	 input carry2;
	 output carry;
	 wire carry;
	 output [5:0]Z;
	 wire [5:0]Z;
	 wire temp;
	 five_bit_adder FB1 (.X(X[3:0]),.carry1(X[4]),.Y(Y),.carry2(1'b0),.Z(Z[4:0]),.carry(temp));
	 full_adder FA6 (.a(carry1),.b(carry2),.cin(temp),.sum(Z[5]),.cout(carry));

endmodule