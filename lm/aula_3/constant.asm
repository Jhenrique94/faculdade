global _start

SECTION .data

NUM_OF_ROWS   EQU   4
NUM_OF_COLS   EQU   3
ARRAY_SIZE    EQU   NUM_OF_ROWS * NUM_OF_COLS

%assign       SIZE  2
%iassign      valor 3

SECTION .text

_start:
  ; mov   ebx,  NUM_OF_ROWS
  ; mov   ebx,  NUM_OF_COLS
  mov   ebx,  ARRAY_SIZE

  ; %assign SIZE  10
  ; %assign size  20
  ; mov   ebx,  SIZE

  ; %iassign VaLoR  4
  ; mov   ebx,  valor

  mov   eax,  1       ; exit command to kernel
  int   0x80
