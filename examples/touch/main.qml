/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
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

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Tizen 1.0
import QtQuick.Controls.Styles.Tizen 1.0
import QtQuick.Window 2.0
import "content"

ApplicationWindow {
    id: appWindow
    y: isPortrait ? 60 : 0
    width: 720
    height: isPortrait? 1220 : 1280
    property real curlValue: 0.05
    property bool isPortrait: contentOrientation === Qt.PortraitOrientation || contentOrientation === Qt.InvertedPortraitOrientation

    contentOrientation: Screen.orientation
    property bool pageCurlEffectEnabled: false

    Item {
        id: rotatedItem
        anchors.fill: parent

        View {
            id: content
            anchors.fill: parent

            titleBar.text: "Controls Gallery (Theme: " + TizenConfig.theme+")"
            titleBar.subText: pageStack.depth > 1 ? pageStack.currentItem: "Main Page"

            backAction.onTriggered: pageStack.depth > 1 ? pageStack.pop() : Qt.quit()

            ListModel {
                id: pageModel
                ListElement {
                    title: "Configuration"
                    page: "content/ConfigurationPage.qml"
                }
                ListElement {
                    title: "Buttons"
                    page: "content/ButtonPage.qml"
                }
                ListElement {
                    title: "Sliders"
                    page: "content/SliderPage.qml"
                }
                ListElement {
                    title: "ProgressBar"
                    page: "content/ProgressBarPage.qml"
                }
                ListElement {
                    title: "Tabs"
                    page: "content/TabBarPage.qml"
                }
                ListElement {
                    title: "CheckBoxes"
                    page: "content/CheckBoxPage.qml"
                }
                ListElement {
                    title: "ContextMenu"
                    page: "content/ContextMenuPage.qml"
                }
                ListElement {
                    title: "SplitView"
                    page: "content/SplitViewPage.qml"
                }
                ListElement {
                    title: "DateTimeEdit"
                    page: "content/DateTimeEditPage.qml"
                }
            }

            StackView {
                id: pageStack
                anchors.fill: parent

                initialItem: Item {
                    width: parent.width
                    height: parent.height


                    ListView {
                        id:listView
                        model: pageModel
                        anchors.fill: parent
                        clip:true

                        delegate: AndroidDelegate {
                            text: title
                            onClicked: {
                                content.titleBar.subText = Qt.binding(function() {return pageStack.depth > 1 ? title: "Main Page"})
                                pageStack.push(Qt.resolvedUrl(page))
                            }
                        }
                        ScrollDecorator {flickableItem: listView}
                    }
                }
            }
        }
        Rectangle {
            id: backgroundRect
            visible: appWindow.pageCurlEffectEnabled
            color: (TizenConfig.theme === "black") ? "white" : " black"
            width: 300
            height: 130
            anchors.right: parent.right
            anchors.top: parent.top
        }
        ShaderEffectSource {
            id: shaderSource
            anchors.fill: parent
            enabled: pageCurlEffectEnabled
            sourceItem: pageCurlEffectEnabled ? content : null
            layer.enabled: pageCurlEffectEnabled
            layer.effect: PageCurl {
                id: pageCurl
                curlExtent: curlValue
            }
        }
        SequentialAnimation {
            id: curlAnimation
            property int to: 1.0
            SmoothedAnimation {
                velocity: 1.5
                target: appWindow
                property: "curlValue"
                to: curlAnimation.to
            }
            ScriptAction {
                script: {
                    if (!curlMouseArea.roll) {
                        rotatedItem.flipTheme()
                    }
                    shaderSource.live = true
                    curlValue = 0.05
                    backgroundRect.visible = Qt.binding(function(){return appWindow.pageCurlEffectEnabled})
                }
            }
        }
        MouseArea {
            id: curlMouseArea
            anchors.fill: parent
            enabled: pageCurlEffectEnabled && !curlAnimation.running
            property bool dragStarted: false
            property bool themeChanged: false
            property int initialY: 0
            property real oldCurlValue
            property bool roll: true
            onPressed: {
                if (mouse.x > appWindow.width - 100 && mouse.y < 100) {
                    roll =  true
                    themeChanged = false
                    oldCurlValue = curlValue
                    shaderSource.live = false
                    initialY = mouse.y
                    dragStarted = true
                } else {
                    mouse.accepted = false
                }

            }
            onMouseYChanged: {
                mouse.accepted = dragStarted
                if (dragStarted) {
                    curlValue = mouse.y / shaderSource.height
                    if (Math.abs(curlValue - oldCurlValue) > 0.05) {
                        roll = oldCurlValue < curlValue
                        oldCurlValue = curlValue
                    }
                    if (!themeChanged && (mouse.y - initialY > 50)) {
                        rotatedItem.flipTheme()
                        themeChanged = true
                    }
                }
            }
            onReleased: {
                mouse.accepted = dragStarted
                if (dragStarted) {
                    initialY = 0
                    dragStarted = false
                    if (themeChanged && roll) {
                        curlAnimation.to = 1
                    } else {
                        curlAnimation.to = 0.05
                    }
                    curlAnimation.start()
                }
            }
        }
        function flipTheme() {
            if (TizenConfig.theme === "white") {
                TizenConfig.theme = "black"
            } else {
                TizenConfig.theme = "white"
            }
            backgroundRect.visible = false
        }
    }
}
