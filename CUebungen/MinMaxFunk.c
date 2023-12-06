#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int MinMax(double **max,double **min,double arr[],int arrLength){
  for(double *i=arr;i-arr<arrLength;i++){
    if(*i>**max){
      *max=i;
    }
    if(*i<**min){
      *min=i;
    }
  }
  return 0;
}

int main(int argc, const char *argv[]){
  double arr[argc - 1];
  for(int i=1;i<argc;i++){
    arr[i-1]=atof(argv[i]);
    printf("%g", arr[i-1]);
  }
  double maxNum=-HUGE_VAL, minNum=HUGE_VAL;
  double *max=&maxNum,*min=&minNum;
  MinMax(&max,&min,arr,argc-1);
  printf("%g, %g", *max, *min);
}
