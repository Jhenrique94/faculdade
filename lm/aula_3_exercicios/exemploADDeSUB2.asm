;EXEMPLO SUB e AND
	
	SECTION .data
var1:	db	7Fh
var2:	db	40h

	SECTION .text

	global _start
	_start:

	;xor	eax,ebx
	;mov	eax,[var1]
	;sub	eax,[var2]

	;xor	eax,ebx
	mov	eax,[var1]
	and	eax,[var2]
	dec	eax
	;inc	eax

	mov	ebx,eax
	mov	eax,1
	int	0x80
