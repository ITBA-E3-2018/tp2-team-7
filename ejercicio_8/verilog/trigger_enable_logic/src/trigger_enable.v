`timescale 1ns / 1ps

module trigger_enable_logic(
	TRIG_EN,
	TRIG,
	ECHO,
	SR_TRIG,
	MEAS_RESET,
	MEAS_READY);
	
	input TRIG_EN;
	input TRIG;
	
	input ECHO;

	output SR_TRIG;
	output MEAS_READY;
	output MEAS_RESET;

	reg Q; // flip flop register
	wire CLK;
	wire MEAS_EN;

	pulse my_meas(ECHO,1'b0,MEAS_EN);	

	assign SR_TRIG = TRIG_EN && TRIG && !Q;
	assign MEAS_READY = !Q;
	
	assign CLK = TRIG && !Q;

	always @MEAS_EN
	begin
		if (MEAS_EN)
			assign Q = 0;
		else
			deassign Q;
	end
	
	always @(negedge CLK) begin
		Q <= !Q;
	end
	

endmodule 
