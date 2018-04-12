#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int bin_to_dec(char* bin)
{
	int binlen = strlen(bin);

	double dec = 0; // Final result.

	for (int i = 0; i < binlen; i++) {
		if (bin[i] == '1') {
			dec += (1 << (binlen - i) - 1);
		}
	}

	return (int)dec;
}

int main(int argv, char** argc)
{
	char * bin = (char*)malloc(8); // Allocate bits.

	// Ask for binary input.
	fgets(bin, 8, stdin);

	// Remove trailing chars.
	int binlen = strlen(bin);
	if (binlen > 0 && bin[binlen-1] == '\n') {
		bin[binlen-1] = '\0';
	}

	printf("%d\n", bin_to_dec(bin)); // Print out decimal equivalent.

	free(bin);
	return 0;
}
