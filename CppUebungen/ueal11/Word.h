#ifndef WORD
#define WORD

#include "List.h"

#include <cstdlib>
#include <string.h>
#include <stdlib.h>

class Word{
  public:
    Word(const char *_word,const char *file,int line, int colum) : word(strdup(_word)), list(Placment(file,line,colum)) 
    { 
      #ifdef DEBUG
      printf("\ncreat new word\n\n");
      #endif
    }
    Word(Word &a) : word(strdup(a.word)), list(a.list) { }
    ~Word(){
      #ifdef DEBUG
      printf("free Obj, this: %p string: %p\n", this, word);
      #endif
      free(word);
    }
    bool operator< (const Word &a) const;
    bool operator> (const Word &a) const;
    bool operator== (const Word &a) const;

    void AddPlace(const char *file,int line,int colum){
      list.append(Placment(file,line,colum));
    }

  private:
    char *word;
    struct Placment{
      char *FileName;
      int Line;
      int Colum;
      Placment(const char *file,int line, int colum) : FileName(strdup(file)), Line(line), Colum(colum) { }
      ~Placment(){
        free(FileName);
      }
    };
    List<Placment> list;

};

#endif
