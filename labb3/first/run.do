-- jesper josefsson
-- 110214
restart -f nowave
-- add wave count clk reset ceo ce2next ce2
force clk '0' 0, '1' 50 -repeat 100
force reset '1'
run 100
force reset '0'
force ce '1'
run 10000


# restart -f
# 
# force clk 1 0, 0 50 -repeat 100
# force reset 1 0, 0 50
# run 100
# 
# force x 00 0, 00 50
# force q 00 0, 00 50
# run 100
# 
# force x 01 0, 00 50
# force q 00 0, 00 50
# run 100
# 
# force x 11 0, 00 50
# force q 00 0, 00 50
# run 100
# 
# force x 10 0, 00 50
# force q 00 0, 00 50
# run 100
# 
# --
# 
# force x 00 0, 00 50
# force q 01 0, 00 50
# run 100
# 
# force x 01 0, 00 50
# force q 01 0, 00 50
# run 100
# 
# force x 11 0, 00 50
# force q 01 0, 00 50
# run 100
# 
# force x 10 0, 00 50
# force q 01 0, 00 50
# run 100
# 
# --
# 
# force x 00 0, 00 50
# force q 11 0, 00 50
# run 100
# 
# force x 01 0, 00 50
# force q 11 0, 00 50
# run 100
# 
# force x 11 0, 00 50
# force q 11 0, 00 50
# run 100
# 
# force x 10 0, 00 50
# force q 11 0, 00 50
# run 100
# 
# --
# 
# force x 00 0, 00 50
# force q 10 0, 00 50
# run 100
# 
# force x 01 0, 00 50
# force q 10 0, 00 50
# run 100
# 
# force x 11 0, 00 50
# force q 10 0, 00 50
# run 100
# 
# force x 10 0, 00 50
# force q 10 0, 00 50
# run 100