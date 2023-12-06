// standard Kompiling:
// g++ main.cpp -DKUSCHE

#include <iostream>
#include <stack>
#include <iomanip>
#include <ostream>

#include "object.h"
#include "main.h"

rucksack best;
static unsigned int solvCounter = 0;
static unsigned int solvForCounter = 0;

void solv(rucksack ruck, int depth);

std::ostream &operator<< (std::ostream &a, rucksack &b){
    a << b.value << ' ' << b.totalVol << ' ' << std::endl;
    for(;b.ruck.size() > 0; b.ruck.pop()) a << b.ruck.top().volume << ' ' << b.ruck.top().prize << ' ' << b.ruck.top().name << std::endl;
    return a;
}

#ifndef STAT
#pragma message "Klasikal main is beeing copiled ther souldent be a second main.\n the define STAT is therfor not defined."
double MaxVolume = 200;
int main(int argc,const char *argv[]){
  int _;
  psoidoMain(atof(argv[1]),_,_);
}
#endif

void psoidoMain(double x,int &solveCRet,int &solveFCRet){
  solvCounter = 0;
  solvForCounter = 0;
  MaxVolume = x;
  rucksack ruck;
  best = rucksack();
  solv(ruck, 0);

  #ifndef STAT
    std::cout << best;
    std::cout << "The solve methode was caled " << solvCounter << " Times." << std::endl;
    std::cout << "The solve loop passed " << solvForCounter << " Times." << std::endl;
    std::cout << "loop to recursion" << solvCounter/(solvForCounter + 0.0) << std::endl;
  
  #else
    solveCRet = solvCounter;
    solveFCRet = solvForCounter;
  #endif
}

void solv(rucksack ruck, int depth){
  solvCounter++;  
  #ifdef DEBUG
  #pragma message "DEBUG is defined. Debug information is beeing compield. It is alle outüutted to stderr"
  std::cerr << std::endl << "new recursion" << depth << ' ' << ruck.value << ' ' << ruck.totalVol << std::endl;
  std::cerr << "content" << std:: endl << ruck.value << ' ' << ruck.totalVol << ' ' << std::endl;
  for(auto a = ruck.ruck;!a.empty(); a.pop()) std::cerr << a.top().volume << ' ' << a.top().prize << ' ' << a.top().name << std::endl;
  #endif
  
  if (depth >= objLen){
    if(ruck.value > best.value) best = ruck;
    return;
  }

  #ifdef DEBUG
  std::cerr << "rucksack" << ruck.value << ' ' << ruck.totalVol << std::endl;
  #endif
  
  for(int i=depth; i < objLen; i++){
    solvForCounter++;
    #ifdef DEBUG
    std::cerr << "rucksack" << ruck.value << ' ' << ruck.totalVol << std::endl;
    #endif
    
    if(ruck.totalVol + obj[i].volume > MaxVolume){
      if(ruck.value > best.value) best = ruck;
      continue;
    }

    if(ruck.value + obj[i].prizToVol * (MaxVolume - ruck.totalVol) < best.value) return;
    
    #ifdef DEBUG
    std::cerr << "RuckVal:" << ruck.value << "RockVol:" << ruck.totalVol << ' ' << obj[i].name << ' ' << obj[i].prize << ' ' << obj[i].volume << std::endl;
    #endif

    ruck.ruck.push(obj[i]);
    ruck.value += obj[i].prize;
    ruck.totalVol += obj[i].volume;
    
    #ifdef DEBUG
    std::cerr << "STat befor new recursion:" << ruck.value << ' ' << ruck.totalVol << std::endl;
    #endif

    solv(ruck,i + 1);
    
    #ifdef DEBUG
    std::cerr << "recursion return" << std::endl << std::endl;
    #endif
    ruck.ruck.pop();
    ruck.value -= obj[i].prize;
    ruck.totalVol -= obj[i].volume;
  }
}

