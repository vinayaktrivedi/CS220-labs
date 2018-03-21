`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:32 03/12/2018 
// Design Name: 
// Module Name:    comparator 
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
module comparator(X,Y,Z,clk
    );
   input [2:0]X;
	input [2:0]Y;
	output [2:0]Z;
	reg [2:0]Z;
	input clk;
	wire [1:0] temp[2:0];
	one_bit_comp OB1 (.clk(clk),.x(X[2]),.y(Y[2]),.check(2),.z(temp[0]));
	one_bit_comp OB2 (.clk(clk),.x(X[1]),.y(Y[1]),.check(temp[0]),.z(temp[1]));
	one_bit_comp OB3 (.clk(clk),.x(X[0]),.y(Y[0]),.check(temp[1]),.z(temp[2]));
   always @(posedge clk)begin
	  if(temp[2]==0)begin
	    Z <=X;
	  end
	  else if(temp[2]==1)begin
	    Z <= Y;
	  end
	  else if(temp[2]==2)begin
	    Z <=X;
	  end
	  
	end
endmodule
