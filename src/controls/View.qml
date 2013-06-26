/*
 * Copyright (C) 2013 Jarosław Staniek <staniek@kde.org>
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
import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Tizen 1.0

Control {
    id: root
    readonly property alias titleBar: prvTitleBar
    readonly property alias toolBar: prvToolBar
    property alias backAction: prvBackAction

    // all View's children go to content
    default property alias data: prvContent.data

    /*! \internal */
    style: Qt.createComponent(Settings.style + "/ViewStyle.qml", root)

    __styleData: QtObject {
        property alias content: prvContent
        property alias titleBar: prvTitleBar
        property alias toolBar: prvToolBar
        property Action backAction: prvBackAction
    }

    TitleBar { id: prvTitleBar }
    Item { id: prvContent   }
    ToolBar { id: prvToolBar; view: root }
    Action {
        id: prvBackAction
//        onTriggered: { console.debug("Quit!"); Qt.quit(); }
    }
}
