`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:39 02/05/2018 
// Design Name: 
// Module Name:    one_bit_comparator 
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
module one_bit_comparator( x,y,cin,z
    );
	 input x;
	 input y;
	 input [1:0]cin;
	 output [1:0]z;
	 wire z;
	 
	     assign z[0]= (~cin[1]&cin[0])&((x&y)|(~x&~y));
		  assign z[1]= cin[1]|(~cin[1]&cin[0]&x&(~y));
		  
		  
		 
		 
		 
	     
	 


endmodule

