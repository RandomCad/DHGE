#include <stdio.h>
#include <stdlib.h>
#include "sys/stat.h"
#include <dirent.h>
#include <time.h>


int main(int argc, const char *argv[]){
  DIR *dir= opendir(argv[1]);
  while(1){
    struct dirent *diren=readdir(dir);
    if(diren==NULL) break;
    struct stat s;
    stat(diren->d_name,&s);
    printf("%s, %ld, %c, %s\n", diren->d_name,s.st_size,(S_ISREG(s.st_mode))? 'f':(S_ISDIR(s.st_mode))? 'd':'?',ctime(&(s.st_mtime)));
  }
}
