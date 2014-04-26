/*
 * Copyright (C) 2013 Tomasz Olszak <olszak.tomasz@gmail.com>
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:

 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <QGuiApplication>
#include <QQuickWindow>
#include <QtDebug>
#include <QtGlobal>
#include <QQmlApplicationEngine>
#include <QScreen>
#include <QQuickItem>
extern "C" int OspMain(int argc, char *argv[])
{
#ifdef QT_TIZEN_EMULATOR
    qputenv("QSG_RENDER_LOOP","windows");
#endif
    qputenv("QT_QUICK_CONTROLS_STYLE","Tizen");
    QGuiApplication app(argc,argv);

    QQmlApplicationEngine engine(QUrl("qrc:///main.qml"));
    QQuickWindow *window = qobject_cast<QQuickWindow *>(engine.rootObjects().at(0));
    if (window) {
        window->setIcon(QIcon(":/images/mainmenu.png"));
        window->screen()->setOrientationUpdateMask(Qt::PortraitOrientation | Qt::LandscapeOrientation |
                                                   Qt::InvertedPortraitOrientation | Qt::InvertedLandscapeOrientation);
        window->show();
        return app.exec();
    } else {
        qWarning() << "null window";
        return -1;
    }
}

int main(int argc, char *argv[]) {
    return OspMain(argc,argv);
}
