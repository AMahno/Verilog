vsim -gui work.task2
restart
delete wave /*
add wave /clk
add wave /reset
add wave -radix unsigned /data_a
add wave -radix unsigned /data_b
wave zoom range 0us 100ns
run 100 ns