`timescale 1ns / 1ps

module simple_tb;

   // initial values
   reg SR_ECHO;
   reg RESET;
   wire MEAS_EN;

   initial
     begin
        // vcd dump
        $dumpfile("pulse.vcd");
        // the variable 's' is what GTKWave will label the graphs with
        $dumpvars(0, s);
        //$monitor("SR_ECHO is %b, ", SR_ECHO);

        // setting each elements values at each time interval, must finish with $finish
	#0 RESET = 0;
	#0 SR_ECHO = 0;

        #500 SR_ECHO = 1;
	#30 SR_ECHO = 0;
        
	//#50 A = 4'b0000;
        #495 $finish;
     end

   // stap of module
   pulse s(SR_ECHO, RESET, MEAS_EN);
endmodule
