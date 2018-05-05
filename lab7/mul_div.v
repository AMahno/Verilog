module mul_div(A, B, out, divmul, clk, reset);
	input [15:0] A;
	input [15:0] B;
	output reg [15:0] out;
	input divmul;
	input clk;
	input reset;
	
	reg [15:0] A_reg;
	reg [15:0] B_reg;
	
	always @(posedge clk, posedge reset) begin
		if(reset) begin
			A_reg <= 4'd0;
			B_reg <= 4'd0;
			out <= 4'd0;
		end
		else begin
			A_reg <= A;
			B_reg <= B;
		end
	end
	
	always @(A_reg, B_reg)
		out <= divmul ? A_reg*B_reg : A_reg/B_reg;
		
endmodule
		
