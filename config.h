//=============================================================================
//  MusE
//  Linux Music Editor
//
//  Copyright (C) 2002-2010 by Werner Schweer and others
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//=============================================================================

#ifndef MUSESCORE_CONFIG_H
#define MUSESCORE_CONFIG_H

/* #undef USE_ALSA */
// #define USE_JACK
// #define USE_PORTAUDIO
// #define USE_PORTMIDI
/* #undef USE_PULSEAUDIO */
// #define USE_LAME
// #define USE_WEBENGINE

/* #undef FOR_WINSTORE */

/* #undef MSCORE_UNSTABLE */

// #define HAS_MIDI
// #define SCRIPT_INTERFACE
// #define HAS_AUDIOFILE
// #define USE_SSE

#define MSCORE_EXECUTABLE       ""
/* #undef BUILD_CRASH_REPORTER */
#define CRASHREPORTER_EXECUTABLE ""
#define CRASH_REPORT_URL        "http://127.0.0.1:1127/post"
#define MUSESCORE_NAME_VERSION  "MuseScore 3"
#define INSTALL_NAME            "Contents/Resources/"
#define INSTPREFIX              "/Users/matan/Documents/code/MuseScore/applebuild"
#define VERSION                 "3.3.0"
#define VERSION_LABEL           ""
#define BUILD_NUMBER            ""
#define WIN_SPARKLE_APPCAST_URL ""

/* #undef WIN_SPARKLE_ENABLED */
/* #undef MAC_SPARKLE_ENABLED */
/* #undef AEOLUS */
// #define ZERBERUS
/* #undef OMR */
/* #undef OCR */
// #define OSC
/* #undef OPENGL */
// #define SOUNDFONT3

/* #undef Q_WS_UIKIT */

#define USE_BSP     true

// does not work on windows/mac:
//#define USE_GLYPHS  true

#endif /* MUSESCORE_CONFIG_H */
