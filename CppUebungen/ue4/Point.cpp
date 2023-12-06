#include "Point.h"
#include "../SDL/sdlinterf.h"

#include <cstdlib>

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
