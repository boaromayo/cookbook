# !/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# Vec.rb
#
# Copyright 3/23/2015, renewed 6/14/2017 boaromayo <boaromayo@retropie>
#
#================================================
# ** Vec
#------------------------------------------------
#  This creates two-dimensional vectors.
#================================================
class Vec
	#--------------------------------------------
	# * Public Instance Variables
	#--------------------------------------------
	attr_accessor :x, :y
	
	def initialize(x=0,y=0)
	  @x = x
	  @y = y
	end
	
	def vec
	  "<" + @x.to_s + "," + @y.to_s + ">"
	end
	
	def zero
	  Vec.new(0,0)
	end
	
	def one
	  Vec.new(1,1)
	end

	def zero?
	  (@x == @y) == 0
	end
	
	def one?
	  (@x == @y) == 1
	end
	
	def minus?
	  (@x < 0 and @y < 0)
	end
	
	def length
	  Math.sqrt(@x ** 2 + @y ** 2)
	end

	def +(v)
	  Vec.new(@x + v.x, @y + v.y)
	end
	
	def -(v)
	  Vec.new(@x - v.x, @y - v.y)
	end
	
	def *(a)
	  Vec.new(a * @x, a * @y)
	end
	
	def dot(v)
	  @x * v.x + @y * v.y
	end

	def div(a,b)
	  if a != 0 and b != 0
	    @x /= a
	    @y /= b
	  end
	end

	def coerce(other)
	  return self, other
	end
end

v = Vec.new(3,4)
puts v.vec
puts v.length
