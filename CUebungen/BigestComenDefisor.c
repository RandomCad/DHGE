#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
  if (argc==1){
    printf("The program calculate the power of a numbers to an other number. Therfor the programm %s needs too numbers.\n"
    "So pleas enter the too numbers in the comando line.\nThe programm ends now!", argv[0]);
    return 0;
  }
  int num1 = abs(atoi(argv[1])), num2 = abs(atoi(argv[2]));
  while(num2 > 0){
    int rest=num1%num2;
    num1=num2;
    num2=rest;
  }
  printf("The smalest kommen defisor is %d.", num1);
  return 0;
}