`include "calculator.v"

module calc_tb();
	reg [15:0] tb_A;
	reg [15:0] tb_B;
	reg [15:0] tb_C;
	reg [15:0] tb_D;
	reg [7:0] tb_opcode;
	reg tb_clk = 0;
	reg tb_reset;
	
	wire [15:0] out;
	
	calculator calc_inst(.A(tb_A), .B(tb_B), .C(tb_C), .D(tb_D), .opcode(tb_opcode), .out(out), .clk(tb_clk), .reset(tb_reset));
	
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
		tb_opcode <= 3'd0;
		
		tb_A <= #20 4'd2;
		tb_B <= #20 4'd2;
		tb_opcode <= #20 3'd0;
		
		tb_A <= #85 4'd10;
		tb_B <= #85 4'd2;
		tb_opcode <= #85 3'd1;
		
		tb_A <= #145 4'd5;
		tb_B <= #145 4'd5;
		tb_opcode <= #145 3'd2;
		
		tb_A <= #195 4'd10;
		tb_B <= #195 4'd2;
		tb_opcode <= #195 3'd3;
		
		tb_A <= #255 4'd10;
		tb_B <= #255 4'd8;
		tb_C <= #255 4'd6;
		tb_D <= #255 4'd4;
		tb_opcode <= #255 3'd4;
		
		tb_A <= #315 4'd20;
		tb_B <= #315 4'd10;
		tb_C <= #315 4'd8;
		tb_D <= #315 4'd2;
		tb_opcode <= #315 3'd5;
	end
	
endmodule
