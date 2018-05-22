module sorter_tb();
  reg tb_clk = 0;
  
  always
    #5 tb_clk <= !tb_clk;
    
  sorter sort(.clk(clk));
endmodule

module sorter(clk);
  input clk;
  reg [3:0] mem_index;
  wire [7:0] mem_data;
  ROM input_data(.clk(clk), .addr(mem_index), .out(mem_data));
  
  reg [7:0] odd [3:0];
  reg [7:0] even [3:0];
  
  reg [3:0] odd_index;
  reg [3:0] even_index;
  
  always @(posedge clk) begin
    for(mem_index = 4'd0; mem_index < 4'd7; mem_index = mem_index + 1) begin
       if(mem_data[0]) begin
        odd[odd_index] <= mem_data;
        odd_index <= odd_index + 1;
      end else begin
        odd[odd_index] <= mem_data;
        odd_index <= odd_index + 1;
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