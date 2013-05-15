import QtQuick 2.0
import "DefaultSettings.js" as Default

TizenBorderImage {
    implicitWidth: 200
    implicitHeight: 100
    property bool pressed:false
    source: pressed ? Default.panel.source.pressed : Default.panel.source.normal
    effectSource: pressed ? Default.panel.effectSource.pressed : (activeFocus ? Default.panel.effectSource.selected : Default.panel.effectSource.normal)
    backgroundColor: pressed ? Default.panel.color.pressed: Default.panel.color.normal
}
