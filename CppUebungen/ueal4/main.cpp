#include "List.h"

#include <iostream>

int main(int argc, const char *argv[]){
  List<int> li;
  int num=0;
  while(!std::cin){
    std::cin >> num;
    li.add(num);
    std::cout << li << std::endl;
  }

}
