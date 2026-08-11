#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <time.h>

extern int z_table[15];

#define TOTAL_ITERATIONS 15

static double elapsed_microseconds(const struct timespec *start,
                                   const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec) * 1000000.0 +
           (double)(end->tv_nsec - start->tv_nsec) / 1000.0;
}

/*
 * Software-pipelined 15-stage CORDIC vectoring routine.
 *
 * Stages cannot execute concurrently because stage i + 1 needs the x and y
 * produced by stage i.  The independent z_table load is therefore the useful
 * pipeline candidate: the loop prologue loads z_table[0], each kernel
 * iteration loads the next angle before it is needed, and the epilogue runs
 * the final stage using the already-loaded angle.
 */
void cordic_V_fixed_point_pipelined(int *x, int *y, int *z)
{
    int x_current = *x;
    int y_current = *y;
    int z_current = 0;
    int x_next;
    int y_next;
    int angle_current;
    int i;
    struct timespec start_time;
    struct timespec end_time;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);

    /* Prologue: make the first stage's angle available. */
    angle_current = z_table[0];

    /*
     * Kernel: consume the current angle while loading the angle for the next
     * stage.  The load has no dependency on x_current or y_current, so an
     * out-of-order CPU can overlap it with the current stage arithmetic.
     */
    for (i = 0; i < TOTAL_ITERATIONS - 1; ++i) {
        int angle_next = z_table[i + 1];

        if (y_current > 0) {
            x_next = x_current + (y_current >> i);
            y_next = y_current - (x_current >> i);
            z_current += angle_current;
        } else {
            x_next = x_current - (y_current >> i);
            y_next = y_current + (x_current >> i);
            z_current -= angle_current;
        }

        x_current = x_next;
        y_current = y_next;
        angle_current = angle_next;
    }

    /* Epilogue: execute stage 14 with the angle loaded by stage 13. */
    if (y_current > 0) {
        x_next = x_current + (y_current >> (TOTAL_ITERATIONS - 1));
        y_next = y_current - (x_current >> (TOTAL_ITERATIONS - 1));
        z_current += angle_current;
    } else {
        x_next = x_current - (y_current >> (TOTAL_ITERATIONS - 1));
        y_next = y_current + (x_current >> (TOTAL_ITERATIONS - 1));
        z_current -= angle_current;
    }

    *x = x_next;
    *y = y_next;
    *z = z_current;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    printf("cordic_V_fixed_point_pipelined runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));
}

#undef TOTAL_ITERATIONS