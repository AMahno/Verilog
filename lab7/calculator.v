`include "add_sub_ror.v"
`include "mul_div.v"

module calculator(A, B, C, D, opcode, out, clk, reset);
	input [15:0] A;
	input [15:0] B;
	input [15:0] C;
	input [15:0] D;
	input [7:0] opcode;
	input clk;
	input reset;
	output reg [15:0] out;

	reg [2:0] cycles_counter;
	
	reg [15:0] AU_A;
	reg [15:0] AU_B;
	reg [15:0] AU_C;
	reg [15:0] AU_D;
	reg [2:0] AU_adder_config;
	reg AU_ror_config;
	reg AU_typeop;
	wire [15:0] AU_out;
	
	reg [15:0] MS_A;
	reg [15:0] MS_B;
	wire [15:0] MS_out;
	reg MS_divmul;
	
	add_sub_ror AU_inst(.A(AU_A), .B(AU_B), .C(AU_C), .D(AU_D), 
	.adder_config(AU_adder_config), .ror_config(AU_ror_config), .typeop(AU_typeop), .clk(clk), .reset(reset), .alu_out(AU_out));	
	
	mul_div MS_inst(.A(MS_A), .B(MS_B), .out(MS_out), .divmul(MS_divmul), .clk(clk), .reset(reset));
	
	always @(posedge clk, posedge reset) begin
		if(reset) begin 
			out <= 4'd0; 
			cycles_counter <= 2'd0; 
		end else
		case(opcode)
			3'd0: //+
				begin 
					AU_A <= A;
					AU_B <= B;
					AU_C <= 4'd0;
					AU_D <= 4'd0;
					AU_adder_config <= 3'b101;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) cycles_counter = cycles_counter +1;
					else begin cycles_counter = 0; out = AU_out; end
				end
			3'd1: //-
				begin
					AU_A <= A;
					AU_B <= B;
					AU_C <= 4'd0;
					AU_D <= 4'd0;
					AU_adder_config <= 3'b100;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) cycles_counter = cycles_counter +1;
					else begin cycles_counter = 0; out = AU_out; end
				end
			3'd2: //*
				begin
					MS_A <= A;
					MS_B <= B;
					MS_divmul <= 1'b1;
					if(cycles_counter < 5) cycles_counter = cycles_counter +1;
					else begin cycles_counter = 0; out = MS_out; end
				end
			3'd3: // /
				begin
					MS_A <= A;
					MS_B <= B;
					MS_divmul <= 1'b0;
					if(cycles_counter < 5) cycles_counter = cycles_counter +1;
					else begin cycles_counter = 0; out = MS_out; end
				end
			3'd4: //+ (c)
				begin 
					AU_A <= A;
					AU_B <= B;
					AU_C <= C;
					AU_D <= D;
					AU_adder_config <= 3'b111;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) cycles_counter = cycles_counter +1;
					else begin cycles_counter = 0; out = AU_out; end
				end
			3'd5: //- (c)
				begin 
					AU_A <= A;
					AU_B <= B;
					AU_C <= C;
					AU_D <= D;
					AU_adder_config <= 3'b100;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) cycles_counter = cycles_counter +1;
					else begin cycles_counter = 0; out = AU_out; end
				end
		endcase
	end
	
endmodule
