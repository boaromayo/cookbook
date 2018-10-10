#  twelvedays.rb
#  
#  Copyright 10/6/2018 Nico Poblete <boaromayo@retropie>
#  
#  This song prints "The Twelve Days of Christmas".
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


class TwelveDays
	def initialize
		@day_no = 1
		@last_day = 12
		@rank_no = ["st", "nd", "rd", "th"]
		@gift = {}
		make_gifts
	end
	def print_song
		@day_no.upto(@last_day) do
			puts "On the #{rank(@day_no)} day of Christmas, my true love gave to me: "
			@day_no.downto(1) do |i|
				if i > 1
					puts @gift["#{rank(i)}"] + ",\n"
				elsif @day_no > 1 && i == 1
					puts "and " + @gift["#{rank(i)}"].to_s + ".\n"
				elsif @day_no == 1 && i == 1
					puts @gift["#{rank(i)}"].to_s + ".\n"
				end
			end
			puts ""
			@day_no += 1
		end
	end
	def make_gifts
		@gift = {"1st" => "a partridge in a pear tree",
				"2nd" => "two turtle doves",
				"3rd" => "three French hens",
				"4th" => "four calling birds",
				"5th" => "five GOL-DEN RINGS!!!", # I'm leaving this in caps because I can
				"6th" => "six geese-a-laying",
				"7th" => "seven swans-a-swimming",
				"8th" => "eight maids-a-milking",
				"9th" => "nine ladies dancing",
				"10th" => "ten lords-a-leaping",
				"11th" => "eleven pipers piping",
				"12th" => "twelve drummers drumming"
				}
	end
	def rank(day)
		return day.to_s + @rank_no[-1] if day > 4
		day.to_s + @rank_no[day-1]
	end
end

tdays = TwelveDays.new
tdays.print_song
