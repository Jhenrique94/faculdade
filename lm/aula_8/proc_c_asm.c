#include <stdio.h>

// gas
// as --32 -o sum_gas.o sum.s
// gcc -m32 -o proc_c_gas.out proc_c_asm.c sum_gas.o
// ./proc_c_gas.out

// nasm
// nasm -f elf -o sum_nasm.o sum.asm
// gcc -m32 -o proc_c_nasm.out proc_c_asm.c sum_nasm.o
// ./proc_c_nasm.out

extern int sum_asm(int, int);

int main()
{
  int v1 = 10;
  int v2 = 30;
  int r = 0;
  r = sum_asm(v1, v2);

  printf("Valor da Soma: %d \n", r);
}