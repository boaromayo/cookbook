#include <stdio.h>
#include <string.h>

int isprime(int n) {
	return (n % 2 != 0 && n != 2);
}

int main() {
	int i = 0;

	printf("Type a number: ");
	fgets(&i, 32, stdin);

	if (isprime(i))
	    printf("%d is prime\n", i);
	else
	    printf("%d is not prime\n", i);

	return 0;
}
