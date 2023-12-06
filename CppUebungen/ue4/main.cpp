#include "../SDL/sdlinterf.h"
#include "Rect.h"
#include "Elip.h"
#include "GraObj.h"
#include "Point.h"

#include <cstdlib>
#include <iostream>

const int length = 10;

using namespace std;

int main(int argc,const char *argv[]){
  sdlInit();
  if(argc==1){
    cerr << "pleas enter the number of rectangels." << endl;
    return 0;
  }
  
  srand(time(nullptr)); 
  
  int arrLen=atoi(argv[1]);
  GraObj **rectArr=(GraObj**)malloc(sizeof(GraObj*)*arrLen);

  cerr << "Start withe the filling of the arr" << endl;
  for(GraObj **i=rectArr;i-rectArr<arrLen;i+=length){
    cerr << endl << "Creating objekt " << i-rectArr << "." << endl;
    if(rand()&1){
      cerr << "Creating a Rect snake" << endl;
      *i=new Rect(Color(255,255,255),0,0,0,0,0,0);
      (*i)->randomize();
      cerr << "Last Part created" << endl;
      //TODO: solve probel
      for(int j=1;j<length;j++){
        cerr << "Creating objekt " << j << "." << endl;
        i[j-1]->printLog();
        i[j]=(*i)->clon((*i[j-1]));
        i[j]->printLog();
      }
    }
    else{
      cerr << "Creating a Elip snake" << endl;
      *i=new Elip(Color(255,255,255),0,0,0,0,0,0);
      (*i)->randomize();
      cerr << "Last Part created" << endl;
      for(int j=1;j<length;j++){
        cerr << "Creating objekt " << j << "." << endl;
        i[j-1]->printLog();
        i[j]=(*i)->clon((*i[j-1]));
        i[j]->printLog();
      }
    }
  }
  
  cerr << "Start withe the drawing" << endl;
  for(;;){
    cerr << endl<<endl<<endl<<endl<<"new draw"<<endl;
    sdlMilliSleep(20);
    for(GraObj **i=rectArr;i-rectArr<arrLen;i++){
      //(*i)->printLog();
      (*i)->fly(true,false);
      if((*i)->getBX()<1||(*i)->getBY()<1){
        //(*i)->randomize();
        //cerr<<(*i)->getX()<<' '<<(*i)->getY()<<' '<<(*i)->getSX()<<' '<<(*i)->getSY()<<' '<<(*i)->getBX()<<' '<<(*i)->getBY()<<endl;
      }
    }
    sdlUpdate();
  }

  sdlExit();

  return 0;
}


