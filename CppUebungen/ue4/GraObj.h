#ifndef GRA_OBJ_DEF
#define GRA_OBJ_DEF

#include "Color.h"
#include <iostream>

class GraObj{
  public:
    //use a Initialisation list:
    GraObj(const Color &color, int x, int y, int bx, int by, int sx = 0, int sy = 0) :
      mRGB(color), mX(x),  mY(y), mSX(sx), mSY(sy), mBX(bx), mBY(by)
    {
    }
    ~GraObj()
    {
    }

    Color getColor() const { return mRGB; } 
    int getX() const { return mX; }
    int getY() const { return mY; }
    int getSX() const { return mSX; }
    int getSY() const { return mSY; }
    int getBX() const { return mBX; }
    int getBY() const { return mBY; }

    void printLog(){
      std::cerr<<std::endl<<"LOG:"<<std::endl<<"X: "<<mX<<"Y: "<<mY<<std::endl<<"XS: "<<mSX<<"YS: "<<mSY<<std::endl<<"XB: "<<mBX<<"YB: "<<mBY<<std::endl;
    }

    void setColor(const Color &color){
      mRGB=color;
      draw();
    }

    void setSpeed(int sx, int sy){
      mSX=sx;mSY=sy;
    }

    void setPos(int x, int y);
    void setSize(int bx, int by);

    int Scal(int scalX, int scalY);
    void randomize();
    void move(int dx, int dy){
      setPos(mX+dx,mY+dy);
    }

    bool fly(bool bounc = false, bool schrink = true);

    virtual void draw() = 0;
    virtual void undraw() = 0;
    virtual GraObj* clon(GraObj &a) = 0;

  protected:
    Color mRGB;
    int mX, mY;
    int mSX, mSY;
    int mBX, mBY;
};
#else

#endif
