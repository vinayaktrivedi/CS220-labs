`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:01 03/05/2018 
// Design Name: 
// Module Name:    lcd_top 
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
module lcd_top(lcd_rs,lcd_w,lcd_e,data,clk
    );
     input clk;
	  output lcd_rs,lcd_w,lcd_e;
	  output [3:0]data;
	  wire lcd_rs,lcd_w,lcd_e;
	  wire [3:0]data;
	  initialise I1(.clk(clk),.string1("HELLO THERE I AM"),.string2("HACKERMAN       "),.lcd_rs(lcd_rs),.lcd_w(lcd_w),.lcd_e(lcd_e),.data(data));
	  

endmodule
