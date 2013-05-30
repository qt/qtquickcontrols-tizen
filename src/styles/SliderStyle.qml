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

SliderStyle {
    id: styleitem
    handle:  Item {
        id:handleItem
        implicitWidth: bg.implicitWidth
        implicitHeight: bg.implicitHeight

        Component.onCompleted: {
            control.onPressedChanged.connect(updatePos)
            control.onValueChanged.connect(updatePos)
        }
        property point globalPosition
        property int globalX
        property int globalY
        function updatePos() {
            var pt = handleItem.mapFromItem(floater.parent,x,y)
            globalPosition = Qt.point(pt.x,pt.y)
        }


        Floater {
            id:floater
            content: TizenBorderImage {
                smooth: true
                implicitWidth: Math.max(txt.contentWidth+txt.anchors.margins, Theme.slider.handle.overlay.width)
                implicitHeight: Theme.slider.handle.overlay.height
                //height: Theme.slider.handle.overlay.height
                source: Theme.slider.handle.overlay.source
                backgroundColor: Theme.slider.handle.overlay.backgroundColor
                effectSource: Theme.slider.handle.overlay.effectSource
                Text {
                    id:txt
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    anchors.right: parent.right
                    height: Theme.slider.handle.overlay.heightWithoutArrow
                    anchors.leftMargin: Theme.slider.handle.overlay.margin
                    anchors.rightMargin:  Theme.slider.handle.overlay.margin
                    font.pixelSize: Theme.slider.handle.overlay.font.pixelSize
                    color: Theme.slider.handle.overlay.text.color
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: control.value

                }
            }
            visible:control.pressed


            x: -handleItem.globalPosition.x-(floater.width-handleItem.width)/2
            y: -handleItem.globalPosition.y- floater.height

        }

        TizenBorderImage {
            id:bg

            anchors.centerIn: parent
            source: Theme.slider.handle.source.normal
            effectSource: if (control.enabled) {
                              control.pressed ?
                                          Theme.slider.handle.effectSource.pressed:
                                          Theme.slider.handle.effectSource.normal
                          } else {
                              Theme.slider.handle.effectSource.disabled
                          }

            backgroundColor: control.enabled ? (control.pressed ? Theme.slider.handle.backgroundColor.pressed : Theme.slider.handle.backgroundColor.normal):Theme.slider.handle.backgroundColor.disabled

            Text {
                visible:!control.pressed
                text: control.value
                anchors.fill: parent
                anchors.margins: Theme.slider.handle.text.margins
                fontSizeMode: Text.Fit
                font.pointSize: Theme.slider.handle.font.pointSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: control.enabled ? Theme.slider.handle.text.color.normal : Theme.slider.handle.text.color.disabled
            }
        }
    }

    /*! This property holds the background groove of the slider.
        You can access the handle position through the \c handlePosition property.
    */
    groove: Item {
        implicitHeight: 36
        implicitWidth: 650
        ProgressBar {
            anchors.fill: parent
            value: control.value
            maximumValue: control.maximumValue
            minimumValue: control.minimumValue
        }
    }
}
