vsim -gui work.counter_tb -t ns

add wave -radix unsigned /counter_tb/*

wave zoom range 0ns 300ns
run 300 ns