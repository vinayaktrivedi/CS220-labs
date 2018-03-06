`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:26 02/12/2018 
// Design Name: 
// Module Name:    seven_bit 
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
module seven_bit( clk,rot_a,rot_b,Z,overflow,X
    );
         input clk;
			input [3:0]X;
			reg [6:0]A;
			reg [6:0]B;
			wire [6:0]temp;
			wire [5:0]temp_carry;
			reg opcode;
			input rot_a;
			input rot_b;
			output [6:0]Z;   
			output overflow;
			reg [2:0]count;
			wire r_temp_event;
			reg prev_event;
			initial begin 
			 count=1;
			 prev_event=1;
	      end
			check C1 (.clk(clk),.rot_a(rot_a),.rot_b(rot_b),.r_event(r_temp_event));
			always @(posedge clk)begin
			    prev_event <= r_temp_event;
				 if((prev_event==0) && (r_temp_event==1))begin
					 if(count==1)begin
						A[3:0] <= X;
						count <= 2;
					 end
					 else if(count == 2)begin
						A[6:4] <= X[2:0];
						count <= 3;
					 end
					 else if(count==3)begin
						B[3:0] <= X;
						count <= 4;
					 end
					 else if(count == 4)begin
						B[6:4] <= X[2:0];
						count <= 5;
					 end
					 else if(count == 5)begin
						opcode <= X[0];
						count <= 1;
					 end
				 end
			end
			
			assign temp[0] = B[0]^opcode;
			assign temp[1] = B[1]^opcode;
			assign temp[2] = B[2]^opcode;
			assign temp[3] = B[3]^opcode;
			assign temp[4] = B[4]^opcode;
			assign temp[5] = B[5]^opcode;
			assign temp[6] = B[6]^opcode;
			full_adder FA0 (.a(temp[0]),.b(A[0]),.cin(opcode),.sum(Z[0]),.cout(temp_carry[0]));
		   full_adder FA1 (.a(temp[1]),.b(A[1]),.cin(temp_carry[0]),.sum(Z[1]),.cout(temp_carry[1]));
			full_adder FA2 (.a(temp[2]),.b(A[2]),.cin(temp_carry[1]),.sum(Z[2]),.cout(temp_carry[2]));
			full_adder FA3 (.a(temp[3]),.b(A[3]),.cin(temp_carry[2]),.sum(Z[3]),.cout(temp_carry[3]));
			full_adder FA4 (.a(temp[4]),.b(A[4]),.cin(temp_carry[3]),.sum(Z[4]),.cout(temp_carry[4]));
			full_adder FA5 (.a(temp[5]),.b(A[5]),.cin(temp_carry[4]),.sum(Z[5]),.cout(temp_carry[5]));
			full_adder FA6 (.a(temp[6]),.b(A[6]),.cin(temp_carry[5]),.sum(Z[6]),.cout(overflow));

endmodule
