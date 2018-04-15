module pwm(clk, dc, out);
	input clk;
	input [7:0] dc;
	output reg out;
	
	reg [7:0] counter = 0;
	
	always @(posedge clk)
		begin
			if(counter == dc)
				out <= 1'b0;
			else
				begin
					if (counter == 0)
						out <= 1'b1;
					else
						if(counter == 8'hFF)
							counter <= 0;
				end
		counter <= counter+1;
		end
endmodule