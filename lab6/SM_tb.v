`timescale 1ns/10ps
`include "SM.v"

module SM_tb();
	
	reg tb_clk = 0;
	reg tb_w;
	reg tb_reset;
	wire tb_out;
	
	state_machine SM_inst(.clk(tb_clk), .w(tb_w), .reset(tb_reset), .out(tb_out));
	
	always
		#5 tb_clk <= !tb_clk;
	 
	 initial begin
		tb_w <= 1'b0;
		tb_reset <= 1'b0;
		tb_reset <= #5 1'b1;
		tb_reset <=  #10 1'b0;
		tb_w <= #40 1'b1;
	 end

endmodule
