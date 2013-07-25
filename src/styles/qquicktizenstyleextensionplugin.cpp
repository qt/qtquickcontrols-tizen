/*
 * Copyright (C) 2013 Tomasz Olszak <olszak.tomasz@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#include "qquicktizenstyleextensionplugin.h"
#include <QtQml>

QQuickTizenStyleExtensionPlugin::QQuickTizenStyleExtensionPlugin(QObject *parent) :
    QQmlExtensionPlugin(parent)
{
}


static QObject *tizen_style_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(scriptEngine)

    QObject *ret = 0;

    QQmlComponent c(engine,QUrl("qrc:///QtQuick/Controls/Styles/Tizen/private/TizenStyleConfig.qml"),QQmlComponent::PreferSynchronous);
    if (c.status() == QQmlComponent::Ready) {
        ret = c.create();
        if (!ret) {
            qWarning() << "Can't create Tizen Style Singleton Object:"<<c.errorString();
        }
    } else {

        qWarning() << "Tizen Style Singleton Component not Ready:"<<c.errorString();
    }

    return ret;
}

//static QJSValue tizen_style_jssingletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
//{
//    Q_UNUSED(engine)
//    QJSValue ret;
//    QString fileName = "DefaultSettings.js";
//    QFile scriptFile(QString(":/QtQuick/Controls/Styles/Tizen/%1").arg(fileName));
//    if (scriptFile.open(QIODevice::ReadOnly)) {
//        QTextStream stream(&scriptFile);
//        QString contents = stream.readAll();
//        scriptFile.close();
//        ret = scriptEngine->evaluate(contents, fileName);
//        if (ret.isError()) {
//            qWarning() <<"fileCOntent:"<<contents;
//            qWarning() << "Tizen Style Singleton - Error while loading:" << fileName<< ":"<<ret.property("message").toString();
//        }
//    } else {
//        qWarning() << "Tizen Style Singleton - Cannot load singleton "<< scriptFile.fileName()<<":"<<scriptFile.errorString();
//    }

//    return ret;
//}

void QQuickTizenStyleExtensionPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("QtQuick.Controls.Styles.Tizen"));
    qmlRegisterSingletonType<QObject>(uri,1,0,"TizenConfig",tizen_style_singletontype_provider);
    //qmlRegisterSingletonType(uri,1,0,"TizenConfig",tizen_style_jssingletontype_provider);
}

void QQuickTizenStyleExtensionPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    QQmlExtensionPlugin::initializeEngine(engine,uri);
}
