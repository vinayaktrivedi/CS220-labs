`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:47 02/05/2018 
// Design Name: 
// Module Name:    eight_bit_comparator 
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
module eight_bit_comp(PB1,PB2,PB3,PB4,Y,Z
    );
   input PB1;
	input PB2;
	input PB3;
	input PB4;
	input [3:0]Y;
	wire [1:0]temp[6:0];
	output [1:0]Z;
	reg [7:0]A;
	reg [7:0]B;
   always @(posedge PB1) begin
		A[3:0] <= Y;
	
	end
	
	always @(posedge PB2) begin
		A[7:4] <= Y;
	
	end
	
	always @(posedge PB3) begin
		B[3:0] <= Y;
	
	end
	
	always @(posedge PB4) begin
		B[7:4] <= Y;
	
	end
	
	one_bit_comparator CA0 (.x(A[7]),.y(B[7]),.cin(2'b01),.z(temp[0]));
	one_bit_comparator CA1 (.x(A[6]),.y(B[6]),.cin(temp[0]),.z(temp[1]));
	one_bit_comparator CA2 (.x(A[5]),.y(B[5]),.cin(temp[1]),.z(temp[2]));
	one_bit_comparator CA3 (.x(A[4]),.y(B[4]),.cin(temp[2]),.z(temp[3]));
	one_bit_comparator CA4 (.x(A[3]),.y(B[3]),.cin(temp[3]),.z(temp[4]));
	one_bit_comparator CA5 (.x(A[2]),.y(B[2]),.cin(temp[4]),.z(temp[5]));
	one_bit_comparator CA6 (.x(A[1]),.y(B[1]),.cin(temp[5]),.z(temp[6]));
	one_bit_comparator CA7 (.x(A[0]),.y(B[0]),.cin(temp[6]),.z(Z));
	
endmodule

