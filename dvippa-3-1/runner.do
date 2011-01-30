restart -f
force reset 0 0
force clk 0 0

force clk 0 0, 1 50ns, 0 100ns  -repeat 400ns
force d   0 0, 1 50ns, 0 100ns  -repeat 800ns

run 5ms