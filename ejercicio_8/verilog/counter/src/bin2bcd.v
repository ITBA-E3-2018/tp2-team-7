`timescale 1ns / 1ps

// very standard Verilog module
module bcd_counter(
	CLK,
	RST,
	CRY_OUT,
	OUT
	);
	
	input CLK;
	input RST;
	
	output CRY_OUT;
	output DIGITS;

	output reg [3:0]OUT;
	
endmodule

module bin_to_hex(
	NUMBER,
	DIGITS);
	input [3:0]NUMBER;
	output [7:0]DIGITS;
	reg [7:0] data [0:9]; // a b c d e f g
	
	initial begin
		data[0] <= 7'b1111110;
		data[1] <= 7'b0110000;
		data[2] <= 7'b1101101;
		data[3] <= 7'b1111011;
		data[4] <= 7'b0110011;
		data[5] <= 7'b1010011;
		data[6] <= 7'b1011111;
		data[7] <= 7'b1110011;
		data[8] <= 7'b1111111;
		data[9] <= 7'b1110011;
	end
	
	assign DIGITS = data[NUMBER];

endmodule
