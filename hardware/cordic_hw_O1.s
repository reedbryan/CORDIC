	.arch armv8-a
	.file	"cordic_inline_assm.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"angle = %d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x0, 1073741824
	mov	w1, 27852
	// Start of user assembly
// 25 "cordic_inline_assm.c" 1
	str w1, [w0]
// 0 "" 2
	// End of user assembly
	add	x0, x0, 4
	mov	w1, 24903
	// Start of user assembly
// 34 "cordic_inline_assm.c" 1
	str w1, [w0]
// 0 "" 2
	// End of user assembly
	add	x0, x0, 4
	mov	w1, 1
	// Start of user assembly
// 46 "cordic_inline_assm.c" 1
	str w1, [w0]
// 0 "" 2
	// End of user assembly
	mov	x1, 12
	movk	x1, 0x4000, lsl 16
.L2:
	// Start of user assembly
// 57 "cordic_inline_assm.c" 1
	ldr w0, [w1]
// 0 "" 2
	// End of user assembly
	cbz	w0, .L2
	mov	x0, 16
	movk	x0, 0x4000, lsl 16
	// Start of user assembly
// 67 "cordic_inline_assm.c" 1
	ldr w1, [w0]
// 0 "" 2
	// End of user assembly
	add	x0, x0, 4
	// Start of user assembly
// 76 "cordic_inline_assm.c" 1
	ldr w1, [w0]
// 0 "" 2
	// End of user assembly
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	main, .-main
	.ident	"GCC: (Arm GNU Toolchain 15.3.Rel1 (Build arm-15.149)) 15.3.1 20260627"
