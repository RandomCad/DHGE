#include <iostream>
#include <random>
#include <chrono>

#include "Counter.h"

std::ostream &operator<<(std::ostream &a, Counter &b){
  for(int *i=b.Arr;i-b.Arr<b.Len;++i) a << i-b.Arr << ':' << *i << std::endl;
  return a;
}

int main(int argc, const char *argv[]){
  std::mt19937 randM(std::chrono::system_clock::now().time_since_epoch().count());
  Counter cou(49), cou2(49);
  int counter = 0;
  while(!(cou > 0)){ //is not equal to cou <= 0
    std::cerr << "Start while" << std::endl;
    ++counter;
    for(int i=0;i<6;++i){
      int rand = randM() % 49;
      if(!cou[rand]) ++cou[rand];
      ++cou2[rand];
    }
  }
  std::cout << cou2 << std::endl << counter << std::endl;
}
