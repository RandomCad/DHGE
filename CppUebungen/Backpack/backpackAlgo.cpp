#include "backpackAlgo.h"
#include "object.h"

#ifdef DEBUG
#include <iostream>
#endif

void solveRecurs(int i, object *obj, int objLen, double MaxVolume, resStruct &a, backpack &used){
  #ifdef DEBUG
    std::cerr << "start withe the recursion " << i << std::endl;
  #endif
  
  a.recursCnt++;
  if(i == objLen){
    if(used.value > a.best.value) a.best = used;
    return;
  }
  if(used.value + obj[i].prizToVol * (MaxVolume - used.totalVol) < a.best.value) return;
  
  #if defined(DEBUG)
    std::cerr << MaxVolume << ">=" << used.totalVol << '+' << obj[i].volume << std::endl;
  #endif
  
  if(MaxVolume >= used.totalVol + obj[i].volume){
    
    #if defined(DEBUG)
      std::cerr << "put obj " << i << " in the rucksacke" << std::endl;
    #endif
    
    used.push(obj[i]);
    solveRecurs(i + 1, obj, objLen, MaxVolume, a, used);
    used.pop();
  }
  #if defined(DEBUG) && defined(STD_OUT_SELV)
    std::cerr <<  "don't put obj " << i << " in the rucksack" << std::endl;
  #endif
  
  solveRecurs(i + 1, obj, objLen, MaxVolume, a, used);
}

void solveLoop(int depth, object *obj, int objLen, double MaxVolume, resStruct &a, backpack &used){
  a.recursCnt++;  
  if (depth >= objLen){
    if(used.value > a.best.value) a.best = used;
    return;
  }

  #ifdef DEBUG
  std::cerr << "rucksack" << used.value << ' ' << used.totalVol << std::endl;
  #endif
  
  for(int i=depth; i < objLen; i++){
    a.loopCnt++;
    #ifdef DEBUG
    std::cerr << "rucksack" << used.value << ' ' << used.totalVol << std::endl;
    #endif
    
    if(used.totalVol + obj[i].volume > MaxVolume){
      if(used.value > a.best.value) a.best = used;
      continue;
    }

    if(used.value + obj[i].prizToVol * (MaxVolume - used.totalVol) < a.best.value) return;
    
    used.ruck.push(obj[i]);
    used.value += obj[i].prize;
    used.totalVol += obj[i].volume;
    
    #ifdef DEBUG
    std::cerr << "STat befor new recursion:" << used.value << ' ' << used.totalVol << std::endl;
    #endif

    solveRecurs(i + 1, obj, objLen, MaxVolume, a, used);
    
    #ifdef DEBUG
    std::cerr << "recursion return" << std::endl << std::endl;
    #endif
    used.ruck.pop();
    used.value -= obj[i].prize;
    used.totalVol -= obj[i].volume;
  }
}
