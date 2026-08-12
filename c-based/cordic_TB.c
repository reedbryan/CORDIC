#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define Q_FORMAT 15
#define SCALE (1 << Q_FORMAT)
#define BENCH_ITERS 1000000

static double elapsed_seconds(struct timespec start, struct timespec end) {
    return (end.tv_sec - start.tv_sec) +
           (end.tv_nsec - start.tv_nsec) / 1e9;
}

int main(int argc, char **argv) {
    double x_d = 0.85;
    double y_d = 0.76;
    double z_d = 0.0;

    int x_i, y_i, z_i;

    if (argc != 1 && argc != 5) {
        printf("Usage: %s [-x_d value -y_d value]\n", argv[0]);
        return 1;
    }

    for (int i = 1; i < argc; i += 2) {
        if (strcmp(argv[i], "-x_d") == 0) {
            x_d = strtod(argv[i + 1], NULL);
        } else if (strcmp(argv[i], "-y_d") == 0) {
            y_d = strtod(argv[i + 1], NULL);
        } else {
            printf("Invalid argument: %s\n", argv[i]);
            return 1;
        }
    }

    if (x_d == 0.0) {
        printf("Error: x_d cannot be zero because atan(y_d / x_d) divides by zero.\n");
        return 1;
    }

    struct timespec start, end;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);

    for (int i = 0; i < BENCH_ITERS; i++) {
        z_d = atan(y_d / x_d);
    }

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    double elapsed = elapsed_seconds(start, end);
    double avg_ns = (elapsed * 1e9) / BENCH_ITERS;

    x_i = (int)(x_d * SCALE);
    y_i = (int)(y_d * SCALE);
    z_i = (int)(z_d * SCALE);

    printf("x_d = %f\t\t\tx_i = %i\n", x_d, x_i);
    printf("y_d = %f\t\t\ty_i = %i\n", y_d, y_i);
    printf("z_d = %f\t\t\tz_i = %i\n", z_d, z_i);

    printf("\nThe angle table:\n");
    for (int i = 0; i < 15; i++) {
        int angle_i = (int)(atan(pow(2.0, (double)(-i))) * SCALE);
        printf("z[%2i] = %i\n", i, angle_i);
    }

    printf("\nBenchmark iterations: %d\n", BENCH_ITERS);
    printf("Total runtime: %.9f seconds\n", elapsed);
    printf("Average atan runtime: %.3f ns\n", avg_ns);

    return 0;
}