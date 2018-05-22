vsim -gui work.sorter_tb -t ns

add wave -radix unsigned /sorter_tb/sort/*

wave zoom range 0ns 300ns
run 300 ns