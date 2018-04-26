vlog -work work -stats=none C:/intelFPGA_pro/projects/lab6/SM_tb.v
vsim -gui work.SM_tb -t ns

radix define sm_state {
	3'd0 "A"
	3'd1 "B"
	3'd2 "C"
	3'd3 "D"
	3'd4 "E"
	3'd5 "F"
	3'd6 "G"
	3'd7 "H"
	3'd8 "I"
}

add wave /tb_clk
add wave /tb_w
add wave /tb_reset
add wave /tb_out
add wave -radix sm_state /SM_inst/state 

wave zoom range 0ns 150ns
run 150 ns