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
import QtQuick.Layouts 1.0

Item {
    id:root
    width: parent.width
    height: parent.height
    VisualItemModel {
        id: itemModel
        Panel {
            x: 15
            width: root.width - 30
            Label {
                id: pageEffectLabel
                anchors.margins: 10
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: pageEffectSwitch.left
                text: "Page effect "+ ((pageEffectSwitch.checked) ? "on" : "off")
                color: TizenControls.palette.foreground
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.family: TizenControls.defaultFontFamily
                font.pixelSize: parent.height/2
                fontSizeMode: Text.Fit
            }
            Switch {
                id: pageEffectSwitch
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                checked: appWindow.pageCurlEffectEnabled
                onCheckedChanged: {
                    appWindow.pageCurlEffectEnabled = checked
                }
            }
        }
        Panel {
            id: themePanel
            x:15
            width: root.width-30
            active: false
            onActiveChanged: {
                if (active)
                    themeCheckBoxPanel.show()
                else
                    themeCheckBoxPanel.hide()
            }
            Label {
                id: themeLabel
                anchors.margins: 10
                anchors.left: parent.left
                anchors.right: parent.right
                height:parent.implicitHeight
                text: "Theme: "+ TizenControls.currentTheme
                color: TizenControls.palette.foreground
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.family: TizenControls.defaultFontFamily
                font.pixelSize: parent.height/2
                fontSizeMode: Text.Fit
                MouseArea {
                    anchors.fill: parent
                    onClicked: themePanel.active = !themePanel.active
                }
            }
        }
        ColumnLayout {
            id: themeCheckBoxPanel
            x: 15
            spacing:0
            width:0
            height:0
            visible: height > 0
            states: [
                State {
                    name:"visible"
                    PropertyChanges {
                        target: themeCheckBoxPanel
                        width: root.width -30
                        height: checkBoxWhite.implicitHeight + spacing + checkBoxBlack.implicitHeight
                    }
                }
            ]
            transitions: [
                Transition {
                    from: "*"
                    to: "*"
                    ParallelAnimation {
                        NumberAnimation {
                            target: themeCheckBoxPanel
                            properties: "width,height"
                            duration: 200
                        }
                    }
                }
            ]
            function show() {
                state = "visible"
            }
            function hide() {
                state = ""
            }

            property string theme: TizenControls.currentTheme

            onThemeChanged: {
                checkBoxWhite.checked = TizenControls.currentTheme === "white"
                checkBoxBlack.checked = TizenControls.currentTheme === "black"
            }
            CheckBox {
                id: checkBoxWhite
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "White"
                onClicked: TizenControls.changeTheme("white")
            }
            CheckBox {
                id: checkBoxBlack
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "Black"
                onClicked: TizenControls.changeTheme("black")
            }
        }
    }

    ListView {
        anchors.fill: parent
        model: itemModel
        spacing: 5
    }
}
