# CORDIC

## Running Stuff

### Testbench:
gcc cordic_TB.c -o cordic_TB
./cordic_TB

### Basic Cordic + Optimized Cordics:
gcc cordic_main.c cordic_V_fixed_point.c cordic_V_fixed_point_unrolled.c cordic_V_fixed_point_pipelined.c -o cordic_main 

./cordic_main

### Hardware implementation
### using ghdl on windows:

ghdl -a Cordic_V_fixed_point.vhd
ghdl -a Cordic_V_tb.vhd
ghdl -e tb_cordic_vectoring
ghdl -r tb_cordic_vectoring

