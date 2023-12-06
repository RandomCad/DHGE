#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

#define LINE_LEN 4096
#define LINE_LEN_CON_LEN 64

typedef struct FileLine{
  int index;
  char *line;
  struct FileLine *next;
} FileLine;

typedef struct LineLenCon{
  int lineLen;
  FileLine *startPtr;
  FileLine *endePtr;
} LineLenCon;

LineLenCon *FindLenCon(int len, LineLenCon *arr,int arrLen){
  for(int i=0;i<arrLen;i++) if(arr[i].lineLen==len) return arr+i;
  return NULL;
}

int main(int argc,const char *argv[]){
  FILE *files[argc-1];
  for(int i=1;i<argc;i++) files[i-1]=fopen(argv[i],"r");
  char line[LINE_LEN];
  LineLenCon *lineArr=malloc(sizeof(LineLenCon)*LINE_LEN_CON_LEN);
  int lineArrMaxLen=LINE_LEN_CON_LEN,lineArrLen=0;
  printf("start file read\n");
  for(FILE **courentFile=files;courentFile<files+argc-1;courentFile++){
    printf("FileLoopStart\n");
    for(int i=0;fgets(line,LINE_LEN,*courentFile);i++){
      printf("write line %d\n",i);
      int lineLen=strlen(line);
      LineLenCon *arrPos=FindLenCon(lineLen,lineArr,lineArrLen);
      if(arrPos==NULL){
        lineArrLen++;
        if(lineArrLen==lineArrMaxLen) lineArr=realloc(lineArr,lineArrMaxLen*=2);
        FileLine *newElement=malloc(sizeof(FileLine));
        *newElement=(FileLine){i,strdup(line),NULL};
        lineArr[lineArrLen] = (LineLenCon){lineLen,newElement,newElement};
        continue;
      }
      FileLine *newElement=malloc(sizeof(FileLine));
      *newElement=(FileLine){i,strdup(line),NULL};
      arrPos->endePtr->next=newElement;
      arrPos->endePtr=newElement;


      printf("write line ende %d\n",i);
    }
    printf("FileLoopEnde\n");
  }
}
