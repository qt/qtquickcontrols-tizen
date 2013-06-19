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
import QtQuick.Controls.Tizen 1.0
import "DefaultSettings.js" as Theme
//import "utils.js" as Utils

Style {
    id: style
    property View control: __control
    //readonly property alias titleBar: __titleBar

    property Component view: //Item {
        Rectangle {
            width: 720 // TODO Utils.appWidth
            //width: control.width
            Binding { target: control; property: "implicitWidth"; value: width }
            height: 1280 // TODO Utils.appHeight
            //height: header.height + header2.height + 30 + 30
            Binding { target: control; property: "implicitHeight"; value: height }
            property Component contents: control.view
            Binding { target: control; property: "contents"; value: contents }

            //anchors.centerIn: parent
            //scale: Math.min(parent.width / width, parent.height / height)
            color: "#f8f6ef"

            TitleBar {
                id: __titleBar
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
            }
            Binding { target: control; property: "titleBar"; value: __titleBar }

/*            Loader {
                 id: contentsLoader
                 sourceComponent: contents
                 anchors.top: titleBar.bottom
                 anchors.left: parent.left
                 anchors.right: parent.right
                 anchors.bottom: parent.bottom
            }*/
        }
   // }
}
