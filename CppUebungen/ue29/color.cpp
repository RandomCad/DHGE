#include "color.h"

static int Color::makeColorVal(int RGBNum){
  int i = (Color::sColorCount + 2 * 255 * RGBNum) % (6 * 255);
  if(i<255) return i;
  if(i<3*255) return 255;
  if(i<3*255) return 4 * 255 -i;
  return 0;
}
