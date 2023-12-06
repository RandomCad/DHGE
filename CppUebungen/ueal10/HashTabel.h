#ifndef HASH_TABEL
#define HASH_TABEL

#define STAT_LEN 20

#include <ostream>
#include <iomanip>
#include <iostream>

template<typename N, typename K, unsigned int (*hashMeth) (unsigned int,K&) , int StartSize>
class HashTabel;

template<typename N, typename K, unsigned int (*hashMeth) (unsigned int,K&) = &K::getHash , int StartSize = 100001>
std::ostream &operator<<(std::ostream &a, const HashTabel<N,K,hashMeth,StartSize> &l);

template<typename N, typename K, unsigned int (*hashMeth) (unsigned int,K&) = &K::getHash , int StartSize = 100001>
class HashTabel{
  private:
    struct HashEl{
      K Hash;
      N Elem;
      struct HashEl *next;
      HashEl(K hash, N el) : Hash(hash), Elem(el), next(nullptr) { }
      //To remouv en allement it moust fully be dikopelt from the list!
      ~HashEl(){
        std::cerr << 4;
        delete next;
      }
    };
  public:
    HashTabel() : arr(new HashEl*[StartSize]), arrLen(StartSize)
    {
      for(HashEl **i=arr;i-arr<arrLen;i++) *i=nullptr;
    }
    ~HashTabel(){
      std::cerr<< "deconstruct";
      delete []arr;
    }

    void add(K &key,N &val){
      //std::cerr << std::endl << "start withe add: " << key << std::endl;
      unsigned int hash=(*hashMeth)(arrLen,key);
      //std::cerr << hash << std::endl;
      HashEl **i=&(arr[hash]);
      for(;*i;i=&(*i)->next) { }
      *i=new HashEl(key,val);
    }

    void Statistiks(){
      int stat[STAT_LEN] = { 0 };
      for(HashEl **i=arr;i-arr<arrLen;i++){
        int zwi = 0;
        for(HashEl *j=*i;j;j=j->next) { zwi++; }
        //std::cerr << zwi << std::endl;
        stat[(zwi<STAT_LEN) ? zwi : STAT_LEN-1]++;
      }
      for(int i=0;i<STAT_LEN;i++) std::cout << "List of Length" << std::setfill(' ') << std::setw(3) << i << " existet: " << std::setfill(' ') << std::setw(5) << stat[i] << std::endl;
    }
    
    friend std::ostream &operator<< <N,K,hashMeth,StartSize> (std::ostream &a, const HashTabel<N,K,hashMeth,StartSize> &l);
    
  private:
    HashEl **arr;
    unsigned int arrLen;
};

template<typename N, typename K, unsigned int (*hashMeth) (unsigned int,K&), int StartSize>
std::ostream &operator<<(std::ostream &a, const HashTabel<N,K,hashMeth,StartSize> &l){
  for(auto i=l.arr;i-l.arr<l.arrLen;i++){
    for(auto j=*i;j;j=j->next){
      a << "hash: "<< std::setfill(' ') << std::setw(10) << j->Hash << " Element: " << j->Elem << std::endl;
    }
  }
  return a;
}

#endif
