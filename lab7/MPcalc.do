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
	16'd24 "C / 1"
	16'd25 "C / 2"
	16'd26 "C / 3"
	16'd27 "C / 4"
	16'd28 "C / 5"
	16'd29 "C / 6"
	16'd30 "C / 7"
	16'd31 "C / 8"
	16'd32 "C / 9"
	16'd33 "C / 10"
	16'd34 "C / 11"
	16'd35 "C / 12"
	16'd36 "C / 13"
	16'd37 "C / 14"
	16'd38 "C / 15"
	16'd39 "C / 16"
	16'd40 "C / 17"
	16'd41 "C / 18"
	16'd42 "C / 19"
	16'd43 "C / 20"
	16'd44 "C / 21"
	16'd45 "C / 22"
	16'd46 "rol 1"
	16'd47 "rol 2"
	16'd48 "ror 1"
	16'd49 "ror 2"
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
run 2500 ns