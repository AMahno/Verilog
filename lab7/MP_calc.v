`include "add_sub_ror.v"
`include "mul_div.v"

module MP_calculator(A, B, C, D, opcode, compute, out, im, clk, reset);
	input [15:0] A;
	input [15:0] B;
	input [15:0] C;
	input [15:0] D;
	input [7:0] opcode;
	input clk;
	input reset;
	input compute;
	output reg [15:0] out;
	output reg [15:0] im;

	reg [15:0] state;
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
	
	reg [15:0] E;
	reg [15:0] F;
	
	add_sub_ror AU_inst(.A(AU_A), .B(AU_B), .C(AU_C), .D(AU_D), 
	.adder_config(AU_adder_config), .ror_config(AU_ror_config), .typeop(AU_typeop), .clk(clk), .reset(reset), .alu_out(AU_out));	
	
	mul_div MS_inst(.A(MS_A), .B(MS_B), .out(MS_out), .divmul(MS_divmul), .clk(clk), .reset(reset));
	
	parameter S_IDLE =  16'd0;
	parameter S_FETCH =16'd1;
	
	parameter S_add_phase_1 = 16'd2;
	parameter S_add_phase_2 = 16'd3;
	
	parameter S_sub_phase_1 = 16'd4;
	parameter S_sub_phase_2 = 16'd5;
	
	parameter S_mul_phase_1 = 16'd6;
	parameter S_mul_phase_2 = 16'd7;
	
	parameter S_div_phase_1 = 16'd8;
	parameter S_div_phase_2= 16'd9;
	
	parameter S_comp_add_phase_1 = 16'd10;
	parameter S_comp_add_phase_2 = 16'd11;
	
	parameter S_comp_sub_phase_1 = 16'd12;
	parameter S_comp_sub_phase_2 = 16'd13;
	
	parameter S_comp_mul_phase_1 = 16'd14;
	parameter S_comp_mul_phase_2 = 16'd15;
	parameter S_comp_mul_phase_3 = 16'd16;
	parameter S_comp_mul_phase_4 = 16'd17;
	parameter S_comp_mul_phase_5 = 16'd18;
	
	parameter S_comp_mul_phase_6 = 16'd19;
	parameter S_comp_mul_phase_7 = 16'd20;
	parameter S_comp_mul_phase_8 = 16'd21;
	parameter S_comp_mul_phase_9 = 16'd22;
	parameter S_comp_mul_phase_10 = 16'd23;
	
	always @(posedge clk, posedge reset)
		if(reset) begin
			cycles_counter <= 0;
			state <= S_IDLE;
			out <= 16'd0;
		end
		else
		case(state)
			S_IDLE:
				state <= compute ? S_FETCH : S_IDLE;
				
			S_FETCH:
				case(opcode)
					16'd0:
						state <= S_add_phase_1;
					16'd1:
						state <= S_sub_phase_1;
					16'd2:
						state <= S_mul_phase_1;
					16'd3:
						state <= S_div_phase_1;
					16'd4:
						state <= S_comp_add_phase_1;
					16'd5:
						state <= S_comp_sub_phase_1;
					16'd6:
						state <= S_comp_mul_phase_1;
					default:
						state <= S_IDLE;
				endcase
				
			S_add_phase_1:
				begin
					AU_A <= A;
					AU_B <= B;
					AU_C <= 16'd0;
					AU_D <= 16'd0;
					AU_adder_config <= 3'b101;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_add_phase_1;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_add_phase_2;
					end
				end
				
			S_add_phase_2:
				begin
					out <= AU_out;
					state <= S_IDLE;
				end
				
			S_sub_phase_1:
				begin
					AU_A <= A;
					AU_B <= B;
					AU_C <= 16'd0;
					AU_D <= 16'd0;
					AU_adder_config <= 3'b100;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_sub_phase_1;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_sub_phase_2;
					end
				end
				
			S_sub_phase_2:
				begin
					out <= AU_out;
					state <= S_IDLE;
				end
				
			S_mul_phase_1:
				begin
					MS_A <= A;
					MS_B <= B;
					MS_divmul <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_mul_phase_1;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_mul_phase_2;
					end
				end
			
			S_mul_phase_2:
				begin
					out <= MS_out;
					state <= S_IDLE;
				end
			
			S_div_phase_1:
				begin
					MS_A <= A;
					MS_B <= B;
					MS_divmul <= 1'b0;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_div_phase_1;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_div_phase_2;
					end
				end
			
			S_div_phase_2:
				begin
					out <= MS_out;
					state <= S_IDLE;
				end
			
			S_comp_add_phase_1:
				begin
					AU_A <= A;
					AU_B <= B;
					AU_C <= C;
					AU_D <= D;
					AU_adder_config <= 3'b111;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_add_phase_1;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_add_phase_2;
					end
				end
			
			S_comp_add_phase_2:
				begin
					out <= AU_out;
					state <= S_IDLE;				
				end
			
			S_comp_sub_phase_1:
				begin
					AU_A <= A;
					AU_B <= B;
					AU_C <= C;
					AU_D <= D;
					AU_adder_config <= 3'b100;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_sub_phase_1;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_sub_phase_2;
					end
				end
			
			S_comp_sub_phase_2:
				begin
					out <= AU_out;
					state <= S_IDLE;				
				end
			
			S_comp_mul_phase_1:
				begin
					MS_A <= A;
					MS_B <= B;
					MS_divmul <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_mul_phase_1;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_mul_phase_2;
					end
				end
				
			S_comp_mul_phase_2:
				begin
					E <= MS_out;
					state <= S_comp_mul_phase_3;
				end
			
			S_comp_mul_phase_3:
				begin
					MS_A <= C;
					MS_B <= D;
					MS_divmul <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_mul_phase_3;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_mul_phase_4;
					end
				end
				
			S_comp_mul_phase_4:
				begin
					F <= MS_out;
					AU_A <= E;
					AU_B <= F;
					AU_C <= 16'd0;
					AU_D <= 16'd0;
					AU_adder_config <= 3'b100;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_mul_phase_4;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_mul_phase_5;
					end
				end
			
			S_comp_mul_phase_5:
				begin
					out <= AU_out;
					state <= S_comp_mul_phase_6;
				end
			
			S_comp_mul_phase_6:
				begin
					MS_A <= C;
					MS_B <= B;
					MS_divmul <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_mul_phase_6;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_mul_phase_7;
					end
				end
				
			S_comp_mul_phase_7:
				begin
					E <= MS_out;
					state <= S_comp_mul_phase_8;
				end
			
			S_comp_mul_phase_8:
				begin
					MS_A <= A;
					MS_B <= D;
					MS_divmul <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_mul_phase_8;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_mul_phase_9;
					end
				end
				
			S_comp_mul_phase_9:
				begin
					F <= MS_out;
					AU_A <= E;
					AU_B <= F;
					AU_C <= 16'd0;
					AU_D <= 16'd0;
					AU_adder_config <= 3'b101;
					AU_typeop <= 1'b1;
					if(cycles_counter < 5) begin
						cycles_counter = cycles_counter +1;
						state <= S_comp_mul_phase_9;
					end
					else begin 
						cycles_counter = 0; 
						state <= S_comp_mul_phase_10;
					end
				end
			
			S_comp_mul_phase_10:
				begin
					im <= AU_out;
					state <= S_IDLE;
				end
			
			
			default:		
				state <= S_IDLE;
			endcase
endmodule
			