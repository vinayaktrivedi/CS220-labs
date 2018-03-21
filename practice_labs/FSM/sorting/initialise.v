`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:22 03/05/2018 
// Design Name: 
// Module Name:    initialise 
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
module initialise(clk,string1,string2,lcd_rs,lcd_w,lcd_e,data
    );
      input clk;
		input [127:0]string1;
		input [127:0]string2;
		output lcd_rs;
		output lcd_w,lcd_e;
		output [3:0]data;
		reg lcd_rs,lcd_e,lcd_w;
		reg [3:0]data;
		reg [31:0]counter;
		reg [2:0]state;
		reg [5:0]flag;
		reg [1:0]waiting;
		reg [4:0]characters;
		reg [6:0]bits;
		initial begin
		   bits <= 127;
		   characters =0;
		   counter = 0;
			flag=0;
			state = 0;
			waiting=0;
		end
		
		always @(posedge clk) begin
					if(state==0) begin
						if(counter==1000000) begin
						  if(flag==0 || flag==1 || flag==2 || flag==3) begin
							  if(waiting==0)begin
								 lcd_e <=0;
								 waiting <= waiting+1;
								 counter <=0;
							  end
							  else if(waiting ==1)begin
								 if(flag==3)begin
									data <=2;
								 end
								 else begin
									data <= 3;
								 end
								 lcd_rs <=0;
								 lcd_w <=0;
								 waiting <= waiting+1;
								 counter <= 0;
							  end
							  else if(waiting==2)begin
								 lcd_e <=1;
								 waiting <= 0;
								 counter <=0;
								 flag <= flag+1;
							  end
							
						  end
						  else if(flag==4 || flag==5)begin
							 if(waiting==0)begin
								 lcd_e <=0;
								 waiting <= waiting+1;
								 counter <=0;
							  end
							  else if(waiting ==1)begin
								 if(flag==4)begin
									data <=2;
								 end
								 else begin
									data <= 8;
								 end
								 lcd_rs <=0;
								 lcd_w <=0;
								 waiting <= waiting+1;
								 counter <= 0;
							  end
							  else if(waiting==2)begin
								 lcd_e <=1;
								 waiting <= 0;
								 counter <=0;
								 flag <= flag+1;
							  end
							
						  end
						  else if(flag==6 || flag==7)begin
							 if(waiting==0)begin
								 lcd_e <=0;
								 waiting <= waiting+1;
								 counter <=0;
							  end
							  else if(waiting ==1)begin
								 if(flag==6)begin
									data <=0;
								 end
								 else begin
									data <= 6;
								 end
								 lcd_rs <=0;
								 lcd_w <=0;
								 waiting <= waiting+1;
								 counter <= 0;
							  end
							  else if(waiting==2)begin
								 lcd_e <=1;
								 waiting <= 0;
								 counter <=0;
								 flag <= flag+1;
							  end
							
						  end
						  else if(flag==8 || flag==9)begin
							 if(waiting==0)begin
								 lcd_e <=0;
								 waiting <= waiting+1;
								 counter <=0;
							  end
							  else if(waiting ==1)begin
								 if(flag==8)begin
									data <=0;
								 end
								 else begin
									data <= 12;
								 end
								 lcd_rs <=0;
								 lcd_w <=0;
								 waiting <= waiting+1;
								 counter <= 0;
							  end
							  else if(waiting==2)begin
								 lcd_e <=1;
								 waiting <= 0;
								 counter <=0;
								 flag <= flag+1;
							  end
							
						  end
						  else if(flag==10 || flag==11)begin
							 if(waiting==0)begin
								 lcd_e <=0;
								 waiting <= waiting+1;
								 counter <=0;
							  end
							  else if(waiting ==1)begin
								 if(flag==10)begin
									data <=0;
								 end
								 else begin
									data <= 1;
								 end
								 lcd_rs <=0;
								 lcd_w <=0;
								 waiting <= waiting+1;
								 counter <= 0;
							  end
							  else if(waiting==2)begin
								 lcd_e <=1;
								 waiting <= 0;
								 counter <=0;
								 flag <= flag+1;
							  end
							
						  end
						  else if(flag==12)begin
							 state <= state+1;
							 flag <=0;
							 counter <=0;
							 waiting <=0;
						  end
						end
						else begin
						  counter <= counter + 1;
						end
					end
			
			
			
						else if(state==1)begin
							if(counter==1000000) begin
								if(flag==0 || flag==1)begin
								  if(waiting==0)begin
									 lcd_e <=0;
									 waiting <= waiting+1;
									 counter <=0;
								  end
								  else if(waiting ==1)begin
									 if(flag==0)begin
										data <=8;
									 end
									 else begin
										data <= 0;
									 end
									 lcd_rs <=0;
									 lcd_w <=0;
									 waiting <= waiting+1;
									 counter <= 0;
								  end
								  else if(waiting==2)begin
									 lcd_e <=1;
									 waiting <= 0;
									 counter <=0;
									 flag <= flag+1;
								  end
								  
								end
								else begin
								  if(characters==16)begin
									 state<=state+1;
									 bits <= 127;
									 counter<=0;
									 waiting<=0;
									 flag<=0;
									 characters<=0;
								  end
								  else begin
											 if(waiting==0)begin
											 lcd_e <=0;
											 waiting <= waiting+1;
											 counter <=0;
										  end
										  else if(waiting ==1)begin
											 data<={string1[bits],string1[bits-1],string1[bits-2],string1[bits-3]};
											 bits<=bits-4;
											 lcd_rs <=1;
											 lcd_w <=0;
											 waiting <= waiting+1;
											 counter <= 0;
										  end
										  else if(waiting==2)begin
											 lcd_e <=1;
											 waiting <= 0;
											 counter <=0;
											 flag<=flag+1;
										  end
										  if(flag==4)begin
											  characters<=characters+1;
											  flag<=2;
											  counter <=0;
										  end
								  end
								
								end
							end
							else begin
							  counter <= counter +1;
							end
						end
			
			
			
					
					else if(state==2)begin
						if(counter==1000000) begin
							if(flag==0 || flag==1)begin
							  if(waiting==0)begin
								 lcd_e <=0;
								 waiting <= waiting+1;
								 counter <=0;
							  end
							  else if(waiting ==1)begin
								 if(flag==0)begin
									data <=12;
								 end
								 else begin
									data <= 0;
								 end
								 lcd_rs <=0;
								 lcd_w <=0;
								 waiting <= waiting+1;
								 counter <= 0;
							  end
							  else if(waiting==2)begin
								 lcd_e <=1;
								 waiting <= 0;
								 counter <=0;
								 flag <= flag+1;
							  end
							  
							end
							else begin
							  if(characters==16)begin
								state<=state+1;
								 bits <= 127;
								 counter<=0;
								 waiting<=0;
								 flag<=0;
								 characters<=0;
							  end
							  else begin
										 if(waiting==0)begin
										 lcd_e <=0;
										 waiting <= waiting+1;
										 counter <=0;
									  end
									  else if(waiting ==1)begin
										 data<={string2[bits],string2[bits-1],string2[bits-2],string2[bits-3]};
										 bits <=bits-4;
										 lcd_rs <=1;
										 lcd_w <=0;
										 waiting <= waiting+1;
										 counter <= 0;
									  end
									  else if(waiting==2)begin
										 lcd_e <=1;
										 waiting <= 0;
										 counter <=0;
										 flag<=flag+1;
									  end
									  if(flag==4)begin
										  characters<=characters+1;
										  flag<=2;
										  counter <=0;
									  end
							  end
							
							end
						end
						else begin
						  counter <= counter +1;
						end
					end
			
					else if(state==3)begin
					   lcd_e <=0;
					   bits <= 127;
		            characters <=0;
		            counter <= 0;
			         flag<=0;
			         state <= 0;
			         waiting<=0;
					end
		end

endmodule
