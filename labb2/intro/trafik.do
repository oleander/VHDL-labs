-- 12 Personbil
-- 8 Lastbil
-- 4 Lastbil + släp

restart -f nowave 
-- view signals wave add wave clk reset fc pbdet lbdet lbsdet
force clk 0 0, 1 50ns -repeat 100

force reset 1 0, 0 125ns 
force fc 0 0 
run 225ns

force fc 0 0
run 225ns

# Personbil
force fc 1, 0 300ns
run 500ns

# Lastbil
force fc 1, 0 1000ns
run 1200ns

# Lastbil + släp
force fc 1, 0 800ns, 1 900ns, 0 1400ns
run 1700ns

# Personbil
force fc 1, 0 400ns
run 800

# Lastbil
force fc 1, 0 1000ns
run 1200ns

# Personbil
force fc 1, 0 300ns
run 500ns

# Lastbil
force fc 1, 0 1000ns
run 1500ns

# Personbil
force fc 1, 0 300ns
run 600ns

# Personbil
force fc 1, 0 300ns
run 500ns

# Lastbil + släp
force fc 1, 0 800ns, 1 900ns, 0 1400ns
run 1700ns

# Personbil
force fc 1, 0 400ns
run 700ns

# Personbil
force fc 1, 0 300ns
run 500ns

# Lastbil
force fc 1, 0 1000ns
run 1200ns

# Lastbil + släp
force fc 1, 0 800ns, 1 900ns, 0 1400ns
run 1700ns

# Personbil
force fc 1, 0 300ns
run 600ns

# Personbil
force fc 1, 0 300ns
run 500ns

# Lastbil
force fc 1, 0 1000ns
run 1200ns

# Lastbil
force fc 1, 0 1000ns
run 1200ns

# Personbil
force fc 1, 0 300ns
run 600ns

# Personbil
force fc 1, 0 300ns
run 500ns

# Lastbil + släp
force fc 1, 0 800ns, 1 900ns, 0 1400ns
run 1700ns

# Lastbil
force fc 1, 0 1000ns
run 1200ns

# Personbil
force fc 1, 0 300ns
run 500ns

# Lastbil
force fc 1, 0 1000ns
run 1500ns