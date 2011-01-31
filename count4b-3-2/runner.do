restart -f
force reset 1
run 50
force clk 1
run 50

force clk 0
force reset 0
run 50

force clk 1 10, 1 20ns, 0 20ns  -repeat 40ns
force ce  1 10, 1 200ns, 0 250ns  -repeat 400ns

run 1ms