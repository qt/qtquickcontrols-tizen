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

Item {
    id:root
    implicitWidth: bg.implicitWidth
    implicitHeight: bg.implicitHeight
    property alias source: bg.source
    property alias effectSource: effect.source
    property color backgroundColor
    property color foregroundColor
    BorderImage {
        id:bg
        anchors.fill: parent
        smooth: parent.smooth
        layer.enabled: root.backgroundColor != undefined && source != undefined
        layer.effect: ShaderEffect {
            id:bgShader
            property color color: root.backgroundColor
            fragmentShader: "
                                varying mediump vec2 qt_TexCoord0;
                                uniform lowp float qt_Opacity;
                                uniform lowp sampler2D source;
                                uniform highp vec4 color;
                                void main() {
                                    highp vec4 pixelColor = texture2D(source, qt_TexCoord0);
                                    if ((pixelColor.r == pixelColor.b) && pixelColor.g == 0.0) {
                                        gl_FragColor = color.rgba * pixelColor.a * qt_Opacity;
                                    } else {
                                        gl_FragColor = pixelColor;
                                    }
                                }
                            "
        }
    }
    BorderImage {
        id:effect
        anchors.fill: bg
        smooth: parent.smooth
        layer.enabled: root.foregroundColor != undefined && effectSource != undefined
        layer.effect: ShaderEffect {
            id:effectShader
            property color color: root.foregroundColor
            fragmentShader: "
                                varying mediump vec2 qt_TexCoord0;
                                uniform lowp float qt_Opacity;
                                uniform lowp sampler2D source;
                                uniform highp vec4 color;
                                void main() {
                                    highp vec4 pixelColor = texture2D(source, qt_TexCoord0);
                                    if ((pixelColor.r == pixelColor.b) && pixelColor.g == 0.0) {
                                        gl_FragColor = color.rgba * pixelColor.a * qt_Opacity;
                                    } else {
                                        gl_FragColor = pixelColor;
                                    }
                                }
                            "
        }
    }

}
