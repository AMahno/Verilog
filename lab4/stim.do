vsim -gui work.uart_tb -t ns

restart
delete wave /*

radix define sm_state {
	3'd0 "Idle"
	3'd1 "Start"
	3'd2 "Data"
	3'd3 "Stop"
}

add wave /uart_tb/r_Rx_Serial
add wave -radix sm_state uart_tb/MY_RX_INST/state
add wave -radix unsigned /uart_tb/MY_RX_INST/clk_counter
add wave -radix unsigned uart_tb/MY_RX_INST/data_bit_index
add wave uart_tb/MY_RX_INST/ready
add wave uart_tb/w_Rx_Byte
add wave uart_tb/my_data

wave zoom range 0us 150us
run 150 us