#include <stdlib.h>
#include <stdio.h>

int *start;
int *ende;

int perm(){
  for(int *i=ende-1;i>=start;i--){
    if(*i<*i+1){
      for(int *j=ende;j>i;j--){
        if(*j>*i){
          int zwi=*j;
          *j=*i;
          *i=zwi;
          for(int *a=i+1, *b=ende-1;a<b;a++,b--){
            int zwi=*a;
            *a=*b;
            *b=zwi;
          }
          for(int *i=start;i<ende;i++){
            printf("%d",*i);
          }
          printf("\n");
          return 1;
        }
      }
    }
  }
  return 0;
}

int main(int argc,const char *argv[]){
  start=malloc(atoi(argv[1])*sizeof(int));
  ende=start+atoi(argv[1]);
  for(int *i=start;i<ende;i++){
    *i=i-start+1;
    printf("%d",*i);
  }
  printf("\n");
  while(perm()){}
  return 0;
}
