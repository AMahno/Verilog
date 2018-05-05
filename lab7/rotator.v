module rotator(in, out, left_right, amount);
	input [15:0] in;
	input [3:0] amount;
	input left_right;
	output reg [15:0] out;
	
	always @ *
		out <= left_right ? in << amount : in >> amount;
		
endmodule
