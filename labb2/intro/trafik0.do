-- trafik0.do 
-- 110125 
restart –f -- nowave 
-- view signals wave add wave clk reset fc pb
force reset 1 0, 0 80ns

force fc 0 0, 1 110, 0 410, 1 610, 0 1010 
force clk 0 0, 1 50ns -repeat 100ns 
run 1600