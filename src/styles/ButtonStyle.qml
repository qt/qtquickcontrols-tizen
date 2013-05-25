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
import "DefaultSettings.js" as Default

ButtonStyle {
    id: buttonstyle

    background: TizenBorderImage {
        implicitWidth: 300
        implicitHeight: 50
        source: control.enabled ? (control.pressed ? Default.button.source.pressed: Default.button.source.normal) : Default.button.source.disabled
        effectSource: control.enabled ? (control.pressed ? Default.button.effectSource.pressed: Default.button.effectSource.normal) : Default.button.effectSource.disabled
        backgroundColor: control.enabled ? (control.pressed ? Default.button.backgroundColor.pressed: Default.button.backgroundColor.normal) : Default.button.backgroundColor.disabled
    }

    /*! The label of the button. */
    label: Item {
        implicitWidth: 0
        implicitHeight: 0
        Text {
            id:txt
            anchors.leftMargin: Default.button.text.margins.left
            anchors.rightMargin: Default.button.text.margins.right
            anchors.topMargin: Default.button.text.margins.top
            anchors.bottomMargin: Default.button.text.margins.bottom
            anchors.fill:parent
            font.pixelSize: Default.button.font.pixelSize
            color: control.enabled ? (control.pressed ? Default.button.text.color.pressed : Default.button.text.color.normal) : Default.button.text.color.disabled
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text:control.text
            minimumPixelSize: Default.button.font.minimumPixelSize
            maximumLineCount:2
            wrapMode: Text.Wrap
        }
    }
}
