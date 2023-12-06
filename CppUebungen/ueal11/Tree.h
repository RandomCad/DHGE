#ifndef TREE
#define TREE

#include <ostream>
#include <exception>

#ifdef DEBUG
  #include <iostream>
#endif

template<typename N, int EXEPTION_SEVERATY>
class Tree;

template<typename N, int EXEP_SEV>
std::ostream &operator<<(std::ostream &a, const Tree<N,EXEP_SEV> &l);

template<typename N, int EXP_SEV>
std::ostream &operator<<(std::ostream &a, const typename Tree<N,EXP_SEV>::Node &l);
//Error Level:
//0: Info
//1: Warning
//2: Error
//3: FatalError
template<typename N, int EXEPTION_SEVERATY = 1>
class Tree{
  private:
    class Node{
      public:
        Node(N Data) : data(Data), left(nullptr), rigth(nullptr) { }
        
        ~Node(){
          delete left;
          delete rigth;
        }

        void add(N a);

        static N remouve(Node **a);

        N data;
        Node *left;
        Node *rigth;

        friend std::ostream &operator<< <N,EXEPTION_SEVERATY> (std::ostream &a, const Node &l);
      private:
        Node **findRemouvReplacement();
    };
  public:
    Tree() : root(nullptr) { }
    Tree(N Data) : root(new Node(Data)) { }

    void add(N Data){
      #ifdef DEBUG
      std::cerr << "start withe the add in the tree methode" << std::endl;
      #endif
      if(!root) root = new Node(Data);
      else root->add(Data);

      #ifdef DEBUG
      std::cerr << "ende withe the add" << std::endl;
      #endif
    }

    N &remouve(N &data){
      Node **toRemouve = FindElement(data);
      return Node::remouve(toRemouve);
    }

    friend std::ostream &operator<< <N,EXEPTION_SEVERATY> (std::ostream &a, const Tree<N,EXEPTION_SEVERATY> &l);

    friend std::ostream &operator<< <N> (std::ostream &a, const Tree<N> &l);
    class DoubleElementException : public std::exception{
      public:
        DoubleElementException(Node *a) : thrower(a) { } 
        virtual const char *what() const noexcept override{
          switch (EXEPTION_SEVERATY){
            case 0:
              return "Info:added a second element witch already exists.";
            case 1:
              return "Warning:added a second element witch already exists.";
            case 2:
              return "Error:added a second element witch already exists.";
            case 3:
              return "FatalError:added a second element witch already exists.";
          }
        }
        Node *thrower;
    };
  private:
    Node *root;

    Node **FindElement(N &a);
};

template<typename N, int EXEP_SEV>
void Tree<N,EXEP_SEV>::Node::add(N a){
  #ifdef DEBUG
  std::cerr << "start in the node with the add" << this << std::endl;
  #endif
  
  if(this->data<a){
    if(this->rigth==nullptr) this->rigth = new Node(a);
    else this->rigth->add(a);
  }
  else{
    if(this->data == a) throw Tree<N,EXEP_SEV>::DoubleElementException(this);
    else if(this->left==nullptr) this->left = new Node(a);
    else this->left->add(a);
  }
  #ifdef DEBUG
  std::cerr << "ende in the node with the add" << std::endl;
  #endif
  
}

template<typename N, int EXEP_SEV>
N Tree<N,EXEP_SEV>::Node::remouve(typename Tree<N,EXEP_SEV>::Node **a){

  //search the left
  typename Tree<N>::Node **replacement = *a->left;
  if(*replacement) for(;(*replacement)->rigth;replacement = &((*replacement)->rigth)) { }
  typename Tree<N>::Node *toReplaceWith = *replacement;
  *replacement=(*replacement)->left;
  toReplaceWith->left=(*a)->left;
  toReplaceWith->rigth=(*a)->rigth;
  *a->left=nullptr;
  *a->rigth=nullptr;
  N ret=*a->data;
  delete *a;
  *a=toReplaceWith;
  return ret;
}

template<typename N, int EXEP_SEV>
typename Tree<N,EXEP_SEV>::Node **Tree<N,EXEP_SEV>::Node::findRemouvReplacement(){
  //left:
  typename Tree<N,EXEP_SEV>::Node **ret = &(this->left);
  if(*ret!=nullptr) for(;(*ret)->rigth;ret=&(*ret)->rigth) { }
  else for(;(*ret)->left;ret=&(*ret)->left) {}
  return ret;

}

template<typename N, int EXEP_SEV>
typename Tree<N,EXEP_SEV>::Node **Tree<N,EXEP_SEV>::FindElement(N &a){
  typename Tree<N,EXEP_SEV>::Node **ret=&root;
  for(;(*ret)->data==a || *ret==nullptr;ret = &((*ret)->data>a ? (*ret)->left : (*ret)->rigth)){ }
  return ret;
}

template<typename N, int EXEP_SEV = 1>
std::ostream &operator<<(std::ostream &a, const Tree<N,EXEP_SEV> &l){
  //TODO: dosen't find the << operator
  return a << *l.root // /*Tree<N,EXEP_SEV>::Node::*/operator<< <N,EXEP_SEV> (a, *l.root);  
}

template<typename N, int EXEP_SEV = 1>
std::ostream &operator<<(std::ostream &a, const typename Tree<N,EXEP_SEV>::Node &l){
  if(l.eft) a << l.left;
  a << l.data;
  if(l.rigth) a << l.rigth;
  return a;
}

#endif
