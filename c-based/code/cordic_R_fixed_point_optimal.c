#define TOTAL_ITERATIONS 15

/* atan(2^-i), i = 0..14, represented as Q15 radians. */
static const int local_z_table[TOTAL_ITERATIONS] = {
    25735, 15192, 8027, 4074, 2045,
    1023, 511, 255, 127, 63,
    31, 15, 7, 3, 1
};

/*
 * Optimized CORDIC rotation mode.  It uses the same local-constant, rolled,
 * pipelined, ternary form selected for the vectoring implementation.
 */
void cordic_R_fixed_point_optimal(int *x, int *y, int *z)
{
    int x_current = *x;
    int y_current = *y;
    int z_current = *z;
    int x_next;
    int y_next;
    int angle_current = local_z_table[0];
    int i;

    /* Pipeline kernel: rotation stages 0 through 13. */
    for (i = 0; i < TOTAL_ITERATIONS - 1; ++i) {
        const int angle_next = local_z_table[i + 1];
        const int z_is_nonnegative = (z_current >= 0);

        x_next = z_is_nonnegative
                 ? x_current - (y_current >> i)
                 : x_current + (y_current >> i);
        y_next = z_is_nonnegative
                 ? y_current + (x_current >> i)
                 : y_current - (x_current >> i);
        z_current += z_is_nonnegative ? -angle_current : angle_current;

        x_current = x_next;
        y_current = y_next;
        angle_current = angle_next;
    }

    /* Pipeline epilogue: stage 14. */
    {
        const int z_is_nonnegative = (z_current >= 0);

        x_next = z_is_nonnegative
                 ? x_current - (y_current >> (TOTAL_ITERATIONS - 1))
                 : x_current + (y_current >> (TOTAL_ITERATIONS - 1));
        y_next = z_is_nonnegative
                 ? y_current + (x_current >> (TOTAL_ITERATIONS - 1))
                 : y_current - (x_current >> (TOTAL_ITERATIONS - 1));
        z_current += z_is_nonnegative ? -angle_current : angle_current;
    }

    *x = x_next;
    *y = y_next;
    *z = z_current;
}

#undef TOTAL_ITERATIONS
