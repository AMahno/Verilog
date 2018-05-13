vsim -gui work.proc_tb -t ns

add wave /tb_clk
add wave /tb_reset
add wave -radix hexadecimal /tb_DIN
add wave -radix hexadecimal /proc_inst/R0/out
add wave -radix hexadecimal /proc_inst/R1/out
add wave -radix hexadecimal /proc_inst/R2/out
add wave -radix hexadecimal /proc_inst/R3/out
add wave -radix hexadecimal /proc_inst/R4/out
add wave -radix hexadecimal /proc_inst/R5/out
add wave -radix hexadecimal /proc_inst/R6/out
add wave -radix hexadecimal /proc_inst/R7/out
add wave -radix hexadecimal /proc_inst/acc/out
add wave -radix hexadecimal /proc_inst/G/out
add wave /proc_inst/control_unit/*

wave zoom range 0ns 1000ns
run 1000 ns