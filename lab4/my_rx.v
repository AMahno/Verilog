module my_rx  
#(parameter CLKS_PER_BIT)
  (
   input        clk,
   input        rx,
   output reg ready,
   output reg [7:0] data
   );
  parameter IDLE_state         = 3'd0;
  parameter START_BIT_state = 3'd1;
  parameter DATA_BITS_state = 3'd2;
  parameter STOP_BIT_state  = 3'd3;
  
  reg [2:0] state = 0;
  reg [7:0] clk_counter = 0;
  reg [3:0] data_bit_index = 0;
   
  always@(posedge clk)
  
	case(state)
	IDLE_state:
		begin
			clk_counter <= 0;
			data_bit_index <= 0;
			if(rx == 1'b0)
				state <= START_BIT_state;
			else
				state <= IDLE_state;
		
		end
		
	START_BIT_state:
		begin
		ready <= 1'b0;
		data <= 8'd0;
			if(clk_counter >= CLKS_PER_BIT*0.5)
				begin //time of the middle of the start bit
					if(rx == 1'b1) //if not low - reset
						state <= IDLE_state;
					else
						begin //if low, reset counter and switch state
							clk_counter <= 0;
							data_bit_index <= 0;
							state <= DATA_BITS_state;
						end
				end
			else
				begin //not yet a middle, increment counter
					clk_counter = clk_counter + 1;
					state <= START_BIT_state;
				end
		end
	
	DATA_BITS_state:
		begin
			if(clk_counter >= CLKS_PER_BIT)
				begin //time of the middle of the data bit
					if(data_bit_index < 7)
						begin //bits 0-6
							data[data_bit_index] <= rx;
							data_bit_index = data_bit_index + 1;
							clk_counter <= 0;
							state <= DATA_BITS_state;
						end
					else
						begin //last bit, switch to stop
							data[data_bit_index] <= rx;
							clk_counter <= 0;
							state <= STOP_BIT_state;
						end
				end
				else
					begin
						clk_counter = clk_counter+1;
						state <= DATA_BITS_state;
					end
		end
  
	STOP_BIT_state:
		begin
			if(clk_counter >= CLKS_PER_BIT)
				begin
					if(rx == 1'b1)
						begin
							ready <= 1'b1;
							clk_counter <= 0;
							state <= IDLE_state;
						end
					else
						begin
						clk_counter <= 0;
							state <= IDLE_state;
						end
				end
			else
				begin
					clk_counter = clk_counter+1;
				end
		end
	endcase
endmodule
  