module state_machine(clk, w, reset, out);
	
	input clk;
	input w;
	input reset;
	output reg out;
	
	parameter S_A = 4'd0;
	parameter S_B = 4'd1;
	parameter S_C = 4'd2;
	parameter S_D = 4'd3;
	parameter S_E = 4'd4;
	parameter S_F = 4'd5;
	parameter S_G = 4'd6;
	parameter S_H = 4'd7;
	parameter S_I  = 4'd8;
	
	reg [15:0] state;
	
	always @(state) begin
		case(state)
			S_A: out <= 1'd0;
			S_B: out <= 1'd0;
			S_C: out <= 1'd0;
			S_D: out <= 1'd0;
			S_E: out <= 1'd1;
			S_F: out <= 1'd0;
			S_G: out <= 1'd0;
			S_H: out <= 1'd0;
			S_I: out <= 1'd1;
		endcase
	end
	
	always @(posedge clk, posedge reset) begin
		if(reset) state <= S_A;
		else
		case(state)
			S_A:
				state <= w ? S_F : S_B; 
			S_B:	
				state <= w ? S_F : S_C; 
			S_C:
				state <= w ? S_F : S_D; 
			S_D:
				state <= w ? S_F : S_E; 
			S_E:
				state <= w ? S_F : S_E; 
			S_F:
				state <= w ? S_G : S_B;
			S_G:
				state <= w ? S_H : S_B;
			S_H:
				state <= w ? S_I : S_B;
			S_I:
				state <= w ? S_I : S_B;
			default:
				state <= S_A;
		endcase
	end
endmodule
