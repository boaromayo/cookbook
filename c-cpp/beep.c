#include <stdio.h>

#define beep(a,b) ((a) & (b) ? 1 : 0)

int main() {
	typedef uint8_t bool;
	bool a = 1;
	bool b = 1;
	int n = beep(a,b);

	if (n) {
		printf("You just beeped!\n");
	} else {
		printf("You didn't beep at all!\n");
	}

	return 0;
}
