;EXEMPLO AND e NOT

	SECTION .data

var16b:		DW	0xFF
varmask:	DW	0x10

	SECTION .text

	global _start
	_start:

	mov	ax,[var16b]
	and	ax,[varmask]
	not	ax
	;inc	ax

	;mov	ax,0
	;sub	ax,[varmask]


	mov	ebx,eax
	mov	eax,1
	int	0x80
