CONFIG += release

CONFIG += sdk_no_version_check object_parallel_to_source
CONFIG += precompiled_header  
PRECOMPILED_HEADER = all.h

QT += gui xml xmlpatterns widgets svg qml quick quickwidgets printsupport

#LIBS += -L/usr/local/lib -lfreetype -lz -lvorbis -lvorbisfile
# LIBS += -L/usr/local/lib -lfreetype -lz

# Add library search paths
# LIBS += -L/usr/local/lib
# LIBS += -L/home/timo/dev/qt5/qtbase/lib  # Assuming the libraries are in the lib directory
# LIBS += -L/usr/lib/x86_64-linux-gnu  # Add this for FreeType and zlib

# Specify libraries to link against
# LIBS += -lfreetype -lz

# LIBS += -lfreetype -lz -lcompiler_rt

# Specify output file
TARGET = libmscore
DESTDIR = ./output

INCLUDEPATH += ./libmscore ./thirdparty/freetype/include ./mscore ./thirdparty ./thirdparty/dtl
# INCLUDEPATH += /usr/include/freetype2
# INCLUDEPATH += /usr/include/libpng16

# WebAssembly specific configuration
QMAKE_CXX = em++
QMAKE_LINK = em++
QMAKE_AR = emar
QMAKE_RANLIB = emranlib


QMAKE_CXXFLAGS += -include $$_PRO_FILE_PWD_/all.h -fsigned-char -std=c++11 -stdlib=libc++
QMAKE_CXXFLAGS +=     -Wno-trigraphs -Wno-missing-field-initializers -Wno-missing-prototypes -Wno-return-type -Wno-non-virtual-dtor -Wno-overloaded-virtual -Wno-exit-time-destructors -Wno-missing-braces -Wno-unused-function -Wno-unused-label -Wno-unused-parameter -Wno-unused-variable -Wno-empty-body -Wno-uninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wno-constant-conversion -Wno-int-conversion -Wno-bool-conversion -Wno-enum-conversion -Wno-float-conversion -Wno-non-literal-null-conversion -Wno-objc-literal-conversion -Wno-shorten-64-to-32 -Wno-newline-eof -Wno-c++11-extensions -Wno-sign-conversion -Wno-infinite-recursion -Wno-move -Wno-comma -Wno-block-capture-autoreleasing -Wno-strict-prototypes -Wno-range-loop-analysis -Wno-semicolon-before-method-body -Wno-four-char-constants -Wno-unknown-pragmas -Wno-inconsistent-missing-override -Wno-deprecated-register -Wno-overloaded-virtual -Wno-deprecated-declarations -Wno-unused-parameter

# Linker flags for WebAssembly
QMAKE_LFLAGS += -s ALLOW_MEMORY_GROWTH=1
QMAKE_LFLAGS += -s WASM=1
QMAKE_LFLAGS += -s MODULARIZE=1
# QMAKE_LFLAGS += -s EXPORT_NAME="'libmscore'"
# QMAKE_LFLAGS += -s EXPORTED_RUNTIME_METHODS=['ccall','cwrap']
QMAKE_LFLAGS += -s TOTAL_MEMORY=256MB
# QMAKE_LFLAGS += -s LLD_REPORT_UNDEFINED
QMAKE_LFLAGS += -s ERROR_ON_UNDEFINED_SYMBOLS=0
QMAKE_LFLAGS += -o $(DESTDIR)/libmscore.js
QMAKE_LFLAGS_DEBUG -= -g
QMAKE_LFLAGS_DEBUG += -g4

# Exclude moc_predefs.h from being treated as a source file
QMAKE_CLEAN += moc_predefs.h
DISTFILES += moc_predefs.h

#QMAKE_CXXFLAGS += -s USE_ZLIB=1
#LIBS += -s USE_ZLIB=1 -s TOTAL_MEMORY=512*1024*1024 -s TOTAL_STACK=128*1024*1024  -s "BINARYEN_TRAP_MODE='clamp'"
#LIBS += --source-map-base http://localhost:8000/build.wasm/
#LIBS += --preload-file ../applebuild/mscore.app/Contents/Resources/@/Users/matan/Documents/code/MuseScore/applebuild/share/Contents/Resources/
RESOURCES += mscore/musescore.qrc mscore/qml.qrc mscore/musescorefonts-Mac.qrc effects/zita1/zita.qrc

SOURCES = \
      libmscore/accidental.cpp            \
      libmscore/arpeggio.cpp              \
      libmscore/articulation.cpp          \
      libmscore/audio.cpp                 \
      libmscore/barline.cpp               \
      libmscore/beam.cpp                  \
      libmscore/bend.cpp                  \
      libmscore/box.cpp                   \
      libmscore/bracket.cpp               \
      libmscore/breath.cpp                \
      libmscore/bsp.cpp                   \
      libmscore/check.cpp                 \
      libmscore/chord.cpp                 \
      libmscore/chordline.cpp             \
      libmscore/chordlist.cpp             \
      libmscore/chordrest.cpp             \
      libmscore/clef.cpp                  \
      libmscore/cleflist.cpp              \
      libmscore/cmd.cpp                   \
#      libmscore/cursor.cpp                \
      libmscore/drumset.cpp               \
#      libmscore/dsp.cpp                   \
      libmscore/duration.cpp              \
      libmscore/durationtype.cpp          \
      libmscore/dynamic.cpp               \
      libmscore/edit.cpp                  \
      libmscore/element.cpp               \
#      libmscore/elementlayout.cpp         \
      libmscore/elementmap.cpp            \
      libmscore/excerpt.cpp               \
      libmscore/fifo.cpp                  \
      libmscore/figuredbass.cpp           \
      libmscore/fingering.cpp             \
#      libmscore/fraction.cpp              \
      libmscore/fret.cpp                  \
      libmscore/glissando.cpp             \
      libmscore/hairpin.cpp               \
      libmscore/harmony.cpp               \
      libmscore/hook.cpp                  \
      libmscore/icon.cpp                  \
      libmscore/image.cpp                 \
      libmscore/imageStore.cpp            \
      libmscore/iname.cpp                 \
      libmscore/input.cpp                 \
      libmscore/instrchange.cpp           \
      libmscore/instrtemplate.cpp         \
      libmscore/instrument.cpp            \
      libmscore/interval.cpp              \
      libmscore/joinMeasure.cpp           \
      libmscore/key.cpp                   \
      libmscore/keyfinder.cpp             \
      libmscore/keysig.cpp                \
      libmscore/lasso.cpp                 \
      libmscore/layoutbreak.cpp           \
      libmscore/layout.cpp                \
      libmscore/line.cpp                  \
      libmscore/lyrics.cpp                \
      libmscore/measurebase.cpp           \
      libmscore/measure.cpp               \
      libmscore/mscore.cpp                \
      libmscore/navigate.cpp              \
      libmscore/note.cpp                  \
      libmscore/notedot.cpp               \
      libmscore/noteevent.cpp             \
      libmscore/ossia.cpp                 \
      libmscore/ottava.cpp                \
      libmscore/page.cpp                  \
      libmscore/part.cpp                  \
      libmscore/paste.cpp                 \
      libmscore/pedal.cpp                 \
      libmscore/pitch.cpp                 \
      libmscore/pitchspelling.cpp         \
      libmscore/pos.cpp                   \
      libmscore/property.cpp              \
#      libmscore/qzip.cpp                  \
      libmscore/range.cpp                 \
      libmscore/read114.cpp               \
      libmscore/rehearsalmark.cpp         \
#      libmscore/rendermidi.cpp            \
      libmscore/repeat.cpp                \
      libmscore/repeatlist.cpp            \
      libmscore/rest.cpp                  \
      libmscore/revisions.cpp             \
      libmscore/score.cpp                 \
      libmscore/scorefile.cpp             \
      libmscore/segment.cpp               \
      libmscore/segmentlist.cpp           \
      libmscore/select.cpp                \
      libmscore/shadownote.cpp            \
      libmscore/sig.cpp                   \
#      libmscore/simpletext.cpp            \
      libmscore/slur.cpp                  \
      libmscore/spacer.cpp                \
      libmscore/spanner.cpp               \
      libmscore/splitMeasure.cpp          \
      libmscore/staff.cpp                 \
      libmscore/staffstate.cpp            \
      libmscore/stafftext.cpp             \
      libmscore/stafftype.cpp             \
      libmscore/stem.cpp                  \
      libmscore/style.cpp                 \
      libmscore/symbol.cpp                \
      libmscore/sym.cpp                   \
      libmscore/system.cpp                \
#      libmscore/tablature.cpp             \
      libmscore/tempo.cpp                 \
      libmscore/tempotext.cpp             \
      libmscore/text.cpp                  \
      libmscore/textframe.cpp             \
      libmscore/textline.cpp              \
      libmscore/timesig.cpp               \
      libmscore/transpose.cpp             \
      libmscore/tremolobar.cpp            \
      libmscore/tremolo.cpp               \
      libmscore/trill.cpp                 \
      libmscore/tuplet.cpp                \
      libmscore/undo.cpp                  \
      libmscore/utils.cpp                 \
      libmscore/velo.cpp                  \
      libmscore/volta.cpp                 \
      libmscore/bsymbol.cpp               \
#      libmscore/xml.cpp                   \
#      embinds/classScore.cpp \
      libmscore/ledgerline.cpp \
      libmscore/scoreElement.cpp \
      libmscore/ambitus.cpp \
      libmscore/textlinebase.cpp \
      libmscore/slurtie.cpp \
      libmscore/tie.cpp \
      libmscore/shape.cpp \
      libmscore/lyricsline.cpp \
      libmscore/bagpembell.cpp \
      libmscore/stemslash.cpp \
      libmscore/stafflines.cpp \
      libmscore/bracketItem.cpp \
      libmscore/marker.cpp \
      libmscore/stringdata.cpp \
      libmscore/synthesizerstate.cpp \
      libmscore/skyline.cpp \
      libmscore/xmlreader.cpp \
      libmscore/noteline.cpp \
      libmscore/xmlwriter.cpp \
      libmscore/location.cpp \
      libmscore/spannermap.cpp \
      libmscore/systemtext.cpp \
      libmscore/midimapping.cpp \
      libmscore/keylist.cpp \
      libmscore/groups.cpp \
      libmscore/systemdivider.cpp \
      libmscore/stafftypelist.cpp \
      libmscore/connector.cpp \
      libmscore/textedit.cpp \
      libmscore/sticking.cpp \
      libmscore/palmmute.cpp \
      libmscore/vibrato.cpp \
      libmscore/letring.cpp \
      libmscore/fermata.cpp \
      libmscore/noteentry.cpp \
      synthesizer/event.cpp \
      synthesizer/msynthesizer.cpp \
      synthesizer/synthesizergui.cpp \
      libmscore/read301.cpp \
      libmscore/read206.cpp \
      libmscore/measurenumber.cpp \
      libmscore/jump.cpp \
      libmscore/layoutlinear.cpp \
      thirdparty/qzip/qzip.cpp \
      libmscore/stafftypechange.cpp \
libmscore/rendermidi.cpp \
libmscore/stafftextbase.cpp \
libmscore/textbase.cpp \
libmscore/mcursor.cpp \
libmscore/mscoreview.cpp \
libmscore/scorediff.cpp \
libmscore/unrollrepeats.cpp \



HEADERS += \
    libmscore/ledgerline.h \
    libmscore/scoreElement.h \
    libmscore/textBase.h \
    libmscore/staffTextBase.h \
    libmscore/ambitus.h \
    libmscore/textlinebase.h \
    libmscore/slurtie.h \
    libmscore/tie.h \
    libmscore/shape.h \
    libmscore/bagpembell.h \
    libmscore/stemslash.h \
    libmscore/stafflines.h \
    libmscore/bracketItem.h \
    libmscore/marker.h \
    libmscore/stringdata.h \
    libmscore/synthesizerstate.h \
    libmscore/skyline.h \
    libmscore/noteline.h \
    libmscore/location.h \
    libmscore/spannermap.h \
    libmscore/systemtext.h \
    libmscore/keylist.h \
    libmscore/groups.h \
    libmscore/systemdivider.h \
    libmscore/stafftypelist.h \
    libmscore/connector.h \
    libmscore/textedit.h \
    libmscore/sticking.h \
    libmscore/palmmute.h \
    libmscore/vibrato.h \
    libmscore/letring.h \
    libmscore/fermata.h \
    synthesizer/event.h \
    synthesizer/msynthesizer.h \
    synthesizer/synthesizergui.h \
    libmscore/measurenumber.h \
    libmscore/jump.h \
    libmscore/stafftypechange.h \
    libmscore/types.h \
    libmscore/accidental.h              \
    libmscore/arpeggio.h                \
    libmscore/articulation.h            \
    libmscore/audio.h                   \
    libmscore/barline.h                 \
    libmscore/beam.h                    \
    libmscore/bend.h                    \
    libmscore/box.h                     \
    libmscore/bracket.h                 \
    libmscore/breath.h                  \
    libmscore/bsp.h                     \
    libmscore/bsymbol.h                 \
    libmscore/chord.h                   \
    libmscore/chordline.h               \
    libmscore/chordlist.h               \
    libmscore/chordrest.h               \
    libmscore/clef.h                    \
    libmscore/cleflist.h                \
#    libmscore/cursor.h                  \
    libmscore/drumset.h                 \
#    libmscore/dsp.h                     \
    libmscore/duration.h                \
    libmscore/durationtype.h            \
    libmscore/dynamic.h                 \
    libmscore/element.h                 \
#    libmscore/elementlayout.h           \
    libmscore/elementmap.h              \
    libmscore/excerpt.h                 \
    libmscore/fifo.h                    \
    libmscore/figuredbass.h             \
    libmscore/fingering.h               \
    libmscore/fraction.h                \
    libmscore/fret.h                    \
    libmscore/glissando.h               \
    libmscore/hairpin.h                 \
    libmscore/harmony.h                 \
    libmscore/hook.h                    \
    libmscore/icon.h                    \
    libmscore/image.h                   \
    libmscore/imageStore.h              \
    libmscore/iname.h                   \
    libmscore/input.h                   \
    libmscore/instrchange.h             \
    libmscore/instrtemplate.h           \
    libmscore/instrument.h              \
#    libmscore/instrument_p.h            \
    libmscore/interval.h                \
    libmscore/keyfinder.h               \
    libmscore/key.h                     \
    libmscore/keysig.h                  \
    libmscore/lasso.h                   \
    libmscore/layoutbreak.h             \
    libmscore/layout.h                  \
    libmscore/line.h                    \
    libmscore/lyrics.h                  \
    libmscore/measurebase.h             \
    libmscore/measure.h                 \
    libmscore/mscore.h                  \
    libmscore/mscoreview.h              \
    libmscore/navigate.h                \
#    libmscore/noscript.h                \
    libmscore/notedot.h                 \
    libmscore/noteevent.h               \
    libmscore/note.h                    \
    libmscore/ossia.h                   \
    libmscore/ottava.h                  \
    libmscore/page.h                    \
    libmscore/part.h                    \
    libmscore/pedal.h                   \
    libmscore/pitch.h                   \
    libmscore/pitchspelling.h           \
    libmscore/pitchvalue.h              \
    libmscore/pos.h                     \
    libmscore/property.h                \
#    libmscore/qzipreader_p.h            \
#    libmscore/qzipwriter_p.h            \
    libmscore/range.h                   \
    libmscore/rehearsalmark.h           \
    libmscore/repeat.h                  \
    libmscore/repeatlist.h              \
    libmscore/rest.h                    \
    libmscore/revisions.h               \
    libmscore/score.h                   \
    libmscore/segment.h                 \
    libmscore/segmentlist.h             \
    libmscore/select.h                  \
    libmscore/sequencer.h               \
    libmscore/shadownote.h              \
    libmscore/sig.h                     \
#    libmscore/simpletext.h              \
    libmscore/slur.h                    \
#    libmscore/slurmap.h                 \
    libmscore/spacer.h                  \
    libmscore/spanner.h                 \
    libmscore/spatium.h                 \
    libmscore/staff.h                   \
    libmscore/staffstate.h              \
    libmscore/stafftext.h               \
    libmscore/stafftype.h               \
    libmscore/stem.h                    \
    libmscore/style.h                   \
#    libmscore/style_p.h                 \
    libmscore/symbol.h                  \
    libmscore/sym.h                     \
    libmscore/system.h                  \
#    libmscore/tablature.h               \
    libmscore/tempo.h                   \
    libmscore/tempotext.h               \
    libmscore/textframe.h               \
    libmscore/text.h                    \
    libmscore/textline.h                \
    libmscore/tiemap.h                  \
    libmscore/timesig.h                 \
    libmscore/tremolobar.h              \
    libmscore/tremolo.h                 \
    libmscore/trill.h                   \
    libmscore/tuplet.h                  \
    libmscore/tupletmap.h               \
    libmscore/undo.h                    \
    libmscore/utils.h                   \
    libmscore/velo.h                    \
    libmscore/volta.h                   \
    libmscore/xml.h                     \

SOURCES += \
mscore/scoreview.cpp \
mscore/editharmony.cpp \
mscore/stringutils.cpp \
mscore/editfiguredbass.cpp \
mscore/events.cpp \
mscore/editinstrument.cpp \
mscore/editstyle.cpp \
mscore/icons.cpp \
mscore/importbww.cpp \
mscore/importmxmllogger.cpp \
mscore/importmxmlnoteduration.cpp \
mscore/importmxmlnotepitch.cpp \
mscore/importmxml.cpp \
mscore/importmxmlpass1.cpp \
mscore/importmxmlpass2.cpp \
mscore/instrdialog.cpp \
mscore/instrwidget.cpp \
mscore/debugger/debugger.cpp \
mscore/menus.cpp \
mscore/musescore.cpp \
mscore/navigator.cpp \
mscore/pagesettings.cpp \
mscore/palette.cpp \
mscore/timeline.cpp \
mscore/mixer.cpp \
mscore/mixertrackchannel.cpp \
mscore/mixertrackitem.cpp \
mscore/mixertrackpart.cpp \
mscore/mixerdetails.cpp \
mscore/parteditbase.cpp \
mscore/playpanel.cpp \
mscore/selectionwindow.cpp \
mscore/preferences.cpp \
mscore/measureproperties.cpp \
mscore/seq.cpp \
mscore/textpalette.cpp \
mscore/timedialog.cpp \
mscore/symboldialog.cpp \
mscore/shortcutcapturedialog.cpp \
mscore/simplebutton.cpp \
mscore/musedata.cpp \
mscore/editdrumset.cpp \
mscore/editstaff.cpp \
mscore/timesigproperties.cpp \
mscore/newwizard.cpp \
mscore/transposedialog.cpp \
mscore/excerptsdialog.cpp \
mscore/metaedit.cpp \
mscore/magbox.cpp \
mscore/capella.cpp \
mscore/capxml.cpp \
mscore/exportaudio.cpp \
mscore/synthcontrol.cpp \
mscore/drumroll.cpp \
mscore/pianoroll.cpp \
mscore/piano.cpp \
mscore/pianokeyboard.cpp \
mscore/pianolevels.cpp \
mscore/pianolevelschooser.cpp \
mscore/pianolevelsfilter.cpp \
mscore/pianoruler.cpp \
mscore/pianoview.cpp \
mscore/drumview.cpp \
mscore/scoretab.cpp \
mscore/keyedit.cpp \
mscore/harmonyedit.cpp \
#mscore/updatechecker.cpp \
mscore/importove.cpp \
mscore/ove.cpp \
mscore/ruler.cpp \
mscore/importgtp.cpp \
mscore/importgtp-gp4.cpp \
mscore/importgtp-gp5.cpp \
mscore/importgtp-gp6.cpp \
mscore/importptb.cpp \
mscore/fotomode.cpp \
mscore/drumtools.cpp \
mscore/selinstrument.cpp \
mscore/editstafftype.cpp \
mscore/texttools.cpp \
mscore/editpitch.cpp \
mscore/editstringdata.cpp \
mscore/editraster.cpp \
mscore/pianotools.cpp \
mscore/mediadialog.cpp \
mscore/workspace.cpp \
mscore/workspacedialog.cpp \
mscore/chordview.cpp \
mscore/workspacecombobox.cpp \
mscore/albummanager.cpp \
mscore/stafftextproperties.cpp \
mscore/splitstaff.cpp \
mscore/tupletdialog.cpp \
mscore/articulationprop.cpp \
mscore/fretproperties.cpp \
mscore/sectionbreakprop.cpp \
mscore/bendproperties.cpp \
mscore/tremolobarprop.cpp \
mscore/file.cpp \
mscore/keyb.cpp \
mscore/osc.cpp \
mscore/layer.cpp \
mscore/selectdialog.cpp \
mscore/selectnotedialog.cpp \
mscore/propertymenu.cpp \
mscore/shortcut.cpp \
mscore/bb.cpp \
mscore/dragelement.cpp \
mscore/startupWizard.cpp \
mscore/svggenerator.cpp \
mscore/masterpalette.cpp \
mscore/dragdrop.cpp \
mscore/waveview.cpp \
#mscore/helpBrowser.cpp \
mscore/inspector/inspector.cpp \
mscore/inspector/inspectorBase.cpp \
mscore/inspector/inspectorBeam.cpp \
mscore/inspector/inspectorGroupElement.cpp \
mscore/inspector/inspectorImage.cpp \
mscore/inspector/inspectorHarmony.cpp \
mscore/inspector/inspectorFret.cpp \
mscore/inspector/inspectorText.cpp \
mscore/inspector/inspectorMeasureNumber.cpp \
mscore/inspector/inspectorLasso.cpp \
mscore/inspector/inspectorBarline.cpp \
mscore/inspector/inspectorVolta.cpp \
mscore/inspector/inspectorOttava.cpp \
mscore/inspector/inspectorTrill.cpp \
mscore/inspector/inspectorVibrato.cpp \
mscore/inspector/inspectorHairpin.cpp \
mscore/inspector/inspectorJump.cpp \
mscore/inspector/inspectorMarker.cpp \
mscore/inspector/inspectorGlissando.cpp \
mscore/inspector/inspectorNote.cpp \
mscore/inspector/inspectorNoteDot.cpp \
mscore/inspector/inspectorAmbitus.cpp \
mscore/inspector/inspectorArpeggio.cpp \
mscore/inspector/inspectorFingering.cpp \
mscore/inspector/alignSelect.cpp \
mscore/inspector/fontStyleSelect.cpp \
mscore/inspector/offsetSelect.cpp \
mscore/inspector/scaleSelect.cpp \
mscore/inspector/sizeSelect.cpp \
mscore/inspector/inspectorTextBase.cpp \
mscore/inspector/inspectorTextLineBase.cpp \
mscore/inspector/inspectorTextLine.cpp \
mscore/inspector/inspectorLetRing.cpp \
mscore/inspector/inspectorPalmMute.cpp \
mscore/inspector/inspectorPedal.cpp \
mscore/inspector/inspectorDynamic.cpp \
mscore/inspector/inspectorInstrchange.cpp \
mscore/inspector/inspectorElementBase.cpp \
mscore/inspector/resetButton.cpp \
mscore/enableplayforwidget.cpp \
mscore/editelement.cpp \
mscore/editlyrics.cpp \
mscore/musicxmlfonthandler.cpp \
mscore/musicxmlsupport.cpp \
mscore/exportxml.cpp \
mscore/importxml.cpp \
mscore/importxmlfirstpass.cpp \
mscore/savePositions.cpp \
mscore/driver.cpp \
mscore/exportmidi.cpp \
mscore/noteGroups.cpp \
mscore/pathlistdialog.cpp \
mscore/exampleview.cpp \
mscore/miconengine.cpp \
#mscore/inspector/inspectorplugin.cpp \
mscore/importmidi/importmidi.cpp \
mscore/importmidi/importmidi_panel.cpp \
mscore/importmidi/importmidi_operations.cpp \
mscore/importmidi/importmidi_model.cpp \
mscore/importmidi/importmidi_delegate.cpp \
mscore/importmidi/importmidi_meter.cpp \
mscore/importmidi/importmidi_quant.cpp \
mscore/importmidi/importmidi_tuplet.cpp \
mscore/importmidi/importmidi_chord.cpp \
mscore/importmidi/importmidi_swing.cpp \
mscore/importmidi/importmidi_fraction.cpp \
mscore/importmidi/importmidi_drum.cpp \
mscore/importmidi/importmidi_clef.cpp \
mscore/importmidi/importmidi_lrhand.cpp \
mscore/importmidi/importmidi_lyrics.cpp \
mscore/importmidi/importmidi_inner.cpp \
mscore/importmidi/importmidi_tie.cpp \
mscore/importmidi/importmidi_tuplet_voice.cpp \
mscore/importmidi/importmidi_beat.cpp \
mscore/importmidi/importmidi_tuplet_detect.cpp \
mscore/importmidi/importmidi_tuplet_filter.cpp \
mscore/importmidi/importmidi_tuplet_tonotes.cpp \
mscore/importmidi/importmidi_simplify.cpp \
mscore/importmidi/importmidi_voice.cpp \
mscore/importmidi/importmidi_view.cpp \
mscore/importmidi/importmidi_key.cpp \
mscore/importmidi/importmidi_tempo.cpp \
mscore/importmidi/importmidi_instrument.cpp \
mscore/importmidi/importmidi_chordname.cpp \
mscore/palette/palettedialog.cpp \
mscore/palette/palettecelldialog.cpp \
mscore/palette/palettemodel.cpp \
mscore/palette/palettetree.cpp \
mscore/palette/paletteworkspace.cpp \
mscore/palette/palettewidget.cpp \
mscore/scorecmp/scorecmp.cpp \
mscore/scorecmp/scorediffmodel.cpp \
mscore/scorecmp/scorelistmodel.cpp \
mscore/resourceManager.cpp \
#mscore/downloadUtils.cpp \
mscore/textcursor.cpp \
mscore/continuouspanel.cpp \
mscore/accessibletoolbutton.cpp \
mscore/scoreaccessibility.cpp \
mscore/startcenter.cpp \
mscore/scoreBrowser.cpp \
mscore/scorePreview.cpp \
mscore/scoreInfo.cpp \
mscore/templateBrowser.cpp \
mscore/logindialog.cpp \
#mscore/network/loginmanager.cpp \
mscore/uploadscoredialog.cpp \
mscore/breaksdialog.cpp \
mscore/searchComboBox.cpp \
mscore/help.cpp \
mscore/toolbarEditor.cpp \
mscore/abstractdialog.cpp \
mscore/toolbuttonmenu.cpp \
mscore/preferenceslistwidget.cpp \
mscore/extension.cpp \
mscore/tourhandler.cpp \
mscore/script/script.cpp \
mscore/script/scriptentry.cpp \
mscore/script/testscript.cpp \
mscore/script/recorderwidget.cpp \
mscore/qml/msqmlengine.cpp \
mscore/qml/nativemenu.cpp \
mscore/qml/nativetooltip.cpp \
mscore/qmldockwidget.cpp \
#mscore/macos/cocoabridge.mm \
mscore/prefsdialog.cpp \
awl/awlplugin.cpp \
awl/aslider.cpp \
awl/knob.cpp \
awl/panknob.cpp \
awl/volknob.cpp \
awl/midipanknob.cpp \
awl/colorlabel.cpp \
awl/slider.cpp \
awl/styledslider.cpp \
awl/volslider.cpp \
awl/poslabel.cpp \
awl/mslider.cpp \
awl/denomspinbox.cpp \
awl/pitchedit.cpp \
awl/pitchlabel.cpp \
awl/utils.cpp \
effects/effect.cpp \
effects/effectgui.cpp \
effects/noeffect/noeffect.cpp \
effects/zita1/zita.cpp \
effects/zita1/zitagui.cpp \
effects/compressor/compressor.cpp \
effects/compressor/compressorgui.cpp \
mscore/plugin/qmliconview.cpp \
$$files(mscore/widgets/*.cpp, false) \
bww2mxml/parser.cpp \
bww2mxml/lexer.cpp \
bww2mxml/symbols.cpp \



HEADERS += \
#    mscore/scoreview.h \
    mscore/help.h \
    mscore/toolbarEditor.h \
    mscore/abstractdialog.h \
    mscore/preferenceslistwidget.h \
    mscore/extension.h \
    mscore/qml/msqmlengine.h \
    mscore/qml/nativemenu.h \
    mscore/qml/nativetooltip.h \
    mscore/tourhandler.h \
    mscore/qmldockwidget.h \
    mscore/workspacedialog.h \
    mscore/workspacecombobox.h \
    $$files(mscore/debugger/*.h, true) \
#    $$files(mscore/inspector/*.h, true) \
    mscore/inspector/sizeSelect.h \
    mscore/inspector/alignSelect.h \
    mscore/inspector/resetButton.h \
    mscore/inspector/scaleSelect.h \
    mscore/inspector/offsetSelect.h \
    mscore/inspector/inspectorLasso.h \
    mscore/inspector/fontStyleSelect.h \
    mscore/inspector/inspector.h \
    mscore/inspector/inspectorBase.h \
    mscore/inspector/inspectorElementBase.h \
    mscore/inspector/inspectorPedal.h \
    mscore/inspector/inspectorImage.h \
    mscore/inspector/inspectorBeam.h \
    mscore/inspector/inspectorJump.h \
    mscore/inspector/inspectorNote.h \
    mscore/inspector/inspectorText.h \
    mscore/inspector/inspectorTextBase.h \
    mscore/inspector/inspectorAmbitus.h \
    mscore/inspector/inspectorDynamic.h \
    mscore/inspector/inspectorBarline.h \
    mscore/inspector/inspectorHairpin.h \
    mscore/inspector/inspectorLetRing.h \
    mscore/inspector/inspectorNoteDot.h \
    mscore/inspector/inspectorVibrato.h \
    mscore/inspector/inspectorTextLine.h \
    mscore/inspector/inspectorTextLineBase.h \
    mscore/inspector/inspectorTrill.h \
    mscore/inspector/inspectorVolta.h \
    mscore/inspector/inspectorMarker.h \
    mscore/inspector/inspectorOttava.h \
    mscore/inspector/inspectorHarmony.h \
    mscore/inspector/inspectorArpeggio.h \
    mscore/inspector/inspectorPalmMute.h \
    mscore/inspector/inspectorFingering.h \
    mscore/inspector/inspectorGlissando.h \
    mscore/inspector/inspectorFret.h \
    mscore/inspector/inspectorMeasureNumber.h \
    mscore/inspector/inspectorGroupElement.h \
    mscore/inspector/inspectorInstrchange.h \
#    $$files(mscore/*.h, false) \
    $$files(mscore/palette/*.h, true) \
    awl/aslider.h \
    awl/colorlabel.h \
    awl/denomspinbox.h \
    awl/fastlog.h \
    awl/knob.h \
    awl/midipanknob.h \
    awl/mslider.h \
    awl/panknob.h \
    awl/pitchedit.h \
    awl/pitchlabel.h \
    awl/poslabel.h \
    awl/slider.h \
    awl/styledslider.h \
    awl/utils.h \
    awl/volknob.h \
    awl/volslider.h \
    awl/awlplugin.h \
    $$files(mscore/scorecmp/*.h, false) \
    mscore/plugin/qmliconview.h \

FORMS += \
mscore/insertmeasuresdialog.ui \
mscore/editinstrument.ui \
mscore/editstyle.ui \
mscore/instrdialog.ui \
mscore/instrwidget.ui \
mscore/measuresdialog.ui \
mscore/pagesettings.ui \
mscore/mixer.ui \
mscore/mixertrackchannel.ui \
mscore/mixertrackpart.ui \
mscore/mixerdetails.ui \
mscore/parteditbase.ui \
mscore/playpanel.ui \
mscore/prefsdialog.ui \
mscore/measureproperties.ui \
mscore/textpalette.ui \
mscore/timedialog.ui \
mscore/symboldialog.ui \
mscore/shortcutcapturedialog.ui \
mscore/editdrumset.ui \
mscore/editstaff.ui \
mscore/timesigproperties.ui \
mscore/instrwizard.ui \
mscore/timesigwizard.ui \
mscore/newwizard.ui \
mscore/aboutbox.ui \
mscore/aboutmusicxmlbox.ui \
mscore/transposedialog.ui \
mscore/excerptsdialog.ui \
mscore/stafftext.ui \
mscore/tupletdialog.ui \
mscore/articulation.ui \
mscore/metaedit.ui \
mscore/paletteProperties.ui \
mscore/paletteCellProperties.ui \
mscore/selectdialog.ui \
mscore/selectnotedialog.ui \
mscore/synthcontrol.ui \
mscore/splitstaff.ui \
mscore/keyedit.ui \
mscore/selectinstr.ui \
mscore/fretdprops.ui \
mscore/editstafftype.ui \
mscore/sectionbreak.ui \
mscore/bend.ui \
mscore/tremolobar.ui \
mscore/editpitch.ui \
mscore/editstringdata.ui \
mscore/editraster.ui \
mscore/mediadialog.ui \
mscore/albummanager.ui \
mscore/layer.ui \
mscore/omrpanel.ui \
mscore/masterpalette.ui \
mscore/harmonyedit.ui \
mscore/pathlistdialog.ui \
mscore/note_groups.ui \
mscore/resourceManager.ui \
mscore/stafftypetemplates.ui \
mscore/startcenter.ui \
mscore/scorePreview.ui \
mscore/scoreBrowser.ui \
mscore/templateBrowser.ui \
mscore/logindialog.ui \
mscore/uploadscoredialog.ui \
mscore/breaksdialog.ui \
mscore/toolbarEditor.ui \
mscore/workspacedialog.ui \
mscore/importmidi/importmidi_panel.ui \
mscore/scorecmp/scorecmp_tool.ui \
mscore/script/script_recorder.ui \
mscore/debugger/barline.ui \
mscore/debugger/harmony.ui \
mscore/debugger/box.ui \
mscore/debugger/keysig.ui \
mscore/debugger/rest.ui \
mscore/debugger/articulationbase.ui \
mscore/debugger/accidental.ui \
mscore/debugger/clef.ui \
mscore/debugger/slursegment.ui \
mscore/debugger/tiesegment.ui \
mscore/debugger/spanner.ui \
mscore/debugger/tremolo.ui \
mscore/debugger/beam.ui \
mscore/debugger/lyrics.ui \
mscore/debugger/linesegment.ui \
mscore/debugger/textline.ui \
mscore/debugger/line.ui \
mscore/debugger/slurtie.ui \
mscore/debugger/tie.ui \
mscore/debugger/tuplet.ui \
mscore/debugger/dynamic.ui \
mscore/debugger/hairpin.ui \
mscore/debugger/chord.ui \
mscore/debugger/chordrest.ui \
mscore/debugger/segment.ui \
mscore/debugger/measure.ui \
mscore/debugger/element.ui \
mscore/debugger/debugger.ui \
mscore/debugger/note.ui \
mscore/debugger/page.ui \
mscore/debugger/text.ui \
mscore/debugger/stem.ui \
mscore/debugger/system.ui \
mscore/debugger/timesig.ui \
mscore/debugger/bracket.ui \
mscore/inspector/inspector_element.ui \
mscore/inspector/inspector_vbox.ui \
mscore/inspector/inspector_tbox.ui \
mscore/inspector/inspector_articulation.ui \
mscore/inspector/inspector_spacer.ui \
mscore/inspector/inspector_hbox.ui \
mscore/inspector/inspector_segment.ui \
mscore/inspector/inspector_beam.ui \
mscore/inspector/inspector_note.ui \
mscore/inspector/inspector_notedot.ui \
mscore/inspector/inspector_rest.ui \
mscore/inspector/inspector_chord.ui \
mscore/inspector/inspector_group_element.ui \
mscore/inspector/inspector_image.ui \
mscore/inspector/inspector_harmony.ui \
mscore/inspector/inspector_lasso.ui \
mscore/inspector/inspector_volta.ui \
mscore/inspector/inspector_ottava.ui \
mscore/inspector/inspector_trill.ui \
mscore/inspector/inspector_vibrato.ui \
mscore/inspector/inspector_hairpin.ui \
mscore/inspector/inspector_jump.ui \
mscore/inspector/inspector_marker.ui \
mscore/inspector/inspector_glissando.ui \
mscore/inspector/inspector_clef.ui \
mscore/inspector/inspector_timesig.ui \
mscore/inspector/inspector_keysig.ui \
mscore/inspector/inspector_barline.ui \
mscore/inspector/inspector_tuplet.ui \
mscore/inspector/inspector_accidental.ui \
mscore/inspector/inspector_tempotext.ui \
mscore/inspector/inspector_dynamic.ui \
mscore/inspector/inspector_instrchange.ui \
mscore/inspector/inspector_lyric.ui \
mscore/inspector/inspector_line.ui \
mscore/inspector/inspector_textline.ui \
mscore/inspector/inspector_letring.ui \
mscore/inspector/inspector_palmmute.ui \
mscore/inspector/inspector_pedal.ui \
mscore/inspector/inspector_textlinebase.ui \
mscore/inspector/inspector_slur.ui \
mscore/inspector/inspector_text.ui \
mscore/inspector/inspector_stafftext.ui \
mscore/inspector/inspector_ambitus.ui \
mscore/inspector/inspector_empty.ui \
mscore/inspector/inspector_fret.ui \
mscore/inspector/inspector_break.ui \
mscore/inspector/inspector_stafftypechange.ui \
mscore/inspector/inspector_bend.ui \
mscore/inspector/inspector_arpeggio.ui \
mscore/inspector/inspector_tremolo.ui \
mscore/inspector/inspector_tremolobar.ui \
mscore/inspector/inspector_caesura.ui \
mscore/inspector/inspector_bracket.ui \
mscore/inspector/inspector_iname.ui \
mscore/inspector/inspector_fingering.ui \
mscore/inspector/inspector_frametext.ui \
mscore/inspector/inspector_fermata.ui \
mscore/inspector/align_select.ui \
mscore/inspector/font_style_select.ui \
mscore/inspector/offset_select.ui \
mscore/inspector/scale_select.ui \
mscore/inspector/size_select.ui \
mscore/inspector/inspector_stem.ui \
mscore/plugin/pluginCreator.ui \
mscore/plugin/pluginManager.ui \
effects/compressor/compressor_gui.ui \

HEADERS += \
mscore/accessibletoolbutton.h \
mscore/albummanager.h \
mscore/alsa.h \
mscore/alsamidi.h \
mscore/analyse.h \
mscore/articulationprop.h \
mscore/bb.h \
mscore/bendcanvas.h \
mscore/bendproperties.h \
mscore/breaksdialog.h \
mscore/capella.h \
mscore/chordview.h \
mscore/click.h \
mscore/continuouspanel.h \
#mscore/downloadUtils.h \
mscore/driver.h \
mscore/drumroll.h \
mscore/drumtools.h \
mscore/drumview.h \
mscore/editdrumset.h \
mscore/editinstrument.h \
mscore/editpitch.h \
mscore/editraster.h \
mscore/editstaff.h \
mscore/editstafftype.h \
mscore/editstringdata.h \
mscore/editstyle.h \
mscore/enableplayforwidget.h \
mscore/exampleview.h \
mscore/excerptsdialog.h \
mscore/exportmidi.h \
mscore/exportmp3.h \
mscore/file.h \
mscore/fotomode.h \
mscore/fretcanvas.h \
mscore/fretproperties.h \
mscore/globals.h \
mscore/greendotbutton.h \
mscore/harmonycanvas.h \
mscore/harmonyedit.h \
#mscore/helpBrowser.h \
mscore/icons.h \
mscore/importgtp.h \
mscore/importmxml.h \
mscore/importmxmllogger.h \
mscore/importmxmlnoteduration.h \
mscore/importmxmlnotepitch.h \
mscore/importmxmlpass1.h \
mscore/importmxmlpass2.h \
mscore/importptb.h \
mscore/importxmlfirstpass.h \
mscore/instrdialog.h \
mscore/instrwidget.h \
mscore/jackaudio.h \
mscore/keycanvas.h \
mscore/keyedit.h \
mscore/layer.h \
mscore/licence.h \
mscore/logindialog.h \
#mscore/network/loginmanager.h \
#mscore/network/loginmanager_p.h \
mscore/magbox.h \
mscore/masterpalette.h \
mscore/measureproperties.h \
mscore/mediadialog.h \
mscore/metaedit.h \
mscore/miconengine.h \
mscore/mididriver.h \
mscore/mixer.h \
mscore/mixertrack.h \
mscore/mixertrackchannel.h \
mscore/mixertrackgroup.h \
mscore/mixertrackitem.h \
mscore/mixertrackpart.h \
mscore/mixerdetails.h \
mscore/musedata.h \
mscore/musescore.h \
mscore/musicxml.h \
mscore/musicxmlfonthandler.h \
mscore/musicxmlsupport.h \
mscore/navigator.h \
mscore/newwizard.h \
mscore/noteGroups.h \
mscore/omrpanel.h \
mscore/ove.h \
mscore/pa.h \
mscore/pagesettings.h \
mscore/palette.h \
mscore/partedit.h \
mscore/parteditbase.h \
mscore/pathlistdialog.h \
mscore/piano.h \
mscore/pianolevels.h \
mscore/pianolevelschooser.h \
mscore/pianolevelsfilter.h \
mscore/pianokeyboard.h \
mscore/pianoroll.h \
mscore/pianoruler.h \
mscore/pianotools.h \
mscore/pianoview.h \
mscore/playpanel.h \
mscore/pm.h \
mscore/preferences.h \
mscore/prefsdialog.h \
mscore/recordbutton.h \
mscore/resourceManager.h \
mscore/revision.h \
mscore/ruler.h \
mscore/scoreaccessibility.h \
mscore/scoreBrowser.h \
mscore/scoreInfo.h \
mscore/scorePreview.h \
mscore/scoretab.h \
mscore/scoreview.h \
mscore/searchComboBox.h \
mscore/sectionbreakprop.h \
mscore/selectdialog.h \
mscore/selectionwindow.h \
mscore/selectnotedialog.h \
mscore/selinstrument.h \
mscore/seq.h \
mscore/shortcut.h \
mscore/shortcutcapturedialog.h \
mscore/simplebutton.h \
mscore/splitstaff.h \
mscore/stafftextproperties.h \
mscore/startcenter.h \
mscore/startupWizard.h \
mscore/stringutils.h \
mscore/svggenerator.h \
mscore/symboldialog.h \
mscore/synthcontrol.h \
mscore/templateBrowser.h \
mscore/textcursor.h \
mscore/textpalette.h \
mscore/texttools.h \
mscore/timedialog.h \
mscore/timeline.h \
mscore/timesigproperties.h \
mscore/toolbuttonmenu.h \
mscore/transposedialog.h \
mscore/tremolobarcanvas.h \
mscore/tremolobarprop.h \
mscore/tupletdialog.h \
#mscore/updatechecker.h \
mscore/uploadscoredialog.h \
mscore/waveview.h \
mscore/webpage.h \
mscore/workspace.h \
$$files(mscore/importmidi/*.h, false) \
effects/noeffect/noeffectgui.h \
effects/effectgui.h \
effects/effect.h \
effects/noeffect/noeffect.h \
effects/zita1/zitagui.h \
effects/zita1/zita.h \
effects/compressor/compressor.h \
$$files(mscore/widgets/*.h, false) \
mscore/script/recorderwidget.h \


SOURCES += \
    web/web.cpp \
    web/scoreeditorwindow.cpp \

HEADERS +=
    web/scoreeditorwindow.h \

SOURCES += \
thirdparty/rtf2html/rtf2html.cpp \
thirdparty/rtf2html/rtf_keyword.cpp \
thirdparty/rtf2html/fmt_opts.cpp \
thirdparty/rtf2html/rtf_table.cpp \
midi/midiinstrument.cpp \
midi/midifile.cpp \
#thirdparty/singleapp/src/qtsingleapplication.cpp \
#thirdparty/singleapp/src/qtlocalpeer.cpp \
thirdparty/beatroot/Induction.cpp \
thirdparty/beatroot/BeatTracker.cpp \
thirdparty/beatroot/AgentList.cpp \
thirdparty/beatroot/Agent.cpp \
#fluid/chan.cpp \
#fluid/conv.cpp \
#fluid/dsp.cpp \
#fluid/fluid.cpp \
#fluid/fluidgui.cpp \
#fluid/gen.cpp \
#fluid/mod.cpp \
#fluid/sfont.cpp \
#fluid/sfont3.cpp \
#fluid/voice.cpp \

HEADERS += \
#thirdparty/singleapp/src/qtsingleapplication.h \
#thirdparty/singleapp/src/qtlocalpeer.h \
#fluid/fluidgui.h \

#FORMS += \
#fluid/fluid_gui.ui \

SOURCES += \
    libmscore/qhtml5file.cpp

HEADERS += \
    libmscore/qhtml5file.h