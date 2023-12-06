#ifndef ARR
#define ARR

template<typename K>
class Arr{
  public:
    Arr(int len) : arr(new K[len]), length(0), maxLength(len) {}
    ~Arr(){
      delete []arr;
    }

    bool AddEl(const K &a){
      if(length==maxLength) return false;
      arr[length++]=a;
      return true;
    }

    K &First() const { return arr[0]; }
    K *Smalest() const {
      if(length==0) return nullptr;
      K *ret = arr;
      for(K *i=arr + 1;i-arr<length; i++) if(*i<*ret) ret = i;
      return ret;
    }
    K *NextSmalest(const K* const a) const {
      K *ret = nullptr;
      for(K *i=arr;i-arr<length;i++) if(*a<*i) ret = (ret == nullptr) ? i : (*i<*ret) ? i : ret;
      return ret;
    }
  private:
    K *arr;
    int length;
    int maxLength;
    const int Start_Len = 16;
};

#endif
