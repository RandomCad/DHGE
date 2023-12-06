#include <stdio.h>
#include "ChessAiMethodes.h"

typedef unsigned char uchar;

char *PrintByteAsHex(char *out, char in);

void printBoard(uchar x[64]){
  for(int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      char line[5];
      printf("%s,",PrintByteAsHex(line,x[i*8+j]));
    }
    printf("\n");
  }
}

char *PrintByteAsHex(char *out, char in){
  out[0]='0';
  out[1]='x';
  out[2]=((in&0xf0)>>4)+'0';
  if(out[2]>'9') out[2]+='a'-'0';
  out[3]=(in&0xf)+'0';
  if(out[3]>'9') out[3]+='a'-'0';
  out[4]='\0';
  return out;
}
