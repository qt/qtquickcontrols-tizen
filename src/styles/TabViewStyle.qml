import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "DefaultSettings.js" as Theme
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

        implicitWidth: Math.min(Math.max(textitem.contentWidth, Theme.tabBar.tab.minWidth)+2*Theme.tabBar.tab.margin,Theme.tabBar.tab.maxWidth)
        implicitHeight: Theme.tabBar.height

        TizenBorderImage {
            id: background
            anchors.fill: parent
            source: Theme.tabBar.source
            backgroundColor: Theme.tabBar.color
            //effectSource: Theme.tabBar.effectSource
            //foregroundColor: (tab.selected) ? Theme.tabBar.tab.color.selected: Theme.tabBar.tab.color.normal
        }
        TizenBorderImage {
            anchors.verticalCenter: background.verticalCenter

            height: Theme.tabBar.tab.height
            anchors.left: background.left
            anchors.right: background.right
            anchors.leftMargin: Theme.tabBar.tab.margin
            anchors.rightMargin: Theme.tabBar.tab.margin
            source: Theme.tabBar.tab.source.normal
            backgroundColor: (tab.selected) ? Theme.tabBar.tab.color.selected: Theme.tabBar.tab.color.normal
            Text {
                id: textitem
                anchors.fill: parent
                text: tab.title
                renderType: Text.NativeRendering
                scale: control.tabPosition === Qt.TopEdge ? 1 : -1
                color: tab.selected ? Theme.tabBar.tab.text.color.selected : Theme.tabBar.tab.text.color.normal
                font.pixelSize: Theme.tabBar.tab.font.pixelSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
