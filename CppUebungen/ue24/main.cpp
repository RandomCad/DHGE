#include <iostream>

#include <cstring>

template<typename T>
T *moustCommon(T *arr, int len, T &err, int *retAmount);

int main( int argc, const char *argv[]){
  int *arr = new int[argc];
  int *zwi=arr;
  for(const char **i=argv;*i;i++,zwi++) *zwi=std::strlen(*i);
  int error=0;
  int *out=nullptr;
  int *len = moustCommon(arr,argc,error,out);
  //std::cerr << "End of Template\nReturn ist:" << len << ' ' << *len << std::endl << "arr" << arr + 1 << std::endl;
  std::cout << *len << std::endl;
}

template<typename T>
T *moustCommon(T *arr, int len, T &err, int *retAmount){
  //std::cerr << "Template Start" << std::endl;
  
  if(len <= 0) return &err;
  T **knowen=new T*[len]; //is a arr of Pointer witch points in the main arr
  int *amount=new int[len];
  int max=0;
  knowen[0]=nullptr;
  //std::cerr << "Initialisation finnished!" << std::endl << "Values: " << std::endl << "knowen" << knowen << ' ' << *knowen << std::endl << "amount: " << amount << std::endl << "max: " << max << std::endl;

  for(T *i = arr;i-arr<len;i++){
    //std::cerr << "Lope Start" << i-arr << std::endl;
    for(T **j=knowen;*j;j++){
      if(**j==*i){
        amount[j-knowen]++;
        goto outerForEnd;
      }
    }
    knowen[max++]=i;
    knowen[max]=nullptr;
    outerForEnd:;
  }

  //std::cerr << "Main template loop fhinished" << std::endl;
  T *ret = *knowen;
  retAmount = amount;//retAmount ist ein eifacher Pointer wohingegen amount ein arr ist.
  int *j=amount;//j soll durch amount wandern
  for(T **i=knowen;*i;i++,j++){
    //std::cerr << "Second loop pasethrow " << i-knowen << std::endl;
    if(*retAmount<*j){
      retAmount = j;
      ret = *i;
    }
  }
  //std::cerr << "start" << std::endl;
  return ret;
}
