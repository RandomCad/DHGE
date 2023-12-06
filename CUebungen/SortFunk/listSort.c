#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define LINE_LEN 4096

typedef struct strList{
  int num;
  char *line;
  struct strList *next;
} strList;

int main(int argc, const char *argv[]){
  char line[LINE_LEN];
  strList *startNode=NULL;
  strList *endeNode=NULL;
  for(;fgets(line,LINE_LEN,stdin);){
    char *endPtr=NULL;
    int i=strtol(line,&endPtr,10);
    strList newLine = (strList){i,strdup(endPtr),NULL};
    for(strList *j=startNode;;j=j->next){
      if(j==NULL){
        j=&newLine;
        break;
      }
      if(j->next->num>i){
        strList *zwi=j->next;
        j->next=&newLine;
        newLine.next=zwi;
      }
    }
  }

  for(strList *j=startNode;j;j=j->next)
    printf("%s\n",j->line);
}
