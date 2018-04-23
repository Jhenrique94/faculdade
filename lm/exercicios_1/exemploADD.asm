;PRIMEIRO EXEMPLO DE ADD
;************************

	SECTION .text

	global _start

_start:
	mov	eax,10
	add	eax,10
	mov	ebx,eax

	mov	eax,10h
	;add	eax,10h
	mov	ebx,eax

	;mov	eax,0x10
	;add	eax,10
	;mov	ebx,eax

	mov	eax,1
	int	0x80
