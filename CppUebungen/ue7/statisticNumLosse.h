#ifndef STAT_NUM_LOS
#define STAT_NUM_LOS

#include "numberLosse.h"

#include <iostream>

class statisticNumLosse: public numLosse{
  public:
    statisticNumLosse(std::string custNam, int pickNum) : numLosse::numLosse(custNam,pickNum), cals(0){
      wins=new int[digiAmount + 1];
      for(int i=0;i<digiAmount + 1;i++) wins[i]=0;
    }
    virtual ~statisticNumLosse(){
      std::cout<<"The customer "<<custemer<<" hase the folowing Statistics"<<std::endl<<"Los number: "<<losNum<<std::endl<<"The picked number: "<<pickedNum<<std::endl;
      for(int i=0;i<digiAmount + 1;i++) std::cout<<"Number of corect digits: "<<i<<" wine chans: "<<wins[i]<<std::endl;
      delete wins;
    }

    virtual int wineRang(){
      int res = numLosse::wineRang();
      wins[res]++;
      return res;
    }

  private:
    int cals;
    int *wins; 
};

#endif
