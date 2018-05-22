vsim -gui work.mem -t ns
delete wave /*
force addr 10#0 0ns, 10#1 100ns, 10#2 200ns, 10#3 300ns, 10#4 400ns
add wave -radix hexadecimal /out
wave zoom range 0us 1us
run 1 us
