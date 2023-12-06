#include <stdlib.h>
#include <stdio.h>

int BinomKof(int n, int k);
int Fac(int n);
int BinomRecurs(int n, int k);

int pases=0;

int main(int argc, const char *argv[]){
	int num=atoi(argv[1]), num2=atoi(argv[2]);
	printf("%d, nach %d durchlaeufen.\n", BinomKof(num, num2), pases);
	printf("%d, ", BinomRecurs(num, num2));
	printf("nach %d durchlaufen.\n", pases);

}

int BinomKof(int n, int k){
	return Fac(n)/(Fac(k)*Fac(n-k));
}
int Fac(int n){
	int nFac=1;
	for(;n>1;n--)nFac*=n;
	return nFac;
}

int BinomRecurs(int n, int k){
	pases++;
	if(k==0){
		return 1;
	}
	if(k==n){
		return 1;
	}
	return BinomRecurs(n-1,k-1)+BinomRecurs(n-1,k);
}
