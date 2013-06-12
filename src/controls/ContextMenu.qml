/*
 * Copyright (C) 2013 Tomasz Olszak <olszak.tomasz@gmail.com>
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:

 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
