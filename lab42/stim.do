restart
delete wave /*
force clk 0 0ns, 1 {50ns} -repeat 100ns;
force dc 10#255
add wave /*
run 100 us
wave zoom range 0us 100us