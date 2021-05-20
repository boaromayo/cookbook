#include <iostream>

int main(int argv, const char** argc) {
	int * arr; // List of integers.
	int min; // The minimum integer in list.
	int n; // Size of entries.
	int i; // Loop counter.

	std::cin >> n;

	arr = new int[n]; // Set size of array.

	// Put integers into list. 
	for (i = 0; i < n; i++) {
		std::cin >> arr[i];
	}

	// Check array for least integer.
	min = arr[0]; // Set to first entry as default.
	for (i = 0; i < n; i++) {
		if (arr[i] < min) {
			min = arr[i]; // Set as new least integer if next one smaller.
		}
	}
	std::cout << "The minimum integer is " << min;

	delete[] arr;
	return 0;
}