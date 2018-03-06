`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:36 01/29/2018 
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
module comparator( PB1,PB2,PB3,PB4,Y,Z
    );
	input PB1;
   input PB2;
   input PB3;
	input PB4;
	input[3:0]Y;
	output [2:0]Z;
	reg [7:0]A;
	reg [7:0]B;
	reg i;
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
	initial begin
	
	if(1'b1==1'b1) begin
	Z[0]<=1'b0;
	Z[1]<=1'b1;
	Z[2]<= 1'b0;
   end
	
	
	i <= 1'b0;
	while(i< 8) begin
	if(A[i] > B[i] ) begin
        Z[2]<=1'b1;
		  Z[1]<=1'b0;
        break;
      end
	else if(A[i]<B[i])begin
	     Z[0]<= 1'b1;
		  Z[1]<= 1'b0;
        break;
	end
	    i <= i+1;
	end
	
	end
	

endmodule
