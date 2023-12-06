#include <stdlib.h>
#include <stdio.h>

void PrintDigit(int num);

int main(int argc, const char *argv[]){
	int num=atoi(argv[1]);
	PrintDigit(num);
}

void PrintDigit(int num){
	if(num/10>0){
		PrintDigit(num/10);
		putchar((char)(num%10+48));
		return;
	}
	putchar((char)(num%10+48));
}
