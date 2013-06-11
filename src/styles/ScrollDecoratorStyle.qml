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

    property ScrollDecorator control: __control

    property Component decoration: Item {
        width: control.width
        height: control.height

        property Flickable flickableItem: control.flickableItem

        QtObject {
            id: horizontalHelper
            property real positionRatio: flickableItem ? flickableItem.visibleArea.xPosition : 0
            property real sizeRatio: flickableItem ? flickableItem.visibleArea.widthRatio : 0
            property real maxPosition: flickableItem ? flickableItem.width : 0
            property real minSize: Theme.scroll.handler.horizontal.minimumWidth

            property real sizeUnderflow: (sizeRatio * maxPosition) < minSize ? minSize - (sizeRatio * maxPosition) : 0

            // raw start and end position considering minimum size
            property real rawStartPos: positionRatio * (maxPosition - sizeUnderflow)
            property real rawEndPos: (positionRatio + sizeRatio) * (maxPosition - sizeUnderflow) + sizeUnderflow

            // overshoot amount at start and end
            property real overshootStart: rawStartPos < 0 ? -rawStartPos : 0
            property real overshootEnd: rawEndPos > maxPosition ? rawEndPos - maxPosition : 0

            // overshoot adjusted start and end
            property real adjStartPos: rawStartPos + overshootStart
            property real adjEndPos: rawEndPos - overshootStart - overshootEnd

            // final position and size of thumb
            property int position: 0.5 + (adjStartPos + minSize > maxPosition ? maxPosition - minSize : adjStartPos)
            property int size: 0.5 + ((adjEndPos - position) < minSize ? minSize : (adjEndPos - position))
        }

        QtObject {
            id: verticalHelper
            property real positionRatio: flickableItem ? flickableItem.visibleArea.yPosition : 0
            property real sizeRatio: flickableItem ? flickableItem.visibleArea.heightRatio : 0
            property real maxPosition: flickableItem ? flickableItem.height : 0
            property real minSize: Theme.scroll.handler.vertical.minimumHeight

            property real sizeUnderflow: (sizeRatio * maxPosition) < minSize ? minSize - (sizeRatio * maxPosition) : 0

            // raw start and end position considering minimum size
            property real rawStartPos: positionRatio * (maxPosition - sizeUnderflow)
            property real rawEndPos: (positionRatio + sizeRatio) * (maxPosition - sizeUnderflow) + sizeUnderflow

            // overshoot amount at start and end
            property real overshootStart: rawStartPos < 0 ? -rawStartPos : 0
            property real overshootEnd: rawEndPos > maxPosition ? rawEndPos - maxPosition : 0

            // overshoot adjusted start and end
            property real adjStartPos: rawStartPos + overshootStart
            property real adjEndPos: rawEndPos - overshootStart - overshootEnd

            // final position and size of thumb
            property int position: 0.5 + (adjStartPos + minSize > maxPosition ? maxPosition - minSize : adjStartPos)
            property int size: 0.5 + ((adjEndPos - position) < minSize ? minSize : (adjEndPos - position))
        }

        BorderImage {
            id: overscrollingTop
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            height: Theme.scroll.overscrolling.top.height
            source: Theme.scroll.overscrolling.top.source
            opacity:0
            states: State {
                name:"visible"
                when: flickableItem.atYBeginning && flickableItem.movingVertically
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
            height: Theme.scroll.overscrolling.bottom.height
            source: Theme.scroll.overscrolling.bottom.source
            opacity:0
            states: State {
                name:"visible"
                when: flickableItem.atYEnd && flickableItem.movingVertically
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
            width: Theme.scroll.overscrolling.left.right
            source: Theme.scroll.overscrolling.right.source
            opacity:0
            states: State {
                name:"visible"
                when: flickableItem.atXEnd && flickableItem.movingHorizontally
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
            width: Theme.scroll.overscrolling.left.width
            source: Theme.scroll.overscrolling.left.source
            opacity:0
            states: State {
                name:"visible"
                when: flickableItem.atXBeginning && flickableItem.movingHorizontally
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

        TizenBorderImage {
            id: horizontalIndicator
            x: horizontalHelper.position
            opacity: 0
            width: horizontalHelper.size
            anchors.bottom: parent.bottom
            height: Theme.scroll.handler.horizontal.minimumHeight
            source: Theme.scroll.handler.horizontal.source
            backgroundColor: Theme.scroll.handler.color
            effectSource: Theme.scroll.handler.horizontal.effectSource
            states: State {
                name: "visible"
                when: flickableItem.movingHorizontally
                PropertyChanges {
                    target: horizontalIndicator
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
            id: verticalIndicator
            y: verticalHelper.position
            anchors.right: parent.right
            opacity: 0
            anchors.margins: Theme.scroll.handler.vertical.margin
            width: Theme.scroll.handler.vertical.minimumWidth
            height: verticalHelper.size
            source: Theme.scroll.handler.vertical.source
            backgroundColor: Theme.scroll.handler.color
            effectSource: Theme.scroll.handler.vertical.effectSource
            states: State {
                name: "visible"
                when: flickableItem.movingVertically
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
    }
}
