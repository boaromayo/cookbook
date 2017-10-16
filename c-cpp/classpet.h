/*
 * classpet.h
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

class Pet
{
public:
	Pet(std::string);

public:
	virtual void eat();
	virtual void sleep();
	virtual void poop();

	virtual void play() = 0;

	virtual void playWith(Pet * pet);
	
	std::string getname() { return name; }
	
protected:
	std::string name;
};

class Mouse : public Pet
{
public:
	Mouse(std::string n);
	
public:
	void play();
	void run();
	void squeak();
};

class Cat : public Pet
{
public:
	Cat(std::string n);

public:
	void play();
	void glare();
	void meow();
	void purr();
	void yowl();
	
	void playWith(Mouse * mouse);
};

class Dog : public Pet
{
public:
	Dog(std::string n);
	
public:
	void play();
	void fetch();
	void bark();
	void whine();
	
	void playWith(Cat * cat); // Testing polymorphism and overriding fcns
};
