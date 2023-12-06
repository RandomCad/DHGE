#include <stdio.h>

int main(int argc, const char *argv[])
{
  if (argc == 1) {
    printf("Hallo, wer bist du?\n");
  } else {
    for (int i = 1; i < argc; ++i) {
      if(i==1){
        printf("Hallo, %s!\n", argv[i]);
        continue;
      }
      printf("Hallo");
      for (int j = 1; j <= i; j++){
        if(j==i){
          printf(" und %s!", argv[j]);
          break;
        }
        printf(", %s", argv[j]);
      }
      printf("\n");
    }
  }

  return 0;
}