#include "Stack.h"

#include <iostream>

int main(int argc, const char *argv[]){
  Stack<const char*> t;
  for(const char **i=&argv[1];*i;i++) t.Push(*i);
  while(!t) std::cout << t.Pop() << std::endl;
}
