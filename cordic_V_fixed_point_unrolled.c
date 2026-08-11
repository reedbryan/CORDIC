#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <time.h>

extern int z_table[15];

static double elapsed_microseconds(const struct timespec *start,
                                   const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec) * 1000000.0 +
           (double)(end->tv_nsec - start->tv_nsec) / 1000.0;
}

#define CORDIC_STAGE(I)                                                        \
    do {                                                                       \
        if (y_temp_1 > 0) {                                                    \
            x_temp_2 = x_temp_1 + (y_temp_1 >> (I));                           \
            y_temp_2 = y_temp_1 - (x_temp_1 >> (I));                           \
            z_temp += z_table[(I)];                                            \
        } else {                                                               \
            x_temp_2 = x_temp_1 - (y_temp_1 >> (I));                           \
            y_temp_2 = y_temp_1 + (x_temp_1 >> (I));                           \
            z_temp -= z_table[(I)];                                            \
        }                                                                      \
        x_temp_1 = x_temp_2;                                                   \
        y_temp_1 = y_temp_2;                                                   \
    } while (0)

/* TOTAL_ITERATIONS must remain in sync with the size of z_table. */
#define TOTAL_ITERATIONS 15

void cordic_V_fixed_point_unrolled(int *x, int *y, int *z, int unroll_factor)
{
    int x_temp_1 = *x;
    int y_temp_1 = *y;
    int z_temp = 0;
    int x_temp_2;
    int y_temp_2;
    int i;
    struct timespec start_time;
    struct timespec end_time;

    if (unroll_factor <= 0 || TOTAL_ITERATIONS % unroll_factor != 0) {
        fprintf(stderr,
                "Invalid unroll factor %d: it must be a positive factor of %d.\n",
                unroll_factor, TOTAL_ITERATIONS);
        return;
    }

    /* Each case has an outer loop and an explicitly unrolled loop body. */
    switch (unroll_factor) {
    case 1:
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
        for (i = 0; i < TOTAL_ITERATIONS; i += 1) {
            CORDIC_STAGE(i);
        }
        break;
    case 3:
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);    
        for (i = 0; i < TOTAL_ITERATIONS; i += 3) {
            CORDIC_STAGE(i);
            CORDIC_STAGE(i + 1);
            CORDIC_STAGE(i + 2);
        }
        break;
    case 5:
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
        for (i = 0; i < TOTAL_ITERATIONS; i += 5) {
            CORDIC_STAGE(i);
            CORDIC_STAGE(i + 1);
            CORDIC_STAGE(i + 2);
            CORDIC_STAGE(i + 3);
            CORDIC_STAGE(i + 4);
        }
        break;
    case 15:
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
        CORDIC_STAGE(0);
        CORDIC_STAGE(1);
        CORDIC_STAGE(2);
        CORDIC_STAGE(3);
        CORDIC_STAGE(4);
        CORDIC_STAGE(5);
        CORDIC_STAGE(6);
        CORDIC_STAGE(7);
        CORDIC_STAGE(8);
        CORDIC_STAGE(9);
        CORDIC_STAGE(10);
        CORDIC_STAGE(11);
        CORDIC_STAGE(12);
        CORDIC_STAGE(13);
        CORDIC_STAGE(14);
        break;
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    printf("cordic_V_fixed_point_unrolled (%d) runtime: %.10f us\n", unroll_factor,
           elapsed_microseconds(&start_time, &end_time));
}

#undef CORDIC_STAGE
#undef TOTAL_ITERATIONS
