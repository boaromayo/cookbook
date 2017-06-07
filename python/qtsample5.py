#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#  qtsample5.py
#  
#  Copyright 5/16/2017  <boaromayo@retropie>
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
		self.__screenHeight = 250
		
		# Move, resize, and set title
		self.setGeometry(200, 200, self.__screenWidth, self.__screenHeight)
		self.setWindowTitle("Font & Color Styler")
		
		# Handle menu bar creation
		self.menu_bar()
		
		# Handle toolbar creation
		self.tool_bar()
		
		# Call status bar
		self.statusBar()
		
		self.style_combo_box()
		
		self.__main__()
	
	# Construct drop down menu, or combo box here (the styler)
	def style_combo_box(self):
		self.styleLabel = QtGui.QLabel("motif", self)
		self.styleLabel.move(50,40)
		
		# Make combo box
		comboBox = QtGui.QComboBox(self)
		
		# Add the available styles
		comboBox.addItem("motif")
		comboBox.addItem("Windows")
		comboBox.addItem("cde")
		comboBox.addItem("Plastique")
		comboBox.addItem("Clean Looks")
		comboBox.addItem("Windows Vista")
		
		# Move combo box to center
		comboBox.move(50,70)
		
		# Activate choice on first label
		comboBox.activated[str].connect(
			self.set_style_choice)
		
	# Construct menu bar here
	def menu_bar(self):
		# Actions here
		exitAction = QtGui.QAction("&Exit", self)
		exitAction.setShortcut("Ctrl+Q")
		exitAction.setStatusTip("Close application")
		exitAction.triggered.connect(self.close_app)
		
		abtAction = QtGui.QAction("About", self)
		abtAction.setStatusTip("About application")
		abtAction.triggered.connect(self.about_popup)
		
		# Create main menu bar
		menuBar = self.menuBar()
		
		# Create file menu
		fileMenu = menuBar.addMenu("&File")
		fileMenu.addAction(exitAction)
		
		# Create about menu
		helpMenu = menuBar.addMenu("&Help")
		helpMenu.addAction(abtAction)
		
	# Construct tool bar here
	def tool_bar(self):
		fontPick = QtGui.QAction("Font", self)
		fontPick.triggered.connect(self.set_font)
		
		self.toolBar = self.addToolBar("Font")
		self.toolBar.addAction(fontPick)
	
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
			"Font Changer/Drop Down Styler\nCopyright (c) 2017 boaromayo (Nico Poblete)")
	
	def set_style_choice(self, text):
		self.styleLabel.setText(text)
		
	def set_font(self):
		font, ok = QtGui.QFontDialog.getFont()
		if ok:
			self.styleLabel.setFont(font)	
		
	def __main__(self):
		self.show()	
	
def __run__():
	app = QtGui.QApplication(sys.argv)
	gui = Window()
	sys.exit(app.exec_())
		
if __name__ == '__main__':
	__run__()

