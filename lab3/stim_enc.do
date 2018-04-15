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
force /in 10#9 @900ns
force /in 10#10 @1000ns

force /in 10#11 @1100ns

add wave -radix unsigned /in
add wave /out

wave zoom range 0us 2000ns
run 2000 ns