global sum_asm

SECTION .text

sum_asm:
  push  ebp
  mov   ebp,  esp
  mov   eax,  [ebp + 8]
  add   eax,  [ebp + 12]
  mov   esp,  ebp
  pop   ebp
  ret