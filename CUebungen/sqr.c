#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, const char *argv[])
{
  if (argc!=2){
    printf("The program calculate the square root of a numbers. Therfor the programm %s needs a number.\n"
    "So pleas enter the number in the comando line.\nThe programm ends now!", argv[0]);
    return -1;
  }
  double number = atof(argv[1]), ret=number;
  if(number<0){
    printf("The calculation if negatif square roots isn't posibel without te use of komplex numbers.\n"
    "Therfor this program can't proces thes numbers. Pleas retry the program with a positiv number.\n"
    "The programm ends now!");
    return -1;
  }
  do{
    printf("difisor: %g, %g\n",number/ret,ret);
    ret=(number/ret +ret)/2;
    
  }while(fabs((ret*ret)-number)>0.000000001);
  printf("%.15g", ret);
  return 0;
}