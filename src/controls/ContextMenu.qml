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
import QtQuick.Controls.Styles.Tizen 1.0

Floater {
    id: menu
    visible:false

    /*! In anchorPoint of this item menu arrow will be placed */
    property Item anchorItem
    /*! It is the point where top of the arrow will be placed.

        If anchorItem is set then point is interpreter in anchorItem's coordinates
    */
    property point anchorPoint


    /* for getting all menu items to model*/
    default property alias menuItems: workaround.data

    /* shows ContextMenu */
    onVisibleChanged: {
        if (visible) {
            popup()
        } else {
            hide()
        }
    }
    property string __state: "hidden"
    function popup(){
        __state = "shown"
    }
    function hide() {
        __state = "hidden"
    }

    QtObject {
        id:workaround
        property list<QtObject> data

    }

    property Component style: Qt.createComponent(Settings.style + "/ContextMenuStyle.qml", menu)

    Loader {
        id: styleLoader
        property Item __control: menu
        sourceComponent: style
    }

    content: styleLoader.item && styleLoader.item.lookAndFeel
}
