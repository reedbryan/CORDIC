	.arch armv8-a+crc
	.file	"cordic_V_fixed_point.c"
	.text
	.align	2
	.p2align 4,,15
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
.LFB3:
	.cfi_startproc
	ldr	w7, [x1]
	ldr	w8, [x0]
	adrp	x5, :got:z_table;ldr	x5, [x5, :got_lo12:z_table]
	cmp	w7, 0
	add	w4, w8, w7
	sub	w3, w7, w8
	ldr	w6, [x5]
	bgt	.L3
	neg	w6, w6
	sub	w4, w8, w7
	add	w3, w8, w7
.L3:
	cmp	w3, 0
	ldr	w7, [x5, 4]
	asr	w9, w3, 1
	asr	w8, w4, 1
	ble	.L33
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 8]
	asr	w9, w3, 2
	asr	w8, w4, 2
	ble	.L34
.L6:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 12]
	asr	w9, w3, 3
	asr	w8, w4, 3
	ble	.L35
.L8:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 16]
	asr	w9, w3, 4
	asr	w8, w4, 4
	ble	.L36
.L10:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 20]
	asr	w9, w3, 5
	asr	w8, w4, 5
	ble	.L37
.L12:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 24]
	asr	w9, w3, 6
	asr	w8, w4, 6
	ble	.L38
.L14:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 28]
	asr	w9, w3, 7
	asr	w8, w4, 7
	ble	.L39
.L16:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 32]
	asr	w9, w3, 8
	asr	w8, w4, 8
	ble	.L40
.L18:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 36]
	asr	w9, w3, 9
	asr	w8, w4, 9
	ble	.L41
.L20:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 40]
	asr	w9, w3, 10
	asr	w8, w4, 10
	ble	.L42
.L22:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 44]
	asr	w9, w3, 11
	asr	w8, w4, 11
	ble	.L43
.L24:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 48]
	asr	w9, w3, 12
	asr	w8, w4, 12
	ble	.L44
.L26:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 52]
	asr	w9, w3, 13
	asr	w8, w4, 13
	ble	.L45
.L28:
	sub	w3, w3, w8
	add	w4, w4, w9
	cmp	w3, 0
	add	w6, w6, w7
	ldr	w7, [x5, 56]
	asr	w8, w3, 14
	asr	w5, w4, 14
	ble	.L30
.L46:
	add	w4, w8, w4
	sub	w5, w3, w5
	add	w3, w7, w6
	str	w4, [x0]
	str	w5, [x1]
	str	w3, [x2]
	ret
	.p2align 2,,3
.L33:
	add	w3, w8, w3
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 8]
	asr	w9, w3, 2
	asr	w8, w4, 2
	bgt	.L6
.L34:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 12]
	asr	w9, w3, 3
	asr	w8, w4, 3
	bgt	.L8
.L35:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 16]
	asr	w9, w3, 4
	asr	w8, w4, 4
	bgt	.L10
.L36:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 20]
	asr	w9, w3, 5
	asr	w8, w4, 5
	bgt	.L12
.L37:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 24]
	asr	w9, w3, 6
	asr	w8, w4, 6
	bgt	.L14
.L38:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 28]
	asr	w9, w3, 7
	asr	w8, w4, 7
	bgt	.L16
.L39:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 32]
	asr	w9, w3, 8
	asr	w8, w4, 8
	bgt	.L18
.L40:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 36]
	asr	w9, w3, 9
	asr	w8, w4, 9
	bgt	.L20
.L41:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 40]
	asr	w9, w3, 10
	asr	w8, w4, 10
	bgt	.L22
.L42:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 44]
	asr	w9, w3, 11
	asr	w8, w4, 11
	bgt	.L24
.L43:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 48]
	asr	w9, w3, 12
	asr	w8, w4, 12
	bgt	.L26
.L44:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 52]
	asr	w9, w3, 13
	asr	w8, w4, 13
	bgt	.L28
.L45:
	add	w3, w3, w8
	sub	w4, w4, w9
	cmp	w3, 0
	sub	w6, w6, w7
	ldr	w7, [x5, 56]
	asr	w8, w3, 14
	asr	w5, w4, 14
	bgt	.L46
.L30:
	sub	w4, w4, w8
	add	w5, w5, w3
	sub	w3, w6, w7
	str	w4, [x0]
	str	w5, [x1]
	str	w3, [x2]
	ret
	.cfi_endproc
.LFE3:
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
