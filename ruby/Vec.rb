# !/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# Vec.rb
#
# Copyright 3/23/2015, renewed 6/3/2017 <boaromayo@retropie>
#
#================================================
# ** Vec
#------------------------------------------------
#  This is a class for making two-dimensional vectors.
#================================================
class Vec
	#--------------------------------------------
	# * Public Instance Variables
	#--------------------------------------------
	attr_accessor :x
	attr_accessor :y
	
	def initialize(x,y)
	  @x = x
	  @y = y
	end
	
	def set(x,y)
	  @x = x
	  @y = y
	end
	
	def vec
		"<" + @x.to_s + ", " + @y.to_s + ">"
	end
	
	def zero
	  @x = @y = 0
	end
	
	def one
	  @x = @y = 1
	end
	
	def zero?
	  (@x == @y) == 0
	end
	
	def one?
	  (@x == @y) == 1
	end
	
	def minus?
	  (@x < 0 || @y < 0)
	end
	
	def add(a,b)
	  @x += a
	  @y += b
	end
	
	def subtr(a,b)
	  @x -= a
	  @y -= b
	end
	
	def mult(a,b)
	  @x *= a
	  @y *= b
	end
	
	def div(a,b)
	  if a != 0 and b != 0
	    @x /= a
		@y /= b
	  end
	end
end
