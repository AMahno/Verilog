module IR(opcode, we, clk, reset, out);
	input [8:0] opcode;
	input clk;
	input reset;
	input we;
	output reg [8:0] out;
	
	always @(posedge clk, posedge reset)
		if(reset) out <= 9'd0;
		else if(we) out <= opcode;
endmodule
