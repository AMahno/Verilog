module mux16(R0, R1, R2, R3, R4, R5, R6, R7, DIN, G, regSelect, Gout, DINout, out);
	input [15:0] R0;
	input [15:0] R1;
	input [15:0] R2;
	input [15:0] R3;
	input [15:0] R4;
	input [15:0] R5;
	input [15:0] R6;
	input [15:0] R7;
	input [15:0] DIN;
	input [15:0] G;
	
	input Gout;
	input DINout;
	input [2:0] regSelect;
	
	output reg [15:0] out;
		
	always @*
		begin
			if(Gout)
				out = G;
			else
				if(DINout)
					out = DIN;
					else
						case(regSelect)
							3'd0: out = R0;
							3'd1: out = R1;
							3'd2: out = R2;
							3'd3: out = R3;
							3'd4: out = R4;
							3'd5: out = R5;
							3'd6: out = R6;
							3'd7: out = R7;
						endcase
		end
endmodule
