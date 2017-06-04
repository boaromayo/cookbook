# !/usr/bin/env python

# When executed, display the current time

import time # Import time library

print("First python program woo!")

print(time.strftime("The time now is %a %b %d %Y %H:%M:%S", 
	time.localtime())) # Print current time

print # Endline
