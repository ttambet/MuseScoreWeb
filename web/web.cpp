#include <QtGui>
#include "scoreeditorwindow.h"
#include "libmscore/score.h"
#include "libmscore/sym.h"
#include "preferences.h"
#include "musescore.h"
#include "mscore/shortcut.h"
#include "mscore/workspace.h"
#include <QFontDatabase>

// namespace Ms {
//     QString revision = "123456";
// }

namespace Ms {
    extern QString iconPath;
}

using namespace Ms;

bool isFontLoaded2(const QString& fontName) {
    QFontDatabase fontDatabase;
    if (fontDatabase.families().contains(fontName)) {
        qDebug("Font is loaded.");
        return true;
    } else {
        qDebug("Font not loaded.");
        return false;
    }
}


int main3(int argc, char **argv) {
    QApplication app(argc, argv);
    MScore::init();
    preferences.init();

    MuseScore::updateUiStyleAndTheme();
    iconPath = QString(":/data/icons/");
    Shortcut::init();
    mscore = new MuseScore();
    WorkspacesManager::initCurrentWorkspace();
    gscore = new MasterScore();
    gscore->setPaletteMode(true);
    gscore->setMovements(new Movements());

    // Check if the font is loaded
    isFontLoaded2("Bravura");
    isFontLoaded2("MScore");

    // Set the musical text font
    gscore->style().set(Sid::MusicalTextFont, QString("Bravura"));
    gscore->setScoreFont(ScoreFont::fontFactory(gscore->styleSt(Sid::MusicalSymbolFont)));

    // Set the note head width
    gscore->setNoteHeadWidth(gscore->scoreFont()->width(SymId::noteheadBlack, gscore->spatium() / SPATIUM20));
    
    gscore->doLayout();
    gscore->setCreated(true);

    // Read languages list
    mscore->readLanguages(mscoreGlobalShare + "locale/languages.xml");
    QApplication::instance()->installEventFilter(mscore);
    mscore->readSettings();
    QObject::connect(qApp, SIGNAL(messageReceived(const QString&)), mscore, SLOT(handleMessage(const QString&)));

    ScoreEditorWindow window;
    window.show();

    return app.exec();
}

