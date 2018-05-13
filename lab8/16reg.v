module reg_16(data, clk, reset, we, out);
	input [15:0] data;
	input clk;
	input reset;
	input we;
	output reg [15:0] out;
	
	always @(posedge clk, posedge reset)
		if(reset) out <= 16'd0;
		else if(we) out <= data;
endmodule
