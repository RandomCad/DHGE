#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>

#define LIN_LEN 82

void FileError(const char *progNam, char *operation, int error){
  fprintf(stderr,"Error:%s:%s:%s\n", progNam, operation,strerror(error));
  exit(1);
}


int main(int argc, const char *argv[]){
  fprintf(stderr,"Info:%s:The program starts\n",argv[0]);  
  if(argc<3||argc>5){
    fprintf(stderr,"bitte geben sie 2 wörter ein und bis zu 2 File namen");
    return 1;
  }
  FILE *readFile=(argc>3)?fopen(argv[3],"r"):stdin;
  if(!readFile)  FileError(argv[0],"Opening read file",errno);
  FILE *writFile=(argc>4)?fopen(argv[4],"w"):stdout;
  if(!writFile) FileError(argv[0],"Opening write file",errno);
  char line[LIN_LEN];
  while(fgets(line,LIN_LEN,readFile)){
    char *linePtr=line;
    char *found;
    while((found=strstr(linePtr,argv[1]))){
      *found='\0';
      if(fputs(linePtr, writFile)==EOF) FileError(argv[0],"Writing to dest file",errno);
      if(fputs(argv[2], writFile)==EOF) FileError(argv[0],"Writing to dest file",errno);
      linePtr=found+strlen(argv[1]);
    }
    if(fputs(linePtr,writFile)==EOF) FileError(argv[0],"Writing to dest file",errno);
  }
  if(fclose(readFile)==EOF) FileError(argv[0],"Closing the source file",errno);
  if(fclose(writFile)==EOF) FileError(argv[0],"Closing the write file",errno);
  fprintf(stderr,"Info:%s:Was corrctly finished\n",argv[0]);  
}
