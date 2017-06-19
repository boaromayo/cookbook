#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char * get_substr(char * str, int index, int count) {
	int len = strlen(str);
	int lastindex = index + count;

	if (index >= 0 && lastindex > len)
		return "";

	char * substr = (char*)malloc(count+1);

	for (int i = 0; i < count; i++) {
		substr[i] = str[index+i];
	}
	substr[count] = '\0';
	return substr;
}

char * append_str(const char * str1, const char * str2) {
	int str1len = strlen(str1);
	int str2len = strlen(str2);
	int len = str1len + str2len + 1;

	char * str = (char*)malloc(len);

	for (int i = 0; i < str1len; i++) {
		str[i] = str1[i];
	}

	for (int j = 0; j < str2len; j++) {
		str[(str1len+j)] = str2[j];
	}
	str[len-1] = '\0';
	return str;
}

char * insertstr(char * str, int i, char * substr) {
	char * s = get_substr(str, 0, i);
	s = append_str(s, substr);
	s = append_str(s, get_substr(str, i, strlen(str) - i));

	return s;
}

char * char_to_str(char c) {
	char * str = (char*)malloc(2);
	str[0] = c;
	str[1] = '\0';

	return str;
}

char * dec_to_hex(int dec) {
	int hex;
	char * hexstr;

	if (dec < 1) { return "0"; }

	hex = dec;
	hexstr = (char*)malloc(32);

	while (dec > 0) {
		hex = dec % 16;

		if (hex < 10) {
			hexstr = insertstr(hexstr, 0, char_to_str(hex + 48));
		} else {
			hexstr = insertstr(hexstr, 0, char_to_str(hex + 55));
		}
		dec /= 16;
	}
	return hexstr;
}


int main() {
	int dec = 0;

	scanf("%d", &dec); // Ask for input, pass to reference
	printf("#%s\n", dec_to_hex(dec)); // Return hex number

	return 0;
}
