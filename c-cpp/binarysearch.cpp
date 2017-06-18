#include <iostream>

// Assume sorted array.
int binarysearch(int * a, int len, int t) {
	int l = 0;
	int r = len - 1;
	int x;

	while (l <= r) {
		x = (l+r)/2; // Start in middle.
		// If pivot < target, ignore stuff left of pivot.
		if (a[x] < t) {
			l = x + 1;
		} else if (a[x] > t) { // If pivot > target, ignore stuff right of pivot.
			r = x - 1;
		} else if (a[x] == t) {
			return x; // Return position if found.
		}
	}
	// Return if nothing found.
	return 0;
}

int main() {
	int len;
	std::cin >> len;

	int * a = new int[len];
	int b;

	for (int i = 0; i < len; i++) {
		std::cin >> a[i];
		if (i != 0) {
			if (a[i] < b) {
				std::cout << "ERROR: Need number greater or equal to previous one." << std::endl;
				return 1;
			}
		}
		b = a[i];
	}

	int srch;
	std::cin >> srch;

	int index = binarysearch(a,len,srch);
	std::cout << index << std::endl;

	delete[] a;
	return 0;
}
