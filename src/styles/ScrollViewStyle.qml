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

import QtQuick 2.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Controls.Styles.Tizen 1.0

ScrollViewStyle {
    transientScrollBars: true
    Binding {
        target: control.flickableItem
        property: "interactive"
        value: true
    }
    handle: TizenBorderImage {
        id: verticalIndicator
        anchors.margins: TizenConfig.scroll.handler.vertical.margin
        source: TizenConfig.scroll.handler.vertical.source
        backgroundColor: TizenConfig.scroll.handler.color
        effectSource: TizenConfig.scroll.handler.vertical.effectSource
        states: State {
            name: "visible"
            when: control.flickableItem.movingVertically
            PropertyChanges {
                target: verticalIndicator
                opacity: 1
            }
        }
        transitions: [
            Transition {
                to: "visible"
                NumberAnimation {
                    property: "opacity"
                    duration: 150
                }
            },
            Transition {
                from: "visible"
                NumberAnimation {
                    property: "opacity"
                    duration: 500
                }
            }
        ]
    }
    corner: null
    decrementControl: null
    frame: Item {
        width: control.width
        height: control.height

        BorderImage {
            id: overscrollingTop
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            height: TizenConfig.scroll.overscrolling.top.height
            source: TizenConfig.scroll.overscrolling.top.source
            opacity:0
            states: State {
                name:"visible"
                when: control.flickableItem.atYBeginning && control.flickableItem.movingVertically
                PropertyChanges {
                    target:overscrollingTop
                    opacity: 1
                }
            }
            transitions: [
                Transition {
                    to: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 150
                    }
                },
                Transition {
                    from: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 500
                    }
                }
            ]
        }

        BorderImage {
            id: overscrollingBottom
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            height: TizenConfig.scroll.overscrolling.bottom.height
            source: TizenConfig.scroll.overscrolling.bottom.source
            opacity:0
            states: State {
                name:"visible"
                when: control.flickableItem.atYEnd && control.flickableItem.movingVertically
                PropertyChanges {
                    target:overscrollingBottom
                    opacity: 1
                }
            }
            transitions: [
                Transition {
                    to: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 150
                    }
                },
                Transition {
                    from: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 500
                    }
                }
            ]
        }
        BorderImage {
            id: overscrollingRight
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: TizenConfig.scroll.overscrolling.left.right
            source: TizenConfig.scroll.overscrolling.right.source
            opacity:0
            states: State {
                name:"visible"
                when: control.flickableItem.atXEnd && control.flickableItem.movingHorizontally
                PropertyChanges {
                    target:overscrollingRight
                    opacity: 1
                }
            }
            transitions: [
                Transition {
                    to: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 150
                    }
                },
                Transition {
                    from: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 500
                    }
                }
            ]
        }
        TizenBorderImage {
            id: overscrollingLeft
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: TizenConfig.scroll.overscrolling.left.width
            source: TizenConfig.scroll.overscrolling.left.source
            opacity:0
            states: State {
                name:"visible"
                when: control.flickableItem.atXBeginning && control.flickableItem.movingHorizontally
                PropertyChanges {
                    target:overscrollingLeft
                    opacity: 1
                }
            }
            transitions: [
                Transition {
                    to: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 150
                    }
                },
                Transition {
                    from: "visible"
                    NumberAnimation {
                        property: "opacity"
                        duration: 500
                    }
                }
            ]
        }
    }
    incrementControl: null
}
