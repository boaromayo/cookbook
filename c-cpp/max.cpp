#include <iostream>

int main(int argc, const char** argv) {
	int * arr; // List of integers.
	int max; // The maximum integer in list. 
	int n; // Size of entries.
	int i; // Loop counter.

	std::cin >> n;

	arr = new int[n]; // Set size of array.

	// Put integers into list.
	for (i = 0; i < n; i++) {
		std::cin >> arr[i];
	}

	// Check array for greatest integer.
	max = arr[0]; // Set to first entry as default.
	for (i = 0; i < n; i++) {
		if (arr[i] > max) {
			max = arr[i]; // Set as new greatest integer if next one larger.
		}
	}
	std::cout << "The maximum integer is " << max;

	delete[] arr;
	return 0;
}