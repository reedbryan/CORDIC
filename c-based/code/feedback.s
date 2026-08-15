	.arch armv8-a+crc
	.file	"cordic_V_fixed_point_with_feedback.c"
	.text
	.align	2
	.global	cordic_V_fixed_point_with_feedback
	.type	cordic_V_fixed_point_with_feedback, %function
cordic_V_fixed_point_with_feedback:
.LFB0:
	.cfi_startproc
	stp	x19, x20, [sp, -368]!
	.cfi_def_cfa_offset 368
	.cfi_offset 19, -368
	.cfi_offset 20, -360
	str	x21, [sp, 16]
	.cfi_offset 21, -352
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	ldr	x0, [sp, 56]
	ldr	w20, [x0]
	ldr	x0, [sp, 48]
	ldr	w19, [x0]
	mov	w21, 0
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 364]
	str	w19, [sp, 360]
	str	w20, [sp, 356]
	ldr	w0, [sp, 364]
	cmp	w0, 0
	beq	.L2
	ldr	w0, [sp, 360]
	add	w0, w20, w0
	b	.L3
.L2:
	ldr	w0, [sp, 360]
	sub	w0, w20, w0
.L3:
	str	w0, [sp, 352]
	ldr	w0, [sp, 364]
	cmp	w0, 0
	beq	.L4
	ldr	w0, [sp, 356]
	sub	w0, w19, w0
	b	.L5
.L4:
	ldr	w0, [sp, 356]
	add	w0, w19, w0
.L5:
	str	w0, [sp, 348]
	ldr	w0, [sp, 364]
	cmp	w0, 0
	beq	.L6
	mov	w0, 25735
	b	.L7
.L6:
	mov	w0, -25735
.L7:
	add	w21, w21, w0
	ldr	w20, [sp, 352]
	ldr	w19, [sp, 348]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 344]
	asr	w0, w19, 1
	str	w0, [sp, 340]
	asr	w0, w20, 1
	str	w0, [sp, 336]
	ldr	w0, [sp, 344]
	cmp	w0, 0
	beq	.L8
	ldr	w0, [sp, 340]
	add	w0, w20, w0
	b	.L9
.L8:
	ldr	w0, [sp, 340]
	sub	w0, w20, w0
.L9:
	str	w0, [sp, 332]
	ldr	w0, [sp, 344]
	cmp	w0, 0
	beq	.L10
	ldr	w0, [sp, 336]
	sub	w0, w19, w0
	b	.L11
.L10:
	ldr	w0, [sp, 336]
	add	w0, w19, w0
.L11:
	str	w0, [sp, 328]
	ldr	w0, [sp, 344]
	cmp	w0, 0
	beq	.L12
	mov	w0, 15192
	b	.L13
.L12:
	mov	w0, -15192
.L13:
	add	w21, w21, w0
	ldr	w20, [sp, 332]
	ldr	w19, [sp, 328]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 324]
	asr	w0, w19, 2
	str	w0, [sp, 320]
	asr	w0, w20, 2
	str	w0, [sp, 316]
	ldr	w0, [sp, 324]
	cmp	w0, 0
	beq	.L14
	ldr	w0, [sp, 320]
	add	w0, w20, w0
	b	.L15
.L14:
	ldr	w0, [sp, 320]
	sub	w0, w20, w0
.L15:
	str	w0, [sp, 312]
	ldr	w0, [sp, 324]
	cmp	w0, 0
	beq	.L16
	ldr	w0, [sp, 316]
	sub	w0, w19, w0
	b	.L17
.L16:
	ldr	w0, [sp, 316]
	add	w0, w19, w0
.L17:
	str	w0, [sp, 308]
	ldr	w0, [sp, 324]
	cmp	w0, 0
	beq	.L18
	mov	w0, 8027
	b	.L19
.L18:
	mov	w0, -8027
.L19:
	add	w21, w21, w0
	ldr	w20, [sp, 312]
	ldr	w19, [sp, 308]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 304]
	asr	w0, w19, 3
	str	w0, [sp, 300]
	asr	w0, w20, 3
	str	w0, [sp, 296]
	ldr	w0, [sp, 304]
	cmp	w0, 0
	beq	.L20
	ldr	w0, [sp, 300]
	add	w0, w20, w0
	b	.L21
.L20:
	ldr	w0, [sp, 300]
	sub	w0, w20, w0
.L21:
	str	w0, [sp, 292]
	ldr	w0, [sp, 304]
	cmp	w0, 0
	beq	.L22
	ldr	w0, [sp, 296]
	sub	w0, w19, w0
	b	.L23
.L22:
	ldr	w0, [sp, 296]
	add	w0, w19, w0
.L23:
	str	w0, [sp, 288]
	ldr	w0, [sp, 304]
	cmp	w0, 0
	beq	.L24
	mov	w0, 4074
	b	.L25
.L24:
	mov	w0, -4074
.L25:
	add	w21, w21, w0
	ldr	w20, [sp, 292]
	ldr	w19, [sp, 288]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 284]
	asr	w0, w19, 4
	str	w0, [sp, 280]
	asr	w0, w20, 4
	str	w0, [sp, 276]
	ldr	w0, [sp, 284]
	cmp	w0, 0
	beq	.L26
	ldr	w0, [sp, 280]
	add	w0, w20, w0
	b	.L27
.L26:
	ldr	w0, [sp, 280]
	sub	w0, w20, w0
.L27:
	str	w0, [sp, 272]
	ldr	w0, [sp, 284]
	cmp	w0, 0
	beq	.L28
	ldr	w0, [sp, 276]
	sub	w0, w19, w0
	b	.L29
.L28:
	ldr	w0, [sp, 276]
	add	w0, w19, w0
.L29:
	str	w0, [sp, 268]
	ldr	w0, [sp, 284]
	cmp	w0, 0
	beq	.L30
	mov	w0, 2045
	b	.L31
.L30:
	mov	w0, -2045
.L31:
	add	w21, w21, w0
	ldr	w20, [sp, 272]
	ldr	w19, [sp, 268]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 264]
	asr	w0, w19, 5
	str	w0, [sp, 260]
	asr	w0, w20, 5
	str	w0, [sp, 256]
	ldr	w0, [sp, 264]
	cmp	w0, 0
	beq	.L32
	ldr	w0, [sp, 260]
	add	w0, w20, w0
	b	.L33
.L32:
	ldr	w0, [sp, 260]
	sub	w0, w20, w0
.L33:
	str	w0, [sp, 252]
	ldr	w0, [sp, 264]
	cmp	w0, 0
	beq	.L34
	ldr	w0, [sp, 256]
	sub	w0, w19, w0
	b	.L35
.L34:
	ldr	w0, [sp, 256]
	add	w0, w19, w0
.L35:
	str	w0, [sp, 248]
	ldr	w0, [sp, 264]
	cmp	w0, 0
	beq	.L36
	mov	w0, 1023
	b	.L37
.L36:
	mov	w0, -1023
.L37:
	add	w21, w21, w0
	ldr	w20, [sp, 252]
	ldr	w19, [sp, 248]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 244]
	asr	w0, w19, 6
	str	w0, [sp, 240]
	asr	w0, w20, 6
	str	w0, [sp, 236]
	ldr	w0, [sp, 244]
	cmp	w0, 0
	beq	.L38
	ldr	w0, [sp, 240]
	add	w0, w20, w0
	b	.L39
.L38:
	ldr	w0, [sp, 240]
	sub	w0, w20, w0
.L39:
	str	w0, [sp, 232]
	ldr	w0, [sp, 244]
	cmp	w0, 0
	beq	.L40
	ldr	w0, [sp, 236]
	sub	w0, w19, w0
	b	.L41
.L40:
	ldr	w0, [sp, 236]
	add	w0, w19, w0
.L41:
	str	w0, [sp, 228]
	ldr	w0, [sp, 244]
	cmp	w0, 0
	beq	.L42
	mov	w0, 511
	b	.L43
.L42:
	mov	w0, -511
.L43:
	add	w21, w21, w0
	ldr	w20, [sp, 232]
	ldr	w19, [sp, 228]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 224]
	asr	w0, w19, 7
	str	w0, [sp, 220]
	asr	w0, w20, 7
	str	w0, [sp, 216]
	ldr	w0, [sp, 224]
	cmp	w0, 0
	beq	.L44
	ldr	w0, [sp, 220]
	add	w0, w20, w0
	b	.L45
.L44:
	ldr	w0, [sp, 220]
	sub	w0, w20, w0
.L45:
	str	w0, [sp, 212]
	ldr	w0, [sp, 224]
	cmp	w0, 0
	beq	.L46
	ldr	w0, [sp, 216]
	sub	w0, w19, w0
	b	.L47
.L46:
	ldr	w0, [sp, 216]
	add	w0, w19, w0
.L47:
	str	w0, [sp, 208]
	ldr	w0, [sp, 224]
	cmp	w0, 0
	beq	.L48
	mov	w0, 255
	b	.L49
.L48:
	mov	w0, -255
.L49:
	add	w21, w21, w0
	ldr	w20, [sp, 212]
	ldr	w19, [sp, 208]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 204]
	asr	w0, w19, 8
	str	w0, [sp, 200]
	asr	w0, w20, 8
	str	w0, [sp, 196]
	ldr	w0, [sp, 204]
	cmp	w0, 0
	beq	.L50
	ldr	w0, [sp, 200]
	add	w0, w20, w0
	b	.L51
.L50:
	ldr	w0, [sp, 200]
	sub	w0, w20, w0
.L51:
	str	w0, [sp, 192]
	ldr	w0, [sp, 204]
	cmp	w0, 0
	beq	.L52
	ldr	w0, [sp, 196]
	sub	w0, w19, w0
	b	.L53
.L52:
	ldr	w0, [sp, 196]
	add	w0, w19, w0
.L53:
	str	w0, [sp, 188]
	ldr	w0, [sp, 204]
	cmp	w0, 0
	beq	.L54
	mov	w0, 127
	b	.L55
.L54:
	mov	w0, -127
.L55:
	add	w21, w21, w0
	ldr	w20, [sp, 192]
	ldr	w19, [sp, 188]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 184]
	asr	w0, w19, 9
	str	w0, [sp, 180]
	asr	w0, w20, 9
	str	w0, [sp, 176]
	ldr	w0, [sp, 184]
	cmp	w0, 0
	beq	.L56
	ldr	w0, [sp, 180]
	add	w0, w20, w0
	b	.L57
.L56:
	ldr	w0, [sp, 180]
	sub	w0, w20, w0
.L57:
	str	w0, [sp, 172]
	ldr	w0, [sp, 184]
	cmp	w0, 0
	beq	.L58
	ldr	w0, [sp, 176]
	sub	w0, w19, w0
	b	.L59
.L58:
	ldr	w0, [sp, 176]
	add	w0, w19, w0
.L59:
	str	w0, [sp, 168]
	ldr	w0, [sp, 184]
	cmp	w0, 0
	beq	.L60
	mov	w0, 63
	b	.L61
.L60:
	mov	w0, -63
.L61:
	add	w21, w21, w0
	ldr	w20, [sp, 172]
	ldr	w19, [sp, 168]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 164]
	asr	w0, w19, 10
	str	w0, [sp, 160]
	asr	w0, w20, 10
	str	w0, [sp, 156]
	ldr	w0, [sp, 164]
	cmp	w0, 0
	beq	.L62
	ldr	w0, [sp, 160]
	add	w0, w20, w0
	b	.L63
.L62:
	ldr	w0, [sp, 160]
	sub	w0, w20, w0
.L63:
	str	w0, [sp, 152]
	ldr	w0, [sp, 164]
	cmp	w0, 0
	beq	.L64
	ldr	w0, [sp, 156]
	sub	w0, w19, w0
	b	.L65
.L64:
	ldr	w0, [sp, 156]
	add	w0, w19, w0
.L65:
	str	w0, [sp, 148]
	ldr	w0, [sp, 164]
	cmp	w0, 0
	beq	.L66
	mov	w0, 31
	b	.L67
.L66:
	mov	w0, -31
.L67:
	add	w21, w21, w0
	ldr	w20, [sp, 152]
	ldr	w19, [sp, 148]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 144]
	asr	w0, w19, 11
	str	w0, [sp, 140]
	asr	w0, w20, 11
	str	w0, [sp, 136]
	ldr	w0, [sp, 144]
	cmp	w0, 0
	beq	.L68
	ldr	w0, [sp, 140]
	add	w0, w20, w0
	b	.L69
.L68:
	ldr	w0, [sp, 140]
	sub	w0, w20, w0
.L69:
	str	w0, [sp, 132]
	ldr	w0, [sp, 144]
	cmp	w0, 0
	beq	.L70
	ldr	w0, [sp, 136]
	sub	w0, w19, w0
	b	.L71
.L70:
	ldr	w0, [sp, 136]
	add	w0, w19, w0
.L71:
	str	w0, [sp, 128]
	ldr	w0, [sp, 144]
	cmp	w0, 0
	beq	.L72
	mov	w0, 15
	b	.L73
.L72:
	mov	w0, -15
.L73:
	add	w21, w21, w0
	ldr	w20, [sp, 132]
	ldr	w19, [sp, 128]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 124]
	asr	w0, w19, 12
	str	w0, [sp, 120]
	asr	w0, w20, 12
	str	w0, [sp, 116]
	ldr	w0, [sp, 124]
	cmp	w0, 0
	beq	.L74
	ldr	w0, [sp, 120]
	add	w0, w20, w0
	b	.L75
.L74:
	ldr	w0, [sp, 120]
	sub	w0, w20, w0
.L75:
	str	w0, [sp, 112]
	ldr	w0, [sp, 124]
	cmp	w0, 0
	beq	.L76
	ldr	w0, [sp, 116]
	sub	w0, w19, w0
	b	.L77
.L76:
	ldr	w0, [sp, 116]
	add	w0, w19, w0
.L77:
	str	w0, [sp, 108]
	ldr	w0, [sp, 124]
	cmp	w0, 0
	beq	.L78
	mov	w0, 7
	b	.L79
.L78:
	mov	w0, -7
.L79:
	add	w21, w21, w0
	ldr	w20, [sp, 112]
	ldr	w19, [sp, 108]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 104]
	asr	w0, w19, 13
	str	w0, [sp, 100]
	asr	w0, w20, 13
	str	w0, [sp, 96]
	ldr	w0, [sp, 104]
	cmp	w0, 0
	beq	.L80
	ldr	w0, [sp, 100]
	add	w0, w20, w0
	b	.L81
.L80:
	ldr	w0, [sp, 100]
	sub	w0, w20, w0
.L81:
	str	w0, [sp, 92]
	ldr	w0, [sp, 104]
	cmp	w0, 0
	beq	.L82
	ldr	w0, [sp, 96]
	sub	w0, w19, w0
	b	.L83
.L82:
	ldr	w0, [sp, 96]
	add	w0, w19, w0
.L83:
	str	w0, [sp, 88]
	ldr	w0, [sp, 104]
	cmp	w0, 0
	beq	.L84
	mov	w0, 3
	b	.L85
.L84:
	mov	w0, -3
.L85:
	add	w21, w21, w0
	ldr	w20, [sp, 92]
	ldr	w19, [sp, 88]
	cmp	w19, 0
	cset	w0, gt
	and	w0, w0, 255
	str	w0, [sp, 84]
	asr	w0, w19, 14
	str	w0, [sp, 80]
	asr	w0, w20, 14
	str	w0, [sp, 76]
	ldr	w0, [sp, 84]
	cmp	w0, 0
	beq	.L86
	ldr	w0, [sp, 80]
	add	w0, w20, w0
	b	.L87
.L86:
	ldr	w0, [sp, 80]
	sub	w0, w20, w0
.L87:
	str	w0, [sp, 72]
	ldr	w0, [sp, 84]
	cmp	w0, 0
	beq	.L88
	ldr	w0, [sp, 76]
	sub	w0, w19, w0
	b	.L89
.L88:
	ldr	w0, [sp, 76]
	add	w0, w19, w0
.L89:
	str	w0, [sp, 68]
	ldr	w0, [sp, 84]
	cmp	w0, 0
	beq	.L90
	mov	w0, 1
	b	.L91
.L90:
	mov	w0, -1
.L91:
	add	w21, w21, w0
	ldr	w20, [sp, 72]
	ldr	w19, [sp, 68]
	ldr	x0, [sp, 56]
	str	w20, [x0]
	ldr	x0, [sp, 48]
	str	w19, [x0]
	ldr	x0, [sp, 40]
	str	w21, [x0]
	nop
	ldr	x21, [sp, 16]
	ldp	x19, x20, [sp], 368
	.cfi_restore 20
	.cfi_restore 19
	.cfi_restore 21
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	cordic_V_fixed_point_with_feedback, .-cordic_V_fixed_point_with_feedback
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
