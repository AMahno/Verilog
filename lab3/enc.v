module decoder(in, out);
	input[4:0] in;
	output reg[9:0] out;

	always @(in)
	begin
		case(in)
			4'h0: out <= 0;
			4'h1: out <= 1;
			4'h2: out <= 2;
			4'h3: out <= 4;
			4'h4: out <= 8;
			4'h5: out <= 16;
			4'h6: out <= 32;
			4'h7: out <= 64;
			4'h8: out <= 128;
			4'h9: out <= 256;
			4'hA: out <= 512;
		default:
			out = 10'bzzzzzzzzzz;
		endcase
	end
endmodule
 