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

import QtQuick 2.0
import "../DefaultSettings.js" as Theme

QtObject {
    property string theme: "black"
    property var fonts: Theme.fonts
    property var colors: (theme ==="white") ? Theme.whiteColors : Theme.blackColors
    function getColor(th, key) {
        if (th === "white") {
            return TizenConfig.whiteColors[key]
        } else {
            return TizenConfig.blackColors[key]
        }
    }
    property QtObject fontLoader: FontLoader {
        source: Theme.fonts.defaultSource
    }
    property var panel : Theme.createPanel(theme)
    property var progress : Theme.createProgress(theme)
    property var slider : Theme.createSlider(theme)
    property var button : Theme.createButton(theme)
    property var toolBar : Theme.createToolBar(theme)
    property var checkBox : Theme.createCheckBox(theme)
    property var tabBar : Theme.createTabBar(theme)
    property var detailButton : Theme.createDetailButton(theme)
    property var contextMenu : Theme.createContextMenu(theme)
    property var splitView : Theme.createSplitView(theme)
    property var scroll : Theme.createScroll(theme)
    property var popup : Theme.createPopup(theme)
    property var titleBar : Theme.createTitleBar(theme)
    property var busyIndicator : Theme.createBusyIndicator(theme)
    property var dateEdit : Theme.createDateEdit(theme)
}
