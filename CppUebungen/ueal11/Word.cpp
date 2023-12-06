#include "Word.h"

#include <cstring>

bool Word::operator< (const Word &a) const{
  return std::strcmp(this->word, a.word) < 0;
}

bool Word::operator> (const Word &a) const{
  return !(*this<a);
}

bool Word::operator== (const Word &a) const{
  return std::strcmp(this->word, a.word) == 0;
}
