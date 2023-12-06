// Unser drittes Programm: Hallo mit Ausgabe eines oder mehrerer Namen
//
// Aufruf: hello3 name1 name2 ...
//
// Klaus Kusche, 2010

#include <stdio.h>

int main(int argc, const char *argv[])
{
  if (argc == 1) {
    printf("Hallo ich bin das Programm %s, wer bist du?\n", argv[0]);
  } else if (argc > 10){
    printf("Hallo an alle!\nIhr seit insgesamt %i Personen.", argc - 1);  
  }else {
    printf("Hallo, %s! Du bist Erster!\n", argv[1]);
    for (int i = 2; i < argc; ++i) {
      printf("Hallo, %s! Du stehst an %i Stelle.\n", argv[i], i);
    }
    if(argc == 2){
      printf("Du bist alleine. :-(");
      return 0;
      
    }
    printf("Ihr seid dabei insgesamt %i Leute.\n", argc - 1);
  }

  return 0;
}
