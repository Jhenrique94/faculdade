global _start

SECTION .data

MIN     EQU   16
START   EQU   18
MAX     EQU   70

idade:  DB    15

nao:    DB    'O cidadão não pode votar!    ', 0AH
fac:    DB    'O voto é facultativo.        ', 0AH
obg:    DB    'O cidadão é obrigado a votar.', 0AH
LEN     EQU   31

SECTION .text

_start:
  mov bl,  [idade]

  cmp bl,  MIN
  jb  _nao_vota

  cmp bl,  START
  jb  _facultativo

  cmp bl,  MAX
  ja  _facultativo

  mov ecx,  obg
  jmp _end

_nao_vota:
  mov ecx,  nao
  jmp _end

_facultativo:
  mov ecx,  fac

_end:
  mov edx,  LEN
  mov ebx,  1  
  mov eax,  4  
  int 0x80

  mov ebx,  0
  mov eax,  1
  int 0x80
  



  

