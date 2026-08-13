CC ?= gcc
CFLAGS ?= -O3 -mcpu=cortex-a57 -std=c11 -Wall -Wextra -Werror
SRC_DIR := ..
DRIVER := count_cycles_main.c

.PHONY: all clean

all: baseline pipelined ternary packed_angles register rounded simd \
	 unrolled_1 unrolled_3 unrolled_5 unrolled_15

baseline: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point $^ -o $@

pipelined: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_pipelined.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_pipelined $^ -o $@

ternary: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_ternary.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_ternary $^ -o $@

packed_angles: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_packed_angles.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_packed_angles $^ -o $@

register: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_register.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_register $^ -o $@

rounded: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_rounded.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_rounded $^ -o $@

simd: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_simd.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_simd $^ -o $@

unrolled_1: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=1 $^ -o $@

unrolled_3: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=3 $^ -o $@

unrolled_5: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=5 $^ -o $@

unrolled_15: $(DRIVER) $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	$(CC) $(CFLAGS) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=15 $^ -o $@

clean:
	rm -f baseline pipelined ternary packed_angles register rounded simd \
	      unrolled_1 unrolled_3 unrolled_5 unrolled_15
