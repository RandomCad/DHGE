#include <stdlib.h>
#include <stdio.h>

int* PrimTeilPoin(int num, int lastNum);

void PrimTeil(int num, int lastNum);

int main(int argc, const char *arg[]){
	PrimTeil(10,2);
}

//teh pointer hase the strukture: primNum, amount
void PrimTeil(int num, int lastNum){
	if(num<lastNum) return;
	if(num%lastNum==0){
		PrimTeil(num, lastNum);
		printf("%d", lastNum);
		return;
	}
	PrimTeil(num,lastNum+1);

}
