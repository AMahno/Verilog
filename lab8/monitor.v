module monitor(R0, R1, R2, R3, R4, R5, R6, R7, acc, G);
	input [15:0] R0;
	input [15:0] R1;
	input [15:0] R2;
	input [15:0] R3;
	input [15:0] R4;
	input [15:0] R5;
	input [15:0] R6;
	input [15:0] R7;
	input [15:0] acc;
	input [15:0] G;
	
	always @ * begin
	 $display("Register states:");
	 $display("R0\tR1\tR2\tR3\tR4\tR5\tR6\tR7\tACC\tG");
	 $display("%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%d\t%d\t", R0, R1, R2, R3, R4, R5, R6, R7, acc, G);
	 end
endmodule