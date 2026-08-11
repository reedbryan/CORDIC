#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <time.h>


/*
 * The vectoring routine returns its angle in Q15 radians:
 *     radians = z / SCALE
 * x and y are also supplied in Q15, although their common scale cancels in
 * atan(y / x).
 */
#define Q_FORMAT 15
#define SCALE (1 << Q_FORMAT)

static double elapsed_microseconds(const struct timespec *start,
                                   const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec) * 1000000.0 +
           (double)(end->tv_nsec - start->tv_nsec) / 1000.0;
}

/* atan(2^-i), i = 0..14, in Q15 radians. */
int z_table[15] = {
    25735, 15192, 8027, 4074, 2045,
    1023, 511, 255, 127, 63,
    31, 15, 7, 3, 1
};

void cordic_V_fixed_point(int *x, int *y, int *z);
void cordic_V_fixed_point_unrolled(int *x, int *y, int *z, int unroll_factor);
void cordic_V_fixed_point_pipelined(int *x, int *y, int *z);

int main(void)
{
    /* Q15 inputs: x = 27852 / SCALE, y = 24903 / SCALE. */
    const int x_input = 27852;
    const int y_input = 24903;
    int x = x_input;
    int y = y_input;
    int angle_q15;
    struct timespec start_time;
    struct timespec end_time;

    if (x_input <= 0) {
        fprintf(stderr, "This vectoring implementation requires x > 0.\n");
        return 1;
    }

    printf("\n\nVectoring CORDIC: atan(y / x)\n");
    
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    cordic_V_fixed_point(&x, &y, &angle_q15);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    
    printf("cordic_V_fixed_point runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));
    printf("Input x (Q15): %d (%.6f)\n", x_input, x_input / (double)SCALE);
    printf("Input y (Q15): %d (%.6f)\n", y_input, y_input / (double)SCALE);
    printf("atan(y / x) (Q15 radians): %d\n", angle_q15);
    printf("atan(y / x) (radians): %.6f\n", angle_q15 / (double)SCALE);
    printf("Residual y after CORDIC: %d\n", y);
    
    
    printf("\n\nVectoring CORDIC (pipelined): atan(y / x)\n");
    x = x_input;
    y = y_input;
    
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    cordic_V_fixed_point_pipelined(&x, &y, &angle_q15);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    
    printf("cordic_V_fixed_point_pipelined runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));
    printf("Input x (Q15): %d (%.6f)\n", x_input, x_input / (double)SCALE);
    printf("Input y (Q15): %d (%.6f)\n", y_input, y_input / (double)SCALE);
    printf("atan(y / x) (Q15 radians): %d\n", angle_q15);
    printf("atan(y / x) (radians): %.6f\n", angle_q15 / (double)SCALE);
    printf("Residual y after CORDIC (pipelined): %d\n\n", y);

    
    printf("\n\nVectoring CORDIC (unrolled): atan(y / x)\n");
    x = x_input;
    y = y_input;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    cordic_V_fixed_point_unrolled(&x, &y, &angle_q15, 1);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    printf("cordic_V_fixed_point_unrolled (at 1) runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));

    printf("\n\nVectoring CORDIC (unrolled): atan(y / x)\n");
    x = x_input;
    y = y_input;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    cordic_V_fixed_point_unrolled(&x, &y, &angle_q15, 3);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    printf("cordic_V_fixed_point_unrolled (at 3) runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));
    
    x = x_input;
    y = y_input;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    cordic_V_fixed_point_unrolled(&x, &y, &angle_q15, 5);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    printf("cordic_V_fixed_point_unrolled (at 5) runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));
    
    x = x_input;
    y = y_input;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    cordic_V_fixed_point_unrolled(&x, &y, &angle_q15, 15);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    printf("cordic_V_fixed_point_unrolled (at 15) runtime: %.10f us\n",
           elapsed_microseconds(&start_time, &end_time));
   
    printf("Input x (Q15): %d (%.6f)\n", x_input, x_input / (double)SCALE);
    printf("Input y (Q15): %d (%.6f)\n", y_input, y_input / (double)SCALE);
    printf("atan(y / x) (Q15 radians): %d\n", angle_q15);
    printf("atan(y / x) (radians): %.6f\n", angle_q15 / (double)SCALE);
    printf("Residual y after CORDIC (unrolled): %d\n\n", y);

    return 0;
}