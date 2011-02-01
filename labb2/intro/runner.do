restart -f
force clk 1 0, 0 50
force reset 1 0, 0 50
run 50

force clk 0 0, 1 50 -repeat 100
force levin 0 0, 1 75 -repeat 175
run 500