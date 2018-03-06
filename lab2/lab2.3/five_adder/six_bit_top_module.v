`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:53 02/05/2018 
// Design Name: 
// Module Name:    six_bit_top_module 
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
module six_bit_top_module(X,PB1,PB2,PB3,PB4,Z,carry,PB5
    );
	 input [3:0]X;
	 input PB1;
	 input PB2;
	 input PB3;
	 input PB4;
	 input PB5;
	 output carry;
	 output [5:0]Z;
	 reg [3:0]A;
	reg [3:0]B;
	reg [3:0]C;
	reg [3:0]D;
	reg [3:0]E;
	wire [3:0]temp1;
	wire [3:0]temp2;
	wire temp3;
	wire temp4;
	wire [4:0]temp5;
	wire temp6;
	wire temp7;
	wire temp8;
	 always @(posedge PB1) begin
		A[3:0] <= X;
	
	end
	
	always @(posedge PB2) begin
		B[3:0]<= X;
	
	end
	
	always @(posedge PB3) begin
		C[3:0] <= X;
	
	end
	
	always @(posedge PB4) begin
		D[3:0] <= X;
	
	end
	
	always @(posedge PB4) begin
		E[3:0] <= X;
	
	end
  
  four_bit_adder FO1 (.A(A),.B(B),.Z(temp1),.carry(temp3) );
  four_bit_adder FO2 (.A(C),.B(D),.Z(temp2),.carry(temp4) );
  five_bit_adder FV1 (.X(temp1),.carry1(temp3),.Y(temp2),.carry2(temp4),.Z(temp5),.carry(temp6));
  four_bit_adder FO6 (.A(temp5[3:0]),.B(E),.Z(Z[3:0]),.carry(temp7));
  full_adder FA8 (.a(temp5[4]),.b(temp7),.cin(1'b0),.sum(Z[4]),.cout(temp8));
  full_adder FA9 (.a(temp6),.b(temp8),.cin(1'b0),.sum(Z[5]),.cout(carry));
endmodule
