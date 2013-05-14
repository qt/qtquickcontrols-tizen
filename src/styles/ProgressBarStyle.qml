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
    \qmltype ProgressBarStyle

    \inqmlmodule QtQuick.Controls.Styles 1.0
    \since QtQuick.Controls.Styles 1.0
    \brief Provides custom styling for ProgressBar

    Example:
    \qml
    ProgressBar {
        value: slider.value
        style: ProgressBarStyle {
            background: Rectangle {
                radius: 2
                color: "lightgray"
                border.color: "gray"
                border.width: 1
                implicitWidth: 200
                implicitHeight: 24
            }
            progress: Rectangle {
                color: "lightsteelblue"
                border.color: "steelblue"
            }
        }
    }
    \endqml
*/

Style {
    id: progressBarStyle

    /*! The \l ProgressBar attached to this style. */
    readonly property ProgressBar control: __control

    /*! A value in the range [0-1] indicating the current progress. */
    readonly property real currentProgress: control.indeterminate ? 1.0 :
                                                                    control.value / control.maximumValue

    /*! This property holds the visible contents of the progress bar
        You can access the Slider through the \c control property.

        For convenience, you can also access the readonly property \c controlState.progress
        which provides the current progress as a \c real in the range [0-1]
    */
    property Margins padding: Margins { top: 0 ; left: 8 ; right: 8 ; bottom: 0 }


    property Component progress: TizenBorderImage {
        id:bar
        source: "images/00_progress_bar.sci"
        backgroundColor: Default.progress.progressColor
        effectSource: "images/white/00_progress_bar_ef.sci"
    }


    property Component background: TizenBorderImage {
        source: "images/00_progress_bg.sci"
        backgroundColor: Default.progress.backgroundColor
        effectSource: "images/white/00_progress_ef_bg.sci"
    }

    property Component panel: Item{
        property bool horizontal: control.orientation == Qt.Horizontal
        implicitWidth: horizontal ? backgroundLoader.implicitWidth : backgroundLoader.implicitHeight
        implicitHeight: horizontal ? backgroundLoader.implicitHeight : backgroundLoader.implicitWidth

        Item {
            width: horizontal ? parent.width : parent.height
            height: !horizontal ? parent.width : parent.height
            y: horizontal ? 0 : width
            rotation: horizontal ? 0 : -90
            transformOrigin: Item.TopLeft

            Loader {
                id: backgroundLoader
                anchors.fill: parent
                sourceComponent: background
            }

            Loader {
                sourceComponent: progressBarStyle.progress
                anchors.topMargin: padding.top
                anchors.leftMargin: padding.left
                anchors.rightMargin: padding.right
                anchors.bottomMargin: padding.bottom

                anchors.top: parent.top
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: currentProgress * (parent.width - padding.left - padding.right)
            }
        }
    }
}
