//=============================================================================
//  MusE
//  Linux Music Score Editor
//
//  Copyright (C) 2004-2011 Werner Schweer (ws@seh.de)
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

#ifndef __ALLQT_H__
#define __ALLQT_H__

#ifndef NDEBUG
#define ABORTN(n) { static int k = 0; ++k; if (k == n) abort(); }
#else
#define ABORTN(a)
#endif

#if defined __cplusplus

#if (defined (_MSCVER) || defined (_MSC_VER))
   // Define to opt-in to deprecated features (bind2nd, mem_fun) removed in VS2017 c++17 mode.
   #undef _HAS_AUTO_PTR_ETC
   #define _HAS_AUTO_PTR_ETC 1
#endif

#include <stdio.h>
#include <limits.h>
#include <map>
#include <set>
#include <deque>
#include <errno.h>
#include <fcntl.h>
// VStudio does not have <unistd.h>, <io.h> & <process.h> replace many functions from it...
#if (defined (_MSCVER) || defined (_MSC_VER))
   #include <io.h>
   #include <process.h>
#else
   #include <unistd.h>
#endif
#include <math.h>
#include <array>
#include <functional>
#include <memory>

// Disable warning C4127: conditional expression is constant in VS2017 (generated in header file qvector.h)
#if (defined (_MSCVER) || defined (_MSC_VER))
   #pragma warning ( push )
   #pragma warning ( disable: 4127)
#endif


#ifndef MOC_PREDEFS_GENERATION
#if __has_include(<QtCore>)
#include <QtCore>
#endif
#if __has_include(<QtGui>)
#include <QtGui>
#endif
#if __has_include(<QtWidgets>)
#include <QtWidgets>
#endif
#if __has_include(<QtSvg>)
#include <QtSvg>
#endif
#if __has_include(<QtXml>)
#include <QtXml>
#endif
#if __has_include(<QtXmlPatterns>)
#include <QtXmlPatterns>
#endif
#if __has_include(<QtQml>)
#include <QtQml>
#endif
#if __has_include(<QtQuick>)
#include <QtQuick>
#endif
#if __has_include(<QtNetwork>)
#include <QtNetwork>
#endif
#endif


#ifdef QT_WEBENGINE_LIB
// no precompiled QtWebEngine in Qt 5.6 windows gcc
#include <QWebEngineView>
#include <QWebEngineUrlRequestInterceptor>
#include <QWebEngineProfile>
#endif

#ifdef __has_include
    #if __has_include(<QtXml>)
        #include <QtXml>
    #endif
    #if __has_include(<QAbstractMessageHandler>)
        #include <QAbstractMessageHandler>
    #endif
    #if __has_include(<QXmlSchema>)
        #include <QXmlSchema>
    #endif
    #if __has_include(<QXmlSchemaValidator>)
        #include <QXmlSchemaValidator>
    #endif
    #if __has_include(<QXmlStreamReader>)
        #include <QXmlStreamReader>
    #endif
    #if __has_include(<QPointF>)
        #include <QPointF>
    #endif
    #if __has_include(<QVariant>)
        #include <QVariant>
    #endif
    #if __has_include(<QMap>)
        #include <QMap>
    #endif
    #if __has_include(<QByteArray>)
        #include <QByteArray>
    #endif
    #if __has_include(<QDateTime>)
        #include <QDateTime>
    #endif
    #if __has_include(<QtGlobal>)
        #include <QtGlobal>
    #endif
    #if __has_include(<QtDebug>)
        #include <QtDebug>
    #endif
    #if __has_include(<QSharedData>)
        #include <QSharedData>
    #endif
    #if __has_include(<QAtomicInt>)
        #include <QAtomicInt>
    #endif
    #if __has_include(<QErrorMessage>)
        #include <QErrorMessage>
    #endif
    #if __has_include(<QPainterPath>)
        #include <QPainterPath>
    #endif
    #if __has_include(<QPixmap>)
        #include <QPixmap>
    #endif
    #if __has_include(<QPainter>)
        #include <QPainter>
    #endif
    #if __has_include(<QKeyEvent>)
        #include <QKeyEvent>
    #endif
    #if __has_include(<QFontDatabase>)
        #include <QFontDatabase>
    #endif
    #if __has_include(<QProcess>)
        #include <QProcess>
    #endif
    #if __has_include(<QDesktopServices>)
        #include <QDesktopServices>
    #endif
    #if __has_include(<QTextDocument>)
        #include <QTextDocument>
    #endif
    #if __has_include(<QTextDocumentFragment>)
        #include <QTextDocumentFragment>
    #endif
    #if __has_include(<QTextCursor>)
        #include <QTextCursor>
    #endif
    #if __has_include(<QAbstractTextDocumentLayout>)
        #include <QAbstractTextDocumentLayout>
    #endif
    #if __has_include(<QTextBlock>)
        #include <QTextBlock>
    #endif
    #if __has_include(<QTextList>)
        #include <QTextList>
    #endif
    #if __has_include(<QClipboard>)
        #include <QClipboard>
    #endif
    #if __has_include(<QPlainTextEdit>)
        #include <QPlainTextEdit>
    #endif
    #if __has_include(<QStyledItemDelegate>)
        #include <QStyledItemDelegate>
    #endif
    #if __has_include(<QDateTimeEdit>)
        #include <QDateTimeEdit>
    #endif
    #if __has_include(<QInputDialog>)
        #include <QInputDialog>
    #endif
    #if __has_include(<QFormLayout>)
        #include <QFormLayout>
    #endif
    #if __has_include(<QItemDelegate>)
        #include <QItemDelegate>
    #endif
    #if __has_include(<QStandardItemModel>)
        #include <QStandardItemModel>
    #endif
    #if __has_include(<QSpinBox>)
        #include <QSpinBox>
    #endif
    #if __has_include(<QScrollArea>)
        #include <QScrollArea>
    #endif
    #if __has_include(<QScrollBar>)
        #include <QScrollBar>
    #endif
    #if __has_include(<QToolBar>)
        #include <QToolBar>
    #endif
    #if __has_include(<QTreeWidget>)
        #include <QTreeWidget>
    #endif
    #if __has_include(<QFileDialog>)
        #include <QFileDialog>
    #endif
#else
    // Fallback for compilers that do not support __has_include
    #include <QtXml>
    #include <QAbstractMessageHandler>
    #include <QXmlSchema>
    #include <QXmlSchemaValidator>
    #include <QXmlStreamReader>

    #include <QPointF>
    #include <QVariant>
    #include <QMap>
    #include <QByteArray>
    #include <QDateTime>
    #include <QtGlobal>
    #include <QtDebug>
    #include <QSharedData>

    #include <QAtomicInt>
    #include <QErrorMessage>

    #include <QPainterPath>
    #include <QPixmap>
    #include <QPainter>
    #include <QKeyEvent>

    #include <QFontDatabase>
    #include <QProcess>
    #include <QDesktopServices>
    #include <QTextDocument>
    #include <QTextDocumentFragment>
    #include <QTextCursor>
    #include <QAbstractTextDocumentLayout>
    #include <QTextBlock>
    #include <QTextList>
    #include <QClipboard>
    #include <QPlainTextEdit>
    #include <QStyledItemDelegate>

    #include <QDateTimeEdit>
    #include <QInputDialog>
    #include <QFormLayout>
    #include <QItemDelegate>
    #include <QStandardItemModel>
    #include <QSpinBox>
    #include <QScrollArea>
    #include <QScrollBar>
    #include <QToolBar>
    #include <QTreeWidget>
    #include <QFileDialog>
#endif

#ifdef QT_PRINTSUPPORT_LIB
#include <QPrintDialog>
#include <QPrinter>
#endif
#ifdef __has_include
    #if __has_include(<QtXml>)
        #include <QtXml>
    #endif
    #if __has_include(<QAbstractMessageHandler>)
        #include <QAbstractMessageHandler>
    #endif
    #if __has_include(<QXmlSchema>)
        #include <QXmlSchema>
    #endif
    #if __has_include(<QXmlSchemaValidator>)
        #include <QXmlSchemaValidator>
    #endif
    #if __has_include(<QXmlStreamReader>)
        #include <QXmlStreamReader>
    #endif
    #if __has_include(<QPointF>)
        #include <QPointF>
    #endif
    #if __has_include(<QVariant>)
        #include <QVariant>
    #endif
    #if __has_include(<QMap>)
        #include <QMap>
    #endif
    #if __has_include(<QByteArray>)
        #include <QByteArray>
    #endif
    #if __has_include(<QDateTime>)
        #include <QDateTime>
    #endif
    #if __has_include(<QtGlobal>)
        #include <QtGlobal>
    #endif
    #if __has_include(<QtDebug>)
        #include <QtDebug>
    #endif
    #if __has_include(<QSharedData>)
        #include <QSharedData>
    #endif
    #if __has_include(<QAtomicInt>)
        #include <QAtomicInt>
    #endif
    #if __has_include(<QErrorMessage>)
        #include <QErrorMessage>
    #endif
    #if __has_include(<QPainterPath>)
        #include <QPainterPath>
    #endif
    #if __has_include(<QPixmap>)
        #include <QPixmap>
    #endif
    #if __has_include(<QPainter>)
        #include <QPainter>
    #endif
    #if __has_include(<QKeyEvent>)
        #include <QKeyEvent>
    #endif
    #if __has_include(<QFontDatabase>)
        #include <QFontDatabase>
    #endif
    #if __has_include(<QProcess>)
        #include <QProcess>
    #endif
    #if __has_include(<QDesktopServices>)
        #include <QDesktopServices>
    #endif
    #if __has_include(<QTextDocument>)
        #include <QTextDocument>
    #endif
    #if __has_include(<QTextDocumentFragment>)
        #include <QTextDocumentFragment>
    #endif
    #if __has_include(<QTextCursor>)
        #include <QTextCursor>
    #endif
    #if __has_include(<QAbstractTextDocumentLayout>)
        #include <QAbstractTextDocumentLayout>
    #endif
    #if __has_include(<QTextBlock>)
        #include <QTextBlock>
    #endif
    #if __has_include(<QTextList>)
        #include <QTextList>
    #endif
    #if __has_include(<QClipboard>)
        #include <QClipboard>
    #endif
    #if __has_include(<QPlainTextEdit>)
        #include <QPlainTextEdit>
    #endif
    #if __has_include(<QStyledItemDelegate>)
        #include <QStyledItemDelegate>
    #endif
    #if __has_include(<QDateTimeEdit>)
        #include <QDateTimeEdit>
    #endif
    #if __has_include(<QInputDialog>)
        #include <QInputDialog>
    #endif
    #if __has_include(<QFormLayout>)
        #include <QFormLayout>
    #endif
    #if __has_include(<QItemDelegate>)
        #include <QItemDelegate>
    #endif
    #if __has_include(<QStandardItemModel>)
        #include <QStandardItemModel>
    #endif
    #if __has_include(<QSpinBox>)
        #include <QSpinBox>
    #endif
    #if __has_include(<QScrollArea>)
        #include <QScrollArea>
    #endif
    #if __has_include(<QScrollBar>)
        #include <QScrollBar>
    #endif
    #if __has_include(<QToolBar>)
        #include <QToolBar>
    #endif
    #if __has_include(<QTreeWidget>)
        #include <QTreeWidget>
    #endif
    #if __has_include(<QFileDialog>)
        #include <QFileDialog>
    #endif
    #if __has_include(<QColorDialog>)
        #include <QColorDialog>
    #endif
    #if __has_include(<QDockWidget>)
        #include <QDockWidget>
    #endif
    #if __has_include(<QStackedWidget>)
        #include <QStackedWidget>
    #endif
    #if __has_include(<QStackedLayout>)
        #include <QStackedLayout>
    #endif
    #if __has_include(<QListWidget>)
        #include <QListWidget>
    #endif
    #if __has_include(<QMessageBox>)
        #include <QMessageBox>
    #endif
    #if __has_include(<QComboBox>)
        #include <QComboBox>
    #endif
    #if __has_include(<QMainWindow>)
        #include <QMainWindow>
    #endif
    #if __has_include(<QMenu>)
        #include <QMenu>
    #endif
    #if __has_include(<QMenuBar>)
        #include <QMenuBar>
    #endif
    #if __has_include(<QSplitter>)
        #include <QSplitter>
    #endif
    #if __has_include(<QAction>)
        #include <QAction>
    #endif
    #if __has_include(<QActionGroup>)
        #include <QActionGroup>
    #endif
    #if __has_include(<QLayout>)
        #include <QLayout>
    #endif
    #if __has_include(<QBoxLayout>)
        #include <QBoxLayout>
    #endif
    #if __has_include(<QStandardItemModel>)
        #include <QStandardItemModel>
    #endif
    #if __has_include(<QToolTip>)
        #include <QToolTip>
    #endif
    #if __has_include(<QToolBox>)
        #include <QToolBox>
    #endif
    #if __has_include(<QToolButton>)
        #include <QToolButton>
    #endif
    #if __has_include(<QPushButton>)
        #include <QPushButton>
    #endif
    #if __has_include(<QWizard>)
        #include <QWizard>
    #endif
    #if __has_include(<QGroupBox>)
        #include <QGroupBox>
    #endif
    #if __has_include(<QDial>)
        #include <QDial>
    #endif
    #if __has_include(<QTextEdit>)
        #include <QTextEdit>
    #endif
    #if __has_include(<QLineEdit>)
        #include <QLineEdit>
    #endif
    #if __has_include(<QCheckBox>)
        #include <QCheckBox>
    #endif
    #if __has_include(<QDialogButtonBox>)
        #include <QDialogButtonBox>
    #endif
    #if __has_include(<QProgressBar>)
        #include <QProgressBar>
    #endif
    #if __has_include(<QProgressDialog>)
        #include <QProgressDialog>
    #endif
    #if __has_include(<QRadioButton>)
        #include <QRadioButton>
    #endif
    #if __has_include(<QButtonGroup>)
        #include <QButtonGroup>
    #endif
    #if __has_include(<QSplashScreen>)
        #include <QSplashScreen>
    #endif
    #if __has_include(<QFontComboBox>)
        #include <QFontComboBox>
    #endif
    #if __has_include(<QApplication>)
        #include <QApplication>
    #endif
    #if __has_include(<QStatusBar>)
        #include <QStatusBar>
    #endif
    #if __has_include(<QStyle>)
        #include <QStyle>
    #endif
    #if __has_include(<QStylePainter>)
        #include <QStylePainter>
    #endif
    #if __has_include(<QStyleOptionButton>)
        #include <QStyleOptionButton>
    #endif
    #if __has_include(<QHeaderView>)
        #include <QHeaderView>
    #endif
    #if __has_include(<QUndoGroup>)
        #include <QUndoGroup>
    #endif
    #if __has_include(<QUndoStack>)
        #include <QUndoStack>
    #endif
    #if __has_include(<QGraphicsView>)
        #include <QGraphicsView>
    #endif
    #if __has_include(<QGraphicsScene>)
        #include <QGraphicsScene>
    #endif
    #if __has_include(<QGraphicsRectItem>)
        #include <QGraphicsRectItem>
    #endif
    #if __has_include(<QLabel>)
        #include <QLabel>
    #endif
    #if __has_include(<QFocusFrame>)
        #include <QFocusFrame>
    #endif
    #if __has_include(<QMouseEventTransition>)
        #include <QMouseEventTransition>
    #endif
    #if __has_include(<QCommonStyle>)
        #include <QCommonStyle>
    #endif
    #if __has_include(<QMdiSubWindow>)
        #include <QMdiSubWindow>
    #endif
    #if __has_include(<QSpacerItem>)
        #include <QSpacerItem>
    #endif
    #if __has_include(<QGraphicsSceneMouseEvent>)
        #include <QGraphicsSceneMouseEvent>
    #endif
    #if __has_include(<QScreen>)
        #include <QScreen>
    #endif
    #if __has_include(<QGestureEvent>)
        #include <QGestureEvent>
    #endif
    #if __has_include(<QSvgRenderer>)
        #include <QSvgRenderer>
    #endif
    #if __has_include(<QSvgGenerator>)
        #include <QSvgGenerator>
    #endif
#else
    // Fallback for compilers that do not support __has_include
    #include <QtXml>
    #include <QAbstractMessageHandler>
    #include <QXmlSchema>
    #include <QXmlSchemaValidator>
    #include <QXmlStreamReader>
    #include <QPointF>
    #include <QVariant>
    #include <QMap>
    #include <QByteArray>
    #include <QDateTime>
    #include <QtGlobal>
    #include <QtDebug>
    #include <QSharedData>
    #include <QAtomicInt>
    #include <QErrorMessage>
    #include <QPainterPath>
    #include <QPixmap>
    #include <QPainter>
    #include <QKeyEvent>
    #include <QFontDatabase>
    #include <QProcess>
    #include <QDesktopServices>
    #include <QTextDocument>
    #include <QTextDocumentFragment>
    #include <QTextCursor>
    #include <QAbstractTextDocumentLayout>
    #include <QTextBlock>
    #include <QTextList>
    #include <QClipboard>
    #include <QPlainTextEdit>
    #include <QStyledItemDelegate>
    #include <QDateTimeEdit>
    #include <QInputDialog>
    #include <QFormLayout>
    #include <QItemDelegate>
    #include <QStandardItemModel>
    #include <QSpinBox>
    #include <QScrollArea>
    #include <QScrollBar>
    #include <QToolBar>
    #include <QTreeWidget>
    #include <QFileDialog>
    #include <QColorDialog>
    #include <QDockWidget>
    #include <QStackedWidget>
    #include <QStackedLayout>
    #include <QListWidget>
    #include <QMessageBox>
    #include <QComboBox>
    #include <QMainWindow>
    #include <QMenu>
    #include <QMenuBar>
    #include <QSplitter>
    #include <QAction>
    #include <QActionGroup>
    #include <QLayout>
    #include <QBoxLayout>
    #include <QStandardItemModel>
    #include <QToolTip>
    #include <QToolBox>
    #include <QToolButton>
    #include <QPushButton>
    #include <QWizard>
    #include <QGroupBox>
    #include <QDial>
    #include <QTextEdit>
    #include <QLineEdit>
    #include <QCheckBox>
    #include <QDialogButtonBox>
    #include <QProgressBar>
    #include <QProgressDialog>
    #include <QRadioButton>
    #include <QButtonGroup>
    #include <QSplashScreen>
    #include <QFontComboBox>
    #include <QApplication>
    #include <QStatusBar>
    #include <QStyle>
    #include <QStylePainter>
    #include <QStyleOptionButton>
    #include <QHeaderView>
    #include <QUndoGroup>
    #include <QUndoStack>
    #include <QGraphicsView>
    #include <QGraphicsScene>
    #include <QGraphicsRectItem>
    #include <QLabel>
    #include <QFocusFrame>
    #include <QMouseEventTransition>
    #include <QCommonStyle>
    #include <QMdiSubWindow>
    #include <QSpacerItem>
    #include <QGraphicsSceneMouseEvent>
    #include <QScreen>
    #include <QGestureEvent>
    #include <QSvgRenderer>
    #include <QSvgGenerator>
#endif


// #include <QNetworkAccessManager>
// #include <QNetworkReply>
// #include <QNetworkCookie>
// #include <QNetworkCookieJar>
// #include <QNetworkProxyFactory>
// #include <QHostAddress>
// #include <QUdpSocket>

// #include <QHttpPart>
// #include <QHttpMultiPart>

#ifdef __has_include
    #if __has_include(<QQmlEngine>)
        #include <QQmlEngine>
    #endif
    #if __has_include(<QQmlComponent>)
        #include <QQmlComponent>
    #endif
    #if __has_include(<QQuickItem>)
        #include <QQuickItem>
    #endif
    #if __has_include(<QQuickPaintedItem>)
        #include <QQuickPaintedItem>
    #endif
    #if __has_include(<QQuickView>)
        #include <QQuickView>
    #endif
    #if __has_include(<QQuickWidget>)
        #include <QQuickWidget>
    #endif
    #if __has_include(<QWidgetAction>)
        #include <QWidgetAction>
    #endif
    #if __has_include(<QTextBrowser>)
        #include <QTextBrowser>
    #endif
    #if __has_include(<QJsonDocument>)
        #include <QJsonDocument>
    #endif
#else
    // Fallback for compilers that do not support __has_include
    #include <QQmlEngine>
    #include <QQmlComponent>
    #include <QQuickItem>
    #include <QQuickPaintedItem>
    #include <QQuickView>
    #include <QQuickWidget>
    #include <QWidgetAction>
    #include <QTextBrowser>
    #include <QJsonDocument>
#endif

// change Q_ASSERT to NOP if not debugging

#ifdef QT_NO_DEBUG
#undef Q_ASSERT_X
#define Q_ASSERT_X(a,b,c)
#undef Q_ASSERT
#define Q_ASSERT(a)
#endif

#if (defined (_MSCVER) || defined (_MSC_VER))
   // Undefined problematic #def'd macros in Microsoft headers
   #undef STRING_NONE
   #undef small
#endif

#endif  // __cplusplus

#endif

