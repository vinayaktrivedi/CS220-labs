`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:09 03/12/2018 
// Design Name: 
// Module Name:    fincomp 
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
module fincomp(lcd_rs,lcd_w,lcd_e,data,X,clk,PB1,PB2,PB3,PB4,Z
    );
     input [2:0]X;
	  output [2:0]Z;
	  reg [2:0]Z;
	  output lcd_rs,lcd_w,lcd_e;
	  output [3:0]data;
	  wire lcd_rs,lcd_w,lcd_e;
	  wire [3:0]data;
	  reg [2:0]A;
	  reg [2:0]B;
	  reg [2:0]C;
	  reg [2:0]D;
	  input PB1;
	  input PB2;
	  input PB3;
	  input PB4;
	  input clk;
	  reg [127:0]print;
	  reg [127:0]print2;
	  wire [2:0] temp[2:0];
	  always @(posedge PB1) begin
		A[2:0] <= X;
	  end
	  
	  always @(posedge PB2) begin
		B[2:0] <= X;
	  
	  end
	  
	  always @(posedge PB3) begin
		C[2:0] <= X;
	  
	  end
	  
	  always @(posedge PB4) begin
		D[2:0] <= X;
	  end
     always @(posedge clk)begin
	     
        print[127:120] <= A+48;
		  Z<= print[122:120];
		  print[119:112]<=44;
		  print[111:104]<=B+48;
		  print[103:96]<=44;
		  print[95:88]<=C+48;
		  print[87:80]<=44;
		  print[79:72]<=D+48;
		  print[71:0]<="         ";
		  print2[127:120] <= temp[2]+48;
		  print2[119:0] <="               ";
     end	  
	  comparator C1(.X(A),.Y(B),.Z(temp[0]),.clk(clk));
     comparator C2(.X(temp[0]),.Y(C),.Z(temp[1]),.clk(clk));
     comparator C3(.X(temp[1]),.Y(D),.Z(temp[2]),.clk(clk));
	  initialise I1(.clk(clk),.string1(print),.string2(print2),.lcd_rs(lcd_rs),.lcd_w(lcd_w),.lcd_e(lcd_e),.data(data));

endmodule
