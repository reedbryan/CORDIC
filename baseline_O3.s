	.arch armv8-a+crc
	.file	"cordic_V_fixed_point.c"
// GNU C17 (Debian 14.2.0-19) version 14.2.0 (aarch64-linux-gnu)
//	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

// warning: MPFR header version 4.2.1 differs from library version 4.2.2.
// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mcpu=cortex-a57 -mlittle-endian -mabi=lp64 -O3 -fasynchronous-unwind-tables
	.text
	.align	2
	.p2align 4,,15
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
.LFB11:
	.cfi_startproc
// cordic_V_fixed_point.c:11:     y_temp_1 = *y;
	ldr	w7, [x1]	//, *y_17(D)
// cordic_V_fixed_point.c:10:     x_temp_1 = *x;
	ldr	w8, [x0]	//, *x_15(D)
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	adrp	x5, :got:z_table;ldr	x5, [x5, :got_lo12:z_table]	// tmp207,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w7, 0	// y_temp_1,
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w8, w7	// x_temp_2, x_temp_1, y_temp_1
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w7, w8	// y_temp_2, y_temp_1, x_temp_1
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w6, [x5]	//, z_table[0]
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L3		//,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	neg	w6, w6	// pretmp_8, pretmp_8
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w8, w7	// x_temp_2, x_temp_1, y_temp_1
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w8, w7	// y_temp_2, x_temp_1, y_temp_1
.L3:
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 4]	//, z_table[1]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 1	// _68, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 1	// _24, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L33		//,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _24
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _68
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, pretmp_8, pretmp_71
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 8]	//, z_table[2]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 2	// _75, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 2	// _76, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L34		//,
.L6:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _76
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _75
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_77
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 12]	//, z_table[3]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 3	// _94, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 3	// _95, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L35		//,
.L8:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _95
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _94
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_96
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 16]	//, z_table[4]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 4	// _113, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 4	// _114, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L36		//,
.L10:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _114
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _113
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_115
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 20]	//, z_table[5]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 5	// _132, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 5	// _133, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L37		//,
.L12:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _133
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _132
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_134
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 24]	//, z_table[6]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 6	// _151, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 6	// _152, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L38		//,
.L14:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _152
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _151
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_153
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 28]	//, z_table[7]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 7	// _170, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 7	// _171, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L39		//,
.L16:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _171
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _170
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_172
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 32]	//, z_table[8]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 8	// _189, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 8	// _190, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L40		//,
.L18:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _190
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _189
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_191
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 36]	//, z_table[9]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 9	// _208, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 9	// _209, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L41		//,
.L20:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _209
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _208
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_210
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 40]	//, z_table[10]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 10	// _227, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 10	// _228, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L42		//,
.L22:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _228
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _227
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_229
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 44]	//, z_table[11]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 11	// _246, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 11	// _247, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L43		//,
.L24:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _247
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _246
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_248
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 48]	//, z_table[12]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 12	// _265, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 12	// _266, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L44		//,
.L26:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _266
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _265
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_267
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 52]	//, z_table[13]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 13	// _284, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 13	// _285, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L45		//,
.L28:
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w3, w3, w8	// y_temp_2, y_temp_2, _285
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w4, w9	// x_temp_2, x_temp_2, _284
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_286
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 56]	//, z_table[14]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w8, w3, 14	// _33, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w5, w4, 14	// _41, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	ble	.L30		//,
.L46:
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w4, w8, w4	// x_temp_2, _33, x_temp_2
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w5, w3, w5	// y_temp_2, y_temp_2, _41
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w3, w7, w6	// z_temp, pretmp_42, z_temp
// cordic_V_fixed_point.c:27:     *x = x_temp_1;
	str	w4, [x0]	// x_temp_2, *x_15(D)
// cordic_V_fixed_point.c:28:     *y = y_temp_1;
	str	w5, [x1]	// y_temp_2, *y_17(D)
// cordic_V_fixed_point.c:29:     *z = z_temp;
	str	w3, [x2]	// z_temp, *z_21(D)
// cordic_V_fixed_point.c:30: }
	ret	
	.p2align 2,,3
.L33:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w8, w3	// y_temp_2, _24, y_temp_2
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _68
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, pretmp_8, pretmp_71
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 8]	//, z_table[2]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 2	// _75, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 2	// _76, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L6		//,
.L34:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _76
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _75
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_77
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 12]	//, z_table[3]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 3	// _94, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 3	// _95, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L8		//,
.L35:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _95
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _94
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_96
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 16]	//, z_table[4]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 4	// _113, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 4	// _114, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L10		//,
.L36:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _114
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _113
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_115
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 20]	//, z_table[5]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 5	// _132, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 5	// _133, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L12		//,
.L37:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _133
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _132
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_134
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 24]	//, z_table[6]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 6	// _151, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 6	// _152, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L14		//,
.L38:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _152
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _151
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_153
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 28]	//, z_table[7]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 7	// _170, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 7	// _171, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L16		//,
.L39:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _171
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _170
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_172
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 32]	//, z_table[8]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 8	// _189, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 8	// _190, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L18		//,
.L40:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _190
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _189
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_191
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 36]	//, z_table[9]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 9	// _208, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 9	// _209, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L20		//,
.L41:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _209
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _208
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_210
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 40]	//, z_table[10]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 10	// _227, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 10	// _228, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L22		//,
.L42:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _228
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _227
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_229
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 44]	//, z_table[11]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 11	// _246, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 11	// _247, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L24		//,
.L43:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _247
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _246
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_248
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 48]	//, z_table[12]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 12	// _265, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 12	// _266, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L26		//,
.L44:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _266
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _265
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_267
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 52]	//, z_table[13]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w3, 13	// _284, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w4, 13	// _285, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L28		//,
.L45:
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w3, w3, w8	// y_temp_2, y_temp_2, _285
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w9	// x_temp_2, x_temp_2, _284
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w3, 0	// y_temp_2,
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_286
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x5, 56]	//, z_table[14]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w8, w3, 14	// _33, y_temp_2,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w5, w4, 14	// _41, x_temp_2,
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L46		//,
.L30:
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w4, w4, w8	// x_temp_2, x_temp_2, _33
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w5, w5, w3	// y_temp_2, _41, y_temp_2
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w3, w6, w7	// z_temp, z_temp, pretmp_42
// cordic_V_fixed_point.c:27:     *x = x_temp_1;
	str	w4, [x0]	// x_temp_2, *x_15(D)
// cordic_V_fixed_point.c:28:     *y = y_temp_1;
	str	w5, [x1]	// y_temp_2, *y_17(D)
// cordic_V_fixed_point.c:29:     *z = z_temp;
	str	w3, [x2]	// z_temp, *z_21(D)
// cordic_V_fixed_point.c:30: }
	ret	
	.cfi_endproc
.LFE11:
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
