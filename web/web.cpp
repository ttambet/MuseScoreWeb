#include <QtGui>
#include "scoreeditorwindow.h"
#include "libmscore/score.h"
#include "libmscore/sym.h"
#include "preferences.h"
#include "musescore.h"
#include "mscore/shortcut.h"
#include "mscore/workspace.h"

// namespace Ms {
//     QString revision = "123456";
// }

namespace Ms {
    extern QString iconPath;
}

using namespace Ms;

int main2(int argc, char **argv)
{
    QApplication app(argc, argv);
    MScore::init();
    preferences.init();
    // if (useFactorySettings)
    //         localeName = "system";
    //   else {
    //         QSettings s;
    //         localeName = s.value(PREF_UI_APP_LANGUAGE, "system").toString();
    //         }

    //   setMscoreLocale(localeName);
    MuseScore::updateUiStyleAndTheme();
    iconPath = QString(":/data/icons/");
    Shortcut::init();
    mscore = new MuseScore();
    WorkspacesManager::initCurrentWorkspace();
    gscore = new MasterScore();
      gscore->setPaletteMode(true);
      gscore->setMovements(new Movements());
      gscore->setStyle(MScore::baseStyle());
gscore->style().set(Sid::MusicalTextFont, QString("Bravura Text"));
      ScoreFont* scoreFont = ScoreFont::fontFactory("Bravura");
      gscore->setScoreFont(scoreFont);
      gscore->setNoteHeadWidth(scoreFont->width(SymId::noteheadBlack, gscore->spatium()) / SPATIUM20);

      //read languages list
      mscore->readLanguages(mscoreGlobalShare + "locale/languages.xml");
      QApplication::instance()->installEventFilter(mscore);
    //   mscore->setRevision(Ms::revision);
            mscore->readSettings();
            QObject::connect(qApp, SIGNAL(messageReceived(const QString&)),
               mscore, SLOT(handleMessage(const QString&)));

            // static_cast<QtSingleApplication*>(qApp)->setActivationWindow(mscore, false);

    // Score::FileError rv = Ms::readScore(score, name, false);
    // ScoreView* currentScoreView = mscore->appendScore(score);
    // MasterScore* score = readScore(a);
    //               if (score) {
    //                     setCurrentScoreView(appendScore(score));
    //                     addRecentScore(score);
    //                     writeSessionFile(false);
    //                     }
    //               }

    //                 startScore = ":/data/My_First_Score.mscx";

    //                           MasterScore* score = mscore->readScore(startScore);
    //                           if (startScore.startsWith(":/") && score) {
    //                                 score->setStyle(MScore::defaultStyle());
    //                                 score->style().checkChordList();
    //                                 score->styleChanged();
    //                                 score->setName(mscore->createDefaultName());
    //                                 // TODO score->setPageFormat(*MScore::defaultStyle().pageFormat());
    //                                 score->doLayout();
    //                                 score->setCreated(true);
    //                                 }
    //                           if (score == 0) {
    //                                 score = mscore->readScore(":/data/My_First_Score.mscx");
    //                                 if (score) {
    //                                       score->setStyle(MScore::defaultStyle());
    //                                       score->style().checkChordList();
    //                                       score->styleChanged();
    //                                       score->setName(mscore->createDefaultName());
    //                                       // TODO score->setPageFormat(*MScore::defaultStyle().pageFormat());
    //                                       score->doLayout();
    //                                       score->setCreated(true);
    //                                       }
    //                                 }
    //                           if (score)
    //                                 currentScoreView = mscore->appendScore(score);
    //                           }
    //                           break;

    ScoreEditorWindow window;
    window.show();
    
    return app.exec();
}
