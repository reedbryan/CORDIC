//helper program to generate the atan table for the CORDIC algorithm in VHDL
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define ITERATIONS 15
#define FRAC_BITS 15

int main(void)
{
    const double scale = (double)(1ULL << FRAC_BITS);

    printf("constant ATAN_TABLE : atan_table_t := (\n");

    for (int i = 0; i < ITERATIONS; i++) {

        double angle = atan(pow(2.0, -i));

        int32_t fixed_value = (int32_t)llround(angle * scale);

        printf("    to_signed(%d, 32)", fixed_value);

        if (i < ITERATIONS - 1)
            printf(",");

        printf(" -- atan(2^-%d) = %.12f\n", i, angle);
    }

    printf(");\n");

    return 0;
}