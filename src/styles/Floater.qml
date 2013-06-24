import QtQuick 2.0

Item {
    id: floaterBehavior
    objectName: "floaterBehavior"
    visible: false
    property Component content
    width: contentLoader ? contentLoader.item.implicitWidth:0
    height: contentLoader ? contentLoader.item.implicitHeight:0
    property Item root: findRoot()

    function findRoot() {
        var p = parent;
        while(p.parent != undefined)
            p = p.parent;

        return p;
    }

    Loader {
        id: contentLoader
        sourceComponent: content
        anchors.fill: parent
        onStatusChanged: if (status === Loader.Error) console.error("Failed to load content for", floaterBehavior)
    }

    states: State {
        name: "active"
        when: Qt.isQtObject(contentLoader.item) && contentLoader.item.opacity > 0
        ParentChange { target: floaterBehavior; parent: root }
    }
}
