module mux(a, b, c, d, addr, out);
	input [15:0] a;
	input [15:0] b;
	input [15:0] c;
	input [15:0] d;
	input [1:0] addr;
	output reg [15:0] out;
	
	always @*
		case(addr)
			2'd0: out = a;
			2'd1: out = b;
			2'd2: out = c;
			2'd3: out = d;
		endcase
endmodule