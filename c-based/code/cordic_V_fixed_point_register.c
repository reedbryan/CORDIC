extern int z_table[15];

/*
 * register is a request to the compiler to keep these frequently used values
 * in registers.  Modern optimizing compilers may ignore the request.
 */
void cordic_V_fixed_point_register(int *x, int *y, int *z)
{
    register int x_temp_1 = *x;
    register int y_temp_1 = *y;
    register int z_temp = 0;
    register int x_temp_2;
    register int y_temp_2;
    register int i;

    for (i = 0; i < 15; ++i) {
        if (y_temp_1 > 0) {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp += z_table[i];
        } else {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp -= z_table[i];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}
