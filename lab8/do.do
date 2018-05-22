vsim -gui work.proc_tb -t ns

add wave /tb_clk
add wave /tb_reset
add wave /tb_done
add wave -radix hexadecimal /memory_out
add wave -radix decimal /tb_bus

wave zoom range 0ns 1000ns
run 1000 ns