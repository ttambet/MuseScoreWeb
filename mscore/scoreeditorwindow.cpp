#include "scoreeditorwindow.h"
#include "mscore/scoreview.h"
#include "libmscore/score.h"

using namespace Ms;

ScoreEditorWindow::ScoreEditorWindow() : QMainWindow() {
    ScoreView* scoreView = new ScoreView;
    setCentralWidget(scoreView);

    MasterScore* score = new MasterScore(MScore::baseStyle());
    QString name = ":/data/My_First_Score.mscx";
    Score::FileError rv = score->loadMsc(name, false);

    scoreView->setScore(score);
}