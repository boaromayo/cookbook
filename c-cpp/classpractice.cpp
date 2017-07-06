/*
 *
 * classpractice.cpp
 *
 * Copyright 7/5/2017 boaromayo <boaromayo@retropie>
 *
 *
 */

#include <iostream>
#include <string>
using namespace std;

class Enemy
{
    protected:
	string name;
	int lv;
	int atkpower;
	int exp, gold;
    public:
	int level() const { return lv; }
	int getxp() const { return exp; }
	int getgold() const { return gold; }
	string getname() { return name; }
    public:
	virtual void attack() = 0;
};

class Slime : public Enemy
{
    public:
	Slime()
	{
	    name = "Slime";
	    lv = 2;
	    exp = 3;
	    gold = 3;
	}

	void attack()
	{
	    cout << getname() << " jumps at you!" << endl;
	}
};

class Fairy : public Enemy
{
    public:
	Fairy()
	{
	   name = "Fairy";
	   lv = 2;
	   exp = 4;
	   gold = 3;
	}

	void attack()
	{
	    cout << getname() << " waves its wand!" << endl;
	}

	void special()
	{
	    cout << getname() << " blows fairy dust at you!" << endl;
	}
};

int main()
{
	Slime s1, s2;
	Fairy f;
	Enemy * e1 = &s1;
	Enemy * e2 = &s2;
	Enemy * e3 = &f;

	e1->attack();
	e2->attack();
	e3->attack();
	return 0;
}
