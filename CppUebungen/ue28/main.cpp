#include <iostream>
#include <fstream>
#include <map>
#include <sstream>

int main(int argc, const char *argv[]){
  std::ifstream in;
  std::string line;
  std::map<std::string, int> strMap;
  std::map<char,int> charMap;
  for(const char **i=argv + 1;*i;i++){
    #ifdef DEBUG
    std::cerr << std::endl << "Start ne file: " << *i << std::endl;
    #endif
    in.open(*i);
    if(!in) throw "Couldn't open the file";
    for (std::getline(in,line);in;std::getline(in,line)){
      std::stringstream str(line);
      while (str >> line){
        strMap[line]++;
        for(auto j=line.begin();j!=line.end();j++) charMap[*j]++;
      }
    }
  }
  #ifdef DEBUG
  std::cerr << "Start withe the putput" << std::endl;
  #endif
  for(auto i : strMap) std::cout << i.first << ' '<< i.second << std::endl;
  for(auto i : charMap) std::cout << i.first << ' '<< i.second << std::endl;
}
