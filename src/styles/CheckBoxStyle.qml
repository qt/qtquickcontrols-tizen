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

CheckBoxStyle {
    id: checkboxStyle


    label: Text {
        text: control.text
        font.pointSize: Default.checkBox.font.pixelSize
        color:if (control.enabled) {
                  if (control.pressed) {
                      Default.checkBox.text.color.pressed
                  } else {
                      Default.checkBox.text.color.normal
                  }
              } else {
                  Default.checkBox.text.color.disabled
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
            source: control.enabled ? (control.pressed? Default.checkBox.indicator.source.pressed: Default.checkBox.indicator.source.normal):Default.checkBox.indicator.source.disabled
            anchors.centerIn:parent
            Image {
                visible: control.checked
                source: control.enabled ? (control.pressed || !control.checked ? Default.checkBox.indicator.markSource.pressed: Default.checkBox.indicator.markSource.normal):Default.checkBox.indicator.markSource.disabled
            }
        }        
    }
    property Component onOffIndicator: Item {
        id:onOffind
        implicitWidth: onOffBackground.implicitWidth
        implicitHeight: onOffBackground.implicitHeight
        state:"normal"
        Image {
            id:onOffBackground
            anchors.centerIn: parent
            source: if (control.checked) {
                        control.enabled ? Default.checkBox.onOff.backgroundSource.on.normal :  Default.checkBox.onOff.backgroundSource.on.disabled
                    } else {
                        control.enabled ? Default.checkBox.onOff.backgroundSource.off.normal :  Default.checkBox.onOff.backgroundSource.off.disabled
                    }            
            Image {
                id:icon
                source: control.enabled ? ( control.pressed ? Default.checkBox.onOff.icon.source.pressed : Default.checkBox.onOff.icon.source.normal) :  Default.checkBox.onOff.icon.source.disabled
                Image {
                    source: control.enabled ? ( control.pressed ? Default.checkBox.onOff.handlerSource.pressed : Default.checkBox.onOff.handlerSource.normal) :  Default.checkBox.onOff.handlerSource.disabled
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            focus:true

            onMouseXChanged: {
                if (pressed) {
                    if (mouse.x >= 0) {
                        if (mouse.x <= onOffBackground.width - icon.width) {
                            icon.x = mouse.x
                        } else {
                            icon.x = onOffBackground.width - icon.width
                        }
                    } else {
                        icon.x = 0
                    }
                }
            }

            onReleased: control.checked = (icon.x > onOffBackground.width/2)
        }
        states: [
            State {
                name:"normal"
                when:!control.checked
                PropertyChanges {
                    target: icon
                    x: 0
                }
            },
            State {
                name:"checked"
                when: control.checked
                PropertyChanges {
                    target: icon
                    x: onOffBackground.width - icon.width
                }
            }

        ]
        transitions: [
            Transition {
                NumberAnimation {target:icon; property: "x";easing.type: Easing.InCubic; duration:200}
            }
        ]
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
            source: Default.checkBox.details.source.normal
            backgroundColor: control.enabled ? (control.pressed ? Default.checkBox.details.color.pressed : Default.checkBox.details.color.normal) : Default.checkBox.details.color.disabled
            effectSource: control.enabled ? (control.pressed ? Default.checkBox.details.effectSource.pressed : Default.checkBox.details.effectSource.normal) : Default.checkBox.details.effectSource.disabled
        }
        TizenBorderImage {
            anchors.centerIn: detailsBg
            source: Default.checkBox.details.iconSource.normal
            backgroundColor: control.enabled ? (control.pressed ? Default.checkBox.details.iconColor.pressed : Default.checkBox.details.iconColor.normal) : Default.checkBox.details.iconColor.disabled
            effectSource: Default.checkBox.details.iconEffectSource.normal
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
            anchors.leftMargin: Default.checkBox.margins.left
            anchors.topMargin: Default.checkBox.margins.top
            anchors.bottomMargin: Default.checkBox.margins.bottom
        }
        Loader {
            id: labelLoader
            anchors.left: markIndicatorLoader.right
            anchors.leftMargin:  checkboxStyle.spacing
            anchors.top: backgroundLoader.top
            anchors.bottom: backgroundLoader.bottom
            anchors.right: onOffLoader.left
            anchors.topMargin: Default.checkBox.margins.top
            anchors.bottomMargin: Default.checkBox.margins.bottom
            sourceComponent: label
        }
        Loader {
            id: onOffLoader
            anchors.top: backgroundLoader.top
            anchors.bottom: backgroundLoader.bottom
            anchors.right: detailsLoader.right
            anchors.topMargin: Default.checkBox.margins.top
            anchors.bottomMargin: Default.checkBox.margins.bottom
            sourceComponent: onOff ? onOffIndicator : null
        }

        Loader {
            id:detailsLoader

            anchors.top: backgroundLoader.top
            anchors.bottom: backgroundLoader.bottom
            anchors.right: backgroundLoader.right
            anchors.topMargin: Default.checkBox.margins.top
            anchors.bottomMargin: Default.checkBox.margins.bottom
            anchors.rightMargin: Default.checkBox.margins.right
            sourceComponent: showDetails ? details : null
        }
    }
}
