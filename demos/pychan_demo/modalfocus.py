# -*- coding: utf-8 -*-

# ####################################################################
#  Copyright (C) 2005-2013 by the FIFE team
#  http://www.fifengine.net
#  This file is part of FIFE.
#
#  FIFE is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the
#  Free Software Foundation, Inc.,
#  51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# ####################################################################

from fife.extensions import pychan
from pychan_demo import PyChanExample

class ModalFocusExample(PyChanExample):
		def __init__(self):
			super(ModalFocusExample,self).__init__('gui/showhide.xml')
		
		def start(self):
			self.widget = pychan.loadXML(self.xmlFile)
			
			self.text1widget = self.widget.findChild(name="text1")
			self.text2widget = self.widget.findChild(name="text2")
			self.text3widget = self.widget.findChild(name="text3")
			self.vbox1widget = self.widget.findChild(name="vbox1")
			
			
			eventMap = {
				'closeButton':self.stop,
				'hideText1': self.requestModal,
				'showText1': self.releaseModal,
				'hideText2': self.requestMouseModal,
				'showText2': self.releaseMouseModal,
			}
			
			self.widget.mapEvents(eventMap)
			
			self.widget.show()
			
		def requestModal(self):
			self.widget.real_widget.requestModalFocus()
		
		def releaseModal(self):
			self.widget.real_widget.releaseModalFocus()
			
		def requestMouseModal(self):
			self.widget.real_widget.requestModalMouseInputFocus()
			
		def releaseMouseModal(self):
			self.widget.real_widget.releaseModalMouseInputFocus()
