#include <iostream>

using namespace std;

void swap(int * a, int * b) {
	int tmp = * a;
	* a = * b;
	* b = tmp;
}

void bubblesort(int * a, int len) {
	for (int i = 1; i < len - 1; i++)
		for (int j = len; j > 0; j--) 
			if (a[j] < a[j-1])
				swap(a[j-1],a[j]);
				
	cout << "===BUBBLE SORT===" << endl;
	for (int i = 0; i < len; i++)
		cout << a[i] << endl;	
	
}

int main() {
	int len;
	
	cin >> len;
	
	int a[len];
	
	for (int i = 0; i < len; i++)
		cin >> a[i];
	
	
	bubblesort(a, len);
}