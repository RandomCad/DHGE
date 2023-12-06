#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int isPallindrom(const char *in){
  const char *i, *j;
  for(i=in, j=in+strlen(in)-1;*i==*j &&i<=j;i++,j--){}
  return i>j;
}

int main(int argc, const char *argv[]){
  printf("%s", isPallindrom(argv[1]) ? "Die eingabe ist ein Paliindrom": "Die eingabe ist kein Palindrom");
}
