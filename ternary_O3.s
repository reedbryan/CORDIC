	.arch armv8-a+crc
	.file	"cordic_V_fixed_point_ternary.c"
// GNU C17 (Debian 14.2.0-19) version 14.2.0 (aarch64-linux-gnu)
//	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

// warning: MPFR header version 4.2.1 differs from library version 4.2.2.
// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mcpu=cortex-a57 -mlittle-endian -mabi=lp64 -O3 -fasynchronous-unwind-tables
	.text
	.align	2
	.p2align 4,,15
	.global	cordic_V_fixed_point_ternary
	.type	cordic_V_fixed_point_ternary, %function
cordic_V_fixed_point_ternary:
.LFB11:
	.cfi_startproc
// cordic_V_fixed_point_ternary.c:13:     int y_temp_1 = *y;
	ldr	w5, [x1]	//, *y_16(D)
// cordic_V_fixed_point_ternary.c:12:     int x_temp_1 = *x;
	ldr	w7, [x0]	//, *x_14(D)
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	adrp	x4, :got:z_table;ldr	x4, [x4, :got_lo12:z_table]	// tmp208,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w5, 0	// y_temp_1,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w8, w7, w5	// iftmp.0_56, x_temp_1, y_temp_1
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w5, w7	// iftmp.1_23, y_temp_1, x_temp_1
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w3, [x4]	//, z_table[0]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L3		//,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w3, w3	// pretmp_6, pretmp_6
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w8, w7, w5	// iftmp.0_56, x_temp_1, y_temp_1
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w7, w5	// iftmp.1_23, x_temp_1, y_temp_1
.L3:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w11, w6, 1	// _26, iftmp.1_23,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w10, w8, 1	// _12, iftmp.0_56,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w9, [x4, 4]	//, z_table[1]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w6, 0	// iftmp.1_23,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w7, w11, w8	// iftmp.0_8, _26, iftmp.0_56
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w5, w6, w10	// iftmp.1_60, iftmp.1_23, _12
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L5		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w7, w8, w11	// iftmp.0_8, iftmp.0_56, _26
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w5, w10, w6	// iftmp.1_60, _12, iftmp.1_23
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w9, w9	// pretmp_34, pretmp_34
.L5:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w5, 2	// _75, iftmp.1_60,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w7, 2	// _76, iftmp.0_8,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w10, [x4, 8]	//, z_table[2]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w5, 0	// iftmp.1_60,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w9	// z_temp, pretmp_6, pretmp_34
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w8, w7, w12	// iftmp.0_81, iftmp.0_8, _75
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w5, w11	// iftmp.1_82, iftmp.1_60, _76
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L7		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w8, w7, w12	// iftmp.0_81, iftmp.0_8, _75
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w5, w11	// iftmp.1_82, iftmp.1_60, _76
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w10, w10	// pretmp_77, pretmp_77
.L7:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w6, 3	// _94, iftmp.1_82,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w8, 3	// _95, iftmp.0_81,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w9, [x4, 12]	//, z_table[3]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w6, 0	// iftmp.1_82,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w10	// z_temp, z_temp, pretmp_77
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w7, w8, w12	// iftmp.0_100, iftmp.0_81, _94
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w5, w6, w11	// iftmp.1_101, iftmp.1_82, _95
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L9		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w7, w8, w12	// iftmp.0_100, iftmp.0_81, _94
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w5, w6, w11	// iftmp.1_101, iftmp.1_82, _95
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w9, w9	// pretmp_96, pretmp_96
.L9:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w5, 4	// _113, iftmp.1_101,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w7, 4	// _114, iftmp.0_100,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w10, [x4, 16]	//, z_table[4]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w5, 0	// iftmp.1_101,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w9	// z_temp, z_temp, pretmp_96
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w8, w7, w12	// iftmp.0_119, iftmp.0_100, _113
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w5, w11	// iftmp.1_120, iftmp.1_101, _114
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L11		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w8, w7, w12	// iftmp.0_119, iftmp.0_100, _113
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w5, w11	// iftmp.1_120, iftmp.1_101, _114
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w10, w10	// pretmp_115, pretmp_115
.L11:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w6, 5	// _132, iftmp.1_120,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w8, 5	// _133, iftmp.0_119,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w9, [x4, 20]	//, z_table[5]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w6, 0	// iftmp.1_120,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w10	// z_temp, z_temp, pretmp_115
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w7, w8, w12	// iftmp.0_138, iftmp.0_119, _132
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w5, w6, w11	// iftmp.1_139, iftmp.1_120, _133
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L13		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w7, w8, w12	// iftmp.0_138, iftmp.0_119, _132
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w5, w6, w11	// iftmp.1_139, iftmp.1_120, _133
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w9, w9	// pretmp_134, pretmp_134
.L13:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w5, 6	// _151, iftmp.1_139,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w7, 6	// _152, iftmp.0_138,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w10, [x4, 24]	//, z_table[6]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w5, 0	// iftmp.1_139,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w9	// z_temp, z_temp, pretmp_134
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w8, w7, w12	// iftmp.0_157, iftmp.0_138, _151
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w5, w11	// iftmp.1_158, iftmp.1_139, _152
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L15		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w8, w7, w12	// iftmp.0_157, iftmp.0_138, _151
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w5, w11	// iftmp.1_158, iftmp.1_139, _152
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w10, w10	// pretmp_153, pretmp_153
.L15:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w6, 7	// _170, iftmp.1_158,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w8, 7	// _171, iftmp.0_157,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w9, [x4, 28]	//, z_table[7]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w6, 0	// iftmp.1_158,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w10	// z_temp, z_temp, pretmp_153
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w7, w8, w12	// iftmp.0_176, iftmp.0_157, _170
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w5, w6, w11	// iftmp.1_177, iftmp.1_158, _171
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L17		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w7, w8, w12	// iftmp.0_176, iftmp.0_157, _170
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w5, w6, w11	// iftmp.1_177, iftmp.1_158, _171
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w9, w9	// pretmp_172, pretmp_172
.L17:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w5, 8	// _189, iftmp.1_177,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w7, 8	// _190, iftmp.0_176,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w10, [x4, 32]	//, z_table[8]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w5, 0	// iftmp.1_177,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w9	// z_temp, z_temp, pretmp_172
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w8, w7, w12	// iftmp.0_195, iftmp.0_176, _189
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w5, w11	// iftmp.1_196, iftmp.1_177, _190
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L19		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w8, w7, w12	// iftmp.0_195, iftmp.0_176, _189
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w5, w11	// iftmp.1_196, iftmp.1_177, _190
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w10, w10	// pretmp_191, pretmp_191
.L19:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w6, 9	// _208, iftmp.1_196,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w8, 9	// _209, iftmp.0_195,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w9, [x4, 36]	//, z_table[9]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w6, 0	// iftmp.1_196,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w10	// z_temp, z_temp, pretmp_191
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w7, w8, w12	// iftmp.0_214, iftmp.0_195, _208
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w5, w6, w11	// iftmp.1_215, iftmp.1_196, _209
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L21		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w7, w8, w12	// iftmp.0_214, iftmp.0_195, _208
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w5, w6, w11	// iftmp.1_215, iftmp.1_196, _209
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w9, w9	// pretmp_210, pretmp_210
.L21:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w5, 10	// _227, iftmp.1_215,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w7, 10	// _228, iftmp.0_214,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w10, [x4, 40]	//, z_table[10]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w5, 0	// iftmp.1_215,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w9	// z_temp, z_temp, pretmp_210
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w8, w7, w12	// iftmp.0_233, iftmp.0_214, _227
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w5, w11	// iftmp.1_234, iftmp.1_215, _228
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L23		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w8, w7, w12	// iftmp.0_233, iftmp.0_214, _227
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w5, w11	// iftmp.1_234, iftmp.1_215, _228
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w10, w10	// pretmp_229, pretmp_229
.L23:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w6, 11	// _246, iftmp.1_234,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w8, 11	// _247, iftmp.0_233,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w9, [x4, 44]	//, z_table[11]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w6, 0	// iftmp.1_234,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w10	// z_temp, z_temp, pretmp_229
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w7, w8, w12	// iftmp.0_252, iftmp.0_233, _246
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w5, w6, w11	// iftmp.1_253, iftmp.1_234, _247
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L25		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w7, w8, w12	// iftmp.0_252, iftmp.0_233, _246
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w5, w6, w11	// iftmp.1_253, iftmp.1_234, _247
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w9, w9	// pretmp_248, pretmp_248
.L25:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w5, 12	// _265, iftmp.1_253,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w7, 12	// _266, iftmp.0_252,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w10, [x4, 48]	//, z_table[12]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w5, 0	// iftmp.1_253,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w9	// z_temp, z_temp, pretmp_248
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w8, w7, w12	// iftmp.0_271, iftmp.0_252, _265
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w5, w11	// iftmp.1_272, iftmp.1_253, _266
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L27		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w8, w7, w12	// iftmp.0_271, iftmp.0_252, _265
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w5, w11	// iftmp.1_272, iftmp.1_253, _266
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w10, w10	// pretmp_267, pretmp_267
.L27:
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w12, w6, 13	// _284, iftmp.1_272,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w11, w8, 13	// _285, iftmp.0_271,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w9, [x4, 52]	//, z_table[13]
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w6, 0	// iftmp.1_272,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w10	// z_temp, z_temp, pretmp_267
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w5, w8, w12	// iftmp.0_290, iftmp.0_271, _284
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w7, w6, w11	// iftmp.1_291, iftmp.1_272, _285
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	bgt	.L29		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w5, w8, w12	// iftmp.0_290, iftmp.0_271, _284
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w7, w6, w11	// iftmp.1_291, iftmp.1_272, _285
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w9, w9	// pretmp_286, pretmp_286
.L29:
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	cmp	w7, 0	// iftmp.1_291,
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	ldr	w4, [x4, 56]	//, z_table[14]
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w3, w3, w9	// z_temp, z_temp, pretmp_286
// cordic_V_fixed_point_ternary.c:23:                      ? x_temp_1 + (y_temp_1 >> i)
	asr	w8, w7, 14	// _30, iftmp.1_291,
// cordic_V_fixed_point_ternary.c:26:                      ? y_temp_1 - (x_temp_1 >> i)
	asr	w6, w5, 14	// _41, iftmp.0_290,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	ble	.L30		//,
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	add	w5, w8, w5	// iftmp.0_46, _30, iftmp.0_290
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	sub	w6, w7, w6	// iftmp.1_47, iftmp.1_291, _41
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w4, w4, w3	// z_temp_51, pretmp_42, z_temp
// cordic_V_fixed_point_ternary.c:34:     *x = x_temp_1;
	str	w5, [x0]	// iftmp.0_46, *x_14(D)
// cordic_V_fixed_point_ternary.c:35:     *y = y_temp_1;
	str	w6, [x1]	// iftmp.1_47, *y_16(D)
// cordic_V_fixed_point_ternary.c:36:     *z = z_temp;
	str	w4, [x2]	// z_temp_51, *z_20(D)
// cordic_V_fixed_point_ternary.c:37: }
	ret	
	.p2align 2,,3
.L30:
// cordic_V_fixed_point_ternary.c:24:                      : x_temp_1 - (y_temp_1 >> i);
	sub	w5, w5, w8	// iftmp.0_46, iftmp.0_290, _30
// cordic_V_fixed_point_ternary.c:27:                      : y_temp_1 + (x_temp_1 >> i);
	add	w6, w6, w7	// iftmp.1_47, _41, iftmp.1_291
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	neg	w4, w4	// pretmp_42, pretmp_42
// cordic_V_fixed_point_ternary.c:28:         z_temp += y_is_positive ? z_table[i] : -z_table[i];
	add	w4, w4, w3	// z_temp_51, pretmp_42, z_temp
// cordic_V_fixed_point_ternary.c:34:     *x = x_temp_1;
	str	w5, [x0]	// iftmp.0_46, *x_14(D)
// cordic_V_fixed_point_ternary.c:35:     *y = y_temp_1;
	str	w6, [x1]	// iftmp.1_47, *y_16(D)
// cordic_V_fixed_point_ternary.c:36:     *z = z_temp;
	str	w4, [x2]	// z_temp_51, *z_20(D)
// cordic_V_fixed_point_ternary.c:37: }
	ret	
	.cfi_endproc
.LFE11:
	.size	cordic_V_fixed_point_ternary, .-cordic_V_fixed_point_ternary
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
