`timescale 1ns / 1ps

// generates a pulse given a signal that changed it's state
module pulse(SR_ECHO, RESET, MEAS_EN);

	input SR_ECHO;
	input RESET;
	wire partial;

	output MEAS_EN;
	assign #1 partial = SR_ECHO || RESET;
	
	assign #1 p1 = !partial;
	assign #1 p2 = !p1;
	assign #1 p3 = !p2;
	assign #1 p4 = !(p3 || partial);
	assign #1 p5 = !p4;
	assign #1 MEAS_EN = !p5;
endmodule
