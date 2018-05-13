`include "16reg.v"
`include "16mux.v"
`include "CU.v"
`include "IR.v"
`include "monitor.v"

module processor(clk, reset, run, DIN, out_bus, done);
	input clk;
	input reset;
	input run;
	input [15:0] DIN;
	output reg [15:0] out_bus;
	output done;
		
	wire [15:0] bus;
	
	always @(posedge clk)
		out_bus <= bus;
	
	wire [7:0] Rnwe_wire;
	
	wire [2:0] reg_select_wire;
	wire G_out_wire;
	wire DIN_out_wire;
	wire acc_we_wire;
	wire G_we_wire;
	wire IR_we_wire;
	wire [8:0] IR_out_wire;
	wire add_sub_wire;
	
	wire [8:0] proc_opcode;
	assign proc_opcode = DIN[8:0];
	
	IR instruction_reg(.opcode(proc_opcode), .we(IR_we_wire), .clk(clk), .reset(reset), .out(IR_out_wire));
	
	CU control_unit(.clk(clk), .opcode(IR_out_wire), .run(run), .reset(reset), .IRin(IR_we_wire), .reg_select(reg_select_wire), 
	.Gout(G_out_wire), .DINout(DIN_out_wire), .acc_we(acc_we_wire), .G_we(G_we_wire),
	.Rnwe(Rnwe_wire), .addsub(add_sub_wire),
	.counter_data(), .counter_clear(), .done(done));

	wire [15:0] R0_out;
	wire [15:0] R1_out;
	wire [15:0] R2_out;
	wire [15:0] R3_out;
	wire [15:0] R4_out;
	wire [15:0] R5_out;
	wire [15:0] R6_out;
	wire [15:0] R7_out;
	
	reg_16 R0(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[0]), .out(R0_out));
	reg_16 R1(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[1]), .out(R1_out));
	reg_16 R2(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[2]), .out(R2_out));
	reg_16 R3(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[3]), .out(R3_out));
	reg_16 R4(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[4]), .out(R4_out));
	reg_16 R5(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[5]), .out(R5_out));
	reg_16 R6(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[6]), .out(R6_out));
	reg_16 R7(.data(bus), .clk(clk), .reset(reset), .we(Rnwe_wire[7]), .out(R7_out));
	
	wire [15:0] A_wire;
	reg_16 acc(.data(bus), .clk(clk), .reset(reset), .we(acc_we_wire), .out(A_wire));
	
	wire [15:0] add_sub_out;
	wire [15:0] G_output_wire;
	add_sub alu(.A(A_wire), .B(bus), .addsub(add_sub_wire), .out(add_sub_out));
	reg_16 G(.data(add_sub_out), .clk(clk), .reset(reset), .we(G_we_wire), .out(G_output_wire));
	
	mux16 reg_mux(.R0(R0_out), .R1(R1_out), .R2(R2_out), .R3(R3_out), .R4(R4_out), .R5(R5_out), .R6(R6_out), .R7(R7_out), 
	.DIN(DIN), .G(G_output_wire), .regSelect(reg_select_wire), .Gout(G_out_wire), .DINout(DIN_out_wire), .out(bus));
	
	monitor mon(.R0(R0_out), .R1(R1_out), .R2(R2_out), .R3(R3_out), .R4(R4_out), .R5(R5_out), .R6(R6_out), .R7(R7_out), .acc(A_wire), .G(G_output_wire));
endmodule
