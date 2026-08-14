#include <math.h>

void generate_z_table(int z_table[], int q_format,int scale, int iterations)
{
    for (int i = 0; i < iterations; i++)
    {
        double angle = atan(pow(2.0, -i));

        z_table[i] = (int)round(angle * scale);
    }
}