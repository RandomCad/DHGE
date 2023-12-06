#ifndef ELIP_DEF
#define ELIP_DEF

#include "Color.h"
#include "GraObj.h"

class Elip: public GraObj{
  public:
    //use a Initialisation list:
    Elip(const Color &color, int x, int y, int bx, int by, int sx = 0, int sy = 0) :
      GraObj::GraObj(color, x,  y, sx, sy, bx, by)
      { 
        draw();
        //randomize();
      }

    ~Elip(){
      undraw();
    }

    void draw();
    void undraw();
    GraObj* clon(GraObj &a){
      return new Elip(a.getColor(),a.getX()+3*a.getSX(),a.getY()+3*a.getSY(),a.getSX(),a.getSY(),a.getBX(),a.getBY());
    }

};
#else

#endif
