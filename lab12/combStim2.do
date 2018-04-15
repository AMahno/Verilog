restart
delete wave /*
force z 0 0ns, 1 {50ns} -repeat 100ns;
force y 0 0ns, 1 {100ns} -repeat 200ns;
force x 0 0ns, 1 {200ns} -repeat 400ns;
add wave /x
add wave /y
add wave /z
add wave /f
add wave /n
wave zoom range 0us 500ns
run 500 ns