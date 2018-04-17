`timescale 1ns/10ps
`include "sudo-ALU.v"

module ALU_tb();

	reg [7:0] tb_data_a;
	reg [7:0] tb_data_b;
	wire [15:0] tb_y;
	reg [1:0] tb_opcode;
	
	integer err_count;
	
	sudo_ALU ALU_inst(.opcode(tb_opcode), .a(tb_data_a), .b(tb_data_b), .y(tb_y));
	
		
	initial
		begin	
			err_count = 0;
			
			tb_opcode <= 2'd0;
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(0, 128);
				tb_data_b <= $urandom_range(0, 128);
				if(tb_y != tb_data_a+tb_data_b)
					err_count = err_count+1;
			end
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(128, 255);
				tb_data_b <= $urandom_range(128, 255);
				if(tb_y != tb_data_a+tb_data_b)
					err_count = err_count+1;
			end
			$display("Adding, errors: %d", err_count);
			
			err_count = 0;
			
			tb_opcode <= 2'd1;
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(0, 128);
				tb_data_b <= $urandom_range(0, 128);
				if(tb_y != tb_data_a*tb_data_b)
					err_count = err_count+1;
			end
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(128, 255);
				tb_data_b <= $urandom_range(128, 255);
				if(tb_y != tb_data_a*tb_data_b)
					err_count = err_count+1;
			end
			$display("Multiplying, errors: %d", err_count);
			
			err_count = 0;
			
			tb_opcode <= 2'd2;
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(0, 128);
				tb_data_b <= $urandom_range(0, 128);
				if(tb_y != tb_data_a-1)
					err_count = err_count+1;
			end
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(128, 255);
				tb_data_b <= $urandom_range(128, 255);
				if(tb_y != tb_data_a-1)
					err_count = err_count+1;
			end
			$display("Decrementing, errors: %d", err_count);
			
			err_count = 0;
			
			tb_opcode <= 2'd3;
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(0, 128);
				tb_data_b <= $urandom_range(0, 128);
				if(tb_y != tb_data_b)
					err_count = err_count+1;
			end
			repeat(10) begin
			#10;
				tb_data_a <= $urandom_range(128, 255);
				tb_data_b <= $urandom_range(128, 255);
				if(tb_y != tb_data_b)
					err_count = err_count+1;
			end
			$display("Transfering, errors: %d", err_count);
		end
	
endmodule