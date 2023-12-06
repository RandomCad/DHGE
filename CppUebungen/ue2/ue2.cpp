#include <algorithm>
#include <iostream>
#include <iterator>
#include <list>

using namespace std;

struct Number{
  int num;
  int amount;
};

bool NumberComp(const Number &a,const Number &b);

int main(int argc,const char *argv[]){
  std::list<Number> list={};
  for(const char **i=argv+1;*i;i++){
    int number=atoi(*i);
    bool found=false;
    for(std::list<Number>::iterator i=list.begin();i!=list.end();i++){
      Number & s( *i);
      if(s.num==number){
        s.amount++;
        found=true;
      }
    }
    if(!found) list.push_back((Number){number,1});
  }
  list.sort(NumberComp);
  for(Number item:list) cout << item.num << ':' << item.amount << endl;
}

bool NumberComp(const Number &a,const Number &b){
  return a.num<b.num;
}
