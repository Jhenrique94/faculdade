#include <stdio.h>

int main()
{
  int vet[3] = {9, 7, 4};
  // int r = sum(vet);
  int r = sum_nasm(vet);

  printf("Valor da Soma: %d \n", r);
}

int sum(int pvet[3])
{
  return pvet[0] + pvet[1] + pvet[2];
}

int sum_nasm(int pvet[3])
{
  asm("mov 8(%ebp), %ebx");
  asm("xor %eax,    %eax");
  asm("add (%ebx),  %eax");
  asm("add 4(%ebx), %eax");
  asm("add 8(%ebx), %eax");
  // asm("add 2*2+4(%ebx),  %eax");
}
