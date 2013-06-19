/*
 * Copyright (C) 2013 Jarosław Staniek <staniek@kde.org>
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
import QtQuick.Controls.Tizen 1.0
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Tizen 1.0
import "DefaultSettings.js" as Theme
//import "utils.js" as Utils

Style {
    id: style
    property View control: __control

    property Component view: Rectangle {
        y: __titleBar.height
        Binding { target: __titleBar; property: "anchors.top"; value: control.top }
        Binding { target: __titleBar; property: "anchors.left"; value: control.left }
        Binding { target: __titleBar; property: "anchors.right"; value: control.right }

        Binding { target: control.__content; property: "anchors.top"; value: __titleBar.bottom }
        Binding { target: control.__content; property: "anchors.bottom"; value: __toolBar.top }
        Binding { target: control.__content; property: "anchors.left"; value: control.left }
        Binding { target: control.__content; property: "anchors.right"; value: control.right }

        Binding { target: __toolBar; property: "anchors.bottom"; value: control.bottom }
        Binding { target: __toolBar; property: "anchors.left"; value: control.left }
        Binding { target: __toolBar; property: "anchors.right"; value: control.right }

        width: 720 // TODO Utils.appWidth
        implicitWidth: width
        implicitHeight: height

        Binding { target: control; property: "implicitWidth"; value: width }
        height: 1280 - __titleBar.height - __toolBar.height // TODO Utils.appHeight

        Binding { target: control; property: "implicitHeight"; value: height }
        color: Theme.colors.background
    }
}
