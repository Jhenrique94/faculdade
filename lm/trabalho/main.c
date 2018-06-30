#include "helper.h"
#include "matriz.h"

// as --32 -o matriz_gas.o matriz.s
// nasm -f elf -o matriz_nasm.o matriz.asm
// gcc -m32 -o main.out main.c matriz.h tamanho.h helper.h matriz.h matriz_gas.o matriz_nasm.o
// ./main.out
// tamanho da matriz em tamanho.h

// extern void gas_multiplica_por_inteiro(int X[A_Linhas][A_Colunas], int number);
// extern int gas_maior_valor_diagonal_principal_mutiplicada(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas]);
// extern void nasm_multiplica_por_inteiro(int X[A_Linhas][A_Colunas], int number);
// extern int nasm_maior_valor_diagonal_principal_mutiplicada(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas]);

int main()
{
  int A[A_Linhas][A_Colunas];
  int C[C_Linhas][C_Colunas];

  int resultado;

  if (A_Colunas != C_Linhas)
  {
    printf("Matrizes não podem ser multiplicadas!");
    return 0;
  }

  preencher_matriz(A, C, 1);
  // Codigo em C
  multiplica_por_inteiro(A, 5);
  // imprimir_matrizes(A, C);
  resultado = maior_valor_diagonal_principal_mutiplicada(A, C);
  printf("Resultado C: %d \n", resultado);

  // preencher_matriz(A, C, 1);
  // // Codigo em gas
  // gas_multiplica_por_inteiro(A, 5);
  // // imprimir_matrizes(A, C);
  // resultado = gas_maior_valor_diagonal_principal_mutiplicada(A, C);
  // printf("Resultado gas: %d \n", resultado);

  // preencher_matriz(A, C, 1);
  // // Codigo em nasm
  // nasm_multiplica_por_inteiro(A, 5);
  // // imprimir_matrizes(A, C);
  // resultado = nasm_maior_valor_diagonal_principal_mutiplicada(A, C);
  // printf("Resultado nasm: %d \n", resultado);

  return 0;
}