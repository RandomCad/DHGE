#include "SDL/sdlinterf.h"

#include <cstdlib>
#include <iostream>

using namespace std;

const int maxSize=20;
const int maxSpeed=5;

class Color{
  public:
    //is the standar and not standart Ctor
    //Colot ist standard a black (0,0,0) color
    Color(int r=0,int g=0,int b=0) : mR(r), mG(g), mB(b) { }

    int getR() const { return mR; }
    int getG() const { return mG; }
    int getB() const { return mB; }

  private:
    int mR,mG,mB;
};

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

class Rect{
  public:
    //use a Initialisation list:
    Rect(const Color &color, int x, int y, int bx, int by, int sx = 0, int sy = 0) : mRGB(color), mX(x),  mY(y), mSX(sx), mSY(sy), mBX(bx), mBY(by){
      draw();
    }
    ~Rect() { undraw(); }

    Color getColor() const { return mRGB; } 
    int getX() const { return mX; }
    int getY() const { return mY; }
    int getSX() const { return mSX; }
    int getSY() const { return mSY; }
    int getBX() const { return mBX; }
    int getBY() const { return mBY; }

    void setColor(const Color &color){
      mRGB = color;
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

    void draw();
    void undraw();

  private:
    Color mRGB;
    int mX, mY;
    int mSX, mSY;
    int mBX, mBY;
};

int main(int argc,const char *argv[]){
  sdlInit();
  srand(time(nullptr)); 
  {
    Rect p(Color(255,255,255), SDL_X_SIZE/2,SDL_Y_SIZE/2,5,4,2,1);
    p.randomize();
    for(;;){
      sdlMilliSleep(20);
      p.fly(true);
      if(p.getBX()<1||p.getBY()<1){
        p.randomize();
        cerr<<p.getX()<<' '<<p.getY()<<' '<<p.getSX()<<' '<<p.getSY()<<' '<<p.getBX()<<' '<<p.getBY()<<endl;
      }

      sdlUpdate();
    }
  }

  sdlExit();

  return 0;
}

void Rect::setPos(int x, int y){
  undraw();
  mX=x;
  mY=y;
  draw();
}

void Rect::setSize(int bx, int by){
  undraw();
  mBX=bx;
  mBY=by;
  draw();
}

int Rect::Scal(int scalX, int scalY){
  if(scalX<0||scalY<0) return -1;
  setSize((mBX*scalX)/100, (mBY*scalY)/100);
  return 0;
}

void Rect::randomize(){
  undraw();
  mX=SDL_X_SIZE/2;
  mY=SDL_Y_SIZE/2;
  int zwi=rand()%(maxSpeed*2) - maxSpeed;
  mSX=(zwi<=0) ? zwi-1:zwi;
  zwi=rand()%(maxSpeed*2) - maxSpeed;
  mSY=(zwi<=0) ? zwi-1:zwi;
  mBX=rand()%maxSize;
  mBY=rand()%maxSize;
}

bool Rect::fly(bool bounce, bool schrink)
{
  bool ret = true;
  // Die Ursprungs-Koordinaten (0/0) des SDL-Fensters sind links oben
  // ==> x wächst nach rechts von 0 bis SDL_X_SIZE - 1
  // ==> y wächst nach unten von 0 bis SDL_Y_SIZE - 1
  // Prüfung auf Rand in waagrechter Richtung (x-Richtung): Rand, wenn ...
  // ... der Punkt nach rechts fliegt (mSX > 0) 
  //     und weniger als mSX vom rechten Rand (SDL_X_SIZE) entfernt ist
  // ... oder der Punkt nach links fliegt (mSX < 0)
  //     und weniger als mSX (-mSX weil mSX < 0) vom linken Rand (0) weg ist
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
  // dieselbe Prüfung für die y-Position des Punktes:
  // fliegt nach unten ==> mindestens mSY Abstand vom unteren Rand (SDL_Y_SIZE)
  // fliegt nach oben ==> mindestens -mSY Abstand vom oberen Rand (0)
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

void Rect::draw()
{
  // Zeichne für das eigene Punkt-Objekt ein Pixel im Grafik-Fenster:
  // * Die Koordinaten sind die,
  //   die im eigenen Punkt-Objekt als Member gespeichert sind.
  // * Die Farb-Werte bekommt man, indem man aus dem eigenen Farb-Member mRGB
  //   (einem Objekt!) dessen rot / grün / blau-Werte mittels get-Methode liest
  //   (weil der direkte Zugriff auf die Farb-Member nicht erlaubt ist)
  sdlDrawRect(mX, mY, mBX, mBY, mRGB.getR(), mRGB.getG(), mRGB.getB());
}

void Rect::undraw()
{
  // Weglöschen: Zeichne an der aktuellen eigenen Position ein schwarzes Pixel.
  sdlDrawRect(mX, mY, mBX, mBY, 0, 0, 0);
}

void Point::setPos(int x, int y){
  undraw();
  mX=x;
  mY=y;
  draw();
}

bool Point::fly(bool bounce)
{
  bool ret = true;
  // Die Ursprungs-Koordinaten (0/0) des SDL-Fensters sind links oben
  // ==> x wächst nach rechts von 0 bis SDL_X_SIZE - 1
  // ==> y wächst nach unten von 0 bis SDL_Y_SIZE - 1
  // Prüfung auf Rand in waagrechter Richtung (x-Richtung): Rand, wenn ...
  // ... der Punkt nach rechts fliegt (mSX > 0) 
  //     und weniger als mSX vom rechten Rand (SDL_X_SIZE) entfernt ist
  // ... oder der Punkt nach links fliegt (mSX < 0)
  //     und weniger als mSX (-mSX weil mSX < 0) vom linken Rand (0) weg ist
  if (((mSX > 0) && (mX >= SDL_X_SIZE - mSX)) ||
      ((mSX < 0) && (mX < -mSX))) {
    // Punkt würde in x-Richtung rausfliegen
    if (bounce) {
      // Vorzeichen der x-Richtung umdrehen ==> Punkt fliegt in Gegenrichtung
      mSX = -mSX;
      ret = false;
    }
    else {
      // nicht fliegen!
      return false;
    }
  }
  // dieselbe Prüfung für die y-Position des Punktes:
  // fliegt nach unten ==> mindestens mSY Abstand vom unteren Rand (SDL_Y_SIZE)
  // fliegt nach oben ==> mindestens -mSY Abstand vom oberen Rand (0)
  if (((mSY > 0) && (mY >= SDL_Y_SIZE - mSY)) ||
      ((mSY < 0) && (mY < -mSY))) {
    if (bounce) {
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

void Point::draw()
{
  // Zeichne für das eigene Punkt-Objekt ein Pixel im Grafik-Fenster:
  // * Die Koordinaten sind die,
  //   die im eigenen Punkt-Objekt als Member gespeichert sind.
  // * Die Farb-Werte bekommt man, indem man aus dem eigenen Farb-Member mRGB
  //   (einem Objekt!) dessen rot / grün / blau-Werte mittels get-Methode liest
  //   (weil der direkte Zugriff auf die Farb-Member nicht erlaubt ist)
  sdlDrawPoint(mX, mY, mRGB.getR(), mRGB.getG(), mRGB.getB());
}

void Point::undraw()
{
  // Weglöschen: Zeichne an der aktuellen eigenen Position ein schwarzes Pixel.
  sdlDrawPoint(mX, mY, 0, 0, 0);
}
