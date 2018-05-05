`include "mux.v"
`include "arithmetic.v"
`include "rotator.v"

module add_sub_ror(A, B, C, D, adder_config, ror_config, typeop, clk, reset, alu_out);
	input [15:0] A;
	input [15:0] B;
	input [15:0] C;
	input [15:0] D;
	input [2:0] adder_config;
	input ror_config;
	input typeop;
	input clk;
	input reset;
	output reg [15:0] alu_out;

	wire [15:0] arithmetic_out;
	wire [15:0] rotator_out;
	
	always @(posedge clk, posedge reset)
	if(reset) alu_out <= 4'd0;
	else alu_out <= typeop ? arithmetic_out : rotator_out;
		
	
	reg [15:0] A_reg;
	reg [15:0] B_reg;
	reg [15:0] C_reg;
	reg [15:0] D_reg;
			
	wire [15:0] higher_operand_0;
	wire [15:0] higher_operand_1;
	
	reg [15:0] higher_operand_0_reg;
	reg [15:0] higher_operand_1_reg;
		
	always @(posedge clk, posedge reset) begin
		if(reset) begin
			A_reg <= 4'd0;
			B_reg <= 4'd0;
			C_reg <= 4'd0;
			D_reg <= 4'd0;
		end
		else begin
			A_reg <= A;
			B_reg <= B;
			C_reg <= C;
			D_reg <= D;
		end
	end
	
	rotator rotator_inst (.in(A_reg), .out(rotator_out), .left_right(ror_config), .amount(B_reg[3:0]));
		
	arithmetic arithmetic_0(.A(A_reg), .B(B_reg), .addsub(adder_config[0]), .out(higher_operand_0));
	arithmetic arithmetic_1(.A(C_reg), .B(D_reg), .addsub(adder_config[1]), .out(higher_operand_1));
	
	always @(posedge clk, posedge reset) begin
		if(reset) begin
			higher_operand_0_reg <= 4'd0;
			higher_operand_1_reg <= 4'd0;
		end
		else begin
			higher_operand_0_reg <= higher_operand_0;
			higher_operand_1_reg <= higher_operand_1;
		end
	end
	
	arithmetic highest(.A(higher_operand_0_reg), .B(higher_operand_1_reg), .addsub(adder_config[2]), .out(arithmetic_out));
	
endmodule