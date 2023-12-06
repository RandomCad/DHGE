#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
  if (argc!=2){
    printf("The program calculate the power of a numbers to an other number. Therfor the programm %s needs too numbers.\n"
    "So pleas enter the too numbers in the comando line.\nThe programm ends now!", argv[0]);
    return 0;
  }
  int counter=0, ret = 0;
  for (counter=0;argv[1][counter];counter++) ret += argv[1][counter]-48;
  printf("%i, %i", counter, ret);
  return 0;
}