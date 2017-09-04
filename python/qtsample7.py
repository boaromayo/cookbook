#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#  qtsample7.py
#  
#  Copyright 9/3/2017  <boaromayo@retropie>
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

import sys
from PyQt4 import QtGui, QtCore

class AppWindow(QtGui.QMainWindow):
	def __init__(self):
		super(window, self).__init__()
		self.__screenwidth = 400
		self.__screenheight = 400
		
		# Move, resize, and set title to window
		self.setGeometry(400, 300, self.__screenwidth, self.__screenheight)
		self.setWindowTitle("Slider Bar Demo")
		
		self.menu_bar()
		
	def menu_bar(self):
		# Menu actions here
		abtAction = QtGui.QAction("About", self)
		abtAction.setStatusTip("About application")
		abtAction.triggered.connect(self.about_popup)
		
		# Menu bar here
		menuBar = self.menuBar()
		
		# Create help menu
		helpMenu = menuBar.addMenu("&Help")
		helpMenu.addAction(abtAction)
	
	
	def __main__(self):
		self.show()
		
def __run__():
	app = QtGui.QCoreApplication(sys.argv)
	GUI = AppWindow()
	sys.exit(app.exec_())
	
if __name__ == '__main__':
	__run__()
