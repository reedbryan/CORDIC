#include <stddef.h>
#include <stdio.h>

#define REPETITIONS 250000U
#define INPUT_COUNT 6U
#define TOTAL_CALLS ((unsigned long long)REPETITIONS * INPUT_COUNT)

/* atan(2^-i), i = 0..14, represented as Q15 radians. */
int z_table[15] = {
    25735, 15192, 8027, 4074, 2045,
    1023, 511, 255, 127, 63,
    31, 15, 7, 3, 1
};

static const int test_inputs[INPUT_COUNT][2] = {
    {27852, 24903},
    {16384, 16384},
    {29491, 3277},
    {3277, 29491},
    {16384, -3277},
    {24576, -16384}
};

/* Defined by the Makefile for the implementation currently being measured. */
#ifndef CORDIC_FUNCTION
#error "CORDIC_FUNCTION must name the implementation being measured"
#endif

#ifdef UNROLL_FACTOR
void CORDIC_FUNCTION(int *x, int *y, int *z, int unroll_factor);
#define RUN_CORDIC(X, Y, Z) CORDIC_FUNCTION((X), (Y), (Z), UNROLL_FACTOR)
#else
void CORDIC_FUNCTION(int *x, int *y, int *z);
#define RUN_CORDIC(X, Y, Z) CORDIC_FUNCTION((X), (Y), (Z))
#endif

int main(void)
{
    unsigned int repetition;
    size_t input_index;
    volatile unsigned long long checksum = 0;

    for (repetition = 0; repetition < REPETITIONS; ++repetition) {
        for (input_index = 0; input_index < INPUT_COUNT; ++input_index) {
            int x = test_inputs[input_index][0];
            int y = test_inputs[input_index][1];
            int z;

            RUN_CORDIC(&x, &y, &z);
            checksum += (unsigned int)x;
            checksum += (unsigned int)y;
            checksum += (unsigned int)z;
        }
    }

    printf("calls: %llu\nchecksum: %llu\n", TOTAL_CALLS, checksum);
    return 0;
}
