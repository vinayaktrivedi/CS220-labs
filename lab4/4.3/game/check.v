`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:11 02/12/2018 
// Design Name: 
// Module Name:    check 
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
module check( clk,rot_a,rot_b,r_event
    );
     input clk;
	  input rot_a;
	  input rot_b;
	  output r_event;
	  reg r_event;
	  always @(posedge clk) begin
	  if(rot_a==1 && rot_b==1) begin
	    r_event <= 1;
	    end
	  if(rot_a==0 && rot_b==0) begin
	    r_event <= 0;
	    end
	  end

endmodule