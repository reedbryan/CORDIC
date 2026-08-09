#include <stdio.h>
#include <math.h>
#include "cordic_V_fixed_point.h"
#include "generate_z_table.h"

#define Q_TEST_ITERATIONS 15

#define MIN_ITERATIONS 8
#define MAX_ITERATIONS 20

#define NUM_Q_FORMATS 8
#define NUM_INPUTS 10


//Q formats to test initially.
const int q_formats[NUM_Q_FORMATS] = {
    4, 8, 12, 15, 16, 20, 24 ,30
};

/*
 * Standard test vectors.
 * All x values are positive because the current
 * CORDIC implementation requires x > 0.
 */
const double test_inputs[NUM_INPUTS][2] = {
    {0.85, 0.76},
    {0.50, 0.50},
    {0.90, 0.10},
    {0.10, 0.90},
    {0.75, 0.25},
    {0.25, 0.75},
    {0.50, 0.10},
    {0.10, 0.50},
    {0.99, 0.01},
    {0.01, 0.99}
};


/*
 * Calculate the average absolute error across
 * all test inputs for one Q format.
 */
double test_q_format(int q_format, int iterations)
{
    int scale = 1 << q_format;

    double total_error = 0.0;

    for (int input = 0; input < NUM_INPUTS; input++)
    {
        double x_real = test_inputs[input][0];
        double y_real = test_inputs[input][1];

        int x_input = (int)round(x_real * scale);
        int y_input = (int)round(y_real * scale);

        int x = x_input;
        int y = y_input;
        int angle_fixed;

        int z_table[iterations];

        generate_z_table(
            z_table,
            q_format,
            scale,
            iterations
        );

        cordic_V_fixed_point(
            &x,
            &y,
            &angle_fixed,
            iterations,
            z_table
        );

        double cordic_angle =
            angle_fixed / (double)scale;

        double expected =
            atan2(y_real, x_real);

        total_error += fabs(cordic_angle - expected);
    }

    return total_error / NUM_INPUTS;
}


int main(void)
{
    /*
     * --------------------------------------------------
     * STEP 1:
     * Test Q formats using 15 iterations.
     * --------------------------------------------------
     */

    printf("============================================\n");
    printf("STEP 1: Q-FORMAT TEST\n");
    printf("Iterations = %d\n", Q_TEST_ITERATIONS);
    printf("============================================\n\n");

    double q_errors[NUM_Q_FORMATS];

    for (int i = 0; i < NUM_Q_FORMATS; i++)
    {
        int q = q_formats[i];

        q_errors[i] = test_q_format(
            q,
            Q_TEST_ITERATIONS
        );

        printf(
            "Q%d: 15 iteration error = %.9f rad\n",
            q,
            q_errors[i]
        );
    }


    /*
     * --------------------------------------------------
     * STEP 2:
     * Pick the best Q formats.
     *
     * For now, manually select the 4 formats with
     * the lowest errors from Step 1.
     * --------------------------------------------------
     */

    /*
     * These should be changed based on the results
     * from Step 1.
     */
    int best_q_formats[4] = {
        12,
        15,
        16,
        20
    };

    printf("\n============================================\n");
    printf("STEP 2: ITERATION TEST\n");
    printf("Testing selected Q formats\n");
    printf("============================================\n\n");


    /*
     * --------------------------------------------------
     * STEP 3:
     * Test different iteration counts for the
     * selected Q formats.
     * --------------------------------------------------
     */

    for (int q_index = 0; q_index < 4; q_index++)
    {
        int q = best_q_formats[q_index];

        printf("\nQ%d\n", q);
        printf("--------------------------------------------\n");

        for (int iterations = MIN_ITERATIONS;
             iterations <= MAX_ITERATIONS;
             iterations++)
        {
            double error =
                test_q_format(q, iterations);

            printf(
                "Iterations = %2d : Average error = %.9f rad\n",
                iterations,
                error
            );
        }
    }

    return 0;
}