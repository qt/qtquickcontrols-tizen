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
        implicitHeight: TizenConfig.tabBar.height
        visible:leftVisible
        TizenBorderImage {
            anchors.centerIn: parent
            source: TizenConfig.tabBar.arrow.sourceLeft
            backgroundColor: TizenConfig.tabBar.arrow.color
        }
    }
    rightCorner: Item {
        implicitWidth: 40
        implicitHeight: TizenConfig.tabBar.height
        visible:rightVisible
        TizenBorderImage {
            anchors.centerIn: parent
            source: TizenConfig.tabBar.arrow.sourceRight
            backgroundColor: TizenConfig.tabBar.arrow.color
        }
    }

    tabBar: TizenBorderImage {
        id: background
        source: TizenConfig.tabBar.source
        backgroundColor: TizenConfig.tabBar.color
        effectSource: TizenConfig.tabBar.effectSource
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

        implicitWidth: Math.min(Math.max(textitem.contentWidth, TizenConfig.tabBar.tab.minWidth)+2*TizenConfig.tabBar.tab.margin,TizenConfig.tabBar.tab.maxWidth)
        implicitHeight: TizenConfig.tabBar.height
        property bool pressed: parent.parent.pressed
        Component.onCompleted: {
            listView = parent.parent.ListView.view
        }
        TizenBorderImage {
            id: highlight
            anchors.verticalCenter: parent.verticalCenter

            height: TizenConfig.tabBar.tab.height
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: TizenConfig.tabBar.tab.margin
            anchors.rightMargin: TizenConfig.tabBar.tab.margin
            source: pressed ? TizenConfig.tabBar.tab.source.pressed : TizenConfig.tabBar.tab.source.normal
            backgroundColor: (styleData.selected || pressed) ? TizenConfig.tabBar.tab.color.selected: TizenConfig.tabBar.tab.color.normal
            Text {
                id: textitem
                anchors.fill: parent
                text: styleData.title
                renderType: Text.NativeRendering
                scale: control.tabPosition === Qt.TopEdge ? 1 : -1
                color: styleData.selected ? TizenConfig.tabBar.tab.text.color.selected : TizenConfig.tabBar.tab.text.color.normal
                font.pixelSize: TizenConfig.tabBar.tab.font.pixelSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
