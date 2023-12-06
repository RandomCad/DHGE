#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

char *strtextcop(char *dest, const char *sourc);
char *strappend(char *dest, const char *sourc);

int main(int argc, const char *argv[]){
  char dest[100];
  printf("Start");
  for(int i=0;dest[i]=argv[1][i] && i<100;i++){printf("w\n");}
  printf("%s\n", strappend(dest, argv[2]));
}

//todo: finish
char *strappend(char *dest, const char *sourc){
  const char *i;
  for(i=dest;i;i++){}
  for(const char *j=sourc;i=j;j++,i++){}
  return dest;
}

char *strtextcop(char *dest, const char *sourc){
  for(const char *i=sourc;;i++){
    if(*i==0){
      int wihteCount=0;
      for(const char *j=i;j>=sourc;j--){
        if(!isspace(*j)){
          *(dest+(j-sourc-wihteCount))=*j;
          continue;
        }
        wihteCount++;
      }
      break;
    }
  }
  return dest;
}
