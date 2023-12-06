
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
  if (argc==1){
    printf("The program calculate the power of a numbers to an other number. Therfor the programm %s needs too numbers.\n"
    "So pleas enter the too numbers in the comando line.\nThe programm ends now!", argv[0]);
    return 0;
  }
  long int base = atoi(argv[1]), power =atoi(argv[2]), ret = 1;
  for (int i=1;i <= power; i++)
    ret*=base;
  printf("The power of %ld to %ld is %ld", base, power, ret);
  return 0;
}
