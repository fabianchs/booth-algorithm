`timescale 1ns / 1ps


module TestDeBounceButton;

	// Inputs
	logic CLK;
	logic RESET;
	logic BOT;

	// Outputs
	logic BOTOUT;

	// Instantiate the Unit Under Test (UUT)
	DeBounceButton uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.BOT(BOT), 
		.BOTOUT(BOTOUT)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		BOT = 0;

		#50
		
		RESET = 1;
		
		#50 
		
		RESET = 0;
		
		#50
		
		BOT = 1;
		
		#50 
		
		BOT = 0;
		
		#35
		
		BOT = 1;
		
		#35 
		
		BOT = 0;
		
		#35
		
		BOT = 1;
		
		#35 
		
		BOT = 0;
		
		#39
		
		BOT = 1;
		
		#39 
		
		BOT = 0;
		
		#50
		
		BOT = 1;
		
		#50 
		
		BOT = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
	initial forever
		#5 CLK = ~CLK;
      
endmodule

