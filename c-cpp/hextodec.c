#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

int hex_to_dec(char* hex) {
	int hexlen = strlen(hex); // num of digits in hex number

	double dec = 0; // final result
	double b = 16; // hex is base 16

	for (int i = 0; i < hexlen; i++) {
		char d = hex[i]; // digit of hex

		if (d >= 48 && d <= 57) {
			d -= 48; // (0-9) is ascii 48 - 57
		} else if (d >= 65 && d <= 70) {
			d -= 55; // (A-F) is ascii 65 - 70
		} else if (d >= 97 && d <= 102) {
			d -= 87; // (a-f) is ascii 97 - 102
		}

		dec += d * pow(b, (hexlen - i) - 1);
	}
	return (int)dec;
}

int main() {
	char * hex = (char*)malloc(8);

	fgets(hex, 8, stdin); // Ask for hexadecimal input

	// Take out trailing characters
	if (strlen(hex) > 0 && hex[strlen(hex)-1] == '\n') {
		hex[strlen(hex)-1] = '\0';
	}

	printf("%d\n", hex_to_dec(hex)); // Print decimal equivalent

	free(hex); // Free buffer memory

	return 0;
}
