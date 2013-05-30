/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Copyright (C) 2013 Jarosław Staniek <staniek@kde.org>
** Contact: http://www.qt-project.org/legal
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import "private"

Item {
    id: root
    anchors.fill: flickableItem

    property Flickable flickableItem

    Item {
        id: priv
        property int minIndicatorSize: 20
        property int hideTimeout: 500
        property int showTimeout: 150
        property int shadowLength: 25

        function canFlick(direction) {
            return flickableItem.flickableDirection === direction ||
                    flickableItem.flickableDirection === Flickable.HorizontalAndVerticalFlick ||
                    flickableItem.flickableDirection === Flickable.AutoFlickDirection;
        }
    }

    Rectangle {
        id: verticalShadow
        anchors.fill: root
        opacity: 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#32000000" }
            GradientStop { position: priv.shadowLength/flickableItem.height; color: "#00000000" }
            GradientStop { position: 1.0 - (priv.shadowLength/flickableItem.height); color: "#00000000" }
            GradientStop { position: 1.0; color: "#32000000" }
        }

        states: State {
            name: "visible"
            when: flickableItem && flickableItem.movingVertically
            PropertyChanges { target: verticalShadow; opacity: 1; visible: true }
        }

        transitions: [
            Transition {
                from: "visible"
                to: ""
                NumberAnimation { target: verticalShadow; property: "opacity"; duration: priv.hideTimeout; onStopped: verticalShadow.visible = false }
            },
            Transition {
                from: ""
                to: "visible"
                NumberAnimation { target: verticalShadow; property: "opacity"; duration: priv.showTimeout }
            }
        ]
    }

    Rectangle {
        id: horizontalShadow
        anchors.centerIn: root
        width: root.height
        height: root.width
        opacity: 0
        rotation: 90
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#32000000" }
            GradientStop { position: priv.shadowLength/flickableItem.height; color: "transparent" }
            GradientStop { position: 1.0 - (priv.shadowLength/flickableItem.height); color: "transparent" }
            GradientStop { position: 1.0; color: "#32000000" }
        }

        states: State {
            name: "visible"
            when: flickableItem && flickableItem.movingHorizontally
            PropertyChanges { target: horizontalShadow; opacity: 1 }
        }

        transitions: [
            Transition {
                from: "visible"
                to: ""
                NumberAnimation { target: horizontalShadow; property: "opacity"; duration: priv.hideTimeout; onStopped: verticalShadow.visible = false }
            },
            Transition {
                from: ""
                to: "visible"
                NumberAnimation { target: horizontalShadow; property: "opacity"; duration: priv.showTimeout }
            }
        ]
    }

    Component {
        id: verticalSizerWrapper
        ScrollSizer {
            id: verticalSizer
            positionRatio: flickableItem ? flickableItem.visibleArea.yPosition : 0
            sizeRatio: flickableItem ? flickableItem.visibleArea.heightRatio : 0
            maxPosition: flickableItem ? flickableItem.height : 0
            minSize: priv.minIndicatorSize
        }
    }

    Component {
        id: horizontalSizerWrapper
        ScrollSizer {
            id: horizontalSizer
            positionRatio: flickableItem ? flickableItem.visibleArea.xPosition : 0
            sizeRatio: flickableItem ? flickableItem.visibleArea.widthRatio : 0
            maxPosition: flickableItem ? flickableItem.width : 0
            minSize: priv.minIndicatorSize
        }
    }

    Loader { id: verticalSizerLoader }
    Loader { id: horizontalSizerLoader }

    NinePatchImageWithEffect {
        id: verticalIndicator
        anchors.right: parent.right
        anchors.rightMargin: 6
        opacity: 0
        source: "pics/00_scroll_bar_v.9.png"
        effectSource: "pics/00_scroll_bar_v_ef.9.png"
        leftCut: 7; topCut: 7; rightCut: 10; bottomCut: 10

        y: shouldShow && verticalSizerLoader.status == Loader.Ready ? verticalSizerLoader.item.position : 0
        height: shouldShow && verticalSizerLoader.status == Loader.Ready ? verticalSizerLoader.item.size - (horizontalIndicator.shouldShow ? 8 : 0) : 0

        property bool shouldShow: flickableItem && priv.canFlick(Flickable.VerticalFlick) && (flickableItem.height > 0 && flickableItem.contentHeight > flickableItem.height)

        onShouldShowChanged: {
            if (shouldShow)
                verticalSizerLoader.sourceComponent = verticalSizerWrapper;
            else
                verticalSizerLoader.sourceComponent = undefined;
        }

        states: State {
            name: "visible"
            when: flickableItem && flickableItem.movingVertically
            PropertyChanges { target: verticalIndicator; opacity: 1 }
        }
        transitions: [
            Transition {
                from: "visible"
                to: ""
                NumberAnimation { target: verticalIndicator; property: "opacity"; duration: priv.hideTimeout }
            },
            Transition {
                from: ""
                to: "visible"
                NumberAnimation { target: verticalIndicator; property: "opacity"; duration: priv.showTimeout }
            }
        ]
    }

    NinePatchImageWithEffect {
        id: horizontalIndicator
        anchors.bottom: parent.bottom
        opacity: 0
        // FIXME not tested
        source: "pics/00_scroll_bar_v.9.png"
        effectSource: "pics/00_scroll_bar_v_ef.9.png"
        leftCut: 4; topCut: 5; rightCut: 14; bottomCut: 10

        x: shouldShow && horizontalSizerLoader.status == Loader.Ready ? horizontalSizerLoader.item.position : 0
        width: shouldShow && horizontalSizerLoader.status == Loader.Ready ? horizontalSizerLoader.item.size - (verticalIndicator.shouldShow ? 8 : 0) : 0
        height: implicitWidth

        property bool shouldShow: flickableItem && priv.canFlick(Flickable.HorizontalFlick) && (flickableItem.width > 0 && flickableItem.contentWidth > flickableItem.width)

        onShouldShowChanged: {
            if (shouldShow)
                horizontalSizerLoader.sourceComponent = horizontalSizerWrapper;
            else
                horizontalSizerLoader.sourceComponent = undefined;
        }

        states: State {
            name: "visible"
            when: flickableItem && flickableItem.movingHorizontally
            PropertyChanges { target: horizontalIndicator; opacity: 1 }
        }
        transitions: [
            Transition {
                from: "visible"
                to: ""
                NumberAnimation { target: horizontalIndicator; property: "opacity"; duration: priv.hideTimeout }
            },
            Transition {
                from: ""
                to: "visible"
                NumberAnimation { target: horizontalIndicator; property: "opacity"; duration: priv.showTimeout }
            }
        ]
    }
}
