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
  mov cl,  [count]

_for:
  cmp cl, [size]
  je  _end
  mov eax,  vet
  add eax,  [count]
  ; mov dl,  cl
  mov ebx,  eax
  ; mov edx,  [eax]

_for2:
  inc cl
  cmp cl,  [size]
  je _next
  inc ebx
  mov edx,  [ebx]
  cmp edx,  [eax]
  ; jb  _for2
  ; mov [ebx],  ecx
  ; mov [eax],  edx
  jmp _for2  

_next:
  mov cl,  [count]
  inc cl
  mov [count],  cl
  jmp _for

_end:
  call _print

  mov ebx,  [size]
  mov eax,  1
  int 0x80