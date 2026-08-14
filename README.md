# CORDIC

This project implements fixed-point CORDIC algorithms in C and VHDL. The C
implementations use Q15 fixed-point values and 15 elementary rotations. The
project includes vectoring mode for calculating `atan(y / x)` and rotation
mode for calculating sine and cosine from an input angle, along with several
optimization experiments and a cycle-count benchmark suite.

## Project layout

- `c-based/code/`: CORDIC source code, driver, and floating-point testbench.
- `c-based/count-cycles/`: isolated executables and scripts for cycle tests.
- `hardware/`: VHDL CORDIC implementation and testbench files.

## Build and run the C driver

From the project root:

```sh
cd c-based/code
gcc -O3 -mcpu=cortex-a57 -std=c11 -Wall -Wextra -Werror \
  cordic_main.c \
  cordic_V_fixed_point.c \
  cordic_V_fixed_point_unrolled.c \
  cordic_V_fixed_point_pipelined.c \
  cordic_V_fixed_point_ternary.c \
  cordic_V_fixed_point_packed_angles.c \
  cordic_V_fixed_point_register.c \
  cordic_V_fixed_point_rounded.c \
  cordic_V_fixed_point_simd.c \
  cordic_V_fixed_point_optimal.c \
  cordic_R_fixed_point.c \
  cordic_R_fixed_point_optimal.c \
  -o cordic_main
./cordic_main
```

`cordic_main` currently runs both modes:

- **Rotation mode** first: it rotates the inverse-gain vector by 0.5 radians
  and prints Q15 cosine, sine, and residual-angle values for baseline and
  optimized rotation implementations.
- **Vectoring mode** second: it benchmarks the vectoring implementations that
  calculate `atan(y / x)` from Q15 input vectors.

To run only one mode, edit `main()` in `c-based/code/cordic_main.c` and comment
out either `compare_cordic_rotation_results()` or
`compare_cordics_performace()`.

Rotation mode expects the input angle in Q15 radians. To obtain normalized
Q15 sine/cosine output, initialize `x` to the inverse CORDIC gain (`19899`),
initialize `y` to zero, and place the desired angle in `z`. Direct rotation is
intended for angles near the range `[-pi/2, pi/2]`.

## Floating-point testbench

The C testbench calculates a floating-point reference angle and prints the
Q15 CORDIC angle table. It accepts optional input values:

```sh
cd c-based/code
gcc -O2 -std=c11 cordic_TB.c -lm -o cordic_TB
./cordic_TB
./cordic_TB -x_d 0.85 -y_d 0.76
```

Use its floating-point `atan(y / x)` result as a numerical-accuracy reference
for vectoring-mode implementations.

## Cycle measurements

Cycle tests build each implementation as a separate executable, preventing
`perf` from combining multiple implementations into one counter value.

```sh
cd c-based/count-cycles
make O3
perf stat -r 10 -e cycles ./O3/baseline
```

Each executable performs 1,500,000 CORDIC calls. Convert a reported count to
cycles per call by dividing it by 1,500,000:

```text
cycles per call = reported cycles / 1,500,000
```

To build every compiler optimization level (`base`, `O1`, `O2`, and `O3`) and
collect a CSV matrix:

```sh
make
./collect_cycles.sh > cycles_per_call.csv
```

See `c-based/count-cycles/README.md` for all supported benchmark commands and
CSV plotting instructions.
