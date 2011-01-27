# Version 1
# restart -f
# 
# force x 0
# force y 0
# run 100
# 
# force x 1
# run 100
# 
# force y 1
# run 100
# 
# force x 0
# run 100

# Version 2 
# restart -f
# force x 0 0, 1 100 -repeat 200
# force y 0 0, 1 200 -repeat 400
# run 400

# Version 3
restart -f nowave
view signals wave
add wave x y s cut
force x 0 0, 1 100 -repeat 200