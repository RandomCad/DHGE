#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define COUNTER_SET 0

int* BoardSim(int *returnArray, int ballCount, int rows);
void PrintDiagram(int *verteilung, int rows);

int main(int argc, const char *argv[])
{
  srand(time(NULL));
  int ballCount=atoi(argv[2]);
  int rows=atoi(argv[1]);
  int Verteilung[rows + 1];
  for(int i=0;i<rows + 1;i++) Verteilung[i]=0;
	BoardSim(&Verteilung[0], ballCount, rows);
  int max=0;
  for(int i=0;i<rows + 1;i++) if(Verteilung[i]>max) max = Verteilung[i];
  for(int i=0;i<rows + 1;i++){
    printf("%d",i);
    for(int j=0;j<(40*Verteilung[i])/max;j++) printf("#");
    printf("\n");
  }
  printf("\n");
  for(int i=0;i<rows + 1;i++) printf("%d\n",Verteilung[i]);
  return 0;
}

int* BoardSim(int *returnArray, int ballCount, int rows){
  int counter=COUNTER_SET;
  int random = rand();
  for(int i=0;i<ballCount;i++){
    int place=0;
    for(int j=0;j<rows;j++){
      if(random & (1<<counter)) place++;
      counter++;
      if(counter>=31){
        counter=COUNTER_SET;
        random=rand();
      }
    }
    returnArray[place]++;
  }
	return returnArray;
}

void PrintDiagram(int *verteilung, int rows){
	char (*printLines)[rows +1];
	int maxRowLength=0;
	for(int i=rows;i>0;i%=10) maxRowLength++;
	int maxProdLength=0;
	for(int *i=verteliung;i-verleilung<=rows;i++){
		int zwi=0;
		for(int j=*i;j>0;j%=10) zwi++;
		maxProdLength= (zwi>maxProdLength) ?zwi :maxProdLength;
	}
	char printLines[rows + +1][maxProdLength + maxRowLength + 1];
	for(int i=0;i<=rows;i++){
		
	}
}
