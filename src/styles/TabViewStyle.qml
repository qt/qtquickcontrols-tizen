import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "DefaultSettings.js" as Default

TabViewStyle {
    id:root
    tabsAlignment: Qt.AlignLeft
    tabsLeftPadding: 0
    tabsRightPadding: 0
    tabOverlap: 0
    frameOverlap: 0

    frame: Panel {
        anchors.fill:parent
    }

    tab: Item {
        scale: control.tabPosition === Qt.TopEdge ? 1 : -1

        implicitWidth: Math.min(Math.max(textitem.contentWidth, Default.tabBar.tab.minWidth)+2*Default.tabBar.tab.margin,Default.tabBar.tab.maxWidth)
        implicitHeight: Default.tabBar.height

        TizenBorderImage {
            id: background
            anchors.fill: parent
            source: Default.tabBar.source
            backgroundColor: Default.tabBar.color
            //effectSource: Default.tabBar.effectSource
            //foregroundColor: (tab.selected) ? Default.tabBar.tab.color.selected: Default.tabBar.tab.color.normal
        }
        TizenBorderImage {
            anchors.verticalCenter: background.verticalCenter

            height: Default.tabBar.tab.height
            anchors.left: background.left
            anchors.right: background.right
            anchors.leftMargin: Default.tabBar.tab.margin
            anchors.rightMargin: Default.tabBar.tab.margin
            source: Default.tabBar.tab.source.normal
            backgroundColor: (tab.selected) ? Default.tabBar.tab.color.selected: Default.tabBar.tab.color.normal
            Text {
                id: textitem
                anchors.fill: parent
                text: tab.title
                renderType: Text.NativeRendering
                scale: control.tabPosition === Qt.TopEdge ? 1 : -1
                color: tab.selected ? Default.tabBar.tab.text.color.selected : Default.tabBar.tab.text.color.normal
                font.pixelSize: Default.tabBar.tab.font.pixelSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
