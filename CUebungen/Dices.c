#include <stdio.h>
#include <stdlib.h>

int main(void){
	int dice=0, counter=0, lastWasSichs=0;
	while(lastWasSichs != 2){
		counter++;
		dice=rand()%6;
		printf("The throw %d was a  %d\n", counter ,dice + 1);
		lastWasSichs = (dice==5) ? lastWasSichs + 1 : 0;
	}
	printf("Throw to 6 wone after the other finishing now\n");
	exit(1);
}
