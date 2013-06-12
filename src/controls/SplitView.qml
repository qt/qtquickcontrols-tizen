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
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles.Tizen 1.0

SplitView {
    id: splitView
    handleDelegate: TizenBorderImage {
        id:bg
        width: splitView.orientation === Qt.Horizontal ? (!styleData.pressed ? Theme.splitView.width : Theme.splitView.pressedWidth) : 1
        height: splitView.orientation === Qt.Horizontal ? 1 : (!styleData.pressed ? Theme.splitView.width : Theme.splitView.pressedWidth)
        source: "../Styles/Tizen/"+Theme.splitView.source
        backgroundColor: styleData.pressed ? Theme.splitView.color.pressed : Theme.splitView.color.normal
        TizenBorderImage {
            anchors.fill: parent
            source: splitView.orientation === Qt.Horizontal ? "../Styles/Tizen/"+Theme.splitView.horizontal.source : "../Styles/Tizen/"+Theme.splitView.vertical.source
            effectSource: splitView.orientation === Qt.Horizontal ? "../Styles/Tizen/"+Theme.splitView.horizontal.effectSource : "../Styles/Tizen/"+Theme.splitView.vertical.effectSource
        }
    }
}
