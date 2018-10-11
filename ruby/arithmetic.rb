#  arithmetic.rb
#  
#  Copyright 10/11/2018 Nico Poblete <boaromayo@retropie>
#  
#  This takes in two numbers and prints out the sum, difference,
#  product, quotient, and remainder of the numbers.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

def sum(a,b)
	a+b
end

def diff(a,b)
	a-b
end

def prod(a,b)
	a*b
end

def quot(a,b)
	if b == 0
		print "b is 0, but a approaches " + sprintf("%3f",a/0.0000099).to_s
	else
		a/b
	end
end

def mod(a,b)
	if b == 0
		print "no remainder"
	else
		a%b
	end
end

a=gets.chomp.to_i
b=gets.chomp.to_i

puts ""
puts "sum: " + sum(a,b).to_s
puts "difference: " + diff(a,b).to_s
puts "product: " + prod(a,b).to_s
puts "quotient: " + quot(a,b).to_s
puts "remainder: " + mod(a,b).to_s
puts ""
