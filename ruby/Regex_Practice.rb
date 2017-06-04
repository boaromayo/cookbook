# !/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# Regex_Practice.rb
#
# Copyright 5/16/2017, renewed 5/29/2017 <boaromayo@retropie>
#
# This file is used as a "practice file" for
# regexps, or regular expressions, in Ruby.
#

class RegexPractice
	def initialize
		@text = "Any regular expressions here?"
		puts @text
	end
	
	def print_exp(text)
		puts text.grep(/good/)
	end

	def substr(text, substr)
		puts text.gsub(substr)
	end

	def text=(text)
		@text = text
	end

	def text
		@text
	end
end

regex = RegexPractice.new
str = "Things aren't so good here!"

regex.text = str
puts regex.text
