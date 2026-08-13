#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define Q_FORMAT 29
#define SCALE (1 << Q_FORMAT)

#define CORDIC_BASE   0x40000000UL

#define CORDIC_X      (CORDIC_BASE + 0x00)
#define CORDIC_Y      (CORDIC_BASE + 0x04)
#define CORDIC_START  (CORDIC_BASE + 0x08)
#define CORDIC_DONE   (CORDIC_BASE + 0x0C)
#define CORDIC_XOUT   (CORDIC_BASE + 0x10)
#define CORDIC_ZOUT   (CORDIC_BASE + 0x14)


static inline void cordic_v_hw(int32_t x, int32_t y, int32_t *x_out, int32_t *z_out)
{
    int32_t x_result;
    int32_t z_result;
    int32_t done;

    //Write x input.
    asm volatile (
        "str %w[value], [%w[address]]"
        :
        : [value]   "r"(x),
          [address] "r"(CORDIC_X)
        : "memory"
    );

    //Write y input.
    asm volatile (
        "str %w[value], [%w[address]]"
        :
        : [value]   "r"(y),
          [address] "r"(CORDIC_Y)
        : "memory"
    );

    
    //Start CORDIC.
    int32_t start = 1;

    asm volatile (
        "str %w[value], [%w[address]]"
        :
        : [value]   "r"(start),
          [address] "r"(CORDIC_START)
        : "memory"
    );

    
    //wait for hardware to finish.
    do {
        asm volatile (
            "ldr %w[result], [%w[address]]"
            : [result] "=r"(done)
            : [address] "r"(CORDIC_DONE)
            : "memory"
        );
    } while (done == 0);

    
    // Read final x. 
    asm volatile (
        "ldr %w[result], [%w[address]]"
        : [result] "=r"(x_result)
        : [address] "r"(CORDIC_XOUT)
        : "memory"
    );

    
    //Read final z.
    asm volatile (
        "ldr %w[result], [%w[address]]"
        : [result] "=r"(z_result)
        : [address] "r"(CORDIC_ZOUT)
        : "memory"
    );

    *x_out = x_result;
    *z_out = z_result;
}


int main(void)
{
    const int32_t x_input = 27852;
    const int32_t y_input = 24903;

    int32_t x_out;
    int32_t angle_q29;

    if (x_input <= 0) {
        fprintf(stderr,
                "This vectoring implementation requires x > 0.\n");
        return 1;
    }

    //Execute hardware CORDIC.
    cordic_v_hw(
        x_input,
        y_input,
        &x_out,
        &angle_q29
    );
    printf("angle = %d\n", angle_q29);

    return 0;
}