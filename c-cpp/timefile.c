#include <stdio.h>
#include <time.h>

int main() {
	time_t current_time; // Set up current timer.
	time(&current_time); // Pass in reference of the time.

	printf("The time now is %s\n", ctime(&current_time)); // Print reference of the current time.

	return 0; // No errors.
}
