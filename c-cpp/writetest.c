/*
 * writetest.c
 * 
 * Copyright 6/11/2017 boaromayo <boaromayo@retropie>
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
#include <string.h>

int main(int argc, char **argv) {
	FILE * file;
	const int STUFF = 4;
	char * month;
	int day, year;
	char * event;

	// Make a text file and make it writeable
	file = fopen("history.txt", "w");

	while (!feof(file)) {
		if (scanf("%s %d %d %s", month, &day, &year, event) != STUFF) {
			break;
		}
		fprintf(file, "%s %d %d: %s", month, day, year, event);
	}

	fclose(file);

	return 0;
}

