# Per-implementation cycle measurements

Each executable runs exactly 1,500,000 CORDIC calls of one implementation:

```text
250,000 repetitions × 6 fixed input vectors
```

Build the executables on the ARM64 VM:

```sh
make
```

Measure one implementation at a time:

```sh
perf stat -r 10 -e cycles ./baseline
perf stat -r 10 -e cycles ./ternary
perf stat -r 10 -e cycles ./unrolled_15
```

Calculate the result as:

```text
cycles per CORDIC call = cycles reported by perf / 1,500,000
```

Each executable prints a checksum. Matching checksums confirm the variant
produced the same result as the baseline. `rounded` intentionally differs
because it changes shift rounding, so compare it using numerical accuracy.

The driver is deliberately separate from the main comparison program. This
ensures that a `perf stat` invocation reports cycles for one implementation's
benchmark loop, rather than an aggregate across every CORDIC variant.
