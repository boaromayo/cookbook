#  !/usr/bin/env python
#  -*- coding: utf-8 -*-
#
#  vec3.py
#
#  copyright 7/23/2017 boaromayo <boaromayo@retropie>
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

class Vec3:
	def __init__(self,a=0,b=0,c=0):
		self.a = a
		self.b = b
		self.c = c
		
	def zero(self):
		return Vec3(0,0,0)
		
	def one(self):
		return Vec3(1,1,1)
		
	def isZero(self):
		return self.a == 0 and self.b == 0 and self.c == 0
		
	def isOne(self):
		return self.a == 1 and self.b == 1 and self.c == 1
		
	def isNeg(self):
		return self.a < 0 and self.b < 0 and self.c < 0
		
	def length(self):
		return sqrt(self.a ** 2 + self.b ** 2 + self.c ** 2)
			
	def dot(self,v):
		return self.a * v.a + self.b * v.b + self.c * v.c

	def det(self,a,b,c,d):
		return a*d - b*c
		
	def cross(self,v):
		s1 = det(self.b,self.c,v.b,v.c)
		s2 = det(self.c,self.a,v.c,v.a)
		s3 = det(self.a,self.b,v.a,v.b)
		return Vec3(s1,s2,s3)
		
	def __add__(self,v):
		return Vec3(self.a + v.a, self.b + v.b, self.c + v.c)
		
	def __sub__(self,v):
		return Vec3(self.a - v.a, self.b - v.b, self.c - v.c)
		
	def __mul__(self,m):
		return Vec3(m * self.a, m * self.b, m * self.c)
		
	def __repr__(self):
		return "Vec a: {} b: {} c: {}".format(self.a, self.b, self.c)
		
	def __str__(self):
		return "<{},{},{}>".format(self.a, self.b, self.c)
		
def main():
	v = Vec3(1,1,2)
	print v
	print v.length()
	
if __name__ == '__main__':
	main()
