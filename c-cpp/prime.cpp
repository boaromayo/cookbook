#include <iostream>
#include <math.h>

using namespace std;

int main() {
	
	int N;

	cin >> N;

	for (int i = 2; i < N; i++) {
		for (int j = 2; j <= sqrt(N); j++) {
			if (N % i != 0) {
				cout << i << endl;
				break;
			}
		}
	}
	return 0;

}
