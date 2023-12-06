#include <stdlib.h>
#include <stdio.h>
#define FIRST_PRIME 2
#include <stdbool.h>
#include <string.h>
int NextPrime(int **primes, int *primLength){
  bool isPrime=false;
  printf("Nextprime Started\n");
  for (int i = *(*(primes) + *primLength - 1) + 1;;i++){
    isPrime=true;
    printf("Searching the num %d\n", i);
    for (int j = 0; j < *primLength; j++){
      printf("comparing to %d\n", *(*(primes) + j));
      if(i%*(*primes + j) == 0){
        isPrime=false;
        break;
      }
    }
    if(isPrime){
			printf("Found prime %d starts with ading to the array\n", i);
      int *zwi = malloc(*primLength * sizeof(int));
			printf("zwi : %pc\n", zwi);
			memcpy(zwi, *primes, (*primLength) * sizeof(int));
			for (int j = 0; j < *primLength; j++) printf("zwi[%d] = %d\n", j, *(zwi + j));
			*primes = realloc(*primes, (++*primLength) * sizeof(int));
			printf("Adres of primes %ls, primeLength %d\n", *primes, *primLength);
			memcpy(*primes, zwi, *primLength * sizeof(int));
			*(*primes + *primLength - 1) = i;
			for (int j = 0; j < *primLength; j++) printf("prime[%d] =%d\n", j, *(*primes + j));
			free(zwi);
			return i;
    }
  }
}
int main(int argc, const char *argv[])
{
  if (argc==1){
    printf("Ther was a error in %s", argv[0]);
    return -1;
  }
  int primeLength = 1;
	int *primes = malloc( primeLength * sizeof(int));
	*primes = FIRST_PRIME;
	printf("%d, %pc",*primes, primes);
	/*Test
	NextPrime(&primes, &primeLength);
	NextPrime(&primes, &primeLength);
	printf("%d", *(primes + 1));
	/*/
	printf("Ready to start the PrimFinder!");
  unsigned int num = abs(atoi(argv[1]));
  //todo: fix the eror wich arises if the prime to search is biger the 17
  int *usedPrimes = malloc(primeLength * sizeof(int));
	for(int i = 0;num > 1;){
		printf("num %d", num);
		if(num%*(primes + i) == 0){
			(*(usedPrimes + i))++;
			num /= *(primes + i);
			continue;
		}
		NextPrime(&primes, &primeLength);
		int *zwi = malloc((primeLength - 1) * sizeof(int));
		memcpy(zwi, usedPrimes, (primeLength - 1) * sizeof(int));
		usedPrimes = realloc(usedPrimes, primeLength * sizeof(int));
		memcpy(usedPrimes, zwi, (primeLength - 1) * sizeof(int));
		free(zwi);
		i++;
		}	
	for (int i = 0; i < primeLength; i++) printf("%d^%d * ",*(primes + i), *(usedPrimes + i));
	/*
		int zwi[primeLength];
		//add teh new prime nuber:
		for (int j = 0; j < primeLength; j++) zwi[j] = primes[j];
		primeLength++;
		primes[primeLength];
		for (int j = 0; j < primeLength - 1; j++) primes[j] = zwi[j];
		primes[primeLength - 1] = newPrime;
		printf("%d, %d, %d", primes[0],primes[1],primeLength);
		//add the plase for the new prime counter:
		for(int j = 0; j < primeLength - 1; j++) zwi[j] = usedPrimes[j];
		usedPrimes[primeLength];
		for(int j = 0; j < primeLength - 1; j++) usedPrimes[j] = zwi[j];
		usedPrimes[primeLength - 1] = 0;
		i++;
	*/
  return 0;
}
