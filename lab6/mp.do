vsim -gui work.MP_tb -t ns
vlog -work work -stats=none C:/intelFPGA_pro/projects/lab6/MP_tb.v

radix define sm_state {
	3'd0 "S_0"
	3'd1 "S_1"
	3'd2 "S_2"
	3'd3 "S_3"
	3'd4 "S_4"
	3'd5 "S_5"
	3'd6 "S_6"
	3'd7 "S_7"
	3'd8 "S_8"
	3'd9 "ENDSTATE"
}

add wave /tb_clk
add wave /tb_x1
add wave /tb_x2
add wave /tb_reset
add wave /tb_out
add wave -radix sm_state /MP_inst/state 

wave zoom range 0ns 100ns
run 100 ns