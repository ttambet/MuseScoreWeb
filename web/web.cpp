#include <QtGui>
#include "scoreeditorwindow.h"
#include "libmscore/score.h"

// namespace Ms {
//     QString revision = "123456";
// }

using namespace Ms;

int main2(int argc, char **argv)
{
    QGuiApplication app(argc, argv);
    MScore::init();
    
    MasterScore* score = new MasterScore(MScore::baseStyle());
    QString name = ":/data/My_First_Score.mscx";
    Score::FileError rv = score->loadMsc(name, false);
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
