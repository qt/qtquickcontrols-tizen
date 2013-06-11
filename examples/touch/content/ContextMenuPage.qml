/*
 * Copyright (C) 2013 Tomasz Olszak <olszak.tomasz@gmail.com>
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:

 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Tizen 1.0

Item {
    id:root
    width: parent.width
    height: parent.height


    Menu {
        id: menu
        anchorItem: center
        anchorPoint: Qt.point(center.width/2, center.height/2)
        MenuItem {
            text: "Test"
            onTriggered: {
                console.log("Test triggered")
            }
        }
        MenuItem {
            text: "Mail"
            iconSource: "../images/internet-mail.png"
        }
        MenuItem {
            text: "Web Browser"
            iconSource: "../images/internet-web-browser.png"
        }

        MenuItem {
            text: "Test4"
        }
    }


    Text {
        id: center
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        width: 100
        height: 100
        text: "Drag Anchor Point"
        font.pixelSize: 26
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: "darkgrey"
            color:"transparent"
        }
        MouseArea {
            anchors.fill: parent
            drag.target: center
            onPressAndHold: menu.popup()
        }
    }

    Button {
        id:btnShow
        width: 150
        anchors.margins: 50
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Show"
        onClicked: {
            menu.popup()
        }
    }
    Button {
        width: 150
        anchors.topMargin: 50
        anchors.top: parent.top
        anchors.left: btnShow.right
        text: "Animate"
        onClicked: animation.running = !animation.running
    }
    PathAnimation {
        id:animation
        target: center
        anchorPoint: Qt.point(center.width/2,center.height/2)
        loops: Animation.Infinite
        running: false
        duration: 5000
        path: Path {
            id: myPath
            startX: 360; startY: 300

            PathArc {
                x: 360; y: 900
                radiusX: 300
                radiusY: 300
                useLargeArc: true
            }
            PathArc {
                x: 360; y: 300
                radiusX: 300
                radiusY: 300
                useLargeArc: true
            }
        }
    }

}
