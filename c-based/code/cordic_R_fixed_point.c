extern int z_table[15];

/*
 * CORDIC rotation mode.
 *
 * On entry, z is the target angle in Q15 radians.  For sine/cosine output,
 * initialize x to the inverse CORDIC gain in Q15 (approximately 19899) and
 * y to zero.  On return, x and y approximate cos(z_input) and sin(z_input),
 * respectively, while z contains the residual angle.
 *
 * This direct rotation form is intended for target angles near [-pi/2, pi/2].
 */
void cordic_R_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1 = *x;
    int y_temp_1 = *y;
    int z_temp = *z;
    int x_temp_2;
    int y_temp_2;
    int i;

    for (i = 0; i < 15; ++i) {
        if (z_temp >= 0) {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp -= z_table[i];
        } else {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp += z_table[i];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}
