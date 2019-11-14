#include <QtGui>
#include "scoreeditorwindow.h"

namespace Ms {
    QString revision = "123456";
}

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);
    
    ScoreEditorWindow window;
    window.show();
    
    return app.exec();
}
