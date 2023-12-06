#include <stdlib.h>
#include <stdio.h>
#include "sdlinterf.h"

#define LINE_LENGTH 100
#define VERZ 10

int xPos=100;
int yPos=100;
int rotation=100;
int length=10;
int totalLength;

void recursivPeano(int depth){
  if(!depth){
    int oaldx=xPos,oaldy=yPos;
    switch (rotation%4){
      case 0:
        xPos+=length;
        yPos+=length;
        break;
      case 1:
        xPos+=length;
        yPos-=length;
        break;
      case 2:
        xPos-=length;
        yPos-=length;
        break;
      case 3:
        xPos-=length;
        yPos+=length;
        break;
    }
    sdlDrawLine(oaldx,oaldy,xPos,yPos,rotation%255,rotation%255,rotation%255);
    sdlUpdate();
    sdlMilliSleep(VERZ);
    return;
  }
  recursivPeano(depth-1);
  rotation--;
  recursivPeano(depth-1);
  rotation++;
  recursivPeano(depth-1);
  rotation++;
  recursivPeano(depth-1);
  rotation++;
  recursivPeano(depth-1);
  rotation--;
  recursivPeano(depth-1);
  rotation--;
  recursivPeano(depth-1);
  rotation--;
  recursivPeano(depth-1);
  rotation++;
  recursivPeano(depth-1);
   
}

int main(int argc, const char *argv[]){
  //todo: normierung und farbe!
  totalLength=atoi(argv[1]);
  sdlInit();
  sdlSetBlack();

  printf("%d", totalLength);
  
  recursivPeano(totalLength);

  sdlUpdate();
  sdlMilliSleep(3000);
  sdlExit();
  sdlExit();

}
