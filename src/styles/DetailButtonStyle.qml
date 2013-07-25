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
import QtQuick.Controls.Tizen 1.0
import QtQuick.Controls.Styles.Tizen 1.0

ButtonStyle {
    id: buttonstyle

    readonly property DetailButton control: __control

    background: TizenBorderImage {
        id:detailsBg
        source: TizenConfig.detailButton.source.normal
        backgroundColor: control.enabled ? (control.pressed ? TizenConfig.detailButton.color.pressed : TizenConfig.detailButton.color.normal) : TizenConfig.detailButton.color.disabled
        effectSource: control.enabled ? (control.pressed ? TizenConfig.detailButton.effectSource.pressed : TizenConfig.detailButton.effectSource.normal) : TizenConfig.detailButton.effectSource.disabled
    }

    /*! The label of the button. */
    label: TizenBorderImage {
        id: arrow
        function __rotation(arrowType) {
            switch (arrowType) {
            case Qt.RightArrow: return 0;
            case Qt.DownArrow: return 90;
            case Qt.LeftArrow: return 180;
            case Qt.UpArrow: return -90;
            default: return 0;
            }
        }
        rotation: __rotation(control.arrowType)
        source: TizenConfig.detailButton.iconSource.normal
        backgroundColor: control.enabled ? (control.pressed ? TizenConfig.detailButton.iconColor.pressed : TizenConfig.detailButton.iconColor.normal) : TizenConfig.detailButton.iconColor.disabled
        effectSource: TizenConfig.detailButton.iconEffectSource.normal
    }
}

