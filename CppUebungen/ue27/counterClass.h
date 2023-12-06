#ifndef COUNTER_CLASS
#define COUNTER_CLASS

#include <cstdlib>
#include <cstring>

#include <iostream>
#include <ostream>

template<typename N>
class CounterClass;

template<typename N>
std::ostream &operator<<(std::ostream &a, const CounterClass<N> &b);

template<typename N>
class CounterClass{
  public:
    CounterClass(int size = 16) : arr(new N[size]), arrAmount((int*)std::malloc(sizeof(int)*size)), len(0), maxLen(size) {}
    ~CounterClass(){
      delete []arr;
      std::free(arrAmount);
    }

    void count(const N &a);
    
    void print(){
      int *j=arrAmount;
      for(N *i=arr;i-arr<len;i++, j++) std::cout << *i << ' ' << *j << std::endl; 
    }

    friend std::ostream &operator<< <N>(std::ostream &a, const CounterClass<N> &b);


  private:
    N *arr;
    int *arrAmount;
    int len;
    int maxLen;
};
template<typename N>
void CounterClass<N>::count(const N &a){
  for(N *i=arr;i-arr<len;i++){
    if(*i==a){
      ++*(arrAmount+(i-arr));
      return;
    }
    else if(*i>a){//Sortiert einfügen:
     if(len==maxLen){
        N *zwi=new N[maxLen*2];
        //Sortiert Forderenteil eingeben
        N *k, *j;
        for(k=zwi,j=arr;j<i;j++,k++) *k=*j;
        for(j=i;j-arr<len;k++,j++) k[1]=*j;

        maxLen*=2;
        arrAmount = (int*)std::realloc(arrAmount,sizeof(int)*maxLen);
        for(int *b=arrAmount+len;b=arrAmount + (i-arr);b--) b[1]=*b;
        
        zwi[i-arr] = a;
        delete []arr;
        arr=zwi;
        len++;
        return;
      }
      else{//TODO add the sorter for the other case:
        
      }
    }
  }
  if(len==maxLen){
    N *zwi=new N[maxLen*2];
    for(N *i=zwi,*j=arr;j-arr<len;j++,i++) *i=*j;
    std::cerr << maxLen << std::endl;
    arrAmount = (int*)std::realloc(arrAmount,sizeof(int)*maxLen * 2);
    std::cerr << "pased realloc" << std::endl;
    maxLen*=2;
    delete []arr;
    std::cerr << "passed delet" << std::endl;
    arr=zwi;
  }
  arr[len] = a;
  arrAmount[len++] = 1;
}

template<typename N>
void CounterClass<N>::countOld(const N &a){
  for(N *i=arr;i-arr<len;i++){
    if(*i==a){
      ++*(arrAmount+(i-arr));
      return;
    }
  }
  if(len==maxLen){
    N *zwi=new N[maxLen*2];
    for(N *i=zwi,*j=arr;j-arr<len;j++,i++) *i=*j;
    std::cerr << maxLen << std::endl;
    arrAmount = (int*)std::realloc(arrAmount,sizeof(int)*maxLen * 2);
    std::cerr << "pased realloc" << std::endl;
    maxLen*=2;
    delete []arr;
    std::cerr << "passed delet" << std::endl;
    arr=zwi;
  }
  arr[len] = a;
  arrAmount[len++] = 1;
}

template<typename N>
std::ostream &operator<<(std::ostream &a, const CounterClass<N> &b){
  for(N *i=b.arr;i-b.arr<b.len;i++) a << *i << ' ' << *(b.arrAmount+(i-b.arr)) << std::endl;
  return a;
}



#endif
