vsim -gui work.ALU_tb

restart
delete wave /*

add wave -radix unsigned /ALU_tb/tb_data_a
add wave -radix unsigned /ALU_tb/tb_data_b
add wave -radix unsigned /ALU_tb/tb_y
add wave -radix unsigned /ALU_tb/tb_opcode

wave zoom range 0ns 1000ns
run 1000 ns