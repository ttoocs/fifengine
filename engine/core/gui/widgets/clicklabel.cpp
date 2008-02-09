/***************************************************************************
 *   Copyright (C) 2005-2007 by the FIFE Team                              *
 *   fife-public@lists.sourceforge.net                                     *
 *   This file is part of FIFE.                                            *
 *                                                                         *
 *   FIFE is free software; you can redistribute it and/or modify          *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA              *
 ***************************************************************************/

// Standard C++ library includes
#include <cassert>

// 3rd party library includes

// FIFE includes
// These includes are split up in two parts, separated by one empty line
// First block: files included from the FIFE root src directory
// Second block: files included from the same folder
#include "gui/base/gui_font.h" 
#include "util/exception.h"
#include "video/image.h" 

#include "clicklabel.h"

namespace gcn {
	ClickLabel::ClickLabel(): Button() {
		mGuiFont = static_cast<FIFE::GuiFont*> (getFont());
		setBorderSize(0);
	}
	
	ClickLabel::ClickLabel(const std::string& caption): Button(caption)  {
		mGuiFont = static_cast<FIFE::GuiFont*> (getFont());
		setBorderSize(0);
		adjustSize();
	}
	
	ClickLabel::~ClickLabel() {
	}
	
	void ClickLabel::setCaption(const std::string& caption) {
		Button::setCaption(caption);
		mGuiFont = static_cast<FIFE::GuiFont*> (getFont());
		adjustSize();
	}
	
	void ClickLabel::draw(Graphics* graphics) {
		int textX;
		int textY = getHeight() / 2 - getFont()->getHeight() / 2;

		switch (getAlignment())
		{
			case Graphics::LEFT:
				textX = 0;
				break;
			case Graphics::CENTER:
				textX = getWidth() / 2;
				break;
			case Graphics::RIGHT:
				textX = getWidth();
				break;
			default:
				throw FIFE::GuiException("Unknown alignment.");
		}
		if (mGuiFont) {
			mGuiFont->drawMultiLineString(graphics, mCaption, 0, 0);
		}
	}

	void  ClickLabel::adjustSize() {
		if (mGuiFont) {
			FIFE::Image* image = mGuiFont->getAsImageMultiline(mCaption);
			setWidth( image->getWidth() );
			setHeight( image->getHeight() );
		}
	}
}
