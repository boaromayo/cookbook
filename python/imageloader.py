#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  imageloader.py
#  
#  Copyright 11/7/2017 boaromayo <boaromayo@retropie>
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

import os
import pygame

class ImageLoader(object):
	__singleton = None
	global __imglib = {}
	def __new__(cls): # __new__ is a class method
		if ImageLoader.__singleton is None:
			ImageLoader.__singleton = object.__new__(cls);
		ImageLoader.__singleton.val = val
		return ImageLoader.__singleton
	
	def loadimage(path):
		# load and return an image
		image = __imglib.get(path)
		if image is None:
			canon_path = path.replace('/', os.sep).replace('\\', os.rep)
			image = pygame.image.load(canon_path)
			__imglib[path] = image
		return image
	
def main():
	# Make one object to load all images
	imgbank = ImageLoader()
	
	# Write down file path to img
	path = './home/boaromayo/Pictures/'
	tutupath = path + 'drosselmeyer_is_a_cool_guy_aka_drossjerk-princess_tutu-johnsu.png'
	
	# Initialize game
	pygame.init()
	
	# Set screen to 1024x768
	screen = pygame.display.set_mode((1024,768))
	
	# Set loop trigger
	running = True
	
	# Set game clock
	clock = pygame.time.Clock()
	
	# GAME LOOP
	while running:
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				running = False
				
		# Fill screen with black
		screen.fill((0,0,0))
		
		# Blit the image
		screen.blit(imgbank.loadimage(tutupath), (0,0))
		
		# Flip display buffers
		pygame.display.flip()
		
		# 60 fps
		clock.tick(60)
		
	return 0

if __name__ == '__main__':
	main()
