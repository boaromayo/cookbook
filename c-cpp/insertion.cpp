#include <iostream>

void swap(int * a, int * b) {
	int temp = * a;
	* a = * b;
	* b = temp;
}

void insertionsort_a(int * a, int len) {
	for (int j = 1; j < len; j++) {
		for (int i = j; i > 0 && a[i-1] > a[i]; i--) {
			swap(a[i-1], a[i]);
		}
	}
}

void insertionsort_b(int * a, int len) {
	int i;
	for (int j = 1; j < len; j++) {
		i = j;
		while (i > 0 && a[i-1] > a[i]) {
			swap(a[i-1], a[i]);
			i--;
		}
	}
}

void insertionsort_c(int * a, int len) {
	int j;
	int temp;
	for (int i = 0; i < len; i++) {
		temp = a[i];
		j = i-1;
		while (j >= 0 && a[j] > temp) {
			a[j+1] = a[j];
			j--;
		}
		a[j+1] = temp;
	}
}

void print(int * a) {
	// Print out results.
	std::cout << "=====INSERTION SORT=====" << std::endl;
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
	
	insertionsort_a(a, len);
	print(a);
	
	return 0;
}