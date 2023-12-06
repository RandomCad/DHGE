#include <stdlib.h>
#include <stdio.h>

int PallindromNum(int num);

int main (int argc, const char *argv[]){
	int num=atoi(argv[1]);
	printf("%d", PallindromNum(num));
}

int PallindromNum(int num){
	int returnNum=0;
	for(;num>0;){
		returnNum*=10;
		returnNum+=num%10;
		num/=10;
	}
	return returnNum;
}
