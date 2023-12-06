#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct IntList{
  int num;
  struct IntList *next;
}IntList;

int main(int argc,const char *argv[]){
  IntList *start;
  int ListLen=atoi(argv[1]);
  srand(time(NULL));
  for(int i=0;i<ListLen;i++){
    IntList *newEl=malloc(sizeof(IntList));
    *newEl=(IntList){rand(),NULL};
    for(IntList **j=&start;;j=&(*j)->next){
      if(*j==NULL){
        *j=newEl;
        break;
      }
      if((*j)->num>newEl->num){
        newEl->next=*j;
        (*j)=newEl;
        break;
      }
    }
  }
  for(IntList *i=start;i;i=i->next) printf("%d\n",i->num);
}
