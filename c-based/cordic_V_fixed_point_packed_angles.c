#include <stdint.h>

/*
 * Two signed Q15 angles are stored in each 32-bit word.  This table must be
 * updated if the 15-entry Q15 z_table used by the other implementations is
 * changed.
 */
#define PACK_ANGLES(LOW, HIGH)                                                 \
    ((uint32_t)(uint16_t)(LOW) | ((uint32_t)(uint16_t)(HIGH) << 16))

static const uint32_t packed_z_table[8] = {
    PACK_ANGLES(25735, 15192), PACK_ANGLES(8027, 4074),
    PACK_ANGLES(2045, 1023),   PACK_ANGLES(511, 255),
    PACK_ANGLES(127, 63),      PACK_ANGLES(31, 15),
    PACK_ANGLES(7, 3),         PACK_ANGLES(1, 0)
};

#undef PACK_ANGLES

#define CORDIC_STAGE(I, ANGLE)                                                 \
    do {                                                                       \
        if (y_temp_1 > 0) {                                                    \
            x_temp_2 = x_temp_1 + (y_temp_1 >> (I));                           \
            y_temp_2 = y_temp_1 - (x_temp_1 >> (I));                           \
            z_temp += (ANGLE);                                                 \
        } else {                                                               \
            x_temp_2 = x_temp_1 - (y_temp_1 >> (I));                           \
            y_temp_2 = y_temp_1 + (x_temp_1 >> (I));                           \
            z_temp -= (ANGLE);                                                 \
        }                                                                      \
        x_temp_1 = x_temp_2;                                                   \
        y_temp_1 = y_temp_2;                                                   \
    } while (0)

/*
 * Processes two dependent CORDIC stages per packed-table load.  The second
 * stage still waits for the first stage's x and y; only the angle load is
 * shared by the pair.
 */
void cordic_V_fixed_point_packed_angles(int *x, int *y, int *z)
{
    int x_temp_1 = *x;
    int y_temp_1 = *y;
    int z_temp = 0;
    int x_temp_2;
    int y_temp_2;
    int i;

    for (i = 0; i < 15; i += 2) {
        const uint32_t packed_angles = packed_z_table[i >> 1];
        const int first_angle = (int16_t)(packed_angles & UINT16_MAX);

        CORDIC_STAGE(i, first_angle);
        if (i + 1 < 15) {
            const int second_angle = (int16_t)(packed_angles >> 16);

            CORDIC_STAGE(i + 1, second_angle);
        }
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}

#undef CORDIC_STAGE
