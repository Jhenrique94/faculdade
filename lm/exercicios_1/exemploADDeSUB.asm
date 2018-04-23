;EXEMPLO ADD e SUB

	SECTION .data

var1:	db	9
var2:	db	0xF7
var3:	db	5
var4:	db	0xF

	SECTION .text

	global _start
	_start:
	
	mov	eax,[var1]
	sub	eax,[var2]
	add	eax,[var3]
	add	eax,[var4]

	mov	ebx,eax
	mov	eax,1
	int	0x80
