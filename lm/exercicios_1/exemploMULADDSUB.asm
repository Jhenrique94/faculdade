	SECTION .data

A:	db	10
B:	db	8
D:	db	1
E:	db	3
F:	db	2

	SECTION .text

	global _start
	_start:

	mov	al,[D]
	mov	bl,[B]
	mul	bl
	mov	dx,ax

	mov	al,[A]
	mov	bl,[E]
	mul	bl

	add	ax,[F]
	sub	ax,dx
	mov	ebx,eax

	mov eax,1
	int 0x80
