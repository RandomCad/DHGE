#include "Node.h"

#include <cstdlib>
#include <iostream>

int main(int argc, const char *argv[]){
  Node<int> root(std::atoi(argv[1]));
  for(const char **i=argv + 2;*i;++i){
    root.Add(std::atoi(*i));
  }

  Node<int> *i=&root;
  Node<int> **j=&i;
  std::cout << root.cont << ' ' << root.l << ' ' << root.l->l << std::endl;
  root.Help(j);
  std::cout << root.cont << ' ' << root.l << ' ' << root.l->l << std::endl;
}
