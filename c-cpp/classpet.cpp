/*
 * classpet.cpp
 * 
 * Copyright 10/14/2017 boaromayo/Nico Poblete <boaromayo@retropie>
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

void Pet::eat()
{
	std::cout << name << " eats food.\n";
}

void Pet::sleep()
{
	std::cout << name << " is sleeping.\n";
}

void Pet::poop()
{
	std::cout << name << " pooped! Pick it up!\n";
}

Dog::Dog() : name("Burmo") {}

void Dog::play() 
{
	std::cout << name << " rolls over and runs a lot.\n";
}

void Dog::fetch()
{
	std::cout << name << " fetches the ball.\n"
}

Cat::Cat() : name("Cal") {}

void Cat::play()
{
	std::cout << name << " runs around.\n";
}

void Cat::glare()
{
	std::cout << name << " glares at you and judges you.\n";
}

int main()
{
	Dog *burmo = new Dog();
	Cat *cal = new Cat();
	
	burmo->eat();
	cal->play();
	
	burmo->poop();
	
	cal->sleep();
	
	delete burmo;
	delete cal;
	
	return 0;
}
