//=============================================================================
//  MuseScore
//  Music Composition & Notation
//
//  Copyright (C) 2019 Werner Schweer and others
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

#ifndef __QMLDOCKWIDGET_H__
#define __QMLDOCKWIDGET_H__

namespace Ms {

#ifndef NDEBUG
extern bool useSourceQmlFiles;
#endif

//---------------------------------------------------------
//   FocusChainBreak
//---------------------------------------------------------

class FocusChainBreak : public QQuickItem
      {
      Q_OBJECT

   signals:
      void requestFocusTransfer(bool forward);

   public:
      FocusChainBreak(QQuickItem* parent = nullptr);

      void focusInEvent(QFocusEvent*) override;
      };

//---------------------------------------------------------
//   MsQuickView
//---------------------------------------------------------

class MsQuickView : public QQuickWidget
      {
      Q_OBJECT

      QWidget* prevFocusWidget = nullptr;

      static void registerQmlTypes();
      void init();

   private slots:
      void transferFocus(bool forward);
      void onStatusChanged(QQuickWidget::Status);

   public:
      MsQuickView(const QUrl& source, QWidget* parent = nullptr);
      MsQuickView(QQmlEngine* engine, QWidget* parent)
         : QQuickWidget(engine, parent) { init(); }
      MsQuickView(QWidget* parent = nullptr)
         : QQuickWidget(parent) { init(); }

      void focusInEvent(QFocusEvent*) override;
      void keyPressEvent(QKeyEvent* e) override;
      };

//---------------------------------------------------------
//   QmlStyle
///   Implements setting colors and fonts for QML-based
///   widgets styling. Color palette is not available in
///   Qt Quick before Qt 5.10.
//---------------------------------------------------------

class QmlStyle : public QObject
      {
      Q_OBJECT

      QPalette _palette;
      QFont _font;

#define COLOR_PROPERTY(name, role) \
      Q_PROPERTY(QColor name READ get_##name CONSTANT) \
      QColor get_##name() const { return _palette.color(role); }

      COLOR_PROPERTY(window, QPalette::Window)
      COLOR_PROPERTY(windowText, QPalette::WindowText)
      COLOR_PROPERTY(base, QPalette::Base)
      COLOR_PROPERTY(alternateBase, QPalette::AlternateBase)
      COLOR_PROPERTY(text, QPalette::Text)
      COLOR_PROPERTY(button, QPalette::Button)
      COLOR_PROPERTY(buttonText, QPalette::ButtonText)
      COLOR_PROPERTY(brightText, QPalette::BrightText)
      COLOR_PROPERTY(toolTipBase, QPalette::ToolTipBase)
      COLOR_PROPERTY(toolTipText, QPalette::ToolTipText)
      COLOR_PROPERTY(link, QPalette::Link)
      COLOR_PROPERTY(linkVisited, QPalette::LinkVisited)
      COLOR_PROPERTY(highlight, QPalette::Highlight)
      COLOR_PROPERTY(highlightedText, QPalette::HighlightedText)

#undef COLOR_PROPERTY

      Q_PROPERTY(QFont font READ font CONSTANT)

      QFont font() const { return _font; }

  public:
      QmlStyle(QPalette, QObject* parent = nullptr);
      };

//---------------------------------------------------------
//   QmlDockWidget
//---------------------------------------------------------

class QmlDockWidget : public QDockWidget
      {
      Q_OBJECT

      QQuickWidget* _view = nullptr;
      QmlStyle* qmlStyle = nullptr;
      QQmlEngine* engine;

      QQuickWidget* getView();
      void setupStyle();

   protected:
      QSize initialViewSize() const { return _view ? _view->initialSize() : QSize(); }

   public:
      QmlDockWidget(QQmlEngine* e = nullptr, QWidget* parent = nullptr, Qt::WindowFlags flags = Qt::WindowFlags());
      QmlDockWidget(QQmlEngine* e, const QString& title, QWidget* parent = nullptr, Qt::WindowFlags flags = Qt::WindowFlags());

      static QString qmlSourcePrefix();
      void setSource(const QUrl& url);
      QUrl source() const;

      QQmlContext* rootContext() { return getView()->rootContext(); }
      QQuickItem* rootObject() { return getView()->rootObject(); }

      const QQuickWidget* view() const { return _view; }

      void changeEvent(QEvent* evt) override;
      void resizeEvent(QResizeEvent* evt) override;

      void ensureQmlViewFocused();
      };

}
#endif

