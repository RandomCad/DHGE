#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
  if (argc==1){
    printf("Errosr in %s", argv[0]);
    return 0;
  }
  int min= atoi(argv[1]), minPos = 1, max=atoi(argv[1]), maxPos = 1;
  int x;
  for (int i = 1; i < argc; i++){
    if(min > (x = atoi(argv[i]))){
      min = x;
      minPos = i;
      continue;
    }
    if(max < (x = atoi(argv[i]))){
      max = x;
      maxPos = i;
      continue;
    }
  }
  if(min == max){
    printf("All input numbers are equale therfor ther dosent exist any min or max. All numbers are %d.", min);
    return 0;
  }
  printf("The minimal input nuber is %d and was at the place %d.\n"
  "The bigist number in the input was %d at the position %d", min, --minPos, max, --maxPos);
  return 0;
}