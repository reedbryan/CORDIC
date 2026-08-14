	.arch armv8-a+crc
	.file	"cordic_V_fixed_point_optimal.c"
	.text
	.align	2
	.p2align 4,,15
	.global	cordic_V_fixed_point_optimal
	.type	cordic_V_fixed_point_optimal, %function
cordic_V_fixed_point_optimal:
.LFB0:
	.cfi_startproc
	ldr	w3, [x1]
	ldr	w4, [x0]
	cmp	w3, 0
	ble	.L33
	add	w6, w4, w3
	sub	w3, w3, w4
	cmp	w3, 0
	mov	w5, 25735
	asr	w4, w3, 1
	asr	w7, w6, 1
	ble	.L34
.L4:
	sub	w3, w3, w7
	add	w4, w4, w6
	cmp	w3, 0
	mov	w6, 15192
	add	w5, w5, w6
	asr	w7, w3, 2
	asr	w6, w4, 2
	ble	.L35
.L6:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 8027
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 3
	asr	w6, w4, 3
	ble	.L36
.L8:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 4074
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 4
	asr	w6, w4, 4
	ble	.L37
.L10:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 2045
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 5
	asr	w6, w4, 5
	ble	.L38
.L12:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 1023
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 6
	asr	w6, w4, 6
	ble	.L39
.L14:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 511
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 7
	asr	w6, w4, 7
	ble	.L40
.L16:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 255
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 8
	asr	w6, w4, 8
	ble	.L41
.L18:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 127
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 9
	asr	w6, w4, 9
	ble	.L42
.L20:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 63
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 10
	asr	w6, w4, 10
	ble	.L43
.L22:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 31
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 11
	asr	w6, w4, 11
	ble	.L44
.L24:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 15
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 12
	asr	w6, w4, 12
	ble	.L45
.L26:
	sub	w3, w3, w6
	add	w4, w4, w7
	mov	w6, 7
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 13
	asr	w6, w4, 13
	ble	.L28
.L46:
	sub	w3, w3, w6
	add	w4, w7, w4
	mov	w6, 3
	cmp	w3, 0
	add	w6, w6, w5
	asr	w7, w3, 14
	asr	w5, w4, 14
	ble	.L30
.L47:
	add	w4, w7, w4
	sub	w5, w3, w5
	mov	w3, 1
	add	w3, w3, w6
	str	w4, [x0]
	str	w5, [x1]
	str	w3, [x2]
	ret
	.p2align 2,,3
.L33:
	sub	w6, w4, w3
	add	w3, w4, w3
	cmp	w3, 0
	mov	w5, -25735
	asr	w4, w3, 1
	asr	w7, w6, 1
	bgt	.L4
.L34:
	add	w3, w7, w3
	sub	w4, w6, w4
	cmp	w3, 0
	mov	w6, -15192
	add	w5, w5, w6
	asr	w7, w3, 2
	asr	w6, w4, 2
	bgt	.L6
.L35:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -8027
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 3
	asr	w6, w4, 3
	bgt	.L8
.L36:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -4074
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 4
	asr	w6, w4, 4
	bgt	.L10
.L37:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -2045
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 5
	asr	w6, w4, 5
	bgt	.L12
.L38:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -1023
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 6
	asr	w6, w4, 6
	bgt	.L14
.L39:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -511
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 7
	asr	w6, w4, 7
	bgt	.L16
.L40:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -255
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 8
	asr	w6, w4, 8
	bgt	.L18
.L41:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -127
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 9
	asr	w6, w4, 9
	bgt	.L20
.L42:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -63
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 10
	asr	w6, w4, 10
	bgt	.L22
.L43:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -31
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 11
	asr	w6, w4, 11
	bgt	.L24
.L44:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -15
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 12
	asr	w6, w4, 12
	bgt	.L26
.L45:
	add	w3, w3, w6
	sub	w4, w4, w7
	mov	w6, -7
	cmp	w3, 0
	add	w5, w5, w6
	asr	w7, w3, 13
	asr	w6, w4, 13
	bgt	.L46
.L28:
	add	w3, w6, w3
	sub	w4, w4, w7
	mov	w6, -3
	cmp	w3, 0
	add	w6, w6, w5
	asr	w7, w3, 14
	asr	w5, w4, 14
	bgt	.L47
.L30:
	sub	w4, w4, w7
	add	w5, w5, w3
	mov	w3, -1
	add	w3, w3, w6
	str	w4, [x0]
	str	w5, [x1]
	str	w3, [x2]
	ret
	.cfi_endproc
.LFE0:
	.size	cordic_V_fixed_point_optimal, .-cordic_V_fixed_point_optimal
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
