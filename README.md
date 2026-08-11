# CORDIC

## Running Stuff

### Testbench:
gcc cordic_TB.c -o cordic_TB
./cordic_TB

### Basic Cordic + Optimized Cordics:
gcc cordic_main.c cordic_V_fixed_point.c cordic_V_fixed_point_unrolled.c cordic_V_fixed_point_pipelined.c -o cordic_main 
./cordic_main