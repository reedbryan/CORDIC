# Per-implementation cycle measurements

Each executable runs exactly 1,500,000 CORDIC calls of one implementation:

```text
250,000 repetitions × 6 fixed input vectors
```

Build every executable on the ARM64 VM:

```sh
make
```

Executables are grouped by compiler optimization level:

```text
base/  compiled with -O0
O1/    compiled with -O1
O2/    compiled with -O2
O3/    compiled with -O3
```

Build only one optimization-level group when needed:

```sh
make O2
```

Measure one implementation at a time:

```sh
perf stat -r 10 -e cycles ./O3/baseline
perf stat -r 10 -e cycles ./O3/ternary
perf stat -r 10 -e cycles ./O3/unrolled_15
```

Calculate the result as:

```text
cycles per CORDIC call = cycles reported by perf / 1,500,000
```

## Collect every result as CSV

After building the executables, run:

```sh
./collect_cycles.sh > cycles_per_call.csv
```

The script runs `perf stat -r 10 -e cycles` for every executable and writes a
CSV matrix with implementations as rows and compiler optimization levels as
columns. Each value is the reported cycle count divided by 1,500,000 calls.
Warnings and `perf` diagnostics are written to standard error, not the CSV.

To use a different repeat count, set `PERF_RUNS`:

```sh
PERF_RUNS=20 ./collect_cycles.sh > cycles_per_call.csv
```

Each executable prints a checksum. Matching checksums confirm the variant
produced the same result as the baseline. `rounded` intentionally differs
because it changes shift rounding, so compare it using numerical accuracy.

The driver is deliberately separate from the main comparison program. This
ensures that a `perf stat` invocation reports cycles for one implementation's
benchmark loop, rather than an aggregate across every CORDIC variant.
