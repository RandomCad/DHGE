#ifndef LIST
#define LIST

#include <ostream>
#include <iostream>

template<typename N>
class List;

template<typename N>
std::ostream &operator<<(std::ostream &a, const List<N> &l);


template<typename N>
class List{
  private:
    struct ListEl{
      N el;
      struct ListEl *next;
      ListEl(N &a) : el(a), next(nullptr) { }
    };
  public:
    List() : start(nullptr), ende(nullptr) {}
    List(N a) : start(new ListEl(a)), ende(start) { }
    ~List(){
      if(!start) return;
      for(ListEl *i=start, *j=start->next;i->next;i=j,j=j->next){
        delete i;
      }
    }

    void add(N &a){
      std::cerr << "start" << std::endl;
      for(auto i=&start;;i=&((*i)->next)){
        std::cerr << "loop" << i << ' ' << *i << std::endl;
        if(!*i){
          std::cerr << "addnew" << std::endl;
          *i=new ListEl;
          (*i)->el=a;
          (*i)->next=nullptr;
          return;
        }
        if((*i)->el>a){
          std::cerr << "addsort" << std::endl;
          auto zwi=new ListEl;
          zwi->el=a;
          zwi->next=*i;
          *i=zwi;
          return;
        }
      }
    }

    bool delet(N *a){
      for(ListEl **i=&start;*i;i=&(*i->next)){
        if(*i->el==a){
          ListEl *zwi=*i;
          *i=*i->next;
          delete zwi;
          return true;
        }
      }
      return false;
    }

    void append(N a){
      ende->next = new ListEl(a);
      ende=ende->next;
    }

    friend std::ostream &operator<< <N> (std::ostream &a, const List<N> &l);
  private:
    ListEl *start;
    ListEl *ende;
};

template<typename N>
std::ostream &operator<<(std::ostream &a, const List<N> &l){
  for(auto *i=l.start;i;i=i->next) a << i->el;
  return a;
}
#endif
