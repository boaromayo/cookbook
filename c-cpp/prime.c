#include <stdio.h>
#include <string.h>

int isprime(int n) {
	if (n < 3) return 1;
	for (int i = 2; i < n/2; i++) {
		if (i % n == 0)
			return 0;
	}
	return 1;
}

int main() {
	int i = 0;

	printf("Type a number: ");
	fgets(&i, 32, stdin);

	if (isprime(i))
	    printf("%d is prime\n", i);
	else
	    printf("%d is not prime\n", i);

	free(i);
	return 0;
}
