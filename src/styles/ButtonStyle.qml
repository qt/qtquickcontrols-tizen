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
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "DefaultSettings.js" as Theme

ButtonStyle {
    id: buttonstyle

    background: TizenBorderImage {
        implicitWidth: 400
        implicitHeight: 80

        property color bgColorNormal: control.styleHints && control.styleHints.color ? control.styleHints.color :Theme.button.backgroundColor.normal
        property color bgColorPressed: control.styleHints && control.styleHints.pressedColor ? control.styleHints.pressedColor :Theme.button.backgroundColor.pressed
        property color bgColorDisabled: control.styleHints && control.styleHints.disabledColor ? control.styleHints.disabledColor : Theme.button.backgroundColor.disabled

        source: control.enabled ? (control.pressed ? Theme.button.source.pressed: Theme.button.source.normal) : Theme.button.source.disabled
        effectSource: control.enabled ? (control.pressed ? Theme.button.effectSource.pressed: Theme.button.effectSource.normal) : Theme.button.effectSource.disabled
        backgroundColor: control.enabled ? (control.pressed ? bgColorPressed : bgColorNormal) : bgColorDisabled
    }

    /*! The label of the button. */
    label: Item {
        implicitWidth: 0
        implicitHeight: 0
        Text {
            id:txt
            anchors.leftMargin: Theme.button.text.margins.left
            anchors.rightMargin: Theme.button.text.margins.right
            anchors.topMargin: Theme.button.text.margins.top
            anchors.bottomMargin: Theme.button.text.margins.bottom
            anchors.fill:parent
            font.pixelSize: Theme.button.font.pixelSize
            color: control.enabled ? (control.pressed ? Theme.button.text.color.pressed : Theme.button.text.color.normal) : Theme.button.text.color.disabled
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text:control.text
            minimumPixelSize: Theme.button.font.minimumPixelSize
            maximumLineCount:2
            wrapMode: Text.Wrap
        }
    }
}
