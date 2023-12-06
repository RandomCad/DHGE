#include "Fraktion.h"

#include <cstdlib>

#include <iostream>

int main(int argc, const char *argv[]){
  if(argc<=1) exit(EXIT_FAILURE);
  Fract ret(argv[1]);
  std::cerr << ret << std::endl;
  for(const char **i=argv + 2;*i && *(i+1);i+=2){
    std::cerr << "Start new loop" << std::endl;
    switch (**i){
      case '+':
        ret += Fract(*(i + 1));
        std::cerr << ret << std::endl;
        break;
      case '-':
        ret -= Fract(*(i + 1));
        std::cerr << ret << std::endl;
        break;
      case '/':
        ret /= Fract(*(i + 1));
        std::cerr << ret << std::endl;
        break;
      case 'x':
        ret *= Fract(*(i + 1));
        std::cerr << ret << std::endl;
        break;
      default:
        break;
    }
  }
  std::cout<<ret<<std::endl;
}
