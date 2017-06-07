#include "gradient.h"
#include <iostream>

#define abs(x) ((x) < 0 ? -(x) : (x))

Gradient::Gradient() : 
	redstart(0), 
	grnstart(0), 
	blustart(0),
	redend(RGB_MAX),
	grnend(RGB_MAX),
	bluend(RGB_MAX) {}
	
Gradient::~Gradient() {}

int Gradient::red() { return abs(redend - redstart); }
int Gradient::green() { return abs(grnend - grnstart); }
int Gradient::blue() { return abs(bluend - blustart); }

int Gradient::getWidth() const { return width; }
int Gradient::getHeight() const { return height; }

void Gradient::print() {
	std::cout << "width: " << width << "\n";
	std::cout << "height: " << height << "\n";
	std::cout << "rstart: " << redstart << "\n";
	std::cout << "gstart: " << grnstart << "\n";
	std::cout << "bstart: " << blustart << "\n";
	std::cout << "rend: " << redend << "\n";
	std::cout << "gend: " << grnend << "\n";
	std::cout << "bend: " << bluend << "\n";
	std::cout << "( " << red() << ", " 
		<< green() << ", " 
		<< blue() << ")";
}

void input() {
	int w, h;
	int r1, g1, b1;
	int r2, g2, b2;
	
	std::cin >> w >> h;
	std::cin >> r1 >> g1 >> b1;
	std::cin >> r2 >> g2 >> b2;
}

int main() {
	Gradient g;

	input();
	return 0;
}