#define TOTAL_ITERATIONS 15

/*
 * Local constants allow the compiler to propagate the fixed CORDIC angles.
 * This table represents atan(2^-i) in Q15 radians for i = 0 through 14.
 */
static const int local_z_table[TOTAL_ITERATIONS] = {
    25735, 15192, 8027, 4074, 2045,
    1023, 511, 255, 127, 63,
    31, 15, 7, 3, 1
};

/*
 * Rolled, software-pipelined CORDIC vectoring routine.  While stage i uses
 * angle_current, the source prepares angle_next for stage i + 1.  Direction
 * selection uses ternary expressions, allowing GCC to simplify the unrolled
 * control flow when compiled with -O3.
 */
void cordic_V_fixed_point_optimal(int *x, int *y, int *z)
{
    int x_current = *x;
    int y_current = *y;
    int z_current = 0;
    int x_next;
    int y_next;
    int angle_current = local_z_table[0];
    int i;

    /* Pipeline kernel: stages 0 through 13. */
    for (i = 0; i < TOTAL_ITERATIONS - 1; ++i) {
        const int angle_next = local_z_table[i + 1];
        const int y_is_positive = (y_current > 0);

        x_next = y_is_positive
                 ? x_current + (y_current >> i)
                 : x_current - (y_current >> i);
        y_next = y_is_positive
                 ? y_current - (x_current >> i)
                 : y_current + (x_current >> i);
        z_current += y_is_positive ? angle_current : -angle_current;

        x_current = x_next;
        y_current = y_next;
        angle_current = angle_next;
    }

    /* Pipeline epilogue: stage 14 uses the angle already loaded above. */
    {
        const int y_is_positive = (y_current > 0);

        x_next = y_is_positive
                 ? x_current + (y_current >> (TOTAL_ITERATIONS - 1))
                 : x_current - (y_current >> (TOTAL_ITERATIONS - 1));
        y_next = y_is_positive
                 ? y_current - (x_current >> (TOTAL_ITERATIONS - 1))
                 : y_current + (x_current >> (TOTAL_ITERATIONS - 1));
        z_current += y_is_positive ? angle_current : -angle_current;
    }

    *x = x_next;
    *y = y_next;
    *z = z_current;
}

#undef TOTAL_ITERATIONS
