#include <stdio.h>
#include <stdlib.h>
#include "tamanho.h"

void preencher_matriz(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas], int seed)
{
  int c, l;

  srand(seed);
  for (l = 0; l < A_Linhas; l++)
  {
    for (c = 0; c < A_Colunas; c++)
    {
      X[l][c] = rand() % 10;
    }
  }

  for (c = 0; c < C_Colunas; c++)
  {
    for (l = 0; l < C_Linhas; l++)
    {
      Y[l][c] = rand() % 10;
    }
  }
}

void imprimir_matrizes(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas])
{
  int c, l;

  printf("A\n");
  for (l = 0; l < A_Linhas; l++)
  {
    for (c = 0; c < A_Colunas; c++)
    {
      printf("%02d ", X[l][c]);
    }
    printf("\n");
  }

  printf("C\n");
    for (l = 0; l < C_Linhas; l++)
  {
  for (c = 0; c < C_Colunas; c++)
    {
      printf("%02d ", Y[l][c]);
    }
    printf("\n");
  }
}
