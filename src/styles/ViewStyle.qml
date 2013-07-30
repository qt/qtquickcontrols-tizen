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
import QtQuick.Controls.Tizen 1.0
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles.Tizen 1.0
//import "utils.js" as Utils

Style {
    id: style
    property View control: __control

    property Component panel: Rectangle {
        Binding { target: styleData.titleBar; property: "anchors.top"; value: control.top }
        Binding { target: styleData.titleBar; property: "anchors.left"; value: control.left }
        Binding { target: styleData.titleBar; property: "anchors.right"; value: control.right }

        Binding { target: styleData.content; property: "anchors.top"; value: styleData.titleBar.bottom }
        Binding { target: styleData.content; property: "anchors.bottom"; value: styleData.toolBar.top }
        Binding { target: styleData.content; property: "anchors.left"; value: control.left }
        Binding { target: styleData.content; property: "anchors.right"; value: control.right }

        Binding { target: styleData.toolBar; property: "anchors.bottom"; value: control.bottom }
        Binding { target: styleData.toolBar; property: "anchors.left"; value: control.left }
        Binding { target: styleData.toolBar; property: "anchors.right"; value: control.right }

        focus: true

        Keys.onReleased: {
            if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
                backAction.trigger()
                event.accepted = true
            } else if (event.key === Qt.Key_Menu || event.key === Qt.Key_F2) {
                console.log("NOT IMPLEMENTED: ContextMenu should be shown")
                event.accepted = true
            }
        }

        implicitWidth: 720
        implicitHeight: 1280

        color: TizenConfig.colors.background
        Binding {target: parent/*panelLoader*/; property:"focus"; value: true}
        Binding {target: control; property:"focus"; value: true}
    }
}
