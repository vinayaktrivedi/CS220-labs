`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:01:14 03/13/2018 
// Design Name: 
// Module Name;:    sorting 
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
module sorting( lcd_rs,lcd_w,lcd_e,data,X,clk
    );
   input [3:0]X;
	input clk;
	output lcd_rs,lcd_w,lcd_e;
	output [3:0]data;
	wire lcd_rs,lcd_w,lcd_e;
	wire [3:0]data;
	reg [2:0]position;
	reg [1:0]num_zeros;
	reg [1:0]num_ones;
	reg [1:0] Z[3:0];
	reg [3:0]Y;
	reg state;
	reg [127:0]string1;
	reg [127:0]string2;
	initial begin
	  state<=0;
	  num_zeros<=0;
	  num_ones<=0;
	  position<=4;
	 end
	always @(posedge clk)begin
	   if(position==0 && state==0)begin
		  num_ones<=0;
		  position <=4;
		  state<=1;
		end
		else if(position==0 && state==1)begin
		  num_zeros<=0;
		  num_ones<=0;
		  position <=4;
		  state<=0;
		end
		else begin
		  if(state==0)begin
		   if(X[position-1]==0)begin
			   Z[position-1]<=3-num_zeros;
				Y[3-num_zeros]<=0;
				num_zeros<=num_zeros+1;
				position<=position-1;
			end
			else if(X[position-1]==1)begin
			   position<=position-1;
			end
		  end
		  else if(state==1)begin
			 if(X[position-1]==1)begin
			   Z[position-1]<=3-num_zeros-num_ones;
				Y[3-num_zeros-num_ones]<=1;
				num_ones<=num_ones+1;
				position<=position-1;
			end
			else if(X[position-1]==0)begin
			   position<=position-1;
			end
		end
	  end
	     string1[127:121] <= 24;
	     string1[120] <= X[3];
	     string1[119:113]<=24;
		  string1[112] <= X[2];
		  string1[111:105]<=24;
		  string1[104] <= X[1];
		  string1[103:97]<=24;
		  string1[96] <= X[0];
		  string1[95:32]<="        ";
		  string1[31:25]<=24;
		  string1[24] <= Y[3];
		  string1[23:17]<=24;
		  string1[16] <= Y[2];
		  string1[15:9]<=24;
		  string1[8] <= Y[1];
		  string1[7:1]<=24;
		  string1[0] <= Y[0];
		  string2[127:122] <= 12;
		  string2[121:120]<=Z[0];
		  string2[119:112]<=44;
		  string2[111:106]<=12;
		  string2[105:104]<=Z[1];
		  string2[103:96]<=44;
		  string2[95:90]<=12;
		  string2[89:88]<=Z[2];
		  string2[87:80]<=44;
		  string2[79:74]<=12;
		  string2[73:72]<=Z[3];
		  string2[71:0]<="         ";
	end
     initialise I1(.clk(clk),.string1(string1),.string2(string2),.lcd_rs(lcd_rs),.lcd_w(lcd_w),.lcd_e(lcd_e),.data(data));
endmodule
