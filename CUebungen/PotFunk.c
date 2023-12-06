#include <stdlib.h>
#include <stdio.h>

double Pot(double Bas, int Pot);

int main (int argc, const char *argv[]){
  if(argc<3){
    printf("Pleas enter too numbers for the korekt usag of the program.\n");
    return -1;
  }
	printf("%g", Pot(atof(argv[1]), atoi(argv[2])));
}

double Pot(double Bas, int PotNum){
	switch (PotNum){
		case 0:
			return 1;
		case 1:
			return Bas;
		default:
			return Pot(Bas, PotNum - 1)*Bas;
	}
}
