#include <iostream>
#include <cctype>
#include <string>

using namespace std;

int main(int argc, char ** argv) {
	// This program expects three cmd line arguments
	// plus the program's name (and total)
	
	if (argc == 4) {
		string word1 = argv[1];
		string word2 = argv[2];
		char punc = argv[3][0]; // Assign just 1 character
		
		string password, acct;
		
		// Determine larger word
		// Larger word is the base of the password.
		if (word1.length() > word2.length()) {
			password = word1;
			acct = word2;
		} else {
			acct = word1;
			password = word2;
		}
		
		// Loop through smaller word inserting its letters
		// into password.
		for (int i = 0; i < acct.length(); ++i) {
			// Capitalize inserted letter
			password.insert((i*2), 1, toupper(acct[i]));
		}
		
		// Add two copies of the character somewhere.
		password.replace((password.length() / 2), 1, 2, punc);
		
		// Print password.
		cout << "Your password is: '" << password << "'." << endl;
	} else {
		cout << "This program, " <<
			argv[0] << ", expects to receive 3 arguments: " <<
			"two words and a single character, each separated by a space." << endl;
	}
	
	return 0;
}