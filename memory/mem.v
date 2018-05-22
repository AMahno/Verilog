module mem(addr, out);
	input [255:0] addr;
	output reg [15:0] out;
	
	reg [15:0] memory [0:255];
	
	always @(addr)
		out = memory[addr];
	
	initial 
		$readmemh("memory.list", memory);
	
endmodule
