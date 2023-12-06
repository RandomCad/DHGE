#include <stdlib.h>
#include <stdio.h>
int main(int argc, const char *argv[]){
  int input[argc-1];
  for(int i=1;i<argc;i++) input[i-1]=atoi(argv[i]);
  for(int i=0;argc-1>i;i++){
    printf("%10d:",input[i]);
    for(unsigned int j=(1<<(sizeof(int)*8-1));j!=0;j>>=1){
      if(j&0x88888888) putchar(' ');
      putc(((input[i]&j)>0) ?'1':'0',stdout);
    }
    putchar(' ');
    for(int j=sizeof(int)*2-1;j>=0;j--) putchar((((input[i]>>(j*4U))&(0xfU))>9)? 'a' + ((input[i]>>(j*4U))&(0xfU))-10 :'0'+((input[i]>>(j*4U))&0xfU));
    printf("\n");
  }
}
