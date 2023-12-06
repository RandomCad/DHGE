#ifndef STACK
#define STACK

#include <cstddef>

template<typename N>
class Stack{
  private:
    struct ListEl{
      N Data;
      struct ListEl *next;
    };

  public:
    Stack() : start(nullptr){}
    ~Stack(){
      delete start;
    }

    void Push(N &a){
      ListEl *zwi=new ListEl;
      zwi->Data=a;
      zwi->next=start;
      start=zwi;
    }

    N Pop(){
      if(!start) return NULL;
      N ret=start->Data;
      ListEl *zwi=start;
      start=start->next;
      delete zwi;
      return ret;
    }

    bool operator!() const { return start; }

  private:
    ListEl *start;

    };

#endif
