#include <stdlib.h>
#include <stdio.h>
#include "sdlinterf.h"
#include <time.h>
#include <math.h>



typedef struct City{
  int x;
  int y;
  struct City *next;
} City;

typedef struct CityCon{
  double len;
  City *A;
  City *B;
} CityCon;

int Comparer(const void *a, const void *b){
  double val=((CityCon*)b)->len-((CityCon*)a)->len;
  if(val>0) return -1;
  if(val<0) return 1;
  return 0;
}

City *lastConected(City *a){
  for(;a->next;a=a->next);
  return a;
}

int main(int argc, const char *argv[]){
  int cityCount=atoi(argv[1]);
  City *cityArr=malloc(sizeof(City)*cityCount);
  if(cityArr==NULL){
    fprintf(stderr, "malloc error meaby the point cloud is to big?");
    return -1;
  }
  srand(time(NULL));
  for(City *i=cityArr;i-cityArr<cityCount;i++)
    *i=(City){rand()%(SDL_X_SIZE-4)+2,rand()%(SDL_Y_SIZE-4)+2,NULL};

  int counter=0;
  CityCon *conArr=malloc(sizeof(CityCon)*(cityCount*(cityCount-1))/2);
  if(conArr==NULL){
    fprintf(stderr, "malloc error meaby the point cloud is to big?");
    return -1;
  }
  for(City *i=cityArr+1;i-cityArr<cityCount;i++){
    for(City *j=i-1;j>=cityArr;j--){
      conArr[counter++]=(CityCon){sqrt((i->x-j->x)*(i->x-j->x)+(i->y-j->y)*(i->y-j->y)),i,j};
    }
  }
  printf("next qsort\n");
  qsort(conArr,(cityCount*(cityCount-1))/2,sizeof(CityCon),Comparer);
  printf("finisched qsort\n");
  sdlInit();
  sdlSetBlack();
  for(City *i=cityArr;i-cityArr<cityCount;i++)sdlDrawPoint(i->x,i->y,255,0,0);
  sdlUpdate();
  counter=0;
  printf("Start tree build\n");
  for(CityCon *i=conArr;i-conArr<(cityCount*(cityCount-1))/2;i++){
    //printf("%ld\n", i-conArr);
    City *la,*lb;
    if((la=lastConected(i->A)) != (lb=lastConected(i->B))){
      sdlDrawLine(i->A->x,i->A->y,i->B->x,i->B->y,0,255,255);
      sdlUpdate();
      la->next=lb;
      counter++;
      //sdlMilliSleep(1);
      if(counter==cityCount-1) break;
    }
  }
  sdlUpdate();
  sdlMilliSleep(10000);
  sdlExit();
}
