#include "Fraktion.h"

#include <cstdlib>
#include <iostream>

Fract::Fract(const char *in):num(0),den(1){
  char *lastEl = nullptr;
  int zwi=strtol(in,&lastEl,10);
  num=zwi;
  if(*lastEl=='/'){
    den = atoi(++lastEl);
  }
  shorten();
}

void Fract::shorten(){
  //TODO add the unexeptabel verhalten;
  int a = abs(this->num);
  for(int b = abs(this->den), h=0;b;h=a%b,a=b,b=h){}
  if(this->den<0) *this /= -a;
  else *this /= a;
}

std::ostream &operator<< (std::ostream &o,const Fract &a){
  return (a.den == 1) ? o<<a.num<<' '<<double(a) : o<<a.num<<'/'<<a.den<<' '<<double(a);
} 
