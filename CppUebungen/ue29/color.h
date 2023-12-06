// Geom. Objekte: Vererbung und "clone"
// Header für Klasse "Color"
// (.cpp-File für "Color" gibt es keinen,
// da es keinen Code außerhalb von "class" gibt)
//
// Klaus Kusche, 2020

#ifndef _COLOR_H
#define _COLOR_H

class Color
{
  public:
    Color(int r, int g, int b)  
    : mR(r), mG(g), mB(b)
    {}

    Color() : mR(makeColorVal(0)),mG(makeColorVal(1)),mB(makeColorVal(2)){
      sColorCount += ColorStep;


    }

    int getR() const { return mR; }
    int getG() const { return mG; }
    int getB() const { return mB; }

  private:   
    static int makeColorVal(int RGBNum){
      int i = (Color::sColorCount + 2 * 255 * RGBNum) % (6 * 255);
      if(i<255) return i;
      if(i<3*255) return 255;
      if(i<4*255) return 4 * 255 -i;
      return 0;
    }
    int mR, mG, mB;
    static int sColorCount;
    static const int ColorStep = 10;
};



#endif
