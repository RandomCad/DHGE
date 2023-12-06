#include "Losse.h"
#include "numberLosse.h"
#include "statisticNumLosse.h"

#include <cstdlib>

int Losse::nextLosNum=0;
int numLosse::winNum=0;

const int maxCounter = 10000;

int main(int argc, const char* argv[]){
  srand(time(nullptr));
  Losse *los1=new statisticNumLosse("Franz",1234567), *los2=new statisticNumLosse("Xzaver",6666666);
  std::cerr<<"start withe go throw"<<std::endl;
  for(int i=0;i<maxCounter;i++){
    los1->creatNewWinNum();
    los1->wineRang();
    los2->wineRang();
  }
  std::cerr<<"start delet"<<std::endl;
  delete los1;
  delete los2;

}
