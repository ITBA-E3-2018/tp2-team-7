`timescale 1ns / 1ps

module simple_tb;

   // initial values
   reg TRIGGER_EN;
   reg TRIG;
   reg ECHO;

   wire SR_TRIG;
   wire MEAS_READY;
   wire MEAS_RESET;

   integer it1;

   initial
     begin
        // vcd dump
        $dumpfile("trigger_enable.vcd");
        // the variable 's' is what GTKWave will label the graphs with
        $dumpvars(0, s);
        //$monitor("SR_ECHO is %b, ", SR_ECHO);
	
	#0 TRIGGER_EN = 1;
	#0 ECHO = 0;

	for (it1 = 0;it1 <= 1000;it1=it1+1) begin
        	#1 TRIG = 1;
		
		if (it1 % 50 == 25) begin
			#0  ECHO = 0;
		end
		if (it1 % 50 == 0) begin
			#0 ECHO = 1;
		end

		#1 TRIG = 0;

        end        
	
	$finish;
        
     end

   // stap of module
   trigger_enable_logic s(TRIGGER_EN, TRIG, ECHO, SR_TRIG, MEAS_RESET, MEAS_READY);
endmodule
