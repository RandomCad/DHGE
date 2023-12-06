#include <stdio.h>
#include <stdlib.h>



int main(int argc, const char *argv[]){
  int max=atoi(argv[1]);
  int sizeOfSieb=(max%8!=0)?max/8+1 :max/8;
  char sieb[sizeOfSieb];
  for(int i=0;i<sizeOfSieb;i++) sieb[i]=255;
  for(char *i=sieb;i-sieb<sizeOfSieb;i++){
    for(char j=0;j<8;j++){
      printf("%d",(*i&1<<j)?1:0);
      if(*i&1<<j){
        int counter=1;
        for(char *a=i;a-sieb<sizeOfSieb;a++){
          for(char b=(a==i)?j+1:0;b<8;b++){
            if(counter==(i-sieb)*8+j){
              counter=0;
              continue;
            }
            *i|=1<<b;
            counter++;
          }
        }
      }
    }
    printf("\n");
  }
}
