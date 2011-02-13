restart -f

force clk 1 0, 0 50 -repeat 100
force reset 1 0, 0 50
run 100

force x 00 0, 00 50
force q 00 0, 00 50
run 100

force x 01 0, 00 50
force q 00 0, 00 50
run 100

force x 11 0, 00 50
force q 00 0, 00 50
run 100

force x 10 0, 00 50
force q 00 0, 00 50
run 100

--

force x 00 0, 00 50
force q 01 0, 00 50
run 100

force x 01 0, 00 50
force q 01 0, 00 50
run 100

force x 11 0, 00 50
force q 01 0, 00 50
run 100

force x 10 0, 00 50
force q 01 0, 00 50
run 100

--

force x 00 0, 00 50
force q 11 0, 00 50
run 100

force x 01 0, 00 50
force q 11 0, 00 50
run 100

force x 11 0, 00 50
force q 11 0, 00 50
run 100

force x 10 0, 00 50
force q 11 0, 00 50
run 100

--

force x 00 0, 00 50
force q 10 0, 00 50
run 100

force x 01 0, 00 50
force q 10 0, 00 50
run 100

force x 11 0, 00 50
force q 10 0, 00 50
run 100

force x 10 0, 00 50
force q 10 0, 00 50
run 100