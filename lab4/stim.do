restart
delete wave /*

add wave /uart_tb/r_Rx_Serial
add wave -radix unsigned uart_tb/MY_RX_INST/state
add wave -radix unsigned /uart_tb/MY_RX_INST/clk_counter
add wave -radix unsigned uart_tb/MY_RX_INST/data_bit_index
add wave uart_tb/MY_RX_INST/ready
add wave uart_tb/w_Rx_Byte
add wave uart_tb/my_data

wave zoom range 0us 150us
run 150 us