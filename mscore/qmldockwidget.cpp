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

#include "qmldockwidget.h"

#include "musescore.h"
#include "preferences.h"
#include "qml/nativemenu.h"

#include <QQmlContext>

namespace Ms {

#ifndef NDEBUG
bool useSourceQmlFiles = false;
#endif

//---------------------------------------------------------
//   FocusChainBreak
//---------------------------------------------------------

FocusChainBreak::FocusChainBreak(QQuickItem* parent)
   : QQuickItem(parent)
      {
      setActiveFocusOnTab(true);
      setFocus(true);
      }

//---------------------------------------------------------
//   FocusChainBreak::focusInEvent
//---------------------------------------------------------

void FocusChainBreak::focusInEvent(QFocusEvent* evt)
      {
      QQuickItem::focusInEvent(evt);
      if (evt->reason() == Qt::TabFocusReason)
            emit requestFocusTransfer(true);
      else if (evt->reason() == Qt::BacktabFocusReason)
            emit requestFocusTransfer(false);
      }

//---------------------------------------------------------
//   MsQuickView
//---------------------------------------------------------

MsQuickView::MsQuickView(const QUrl& source, QWidget* parent)
   : QQuickWidget(parent) // init() should be called before setting source
      {
      init();
      setSource(source);
      }

//---------------------------------------------------------
//   MsQuickView::init
//---------------------------------------------------------

void MsQuickView::init()
      {
      registerQmlTypes();
      connect(this, &QQuickWidget::statusChanged, this, &MsQuickView::onStatusChanged);
      }

//---------------------------------------------------------
//   registerQmlTypes
//---------------------------------------------------------

void MsQuickView::registerQmlTypes()
      {
      static bool registered = false;
      if (registered)
            return;

      qmlRegisterType<FocusChainBreak>("MuseScore.Utils", 3, 3, "FocusChainBreak");

      qmlRegisterType<QmlNativeMenu>("MuseScore.Utils", 3, 3, "Menu");
      qmlRegisterType<QmlMenuSeparator>("MuseScore.Utils", 3, 3, "MenuSeparator");
      qmlRegisterType<QmlMenuItem>("MuseScore.Utils", 3, 3, "MenuItem");

      registered = true;
      }

//---------------------------------------------------------
//   MsQuickView::onStatusChanged
//---------------------------------------------------------

void MsQuickView::onStatusChanged(QQuickWidget::Status status)
      {
      if (status == QQuickWidget::Ready) {
            FocusChainBreak* fb = rootObject()->findChild<FocusChainBreak*>();
            if (fb)
                  connect(fb, &FocusChainBreak::requestFocusTransfer, this, &MsQuickView::transferFocus);
            }
      }

//---------------------------------------------------------
//   MsQuickView::transferFocus
//---------------------------------------------------------

void MsQuickView::transferFocus(bool forward)
      {
      if (prevFocusWidget) {
            QWidget* focusWidget =
               forward
               ? prevFocusWidget->nextInFocusChain()
               : prevFocusWidget->previousInFocusChain();

            if (focusWidget)
                  focusWidget->setFocus();
            }
      }

//---------------------------------------------------------
//   MsQuickView::focusInEvent
//---------------------------------------------------------

void MsQuickView::focusInEvent(QFocusEvent* evt)
      {
      prevFocusWidget = QApplication::focusWidget();
      QQuickWidget::focusInEvent(evt);
      }

//---------------------------------------------------------
//   MsQuickView::keyPressEvent
//---------------------------------------------------------

void MsQuickView::keyPressEvent(QKeyEvent* evt)
      {
      QQuickWidget::keyPressEvent(evt);
      if (evt->isAccepted())
            return;

      if (evt->key() == Qt::Key_Escape && evt->modifiers() == Qt::NoModifier) {
            mscore->focusScoreView();
            evt->accept();
            }
      }

//---------------------------------------------------------
//   QmlStyle
//---------------------------------------------------------

QmlStyle::QmlStyle(QPalette p, QObject* parent)
   : QObject(parent), _palette(p)
      {
      _font.setFamily(preferences.getString(PREF_UI_THEME_FONTFAMILY));
      _font.setPointSize(preferences.getInt(PREF_UI_THEME_FONTSIZE));
      }

//---------------------------------------------------------
//   QmlDockWidget
//---------------------------------------------------------

QmlDockWidget::QmlDockWidget(QQmlEngine* e, QWidget* parent, Qt::WindowFlags flags)
   : QDockWidget(parent, flags), engine(e)
      {}

QmlDockWidget::QmlDockWidget(QQmlEngine* e, const QString& title, QWidget* parent, Qt::WindowFlags flags)
   : QDockWidget(title, parent, flags), engine(e)
      {}

//---------------------------------------------------------
//   QmlDockWidget::getView
//---------------------------------------------------------

QQuickWidget* QmlDockWidget::getView()
      {
      if (!_view) {
            QQuickWindow::setSceneGraphBackend(QSGRendererInterface::Software);
            if (engine)
                  _view = new MsQuickView(engine, nullptr);
            else
                  _view = new MsQuickView();

            // QWidget* container = QWidget::createWindowContainer(_view, this);
            // container->setFocusPolicy(Qt::TabFocus); // or Qt::StrongFocus?
            // container->setSizePolicy(Qt::);
            setWidget(_view);
            }
      return _view;
      }

//---------------------------------------------------------
//   QmlDockWidget::ensureQmlViewFocused
//---------------------------------------------------------

void QmlDockWidget::ensureQmlViewFocused()
      {
      if (_view && !_view->hasFocus())
            widget()->setFocus();
      }

//---------------------------------------------------------
//   QmlDockWidget::setupStyle
//---------------------------------------------------------

void QmlDockWidget::setupStyle()
      {
      QQuickWidget* view = getView();
      view->setClearColor(QApplication::palette().color(QPalette::Window));

      if (qmlStyle)
            qmlStyle->deleteLater();

      qmlStyle = new QmlStyle(QApplication::palette(), this);
      rootContext()->setContextProperty("globalStyle", qmlStyle);
      }

//---------------------------------------------------------
//   QmlDockWidget::qmlSourcePrefix
//---------------------------------------------------------

QString QmlDockWidget::qmlSourcePrefix()
      {
#ifndef NDEBUG
      if (useSourceQmlFiles) {
            const QFileInfo fi(__FILE__);
            const QDir mscoreDir = fi.absoluteDir();
            return QUrl::fromLocalFile(mscoreDir.absolutePath()).toString() + '/';
            }
#endif
      static const QString qmlResourcesRoot("qrc:/");
      return qmlResourcesRoot;
      }

//---------------------------------------------------------
//   QmlDockWidget::setSource
//---------------------------------------------------------

void QmlDockWidget::setSource(const QUrl& url)
      {
      QQuickWidget* view = getView();

      setupStyle();

      view->setSource(url);
      // In some cases, setSource() will result in errors the first time the sources are loaded.
      // If this happens, reload the sources from the same URL.
      // For some reason, it seems to work the second time.
      if (view->status() == QQuickWidget::Error) {
            qDebug() << "Error loading QML source, retrying: " << url;
            engine->clearComponentCache();
            view->setSource(url);
            }
      view->setResizeMode(QQuickWidget::SizeRootObjectToView);
      }

//---------------------------------------------------------
//   QmlDockWidget::source
//---------------------------------------------------------

QUrl QmlDockWidget::source() const
      {
      return _view ? _view->source() : QUrl();
      }

//---------------------------------------------------------
//   QmlDockWidget::changeEvent
//---------------------------------------------------------

void QmlDockWidget::changeEvent(QEvent* evt)
      {
      QDockWidget::changeEvent(evt);
      switch (evt->type()) {
            case QEvent::StyleChange:
                  setupStyle();
                  break;
            default:
                  break;
            }
      }

//---------------------------------------------------------
//   QmlDockWidget::resizeEvent
//---------------------------------------------------------

void QmlDockWidget::resizeEvent(QResizeEvent* evt)
      {
      QDockWidget::resizeEvent(evt);
      // update() call prevents QML content from being drawn
      // at incorrect position when maximizing/demaximizing
      // MuseScore window (Qt 5.9 only?)
      if (_view)
            _view->update();
      }
}
