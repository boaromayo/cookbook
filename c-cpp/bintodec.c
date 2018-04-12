#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int bin_to_dec(char* bin)
{
	int binlen = strlen(bin) - 1; // Remove trailing entry.

	double dec = 0; // Final result.

	for (int i = 0; i < binlen; i++) {
		char d = bin[i];

		if (d == '1') {
			dec += (1 << (binlen - i) - 1);
		}
	}

	return (int)dec;
}

int main(int argv, char** argc)
{
	const unsigned int SIZE = 16;
	char * bin = (char*)malloc(SIZE); // Allocate bits.

	// Ask for binary input.
	fgets(bin, SIZE, stdin);

	// Remove trailing chars.
	int binlen = strlen(bin);
	if (binlen > 0 && bin[binlen-1] == '\n') {
		bin[binlen-1] == '\0';
	}

	printf("%d\n", bin_to_dec(bin)); // Print out decimal equivalent.

	free(bin);
	return 0;
}
