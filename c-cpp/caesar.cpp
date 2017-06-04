#include <iostream>
#include <cctype>
#include <string>
#include <cstring>

#define CAP 65
#define LOW 97

using namespace std;

string caesar(string word, int n, bool encrypt = true);

void input();

int main(int argc, char ** argv) {
	input();
	return 0;
}

void input() {
	string word, cipher;
	int shift;
	
	getline(cin, word);
	cin >> shift;

	cipher = caesar(word, shift);
	
	cout << cipher << endl;
}

string caesar(string word, int n, bool encrypt) {
	string tablecap("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	string tablelow("abcdefghijklmnopqrstuvwxyz");
	
	char * c = new char[word.length()+1];
	strcpy(c, word.c_str());
	
	for (int i = 0; i < word.length(); i++) {
		int f;
		int u = c[i] - CAP;
		int l = c[i] - LOW;
		
		if (encrypt) // Check if message wants to be encrypted
			f = (isupper(c[i])) ? (u + n) % tablecap.length() : (l + n) % tablelow.length();
		else
			f = (isupper(c[i])) ? (u - n) % tablecap.length() : (l - n) % tablelow.length();
		
		if (c[i] == 32) // 32 in ASCII == space or ' '.
			c[i] = 32;
		else if (!ispunct(c[i])) // Is char not a punctuation mark?
			if (isupper(c[i])) // Is this uppercase char?
				c[i] = tablecap[f]; // Place in ciphered char from cap table
			else
				c[i] = tablelow[f]; // Place in ciphered char from lowercase table
	}
	
	string s(c);
	
	delete [] c;
	return s;
}