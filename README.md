# CORDIC

## Running Stuff

### Testbench:
gcc cordic_TB.c -o cordic_TB
./cordic_TB

### Basic Cordic + Optimized Cordics:
gcc -O1 -mcpu=cortex-a57 -std=c11 \
gcc \
  cordic_main.c \
  cordic_V_fixed_point.c \
  cordic_V_fixed_point_unrolled.c \
  cordic_V_fixed_point_pipelined.c \
  cordic_V_fixed_point_ternary.c \
  cordic_V_fixed_point_packed_angles.c \
  cordic_V_fixed_point_register.c \
  cordic_V_fixed_point_rounded.c \
  cordic_V_fixed_point_simd.c \
  -o cordic_main

./cordic_main

## Check cycles
perf stat -r 10 -e cycles,instructions,branches,branch-misses ./cordic_main
