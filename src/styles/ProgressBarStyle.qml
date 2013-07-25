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

ProgressBarStyle {
    id: progressBarStyle

    padding.left: TizenConfig.progress.margins.left
    padding.right: TizenConfig.progress.margins.right
    progress: Item {
        implicitWidth: bar.implicitWidth
        implicitHeight: bar.implicitHeight
        TizenBorderImage {
            id:bar
            anchors.centerIn: parent
            width: parent.width
            source: TizenConfig.progress.source.normal
            backgroundColor: TizenConfig.progress.progressColor
            effectSource: TizenConfig.progress.effectSource.normal
        }
    }

    background: Item {
        implicitHeight: 36
        implicitWidth: 650

        TizenBorderImage {
            id:bg
            anchors.centerIn: parent
            width:parent.width
            height:TizenConfig.progress.height
            source: TizenConfig.progress.backgroundSource.normal
            backgroundColor: TizenConfig.progress.backgroundColor
            effectSource: TizenConfig.progress.backgroundEffectSource.normal
        }
    }
}
