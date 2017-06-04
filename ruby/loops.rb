# !/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# loops.rb
#
# Copyright 5/17/2017 <boaromayo@retropie>
#
# This program demonstrates the loops used in Ruby (for, while, begin..end, each..do).
#

i = 0 # Set counter

# Make a for loop from 0 to 5
puts "\n" + "Use i in for loop: for i in 0..5\n\n"

# to_s converts integers to string
for i in 0..5
	puts i.to_s
end

puts "\n" + "Use i in for loop: for i in 0...5\n\n"

# Make another for loop from 0 to n-1
i = 0 

for i in 0...5
	puts i.to_s
end

# Set counter back to 0
i = 0

puts "\n" + "Use i in while loop: while i < 5 do\n\n"

# Make a while loop
while i < 5 do
	puts "Ohmygosh! " + i.to_s
	i += 1 # Make sure to increase counter by 1
end

# Make a begin end while loop
i = 0

puts "\n" + "Use i in begin-end while loop: begin..end while i < 5\n\n"

begin
	puts "Ohmygoodness! " + i.to_s
	i += 1
end while i < 5

# Make an until loop
i = 0

puts "\n" + "Use i in until loop: until i > 5 do\n\n"

until i > 5 do
	puts "Yaledo! " + i.to_s
	i += 1
end

# Make a for each loop
i = 0

puts "\n" + "Use i in for-each loop: (0...5).each do |i|\n\n"

(0...5).each do |i|
	puts "Ooooohboy! " + i.to_s
end

puts "\n"
