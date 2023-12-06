#ifndef POINT_DEF
#define POINT_DEF

#include "Color.h"

class Point{
  public:
    //use a Initialisation list:
    Point(const Color &color, int x, int y, int sx = 0, int sy = 0) : mRGB(color), mX(x), mY(y), mSX(sx), mSY(sy){
      draw();
    }
    ~Point() { undraw(); }

    Color getColor() const { return mRGB; } 
    int getX() const { return mX; }
    int getY() const { return mY; }
    int getSX() const { return mSX; }
    int getSY() const { return mSY; }

    void setColor(const Color &color){
      mRGB = color;
      draw();
    }

    void setSpeed(int sx, int sy){
      mSX=sx;mSY=sy;
    }

    void setPos(int x, int y);
    void move(int dx, int dy){
      setPos(mX+dx,mY+dy);
    }

    bool fly(bool bounc = false);

    void draw();
    void undraw();

  private:
    Color mRGB;
    int mX, mY;
    int mSX, mSY;
};
#else

#endif
