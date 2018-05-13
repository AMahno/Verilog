`include "counter.v"

module CU(clk, opcode, run, reset, IRin, reg_select, Gout, DINout, Rnwe, acc_we, G_we, addsub, counter_data, counter_clear, done);
	input clk;
	input [8:0] opcode;
	input run;
	input reset;
	output reg IRin;
	output reg [2:0] reg_select;
	output reg Gout;
	output reg DINout;
	output reg [7:0] Rnwe;
	output reg acc_we;
	output reg G_we;
	output reg addsub;
	input [1:0] counter_data;
	output reg counter_clear;
	output reg done;
	
	counter couter_inst(.clk(clk), .clear(counter_clear), .out(counter_data));
	
	wire [2:0] instruction;
	assign instruction = opcode[2:0];
	wire [2:0] regX;
	assign regX = opcode[5:3];
	wire [2:0] regY;
	assign regY = opcode[8:6];

	always @ * begin
		if(reset) begin
			Rnwe = 3'd0;
			acc_we = 1'd0;
			G_we = 1'd0;
			counter_clear = 1'd1;
			IRin = 1'd1;
		end 
		else 
		if(run) begin
			case(counter_data)
			2'd0:
				begin
					begin Rnwe = 3'd0; acc_we = 1'd0; G_we = 1'd0; DINout = 1'd0; Gout = 1'd0; counter_clear = 1'd0; IRin = 1'd1; done = 1'd1; end
				end
			2'd1:
				begin
					case(instruction)
						3'd0: begin reg_select = regY; Rnwe = 1'd1 << regX; done = 1'd0; counter_clear = 1'd1; end
						3'd1: begin IRin = 1'd0; DINout = 1'd1; Rnwe = 1'd1 << regX; done = 1'd0; counter_clear = 1'd1; end
						3'd2: begin reg_select = regX; acc_we = 1'd1; done = 1'd0; end
						3'd3: begin reg_select = regX; acc_we = 1'd1; done = 1'd0; end
						3'd4: begin reg_select = regX; acc_we = 1'd1; IRin = 1'd0; done = 1'd0; counter_clear = 1'd1; end
					endcase
				end
			2'd2:
				begin
					case(instruction)
						3'd2: begin reg_select = regY; acc_we = 1'd0; G_we = 1'd1; addsub = 1'd0; end
						3'd3: begin reg_select = regY; acc_we = 1'd0; G_we = 1'd1; addsub = 1'd1; end
					endcase
				end
			2'd3:
				begin
					case(instruction)
						3'd2: begin G_we = 1'd0; Gout = 1'd1; Rnwe = 1'd1 << regX; counter_clear = 1'd1; end
						3'd3: begin G_we = 1'd0; Gout = 1'd1; Rnwe = 1'd1 << regX; counter_clear = 1'd1; end
					endcase
				end
			endcase
		end
	
	end
	
endmodule
