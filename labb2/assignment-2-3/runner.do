restart -f

force clk 1 0, 0 50 -repeat 100
force resetn 0 0, 1 100
force j 1 0, 0 300 -repeat 600
force k 1 0, 0 250 -repeat 550

-- force t 1 50, 0 300 -repeat 350
run 1000