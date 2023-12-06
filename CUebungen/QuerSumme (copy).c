#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
  if (argc==1){
    printf("The program calculate the power of a numbers to an other number. Therfor the programm %s needs too numbers.\n"
    "So pleas enter the too numbers in the comando line.\nThe programm ends now!", argv[0]);
    return 0;
  }
  unsigned int number = abs(atoi(argv[1])), ret;
  while(number > 9){
    ret=0;
    while(number > 0){
      ret+=number % 10;
      number/=10;
    }
    number=ret;
  }
  printf("%d", number);
  return 0;
}