#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>
#include <random>
#include <chrono>
#include <forward_list>

template<typename N>
std::forward_list<N> mergsort(std::vector<N> in, auto start, auto ende);

int main(int argc, const char *argv[]){
  std::ifstream in;
  std::string line;
  std::vector<std::string> strVec;
  for(const char **i=argv + 1;*i;i++){
    #ifdef DEBUG
    std::cerr << std::endl << "Start ne file: " << *i << std::endl;
    #endif
    in.open(*i);
    if(!in) throw "Couldn't open the file";
    for (std::getline(in,line);in;std::getline(in,line)){
      std::stringstream str(line);
      while (str >> line){
        strVec.push_back(line);
      }
    }
    strVec.shrink_to_fit();
    std::mt19937 randM (std::chrono::system_clock::now().time_since_epoch().count());
    std::shuffle(strVec.begin(),strVec.end(),randM);
    std::cout << "Mixed Output" << std::endl;
    for(auto i : strVec) std::cout << i << std::endl;
    std::forward_list l = mergsort<std::string>(strVec, strVec.begin(), strVec.end());
    for(auto i : l) std::cout << i << std::endl;
  }

}

template<typename N>
std::forward_list<N> mergsort(std::vector<N> in, auto start, auto ende){
  #ifdef DEBUG
  std::cerr << "recursion" << start -in.begin() << ' ' <<ende - in.begin() << std::endl;
  #endif
  if(start + 1 == ende) return std::forward_list<N>( {*start} );
  std::forward_list<N> l1=mergsort<N>(in,start,start + (ende - start)/2);
  std::forward_list<N> l2=mergsort<N>(in,start + (ende - start)/2, ende);
  l1.merge(l2);
  return l1;
}
