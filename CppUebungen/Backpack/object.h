#ifndef OBJECT
#define OBJECT

#include <stack>
#include <ostream>

#define rucksack backpack


class rucksack;
std::ostream &operator<< (std::ostream &a, rucksack &b);

struct object{
  object(double vol, double pri, double priToVo,const char *nam) : volume(vol), prize(pri), prizToVol(priToVo), name(nam) { }
  object() {}

  double volume;
  double prize;
  double prizToVol;
  const char *name;
};

class rucksack{
  public:
    rucksack() : value(-1), totalVol(0) { }

    void push(const object &a){
      this->ruck.push(a);
      this->value += a.prize;
      this->totalVol+=a.volume;
    }

    void pop(){
      this->value -= ruck.top().prize;
      this->totalVol -= ruck.top().volume;
      this->ruck.pop();
    }

    std::stack<object> ruck;
    double value;
    double totalVol;

    friend std::ostream &operator<< (std::ostream &a, rucksack &b);
  private:
    
};

#undef rucksack

#endif
