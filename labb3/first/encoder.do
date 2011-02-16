-- tb1mealy.do
-- 100210 
restart -f nowave
force clk 0 0, 1 10 -repeat 20
force reset 1
force x "00"
run 40
force reset 0
run 20
-- här startar serien
force x "01"
run 50
force x "11"
run 50 
force x "10"
run 50 
force x "00"
run 50
-- nu vänder vi
force x "10"
run 50
force x "11"
run 50
force x "01"
run 50
force x "00"
run 50
