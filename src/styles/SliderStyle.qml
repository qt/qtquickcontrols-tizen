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
import QtQuick.Controls.Styles 1.0
import "DefaultSettings.js" as Default

SliderStyle {
    id: styleitem
    handle:  Item {
        id:handleItem
        implicitWidth: bg.implicitWidth
        implicitHeight: bg.implicitHeight
        property int globalX:updatePos(control.value).x
        property int globalY:updatePos(control.value).y
        function updatePos(value) {
            return handleItem.mapFromItem(floater.parent,x,y)
        }
        Floater {
            id:floater
            content: TizenBorderImage {
                smooth: true
                implicitWidth: Math.max(txt.contentWidth+txt.anchors.margins, Default.slider.handle.overlay.width)
                implicitHeight: Default.slider.handle.overlay.height
                //height: Default.slider.handle.overlay.height
                source: Default.slider.handle.overlay.source
                backgroundColor: Default.slider.handle.overlay.backgroundColor
                effectSource: Default.slider.handle.overlay.effectSource
                Text {
                    id:txt
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    anchors.right: parent.right
                    height: Default.slider.handle.overlay.heightWithoutArrow
                    anchors.leftMargin: Default.slider.handle.overlay.margin
                    anchors.rightMargin:  Default.slider.handle.overlay.margin
                    font.pixelSize: Default.slider.handle.overlay.font.pixelSize
                    color: Default.slider.handle.overlay.text.color
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: control.value

                }
            }
            visible:control.pressed


            x: -handleItem.globalX-(floater.width-handleItem.width)/2
            y: -handleItem.globalY- floater.height

        }

        TizenBorderImage {
            id:bg

            anchors.centerIn: parent
            source: Default.slider.handle.source.normal
            effectSource: if (control.enabled) {
                              control.pressed ?
                                          Default.slider.handle.effectSource.pressed:
                                          Default.slider.handle.effectSource.normal
                          } else {
                              Default.slider.handle.effectSource.disabled
                          }

            backgroundColor: control.enabled ? (control.pressed ? Default.slider.handle.backgroundColor.pressed : Default.slider.handle.backgroundColor.normal):Default.slider.handle.backgroundColor.disabled

            Text {
                visible:!control.pressed
                text: control.value
                anchors.fill: parent
                anchors.margins: Default.slider.handle.text.margins
                fontSizeMode: Text.Fit
                font.pointSize: Default.slider.handle.font.pointSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: control.enabled ? Default.slider.handle.text.color.normal : Default.slider.handle.text.color.disabled
            }
        }
    }

    /*! This property holds the background groove of the slider.
        You can access the handle position through the \c handlePosition property.
    */
    groove: Item {
        implicitHeight: 36
        implicitWidth: 400
        ProgressBar {
            anchors.fill: parent
            value: control.value
            maximumValue: control.maximumValue
            minimumValue: control.minimumValue
        }
    }
}
