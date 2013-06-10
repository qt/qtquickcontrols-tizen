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
TabViewStyle {
    id:root
    tabsAlignment: Qt.AlignLeft
    tabOverlap: 0
    frameOverlap: 0

    frame: Panel {
        anchors.fill: parent
    }

    leftCorner: Item {
        implicitWidth: 40
        implicitHeight: Theme.tabBar.height
        visible:leftVisible
        TizenBorderImage {
            anchors.centerIn: parent
            source: Theme.tabBar.arrow.sourceLeft
            backgroundColor: Theme.tabBar.arrow.color
        }
    }
    rightCorner: Item {
        implicitWidth: 40
        implicitHeight: Theme.tabBar.height
        visible:rightVisible
        TizenBorderImage {
            anchors.centerIn: parent
            source: Theme.tabBar.arrow.sourceRight
            backgroundColor: Theme.tabBar.arrow.color
        }
    }

    tabBar: TizenBorderImage {
        id: background
        source: Theme.tabBar.source
        backgroundColor: Theme.tabBar.color
        effectSource: Theme.tabBar.effectSource
    }
    property bool leftVisible: false
    property bool rightVisible: false
    property Item listView : null

    onListViewChanged: {
        listView.interactive = true
        listView.clip = true
        leftVisible = Qt.binding(function() {return !listView.atXBeginning })
        rightVisible = Qt.binding(function() {return !listView.atXEnd })
    }

    tab: Item {
        id:tab
        scale: control.tabPosition === Qt.TopEdge ? 1 : -1

        implicitWidth: Math.min(Math.max(textitem.contentWidth, Theme.tabBar.tab.minWidth)+2*Theme.tabBar.tab.margin,Theme.tabBar.tab.maxWidth)
        implicitHeight: Theme.tabBar.height
        property bool pressed: parent.parent.pressed
        Component.onCompleted: {
            listView = parent.parent.ListView.view
        }
        TizenBorderImage {
            id: highlight
            anchors.verticalCenter: parent.verticalCenter

            height: Theme.tabBar.tab.height
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Theme.tabBar.tab.margin
            anchors.rightMargin: Theme.tabBar.tab.margin
            source: pressed ? Theme.tabBar.tab.source.pressed : Theme.tabBar.tab.source.normal
            backgroundColor: (styleData.selected || pressed) ? Theme.tabBar.tab.color.selected: Theme.tabBar.tab.color.normal
            Text {
                id: textitem
                anchors.fill: parent
                text: styleData.title
                renderType: Text.NativeRendering
                scale: control.tabPosition === Qt.TopEdge ? 1 : -1
                color: styleData.selected ? Theme.tabBar.tab.text.color.selected : Theme.tabBar.tab.text.color.normal
                font.pixelSize: Theme.tabBar.tab.font.pixelSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
