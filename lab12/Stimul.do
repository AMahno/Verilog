restart
delete wave /*
force x1 2#0 0ns, 2#1 100ns;
force x2 2#0 0ns, 2#1 50ns, 2#0 100ns, 2#1 150ns;
add wave /x1
add wave /x2
add wave /f
wave zoom range 0us 200ns
run 200 ns