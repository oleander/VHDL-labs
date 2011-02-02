-- lev2puls.do 
-- 110125 
restart –f nowave
view signals wave 
-- add wave clk levin reset pulsoff pulson cs nse
force reset 1 0, 0 80ns
force levin 0 0, 1 325, 0 800 -repeat 1600ns
force clk 0 0, 1 50ns -repeat 100ns 
run 4000