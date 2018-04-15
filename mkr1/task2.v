`timescale 1 ns/ 10 ps
module task2(clk, reset, data_a, data_b);
	output reg clk;
	output reg reset;
	output reg [7:0] data_a;
	output reg [7:0] data_b;
	
	initial 
		forever begin
			clk <= 1'b0;
			#2 clk <= 1'b1;
			#20 clk <= 1'b0;
		end
	
	initial begin
		reset <= 1'b0;
		#10 reset <= 1'b1;
	end	
	
	initial begin
		data_a <= 8'd54;
		#10 data_a <= 8'd43;
		#10 data_a <= 8'd32;
		#10 data_a <= 8'd21;
		#10 data_a <= 8'd10;
		#10 data_a <= 8'd255;
		#10 data_a <= 8'd244;
		#10 data_a <= 8'd233;
		#10 data_a <= 8'd222;
	end
	
	initial begin
		data_b <= 8'd249;
		#15 data_b <= 8'd200;
		#15 data_b <= 8'd151;
		#15 data_b <= 8'd102;
		#15 data_b <= 8'd53;
		#15 data_b <= 8'd4;
	end
	
endmodule
