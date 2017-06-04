#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#  qtsample6.py
#  
#  Copyright 5/22/2017  <boaromayo@retropie>
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

# Import sys and PyQt4 packages
import sys
from PyQt4 import QtGui, QtCore

# Make Window class
class Window(QtGui.QMainWindow):
	def __init__(self):
		super(Window, self).__init__()
		self.__screenWidth = 300
		self.__screenHeight = 300
		
		# Move, resize, and set title
		self.setGeometry(200, 200, self.__screenWidth, self.__screenHeight)
		self.setWindowTitle("Grand Window Setup")
	
		# Handle menu bar creation
		self.menu_bar()
		
		# Handle tool bar creation
		self.tool_bar()
		
		# Call status bar
		self.statusBar()
		
		self.__main__()
		
	# Construct menu bar 
	def menu_bar(self):
		# Actions here
		abtAction = QtGui.QAction("About", self)
		abtAction.setStatusTip("About application")
		abtAction.triggered.connect(self.about_popup)
		
		# Create menu bar
		menuBar = self.menuBar()
		
		# Create help menu
		helpMenu = menuBar.addMenu("&Help")
		helpMenu.addAction(abtAction)
	
	# Construct tool bar
	def tool_bar(self):
		colorPick = QtGui.QAction("Color", self)
		colorPick.triggered.connect(self.set_color)
		
		self.toolBar = self.addToolBar("Color")
		self.toolBar.addAction(colorPick)
		
	#=========================
	# EVENT METHODS.
	#=========================
	def close_app(self):
		print("Leaving application...")
		sys.exit()
		
	def about_popup(self):
		# Make a popup about app
		QtGui.QMessageBox.about(self,
			"About",
			"Grand Window Setup\nCopyright (c) 2017 boaromayo (Nico Poblete)")
		
	def set_color(self):
		color, ok = QtGui.QColorPicker.getColor()
		if ok:
			self.styleLabel.setColor(color)
	
	def __main__(self):
		self.show()

def __run__():
	app = QtGui.QApplication(sys.argv)
	GUI = Window()
	sys.exit(app.exec_())

if __name__ == '__main__':
	__run__()
