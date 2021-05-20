#include <iostream>

// Minmax function.
void minmax(int* arr) {
	int min, max; // Maximum and minimum integer.
	int i, j; // Loop counters.

	// Check for both maximum and minimum.
	min = arr[0]; // Set both minimum and maximum values to first entry in list.
	max = arr[0];
	for (i = 0, j = 0; i < n; i++, j++) {
		if (arr[i] > max) {
			max = arr[i]; // Change new max if next integer larger.
		}
		if (arr[j] < min) {
			min = arr[j]; // Change new min if next integer smaller.
		}
	}
	// Print out result.
	std::cout << "Minmax: (" << min << "," << max << ")\n";
}

int main(int argc, const char** argv) {
	int * arr; // List of integers.
	int n; // Size of list.

	std::cin >> n; // Ask for list size.

	arr = new int[n]; // Allocate n entries for array.

	// Ask for integers in list.
	for (int i = 0; i < n; i++) {
		std::cin >> arr[i];
	}

	minmax(arr);

	delete[] arr;
	return 0;
}