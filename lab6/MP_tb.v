`timescale 1ns/10ps
`include "MP.v"

module MP_tb();
	
	reg tb_clk = 0;
	reg tb_x1;
	reg tb_x2;
	reg tb_reset;
	wire tb_out;
	
	microprogram MP_inst(.clk(tb_clk), .x1(tb_x1), .x2(tb_x2), .reset(tb_reset), .out(tb_out));
	
	always
		#5 tb_clk <= !tb_clk;
	 
	 initial begin
	    tb_reset <= 0;
		tb_reset <= #5 1'b1;
		tb_reset <=  #10 1'b0;
		tb_x1 <= #5 1'b0;
		tb_x2 <= #5 1'b1;
		
		tb_reset <= #75 1'b1;
		tb_reset <= #80 1'b0;
		tb_x1 <= #75 1'b0;
		tb_x2 <= #75 1'b0;
		
		tb_reset <= #140 1'b1;
		tb_reset <= #145 1'b0;
		tb_x1 <= #140 1'b1;
		tb_x2 <= #140 1'b1;
		
		tb_reset <= #200 1'b1;
		tb_reset <= #205 1'b0;
		tb_x1 <= #200 1'b1;
		tb_x2 <= #200 1'b0;
		
	 end

endmodule
