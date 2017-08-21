/*
*
* bitshiftl.c
*
*/

#include <stdio.h>

#define MAX 4

int main()
{
	int i, n;
	fgets(&i, 32, stdin);
	fgets(&n, MAX, stdin);
	
	if (n > MAX)
	{
		printf("ERROR: Cannot shift more than %d bits.\n", MAX);
		return 1;
	}
	else 
	{
		i = i << n;
		printf("%d", i);
	}
	
	free(i);
	free(n);
	return 0;
}