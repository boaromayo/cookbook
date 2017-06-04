#include <stdio.h>

void swap(int * a, int * b) {
	int tmp = * a;
	* a = * b;
	* b = tmp;
}

int main() {
	int a = 0;
	int b = 1;

	scanf("%d %d", &a, &b); // Take in two refs of inputs
	swap(&a,&b);
	printf("a = %d, b = %d\n", a, b);

	return 0;
}
