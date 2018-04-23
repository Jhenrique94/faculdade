	SECTION .data

A:	db	10
B:	db	8
D:	db	1
E:	db	3
F:	db	2

	SECTION .text
	global _start
	_start:

	mov	al,[A]
	sub	al,[B]
	mov	bl,[D]
	add	bl,[E]
	mul	bl
	mov	bx,[F]
	sub	ax,bx

	mov	ebx,eax
	mov	eax,1
	int	0x80

