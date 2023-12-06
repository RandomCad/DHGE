//This is the test for a Backpack Problem.

#include <random>
#include <algorithm>
#include <chrono>
#include <fstream>
#include <iostream>
#include <cstring>
#include <thread>
#include <queue>
#include <atomic>
#include <sstream>

#include "object.h"
#include "backpackAlgo.h"

const int MAX_OBJ = 100;

void execThread();
object* creatObjTruRand(int Amount, std::mt19937 randM, int &maxBackpackVol);
object* creatObjLinRand(int Amount, std::mt19937 randM, int &maxBackpackVol);
std::chrono::time_point<std::chrono::high_resolution_clock> getHigResTime();

//is false if not blocked!
std::atomic_bool queueLock = false;
const double STEP_DIST = 0.1;

struct execContext{
  execContext(int a, int b)  : objAmount(a), seed(b) {}
  int objAmount;
  unsigned int seed;
  const double STEP_DIST = 0.1f;
};

std::queue<execContext> execList;

int main(int argc, const char *argv[]){
  if(argc < 2){
    std::cout << "The programm moust start with atleast won parameter.\nCall as folowed: programmName MaxCPUUsage" << std::endl;
    return -1;
  }
  float MaxCpuUse = float(std::atoi(argv[1]))/100;
  std::ifstream cpuStream("/proc/cpuinfo",std::ifstream::in);
  char readBuf[1024];
  int cpuNum = 0;
  for(cpuStream.getline(readBuf,1024); cpuStream; cpuStream.getline(readBuf,1024)){
    if(std::strlen(readBuf) == 0) cpuNum++;
  }
  int threadCount = cpuNum * MaxCpuUse;
  std::cout << "The coputer has a maximum of " << cpuNum << " cores.\nThe program will run with " << threadCount << " paralel Thread.\nThere exists an extra menaging thread." << std::endl;
  std::thread **threads = new std::thread*[threadCount];
  for(int i = 0; i < threadCount; ++i){
    threads[i] = new std::thread(execThread);
  }
  
  int objAmount = 1, seed = 0;

  while(true){
    if(execList.size() < 100){
      std::cout << "\nCreating new work.\nobjAmount: " << objAmount << "\nSeed: " << seed << std::endl;
    while (queueLock.exchange(true)){
      #ifdef DEBUG
      std::cout << "Lock is used! In creation." << std::endl;
      #endif
      queueLock.wait(false);
    }

      for(int i = 0; i < 20; ++i){
        execList.push(execContext(objAmount++,seed));
        if(objAmount > MAX_OBJ){
          ++seed;
          objAmount = 1;
        }
      }
      queueLock = false;
      queueLock.notify_one();
      continue;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(execList.front().objAmount * 10));
  }

}

#pragma GCC push_options
#pragma GCC optimize("O0")
std::chrono::time_point<std::chrono::high_resolution_clock> getHigResTime(){
  return std::chrono::high_resolution_clock::now();
}
#pragma GCC pop_options

void execThread(){
  std::cout << std::endl << "New execution thread was created.\nStarting operation." << std::endl;
  std::chrono::time_point<std::chrono::high_resolution_clock> startTime = getHigResTime(); 
  std::chrono::time_point<std::chrono::high_resolution_clock> endeTime = getHigResTime(); 
  while(true){
    if(execList.size() == 0){
      std::cout << "Now content in the exec queue. Retry for new Job in 100ms" << std::endl;
      std::this_thread::sleep_for(std::chrono::milliseconds(100));
      continue;
    }
    while (queueLock.exchange(true)){
      #ifdef DEBUG
      std::cout << "Lock is used!" << std::endl;
      #endif
      queueLock.wait(false);
    }
    execContext newJob = execList.front();
    execList.pop();
    queueLock = false;
    queueLock.notify_one();
    

    std::stringstream newFile;
    //creation of Random
    std::mt19937 rand(newJob.seed);
    int maxVol = 0;
    
    //Tru random test:
    object *truRandObj = creatObjTruRand(newJob.objAmount, rand, maxVol);
    for(double backpackVol = STEP_DIST;backpackVol < maxVol; backpackVol += STEP_DIST){
      resStruct recRes, loopRes;
      backpack recUse, loopUse;
      startTime = getHigResTime();
      solveRecurs(0,truRandObj, newJob.objAmount,backpackVol,recRes,recUse);
      endeTime = getHigResTime();
      newFile << std::chrono::duration_cast<std::chrono::microseconds>(endeTime - startTime).count() << ';';
      
      //TODO find error in the solver!

      startTime = getHigResTime();
      solveRecurs(0,truRandObj, newJob.objAmount,backpackVol,loopRes,loopUse);
      endeTime = getHigResTime();
      newFile << std::chrono::duration_cast<std::chrono::microseconds>(endeTime - startTime).count() << ';';
      if(loopRes != recRes) std::cerr << "Ther were diverent calculation\nrecRes:\n" << recUse << "loopRes:\n" << loopUse << std::endl;
    }
    
    delete []truRandObj;

    //Linear Rand:
    object *linRandObj = creatObjLinRand(newJob.objAmount, rand,maxVol);
    startTime = getHigResTime();
    
    endeTime = getHigResTime();

    delete []linRandObj;

    std::this_thread::sleep_for(std::chrono::milliseconds(100));
  }
}




//returns newly created Objects thy moust be deleted!
object* creatObjTruRand(int Amount, std::mt19937 randM, int &maxBackpackVol){
  int UpperBound = Amount;
  object *obj = new object[Amount];
  for(object *i=obj; i-obj<Amount;i++){
    double prix = (randM() % (UpperBound * 10))/100.0;
    double vol = (randM() % (UpperBound * 10))/100.0;
    *i=object(vol,prix,prix/vol,"");
    maxBackpackVol += vol;
  }
  for(object *i=obj;i-obj<Amount;i++){
    for(object *j=obj + Amount - 1;j!=i;j--){
      if((j-1)->prizToVol < j->prizToVol) std::swap(*j,*i);
    }
  }
  return obj;
}

#ifdef SETP_DIST
const double stepDist = STEP_DIST;
#undef STEP_DIST
#else
const double stepDist = 10;
#endif


//const unsigned Seed = 0;

object* creatObjLinRand(int Amount, std::mt19937 randM, int &maxBackpackVol){
  #ifdef DEBUG
    std::cerr << "Start creation of: " << Amount << " objects" << std::endl;
  #endif
  int UpperBound = Amount;
  
  std::uniform_real_distribution<double> unif(-stepDist,stepDist);
     
  int objLen=Amount;
  object *obj = new object[Amount];
  double counter = stepDist;
  for(object *i=obj; i-obj<Amount;i++){
    double prix = (randM() % (UpperBound * 10))/100.0;
    double vol = counter += unif(randM);
    *i=object(vol,prix,prix/vol,"");
    maxBackpackVol += vol;
  }
  for(object *i=obj;i-obj<objLen;i++){
    for(object *j=obj + objLen - 1;j!=i;j--){
      if((j-1)->prizToVol < j->prizToVol) std::swap(*j,*i);
    }
  }
  return obj;
}

#define rucksack backpack
std::ostream &operator<< (std::ostream &a, rucksack &b){
    a << b.value << ' ' << b.totalVol << ' ' << std::endl;
    for(;b.ruck.size() > 0; b.ruck.pop()) a << b.ruck.top().volume << ' ' << b.ruck.top().prize << ' ' << b.ruck.top().name << std::endl;
    return a;
}
#undef rucksack

std::ostream &operator<< (std::ostream &a, resStruct &b){
  a << b.recursCnt << ';' << b.loopCnt;
  return a;
}
