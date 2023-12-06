#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "sdlinterf.h"

typedef struct point{
  double x;
  double y;
  int R,G,B;
} point;

typedef struct koeff{
  double wert;
  double min_wert;
  double max_wert;
  double schritt;
}koeff;

typedef struct farbinfo{
  int proz_rot;
  int proz_gruen;
  int proz_blau;
  int dazu_rot;
  int dazu_gruen;
  int dazu_blau;
}farbinfo;

#include "ifs-daten-header/stern.h"

point calcPoints[ANZAHL];

int main(int argc, const char *argv[]){
  srand(time(NULL));
  sdlInit();

  sdlSetBlack();

  calcPoints[0]=(point) {0,0,ROT,GRUEN,BLAU};
  
  while(1){
    double xMax=-1e300,xMin=1e300;
    double yMax=-1e300,yMin=1e300;

    for(int i=1;i<ANZAHL;i++){
      int randNum=rand()%100, index=0;
      for(;index<GL_ANZ;index++) if(prozent[index]>randNum) break;
      calcPoints[i]=(point) {
          c[index][0].wert*calcPoints[i-1].x+c[index][1].wert*calcPoints[i-1].y+c[index][2].wert,
          c[index][3].wert*calcPoints[i-1].x+c[index][4].wert*calcPoints[i-1].y+c[index][5].wert,
          (calcPoints[i-1].R*farbe[index].proz_rot)/100+farbe[index].dazu_rot,
          (calcPoints[i-1].G*farbe[index].proz_gruen)/100+farbe[index].dazu_gruen,
          (calcPoints[i-1].B*farbe[index].proz_blau)/100+farbe[index].dazu_blau};
      calcPoints[i].R=(calcPoints[i].R>255)?255:(calcPoints[i].R<0)?0:calcPoints[i].R;
      calcPoints[i].B=(calcPoints[i].B>255)?255:(calcPoints[i].B<0)?0:calcPoints[i].B;
      calcPoints[i].G=(calcPoints[i].G>255)?255:(calcPoints[i].G<0)?0:calcPoints[i].G;
      if(i>=ERSTER){
        if(calcPoints[i].x>xMax){
          xMax=calcPoints[i].x;
        }
        if(calcPoints[i].x<xMin){
          xMin=calcPoints[i].x;
        }
        if(calcPoints[i].y>yMax){
          yMax=calcPoints[i].y;
        }
        if(calcPoints[i].y<yMin){
          yMin=calcPoints[i].y;
        }  
      }
    }

    sdlSetBlack();
    for(int i=ERSTER;i<ANZAHL;i++){
      sdlDrawPoint(((calcPoints[i].x-xMin)/(xMax-xMin))*(SDL_X_SIZE-1),
                   (1-(calcPoints[i].y-yMin)/(yMax-yMin))*(SDL_Y_SIZE-1),
                   calcPoints[i].R,calcPoints[i].G,calcPoints[i].B);
    }
    sdlUpdate();
    //sdlMilliSleep(10);

    for(int i=0;i<GL_ANZ;i++){
      for(int j=0;j<6;j++){
        c[i][j].wert+=c[i][j].schritt;
        if(c[i][j].wert>c[i][j].max_wert||c[i][j].wert<c[i][j].min_wert) c[i][j].schritt*=-1;
      }
    }
  }
  sdlExit();
}
