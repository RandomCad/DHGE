#ifndef LOSSE
#define LOSSE
#include <string>

class Losse{
  public:
    int losNum;
    std::string custemer;
    
    Losse(std::string custemerName) :losNum(nextLosNum), custemer(custemerName){
      nextLosNum++;
    }
    virtual ~Losse(){}

    virtual int wineRang() = 0;
    virtual void creatNewWinNum() = 0;

  private:
    static int nextLosNum;
};

#endif
