CC ?= gcc
COMMON_FLAGS := -mcpu=cortex-a57 -std=c11 -Wall -Wextra -Werror
SRC_DIR := ../code
DRIVER := count_cycles_main.c

IMPLEMENTATIONS := baseline pipelined ternary packed_angles register rounded \
	                   simd unrolled_1 unrolled_3 unrolled_5 unrolled_15
LEVELS := base O1 O2 O3

.PHONY: all base O1 O2 O3 clean

all: $(LEVELS)

base: $(addprefix base/,$(IMPLEMENTATIONS))
O1: $(addprefix O1/,$(IMPLEMENTATIONS))
O2: $(addprefix O2/,$(IMPLEMENTATIONS))
O3: $(addprefix O3/,$(IMPLEMENTATIONS))

base/%: OPT_FLAG := -O0
O1/%: OPT_FLAG := -O1
O2/%: OPT_FLAG := -O2
O3/%: OPT_FLAG := -O3

base/baseline O1/baseline O2/baseline O3/baseline: $(SRC_DIR)/cordic_V_fixed_point.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point $(DRIVER) $< -o $@

base/pipelined O1/pipelined O2/pipelined O3/pipelined: $(SRC_DIR)/cordic_V_fixed_point_pipelined.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_pipelined $(DRIVER) $< -o $@

base/ternary O1/ternary O2/ternary O3/ternary: $(SRC_DIR)/cordic_V_fixed_point_ternary.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_ternary $(DRIVER) $< -o $@

base/packed_angles O1/packed_angles O2/packed_angles O3/packed_angles: $(SRC_DIR)/cordic_V_fixed_point_packed_angles.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_packed_angles $(DRIVER) $< -o $@

base/register O1/register O2/register O3/register: $(SRC_DIR)/cordic_V_fixed_point_register.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_register $(DRIVER) $< -o $@

base/rounded O1/rounded O2/rounded O3/rounded: $(SRC_DIR)/cordic_V_fixed_point_rounded.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_rounded $(DRIVER) $< -o $@

base/simd O1/simd O2/simd O3/simd: $(SRC_DIR)/cordic_V_fixed_point_simd.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_simd $(DRIVER) $< -o $@

base/unrolled_1 O1/unrolled_1 O2/unrolled_1 O3/unrolled_1: $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=1 $(DRIVER) $< -o $@

base/unrolled_3 O1/unrolled_3 O2/unrolled_3 O3/unrolled_3: $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=3 $(DRIVER) $< -o $@

base/unrolled_5 O1/unrolled_5 O2/unrolled_5 O3/unrolled_5: $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=5 $(DRIVER) $< -o $@

base/unrolled_15 O1/unrolled_15 O2/unrolled_15 O3/unrolled_15: $(SRC_DIR)/cordic_V_fixed_point_unrolled.c
	@mkdir -p $(dir $@)
	$(CC) $(COMMON_FLAGS) $(OPT_FLAG) -DCORDIC_FUNCTION=cordic_V_fixed_point_unrolled -DUNROLL_FACTOR=15 $(DRIVER) $< -o $@

clean:
	rm -rf base O1 O2 O3
