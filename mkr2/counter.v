module counter_tb();
	reg tb_clk = 0;
	reg tb_reset = 0;
	reg tb_preset = 0;
	wire [3:0] out;
	
	counter_10 cnt (.clk(tb_clk), .reset(tb_reset), .preset(tb_preset), .out(out));
	
	always
    #5 tb_clk <= !tb_clk;
	
	initial begin
		tb_reset <= 1;
		#10 tb_reset <= 0;
	end
	
	initial begin
		tb_preset <= #150 1;
		tb_preset <= #160 0;
	end
endmodule

module counter_10(clk, reset, preset, out);
	input clk, reset, preset;
	output reg [3:0] out;
	always @(posedge clk, posedge reset, posedge preset)
		if(reset) out <= 4'd0;
		else if(preset) out <= 4'd10;
		else if(out > 4'd0) out <= out - 1; else out <= 4'd10;
endmodule
