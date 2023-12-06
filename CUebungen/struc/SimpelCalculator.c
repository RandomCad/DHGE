#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

typedef struct frac{
  int num;
  int denum;
} frac;

frac read(const char *str){
  char *ende=(char*)str;
  frac returnVal={strtol(str,&ende,10),1};
  if(*ende=='/') returnVal.denum=atoi(++ende);
  return returnVal;
}

frac *add(frac *x,frac y){
  x->num=x->num*y.denum+y.num*x->denum;
  x->denum*=y.denum;
  return x;
}

frac *dif(frac *x, frac y){
  x->num=x->num*y.denum-y.num*x->denum;
  x->denum*=y.denum;
  return x;
}

frac *mult(frac *x,frac y){
  x->num*=y.num;
  x->denum*=y.denum;
  return x;
}

frac *diw(frac *x,frac y){
  x->num*=y.denum;
  x->denum*=y.num;
  return x;
}

int main(int argc, const char *argv[]){
  frac calc=read(argv[1]);
	for (int i = 2; i < argc - 1; i++){
		switch (argv[i][0]){
			case 'x':
        calc = *mult(&calc,read(argv[i+1]));
				break;
			case '-':
        calc = *dif(&calc,read(argv[i+1]));
				break;
			case '+':
        calc = *add(&calc,read(argv[i+1]));
				break;
			case '/':
        calc = *diw(&calc,read(argv[i+1]));
				break;
			default:
				break;
		}
	}
  printf("%d/%d\n", calc.num, calc.denum);
	return 0;
}
