module mux_8_to_1(data, adr, enable, out);
	input [7:0] data;
	input [2:0] adr;
	input enable;
	output out;
	
	assign out = (enable) ? 1'bz :(data[adr]);
endmodule
