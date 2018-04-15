vsim -gui work.task1
restart
delete wave /*
force /in 10#0 @0ns
force /in 10#1 @100ns
force /in 10#2 @200ns
force /in 10#3 @300ns
force /in 10#4 @400ns
force /in 10#5 @500ns
force /in 10#6 @600ns
force /in 10#7 @700ns
force /in 10#8 @800ns
add wave -radix unsigned /in
add wave /out
wave zoom range 0us 1000ns
run 1000 ns