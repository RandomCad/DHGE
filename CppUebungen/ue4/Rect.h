#ifndef RECT_DEF
#define RECT_DEF

#include "Color.h"
#include "GraObj.h"

class Rect: public GraObj{
  public:
    //use a Initialisation list:
    Rect(const Color &color, int x, int y, int bx, int by, int sx = 0, int sy = 0) :
      GraObj::GraObj(color, x,  y, sx, sy, bx, by)
      { 
        draw();
        //randomize();
      }

    ~Rect(){
      undraw();
    }

    void draw();
    void undraw();
    GraObj* clon(GraObj &a){
      return new Rect(a.getColor(),a.getX()+3*a.getSX(),a.getY()+3*a.getSY(),a.getSX(),a.getSY(),a.getBX(),a.getBY());
    }
};
#else

#endif
