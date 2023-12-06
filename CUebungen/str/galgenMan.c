#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

const char *const  words[]={ "wort","ort","tot","bewegen","gehen","stehen","leben","haben","ort","dort"};

int contains(char needel, char *haystack){
  for(char *i=haystack;i;i++) if(*i==needel) return 1;
  return 0;
}

int containsStar(char *in){
  for(;*in;in++) if(*in=='*') return 1;
  return 0;
}

int main(int argc, const char *argv[]) {
  srand(time(NULL));
  int random=rand()%(sizeof(words)/sizeof(words[0]));
  const char *wort=words[random];
  int len=strlen(wort);
  char output[len+1];
  for(int i=0;i<len;i++) output[i]='*';
  output[len]=0;
  printf("%s\n", output);
  while(containsStar(output)){
    char input= getchar();
    getchar();
    for(int i=0;i<len;i++) if(wort[i]==input) output[i]=wort[i];
    printf("%s\n", output);
  }
  printf("sie haben das wort gefunden");


  return 0;
}
