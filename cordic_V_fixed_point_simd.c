#include <arm_neon.h>
#include <stdint.h>

extern int z_table[15];

/*
 * NEON holds x and y in separate 32-bit lanes.  Both output values depend on
 * the old x and y, so their add/subtract operations can be issued together.
 * The following stage still depends on the resulting pair.
 */
void cordic_V_fixed_point_simd(int *x, int *y, int *z)
{
    int x_temp_1 = *x;
    int y_temp_1 = *y;
    int z_temp = 0;
    int i;

    for (i = 0; i < 15; ++i) {
        const int x_shifted = x_temp_1 >> i;
        const int y_shifted = y_temp_1 >> i;
        int32x2_t current = vdup_n_s32(x_temp_1);
        int32x2_t delta = vdup_n_s32(y_shifted);
        int32x2_t next;

        current = vset_lane_s32(y_temp_1, current, 1);
        delta = vset_lane_s32(-x_shifted, delta, 1);

        if (y_temp_1 > 0) {
            next = vadd_s32(current, delta);
            z_temp += z_table[i];
        } else {
            next = vsub_s32(current, delta);
            z_temp -= z_table[i];
        }

        x_temp_1 = vget_lane_s32(next, 0);
        y_temp_1 = vget_lane_s32(next, 1);
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}
