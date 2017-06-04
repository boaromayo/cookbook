# !/usr/bin/env python
# -*- coding: utf-8 -*-
#
# qtsample2.py
#
# Copyright 5/2/2017, updated 5/16/2017 <boaromayo@retropie>
#
#

# Import sys and PyQt4 packages
import sys
from PyQt4 import QtGui, QtCore

# Make Window class
class Window(QtGui.QMainWindow):
	def __init__(self):
		super(Window, self).__init__()
		
		self.__screenWidth = 200
		self.__screenHeight = 150
		
		# Set size and title of window
		self.setWindowTitle("Window no. 2")
		self.setGeometry(200, 200, self.__screenWidth, self.__screenHeight)
		#self.setWindowIcon(QtGui.QtIcon("nociicon.png")

		# Handle menu bar creation
		self.menu_bar()
		
		self.__main__()
	
	# Construct menu bar
	def menu_bar(self):
		# Set tooltip
		QtGui.QToolTip.setFont(QtGui.QFont("Sans Serif", 10))

		# Event actions here
		exitAction = QtGui.QAction("&Exit", self)
		exitAction.setShortcut("Ctrl+Q")
		exitAction.setStatusTip("Close application")
		exitAction.triggered.connect(self.close_app)

		abtAction = QtGui.QAction("About", self)
		abtAction.setStatusTip("Details about app")
		abtAction.triggered.connect(self.about_popup)

		# Call status bar
		self.statusBar()

		# Create  menu bar
		menuBar = self.menuBar()

		# Create file menu item
		fileMenu = menuBar.addMenu("&File")
		#fileMenu.setToolTip("Open <b>File</b> menu.")
		fileMenu.addAction(exitAction)

		# Create about menu item
		helpMenu = menuBar.addMenu("&Help")
		#helpMenu.setToolTip("Open <b>Help</b> menu.")
		helpMenu.addAction(abtAction)

	def __main__(self):
		btn = QtGui.QPushButton("Exit", self)
	
		# Move and resize button	
		btn.setGeometry(50, 50, 100, 25)

		# Set font & tooltip for button
		QtGui.QToolTip.setFont(QtGui.QFont("Sans Serif", 10))
		btn.setStatusTip("Close application")
		btn.setToolTip("This <b>QPushButton</b> exits the application.")

		# Quits window when button clicked
		btn.clicked.connect(self.close_app)
		
		self.show()
	
	#=========================
	# EVENT ACTIONS.
	#=========================
	def close_app(self):
		print("Leaving application...")
		sys.exit()

	def about_popup(self):
		QtGui.QMessageBox.about(self,
			"About Window No. 2",
			"Awesome Window No. 2!\n\nCopyright 2017 boaromayo (Nico Poblete)")
		
def __run__():
	app = QtGui.QApplication(sys.argv)
	GUI = Window()
	sys.exit(app.exec_())

if __name__ == '__main__':
	__run__()
