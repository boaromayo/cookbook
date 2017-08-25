/*
*
* bitshiftl.c
*
* Copyright 8/19/2017 Nico Poblete/boaromayo <boaromayo@retropie>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
* MA 02110-1301, USA.
*
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
