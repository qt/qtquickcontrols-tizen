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
import QtQuick.Controls.Tizen 1.0
import QtQuick.Controls.Styles.Tizen 1.0

Style {
    id: style

    property BusyIndicator control: __control

    property Component panel: Image {
        id:root
        source: TizenConfig.busyIndicator.source

        Binding {
            target:control
            property: "duration"
            value: TizenConfig.busyIndicator.duration
        }

        RotationAnimation {
            running: control.running
            from:0
            to: 360
            target: root
            direction: RotationAnimation.Clockwise
            duration: control.duration
            loops: Animation.Infinite
            property: "rotation"
        }
    }
}
