#ifndef OBJECT
#define OBJECT

#include <ostream>
#include <stack>

extern double MaxVolume;

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





#ifdef KUSCHE
#pragma message "The standart Kusche objects are difined. Ther souldn't be an other initalisation of Obj."
  const object obj[17] = {
    object(0.5,1666,3332,"Goldring"),
    object(0.5,60,120,"Pass"),
    object(5,123.27,123.27/5,"Geldboerse"),
    object(13,260.50,260.5/13,"Brille"),
    object(1.5,20,20/1.5,"Karte"),
    object(3.5,40,40/3.5,"Regenjacke"),
    object(2.5,25,10,"Mueslieriegel"),
    object(0.5,5,10,"Klopapier"),
    object(49.5,459.99,459.99/49.5,"Kamera"),
    object(70,499.99,7.14271428,"Lapdepp"),
    object(7.5,40,40/7.5,"Sonnencreme"),
    object(10,50,5,"Messer"),
    object(0.1,0.5,5,"Taschentuch"),
    object(5,10,2,"Banana"),
    object(12,20,20/12.0,"Pulli"),
    object(30,30,1,"Saft"),
    object(10,5,.5,"Apfel")
  };

  const int objLen = 17;
  const double MAX_CONTENT = 221.1;

#else
#pragma message "KUSCHE is not defined therfor obj moust be initialisiert and fielled at a nother point"
  extern object *obj;
  extern int objLen;
  extern double MAX_CONTENT;
#endif

#endif
