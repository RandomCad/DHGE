#include <iostream>
#include <fstream>
#include <sstream>



int main(int argc, const char *argv[]){
  //if(argc<2) Exit(EXIT_FAILURE);
  std::fstream in(argv[1]);
  if(!in) exit(EXIT_FAILURE);

  std::string input;
  for(std::getline(in,input);in;getline(in,input)){
    std::stringstream st(input);
    int num;
    switch (st.str().back()){
      case 'h':
      case 'H':
        st >> std::hex >> num;
        std::cout<<"The enterd hex num was: " << num << std::endl;
        break;
      case 'o':
      case 'O':
        st >> std::oct >> num;
        std::cout<<"The enterd oktalnumber was: " << num << std::endl;
        break;
      case 'b':
      case 'B':
        //st >> std::bin >> num;
        std::cout<<"The enterd binary number was: " << num << std::endl;
        break;
      case 'd':
      case 'D':
      default:
        st >> num;
        std::cout<<"The enterd number was a base 10 number and was: " << num << std::endl;
        break;
    }
  }
}
