#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, const char *argv[])
{
  if (argc==1){
    printf("The program calculate the power of a numbers to an other number. Therfor the programm %s needs too numbers.\n"
    "So pleas enter the too numbers in the comando line.\nThe programm ends now!", argv[0]);
    return 0;
  }
  double base = atof(argv[1]), power =atof(argv[2]), ret = 1;
  if(power!=round(power)){
    printf("Your enterd power is not a hol number and this programm kant solfe fraktional pwers.\nThrowen by %s", argv[0]);
    return -1;
  }
  if(power>0){
    for (int i=1;i <= power; i++) {
      ret*=base;
    }
    printf("The power of %g to %g is %g", base, power, ret);
    return 0;
  }
  for (int i=1;i <= -power; i++) {
    ret*=base;
  }
   printf("The power of %g to %g is %g", base, power, 1/ret);
  return 0;  
}