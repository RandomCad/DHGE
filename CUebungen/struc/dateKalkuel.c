#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(int argc, const char *argv[]){
  if(argc!=4){
    printf("Wrong parameters.");
    return -1;
  }
  struct tm Time={0,0,12,atoi(argv[1]),atoi(argv[2])-1,atoi(argv[3])-1900,0,0,-1};
  time_t timsinc0=mktime(&Time);
  if(timsinc0<0){
    printf("error");
    return -1;
  }
  printf("%ld\n",timsinc0);
  struct tm *returnVal= localtime(&timsinc0);
  printf("Es ist der: %d, %d, %d.\nDies ist der %d wochen Tag und der %d Tag des Jahres.\n",returnVal->tm_mday,returnVal->tm_mon+1,returnVal->tm_year+1900,returnVal->tm_wday,returnVal->tm_yday);
}
