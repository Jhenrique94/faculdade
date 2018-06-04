global _start

SECTION .data

base:   db    3
exp:    db    4

%macro pot 2 
  mov al, 1
ini_pot:
  cmp %2, 1
  jl end_pot
  mul %1
  dec %2
  jmp ini_pot
end_pot:
  mov %1, al
%endmacro

SECTION .text

_start:
  mov bl, [base]
  mov cl, [exp]

  pot bl, cl

  mov eax,  1
  int 0x80