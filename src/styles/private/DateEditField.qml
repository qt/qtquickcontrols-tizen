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
import QtQuick.Controls.Styles.Tizen 1.0

TizenBorderImage {
    id: root
    implicitWidth: TizenConfig.dateEdit.content.day.width
    implicitHeight: TizenConfig.dateEdit.content.date.height

    source: "../"+TizenConfig.dateEdit.content.source.normal

    property alias text: dayText.text

    effectSource: enabled ? (pressed ? "../"+TizenConfig.dateEdit.content.effectSource.pressed : "../"+TizenConfig.dateEdit.content.effectSource.normal) : "../"+TizenConfig.dateEdit.content.effectSource.disabled

    backgroundColor: pressed ? TizenConfig.dateEdit.content.color.pressed : TizenConfig.dateEdit.content.color.normal

    property bool pressed: false

    Text {
        id:dayText
        anchors.fill: parent
        font.pixelSize: TizenConfig.dateEdit.content.date.fontSize
        fontSizeMode: Text.Fit
        color: enabled ? (pressed ? TizenConfig.dateEdit.content.text.color.pressed : TizenConfig.dateEdit.content.text.color.normal):TizenConfig.dateEdit.content.text.color.disabled
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    MouseArea {
        id: dayMouseArea
        anchors.fill: parent
        onClicked: root.pressed = true
    }
}
