// Geom. Objekte: Vererbung und "clone"
// Header f�r abstrakte Basisklasse "GraObj"
//
// Klaus Kusche, 2020

#ifndef _GRAOBJ_H
#define _GRAOBJ_H

#include "color.h"
#include <list>

class GraObj
{
  public:
    GraObj(const Color &color, int x, int y, int w, int h,
          int sx = 0, int sy = 0)
    : mRGB(color), mX(x), mY(y), mW(w), mH(h), mSX(sx), mSY(sy)
    {
      // das "draw" muss in der abgeleiteten Klasse sein!
      list.push_front(this);
    }

    GraObj(const GraObj &a) : mRGB(Color()), mX(a.mX), mY(a.mY),mW(a.mW), mH(a.mH), mSX(a.mSX), mSY(a.mSY) {
      list.push_front(this);
    }
    
    // In diesem Beispiel reicht f�r GraObj der automatische Copy-Konstruktor:
    // - Die Kopie soll v�llig ident zum Original sein
    // - Das "draw" passiert in der abgeleiteten Klasse

    // Destruktor:
    // - Das "undraw" muss in der abgeleiteten Klasse sein
    //   Hier: Leerer Code, nicht kein Code!
    // - Virtuell machen, damit der Destruktor der abgeleiteten Klasse
    //   auch ausgef�hrt wird
    virtual ~GraObj() {
      for(auto &i : list) if(i==this) list.remove(i);
    }

    // clone liefert einen Pointer auf eine dynamisch angelegte Kopie
    // des Objektes, f�r das clone aufgerufen wird
    // in der abstrakten Basisklasse sollte clone nie ausgef�hrt werden
    // (da es keine Objekte einer abstrakten Klasse gibt)
    // ==> rein virtuell machen
    // ==> muss in jeder abgeleiteten Klasse
    //   mit der "richtigen" Kopie (Kreis oder Rechteck) �berschrieben werden
    virtual GraObj *clone() const = 0;

    Color getColor() const { return mRGB; }
    int getX() const { return mX; }
    int getY() const { return mY; }
    int getW() const { return mW; }
    int getH() const { return mH; }
    int getSX() const { return mSX; }
    int getSY() const { return mSY; }

    void setColor(const Color &color)
    {
      mRGB = color;
      draw();
    }

    void setSpeed(int sx, int sy)
    {
      mSX = sx; mSY = sy;
    }
    
    void setPos(int x, int y);
    void move(int dx, int dy);
    void setSize(int w, int h);
    void scale(int percentX, int percentY);

    bool fly(bool bounce = false);


    // ein GraObj kann man nicht zeichnen, nur ein Rect oder Circ
    // ==> rein virtuell machen
    // ==> muss in jeder abgeleiteten Klasse
    //   mit dem "richtigen" Zeichen (Kreis oder Rechteck) �berschrieben werden
    virtual void draw() = 0;
    virtual void undraw() = 0;
    static void drawAll(){
      for(auto &i : list) i->draw();
    }

    // nur zum Testen: Als "zeichne Mittelpunkt" implementiert
    // void draw();
    // void undraw();
  
  protected:
    Color mRGB;
    int mX, mY;
    int mW, mH;
    int mSX, mSY;
  private:
    static std::list<GraObj*> list;
};

#endif
