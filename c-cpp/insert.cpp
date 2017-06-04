#include <iostream>

using namespace std;

void swap(int * a, int * b) {
	int temp = * a;
	* a = * b;
	* b = temp;
}

void insertion_sort(int * a, int len) {
	for (int j = 1; j < len; j++) {
		// Note that the commented-out for loop is also another valid approach.
		//int i = j;
		//while (i > 0 && a[i-1] > a[i]) {
		for (int i = j; i > 0 && a[i-1] > a[i]; i--) {
			swap(a[i-1], a[i]);
		}
		//i--;}
	}
	
	// Print out the results.
	cout << "=====INSERTION SORT=====" << endl;
	for (int j = 0; j < len; j++) {
		cout << a[j] << endl;
	}
}

int main() {
	int len;
	
	cin >> len;
	
	int a[len];
	
	for (int i = 0; i < len; i++) {
		cin >> a[i];
	}
	
	insertion_sort(a, len);
	
	return 0;
}