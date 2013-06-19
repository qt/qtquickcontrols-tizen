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
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Tizen 1.0
import "DefaultSettings.js" as Theme

Style {
    id: style

    property Popup control: __control

    property Component lookAndFeel: Item {
        id: contentItem
        anchors.fill: parent
        implicitWidth: control.root.width - 100
        implicitHeight: 2*control.root.height/3
        Rectangle {
            x: -(control.root.width-contentItem.width)/2
            y: -(control.root.height-contentItem.height)/2
            width:control.root.width
            height:control.root.height
            color:"#AA000000"
        }

        TizenBorderImage {
            id: contentOfControl
            anchors.fill: parent
            source: Theme.popup.source
            effectSource: Theme.popup.effectSource
            backgroundColor: Theme.popup.color
            anchors.topMargin: -Theme.popup.margins.top
            anchors.leftMargin: -Theme.popup.margins.left
            anchors.rightMargin: -Theme.popup.margins.right
            anchors.bottomMargin: -Theme.popup.margins.bottom
        }

        state: styleData.state === "hidden" ? "contentHidden" : "contentShown"

        states: [
            State {
                name:"contentHidden"
                PropertyChanges {
                    target: control
                    opacity:0
                }
            },
            State {
                name:"contentShown"
                PropertyChanges {
                    target: control
                    opacity:0
                }
            }
        ]

        transitions: [
            Transition {
                to: "contentHidden"
                SequentialAnimation {
                    NumberAnimation {
                        target: control
                        property: "opacity"
                        duration: 250
                    }
                    PropertyAction {
                        target: control
                        property: "visible"
                        value:false
                    }
                }
            },
            Transition {
                to: "contentShown"
                SequentialAnimation {
                    PropertyAction {
                        target: control
                        property: "visible"
                        value:true
                    }
                    NumberAnimation {
                        target: control
                        property: "opacity"
                        to: 1
                        duration: 250
                    }
                }
            }
        ]
    }
}
