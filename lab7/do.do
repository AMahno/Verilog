vsim -gui work.ari_tb -t ns

radix define opcodes {
	3'd0 "A+B+C+D"
	3'd1 "(A-B)-(C-D)"
	3'd2 "(A+B)-(C+D)"
	3'd3 "(A-B)+(C-D)"
	3'd4 "SL"
	3'd5 "SR"
}

add wave /tb_clk
add wave /tb_reset
add wave -radix unsigned /tb_A
add wave -radix unsigned /tb_B
add wave -radix unsigned /tb_C
add wave -radix unsigned /tb_D
add wave  /tb_adder_config
add wave /tb_ror_config
add wave /tb_typeop
add wave -radix unsigned /tb_out

wave zoom range 0ns 200ns
run 200 ns