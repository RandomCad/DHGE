#include "Tree.h"
#include "Word.h"

#include <fstream>
#include <iostream>
#include <string>
#include <sstream>
#include <iomanip>

#include <string.h>


int main(int argc, const char *argv[]){
  if(argc<=1)throw;
  #ifdef DEBUG
  std::cerr << "start" << std::endl;
  #endif
  std::ifstream in;
  Tree<Word> tree;
  std::string i;
  for(const char **j=argv + 1 ;*j;j++){
    #ifdef DEBUG
    std::cerr << "Start new loop withe file: " << *j << std::endl;
    #endif
    in.open(*j);
    #ifdef DEBUG
    std::cerr << !in << std::endl;
    #endif
    int counter=0;
    //if(!strcmp(*j,"/usr/include/c++/11/bits/stl_deque.h")) tabel.Statistiks();
    for(std::getline(in,i);in;getline(in,i),counter++){
      std::stringstream str(i);
      for(int counter2=0;str >> i;counter2++){
        #ifdef DEBUG
        std::cerr << i << std::endl;
        #endif
        
        Word a(i.c_str(),*j,counter,counter2);

        #ifdef DEBUG
        std::cerr << "try to add main" << std::endl;
        #endif
        try{
          tree.add(a);
        }
        catch (typename Tree<Word, 1>::DoubleElementException &exp){
          exp.thrower->data.AddPlace(*j,counter,counter2);
          std::cerr << exp.what() << std::endl;
        }
      }
    }
    in.close();
  }

  #ifdef DEBUG
  std::cerr << std::endl << "start with the Ende PRint" << std::endl;
  #endif

  std::cout << tree;
  std::cout << std::endl << "Statistiks" << std::endl;
}
