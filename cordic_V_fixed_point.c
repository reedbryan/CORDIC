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

void cordic_V_fixed_point( int *x, int *y, int *z) {
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    int i;
    struct timespec start_time;
    struct timespec end_time;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp = 0;
    for( i=0; i<15; i++) { /* 15 iterations are needed */
        if( y_temp_1 > 0) {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp += z_table[i];
        }
        else {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp -= z_table[i];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    printf("cordic_V_fixed_point runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));
}
