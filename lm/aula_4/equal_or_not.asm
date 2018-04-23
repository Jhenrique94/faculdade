global _start

SECTION .data

var1:   DB    13
var2:   DB    14
msge:   DB    'Iguais    ', 10
msgne:  DB    'Diferentes', 10

SECTION .text

_start:
  ; números diretos
  ; mov   eax, 11
  ; mov   ebx, 12

  ; dados da memória
  mov   al, [var1]
  mov   bl, [var2]

  cmp   al, bl
  je    lequ

ldiff:
  mov   ecx, msgne
  jmp   lmsg

lequ:
  mov   ecx, msge

lmsg:
  mov   edx, 11
  mov   ebx, 1
  mov   eax, 4
  int   0x80
  mov   eax, 1
  int   0x80
