restart
delete wave /*

force /data 16#AA
force /enable 1 @0ns

force /adr 10#0 @0ns
force /adr 10#1 @100ns
force /adr 10#2 @200ns
force /adr 10#3 @300ns
force /adr 10#4 @400ns
force /adr 10#5 @500ns
force /adr 10#6 @600ns
force /adr 10#7 @700ns
force /adr 10#8 @800ns

force /enable 0 @900ns

force /adr 10#0 @1000ns
force /adr 10#1 @1100ns
force /adr 10#2 @1200ns
force /adr 10#3 @1300ns
force /adr 10#4 @1400ns
force /adr 10#5 @1500ns
force /adr 10#6 @1600ns
force /adr 10#7 @1700ns
force /adr 10#8 @1800ns

add wave /*

wave zoom range 0us 2000ns
run 2000 ns