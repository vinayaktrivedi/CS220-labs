`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:09 01/29/2018 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module seven_bit_adder(PB1,PB2,PB3,PB4,Y,Z,carry

    );
   input PB1;
	input PB2;
   input PB3;
	input PB4;
	input[3:0]Y;
	output carry;
	output[6:0]Z;
	wire carry;
	wire [5:0]temp;
	reg [6:0]A;
	reg [6:0]B;
	
	always @(posedge PB1) begin
		A[3:0] <= Y;
	
	end
	
	always @(posedge PB2) begin
		A[6:4] <= Y[2:0];
	
	end
	
	always @(posedge PB3) begin
		B[3:0] <= Y;
	
	end
	
	always @(posedge PB4) begin
		B[6:4] <= Y[2:0];
	
	end
	
	full_adder FA0 (.a(A[0]),.b(B[0]),.cin(1'b0),.sum(Z[0]),.cout(temp[0]));
	full_adder FA1 (.a(A[1]),.b(B[1]),.cin(temp[0]),.sum(Z[1]),.cout(temp[1]));
	full_adder FA2 (.a(A[2]),.b(B[2]),.cin(temp[1]),.sum(Z[2]),.cout(temp[2]));
	full_adder FA3 (.a(A[3]),.b(B[3]),.cin(temp[2]),.sum(Z[3]),.cout(temp[3]));
	full_adder FA4 (.a(A[4]),.b(B[4]),.cin(temp[3]),.sum(Z[4]),.cout(temp[4]));
	full_adder FA5 (.a(A[5]),.b(B[5]),.cin(temp[4]),.sum(Z[5]),.cout(temp[5]));
	full_adder FA6 (.a(A[6]),.b(B[6]),.cin(temp[5]),.sum(Z[6]),.cout(carry));
	
	
endmodule
