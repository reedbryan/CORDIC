#!/usr/bin/env python3
"""Plot the cycles-per-call CSV produced by collect_cycles.sh."""

import csv
import sys

import matplotlib.pyplot as plt
import numpy as np


def main() -> None:
    input_path = sys.argv[1] if len(sys.argv) > 1 else "cycles_per_call.csv"
    output_path = sys.argv[2] if len(sys.argv) > 2 else "cycles_per_call.png"

    with open(input_path, newline="", encoding="utf-8") as csv_file:
        rows = list(csv.DictReader(csv_file))

    if not rows or not rows[0].get("implementation"):
        raise ValueError("CSV must contain an implementation column and data rows")

    levels = [name for name in rows[0] if name != "implementation"]
    implementations = [row["implementation"] for row in rows]
    positions = np.arange(len(implementations))
    bar_width = 0.8 / len(levels)

    _, axis = plt.subplots(figsize=(14, 7))
    for index, level in enumerate(levels):
        values = [float(row[level]) if row[level] else np.nan for row in rows]
        offset = (index - (len(levels) - 1) / 2) * bar_width
        axis.bar(positions + offset, values, bar_width, label=level)

    axis.set_title("CORDIC Performance: Cycles( per Call")
    axis.set_xlabel("Implementation")
    axis.set_ylabel("Cycles( per call")
    axis.set_xticks(positions, implementations, rotation=35, ha="right")
    axis.grid(axis="y", linestyle=":", alpha=0.6)
    axis.legend(title="Optimization level")

    plt.tight_layout()
    plt.savefig(output_path, dpi=200)
    print(f"Wrote {output_path}")


if __name__ == "__main__":
    main()
