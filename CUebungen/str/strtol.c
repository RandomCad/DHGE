#include <stdio.h>
#include <stdlib.h>

int strtolSelf(const char *num,const char **lastTransform){
  int returnNum=0;
  const char *i;
  for(i=num;*i;i++){
    if(*i<48 ||*i>57){
      if(lastTransform!=NULL) *lastTransform=i;
      return returnNum;
    }
    returnNum=returnNum*10+*i-48;
  }
  if(lastTransform!=NULL) *lastTransform=i;
  return returnNum;
}

int main(int argc, const char *argv[]){
  printf("%d\n", strtolSelf(argv[1],NULL));
}
