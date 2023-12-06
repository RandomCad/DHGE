#ifdef STAT

#include "main.h"
#include "object.h"
#include "KuscheSolve.h"

#include <chrono>

#ifdef LINEAR_STAT
#include <iostream>
#endif

double MaxVolume = 0;

#define INT_CALED_OBJ_CREAT
#ifndef KUSCHE
  object *obj;
  int objLen;
  double MAX_CONTENT;

  #ifdef INT_CALED_OBJ_CREAT
    void creatObj(int a);
  #endif
#endif



int main(int argc, const char *argv[]){
  #ifdef LINEAR_STAT
    #pragma message "LINEAR_STAT is compiling"
    #ifndef KUSCHE
      creatObj(atoi(argv[argc - 1]));
    #endif

    int counter = 0;
    int solvCounter = 0;
    int solvForCounter = 0;
    
    #ifdef PROZESS_INDICATOm
      auto t = std::chrono::high_resolution_clock::now();
    #endif
    
    for(double x =0.1;x<=MAX_CONTENT; x+=0.1){
      #ifdef PROZESS_INDICATOR
      if(counter >=100){
        counter = 0;
        std::cerr << x/MAX_CONTENT << " Seconds: " << std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now() - t).count() << std::endl;
        t = std::chrono::high_resolution_clock::now();
      }
      counter++;
      #endif
      auto timer = std::chrono::high_resolution_clock::now();
      psoidoMain(x,solvCounter,solvForCounter);
      auto end = std::chrono::high_resolution_clock::now();
      #ifndef STAT_OUT
        std::cout << std::setw(5) << x << " M: " << std::setw(6) << solvCounter << " L: " << std::setw(7) << solvForCounter << " V: " << solvCounter/(solvForCounter + 0.0);
      #else
        std::cout << x << ';' << solvCounter << ';' << solvForCounter << ';' << solvCounter/(solvForCounter + 0.0);
      #endif
      std::cout << ';' << std::chrono::duration_cast<std::chrono::nanoseconds>(end - timer).count() << std::endl;
    }
  #endif

  #ifdef RECURSIV_LIN_STAT

  #endif
}

#ifdef TRU_RANDOM
  #pragma message "Trulie random obj are created"
  #ifdef LIN_RAND
    #error LIN_RAND and TRU_RAND is sett only wone is exeptabel
  #endif

  #include <random>
  #include <algorithm>

  void creatObj(int Amount){
    #ifndef UPPERMOUND_MATHE
      int UpperBound = Amount;
    #endif
    std::mt19937 randM (std::chrono::system_clock::now().time_since_epoch().count());
    objLen=Amount;
    obj = new object[Amount];
    for(object *i=obj; i-obj<Amount;i++){
      double prix = (randM() % (UpperBound * 10))/100.0;
      double vol = (randM() % (UpperBound * 10))/100.0;
      *i=object(vol,prix,prix/vol,"");
      MAX_CONTENT += vol;
    }
    for(object *i=obj;i-obj<objLen;i++){
      for(object *j=obj + objLen - 1;j!=i;j--){
        if((j-1)->prizToVol < j->prizToVol) std::swap(*j,*i);
      }
    }
  }
#endif

#ifdef LIN_RAND
  #pragma message "Objectes are Created withe Linear Randomnes."
  #ifdef TRU_RAND
    #error LIN_RAND and TRU_RAND is sett only wone is exeptabel
  #endif
  #include <random>
  #include <algorithm>

  const double stepDist = 10;
  const unsigned Seed = 0;
  
  void creatObj(int Amount){

    #ifdef DEBUG
      std::cerr << "Start creation of: " << Amount << " objects" << std::endl;
    #endif

    #ifndef UPPERMOUND_MATHE
      int UpperBound = Amount;
    #endif
    
    std::mt19937 randM(Seed);

    std::uniform_real_distribution<double> unif(-stepDist,stepDist);
      
    objLen=Amount;
    obj = new object[Amount];
    double counter = stepDist;
    for(object *i=obj; i-obj<Amount;i++){
      double prix = (randM() % (UpperBound * 10))/100.0;
      double vol = counter += unif(randM);
      *i=object(vol,prix,prix/vol,"");
      MAX_CONTENT += vol;
    }
    for(object *i=obj;i-obj<objLen;i++){
      for(object *j=obj + objLen - 1;j!=i;j--){
        if((j-1)->prizToVol < j->prizToVol) std::swap(*j,*i);
      }
    }
  }
#endif

    
#ifdef LIN_RANDOM
  #ifdef TRU_RANDOM
    #error To obj creation methodes set. Only wone is permitted.
  #endif
#endif

#endif
