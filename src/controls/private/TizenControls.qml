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
import QtQml 2.1
import QtQuick.Controls.Styles.Tizen 1.0

QtObject {
    readonly property var availableThemes: ["black","white"]
    readonly property string currentTheme: TizenConfig.theme
    function changeTheme(theme) {
        if (availableThemes.indexOf(theme) >= 0) {
            if (currentTheme !== theme)
                TizenConfig.theme = theme;
        } else {
            console.log("Theme:" + theme + " is not handled");
        }
    }
    readonly property alias palette: __prv.pal

    property QtObject __prvProp: QtObject {
        id: __prv
        property QtObject pal: QtObject {
            readonly property color foreground: TizenConfig.colors.foreground
            readonly property color background: TizenConfig.colors.background
        }
    }

    readonly property string defaultFontFamily: TizenConfig.fontLoader.name
}
