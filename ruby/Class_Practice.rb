# !/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# Class_Practice.rb
#
# Copyright 5/16/2017, renewed 7/5/2017 boaromayo <boaromayo@retropie>
#
# Create a sample class framework for Ruby practice.
#

class Animal
	def initialize
		puts "I am an animal!"
	end
end

class Dog < Animal
	def initialize
		puts "I'm a dog! Grrrrr..."
	end

	def bark
		puts "Ruff! Ruff!"
	end
end

class Cat < Animal
	def initialize
		puts "I...am a cat!"
	end

	def meow
		puts "Meeeeoooow!"
	end
	
	def hiss
		puts "Ragh!"
	end
end

class Snake < Animal
	def initialize # Override Animal constructor
		puts "I am a ssssssnake..."
	end
	
	def hiss
		puts "SSSSSSSS..."
	end
	
	def rattle_shake
		puts "Shake shake shake!"
	end
end

# Make a new Dog object
dog = Dog.new
dog.bark

# Make a new Cat object
cat = Cat.new
cat.meow
cat.hiss

# Make a new Snake object
#snake = Snake.new
#snake.hiss
