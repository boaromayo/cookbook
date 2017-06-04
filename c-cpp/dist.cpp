#include <stdio.h>
#include <math.h>

#define max(a,b) ((a) > (b) ? (a) : (b))
#define abs(x) 	 ((x) < 0 ? -(x) : (x))

// Point struct
struct point {
public:
	int x;
	int y;
	
public:
	int set(int i1, int i2) { x = i1; y = i2; }
};

// Euclidean distance fcn
/*double diste(int x1, int x2, int y1, int y2) {
	double r,s;
	int xx, yy;
	
	xx = x2 - x1;
	yy = y2 - y1;
	s = (double)(xx*xx + yy*yy);
	r = sqrt(s);
	
	return r;
}*/

// Euclidean distance fcn w/ pts
double diste(point p1, point p2) {
	double r,s;
	
	int xx = p2.x - p1.x;
	int yy = p2.y - p1.y;
	s = (double)(xx*xx + yy*yy);
	r = sqrt(s);
	
	return r;
}

// Manhattan distance fcn
/*double distm(int x1, int x2, int y1, int y2) {
	double r;
	int xx, yy;
	
	xx = abs(x1 - x2);
	yy = abs(y1 - y2);
	r = (double)(xx + yy);
	
	return r;
}*/

// Manhattan distance fcn w/ pts
double distm(point p1, point p2) {
	double r;
	
	int xx = abs(p1.x - p2.x);
	int yy = abs(p1.y - p2.y);
	r = (double)(xx + yy);
	
	return r;
}

// Chessboard/Chebyshev distance fcn
/*double distc(int x1, int x2, int y1, int y2) {
	double r;
	int xx, yy;
	
	xx = x2 - x1;
	yy = y2 - y1;
	r = max((double)xx, (double)yy);
	
	return r;
}*/

// Chessboard/Chebyshev distance fcn w/ pts
double distc(point p1, point p2) {
	double r;
	
	int xx = p2.x - p1.x;
	int yy = p2.y - p1.y;
	r = max((double)xx, (double)yy);
	
	return r;
}

/*double pythagorea(point p1, point p2) {
	int cx = abs(p2.x - p1.x);
	int cy = abs(p2.y - p1.y);
	
	return (double)sqrt(cx*cx + cy*cy);
}*/

int main() { 
	int x1, x2, y1, y2;
	scanf("%d %d", &x1, &x2);
	scanf("%d %d", &y1, &y2);
	
	point p1, p2;
	p1.set(x1,y1);
	p2.set(x2,y2);
	
	printf("%3.2f\n", diste(p1,p2));
	printf("%3.2f\n", distm(p1,p2));
	printf("%3.2f\n", distc(p1,p2));
	
	return 0; 
}
	