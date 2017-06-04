#include <iostream>

using namespace std;

void quicksort(int * a, int l, int r) {
	// Set the pivot element x in the middle element of array.
	int x = a[(l+r)/2];
	int i = l;
	int j = r;
	int temp; // For swapping any elements.
	
	// Do a partition, starting with i on the left of the array
	// and j in the right of the array.
	while (i <= j) {
		// Increment i if array[i] < pivot
		while (a[i] < x) {
			i++;
		}
		// Decrement j if array[j] > pivot
		while (a[j] > x) {
			j--;
		}
		// Swap elements if i <= j, or always swap while the loop
		// is running
		if (i <= j) {
			temp = a[i];
			a[i] = a[j];
			a[j] = temp;
			i++;
			j--;
		}
	};
	
	if (l < j) {
		quicksort(a,l,j);
	}
	if (i < r) {
		quicksort(a,i,r);
	}
}

int main() {
	int len;
	
	cin >> len;
	
	int * a = new int[len];
	
	for (int i = 0; i < len; i++) {
		cin >> a[i];
	}
	
	quicksort(a, 0, len-1);
	
	for (int j = 0; j < len; j++) {
		cout << a[j] << endl;
	}
	
	delete[] a;
	
	return 0;
}