#include <iostream>

void swap(int * a, int * b) {
	int temp = *a;
	*a = *b;
	*b = temp;
}

void selectionsort_a(int * a, int len) {
	int min;
	for (int i = 0; i < len-1; i++) {
		min = i;
		for (int j = 1; j < len; j++) {
			if (a[j] < a[min]) {
				min = j;
			}
			if (min != j) {
				swap(a[j], a[min]);
			}
		}
	}
}

void print(int * a) {
	// Print out results.
	std::cout << "=====SELECTION SORT=====" << std::endl;
	for (int j = 0; j < len; j++) {
		std::cout << a[j] << std::endl;
	}
}

int main() {
	int len;
	
	std::cin >> len;
	
	int a[len];
	
	for (int i = 0; i < len; i++) {
		std::cin >> a[i];
	}
	
	selectionsort_a(a, len);
	print(a);
	
	return 0;
}