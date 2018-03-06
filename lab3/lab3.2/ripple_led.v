`timescale 1ns / 1ps
`define SHIFT_TIME 50000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:47 02/07/2018 
// Design Name: 
// Module Name:    ripple_led 
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
module ripple_led( clk,led0,led1,led2,led3,led4,led5,led6,led7
    );
   input clk;
	output led1;
	output led2;
	output led3;
	output led4;
	output led5;
	output led6;
	output led7;
	output led0;
	reg led0;
	reg led1;
	reg led2;
	reg led3;
	reg led4;
	reg led5;
	reg led6;
	reg led7;
	reg [31:0]counter;
	
	initial begin 
	 counter=0;
	 led0=1;
	 end
	always @(posedge clk) begin
	   counter = counter+1;
	   if(counter==`SHIFT_TIME) begin
		 led1 <= led0;
		 led2 <= led1;
		 led3 <= led2;
		 led4 <= led3;
		 led5 <= led4;
		 led6 <= led5;
		 led7 <= led6;
		 led0 <= led7;
		 counter = 0;
		end
	end

endmodule
