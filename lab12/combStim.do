restart
delete wave /*
force /x 10#0 @0ns
force /x 10#1 @100ns
force /x 10#2 @200ns
force /x 10#3 @300ns
force /x 10#4 @400ns
force /x 10#5 @500ns
force /x 10#6 @600ns
force /x 10#7 @700ns
force /x 10#8 @800ns
force /x 10#9 @900ns
force /x 10#10 @1000ns
force /x 10#11 @1100ns
force /x 10#12 @1200ns
force /x 10#13 @1300ns
force /x 10#14 @1400ns
force /x 10#15 @1500ns
force /x 10#16 @1600ns
add wave -radix unsigned /x
add wave /f
wave zoom range 0us 2000ns
run 2000 ns