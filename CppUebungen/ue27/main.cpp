#include "counterClass.h"

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

int main(int argc, const char *argv[]){
  if(argc !=2) throw;

  std::ifstream in(argv[1]);
  if (!in) throw;

  CounterClass<char> charCounter;
  CounterClass<std::string> stringCounter;
  CounterClass<int> intCounter;
  std::string i;
  for(std::getline(in,i);in;std::getline(in,i)){
    std::cerr << "\nchar start" << std::endl;
    for(int j=0;j<i.length();j++) charCounter.count(i[j]);
    std::cerr << "pased char" << std::endl;
    std::stringstream j(i);
    for(;j;){
      std::string zwi;
      j >> zwi;
      std::cerr << "string" << std::endl;
      stringCounter.count(zwi);
      std::cerr << "int" << std::endl;
      intCounter.count((int)zwi.length());
    }
    std::cout << i << std::endl;
  }
  std::cout << charCounter << stringCounter << intCounter; 
}
