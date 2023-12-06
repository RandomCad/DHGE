#include <stdlib.h>
#include <stdio.h>

typedef struct listOb{
  int num;
  int amount;
  struct listOb *next;
}listOb;

int main(int argc, const char *argv[]){
  if(argc==1){
    
    return 0;
  }
  FILE *in=fopen(argv[1]);
  listOb *startNode=NULL;
  //*startNode=(listOb){atoi(argv[1]),1,NULL};
  //printf("%d:1\n",startNode->num);
  char text[2048];
  for(int i=1;i<argc;i++){
    fgets(text,2048,in);
    int num=atoi(text);
    if( !startNode || num<startNode->num){
      listOb *zwi=malloc(sizeof(listOb));
      *zwi=(listOb) {num,1,startNode};
      startNode=zwi;
      goto printLabel;
    }
    listOb *p=startNode;
    for(;p->next && p->next->num<=num;p=p->next) {}
    if(p->num==num){
      p->amount++;
      goto printLabel;
    }
    listOb *zwi=malloc(sizeof(listOb));
    *zwi=(listOb){num,1,p->next};
    p->next=zwi;
    printLabel:
    for(p=startNode;p->next;p=p->next) printf("%d:%d, ",p->num,p->amount);
    printf("%d:%d, ",p->num,p->amount);
    printf("\n");
  }
}
