#include <stdio.h>

extern int z_table[15];

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

    if (unroll_factor <= 0 || TOTAL_ITERATIONS % unroll_factor != 0) {
        fprintf(stderr,
                "Invalid unroll factor %d: it must be a positive factor of %d.\n",
                unroll_factor, TOTAL_ITERATIONS);
        return;
    }

    /* Each case has an outer loop and an explicitly unrolled loop body. */
    switch (unroll_factor) {
    case 1:
        for (i = 0; i < TOTAL_ITERATIONS; i += 1) {
            CORDIC_STAGE(i);
        }
        break;
    case 3:
        for (i = 0; i < TOTAL_ITERATIONS; i += 3) {
            CORDIC_STAGE(i);
            CORDIC_STAGE(i + 1);
            CORDIC_STAGE(i + 2);
        }
        break;
    case 5:
        for (i = 0; i < TOTAL_ITERATIONS; i += 5) {
            CORDIC_STAGE(i);
            CORDIC_STAGE(i + 1);
            CORDIC_STAGE(i + 2);
            CORDIC_STAGE(i + 3);
            CORDIC_STAGE(i + 4);
        }
        break;
    case 15:
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
}

#undef CORDIC_STAGE
#undef TOTAL_ITERATIONS
