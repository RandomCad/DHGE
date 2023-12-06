#include <stdio.h>

int main(int argc, const char *argv[])
{
  if (argc!=2){
    printf("The program calculate the decimal number from a hex number. Therfor the programm %s needs one numbers.\n"
    "So pleas enter one number in the comando line.\nThe programm ends now!\n", argv[0]);
    return 0;
  }
  unsigned int counter=0, ret = 0;
  for (counter=0;argv[1][counter];counter++){
    ret *=0x10;
    if(argv[1][counter]>102 || (argv[1][counter]<96 && argv[1][counter]>70) ||
    (argv[1][counter]>57 && argv[1][counter]<65) || argv[1][counter]<48) return -1;
    ret += argv[1][counter] > 96 ? argv[1][counter] - 87 : argv[1][counter] > 64 ? argv[1][counter] - 55 
    : argv[1][counter] - 48;
  }
  printf("%d, %d", counter, ret);
  return 0;
}
