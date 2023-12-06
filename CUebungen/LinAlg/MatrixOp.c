#include <stdio.h>
#include <stdlib.h>

#define PrintMatrix(matrix,X,Y) {for(int i=0;i<X;i++){for(int j=0;j<Y;j++) printf("%g, ",matrix[i][j]);printf("\n");}}



int main(int argc, const char *argv[]){
  int matrixX=atoi(argv[1]), matrixY=atoi(argv[2]);
  double matrix[matrixX][matrixY];
  const char *a=argv[3];
  for(int i=0;i<matrixX;i++){
    for(int j=0;j<matrixY;j++){
      if(!*a){
        fprintf(stderr,"eror to short input matrix");
        return 1; 
      }
      char *zwi;
      matrix[i][j]=strtod(a,&zwi);
      a=zwi+1;
    }
  }
  PrintMatrix(matrix,matrixX,matrixY);
}
