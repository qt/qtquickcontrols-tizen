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
import QtQuick.Controls.Styles.Tizen 1.0

SliderStyle {
    id: styleitem
    handle:  Item {
        id:handleItem
        implicitWidth: bg.implicitWidth
        implicitHeight: bg.implicitHeight

        property point globalPosition: updatePos(parent.x,control.pressed)
        function updatePos(parentX,controlPressed) {
            var pt = handleItem.mapFromItem(floater.parent,x,y)
            return Qt.point(pt.x,pt.y)
        }

        Floater {
            id:floater
            content: TizenBorderImage {
                implicitWidth: Math.max(txt.contentWidth, TizenConfig.slider.handle.overlay.width)
                implicitHeight: TizenConfig.slider.handle.overlay.height
                source: TizenConfig.slider.handle.overlay.source
                backgroundColor: TizenConfig.slider.handle.overlay.backgroundColor
                Text {
                    id:txt
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    anchors.right: parent.right
                    height: TizenConfig.slider.handle.overlay.heightWithoutArrow
                    anchors.leftMargin: TizenConfig.slider.handle.overlay.margin
                    anchors.rightMargin:  TizenConfig.slider.handle.overlay.margin
                    font.pixelSize: TizenConfig.slider.handle.overlay.font.pixelSize
                    color: TizenConfig.slider.handle.overlay.text.color
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
            source: TizenConfig.slider.handle.source.normal
            effectSource: if (control.enabled) {
                              control.pressed ?
                                          TizenConfig.slider.handle.effectSource.pressed:
                                          TizenConfig.slider.handle.effectSource.normal
                          } else {
                              TizenConfig.slider.handle.effectSource.disabled
                          }

            backgroundColor: control.enabled ? (control.pressed ? TizenConfig.slider.handle.backgroundColor.pressed : TizenConfig.slider.handle.backgroundColor.normal):TizenConfig.slider.handle.backgroundColor.disabled

            Text {
                visible:!control.pressed
                text: control.value
                anchors.fill: parent
                anchors.margins: TizenConfig.slider.handle.text.margins
                fontSizeMode: Text.Fit
                font.pointSize: TizenConfig.slider.handle.font.pointSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: control.enabled ? TizenConfig.slider.handle.text.color.normal : TizenConfig.slider.handle.text.color.disabled
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
