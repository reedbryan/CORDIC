	.arch armv8-a+crc
	.file	"cordic_V_fixed_point_ternary.c"
	.text
	.align	2
	.p2align 4,,15
	.global	cordic_V_fixed_point_ternary
	.type	cordic_V_fixed_point_ternary, %function
cordic_V_fixed_point_ternary:
.LFB3:
	.cfi_startproc
	ldr	w5, [x1]
	ldr	w7, [x0]
	adrp	x4, :got:z_table;ldr	x4, [x4, :got_lo12:z_table]
	cmp	w5, 0
	add	w8, w7, w5
	sub	w6, w5, w7
	ldr	w3, [x4]
	bgt	.L3
	neg	w3, w3
	sub	w8, w7, w5
	add	w6, w7, w5
.L3:
	asr	w11, w6, 1
	asr	w10, w8, 1
	ldr	w9, [x4, 4]
	cmp	w6, 0
	add	w7, w11, w8
	sub	w5, w6, w10
	bgt	.L5
	sub	w7, w8, w11
	add	w5, w10, w6
	neg	w9, w9
.L5:
	asr	w12, w5, 2
	asr	w11, w7, 2
	ldr	w10, [x4, 8]
	cmp	w5, 0
	add	w3, w3, w9
	add	w8, w7, w12
	sub	w6, w5, w11
	bgt	.L7
	sub	w8, w7, w12
	add	w6, w5, w11
	neg	w10, w10
.L7:
	asr	w12, w6, 3
	asr	w11, w8, 3
	ldr	w9, [x4, 12]
	cmp	w6, 0
	add	w3, w3, w10
	add	w7, w8, w12
	sub	w5, w6, w11
	bgt	.L9
	sub	w7, w8, w12
	add	w5, w6, w11
	neg	w9, w9
.L9:
	asr	w12, w5, 4
	asr	w11, w7, 4
	ldr	w10, [x4, 16]
	cmp	w5, 0
	add	w3, w3, w9
	add	w8, w7, w12
	sub	w6, w5, w11
	bgt	.L11
	sub	w8, w7, w12
	add	w6, w5, w11
	neg	w10, w10
.L11:
	asr	w12, w6, 5
	asr	w11, w8, 5
	ldr	w9, [x4, 20]
	cmp	w6, 0
	add	w3, w3, w10
	add	w7, w8, w12
	sub	w5, w6, w11
	bgt	.L13
	sub	w7, w8, w12
	add	w5, w6, w11
	neg	w9, w9
.L13:
	asr	w12, w5, 6
	asr	w11, w7, 6
	ldr	w10, [x4, 24]
	cmp	w5, 0
	add	w3, w3, w9
	add	w8, w7, w12
	sub	w6, w5, w11
	bgt	.L15
	sub	w8, w7, w12
	add	w6, w5, w11
	neg	w10, w10
.L15:
	asr	w12, w6, 7
	asr	w11, w8, 7
	ldr	w9, [x4, 28]
	cmp	w6, 0
	add	w3, w3, w10
	add	w7, w8, w12
	sub	w5, w6, w11
	bgt	.L17
	sub	w7, w8, w12
	add	w5, w6, w11
	neg	w9, w9
.L17:
	asr	w12, w5, 8
	asr	w11, w7, 8
	ldr	w10, [x4, 32]
	cmp	w5, 0
	add	w3, w3, w9
	add	w8, w7, w12
	sub	w6, w5, w11
	bgt	.L19
	sub	w8, w7, w12
	add	w6, w5, w11
	neg	w10, w10
.L19:
	asr	w12, w6, 9
	asr	w11, w8, 9
	ldr	w9, [x4, 36]
	cmp	w6, 0
	add	w3, w3, w10
	add	w7, w8, w12
	sub	w5, w6, w11
	bgt	.L21
	sub	w7, w8, w12
	add	w5, w6, w11
	neg	w9, w9
.L21:
	asr	w12, w5, 10
	asr	w11, w7, 10
	ldr	w10, [x4, 40]
	cmp	w5, 0
	add	w3, w3, w9
	add	w8, w7, w12
	sub	w6, w5, w11
	bgt	.L23
	sub	w8, w7, w12
	add	w6, w5, w11
	neg	w10, w10
.L23:
	asr	w12, w6, 11
	asr	w11, w8, 11
	ldr	w9, [x4, 44]
	cmp	w6, 0
	add	w3, w3, w10
	add	w7, w8, w12
	sub	w5, w6, w11
	bgt	.L25
	sub	w7, w8, w12
	add	w5, w6, w11
	neg	w9, w9
.L25:
	asr	w12, w5, 12
	asr	w11, w7, 12
	ldr	w10, [x4, 48]
	cmp	w5, 0
	add	w3, w3, w9
	add	w8, w7, w12
	sub	w6, w5, w11
	bgt	.L27
	sub	w8, w7, w12
	add	w6, w5, w11
	neg	w10, w10
.L27:
	asr	w12, w6, 13
	asr	w11, w8, 13
	ldr	w9, [x4, 52]
	cmp	w6, 0
	add	w3, w3, w10
	add	w5, w8, w12
	sub	w7, w6, w11
	bgt	.L29
	sub	w5, w8, w12
	add	w7, w6, w11
	neg	w9, w9
.L29:
	cmp	w7, 0
	ldr	w4, [x4, 56]
	add	w3, w3, w9
	asr	w8, w7, 14
	asr	w6, w5, 14
	ble	.L30
	add	w5, w8, w5
	sub	w6, w7, w6
	add	w4, w4, w3
	str	w5, [x0]
	str	w6, [x1]
	str	w4, [x2]
	ret
	.p2align 2,,3
.L30:
	sub	w5, w5, w8
	add	w6, w6, w7
	neg	w4, w4
	add	w4, w4, w3
	str	w5, [x0]
	str	w6, [x1]
	str	w4, [x2]
	ret
	.cfi_endproc
.LFE3:
	.size	cordic_V_fixed_point_ternary, .-cordic_V_fixed_point_ternary
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
