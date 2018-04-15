restart
delete wave /*
force clr 1 0ns, 0 50ns, 1 400 ns, 0 450 ns;
force clk 0 0ns, 1 {50ns} -repeat 100ns;
force ina 10#0 0ns, 10#7 30ns;
force inb 10#0 0ns, 10#1 30ns, 10#2 130ns, 10#3 230ns, 10#4 330ns, 10#5 430ns;
add wave -radix decimal /ina 
add wave -radix decimal /inb
add wave /clk
add wave /clr
add wave -radix decimal /out
wave zoom range 0us 1us
run 1 us
