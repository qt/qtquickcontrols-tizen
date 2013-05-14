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
    \qmltype ButtonStyle
    \inqmlmodule QtQuick.Controls.Styles 1.0
    \since QtQuick.Controls.Styles 1.0
    \brief Provides custom styling for Button

    You can create a custom button by replacing the "background" delegate
    of the ButtonStyle with a custom design.

    Example:
    \qml
    Button {
        text: "A button"
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }
        }
    }
    \endqml
    If you need a custom label, you can replace the label item.
*/

Style {
    id: buttonstyle

    /*! The \l Button attached to this style. */
    readonly property Button control: __control

    /*! The padding between the background and the label components. */
    property Margins padding: Margins { top: 4 ; left: 4 ; right: 4 ; bottom: 4 }

    /*! The background of the button. */
    property Component background: TizenBorderImage {
        implicitWidth: 150
        implicitHeight: 75
        source: control.enabled ? (control.pressed ? Default.button.source.pressed: Default.button.source.normal) : Default.button.source.disabled
        effectSource: control.enabled ? (control.pressed ? Default.button.effectSource.pressed: Default.button.effectSource.normal) : Default.button.effectSource.disabled
        backgroundColor: control.enabled ? (control.pressed ? Default.button.backgroundColor.pressed: Default.button.backgroundColor.normal) : Default.button.backgroundColor.disabled
        //foregroundColor: control.enabled ? (control.pressed ? Default.button.foregroundColor.pressed: Default.button.foregroundColor.normal) : Default.button.foregroundColor.disabled
    }

    /*! The label of the button. */
    property Component label: Item {
        implicitWidth: 0
        implicitHeight: 0
        Text {
            anchors.leftMargin: Default.button.text.margins.left
            anchors.rightMargin: Default.button.text.margins.right
            anchors.topMargin: Default.button.text.margins.top
            anchors.bottomMargin: Default.button.text.margins.bottom
            anchors.fill:parent
            font.pointSize: Default.button.font.pointSize
            color: control.enabled ? (control.pressed ? Default.button.text.color.pressed : Default.button.text.color.normal) : Default.button.text.color.disabled
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text:control.text
            minimumPointSize: 1
            minimumPixelSize: 1
            maximumLineCount:2
            wrapMode: Text.Wrap
            clip:true
        }
    }

    /*! \internal */
    property Component panel: Item {
        anchors.centerIn: parent
        anchors.fill: parent
        implicitWidth: Math.max(labelLoader.implicitWidth + padding.left + padding.right, backgroundLoader.implicitWidth)
        implicitHeight: Math.max(labelLoader.implicitHeight + padding.top + padding.bottom, backgroundLoader.implicitHeight)

        Loader {
            id: backgroundLoader
            anchors.fill: parent
            sourceComponent: background
        }

        Loader {
            id: labelLoader
            sourceComponent: label
            anchors.fill: parent
            anchors.leftMargin: padding.left
            anchors.topMargin: padding.top
            anchors.rightMargin: padding.right
            anchors.bottomMargin: padding.bottom
        }
    }
}
