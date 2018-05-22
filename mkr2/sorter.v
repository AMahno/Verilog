`timescale 1ns/10ps

module sorter_tb();
  reg tb_clk = 0;
  reg tb_reset;
  
  always
    #5 tb_clk <= !tb_clk;
	
	initial begin
		tb_reset <= 1;
		#5 tb_reset <= 0;
	end
    
  sorter sort(.clk(tb_clk), .reset(tb_reset));
endmodule

module sorter(clk, reset);
  input reset;
  input clk;
  reg [3:0] mem_index;
  wire [7:0] mem_data;
  ROM input_data(.clk(clk), .addr(mem_index), .out(mem_data));
  
  reg [7:0] odd [7:0];
  reg [7:0] even [7:0];
  
  reg [7:0] divisable_6 [7:0];
  reg [7:0] divisable_3 [7:0];
  
  reg [3:0] odd_index;
  reg [3:0] even_index;
  
  reg [3:0] divisable_6_index;
  reg [3:0] divisable_3_index;
  
  reg sort_1_ready;
  reg sort_2_ready;
  
  always @(posedge clk, posedge reset) begin
  if(reset) begin odd_index <= 4'd0; even_index <= 4'd0; divisable_3_index <= 4'd0; divisable_6_index <= 4'd0; mem_index <= 4'd0; sort_1_ready <= 1'd0; sort_2_ready <= 1'd0; end
  else
	if(!sort_1_ready) begin
		if(mem_data[0]) begin
			odd[odd_index] <= mem_data;
			odd_index <= odd_index + 1;
		end else begin
			even[even_index] <= mem_data;
			even_index <= even_index + 1;
		end
		if(mem_index <= 4'd7) mem_index <= mem_index + 1; 
		else sort_1_ready <= 1'd1;
		end else begin
			if(!sort_2_ready) begin
				if(!(even[even_index] % 6)) begin
					divisable_6[divisable_6_index] <= even[even_index];
					even[even_index] <= 8'dx;
					divisable_6_index = divisable_6_index + 1;
				end
				if(even_index > 0) even_index = even_index - 1;
				else sort_2_ready <= 1'd1;
			end else begin
				if(!(odd[odd_index] % 3)) begin
					divisable_3[divisable_3_index] <= odd[odd_index];
					odd[odd_index] <= 8'dx;
					divisable_3_index = divisable_3_index + 1;
				end
				if(odd_index > 0) odd_index = odd_index - 1;
			end
		end
	end
  
  
endmodule

module ROM(clk, addr, out);
  input clk;
  input [3:0] addr;
  output reg [7:0] out;
  always @(posedge clk)
    case(addr)
      4'd0: out = 8'd5;
      4'd1: out = 8'd4;
      4'd2: out = 8'd2;
      4'd3: out = 8'd1;
      4'd4: out = 8'd10;
      4'd5: out = 8'd0;
      4'd6: out = 8'd12;
      4'd7: out = 8'd3;
      default: out = 8'd0;
    endcase
endmodule