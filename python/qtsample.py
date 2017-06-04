# !/usr/bin/env python
# *-* encode: utf-8 *-*
#
#  qtsample.py
#  
#  Copyright 4/30/2017, updated 5/16/2017  <boaromayo@retropie>

# Import sys and PyQt4 packages
import sys 
from PyQt4 import QtGui

# Initialize GUI and widget in background
app = QtGui.QApplication(sys.argv)
wind = QtGui.QWidget()

# init specs for window
wind.setWindowTitle("First Window Whoo!")
wind.setGeometry(200, 200, 300, 250)

wind.show() # Show window

sys.exit(app.exec_()) # Only exit if close btn is pressed
