global _start

SECTION .data

msg:    DB    " abc Isto e uma frase de teste "
LEN     EQU   31

SECTION .text

_start:
  mov ecx, msg
  add ecx, LEN
  mov edx, 0
  
_cmp:
  cmp byte [ecx], 32
  je  _show
  cmp edx, LEN
  je  _end
  inc edx
  sub ecx, 1
  jmp _cmp

_show:
  mov ebx,  1  
  mov eax,  4
  int 0x80
  mov edx, 1
  sub ecx, 1
  jmp _cmp

_end:
  mov ebx,  0
  mov eax,  1
  int 0x80