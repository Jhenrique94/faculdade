#include "helper.h"
#include "matriz.h"

// C
// gcc -m32 -o main.out main.c matriz.h tamanho.h helper.h matriz.h
// ./main.out
// tamanho da matriz em tamanho.h

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

  preencher_matriz(A, C);
  multiplica_por_inteiro(A, 5);
  // imprimir_matrizes(A, C);
  resultado = maior_valor_diagonal_principal_mutiplicada(A, C);

  printf("Resultado: %d \n", resultado);
}