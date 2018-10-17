
module simple_tb;

   // initial values

   integer digit;
   reg [3:0]NUMBER;
   wire [7:0]DIGITS;

   initial
     begin
        // vcd dump
        $dumpfile("bin2bcd.vcd");
        // the variable 's' is what GTKWave will label the graphs with
        $dumpvars(0, s);
        //$monitor("SR_ECHO is %b, ", SR_ECHO);
	for (digit = 0;digit <= 9;digit = digit + 1) begin
		#1 NUMBER = digit;
	end
        // setting each elements values at each time interval, must finish with $finish
	
        #495 $finish;
     end

   // stap of module
   bin_to_hex s(NUMBER, DIGITS);
endmodule
