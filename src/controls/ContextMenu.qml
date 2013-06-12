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


import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles.Tizen 1.0
import QtQuick.Window 2.0


Floater {
    id: menu
    visible:false

    /*! In anchorPoint of this item menu arrow will be placed */
    property Item anchorItem
    /*! It is the point where top of the arrow will be placed.

        If anchorItem is set then point is interpreter in anchorItem's coordinates
    */
    property point anchorPoint


    /* for getting all menu items to model*/
    default property alias menuItems: workaround.data

    /* shows ContextMenu */
    onVisibleChanged: {
        if (visible) {
            popup()
        } else {
            hide()
        }
    }
    property string __state: "hidden"
    function popup(){
        __state = "shown"
    }
    function hide() {
        __state = "hidden"
    }

    QtObject {
        id:workaround
        property list<QtObject> data

    }

    property Item control: menu

    content: Item {
        id: contentItem

        property point __menuAnchorPoint: control.anchorItem ?
                                          __globalAnchorPoint(control.width,control.height,control.x,control.y,control.anchorItem.x,control.anchorItem.y,control.anchorPoint) :
                                          __globalAnchorPoint(control.width,control.height,control.x,control.y,control.anchorPoint)

        /* internal position of ContextMenu relative to anchorPoint */
        property int __position: updatePosition(__menuAnchorPoint)

        function __globalAnchorPoint() {
            var tmp = menu.parent.mapFromItem(anchorItem, anchorPoint.x, anchorPoint.y)
            return Qt.point(tmp.x,tmp.y)
        }
        state: control.__state === "hidden" ? "contentHidden" : "contentShown"
        states: [
            State {
                name:"contentHidden"
                PropertyChanges {
                    target: contentItem
                    opacity:0
                }
            },
            State {
                name:"contentShown"
                PropertyChanges {
                    target: contentItem
                    opacity:0
                }
            }
        ]

        transitions: [
            Transition {
                to: "contentHidden"
                SequentialAnimation {
                    NumberAnimation {
                        target: contentItem
                        property: "opacity"
                        duration: 250
                    }
                    PropertyAction {
                        target: menu
                        property: "visible"
                        value:false
                    }
                }
            },
            Transition {
                to: "contentShown"
                SequentialAnimation {
                    PropertyAction {
                        target: menu
                        property: "visible"
                        value:true
                    }
                    NumberAnimation {
                        target: contentItem
                        property: "opacity"
                        to: 1
                        duration: 250
                    }
                }
            }
        ]

        function updatePosition() {
            var pos = Qt.BottomEdge
            if (arrow.height/2 + bg.height - Theme.contextMenu.arrow.anchors.bottomMargin < (menu.height - __menuAnchorPoint.y) ) {
                pos = Qt.BottomEdge
            } else if ( arrow.height/2 + bg.height - Theme.contextMenu.arrow.anchors.topMargin < __menuAnchorPoint.y ) {
                pos = Qt.TopEdge
            } else if (arrow.width/2 + bg.width - Theme.contextMenu.arrow.anchors.rightMargin < (menu.width - __menuAnchorPoint.x))  {
                pos = Qt.RightEdge
            } else if (arrow.width/2 + bg.width - Theme.contextMenu.arrow.anchors.leftMargin < __menuAnchorPoint.x)  {
                pos = Qt.LeftEdge
            }
            return pos
        }
        anchors.fill: parent
        Binding {
            target: control
            property: "anchors.fill"
            value: control.parent
        }

        Behavior on opacity {
            NumberAnimation{duration:250}
        }
        MouseArea {
            anchors.fill: parent
            onClicked: menu.hide()
        }
        implicitWidth: bg.width
        implicitHeight: bg.height

        TizenBorderImage {
            id:arrow

            source: "../Styles/Tizen/"+Theme.contextMenu.arrow.source.top
            effectSource: "../Styles/Tizen/"+Theme.contextMenu.arrow.effectSource.top
            backgroundColor: Theme.contextMenu.color

            states: [
                State {
                    name:"bottom"
                    when: __position === Qt.BottomEdge
                    PropertyChanges {
                        target: arrow
                        rotation: 0
                        x: Math.max(Math.min(__menuAnchorPoint.x - width/2, menu.width - arrow.width),0)
                        y: __menuAnchorPoint.y - arrow.height/2
                    }
                    AnchorChanges {
                        target: bg
                        anchors.top: arrow.bottom
                    }
                    PropertyChanges {
                        target: bg
                        anchors.topMargin: -Theme.contextMenu.arrow.anchors.bottomMargin
                        x: Math.min(Math.max(arrow.x+arrow.width/2-bg.width/2,0),menu.width - bg.width)
                    }
                },
                State {
                    name:"top"
                    when: __position === Qt.TopEdge
                    PropertyChanges {
                        target: arrow
                        rotation: 180
                        x: Math.max(Math.min(__menuAnchorPoint.x - width/2, menu.width - arrow.width),0)
                        y: __menuAnchorPoint.y - arrow.height/2
                    }
                    AnchorChanges {
                        target: bg
                        anchors.bottom: arrow.top
                    }
                    PropertyChanges {
                        target: bg
                        anchors.bottomMargin: -Theme.contextMenu.arrow.anchors.topMargin
                        x: Math.min(Math.max(arrow.x+arrow.width/2-bg.width/2,0),menu.width - bg.width)
                    }
                },
                State {
                    name: "right"
                    when: __position === Qt.RightEdge
                    PropertyChanges {
                        target: arrow
                        rotation: -90
                        x: __menuAnchorPoint.x + -arrow.width/2
                        y: __menuAnchorPoint.y - arrow.height/2
                    }
                    AnchorChanges {
                        target: bg
                        anchors.left: arrow.right
                    }
                    PropertyChanges {
                        target: bg
                        anchors.leftMargin: -Theme.contextMenu.arrow.anchors.rightMargin
                        y: Math.min(Math.max(arrow.y+arrow.height/2-bg.height/2,0),menu.height-bg.height)
                    }

                },
                State {
                    name:"left"
                    when: __position === Qt.LeftEdge
                    PropertyChanges {
                        target: arrow
                        rotation: 90
                        x: __menuAnchorPoint.x - arrow.width/2
                        y: __menuAnchorPoint.y - arrow.height/2
                    }
                    AnchorChanges {
                        target: bg
                        anchors.right: arrow.left
                    }
                    PropertyChanges {
                        target: bg
                        anchors.rightMargin: -Theme.contextMenu.arrow.anchors.leftMargin
                        y: Math.min(Math.max(arrow.y+arrow.height/2-bg.height/2,0),menu.height-bg.height)
                    }
                }
            ]
        }
        TizenBorderImage {
            id:bg
            width: Math.min(layout.contentWidth + layout.anchors.leftMargin + layout.anchors.rightMargin,Theme.contextMenu.maximumWidth)
            height: layout.implicitHeight + layout.anchors.topMargin + layout.anchors.bottomMargin
            source: "../Styles/Tizen/"+Theme.contextMenu.source
            effectSource: "../Styles/Tizen/"+Theme.contextMenu.effectSource
            backgroundColor: Theme.contextMenu.color

            MouseArea {
                anchors.fill: bg
            }
        }

        Column {
            id:layout
            anchors.fill: bg

            anchors.leftMargin: Theme.contextMenu.listLeftMargin + Theme.contextMenu.screen.leftMargin
            anchors.rightMargin: Theme.contextMenu.listRightMargin + Theme.contextMenu.screen.rightMargin
            anchors.topMargin: Theme.contextMenu.listTopMargin + Theme.contextMenu.screen.topMargin
            anchors.bottomMargin: Theme.contextMenu.listBottomMargin + Theme.contextMenu.screen.bottomMargin

            property real contentWidth: Theme.contextMenu.minimumWidth
            Repeater {
                model: menuItems

                Item {
                    id: delegateRoot
                    implicitWidth: Math.max(itemBg.implicitWidth,label.contentWidth)
                    implicitHeight: Theme.contextMenu.item.height// Math.max(itemBg.implicitHeight+separator.height,label.contentHeight+separator.height)
                    width: layout.contentWidth
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        TizenBorderImage {
                            id:itemBg
                            anchors.fill: parent
                            source: "../Styles/Tizen/"+Theme.contextMenu.item.source.pressed
                            backgroundColor: mouseArea.pressed && enabled ? Theme.contextMenu.item.color.pressed: Theme.contextMenu.item.color.normal
                        }
                        Image {
                            id:icon
                            anchors.left:parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            source: modelData.iconSource
                            width: Theme.contextMenu.item.iconWidth
                            height: Theme.contextMenu.item.iconHeight
                        }

                        Text {
                            id:label
                            anchors.left: icon.right
                            anchors.leftMargin: Theme.contextMenu.item.spacing
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            anchors.bottomMargin: 3
                            text: modelData.text
                            color: Theme.contextMenu.item.text.color.normal
                            font.pixelSize: Theme.contextMenu.item.text.font.pixelSize
                            verticalAlignment: Text.AlignVCenter
                        }
                        Rectangle {
                            id:separator
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 2
                            color: Theme.contextMenu.listItemDividerColor2
                            visible: index < menuItems.length -1
                        }
                        onClicked: menu.visible = false
                    }
                }

                onItemAdded: {
                    layout.contentWidth = Math.max(item.implicitWidth, layout.contentWidth)
                }
            }
        }
    }
}
