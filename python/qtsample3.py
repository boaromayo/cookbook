# !/usr/bin/python
# -*- coding: utf-8 -*-
#
#  qtsample3.py
#
#  Copyright 5/5/2017, updated 5/16/2017 <boaromayo@retropie>
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
		__screenwidth = 300
		__screenheight = 180
		self.setGeometry(300, 100, __screenwidth, __screenheight)
		self.setWindowTitle("MenuBar/CheckBox Test")

		# Handle main menu bar creation
		self.menu_bar()
		
		# Handle check box creation
		self.check_box()

		self.__main__()

	def __main__(self):
		# Make push button
		self.btn = QtGui.QPushButton("Quit", self)
		self.btn.setGeometry(100, 70, 100, 25)
		
		QtGui.QToolTip.setFont(QtGui.QFont("Sans Serif", 10))
		self.btn.setToolTip("This <b>QPushButton</b> exits the application.")
		
		self.btn.clicked.connect(self.close_app)
		
		self.show()

	#===========================
	# EVENT METHODS.
	#==========================
	# Toggle visibility of quit button
	def toggle_quit(self, state):
		if state == QtCore.Qt.Checked:
			self.btn.setHidden(False)
		else:
			self.btn.setHidden(True)
		
	
	def close_app(self):
		# Confirm if user wants to close app
		choice = QtGui.QMessageBox.question(self,
			"Confirm",
			"Do you want to quit?",
			QtGui.QMessageBox.Yes, QtGui.QMessageBox.No)
		
		# Branch choices
		if choice == QtGui.QMessageBox.Yes:
			print("Leaving application...")
			sys.exit()
		else:
			pass # Close prompt
		
	def about_popup(self):
		# Make a popup about GUI
		QtGui.QMessageBox.about(self, 
			"About MenuBar/CheckBox Test", 
			"Copyright (c) 2017 boaromayo (Nico Poblete)")
	
	# Construct menu bar here
	def menu_bar(self):
		# Actions here
		extAction = QtGui.QAction("&Exit", self)
		extAction.setShortcut("Ctrl+Q")
		extAction.setStatusTip("Close App")
		extAction.triggered.connect(self.close_app)
		
		abtAction = QtGui.QAction("About", self)
		abtAction.setStatusTip("Details About App")
		abtAction.triggered.connect(self.about_popup)

		self.statusBar() # Calls status bar

		# Create main menu bar
		mainMenu = self.menuBar()
		
		# Create file menu
		fileMenu = mainMenu.addMenu("&File")
		fileMenu.addAction(extAction)

		# Create about menu
		aboutMenu = mainMenu.addMenu("&Help")
		aboutMenu.addAction(abtAction)

	# Construct check box
	def check_box(self):
		checkBox = QtGui.QCheckBox("Show Button", self)
		checkBox.move(10,20)
		checkBox.toggle() # Automatically turn on
		checkBox.setToolTip("Sets visibility of the <b>QPushButton</b>.")
		checkBox.stateChanged.connect(self.toggle_quit)
	
def __run__():
	app = QtGui.QApplication(sys.argv)
	GUI = Window()
	sys.exit(app.exec_())				

if __name__ == '__main__':
	__run__()
