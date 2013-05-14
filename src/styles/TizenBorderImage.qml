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
