module memory(clk, increment, reset, data);
	input increment;
	input clk;
	input reset;
	output reg [15:0] data;
	
	reg [15:0] prog_mem [0:255];
	reg [15:0] prog_ip;
	
	reg [15:0] data_mem [0:255];
	reg [15:0] data_ip;
		
	reg next_line_is_const = 1'd0;
	
	initial begin
		$readmemh("program.asm", prog_mem);
		$readmemh("data.list", data_mem);
	end
			
	always @(posedge increment, negedge increment, posedge reset) begin
		if(reset) begin prog_ip <= 16'd0; data_ip <= 16'd0; data <= prog_mem[16'd0]; if(prog_mem[16'd0][2:0] == 3'b001) next_line_is_const <= 1'd1; end
		else if(increment | next_line_is_const) begin
			if(next_line_is_const) begin
				data <= data_mem[data_ip];
				data_ip <= data_ip + 1;
				next_line_is_const <= 1'd0;
			end
			else begin
				prog_ip <= prog_ip + 1;
				data <= prog_mem[prog_ip+1];
				if(prog_mem[prog_ip + 1][2:0] == 3'b001) next_line_is_const <= 1'd1;
			end	
		end 
	end
endmodule
