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
import QtQuick.Controls.Private 1.0

/*!
    \qmltype Swicth

*/

Control {
    id: rootSwitch

    /*!
        \qmlproperty enumeration Slider::orientation

        This property holds the layout orientation of the switch.
        The default value is \c Qt.Horizontal.
    */
    property int orientation: Qt.Horizontal

    /*!
        \qmlproperty bool Switch::checked

        Property holds state of the switch.

        The default value is \c false.
    */
    property bool checked: false

    /*!
        \qmlproperty bool Switch::updateValueWhileDragging

        If set to true, switch checked property is updated while the user is moving the handle.

        The default value is \c false.
    */
    property bool updateValueWhileDragging: false

    /*!
        \qmlproperty bool Switch::pressed

        This property indicates if switch handle is currently being pressed.
    */
    property alias pressed: mouseArea.pressed

    /*!
        \qmlproperty bool Switch::activeFocusOnPress

        This property indicates if the Switch should receive active focus when
        pressed.

        The default value is \c false.
    */
    property bool activeFocusOnPress: false

    /*! \internal */
    readonly property bool __containsMouse: mouseArea.containsMouse

    /*! \internal */
    readonly property bool __horizontal: orientation === Qt.Horizontal

    /*! \internal */
    readonly property real __handlePos: __horizontal ? fakeHandle.x : -fakeHandle.y

    /*! \internal */
    readonly property real __handleDragArea: __horizontal ? rootSwitch.width - fakeHandle.width : rootSwitch.height - fakeHandle.height

    activeFocusOnTab: true

    //    Accessible.role: Accessible.Slider
    //    Accessible.name: value

    style: Qt.createComponent(Settings.style + "/SwitchStyle.qml", rootSwitch)

    Keys.onSpacePressed: { checked = !checked }

    function __updateSwitchState() {
        rootSwitch.checked = (__horizontal ? fakeHandle.x: -fakeHandle.y) > __handleDragArea/2
    }

    Item {
        id: fakeHandle
        anchors.verticalCenter: __horizontal ? parent.verticalCenter : undefined
        anchors.horizontalCenter: !__horizontal ? parent.horizontalCenter : undefined
        width: __horizontal ? __panel.handleWidth : __panel.handleHeight
        height: __horizontal ? __panel.handleHeight : __panel.handleWidth
    }

    MouseArea {
        id: mouseArea

        hoverEnabled: true
        anchors.fill: parent

        drag.target: fakeHandle
        drag.axis: __horizontal ? Drag.XAxis : Drag.YAxis
        drag.minimumX: 0
        drag.maximumX: __handleDragArea
        drag.minimumY: -__handleDragArea
        drag.maximumY: 0
        onPositionChanged: {
            if (drag.active && updateValueWhileDragging) {
                __updateSwitchState()
            }
        }
        onClicked: {
            rootSwitch.checked = !rootSwitch.checked
        }
        onReleased: {
            if (!updateValueWhileDragging) {
                __updateSwitchState()
            }
        }
    }
    StateGroup {
        id: stateGroup
        states: [
            State {
                name:"normal"
                when: !mouseArea.pressed && !checked
                PropertyChanges {
                    restoreEntryValues : false
                    target: fakeHandle
                    x: __horizontal ? 0 : fakeHandle.x
                    y: !__horizontal ? 0 : fakeHandle.y
                }
            },
            State {
                name:"checked"
                when: !mouseArea.pressed && checked
                PropertyChanges {
                    restoreEntryValues : false
                    target: fakeHandle
                    x: __horizontal ? __handleDragArea : fakeHandle.x
                    y: !__horizontal ? -__handleDragArea : fakeHandle.y
                }
            },
            State {
                name:"pressed"
                when: mouseArea.pressed
            }

        ]
        transitions: [
            Transition {
                to: "normal"
                NumberAnimation {
                    target: fakeHandle
                    properties: "x,y"
                    duration: 250
                    easing.type: Easing.InCubic
                }
            },
            Transition {
                to: "checked"
                NumberAnimation {
                    target: fakeHandle
                    properties: "x,y"
                    duration: 250
                    easing.type: Easing.InCubic
                }
            }
        ]
    }
}
