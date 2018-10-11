#  twelvedays-alt.rb
#  
#  Copyright 10/11/2018 Nico Poblete <boaromayo@retropie>
#  
#  This is a "simplified" version of Twelve Days of Christmas without
#  using any classes.
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

days = 1
gifts = ["a partridge in a pear tree",
		"two turtle doves",
		"three French hens",
		"four calling birds",
		"five GOL-DEN RIIIIIIIINGS!!!",
		"six geese-a-laying",
		"seven swans-a-swimming",
		"eight maids-a-milking",
		"nine ladies dancing",
		"ten lords-a-leaping",
		"eleven pipers piping",
		"twelve drummers drumming"]
rank = ["st", "nd", "rd", "th"]

12.times do |dat|
	if days > 4; dat=rank[-1]; else; dat=rank[days-1]; end;
	puts "On the #{days}#{dat} day of Christmas, my true love gave to me:"
	days.downto(1) do |i|
		i-=1 # Offset by 1 to get the right gifts
		if i>0
			puts gifts[i] + ","
		elsif i==0 and days>1
			puts "and " + gifts[i] + "."
		elsif days==1
			puts gifts[i] + "."
		end
	end
	days += 1
	puts ""
end
