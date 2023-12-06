#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define BORD_SIZE 80
char* GetPoin(int i,int j, char *bordStart){
  return bordStart+BORD_SIZE/10+2+j+i*(BORD_SIZE/10+1);
}
void PrintBinaryChar(char num){
	for(int i=8;i>0;i--) printf("%s",128&num ?"1" :"0");
	printf("\n");
}

int main(int argc, const char *argv[])
{
  char *bordStart = malloc(BORD_SIZE*BORD_SIZE);
  char *bordTo=malloc(BORD_SIZE*BORD_SIZE);
  /*
  srand(time(NULL));
  int randCounter=0, randNum=rand();
  for(int i=0;i<BORD_SIZE;i++){
    for(int j=0;j<BORD_SIZE/10;j++){
      *GetPoin(i,j,bordStart) |= (0b11111111<<randCounter*8 & randNum)>>randCounter*8;
      if(randCounter>sizeof(int)/8){
        randCounter=0;
        randNum=rand();
      }
    }
    printf("\n");
  }*/
	*GetPoin(0,0,bordStart)=0xff;
	*GetPoin(2,0,bordStart)=0xff;
  int switcher=0;
  int counter = 0;
  for(int i=0;i<BORD_SIZE;i++){
    for(int j=0;j<BORD_SIZE/10;j++){
      for(int a=0;a<8;a++){
        if(*GetPoin(i,j,bordStart) & 1<<a) printf("1");
        else printf("0");
      }
    }
    printf("\n");
  }
  //change
  for(int i=0;i<BORD_SIZE;i++){
    for(int j=0;j<BORD_SIZE/10;j++){
      for(int a=0;a<8;a++){
		
				//todo: add the ofer the edeg of the byte going system!
			if(i==1){
					PrintBinaryChar((char)*GetPoin(i+1,j,bordStart));
					PrintBinaryChar((char)*GetPoin(i,j,bordStart));
					PrintBinaryChar((char)*GetPoin(i-1,j,bordStart));
				}
        char nachbarn=(*GetPoin(i+1,j,bordStart) & 0x7<<a-1);
				if(i==1) PrintBinaryChar(nachbarn);
				nachbarn|=(*GetPoin(i,j,bordStart) & 1<<a-1)>>a-4;
				if(i==1)  PrintBinaryChar(nachbarn);
				nachbarn|=(*GetPoin(i,j,bordStart) & 1<<a+1)>>a-5;
				if(i==1) PrintBinaryChar(nachbarn);
				nachbarn+=(*GetPoin	(i-1,j,bordStart)&0x7<<a-1)>>a-6;
				if(i==1){
					 PrintBinaryChar(nachbarn);
				}
        *GetPoin(i,j,bordStart);
      }
    }
    printf("\n");
  }
	free(bordStart);
	free(bordTo);
  return 0;
}
