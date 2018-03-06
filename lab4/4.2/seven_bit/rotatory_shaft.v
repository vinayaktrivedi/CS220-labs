`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:45 02/12/2018 
// Design Name: 
// Module Name:    rotatory_shaft 
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
module rotatory_shaft(clk,rot_a,rot_b,led0,led1,led2,led3,led4,led5,led6,led7
    );
         input clk;
			input rot_a;
			input rot_b;
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
			reg r_event;
			reg r_direction;
			wire r_temp_event;
			wire r_temp_direc;
			reg prev_event;
			initial begin 
	       led0=1;
			 prev_event=1;
	      end
			check C1 (.clk(clk),.rot_a(rot_a),.rot_b(rot_b),.r_event(r_temp_event),.r_direction(r_temp_direction));
			
			always @(posedge clk)begin
			  r_event = r_temp_event;
			  r_direction = r_temp_direction;
			  prev_event <= r_event;
			  if(prev_event==0 && r_event==1)begin
			     if(r_direction==1)begin
				    led1 <= led0;
					 led2 <= led1;
					 led3 <= led2;
					 led4 <= led3;
					 led5 <= led4;
					 led6 <= led5;
					 led7 <= led6;
					 led0 <= led7;
				  end
				  if(r_direction==0)begin
				    led0 <= led1;
					 led1 <= led2;
					 led2 <= led3;
					 led3 <= led4;
					 led4 <= led5;
					 led5 <= led6;
					 led6 <= led7;
					 led7 <= led0;
				  end
			
			  end
			end

endmodule
