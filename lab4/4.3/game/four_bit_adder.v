`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:49 02/05/2018 
// Design Name: 
// Module Name:    four_bit_adder 
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
module four_bit_adder(A,B,Z,carry
    );
    input [3:0]A;
	 input [3:0]B;
	 output [3:0]Z;
	 wire [3:0]Z;
	 output carry;
	 wire carry;
	 wire [2:0]temp;
	full_adder FA0 (.a(A[0]),.b(B[0]),.cin(1'b0),.sum(Z[0]),.cout(temp[0]));
	full_adder FA1 (.a(A[1]),.b(B[1]),.cin(temp[0]),.sum(Z[1]),.cout(temp[1]));
	full_adder FA2 (.a(A[2]),.b(B[2]),.cin(temp[1]),.sum(Z[2]),.cout(temp[2]));
	full_adder FA3 (.a(A[3]),.b(B[3]),.cin(temp[2]),.sum(Z[3]),.cout(carry));
	 

endmodule