/*
 * CORDIC vectoring implementation based on feedback from the GCC -O3
 * assembly.  The source explicitly exposes the transformations that can be
 * represented safely in C; GCC still controls physical register allocation,
 * instruction scheduling, and final branch layout.
 */

#define CORDIC_STAGE(SHIFT, ANGLE)                                            \
    do {                                                                       \
        const int y_is_positive = (y_current > 0);                            \
        const int y_shifted = y_current >> (SHIFT);                           \
        const int x_shifted = x_current >> (SHIFT);                           \
        const int x_next = y_is_positive                                      \
                         ? x_current + y_shifted                              \
                         : x_current - y_shifted;                             \
        const int y_next = y_is_positive                                      \
                         ? y_current - x_shifted                              \
                         : y_current + x_shifted;                             \
                                                                             \
        z_current += y_is_positive ? (ANGLE) : -(ANGLE);                      \
        x_current = x_next;                                                   \
        y_current = y_next;                                                   \
    } while (0)

void cordic_V_fixed_point_with_feedback(int *x, int *y, int *z)
{
    /*
     * register mirrors the register-oriented assembly, although optimizing
     * compilers are free to ignore this source-level storage-class hint.
     */
    register int x_current = *x;
    register int y_current = *y;
    register int z_current = 0;

    /*
     * The fixed 15-stage loop is fully expanded.  Both shift counts and Q15
     * atan constants are compile-time immediates, eliminating loop-control
     * operations, runtime indexing, and angle-table loads.
     */
    CORDIC_STAGE(0, 25735);
    CORDIC_STAGE(1, 15192);
    CORDIC_STAGE(2, 8027);
    CORDIC_STAGE(3, 4074);
    CORDIC_STAGE(4, 2045);
    CORDIC_STAGE(5, 1023);
    CORDIC_STAGE(6, 511);
    CORDIC_STAGE(7, 255);
    CORDIC_STAGE(8, 127);
    CORDIC_STAGE(9, 63);
    CORDIC_STAGE(10, 31);
    CORDIC_STAGE(11, 15);
    CORDIC_STAGE(12, 7);
    CORDIC_STAGE(13, 3);
    CORDIC_STAGE(14, 1);

    /* Only the final results are written to memory. */
    *x = x_current;
    *y = y_current;
    *z = z_current;
}

#undef CORDIC_STAGE
