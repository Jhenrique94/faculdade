	SECTION .data
	
; X = A + (B * C) - (D * F) + G - H

A:	db	1
B:	db	2
C:	db	3
D:	db	4
E:	db	5
F:	db	6
G:	db	7
H:	db	8

	SECTION .text

	global _start
	_start:
	
	mov	al,[B]
	mov	bl,[C]
	mul	bl
	mov	dx,ax
	mov	ebx,eax

	mov eax,1
	int 0x80
