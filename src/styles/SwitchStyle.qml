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
    id: styleitem

    /*! The \l Slider attached to this style. */
    readonly property Switch control: __control

    padding { top: 0 ; left: 0 ; right: 0 ; bottom: 0 }

    /*! This property holds the item for the slider handle.
        You can access the slider through the \c control property
    */
    property Component handle: Item {
        implicitWidth: icon.implicitWidth
        implicitHeight: icon.implicitHeight
        Image {
            id:icon
            anchors.fill: parent
            source: control.enabled ? ( control.checked ? TizenConfig.checkBox.onOff.on.handler.source.normal : TizenConfig.checkBox.onOff.off.handler.source.normal) :  ( control.checked ? TizenConfig.checkBox.onOff.on.handler.source.disabled : TizenConfig.checkBox.onOff.off.handler.source.disabled)
        }
    }

    /*! This property holds the background groove of the slider.
        You can access the handle position through the \c handlePosition property.
    */
    property Component groove: Item {
        implicitWidth: onOffBackground.implicitWidth
        implicitHeight: onOffBackground.implicitHeight
        Image {
            id:onOffBackground
            anchors.fill: parent
            source: control.enabled ? TizenConfig.checkBox.onOff.source.normal :  TizenConfig.checkBox.on.source.disabled
        }
    }

    /*! This property holds the slider style panel.

        Note that it is generally not recommended to override this.
    */
    property Component panel: Item {
        id: root
        property int handleWidth: handleLoader.implicitWidth
        property int handleHeight: handleLoader.implicitHeight

        property bool horizontal : control.orientation === Qt.Horizontal
        property int horizontalSize: grooveLoader.implicitWidth + padding.left + padding.right
        property int verticalSize: Math.max(handleLoader.implicitHeight, grooveLoader.implicitHeight) + padding.top + padding.bottom

        implicitWidth: horizontal ? horizontalSize : verticalSize
        implicitHeight: horizontal ? verticalSize : horizontalSize

        y: horizontal ? 0 : height
        rotation: horizontal ? 0 : -90
        transformOrigin: Item.TopLeft

        Item {
            anchors.fill: parent
            Loader {
                id: grooveLoader
                property int handlePosition: handleLoader.x + handleLoader.width/2
                x: padding.left
                sourceComponent: groove
                width: (horizontal ? parent.width : parent.height) - padding.left - padding.right
                height:(horizontal ? parent.height : parent.width) - padding.top - padding.bottom
                y: padding.top
            }
            Loader {
                id: handleLoader
                sourceComponent: handle
                anchors.verticalCenter: grooveLoader.verticalCenter
                x: control.__handlePos
            }
        }
    }
}
