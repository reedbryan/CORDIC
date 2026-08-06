#include <stdio.h>

/*
 * The vectoring routine returns its angle in Q15 radians:
 *     radians = z / SCALE
 * x and y are also supplied in Q15, although their common scale cancels in
 * atan(y / x).
 */
#define Q_FORMAT 15
#define SCALE (1 << Q_FORMAT)

/* atan(2^-i), i = 0..14, in Q15 radians. */
int z_table[15] = {
    25735, 15192, 8027, 4074, 2045,
    1023, 511, 255, 127, 63,
    31, 15, 7, 3, 1
};

void cordic_V_fixed_point(int *x, int *y, int *z);

int main(void)
{
    /* Q15 inputs: x = 27852 / SCALE, y = 24903 / SCALE. */
    const int x_input = 27852;
    const int y_input = 24903;
    int x = x_input;
    int y = y_input;
    int angle_q15;

    if (x_input <= 0) {
        fprintf(stderr, "This vectoring implementation requires x > 0.\n");
        return 1;
    }

    cordic_V_fixed_point(&x, &y, &angle_q15);

    printf("Vectoring CORDIC: atan(y / x)\n\n");
    printf("Input x (Q15): %d (%.6f)\n", x_input, x_input / (double)SCALE);
    printf("Input y (Q15): %d (%.6f)\n", y_input, y_input / (double)SCALE);
    printf("atan(y / x) (Q15 radians): %d\n", angle_q15);
    printf("atan(y / x) (radians): %.6f\n", angle_q15 / (double)SCALE);
    printf("Residual y after CORDIC: %d\n", y);

    return 0;
}
