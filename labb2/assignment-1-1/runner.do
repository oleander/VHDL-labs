restart -f
force clk 1 0
force reset 1 0
run 50

force reset 0 0
run 50

force ce 1
force clk 1 0, 0 10 -repeat 50
run 3 ms