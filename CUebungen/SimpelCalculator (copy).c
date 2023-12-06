#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, const char *argv[]){
  double calc=atof(argv[1]);
	for (int i = 2; i < argc - 1; i++){
		switch (argv[i][0]){
			case 'x':
        calc *= atof(argv[i + 1]);
				break;
			case '-':
        calc -= atof(argv[i + 1]);
				break;
			case '+':
        calc += atof(argv[i + 1]);
				break;
			case '/':
        calc /= atof(argv[i + 1]);
				break;
      case 'p':
        calc=pow(calc,atof(argv[i + 1]));
        break;
			default:
				break;
		}
	}
  printf("%g", calc);
	return 0;
}
