#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

typedef struct LineStruc{
  char *line;
  int len;
  struct LineStruc *next;
}LineStruc;

void FileError(const char *prog,const char *op,const int error){
  fprintf(stderr,"ERORR:%s:%s:%s\n",prog,op,strerror(error));
  exit(-1);
}

void FreeList(LineStruc *x){
  if(x){
    FreeList(x->next);
    free(x->line);
    free(x);
  }
  return;
}

int main(int argc, const char *argv[]){
  FILE *input;
  FILE *output;
  switch (argc){
    case 0:
      fprintf(stderr,"FATAL ERORR, Program doesent know it's name!");
      exit(-1);
    case 1:
      input=stdin;
      output=stdout;
      break;
    case 2:
      input=fopen(argv[1],"r");
      if(!input) FileError(argv[0],"Opening input file",errno);
      output=stdout;
      break;
    case 3:
      input=fopen(argv[1],"r");
      if(!input) FileError(argv[0],"Opening input file",errno);
      output=fopen(argv[2],"w");
      if(!output) FileError(argv[0],"Opening output file",errno);
      break;
    default:
      fprintf(stderr,"Worng program call to programm: %s.\n"
      "Pleas call as followd:\n[INPUT FILE [OUTPUT FILE]]\n",argv[0]);
      exit(-1);
  }

  LineStruc *start=NULL;
  char line[4056];
  for(;fgets(line,4056,input);){
    LineStruc *newLine=malloc(sizeof(LineStruc));
    if(newLine==NULL) FileError(argv[0],"Creating new line list object",errno);
    *newLine=(LineStruc){strdup(line),strlen(line),NULL};
    if(newLine->line==NULL) FileError(argv[0],"Duplikating input string",errno);

    #if DEBUG
      printf("Start inserting in the Struct. newLine Adress: %p\n\n",newLine);
    #endif
    
    for(LineStruc **i=&start;;i=&(*i)->next){
    
      #if DEBUG
        printf("Start new Loop go throw:\ni: %p, i.len:%d, "
        "newLine Adres: %p, new.len:%d\n",*i,(*i==NULL)?1000000:(*i)->len,newLine,newLine->len);
      #endif
      
      if(*i==NULL){
        
        #if DEBUG
          printf("Start ende Apendix\n");
        #endif
        
        *i = newLine;
        break;
      }
      if((*i)->len>newLine->len){
        
        #if DEBUG
          printf("%p,%p,%p\n",(void*)i,(void*)(*i)->next,(void*)newLine);
        #endif
        
        newLine->next=(*i);
        (*i)=newLine;
        break;
      }
    }
  }
  
  //int err=errno;
  //if(err!=SUCCESS) FileError(argv[0],"Reading input file",errno);
  
  for(LineStruc *i=start;i!=NULL;i=i->next){
    if(fprintf(output,"%10d: %s",i->len,i->line)<0){
      FileError(argv[0],"Writing to output",errno);
    }
  }
  if(fclose(input)!=0) FileError(argv[0],"Closing input file",errno);
  if(fclose(output)!=0) FileError(argv[0],"Closing output file",errno);
  FreeList(start);
}
