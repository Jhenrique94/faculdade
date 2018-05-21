global _start

SECTION .data

vet:    DB    "XBHSAQRTEZ"
size:   DB    10
count:  DB    0

SECTION .text

_print:
  mov ecx,  vet
  mov edx,  10
  mov ebx,  1
  mov eax,  4
  int 0x80
  ret

_start:
  mov al,   0
  mov ecx,  vet
  jmp for2cond

for2body:
  mov al, bl
  mov edx,  ecx
  jmp for1cond

  for1body:
    mov ah, [ecx]
    mov bh, [edx]
    cmp ah, bh
    jle end
    mov [ecx],  bh
    mov [edx],  ah

  end:
    inc bl
    inc edx

  for1cond:
    cmp bl, [size]
    jl  for1body

  inc al
  inc ecx

for2cond:
  cmp al, [size]
  jl  for2body

  call _print

  mov ebx,  [size]
  mov eax,  1
  int 0x80