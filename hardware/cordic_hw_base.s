	.arch armv8-a
	.file	"cordic_inline_assm.c"
	.text
	.align	2
	.type	cordic_v_hw, %function
cordic_v_hw:
	sub	sp, sp, #48
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	str	x2, [sp, 16]
	str	x3, [sp, 8]
	ldr	w0, [sp, 28]
	mov	x1, 1073741824
	// Start of user assembly
// 25 "cordic_inline_assm.c" 1
	str w0, [w1]
// 0 "" 2
	// End of user assembly
	ldr	w0, [sp, 24]
	mov	x1, 4
	movk	x1, 0x4000, lsl 16
	// Start of user assembly
// 34 "cordic_inline_assm.c" 1
	str w0, [w1]
// 0 "" 2
	// End of user assembly
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	mov	x1, 8
	movk	x1, 0x4000, lsl 16
	// Start of user assembly
// 46 "cordic_inline_assm.c" 1
	str w0, [w1]
// 0 "" 2
	// End of user assembly
.L2:
	mov	x0, 12
	movk	x0, 0x4000, lsl 16
	// Start of user assembly
// 57 "cordic_inline_assm.c" 1
	ldr w0, [w0]
// 0 "" 2
	// End of user assembly
	str	w0, [sp, 40]
	ldr	w0, [sp, 40]
	cmp	w0, 0
	beq	.L2
	mov	x0, 16
	movk	x0, 0x4000, lsl 16
	// Start of user assembly
// 67 "cordic_inline_assm.c" 1
	ldr w0, [w0]
// 0 "" 2
	// End of user assembly
	str	w0, [sp, 36]
	mov	x0, 20
	movk	x0, 0x4000, lsl 16
	// Start of user assembly
// 76 "cordic_inline_assm.c" 1
	ldr w0, [w0]
// 0 "" 2
	// End of user assembly
	str	w0, [sp, 32]
	ldr	x0, [sp, 16]
	ldr	w1, [sp, 36]
	str	w1, [x0]
	ldr	x0, [sp, 8]
	ldr	w1, [sp, 32]
	str	w1, [x0]
	nop
	add	sp, sp, 48
	ret
	.size	cordic_v_hw, .-cordic_v_hw
	.section	.rodata
	.align	3
.LC0:
	.string	"This vectoring implementation requires x > 0.\n"
	.align	3
.LC1:
	.string	"angle = %d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	mov	w0, 27852
	str	w0, [sp, 28]
	mov	w0, 24903
	str	w0, [sp, 24]
	ldr	w0, [sp, 28]
	cmp	w0, 0
	bgt	.L4
	adrp	x0, _impure_ptr
	add	x0, x0, :lo12:_impure_ptr
	ldr	x0, [x0]
	ldr	x0, [x0, 24]
	mov	x3, x0
	mov	x2, 46
	mov	x1, 1
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	fwrite
	mov	w0, 1
	b	.L6
.L4:
	add	x1, sp, 16
	add	x0, sp, 20
	mov	x3, x1
	mov	x2, x0
	ldr	w1, [sp, 24]
	ldr	w0, [sp, 28]
	bl	cordic_v_hw
	ldr	w0, [sp, 16]
	mov	w1, w0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	mov	w0, 0
.L6:
	ldp	x29, x30, [sp], 32
	ret
	.size	main, .-main
	.ident	"GCC: (Arm GNU Toolchain 15.3.Rel1 (Build arm-15.149)) 15.3.1 20260627"
