
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
  if (argc==1){
    printf("The program calculate the sum of numbers. Therfor the programm %s needs numbers.\n"
    "So pleas enter the numbers to summe in the comando line.\nThe programm ends now!", argv[0]);
    return 0;
  }
  double sum=0;
  for (int i=1;i<argc;i++){
    sum += atof(argv[i]);
  }
  printf("Die summe aller Zahlen ist %f.\n", sum);
  printf("Der durchschnitt der eingegebenen Zahlen ist %f.", sum/(argc - 1));
  return 0;
}

