#ifndef NODE
#define NODE

template<typename N>
class Node{
  public:
    Node(N a) : l(nullptr), r(nullptr), cont(a) { }
    ~Node(){
      delete l;
      delete r;
    }

    Node<N> *Add(const N &a){
      if(a == this->cont) throw;
      Node<N> *next;
      if(a < this->cont){
        if(l == nullptr) return l = new Node<N>(a);
        next = l;
      }
      else{
        if(r == nullptr) return r = new Node<N>(a);
        next = r;
      }
      return next->Add(a);
    }

    static void Help(Node<N> **a){
      if(!((*a)->l || (*a)->r)){
        delete *a;
        *a=nullptr;
        return;
      }
      if((*a)->l) (*a)->l->Help(&((*a)->l));
      if((*a)->r) (*a)->r->Help(&((*a)->r));
    }

    Node<N> *l;
    Node<N> *r;
    N cont;
};


#endif
