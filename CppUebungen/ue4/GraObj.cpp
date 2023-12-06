#include "GraObj.h"
#include "../SDL/sdlinterf.h"

#include <cstdlib>

using namespace std;

const int maxSize=20;
const int maxSpeed=5;

void GraObj::setPos(int x, int y){
  undraw();
  mX=x;
  mY=y;
  draw();
}

void GraObj::setSize(int bx, int by){
  undraw();
  mBX=bx;
  mBY=by;
  draw();
}

int GraObj::Scal(int scalX, int scalY){
  if(scalX<0||scalY<0) return -1;
  setSize((mBX*scalX)/100, (mBY*scalY)/100);
  return 0;
}

void GraObj::randomize(){
  undraw();
  mX=SDL_X_SIZE/2;
  mY=SDL_Y_SIZE/2;
  int zwi=rand()%(maxSpeed*2) - maxSpeed + 1;
  mSX=(zwi<=0) ? zwi-1:zwi;
  zwi=rand()%(maxSpeed*2) - maxSpeed + 1;
  mSY=(zwi<=0) ? zwi-1:zwi;
  mBX=rand()%maxSize;
  mBY=rand()%maxSize;
}

bool GraObj::fly(bool bounce, bool schrink)
{
  bool ret = true;
  if (((mSX > 0) && (mX + mBX >= SDL_X_SIZE - mSX)) ||
      ((mSX < 0) && (mX - mBX < -mSX))) {
    // Punkt würde in x-Richtung rausfliegen
    if (bounce) {
      if(schrink) Scal(80,80);
      // Vorzeichen der x-Richtung umdrehen ==> Punkt fliegt in Gegenrichtung
      mSX = -mSX;
      ret = false;
    }
    else {
      // nicht fliegen!
      return false;
    }
  }
  if (((mSY > 0) && (mY + mBY >= SDL_Y_SIZE - mSY )) ||
      ((mSY < 0) && (mY - mBY < -mSY))) {
    if (bounce) {
      if(schrink) Scal(80,80);
      mSY = -mSY;
      ret = false;
    }
    else {
      return false;
    }
  }

  move(mSX, mSY);
  return ret;
}

