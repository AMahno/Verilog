`include "memory.v"
`include "processor.v"

module proc_tb();
	reg tb_clk = 0;
	reg tb_reset;
	reg tb_run;
	reg [15:0] tb_DIN;
	wire [15:0] memory_out;
	wire [15:0] tb_bus;
	wire tb_done;

	always
		#5 tb_clk <= !tb_clk;
	
	 processor proc_inst(.clk(tb_clk), .reset(tb_reset), .run(tb_run), .DIN(memory_out), .out_bus(tb_bus), .done(tb_done));
	 
	 memory mem(.clk(tb_clk), .increment(tb_done), .reset(tb_reset), .data(memory_out));
	 		
	 initial begin
		tb_reset <= 0;
		tb_reset <= #5 1;
		tb_reset <= #10 0;
		tb_run <= #10 1;
		/*
		#15;
		
		write_to_reg(0, 16'h0002);
		write_to_reg(1, 16'hBBBB);
		write_to_reg(2, 16'hDEAD);
		write_to_reg(3, 16'hBEEF);
		write_to_reg(4, 16'hDEAD);
		write_to_reg(5, 16'hBEEF);
		write_to_reg(6, 16'hDEAD);
		write_to_reg(7, 16'hBEEF);
		
		mov(0, 1);
		#10;
		add(0, 1);
		
		repeat(5) nop();
		
		$stop();
		
		#15;
		
		write_to_reg(0, 16'd0);
		write_to_reg(1, 16'd1);
		
		repeat(9) begin
		mov(0, 2);
		
		add(1, 0);
		
		mov(2, 1);
		
		end
		
		/*
		tb_DIN <= 16'hA1;
		tb_DIN <= #20 16'hDEAD;
		*/
	 end
	 
	 task write_to_reg;
		input [2:0] reg_no;
		input [15:0] data;
		begin
			$display("Writing to R%d", reg_no);
			tb_DIN = {3'd000, reg_no, 3'd001};
			#10; //fetch command
			tb_run = 1;
			tb_DIN = data; //process command
			#10; //process opcode
			//tb_run = 0;
		end
	 endtask

	task mov;
		input [2:0] from;
		input [2:0] to;
		begin
			$display("Moving from R%d to R%d", from, to);
			tb_DIN = {from, to, 3'd000};
			#10; //fetch
			tb_run = 1;
			#10; //process
			//tb_run = 0;
		end
	endtask
	
	task load;
		input [2:0] source;
		begin
			$display("Loading from R%d to ACC", source);
			tb_DIN = {3'd000, source, 3'd100};
			#10; //fetch
			tb_run = 1;
			#10; //process
			//tb_run = 0;
		end
	endtask
	
	task add;
		input [2:0] a;
		input [2:0] b;
		begin
			$display("Adding R%d and R%d", a, b);
			tb_DIN = {a, b, 3'd010};
			#10; //fetch
			tb_run = 1;
			#30; //process (mov A, mov B, mov G)
			//tb_run = 0;
		end
	endtask
	
	task nop;
		tb_DIN = {3'd000, 3'd000, 3'd100};
	endtask
	
endmodule
