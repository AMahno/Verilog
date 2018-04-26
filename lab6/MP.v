module microprogram(clk, x1, x2, reset, out);
	
	input clk;
	input x1;
	input x2;
	input reset;
	output reg out;
	
	parameter S_0 = 4'd0;
	parameter S_1 = 4'd1;
	parameter S_2 = 4'd2;
	parameter S_3 = 4'd3;
	parameter S_4 = 4'd4;
	parameter S_5 = 4'd5;
	parameter S_6 = 4'd6;
	parameter S_7 = 4'd7;
	parameter S_8 = 4'd8;
	parameter ENDSTATE = 4'd9;
	
	reg [15:0] state;
	
	always @(state) begin
		case(state)
			S_0: out <= 1'd0;
			S_1: out <= 1'd1;
			S_2: out <= 1'd0;
			S_3: out <= 1'd1;
			S_4: out <= 1'd0;
			S_5: out <= 1'd1;
			S_6: out <= 1'd0;
			S_7: out <= 1'd1;
			S_8: out <= 1'd0;
			ENDSTATE: out <= 1'd0;
			endcase
	end
	
	always @(posedge clk, posedge reset) begin
		if(reset) state <= S_0;
		else
		case(state)
			S_0:
				state <= S_1; 
			S_1:	
				state <= x1 ? S_4 : S_2; 			
			S_2:
				state <= S_3;
			S_3:
				state <= S_7;
			S_4:
				state <= S_5; 
			S_5:
				state <= x2 ? S_6 : S_4; 
			S_6:
				state <= S_8;
			S_7:
				state <= S_8;
			S_8:
				state <= ENDSTATE;
			ENDSTATE:
				state <= ENDSTATE;
			default:
				state <= S_1;
		endcase
	end
endmodule
