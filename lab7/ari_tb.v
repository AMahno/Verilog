`timescale 1ns/10ps
`include "add_sub_ror.v"
module ari_tb();
	reg tb_clk = 0;
	reg tb_reset = 0;
	reg [15:0] tb_A;
	reg [15:0] tb_B;
	reg [15:0] tb_C;
	reg [15:0] tb_D;
	reg [2:0] tb_adder_config;
	reg tb_ror_config;
	reg tb_typeop;
	wire [15:0] tb_out;

	add_sub_ror alu_inst(.A(tb_A), .B(tb_B), .C(tb_C), .D(tb_D), 
	.adder_config(tb_adder_config), .ror_config(tb_ror_config), .typeop(tb_typeop), 
	.clk(tb_clk), .reset(tb_reset), .alu_out(tb_out));
	
	always
		#5 tb_clk <= !tb_clk;
		
	initial begin
		tb_reset <= 1'b0;
		tb_reset <= #5 1'b1;
		tb_reset <= #10 1'b0;
		
		tb_A <= 4'd0;
		tb_B <= 4'd0;
		tb_C <= 4'd0;
		tb_D <= 4'd0;
		tb_typeop <= 1'b1;
		
		tb_A <= #20 4'd2;
		tb_B <= #20 4'd2;
		tb_C <= #20 4'd2;
		tb_D <= #20 4'd2;
		tb_adder_config <= #20 3'b101;
		
		tb_A <= #50 4'd10;
		tb_B <= #50 4'd2;
		tb_C <= #50 4'd0;
		tb_D <= #50 4'd0;
		tb_adder_config <= #40 3'b100;
		
		tb_A <= #80 4'd4;
		tb_B <= #80 4'd6;
		tb_C <= #80 4'd8;
		tb_D <= #80 4'd10;
		tb_adder_config <= #60 3'b111;
		
		tb_A <= #110 4'd10;
		tb_B <= #110 4'd8;
		tb_C <= #110 4'd6;
		tb_D <= #110 4'd4;
		tb_adder_config <= #110 3'b100;
		
		tb_A <= #140 4'd8;
		tb_B <= #140 4'd2;
		tb_typeop <= #140 1'b0;
		tb_ror_config <= #140 1'b1;
		
		tb_ror_config <= #160 1'b0;
	end
	
endmodule
