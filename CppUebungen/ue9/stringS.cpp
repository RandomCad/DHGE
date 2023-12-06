#include "stringS.h"

#include <cstdlib>
#include <cstring>
#include <iostream>

String String::operator+ (const String &a) const{
  String ret(a.length()+this->length());
  char *i=ret.str;
  memcpy(i,this->str,this->length()*sizeof(char));
  i += this->length();
  memcpy(i,a.str,a.length()*sizeof(char));
  return ret;
}

String &String::operator= (const String &a){
  if(this == &a) return *this;
  free(this->str);
  this->str = strdup(a.str);
  this->strend = this->str + (a.strend-a.str);
  return *this;
}

String &String::operator+= (const String &a){
  this->str = (char*)realloc(this->str,(this->length()+a.length())*sizeof(char));
  memcpy(this->strend,a.str,a.length()*sizeof(char));
  strend += a.length();
  return *this;
}

char &String::operator[] (const size_t i){
  if(i <= strend-str) return *(str + i);
  static char zero = '\n';
  return zero;
}

std::ostream &operator<< (std::ostream &o, const String &a){
  return o<<a.str;
}
