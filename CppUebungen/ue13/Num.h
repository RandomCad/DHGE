#ifndef NUM
#define NUM

#include <cstddef>
#include <type_traits>
#include <ostream>
#include <iostream>

#ifdef DEBUG
#include <iostream>
#endif

template<typename N>
concept NumberConc = requires(N a,N b){
  a + b;
  a - b;
  a * b;
  a * a;
  a / b;
  a = b;
  -a;
} && std::is_constructible<N,int>::value ; 

template<NumberConc N, size_t StartLen = 16>
class Num;

template<NumberConc N>
std::ostream &operator<< (std::ostream &a,const Num<N> &b);


template<NumberConc N, size_t StartLen>
class Num{
  public:

    Num() : Number(N(0)),ArrSt(new N[StartLen]), Arr(ArrSt + StartLen - 1), Len(StartLen) {
      *Arr = 0;
    }
    Num(const N &a) : Number(a),ArrSt(new N[StartLen]), Arr(ArrSt + StartLen - 1), Len(StartLen) {
      *Arr = a;
    }
    Num(const Num<N> &a) : Number(a.Number), ArrSt(new N[a.Len]), Arr(this->ArrSt + a.Len - 1), Len(a.Len){
      for(N *i = a.ArrSt + a.Len - 1; i >=a.Arr; --i, --this->Arr) *this->Arr = *i;
      ++this->Arr;
    }

    ~Num(){
      delete []ArrSt;
      ArrSt = nullptr;
      Arr = nullptr;
      Len = 0;
    }

    N &getNum() { return Number; }

    Num operator+(const Num &a) {
      size_t len = this->Len;
      if(len < a.Len) len = a.Len;
      return Num(len * 2, this->Arr, a.Arr, this->ArrSt + this->Len -1, a.ArrSt + a.Len -1, this->Number + a.Number);
    }
    Num operator+(const N &a){
      Num<N> ret = Num<N>( (this->Arr == this->ArrSt) ? this->Len * 2 : this->Len, this->Arr, this->ArrSt + this->Len - 1, this->Number);
      *--(ret.Arr) = a;
      ret.Number = ret.Number + a;
      return ret;
    }

    Num operator-(const N &a){
      return *this + (-a);
    }
    Num operator-(){
      Num<N> ret(*this);
      for(N *i=ret.ArrSt + ret.Len - 1; i >= ret.Arr; --i) *i = -*i;
      ret.Number *= -1;
      return ret;
    }

    Num &operator=(const Num<N> &a){
      this->Number = a.Number;
      if(this->Len < a.Len){
        delete []this->ArrSt;
        //diden't set Arr to nullptr becous it schould sortly be set to the ende of the Arr
        this->ArrSt = new N[a.Len];
        this->Len = a.Len;
      }
      this->Arr = this->ArrSt +this->Len - 1;
      for(N *i = a.ArrSt +a.Len - 1; i >= a.Arr; --i, --this->Arr) *this->Arr = *i;
      ++this->Arr;
      return *this;
    }

    Num &operator+=(const N &a){
      if(this->ArrSt == this->Arr){
        *this &= this->Len * 2;
      }
      *--this->Arr = a;
      this->Number = this->Number + a;
      return *this;
    }

    Num &operator+=(const Num &a){
      if(this->Arr - this->ArrSt < a.Len -(a.Arr - a.ArrSt)){
        *this &= this->Len * 2;
        return *this += a;
      }
      for(N *i = a.ArrSt + a.Len -1; i >=a.Arr; --i) *--this->Arr = *i;
      this->Number = this->Number + a.Number;
      return *this;
    }

    friend std::ostream &operator<< <N> (std::ostream &a,const Num<N> &b);

  private:
    
    Num(size_t len, N *endA, N *endB, N *startA, N *startB,const N &num) : Num(len, endA, startA, num){
      for(;startB >= endB; --startB, --this->Arr) *this->Arr = *startB;
    }
    Num(size_t len, N *end, N *start,const N &num) : Number(num), ArrSt(new N[len]), Arr(this->ArrSt + len - 1), Len(len){
      for(;start >=end; --start, --this->Arr) *this->Arr = *start;
      ++this->Arr;
    }
    Num(const size_t len) :Number(N(0)), ArrSt(new N[len]), Arr(ArrSt + len -1), Len(len) { }

    N &operator=(int a){
      return N(a);
    }

    void operator&=(size_t a){
      N *zwiArrSt = this->ArrSt;
      this->ArrSt = new N[a];
      N *j = this->ArrSt + a - 1;
      for(N *i=zwiArrSt + Len - 1;j != this->Arr && i != this->Arr; --j, --i) *j = *i;
      this->Arr = j;
      this->Len = a;
      delete []zwiArrSt;
    }

    N Number;
    N *ArrSt;
    N *Arr;
    size_t Len;
};

template<NumberConc N>
std::ostream &operator<< (std::ostream &a,const Num<N> &b){
  a << "Value: " << b.Number << std::endl << "Created by: " << std::endl;
  for(N *i = b.ArrSt + b.Len -1; i >= b.Arr; --i) a << *i << " + ";
  a << std::endl;
  return a;
}

#endif
