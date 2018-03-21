`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:43 03/12/2018 
// Design Name: 
// Module Name:    finite 
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
module finite( clk,Y,final_state
    );
    input clk;
	 input [1:0]Y;
	 reg [1:0]last_input;
	 reg [3:0]initial_state;
	 output [3:0]final_state;
	 reg [3:0]final_state;
	 reg [2:0] microcode[12:0];
	 reg [3:0] disrom1[3:0];
	 reg [3:0] disrom2[3:0];
	 reg [31:0]counter;
	 reg [2:0]branch_control;
	 initial begin
	    microcode[0] <=0;
		 microcode[1] <=0;
		 microcode[2] <=0;
		 microcode[3] <=1;
		 microcode[4] <=3;
		 microcode[5] <=3;
		 microcode[6] <=0;
		 microcode[7] <=0;
		 microcode[8] <=0;
		 microcode[9] <=0;
		 microcode[10] <=2;
		 microcode[11] <=4;
		 microcode[12] <=4;
		 disrom1[0] <=4;
		 disrom1[1] <=5;
		 disrom1[2] <=6;
		 disrom1[3] <=6;
		 disrom2[0] <=11;
		 disrom2[1] <=12;
		 disrom2[2] <=12;
		 disrom2[3] <=12;
		 initial_state <=0;
		 counter <=0;
		 last_input <= Y;
	 end
	 
	 always @(posedge clk) begin
	    last_input <= Y;
		 if(counter==100000000)begin
		     counter <=0;
			  branch_control = microcode[initial_state];
                if(branch_control==0)begin
					    final_state <= initial_state+1;
						 initial_state <= initial_state+1;
 					 end
					 else if(branch_control==1)begin
					    final_state <= disrom1[last_input];
						 initial_state <= disrom1[last_input];
					 end
					 else if(branch_control==2)begin
					    final_state <= disrom2[last_input];
						 initial_state <= disrom2[last_input];
					 end
					 else if(branch_control==3)begin
					    final_state <= 7;
						 initial_state <= 7;
					 end
					 else if(branch_control==4)begin
					    final_state <= 0;
						 initial_state <= 0;
					 end
		 end
		 else begin
				 if(last_input==Y)begin
					 counter<= counter+1;
				 end
				 else begin
				    counter<=0;
					 branch_control = microcode[initial_state];
                if(branch_control==0)begin
					    final_state <= initial_state+1;
						 initial_state <= initial_state+1;
 					 end
					 else if(branch_control==1)begin
					    final_state <= disrom1[Y];
						 initial_state <= disrom1[Y];
					 end
					 else if(branch_control==2)begin
					    final_state <= disrom2[Y];
						 initial_state <= disrom2[Y];
					 end
					 else if(branch_control==3)begin
					    final_state <= 7;
						 initial_state <= 7;
					 end
					 else if(branch_control==4)begin
					    final_state <= 0;
						 initial_state <= 0;
					 end
				 end
		 end
	   
	 
	 end
	 

endmodule
