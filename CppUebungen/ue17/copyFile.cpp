#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cerrno>
#include <cstring>
#include <cctype>

using namespace std;

void error(const int err, const char *progName,const char *source, const int sevarity);

int main(int argc,const char *argv[]){
  if(argc==0) error(EOWNERDEAD,"unknowen","main",4);
  else if(argc<3 || argc>3) error(ENOKEY,argv[0],"main",3);

  ifstream in(argv[1]);
  if(!in) error(errno,argv[0],"InputFile",3);
  ofstream out1(argv[2]);
  if(!out1) error(errno,argv[0],"OutputFile",3);

  int maxLineLength = 0;
  int counter=0;
  for(char i=in.get();in;i=in.get(),counter++){
    cerr<<"DEbug schleife!"<<endl;
    if(i=='\n'){
      cerr<<"Debug new max"<<endl;
      maxLineLength=(counter>maxLineLength) ? counter : maxLineLength;
      counter=0;
    }
    out1.put(tolower(i));
  }

  out1.close(); 
  if(!out1) error(errno,argv[0],"OutputFile",3);
  in.clear();
  in.seekg(0);
  if(!in) error(errno,argv[0],"GoToBeginning",3);
  cerr<<"Debug:"<<maxLineLength<<' '<<in.tellg()<<endl;
  std::string i;
  for(std::getline(in,i);in;getline(in,i)){
    i.insert(0,(maxLineLength-i.length())/2,' ');
    cout<<i<<endl;
  }



}

void error(const int err, const char *progName,const char *source, const int sevarity){
  //TODO: siwtch to arr(kill switch)
  switch(sevarity){
    case 0:
      cerr<<"Debug:";
      break;
    case 1:
      cerr<<"Information:";
      break;
    case 2:
      cerr<<"Warning:";
      break;
    case 4:
      cerr<<"Fatal";
    case 3:
      cerr<<"Error:";
      break;
  }
  cerr<<progName<<':'<<source<<':'<<strerror(err)<<endl;
  exit(EXIT_FAILURE);
}
