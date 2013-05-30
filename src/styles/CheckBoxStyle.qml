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

CheckBoxStyle {
    id: checkboxStyle


    label: Text {
        text: control.text
        font.pointSize: Theme.checkBox.font.pixelSize
        color:if (control.enabled) {
                  if (control.pressed) {
                      Theme.checkBox.text.color.pressed
                  } else {
                      Theme.checkBox.text.color.normal
                  }
              } else {
                  Theme.checkBox.text.color.disabled
              }
        verticalAlignment: Text.AlignVCenter
    }

    property bool onOff: false

    property bool showDetails: false

    indicator: Item {
        implicitWidth: bg.implicitWidth
        implicitHeight: bg.implicitHeight
        Image {
            id:bg
            source: control.enabled ? (control.pressed? Theme.checkBox.indicator.source.pressed: Theme.checkBox.indicator.source.normal):Theme.checkBox.indicator.source.disabled
            anchors.centerIn:parent
            Image {
                visible: control.checked
                source: control.enabled ? (control.pressed || !control.checked ? Theme.checkBox.indicator.markSource.pressed: Theme.checkBox.indicator.markSource.normal):Theme.checkBox.indicator.markSource.disabled
            }
        }        
    }

    property Component background: Panel {
        pressed: control.pressed
        implicitWidth: 600
        implicitHeight: 100
    }


    property Component details: Item {
        implicitWidth: detailsBg.implicitWidth
        implicitHeight: detailsBg.height
        TizenBorderImage {
            id:detailsBg
            anchors.centerIn: parent
            source: Theme.checkBox.details.source.normal
            backgroundColor: control.enabled ? (control.pressed ? Theme.checkBox.details.color.pressed : Theme.checkBox.details.color.normal) : Theme.checkBox.details.color.disabled
            effectSource: control.enabled ? (control.pressed ? Theme.checkBox.details.effectSource.pressed : Theme.checkBox.details.effectSource.normal) : Theme.checkBox.details.effectSource.disabled
        }
        TizenBorderImage {
            anchors.centerIn: detailsBg
            source: Theme.checkBox.details.iconSource.normal
            backgroundColor: control.enabled ? (control.pressed ? Theme.checkBox.details.iconColor.pressed : Theme.checkBox.details.iconColor.normal) : Theme.checkBox.details.iconColor.disabled
            effectSource: Theme.checkBox.details.iconEffectSource.normal
        }
    }

    /*! \internal */
    property Component panel: Item {
        id:panelComponent

        implicitWidth: backgroundLoader.implicitWidth + padding.left + padding.right
        implicitHeight: backgroundLoader.implicitHeight + padding.top + padding.bottom
        Loader {
            id:backgroundLoader
            anchors.fill: parent
            sourceComponent: background
        }
        Loader {
            id: markIndicatorLoader
            sourceComponent: onOff ? null : indicator
            anchors.left: backgroundLoader.left
            anchors.top: backgroundLoader.top
            anchors.bottom: backgroundLoader.bottom
            anchors.leftMargin: Theme.checkBox.margins.left
            anchors.topMargin: Theme.checkBox.margins.top
            anchors.bottomMargin: Theme.checkBox.margins.bottom
        }
        Loader {
            id: labelLoader
            anchors.left: markIndicatorLoader.right
            anchors.leftMargin:  checkboxStyle.spacing
            anchors.top: backgroundLoader.top
            anchors.bottom: backgroundLoader.bottom
            anchors.right: detailsLoader.left
            anchors.topMargin: Theme.checkBox.margins.top
            anchors.bottomMargin: Theme.checkBox.margins.bottom
            sourceComponent: label
        }

        Loader {
            id:detailsLoader
            anchors.top: backgroundLoader.top
            anchors.bottom: backgroundLoader.bottom
            anchors.right: backgroundLoader.right
            anchors.topMargin: Theme.checkBox.margins.top
            anchors.bottomMargin: Theme.checkBox.margins.bottom
            anchors.rightMargin: Theme.checkBox.margins.right
            sourceComponent: showDetails ? details : null
        }
    }
}
