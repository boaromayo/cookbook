# !/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  vector.py
#  
#  Copyright 6/12/2017 boaromayo <boaromayo@retropie>
#  
#  This will demonstrate classes and other object-oriented topics in Python.
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

from math import *

class Vec:
	def __init__(self,a,b):
		self.a = a
		self.b = b
		
	def zero(self):
		return Vec(0,0)

	def one(self):
		return Vec(1,1)

	def isZero(self):
		return self.a == 0 and self.b == 0
	
	def isOne(self):
		return self.a == 1 and self.b == 1
	
	def isNeg(self):
		return self.a < 0 and self.b < 0
	
	def length(self):
		return sqrt(self.a ** 2 + self.b ** 2)
		
	def dot(self,v):
		return self.a * v.a + self.b * v.b

	def __add__(self,v):
		return Vec(self.a + v.a, self.b + v.b)
	
	def __sub__(self,v):
		return Vec(self.a - v.a, self.b - v.b)
	
	def __mul__(self,m):
		return Vec(m * self.a, m * self.b)

	def __str__(self):
		return "<{},{}>".format(self.a, self.b)
		
def main():
	v = Vec(3,4)
	print v
	print v.length()

if __name__ == '__main__':
	main()
