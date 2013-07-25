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
import QtQuick.Controls.Private 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Tizen 1.0
import QtQuick.Controls.Styles.Tizen 1.0
import "private"
Style {
    id:style
    property TimeEdit control: __control

    function getHours(amPm) {
        return amPm ? Qt.formatTime(control.time,"hh ap").slice(0,2) : Qt.formatTime(control.time,"hh")
    }

    property Component panel: Item {
        id: timeItem
        implicitWidth: row.width
        implicitHeight: TizenConfig.dateEdit.content.date.height
        anchors.fill: parent
        StateGroup {
            id:stateGroup
            states: [
                State {
                    name:""
                },
                State {
                    when: hoursField.pressed
                    name: "pickHours"
                    PropertyChanges {target: floater;anchorItem: hoursField; visible: true; timeModel: "Hours"}
                },
                State {
                    when: minutesField.pressed
                    name: "pickMinutes"
                    PropertyChanges {target: floater; anchorItem: minutesField; visible: true; timeModel: "Minutes"}
                }
            ]
        }

        Row {
            id:row
            height: timeItem.height
            spacing: TizenConfig.dateEdit.content.margin
            anchors.centerIn: parent
            DateEditField {
                id:hoursField
                implicitWidth: 69
                text: getHours(control.amPmDisplay)
            }
            Text {
                width: 12 + 5 + 5
                height: TizenConfig.dateEdit.content.date.height
                text: ":"
                font.pixelSize: 34
                minimumPixelSize: 1
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
            }
            DateEditField {
                id:minutesField
                implicitWidth: 69
                text: Qt.formatTime(control.time,"mm")
            }
            Button {
                visible: control.amPmDisplay
                id:yearField
                implicitWidth: 95
                implicitHeight: 60
                text: control.time.getHours() >= 12 ? "PM" : "AM"
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    var tmp = control.time
                    if (text == "AM") {
                        tmp.setHours(tmp.getHours()+12)
                    } else {
                        tmp.setHours(tmp.getHours()-12)
                    }
                    control.time = tmp
                    text = Qt.binding(function() {return control.time.getHours() >= 12 ? "PM" : "AM"})
                }
            }
        }

        Floater {
            id: floater
            anchors.fill: parent
            property Item anchorItem: null
            property string timeModel
            content: DateEditBarPicker{
                id: floaterContent
                root: floater.parent
                anchorItem: floater.anchorItem
                control: style.control
                model: floater.timeModel
            }
        }
    }
}
