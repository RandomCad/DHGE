#ifndef BACKPACK_ALGO
#define BACKPACK_ALGO

#include "object.h"

struct resStruct{
  backpack best;
  int recursCnt;
  int loopCnt;
  bool operator!= (const resStruct &a) const{
    return this->recursCnt == a.recursCnt && this->loopCnt == a.loopCnt;
  }
};

std::ostream &operator<< (std::ostream &a, resStruct &b);

void solveRecurs(int i, object *obj, int objLen, double MaxVolume, resStruct &a, backpack &used);
void solveLoop(int depth, object *obj, int objLen, double MaxVolume, resStruct &a, backpack &used);
void solveLoop();

#endif
