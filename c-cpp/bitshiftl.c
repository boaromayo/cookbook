/*
*
* bitshiftl.c
* Copyright 8/19/2017 Nico Poblete/boaromayo <boaromayo@retropie>
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
