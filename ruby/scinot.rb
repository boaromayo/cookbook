#  scinot.rb
#  
#  Copyright 10/11/2018 Nico Poblete <boaromayo@retropie>
#  
#  This program prints the scientific notation of numbers.
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

n=0.00
place=0
s=""
neg=false

n=gets.chomp.to_f

if n<0
	n = -n
	neg=true
end
if n>=10
	while n>=10
		n/=10
		place += 1
	end
elsif n>0 and n<1
	while n<1
		n*=10
		place -= 1
	end
end

s=sprintf("%3.2f",n)

if neg
	puts "-"+s+"*10^"+place.to_s
elsif n==0
	puts "0.00*10^0" 
else
	puts s+"*10^"+place.to_s
end
