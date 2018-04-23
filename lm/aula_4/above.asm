global _start

SECTION .data

char1:    DB    'C'
char2:    DB    'B'

SECTION .text

_start:
  mov   al, [char1]
  cmp   al, [char2]

  jae   c2

c1:
  mov   ecx, char1
  jmp   show

c2:
  mov   ecx, char2

show:
  mov   edx, 1
  mov   ebx, 1
  mov   eax, 4
  int   0x80
  mov   eax, 1
  int   0x80
