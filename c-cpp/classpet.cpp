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
#include <string>

#include "classpet.h"

Pet::Pet(std::string n) : name(n) {}

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

void Pet::playWith(Pet * pet)
{
	pet->play();
}

Dog::Dog(std::string n) : Pet(n) {}

void Dog::play() 
{
	std::cout << name << " rolls over and runs a lot.\n";
}

void Dog::fetch()
{
	std::cout << name << " fetches the ball.\n";
}

void Dog::bark()
{
	std::cout << name << " barks!\n";
}

void Dog::whine()
{
	std::cout << name << " whines.\n";
}

Cat::Cat(std::string n) : Pet(n) {}

void Cat::play()
{
	std::cout << name << " runs around.\n";
}

void Cat::glare()
{
	std::cout << name << " glares at you and judges you.\n";
}

void Cat::meow()
{
	std::cout << name << " meows.\n";
}

void Cat::purr()
{
	std::cout << name << " purrs lovingly.\n";
}

void Cat::yowl()
{
	std::cout << name << " yowls in anger!\n";
}

Mouse::Mouse(std::string n) : Pet(n) {}

void Mouse::play()
{
	std::cout << name << " plays in the cage.\n";
}

void Mouse::run()
{
	std::cout << name << " scurries around.\n";
}

void Mouse::squeak()
{
	std::cout << name << " squeaks loudly!\n";
}

int main()
{
	Pet * burmo = new Dog("Burmo");
	Pet * cal = new Cat("Cal");
	Pet * marty = new Mouse("Marty");
	
	burmo->eat();
	cal->play();
	
	burmo->poop();
	
	cal->sleep();
	
	cal->eat();
	cal->poop();
	
	burmo->playWith(marty);
	
	delete burmo;
	delete cal;
	
	return 0;
}
