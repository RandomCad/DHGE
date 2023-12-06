// Geom. Objekte: Vererbung und "clone"
// Implementierung der abgeleiteten Klasse "Rect"
//
// Klaus Kusche, 2020

#include "rect.h"

#include "../SDL/sdlinterf.h"

void Rect::draw()
{
  sdlDrawRect(mX, mY, mW, mH, mRGB.getR(), mRGB.getG(), mRGB.getB());
}

void Rect::undraw()
{
  sdlDrawRect(mX, mY, mW, mH, 0, 0, 0);
}
