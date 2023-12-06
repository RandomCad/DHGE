#include "KuscheSolve.h"
#include "object.h"

#ifdef STD_OUT_SELV
#include <iostream>
#endif

#define used ruck

static unsigned int reCount = 0;
extern rucksack best;
rucksack used;

void recursionTry(int i);

unsigned int MainCall(){
  #if defined(DEBUG) && defined(STD_OUT_SELV)
    std::cerr << "Start with the Kusche Main" << std::endl;
  #endif
  
  best=rucksack();
  used=rucksack();
  reCount = 0;
  recursionTry(0);
  #ifdef STD_OUT_SELV
    std::cout << best;
  #endif
  return reCount;
}

void recursionTry(int i){
  #if defined(DEBUG) && defined(STD_OUT_SELV)
    std::cerr << "start withe the recursion " << i << std::endl;
  #endif
  reCount++;
  if(i == objLen){
    if(used.value > best.value) best = used;
    return;
  }
  if(ruck.value + obj[i].prizToVol * (MaxVolume - ruck.totalVol) < best.value) return;
  #if defined(DEBUG) && defined(STD_OUT_SELV)
    std::cerr << MaxVolume << ">=" << ruck.totalVol << '+' << obj[i].volume << std::endl;
  #endif
  if(MaxVolume >= ruck.totalVol + obj[i].volume){
    #if defined(DEBUG) && defined(STD_OUT_SELV)
      std::cerr << "put obj " << i << " in the rucksacke" << std::endl;
    #endif
    used.push(obj[i]);
    recursionTry(i + 1);
    used.pop();
  }
  #if defined(DEBUG) && defined(STD_OUT_SELV)
    std::cerr <<  "don't put obj " << i << " in the rucksack" << std::endl;
  #endif
  
  recursionTry(i + 1);
}
