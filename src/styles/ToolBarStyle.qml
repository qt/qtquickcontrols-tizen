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
import "DefaultSettings.js" as Theme

Style {
    id: style
    property ToolBar control: __control

    property Component toolBar: Rectangle {
        color: Theme.toolBar.backgroundColor
        width: 720
        Binding { target: control; property: "implicitWidth"; value: width }
        height: 98
        Binding { target: control; property: "implicitHeight"; value: height }

        ToolBarButton {
            id: moreButton
            source: Theme.toolBar.more.source
            effectSource: Theme.toolBar.more.effectSource.normal
            anchors.left: parent.left
            anchors.leftMargin: 26
        }
        ToolBarButton {
            id: backButton
            source: Theme.toolBar.back.source
            effectSource: Theme.toolBar.back.effectSource.normal
            anchors.right: parent.right
            anchors.rightMargin: 26
            onClicked: { /*console.log("back clicked");*/ view.backAction.trigger(); }
        }
    }
}
