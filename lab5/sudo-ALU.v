module sudo_ALU(opcode, a, b, y);
	
	input [1:0] opcode;
	input [7:0] a;
	input [7:0] b;
	output reg [15:0] y;
	
	parameter add = 2'd0;
	parameter mul = 2'd1;
	parameter dec = 2'd2;
	parameter pass = 2'd3;
	
	always @(a, b) begin
		case(opcode)
		add:
			y <= a+b;
		mul:
			y <= a*b;
		dec:
			y <= a-1;
		pass:
			y <= b;
		endcase
	end
	
endmodule
	
