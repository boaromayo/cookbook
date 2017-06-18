#include <iostream>

// Assume sorted array.
int linearsearch(int * a, int len, int t) {
	// Go thru array from left to right.
	for (int i = 0; i < len; i++) {
		if (a[i] == t)
			return i;
	}
	// Return -1 if nothing found.
	return -1;
}

int main() {
	int len; // Length of array.
	std::cin >> len;

	int * a = new int[len];
	int b;

	for (int i = 0; i < len; i++) {
		std::cin >> a[i];
		if (i != 0) {
			if (a[i] < b) {
				std::cout << "ERROR: Need number greater than or equal to the previous one." << std::endl;
				return 1;
			}
		}
		b = a[i];
	}

	int srch;
	std::cin >> srch;

	int index = linearsearch(a,len,srch);
	std::cout << index << std::endl;

	delete[] a;
	return 0;
}
