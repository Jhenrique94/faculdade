#include "helper.h"
#include "matriz.h"
#include <time.h>
#include <sys/time.h>

// as --32 -o matriz_gas.o matriz.s
// nasm -f elf -o matriz_nasm.o matriz.asm
// gcc -m32 -o main.out main.c matriz.h tamanho.h helper.h matriz.h matriz_gas.o matriz_nasm.o
// ./main.out
// tamanho da matriz em tamanho.h e em matriz.asm/matriz.s

extern void gas_multiplica_por_inteiro(int X[A_Linhas][A_Colunas], int number, int linhas, int colunas);
extern int gas_menor_valor_diagonal_principal_mutiplicada(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas], int a_linhas, int a_colunas, int c_linhas, int c_colunas);

extern void nasm_multiplica_por_inteiro(int X[A_Linhas][A_Colunas], int number, int linhas, int colunas);
extern int nasm_menor_valor_diagonal_principal_mutiplicada(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas], int a_linhas, int a_colunas, int c_linhas, int c_colunas);

int main()
{
  int A[A_Linhas][A_Colunas];
  int C[C_Linhas][C_Colunas];
  int seed = 1;
  int resultado;

  struct timeval inicio, fim;

  if (A_Colunas != C_Linhas)
  {
    printf("Matrizes não podem ser multiplicadas!");
    return 0;
  }

  // Codigo em C
  preencher_matriz(A, C, seed);
  gettimeofday(&inicio, NULL);
  multiplica_por_inteiro(A, 5);
  resultado = menor_valor_diagonal_principal_mutiplicada(A, C);
  gettimeofday(&fim, NULL);
  printf("Resultado C:\t%d \t uSec: %ld\n", resultado, fim.tv_usec / 1 - inicio.tv_usec / 1);

  // Codigo em nasm
  preencher_matriz(A, C, seed);
  gettimeofday(&inicio, NULL);
  nasm_multiplica_por_inteiro(A, 5, A_Linhas, A_Colunas);
  // imprimir_matrizes(A, C);
  resultado = nasm_menor_valor_diagonal_principal_mutiplicada(A, C, A_Linhas, A_Colunas, C_Linhas, C_Colunas);
  gettimeofday(&fim, NULL);
  printf("Resultado nasm:\t%d \t uSec: %ld\n", resultado, fim.tv_usec / 1 - inicio.tv_usec / 1);

  // // Codigo em gas
  preencher_matriz(A, C, seed);
  gettimeofday(&inicio, NULL);
  gas_multiplica_por_inteiro(A, 5, A_Linhas, A_Colunas);
  resultado = gas_menor_valor_diagonal_principal_mutiplicada(A, C, A_Linhas, A_Colunas, C_Linhas, C_Colunas);
  gettimeofday(&fim, NULL);
  printf("Resultado gas:\t%d \t uSec: %ld\n", resultado, fim.tv_usec / 1 - inicio.tv_usec / 1);

  return 0;
}