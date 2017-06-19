#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  point.py
#  
#  Copyright 6/18/2017 boaromayo <boaromayo@retropie>
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

class Point:
	def __init__(self,x=0,y=0):
		self.x = x
		self.y = y
	
	def origin(self):
		return Point(0,0)

	@property
	def x(self):
		return self.x

	@property
	def y(self):
		return self.y

	@x.setter
	def x(self,x):
		self.x = x

	@y.setter
	def y(self,y):
		self.y = y

	def move(self,x,y):
		self.x = x
		self.y = y

	def translate(self,dx,dy):
		self.x = self.x + dx
		self.y = self.y + dy

	def __repr__(self):
		return "Point is at x: {}, y: {}".format(self.x,self.y)

	def __str__(self):
		return "({},{})".format(self.x,self.y)

def main():
	p = Point(0,0)
	print p
	p.move(2,6)
	print p
	p.translate(1,2)
	print p
	p.x = 1
	p.y = 4
	print p
	return 0

if __name__ == '__main__':
	main()
