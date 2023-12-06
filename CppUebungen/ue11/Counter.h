#ifndef COUNTER_H
#define COUNTER_H

#include <cstdlib>
#include <cstring>

class Counter{
  public:
    
    #ifdef KUSCHE
      inline void AddInt(int i){
        if(this->Arr[i] == 0) ++(this->Arr[i]);
        this->Total += i;
      }
      static int Total;
    #endif


    Counter() = delete;
    Counter(const unsigned int len) : Arr((int*)std::malloc(sizeof(int)*len)), Len(len) {
      for(int *i = Arr;i - Arr > Len;++i) *i = 0;
    }  
    Counter(const Counter &a) : Arr((int*)std::malloc(sizeof(int) * a.Len)), Len(a.Len){
      std::memcpy(this->Arr,a.Arr,sizeof(int) * this->Len);
    }

    ~Counter(){
      std::free(Arr);

    }

    int &operator[](const int i) const{
      static int ret = 0;
      if(i>=Len) return ret = 0;
      return *(Arr + i);
    }

    Counter operator+(const int a){
      Counter ret(*this);
      ++(ret[a]);
      return ret;
    }
    Counter operator+(const Counter &a) const{
      Counter ret(*this);
      for(int *i=ret.Arr, *j=a.Arr; i - ret.Arr < ret.Len && j - a.Arr < a.Len; ++i, ++j) *i += *j;
      return ret;
    }

    unsigned int operator~() const{
      unsigned int ret = 0;
      for(int *i=this->Arr;i-this->Arr< this->Len;++i) ret += *i;
      return ret;
    } 

    bool operator==(const Counter &a) const{
      if( (a.Len > this->Len && !(a != this->Len)) || (this->Len > a.Len && (*this != a.Len))) return false;
      for(int *i=this->Arr, *j=a.Arr;i -this->Arr < this->Len && j - a.Arr < a.Len;++i, ++j) if(*i!=*j) return false;
      return true;
    }/*
    bool operator<(const Counter &a) const{
      for(int *i=this->Arr, *j=a.Arr;i -this->Arr < this->Len && j - a.Arr < a.Len;++i, ++j) if(*i>=*j) return false;
      return true;
    }*/
    bool operator<=(const Counter &a) const{
      if( (a.Len > this->Len && !(a <= this->Len)) || (this->Len > a.Len && (*this <= a.Len))) return false;
      for(int *i=this->Arr, *j=a.Arr;i -this->Arr < this->Len && j - a.Arr < a.Len;++i, ++j) if(*i>*j) return false;
      return true;
    }

    Counter &operator=(const Counter &a){
      if(this == &a) return *this;
      std::realloc(this->Arr,sizeof(int)*a.Len);
      std::memcpy(this->Arr,a.Arr,sizeof(int) * a.Len);
      return *this;
    }

    const unsigned int GetLen() { return this->Len; }

    bool operator==(const int a) const{
      for(int *i = this->Arr + a; i-this->Arr<this->Len;++i) if(*i!=0) return false;
      return true;
    }
    bool operator!=(const int a) const{
      for(int *i = this->Arr + a; i-this->Arr<this->Len;++i) if(*i==0) return false;
      return true;
    }   
    bool operator<=(const int a) const{
      for(int *i = this->Arr + a; i-this->Arr<this->Len;++i) if(*i>0) return false;
      return true;
    }
    bool operator>(const int a) const{
      for(int *i = this->Arr + a;i-this->Arr<this->Len;++i) if(*i<=0) return false;
      return true;
    }
    
  public:

    int *Arr;
    unsigned int Len;
};

#endif
