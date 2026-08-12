#include <stdio.h>

extern int z_table[15];

/*
 * Loop-based CORDIC vectoring routine using ternary direction selection.
 * The loop remains intentionally rolled so this can be compared directly
 * with cordic_V_fixed_point.c.
 */
void cordic_V_fixed_point_ternary(int *x, int *y, int *z)
{
    int x_temp_1 = *x;
    int y_temp_1 = *y;
    int z_temp = 0;
    int x_temp_2;
    int y_temp_2;
    int i;

    for (i = 0; i < 15; ++i) {
        const int y_is_positive = (y_temp_1 > 0);

        x_temp_2 = y_is_positive
                     ? x_temp_1 + (y_temp_1 >> i)
                     : x_temp_1 - (y_temp_1 >> i);
        y_temp_2 = y_is_positive
                     ? y_temp_1 - (x_temp_1 >> i)
                     : y_temp_1 + (x_temp_1 >> i);
        z_temp += y_is_positive ? z_table[i] : -z_table[i];

        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}
