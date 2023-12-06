
#include <stdlib.h>
#include <stdio.h>

int* SortArray(int *input, int *Length, int add){
	
	if(add<0){
		int *zwi=malloc((*Length-1)*sizeof(int));
		int counter=0;
		for(int i=0;i<*Length;i++){
			if((*(input+i))+add!=0){
				*(zwi+counter)=*input+i;
				counter++;
			}
		}
		*Length++;
		return zwi;	
	}
	if(add=0) exit(1);
	int *zwi=malloc((*Length+1)*sizeof(int));
	int counter=0;
	for(int i=0;i<*Length;i++){
		if(*(input+i)==add && counter==i){
			*(zwi+counter)=add;
			counter++;
			i--;
			continue;
		}
		*(zwi+counter)=*(input+i);
		counter++;
	}
	*Length++;
	return zwi;
}

int main(int argc, const char *argv[]){
	int *array=malloc(sizeof(int));
	*array=atoi(argv[1]);
	int Length=1;
	for(int i=2;i<argc;i++){
		for(int j=0;j<Length;j++) printf("%d\n",*array+j);
		array=SortArray(array,&Length,atoi(argv[i]));
	}
}
