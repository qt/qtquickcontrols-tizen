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
import QtQuick.Controls.Tizen 1.0
import "DefaultSettings.js" as Theme
import "private"
Style {
    id:style
    property DateEdit control: __control

    property Component panel: Item {
        id: dateItem
        implicitWidth: row.width
        implicitHeight: Theme.dateEdit.content.date.height
        anchors.fill: parent
        StateGroup {
            id:stateGroup
            states: [
                State {
                    name:""
                },
                State {
                    when: dayField.pressed
                    name: "pickDay"
                    PropertyChanges {target: floater;anchorItem: dayField; visible: true; dateModel: "Day"}
                },
                State {
                    when: monthField.pressed
                    name: "pickMonth"
                    PropertyChanges {target: floater; anchorItem: monthField; visible: true; dateModel: "Month"}
                },
                State {
                    when: yearField.pressed
                    name: "pickYear"
                    PropertyChanges {target: floater; anchorItem: yearField; visible: true; dateModel: "Year"}
                }
            ]
        }

        Row {
            id:row
            height: dateItem.height
            spacing: Theme.dateEdit.content.margin
            anchors.centerIn: parent
            DateEditField {
                id:dayField
                text: Qt.formatDate(control.date,"dd")
            }
            DateEditField {
                id:monthField
                text: Qt.formatDate(control.date,"MMM")
            }
            DateEditField {
                id:yearField
                text: Qt.formatDate(control.date,"yyyy")
            }
        }

        Floater {
            id: floater
            anchors.fill: parent
            property Item anchorItem: null
            property string dateModel
            content: DateEditBarPicker{
                id: floaterContent
                root: floater.parent
                anchorItem: floater.anchorItem
                control: style.control
                model: floater.dateModel
            }
        }
    }
}
