vsim -gui work.MP_calc_tb -t ns

radix define sm_state {
	16'd0 "IDLE"
	16'd1 "FETCH"
	16'd2 "+ 1"
	16'd3 "+ 2"
	16'd4 "- 1"
	16'd5 "- 2"
	16'd6 "* 1"
	16'd7 "* 2"
	16'd8 "/ 1"
	16'd9 "/ 2"
	16'd10 "C + 1"
	16'd11 "C + 2"
	16'd12 "C - 1"
	16'd13 "C - 2"
	16'd14 "C * 1"
	16'd15 "C * 2"
	16'd16 "C * 3"
	16'd17 "C * 4"
	16'd18 "C * 5"
	16'd19 "C * 6"
	16'd20 "C * 7"
	16'd21 "C * 8"
	16'd22 "C * 9"
	16'd23 "C * 10"
}

add wave /tb_clk
add wave /tb_reset
add wave /tb_compute
add wave -radix unsigned /tb_A
add wave -radix unsigned /tb_B
add wave -radix unsigned /tb_C
add wave -radix unsigned /tb_D
add wave -radix unsigned /tb_opcode
add wave -radix unsigned /out
add wave -radix unsigned /tb_im
add wave -radix sm_state /calc_inst/state

wave zoom range 0ns 1000ns
run 1000 ns