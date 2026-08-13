#!/usr/bin/env bash
# Collect per-call cycle counts for every CORDIC implementation and compiler
# optimization level.  CSV data is written to standard output; diagnostics are
# written to standard error.

set -euo pipefail

readonly CALLS_PER_BENCHMARK=1500000
readonly RUNS="${PERF_RUNS:-10}"
readonly LEVELS=(base O1 O2 O3)
readonly IMPLEMENTATIONS=(
    baseline
    pipelined
    ternary
    packed_angles
    register
    rounded
    simd
    unrolled_1
    unrolled_3
    unrolled_5
    unrolled_15
    optimal
)

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
perf_output="$(mktemp)"
trap 'rm -f "$perf_output"' EXIT

if ! command -v perf >/dev/null 2>&1; then
    echo "error: perf was not found in PATH" >&2
    exit 1
fi

cycle_count_for() {
    local executable="$1"
    local cycles

    # -x, requests comma-separated perf output. Program stdout is discarded so
    # that only this script's CSV matrix appears on standard output.
    if ! LC_ALL=C perf stat -x, -r "$RUNS" -e cycles -- "$executable" \
        >/dev/null 2>"$perf_output"; then
        echo "warning: perf failed for $executable" >&2
        return 1
    fi

    cycles="$(awk -F, '
        $3 ~ /^[[:space:]]*cycles[[:space:]]*$/ {
            value = $1
            gsub(/[[:space:]]/, "", value)
            gsub(/,/, "", value)
            if (value ~ /^[0-9]+(\.[0-9]+)?$/) {
                print value
                exit
            }
        }
    ' "$perf_output")"

    if [[ -z "$cycles" ]]; then
        echo "warning: no usable cycle count for $executable" >&2
        sed 's/^/  perf: /' "$perf_output" >&2
        return 1
    fi

    printf '%s\n' "$cycles"
}

printf 'implementation'
for level in "${LEVELS[@]}"; do
    printf ',%s' "$level"
done
printf '\n'

for implementation in "${IMPLEMENTATIONS[@]}"; do
    printf '%s' "$implementation"

    for level in "${LEVELS[@]}"; do
        executable="$script_dir/$level/$implementation"

        if [[ ! -x "$executable" ]]; then
            echo "warning: executable not found: $executable" >&2
            printf ','
            continue
        fi

        if cycles="$(cycle_count_for "$executable")"; then
            awk -v cycles="$cycles" -v calls="$CALLS_PER_BENCHMARK" \
                'BEGIN { printf ",%.6f", cycles / calls }'
        else
            printf ','
        fi
    done
    printf '\n'
done
