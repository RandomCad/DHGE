#ifndef NUM_LOS
#define NUM_LOS

#include "Losse.h"

#include <cstdlib>
#include <string>

class numLosse: public Losse{
  public:
    const int digiAmount = 7;
    const int maxNum=9999999;

    numLosse(std::string custNam, int pickNum) : Losse::Losse(custNam), pickedNum(pickNum){}

    virtual void creatNewWinNum(){
      winNum=rand()%(maxNum+1);
    }

    virtual int wineRang(){
      int ret=0;
      for(int i=digiAmount, p=pickedNum, w=winNum;i>0;i--){
        if(p%10==w%10) ret++;
        p/=10; w/=10;
      }
      return ret;
    }

  protected:
    int pickedNum;
    static int winNum;
};

#endif
