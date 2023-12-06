#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <ctype.h>

void FileError(const char *progNam, char *operation, int error){
  fprintf(stderr,"Error:%s:%s:%s\n", progNam, operation,strerror(error));
  exit(1);
}
int main(int argc, const char *argv[]){
  if(argc!=3){
    fprintf(stderr,"Error:%s:Enterd parameters are wronge: Pleas enter to"
    " file names/dierectorys.\n", argv[0]);
    exit(1);
  }
  FILE *readFile = fopen(argv[1],"r");
  if(!readFile){
    FileError(argv[0],"Opening read file",errno);
  }
  FILE *writFile = fopen(argv[2],"w");
  if(!writFile){
    FileError(argv[0],"Opening write file",errno);
  }
  int lastWasWhite=0;
  while(1){
    int charectar=getc(readFile);
    if(charectar==EOF){
      fprintf(stderr,"Info:%s:was corrctly finished",argv[0]);  
      exit(0);
    }
    if(!(lastWasWhite && isspace(charectar))&&putc(charectar,writFile) == EOF){
      FileError(argv[0],"Ende of write file",errno);
    }
    lastWasWhite=isspace(charectar);
  }
  
}
