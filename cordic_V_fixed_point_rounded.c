#include <stdint.h>

extern int z_table[15];

/*
 * Rounds to the nearest integer, with halfway cases away from zero.  int64_t
 * avoids overflow while taking the magnitude of a signed int.
 */
static int rounded_right_shift(int value, unsigned int shift)
{
    int64_t magnitude;
    int64_t rounded;

    if (shift == 0) {
        return value;
    }

    magnitude = value < 0 ? -(int64_t)value : value;
    rounded = (magnitude + ((int64_t)1 << (shift - 1))) >> shift;
    return value < 0 ? -(int)rounded : (int)rounded;
}

/*
 * This intentionally changes the fixed-point arithmetic: x and y shifts are
 * rounded instead of truncated.  Compare its numerical accuracy separately.
 */
void cordic_V_fixed_point_rounded(int *x, int *y, int *z)
{
    int x_temp_1 = *x;
    int y_temp_1 = *y;
    int z_temp = 0;
    int x_temp_2;
    int y_temp_2;
    int i;

    for (i = 0; i < 15; ++i) {
        const int x_shifted = rounded_right_shift(x_temp_1, (unsigned int)i);
        const int y_shifted = rounded_right_shift(y_temp_1, (unsigned int)i);

        if (y_temp_1 > 0) {
            x_temp_2 = x_temp_1 + y_shifted;
            y_temp_2 = y_temp_1 - x_shifted;
            z_temp += z_table[i];
        } else {
            x_temp_2 = x_temp_1 - y_shifted;
            y_temp_2 = y_temp_1 + x_shifted;
            z_temp -= z_table[i];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}
