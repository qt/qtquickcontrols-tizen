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

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles.Tizen 1.0
import QtQuick.Controls.Styles 1.1

BusyIndicatorStyle {
    id: style

    indicator: Image {
        id:root
        source: TizenConfig.busyIndicator.source
        opacity: control.running ? 1 : 0

        Behavior on opacity { OpacityAnimator { duration: 250 } }

        RotationAnimator on rotation {
            running: control.running
            duration: 1000
            loops: Animation.Infinite
            from: 0
            to: 360

        }
    }
}
