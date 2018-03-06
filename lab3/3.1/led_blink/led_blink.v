`timescale 1ns / 1ps
`define OFF_TIME 25000000
`define ON_TIME 50000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:04 02/07/2018 
// Design Name: 
// Module Name:    led_blink 
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
module led_blink( clk,Z
    );
	 input clk;
	 output Z;
	 reg [31:0]counter;
	 reg Z;
	 initial begin
	   counter=0;
	 end
	 always @(posedge clk) begin
	   counter = counter+1;
		if(counter==`OFF_TIME)begin
		Z = 0;
		end
		else if(counter==`ON_TIME)begin
		Z=1;
		counter=0;
		end
	 
	 end


endmodule
