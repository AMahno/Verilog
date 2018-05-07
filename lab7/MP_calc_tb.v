`include "MP_calc.v"

module MP_calc_tb();
	reg [15:0] tb_A;
	reg [15:0] tb_B;
	reg [15:0] tb_C;
	reg [15:0] tb_D;
	reg [7:0] tb_opcode;
	reg tb_clk = 0;
	reg tb_reset;
	reg tb_compute;
	
	wire [15:0] out;
	wire [15:0] tb_im;
	
	MP_calculator calc_inst(.A(tb_A), .B(tb_B), .C(tb_C), .D(tb_D), .opcode(tb_opcode), .out(out), .im(tb_im), .clk(tb_clk), .compute(tb_compute), .reset(tb_reset));
	
	always
		#5 tb_clk <= !tb_clk;
	
	initial begin
		tb_reset <= 1'b0;
		tb_reset <= #5 1'b1;
		tb_reset <= #10 1'b0;
		
		tb_A <= 16'd0;
		tb_B <= 16'd0;
		tb_C <= 16'd0;
		tb_D <= 16'd0;
		tb_opcode <= 8'd0;
		tb_compute <= 1'd0;
		
		
		
		tb_A <= #20 16'd2;
		tb_B <= #20 16'd2;
		tb_opcode <= #20 8'd0;
		
		tb_compute <= #25 1'd1;
		tb_compute <= #30 1'd0;
				
				
				
		tb_A <= #115 16'd10;
		tb_B <= #115 16'd3;
		tb_opcode <= #115 8'd1;
		
		tb_compute <= #115 1'd1;
		tb_compute <= #120 1'd0;
		
		
		
		tb_A <= #205 16'd5;
		tb_B <= #205 16'd5;
		tb_opcode <= #205 8'd2;
		
		tb_compute <= #205 1'd1;
		tb_compute <= #210 1'd0;
		
		
		
		tb_A <= #295 16'd8;
		tb_B <= #295 16'd2;
		tb_opcode <= #295 8'd3;
		
		tb_compute <= #295 1'd1;
		tb_compute <= #300 1'd0;
		
		
		
		tb_A <= #385 16'd10;
		tb_B <= #385 16'd8;
		tb_C <= #385 16'd6;
		tb_D <= #385 16'd4;
		tb_opcode <= #385 8'd4;
		
		tb_compute <= #385 1'd1;
		tb_compute <= #390 1'd0;
		
		
		
		tb_A <= #475 16'd20;
		tb_B <= #475 16'd10;
		tb_C <= #475 16'd8;
		tb_D <= #475 16'd2;
		tb_opcode <= #475 8'd5;
		
		tb_compute <= #475 1'd1;
		tb_compute <= #480 1'd0;
		
		
		tb_A <= #565 16'd3;
		tb_B <= #565 16'd3;
		tb_C <= #565 16'd2;
		tb_D <= #565 16'd2;
		tb_opcode <= #565 8'd6;
		
		tb_compute <= #565 1'd1;
		tb_compute <= #570 1'd0;
		
		
		
		tb_opcode <= #995 8'd7;
		
		tb_compute <= #995 1'd1;
		tb_compute <= #1000 1'd0;
		
		
		tb_A <= #1935 16'd128;
		tb_B <= #1935 16'd2;
		tb_opcode <= #1935 8'd8;
				
		tb_compute <= #1935 1'd1;
		tb_compute <= #1940 1'd0;
		
		
		tb_A <= #2025 16'd64;
		tb_B <= #2025 16'd2;
		tb_opcode <= #2025 8'd9;
				
		tb_compute <= #2025 1'd1;
		tb_compute <= #2030 1'd0;
	end
	
endmodule

