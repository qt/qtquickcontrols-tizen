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

import QtQuick 2.1
import ".."
import "../DefaultSettings.js" as Theme


TizenBorderImage {
    id: root
    implicitWidth: Theme.dateEdit.content.day.width
    implicitHeight: Theme.dateEdit.content.date.height

    source: "../"+Theme.dateEdit.content.source.normal

    property alias text: dayText.text

    effectSource: enabled ? (pressed ? "../"+Theme.dateEdit.content.effectSource.pressed : "../"+Theme.dateEdit.content.effectSource.normal) : "../"+Theme.dateEdit.content.effectSource.disabled

    backgroundColor: pressed ? Theme.dateEdit.content.color.pressed : Theme.dateEdit.content.color.normal

    property bool pressed: false

    Text {
        id:dayText
        anchors.fill: parent
        font.pixelSize: Theme.dateEdit.content.date.fontSize
        fontSizeMode: Text.Fit
        color: enabled ? (pressed ? Theme.dateEdit.content.text.color.pressed : Theme.dateEdit.content.text.color.normal):Theme.dateEdit.content.text.color.disabled
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    MouseArea {
        id: dayMouseArea
        anchors.fill: parent
        onClicked: root.pressed = true
    }
}
