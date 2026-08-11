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

void compare_cordics_results(void){
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
        return;
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
}

void compare_cordics_performace(void)
{
    /* Keep x positive because this vectoring implementation requires it. */
    static const int test_inputs[][2] = {
        {27852, 24903},
        {16384, 16384},
        {29491, 3277},
        {3277, 29491},
        {16384, -3277},
        {24576, -16384}
    };
    const int unroll_factors[] = {1, 3, 5, 15};
    const unsigned int repetitions = 250000;
    const size_t input_count = sizeof(test_inputs) / sizeof(test_inputs[0]);
    const unsigned long long calls_per_benchmark =
        (unsigned long long)repetitions * input_count;
    struct timespec start_time;
    struct timespec end_time;
    size_t factor_index;

    /*
     * Time the whole batch instead of each individual call.  A CORDIC call is
     * shorter than (or close to) the cost and noise of two clock_gettime()
     * calls.  Taking one timestamp pair around many calls amortizes that
     * overhead while still allowing an average time per CORDIC call to be
     * reported.  Each benchmark uses the same input and checksum overhead.
     */
#define RUN_BENCHMARK(LABEL, CORDIC_CALL)                                     \
    do {                                                                       \
        unsigned long long checksum = 0;                                      \
        unsigned int repetition;                                               \
        size_t input_index;                                                    \
                                                                             \
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);                  \
        for (repetition = 0; repetition < repetitions; ++repetition) {        \
            for (input_index = 0; input_index < input_count; ++input_index) { \
                int x = test_inputs[input_index][0];                          \
                int y = test_inputs[input_index][1];                          \
                int angle_q15;                                                \
                                                                             \
                CORDIC_CALL;                                                  \
                checksum += (unsigned int)x;                                  \
                checksum += (unsigned int)y;                                  \
                checksum += (unsigned int)angle_q15;                          \
            }                                                                  \
        }                                                                      \
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);                    \
        printf("%-42s total: %12.3f us  average: %.6f us/call  checksum: %llu\n", \
               (LABEL),                                                        \
               elapsed_microseconds(&start_time, &end_time),                  \
               elapsed_microseconds(&start_time, &end_time) /                 \
                   (double)calls_per_benchmark,                               \
               checksum);                                                      \
    } while (0)

    printf("\nCORDIC performance comparison\n");
    printf("%u repetitions x %zu inputs = %llu calls per benchmark\n\n",
           repetitions, input_count, calls_per_benchmark);

    RUN_BENCHMARK("cordic_V_fixed_point",
                  cordic_V_fixed_point(&x, &y, &angle_q15));
    RUN_BENCHMARK("cordic_V_fixed_point_pipelined",
                  cordic_V_fixed_point_pipelined(&x, &y, &angle_q15));

    for (factor_index = 0;
         factor_index < sizeof(unroll_factors) / sizeof(unroll_factors[0]);
         ++factor_index) {
        char label[64];

        snprintf(label, sizeof(label), "cordic_V_fixed_point_unrolled (%d)",
                 unroll_factors[factor_index]);
        RUN_BENCHMARK(label,
                      cordic_V_fixed_point_unrolled(&x, &y, &angle_q15,
                                                     unroll_factors[factor_index]));
    }

#undef RUN_BENCHMARK
}

int main(void)
{
    //compare_cordics_results();
    compare_cordics_performace();

    return 0;
}
