#include <iostream>

#include <cstdlib>
#include <cstring>

bool recursion(int pos, int runCont, int addCount, const int serachNum);

const int numLen = 16, useNum[numLen] = { 9999, 4562, 3156, 1589, 1001, 923, 761, 252, 126, 97, 77, 66, 21, 12, 9, 7};
int bestCount = (-1u) >> 1u;
bool usedNum[numLen] = { 0 }, best[numLen] = { 0 };

int main(int argc, const char *argv[]){
  if(argc != 2){
    std::cerr << "Input moust be exactly wone Number!" << std::endl;
    return -1;
  }
  if(recursion(0,0,0,std::atoi(argv[1]))){
    std::cout << "Solution: ";
    for(int i=0;i<numLen; i++) if(best[i]) std::cout << useNum[i] << '+';
    std::cout << std::endl;
    return 0;
  }
  std::cout << "Ther isn't a solution" << std::endl;
}

bool recursion(int pos, int runCont, int addCont, const int searchNum){
  if(runCont + useNum[numLen -1] > searchNum || numLen == pos) return false;
  ++addCont;
  if(addCont >= bestCount) return false;
  
  bool ret = false;
  if(runCont + useNum[pos] <= searchNum){
    usedNum[pos] = true;
    runCont += useNum[pos];
    if(runCont == searchNum){
      for(bool *i = best, *j = usedNum; j - usedNum < numLen; ++i, ++j) *i = *j;
      bestCount = addCont;
      usedNum[pos] = false;
      return true;
    }
    ret = recursion(pos + 1, runCont, addCont, searchNum);
    runCont -= useNum[pos];
  }
  usedNum[pos] = false;
  --addCont;
  return (ret) ? recursion(pos + 1, runCont, addCont, searchNum), true : recursion(pos + 1, runCont, addCont, searchNum);
}
