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
import QtQuick.Controls.Private 1.0
import "DefaultSettings.js" as Default

/*!
    \qmltype SliderStyle
    \inqmlmodule QtQuick.Controls.Styles 1.0
    \since QtQuick.Controls.Styles 1.0
    \brief Provides custom styling for Slider

    The slider style allows you to create a custom appearance for
    a \l Slider control.

    The implicit size of the slider is calculated based on the
    maximum implicit size of the \c background and \c handle
    delegates combined.

    Example:
    \qml
    Slider {
        anchors.centerIn: parent
        style: SliderStyle {
            groove: Rectangle {
                implicitWidth: 200
                implicitHeight: 8
                color: "gray"
                radius: 8
            }
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "white" : "lightgray"
                border.color: "gray"
                border.width: 2
                width: 34
                height: 34
                radius: 12
            }
        }
    }
    \endqml
*/
Style {
    id: styleitem

    /*! The \l Slider attached to this style. */
    readonly property Slider control: __control

    /*! The padding around the groove item. */
    property Margins padding: Margins { top: 0 ; left: 0 ; right: 0 ; bottom: 0 }

    /*! This property holds the item for the slider handle.
        You can access the slider through the \c control property
    */
    Component.onCompleted: {
        control.stepSize = 1.0
        control.maximumValue = 100
    }

    property Component handle:  TizenBorderImage {
        id:bg
        source: Default.slider.handle.source.normal
        effectSource: if (control.enabled) {
                          control.pressed ?
                          Default.slider.handle.effectSource.pressed:
                          Default.slider.handle.effectSource.normal
                      } else {
                          Default.slider.handle.effectSource.disabled
                      }

        backgroundColor: control.enabled ? (control.pressed ? Default.slider.handle.backgroundColor.pressed : Default.slider.handle.backgroundColor.normal):Default.slider.handle.backgroundColor.disabled
        foregroundColor: control.enabled ? Default.slider.handle.foregroundColor.normal:Default.slider.handle.foregroundColor.disabled
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


    /*! This property holds the background groove of the slider.
        You can access the handle position through the \c handlePosition property.
    */
    property Component groove: Item {
        implicitHeight: 50
        implicitWidth: 400
        ProgressBar {
            anchors.fill: parent
            value: control.value
            maximumValue: control.maximumValue
            minimumValue: control.minimumValue
        }
    }

    /*! This property holds the slider style panel.

        Note that it is generally not recommended to override this.
    */
    property Component panel: Item {
        id: root
        property bool horizontal : control.orientation === Qt.Horizontal
        property int horizontalSize: grooveLoader.implicitWidth + padding.left + padding.right
        property int verticalSize: Math.max(handleLoader.implicitHeight, grooveLoader.implicitHeight) + padding.top + padding.bottom

        implicitWidth: horizontal ? horizontalSize : verticalSize
        implicitHeight: horizontal ? verticalSize : horizontalSize

        y: horizontal ? 0 : height
        rotation: horizontal ? 0 : -90
        transformOrigin: Item.TopLeft

        Item {

            anchors.fill: parent

            Loader {
                id: grooveLoader
                property int handlePosition: handleLoader.x + handleLoader.width/2
                x: padding.left
                sourceComponent: groove
                width: (horizontal ? parent.width : parent.height) - padding.left - padding.right
                y:  padding.top +  (Math.round(horizontal ? parent.height : parent.width - padding.top - padding.bottom) - grooveLoader.item.height)/2
            }
            Loader {
                id: handleLoader
                sourceComponent: handle
                anchors.verticalCenter: grooveLoader.verticalCenter
                x: Math.round(control.value / control.maximumValue * ((horizontal ? root.width : root.height)- item.width))
            }
        }
    }
}
