extern int z_table[15];

#define TOTAL_ITERATIONS 15

/*
 * The lowest-cycle implementation measured at -O3.  It keeps the CORDIC
 * loop rolled and software-pipelines the independent angle-table load: while
 * stage i uses angle_current, the next table entry is loaded for stage i + 1.
 */
void cordic_V_fixed_point_optimal(int *x, int *y, int *z)
{
    int x_current = *x;
    int y_current = *y;
    int z_current = 0;
    int x_next;
    int y_next;
    int angle_current = z_table[0];
    int i;

    /* Pipeline kernel: stages 0 through 13. */
    for (i = 0; i < TOTAL_ITERATIONS - 1; ++i) {
        const int angle_next = z_table[i + 1];

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

    /* Pipeline epilogue: stage 14 uses the angle already loaded above. */
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
}

#undef TOTAL_ITERATIONS
