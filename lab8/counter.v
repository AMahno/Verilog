module counter(clk, clear, out, run);
	input clk;
	input clear;
	input run;
	output reg [1:0] out;
	
	always @(posedge clk)
		if(clear)
			out <= 2'd0;
		else if(run) if(out <= 3) out <= out + 1; else out <= 2'd0;
endmodule
