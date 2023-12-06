#ifndef PAAR
#define PAAR


template<typename K, typename N>
class Paar{
  public:
    Paar(){}
    Paar(K key,N val) : Key(key), Val(val) {} 
  
    K getKey() const { return Key; }
    N getVal() const { return Val; }

    bool operator<(K &a) const { return a<this->Key; }
    bool operator<(N &a) const { return a<this->Val; }
    bool operator<(Paar &a) const { return a.Key>this->Key; }
    bool operator==(K &a) const { return a==this->Key; }
    bool operator==(N &a) const { return a==this->Val; }
    bool operator==(Paar &a) const { return a.Key==this->Key; }
    
  private:
    K Key;
    N Val;
};

#endif
