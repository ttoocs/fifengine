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

%module soundemitter
%{
#include "audio/soundemitter.h"
%}

namespace FIFE {

	enum SoundPositionType {
		SD_SAMPLE_POS,
		SD_TIME_POS,
		SD_BYTE_POS
	};
	
	class SoundEmitter {
	public:
		SoundEmitter(unsigned int uid);
		~SoundEmitter();
		
		unsigned int getID();
		
		bool load(const std::string &filename);
		void reset(bool defaultall = false);
		void release();
		
		void play();
		void pause();
		void stop();
		
		void setLooping(bool loop);
		void setPositioning(bool relative);
		void setPosition(float x, float y, float z);
		void setVelocity(float x, float y, float z);
		void setGain(float gain);
		float getGain();
		
		bool isStereo();
		short getBitResolution();
		unsigned long getSampleRate();
		
		void setCursor(SoundPositionType type, float value);
		float getCursor(SoundPositionType type);
	};
}