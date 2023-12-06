#include "Num.h"
#include <iostream>

int main(int argc, const char *argv[]){
  Num<double> a;
  std::cout << '1' << a;
  Num<double> b = Num<double>(1.5);
  std::cout << '2' << b << std::endl << (a + b) << std::endl;
  std::cout << '3' << a + 5 + (-7) << std::endl;
  a += 5;
  std::cout << '4' << a << std::endl;
  b += a;
  std::cout << '5' << b << std::endl;
}
