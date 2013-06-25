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
    property TitleBar control: __control

    property Component panel: Rectangle {

        color: Theme.titleBar.backgroundColor
        implicitWidth: 720
        implicitHeight: header.height + header2.height + 30 + 30

        FontLoader { source: Theme.fonts.defaultSource }

        Text {
            id: header
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            anchors.topMargin: 30
            height: contentHeight
            color: "#3b73b6"
            font.family: Theme.fonts.defaultFamily
            font.capitalization: Font.AllUppercase
            text: control.text
            font.pixelSize: 36
        }
        Text {
            id: header2
            anchors.top: header.bottom
            anchors.left: header.left
            anchors.right: header.right
            anchors.leftMargin: header.leftMargin
            anchors.rightMargin: header.rightMargin
            height: contentHeight
            color: header.color
            font.family: header.font.family
            text: control.subText
            font.pixelSize: 24
        }
    }
}
