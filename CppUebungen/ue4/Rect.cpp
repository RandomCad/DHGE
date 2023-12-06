#include "Rect.h"
#include "../SDL/sdlinterf.h"

#include <cstdlib>

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
