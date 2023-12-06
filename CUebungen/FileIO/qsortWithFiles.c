#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#define PTR_ARR_LEN 64
#define INPUT_LEN 4096

typedef struct FileText{
  int place;
  char *text;
} FileText;

int strLenComparer(const void *x,const void *y){
  return strlen(((FileText*)x)->text)-strlen(((FileText*)y)->text);
}
int strAlpComparer(const void *x,const void *y){
  return strcmp(((FileText*)x)->text,((FileText*)y)->text);
}

int main(int argc, const char *argv[]){
  FileText *fileTextArr=malloc(sizeof(FileText)*PTR_ARR_LEN);
  unsigned long fileTextArrLenMax=PTR_ARR_LEN;
  char inputLine[INPUT_LEN];
  FILE *inputFile,*outputFile;
  if(argc==1){
    inputFile=stdin;
    outputFile=stdout;
    goto endeFiles;
  }
  if(argc==2){
    inputFile=fopen(argv[1],"r");
    outputFile=stdout;
    goto endeFiles;
  }
  if(argc==3){
    inputFile=fopen(argv[1],"r");
    outputFile=fopen(argv[1],"w");
    goto endeFiles;
  }
  endeFiles:;
  int fileTextArrLen=0;
  for(int i=0;fgets(inputLine,INPUT_LEN,inputFile);i++){
    if(fileTextArrLenMax==fileTextArrLen){
      fileTextArr=realloc(fileTextArr,(fileTextArrLenMax<<=1) * sizeof(FileText));
      //printf("mad biger to %ld\n",fileTextArrLenMax);
    }
    fileTextArr[i]=(FileText){i,strdup(inputLine)};
    fileTextArrLen++;
    //printf("%d\n",fileTextArrLen);
  }
  qsort(fileTextArr,fileTextArrLen,sizeof(FileText),strAlpComparer);
  printf("bereit sort \n");
  for(FileText *i=fileTextArr;i<fileTextArr+fileTextArrLen;i++) printf("%s",i->text);
}
