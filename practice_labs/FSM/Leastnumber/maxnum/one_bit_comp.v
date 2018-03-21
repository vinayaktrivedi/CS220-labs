`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:19 03/12/2018 
// Design Name: 
// Module Name:    one_bit_comp 
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
module one_bit_comp( clk,x,y,check,z
    );
	input clk;
   input x;
	input y;
	input [1:0]check;
	output [1:0]z;
	reg [1:0]z;
	always @(posedge clk)begin
	  if(check==2)begin
	     if(x ^ y ==0)begin
		    z <= 2;
		  end
		  else begin
		    if(x==0)begin
			   z <= 0;
			 end
			 else if(x==1)begin
			   z<=1;
			 end
		  end
	  end
	  else begin
	     z <=check;
	  end
	
	end

endmodule
