global _start

SECTION .data

inv:    DB    'invalido  ', 0AH
eqi:    DB    'equilatero', 0AH
iso:    DB    'isoceles  ', 0AH
esc:    DB    'escaleno  ', 0AH
LEN     EQU   11

side_1: DB  3
side_2: DB  4
side_3: DB  10

SECTION .text

_is_valid:
  cmp bl,  cl
  jne _sum
  inc eax
_sum:
  add bl,  cl
  cmp bl,  dl
  jbe _inv
  ret

_start:
  mov eax, 0

  mov bl,  [side_1]
  mov cl,  [side_2]
  mov dl,  [side_3]
  call _is_valid

  mov bl,  [side_1]
  mov cl,  [side_3]
  mov dl,  [side_2]
  call _is_valid

  mov bl,  [side_2]
  mov cl,  [side_3]
  mov dl,  [side_1]
  call _is_valid
  
  cmp eax, 2
  jae _eqi
  cmp eax, 1
  je _iso
  mov ecx, esc
  jmp _end

_eqi:
  mov ecx, eqi
  jmp _end

_iso:
  mov ecx, iso
  jmp _end

_inv:
  mov ecx, inv

_end:
  mov edx,  LEN
  mov ebx,  1  
  mov eax,  4  
  int 0x80

  mov ebx,  0
  mov eax,  1
  int 0x80
  



  

