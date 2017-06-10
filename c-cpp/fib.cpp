#include <iostream>

using namespace std;

int fib(int n) {
	int x, y;
	if (n <= 1) {
		x = fib(n-1);
		y = fib(n-2);
		return (x + y);
	}
	return n;
}

int main() {
	int n = 0;
	cin >> n;
	int i = fib(n);

	cout << i;
}
