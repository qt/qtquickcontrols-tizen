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
import QtQuick.Controls.Tizen 1.0
import QtQuick.Controls.Styles.Tizen 1.0
import QtQuick.Layouts 1.0

Panel {
    id:root
    width: parent.width -30
    height: childrenRect.height
    x:15

    property alias title: switchLabel.text
    property alias informationText: compassLabel.text
    property alias sensorActive: sensorSwitch.checked

    RowLayout {
        anchors.margins: 10
        id: switchRow
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        Label {
            id: switchLabel
            color: TizenConfig.colors.foreground
            text: "Compass"
            height: 50
            Layout.fillWidth: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.family: TizenConfig.fonts.defaultFamily
            font.pixelSize: parent.height/2
            fontSizeMode: Text.Fit
        }
        Switch {
            id: sensorSwitch
            checked: false
        }
    }
    Label {
        id: compassLabel
        anchors.margins: 10
        color: TizenConfig.colors.foreground
        text: "Sensor inactive"
        anchors.top: switchRow.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        Layout.fillWidth: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.family: TizenConfig.fonts.defaultFamily
        font.pixelSize: parent.height/2
        fontSizeMode: Text.Fit
    }
}
