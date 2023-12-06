#include "Arr.h"
#include "Paar.h"

#include <string>
#include <iostream>

int main(int argc, const char *argv[]){
  Arr<Paar<std::string,int>> arr(argc - 1);
  for(const char **i=argv+1;*i;i++) arr.AddEl(Paar(std::string(*i),(int)(i-argv)));
  for(Paar<std::string, int> *i =arr.Smalest();i!=nullptr;i=arr.NextSmalest(i)) std::cout <<  i->getKey() <<  ' ' << i->getVal() << std::endl;
}
