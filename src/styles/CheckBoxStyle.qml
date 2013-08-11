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
import QtQuick.Controls.Styles.Tizen 1.0
import "private"

CheckBoxStyle {
    id: checkboxStyle

    label: Text {
        text: control.text
        font.pointSize: TizenConfig.checkBox.font.pixelSize
        color:if (control.enabled) {
                  if (control.pressed) {
                      TizenConfig.checkBox.text.color.pressed
                  } else {
                      TizenConfig.checkBox.text.color.normal
                  }
              } else {
                  TizenConfig.checkBox.text.color.disabled
              }
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Image {
        source: control.enabled ? (control.pressed? TizenConfig.checkBox.indicator.source.pressed: TizenConfig.checkBox.indicator.source.normal):TizenConfig.checkBox.indicator.source.disabled
        Image {
            visible: control.checked
            source: control.enabled ? (control.pressed || !control.checked ? TizenConfig.checkBox.indicator.markSource.pressed: TizenConfig.checkBox.indicator.markSource.normal):TizenConfig.checkBox.indicator.markSource.disabled
        }
    }


    background: PrivatePanel {
        id:panel
        pressed: control.pressed
        property var pressedColor: control.styleHints && control.styleHints["pressedColor"] ? control.styleHints["pressedColor"]: TizenConfig.panel.color.pressed
        property var normalColor: control.styleHints && control.styleHints["color"] ? control.styleHints["color"]: TizenConfig.panel.color.normal
        backgroundColor: control.pressed ? pressedColor : normalColor
        implicitWidth: 600
        implicitHeight: 100
    }
}
