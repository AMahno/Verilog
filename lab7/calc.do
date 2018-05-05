vsim -gui work.calc_tb -t ns

add wave /tb_clk
add wave /tb_reset
add wave -radix unsigned /tb_A
add wave -radix unsigned /tb_B
add wave -radix unsigned /tb_C
add wave -radix unsigned /tb_D
add wave -radix unsigned /tb_opcode
add wave -radix unsigned /out
add wave -radix unsigned /calc_inst/cycles_counter

wave zoom range 0ns 500ns
run 500 ns