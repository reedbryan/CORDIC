	.arch armv8-a+crc
	.file	"cordic_V_fixed_point.c"
// GNU C17 (Debian 14.2.0-19) version 14.2.0 (aarch64-linux-gnu)
//	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

// warning: MPFR header version 4.2.1 differs from library version 4.2.2.
// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mcpu=cortex-a57 -mlittle-endian -mabi=lp64 -O2 -fasynchronous-unwind-tables
	.text
	.align	2
	.p2align 4,,15
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
.LFB11:
	.cfi_startproc
	adrp	x10, :got:z_table;ldr	x10, [x10, :got_lo12:z_table]	// tmp114,
// cordic_V_fixed_point.c:11:     y_temp_1 = *y;
	mov	x3, 0	// ivtmp.6,
// cordic_V_fixed_point.c:12:     z_temp = 0;
	mov	w6, 0	// z_temp,
// cordic_V_fixed_point.c:10:     x_temp_1 = *x;
	ldr	w5, [x0]	//, *x_15(D)
// cordic_V_fixed_point.c:11:     y_temp_1 = *y;
	ldr	w4, [x1]	//, *y_17(D)
	b	.L4		//
	.p2align 2,,3
.L8:
// cordic_V_fixed_point.c:13:     for( i=0; i<15; i++) { /* 15 iterations are needed */
	add	x3, x3, 1	// ivtmp.6, ivtmp.6,
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	add	w5, w5, w9	// x_temp_2, x_temp_2, _33
// cordic_V_fixed_point.c:13:     for( i=0; i<15; i++) { /* 15 iterations are needed */
	cmp	x3, 15	// ivtmp.6,
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	sub	w4, w4, w8	// y_temp_2, y_temp_2, _41
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	add	w6, w6, w7	// z_temp, z_temp, pretmp_42
// cordic_V_fixed_point.c:13:     for( i=0; i<15; i++) { /* 15 iterations are needed */
	beq	.L7		//,
.L4:
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	cmp	w4, 0	// y_temp_2,
// cordic_V_fixed_point.c:17:             z_temp += z_table[i];
	ldr	w7, [x10, x3, lsl 2]	//, MEM[(int *)&z_table + ivtmp.6_10 * 4]
// cordic_V_fixed_point.c:15:             x_temp_2 = x_temp_1 + (y_temp_1 >> i);
	asr	w9, w4, w3	// _33, y_temp_2, ivtmp.6
// cordic_V_fixed_point.c:16:             y_temp_2 = y_temp_1 - (x_temp_1 >> i);
	asr	w8, w5, w3	// _41, x_temp_2, ivtmp.6
// cordic_V_fixed_point.c:14:         if( y_temp_1 > 0) {
	bgt	.L8		//,
// cordic_V_fixed_point.c:13:     for( i=0; i<15; i++) { /* 15 iterations are needed */
	add	x3, x3, 1	// ivtmp.6, ivtmp.6,
// cordic_V_fixed_point.c:20:             x_temp_2 = x_temp_1 - (y_temp_1 >> i);
	sub	w5, w5, w9	// x_temp_2, x_temp_2, _33
// cordic_V_fixed_point.c:13:     for( i=0; i<15; i++) { /* 15 iterations are needed */
	cmp	x3, 15	// ivtmp.6,
// cordic_V_fixed_point.c:21:             y_temp_2 = y_temp_1 + (x_temp_1 >> i);
	add	w4, w4, w8	// y_temp_2, y_temp_2, _41
// cordic_V_fixed_point.c:22:             z_temp -= z_table[i];
	sub	w6, w6, w7	// z_temp, z_temp, pretmp_42
// cordic_V_fixed_point.c:13:     for( i=0; i<15; i++) { /* 15 iterations are needed */
	bne	.L4		//,
.L7:
// cordic_V_fixed_point.c:27:     *x = x_temp_1;
	str	w5, [x0]	// x_temp_2, *x_15(D)
// cordic_V_fixed_point.c:28:     *y = y_temp_1;
	str	w4, [x1]	// y_temp_2, *y_17(D)
// cordic_V_fixed_point.c:29:     *z = z_temp;
	str	w6, [x2]	// z_temp, *z_21(D)
// cordic_V_fixed_point.c:30: }
	ret	
	.cfi_endproc
.LFE11:
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
