`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:02 02/13/2018 
// Design Name: 
// Module Name:    top_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: rot_a;
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_module( clk,rot_a,rot_b,X,Y,steps,direction
    );
    input clk;
	 input rot_a;
	 input rot_b;
	 input [1:0]steps;
	 input [1:0]direction;
	 output [3:0]X;
	 output [3:0]Y;
	 reg [3:0]x_temp;
	 reg [3:0]y_temp;
	 reg [3:0]X;
	 reg [3:0]Y;
	 reg [4:0]temp_1;
	 reg [4:0]temp_2;
	 reg prev_event;
	 wire r_event;
	 wire [4:0]temp_3;
	 wire [4:0]temp_4;
	 reg top;
	 reg right;
	 reg left;
	 reg bottom;
	 initial begin
	   X =0;
		Y=0;
		top =0;
		right =0;
		left =0;
		bottom =0;
		prev_event=1;
	 end
	 check C1 (.clk(clk),.rot_a(rot_a),.rot_b(rot_b),.r_event(r_event));
	 
	 always @(posedge clk) begin
	  prev_event <= r_event;
	    if(prev_event==0 && r_event==1)begin
			 x_temp <= X;
			 y_temp <= Y;
	       if(direction==0)begin
			   if(steps==0)begin
				temp_1 <= 0;
				end
				else if(steps==1)begin
				temp_1 <= 31;
				end
				else if(steps==2)begin
				temp_1 <= 30;
				end
				else if(steps==3)begin
				temp_1 <= 29;
				end
				left <=1;
				right <=0;
				top <=0;
				bottom <=0;
				temp_2 <= 0;
			 end
			 else if(direction==1)begin
			   temp_1[4] <= 0;
				temp_1[3] <= 0;
				temp_1[2] <= 0;
				temp_1[1] <= 0^steps[1];
				temp_1[0] <= 0^steps[0];
				temp_2 <= 0;
				left <=0;
				right <=1;
				top <=0;
				bottom <=0;
			 end
			 else if(direction==2)begin
			   temp_2[4] <= 0;
				temp_2[3] <= 0;
				temp_2[2] <= 0;
				temp_2[1] <= 0^steps[1];
				temp_2[0] <= 0^steps[0];
				temp_1 <= 0;
				left <=0;
				right <=0;
				top <=1;
				bottom <=0;
			 end
			 else if(direction==3)begin
			  if(steps==0)begin
				temp_2 <= 0;
				end
				else if(steps==1)begin
				temp_2 <= 31;
				end
				else if(steps==2)begin
				temp_2 <= 30;
				end
				else if(steps==3)begin
				temp_2 <= 29;
				end
				temp_1 <= 0;
				left <=0;
				right <=0;
				top <=0;
				bottom <=1;
			 end
	  
	    end
	 
	 end
	 
	 five_bit_adder FB1 (.X(x_temp),.carry1(1'b0),.Y(temp_1[3:0]),.carry2(temp_1[4]),.Z(temp_3));
	 five_bit_adder FB2 (.X(y_temp),.carry1(1'b0),.Y(temp_2[3:0]),.carry2(temp_2[4]),.Z(temp_4));
	 
	 always @(posedge clk)begin
	    if(temp_3[4]==0)begin
		    X <= temp_3[3:0];
		 end
		 else if (temp_3[4]==1 && right ==1)begin
		    X <= 15;
		 end
		 else if(temp_3[4]==1 && left==1)begin
		   X <=0;
		 end
		 if(temp_4[4]==0)begin
		    Y <= temp_4[3:0];
		 end
		 else if (temp_4[4]==1 && top ==1)begin
		    Y <= 15;
		 end
		 else if(temp_4[4]==1 && bottom==1)begin
		   Y <=0;
		 end
	 end
	 

endmodule
