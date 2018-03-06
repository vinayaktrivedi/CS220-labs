`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:55 02/05/2018 
// Design Name: 
// Module Name:    five_bit_adder 
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
module five_bit_adder(X,carry1,Y,carry2,Z,carry
    );
    input [3:0]X;
	 input [3:0]Y;
	 input carry1;
	 input carry2;
	 output carry;
	 wire carry;
	 output [4:0]Z;
	 wire [4:0]Z;
	 wire temp;
	 four_bit_adder FB0 (.A(X),.B(Y),.Z(Z[3:0]),.carry(temp));
	 full_adder FA5 (.a(carry1),.b(carry2),.cin(temp),.sum(Z[4]),.cout(carry));

endmodule
