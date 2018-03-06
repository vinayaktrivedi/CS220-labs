// Verilog test fixture created from schematic /media/cse/UBUNTU 16_0/CS220/Lab_1.2/full_ader_schematic/full_adder_sch.sch - Mon Jan 15 16:05:20 2018

`timescale 1ns / 1ps

module full_adder_sch_full_adder_sch_sch_tb();

// Inputs
   reg a;
   reg b;
   reg cin;

// Output
   wire sum;
   wire cout;

// Bidirs

// Instantiate the UUT
   full_adder_sch UUT (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
   );
// Initialize Inputs
   `ifdef auto_init
       initial begin
		a = 0;
		b = 0;
		cin = 0;
   `endif
endmodule
