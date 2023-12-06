#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define STRINTLEN 20

int strtolSelf(const char *num,const char **lastTransform){
  int returnNum=0;
  int pos=1;
  if(*num=='-') pos=-1, num++;
  const char *i;
  for(i=num;*i;i++){
    if(*i<48 ||*i>57){
      if(lastTransform!=NULL) *lastTransform=i;
      return returnNum*pos;
    }
    returnNum=returnNum*10+*i-48;
  }
  if(lastTransform!=NULL) *lastTransform=i;
  return returnNum*pos;
}

char *strint(int input,char *goal){
  if(!input) return "0\0";
  if(input<0) *(goal++)='-', input=-input;
  char *start=goal;
  for(;input;input/=10,goal++){
    if(!*goal) return NULL;
    *goal=input%10+48;
  }
  *(goal--)=0;
  for(;goal>=start;goal--,start++){
    char zwi=*goal;
    *goal=*start;
    *start=zwi;
  }
  return goal;
}

int main(int argc, const char *argv[]){
  for(int i=1;i<argc;i++){
    const char *lastTrans=NULL;
    char test[STRINTLEN] ={0};
    for(int j=0;j<STRINTLEN-1;j++) test[j]=48;
    int enteredNum=strtolSelf(argv[i],&lastTrans);
    strint(enteredNum,test);
    printf("The %d enterd number was: %d.\n",i,enteredNum);
    printf("The number was transformed in an string: %s\n",test);
    printf("The first not transformabel char was %c.\n",(*lastTrans)?*lastTrans:' ');
  }
}
