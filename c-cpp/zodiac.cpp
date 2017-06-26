/*
 * zodiac.cpp
 * 
 * Copyright 6/25/2017 Nico Poblete/boaromayo <boaromayo@retropie>
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

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <iterator>
#include <vector>

#define abs(a) ((a < 0) ? (-a) : (a))
#define leap(yr) ((yr % 4 == 0) ? 1 : 0)

std::string zodiac(int d, int m, int y) {
	const int TWELVE = 12;
	int offset = abs(y-4); // offset yr by 4 (e.g., 1992 mod 12 is set to Rat, but 1992 is Monkey year)
	std::string animal[TWELVE] = {
		"Rat", 
		"Ox", 
		"Tiger", 
		"Rabbit",
		"Dragon",
		"Snake",
		"Horse",
		"Sheep",
		"Monkey",
		"Rooster",
		"Dog",
		"Boar"};

	// TODO: Figure out how to adjust zodiac based on month and day
	return animal[offset % TWELVE];
}

int main(int argc, char **argv) {
	int month = 0;
	int day = 0;
	int year = -1;
	std::string date;
	std::vector<std::string> date_v;
	std::string animal = "Rat";

	while (year < 0) {
		std::cout << "Type in your birthdate (no slashes or dashes): ";
		std::getline(cin, date);
		
		// Split date str and put into integers
		std::stringstream(date);
		std::copy(istream_iterator<std::string>(date), 
			istream_iterator<std::string>(), 
			date_v.begin());
		
		month = atoi(date_v[0].c_str());
		day = atoi(date_v[1].c_str());
		year = atoi(date_v[2].c_str());
		
		// Make bad input cases
		if (month <= 0 && month > 12) {
			std::cout << "Invalid month. Try again.\n";
		} else if (month == 2) { // For the case of February, consider leap year
			if (day < 1 && day > 28 + leap(year)) {
				std::cout << "That day doesn't exist. Try again.\n";
			}
		} else if (month == 4 || month == 6 || month == 9 || month == 11) {
			if (day < 1 && day > 30) {
				std::cout << "That day doesn't exist. Try again.\n";
			}
		} else if (day < 1 && day > 31) {
			std::cout << "That day doesn't exist. Try again.\n";
		} else {
			break;
		}
	}

	//convert_month(month); // Convert month to int if string
	animal = zodiac(day,month,year); // Process zodiac birthdate

	std::cout << "You were born in the Year of the " << animal << ".\n";

	return 0;
}
