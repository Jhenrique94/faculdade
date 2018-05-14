global _start

SECTION .data

min_1:    DB    50
max_1:    DB    100
min_2:    DB    150
max_2:    DB    200

valido:   DB    'valido  ', 0AH
invalido: DB    'invalido', 0AH
LEN       EQU   9

; val:  DB  49
; val:  DB  50
; val:  DB  70
; val:  DB  100
; val:  DB  101
; val:  DB  149
; val:  DB  150
; val:  DB  170
; val:  DB  200
val:  DB  201

SECTION .text

_start:
  mov bl, [val]
  cmp bl, 0
  je  _valido

  cmp bl, [min_1]
  jb  _invalido
  cmp bl, [max_1]
  jbe _valido

  cmp bl, [min_2]
  jb  _invalido
  cmp bl, [max_2]
  jbe _valido

_invalido:
  mov ecx, invalido
  jmp _end

_valido:
  mov ecx, valido

_end:
  mov edx,  LEN
  mov ebx,  1  
  mov eax,  4  
  int 0x80

  mov ebx,  0
  mov eax,  1
  int 0x80
