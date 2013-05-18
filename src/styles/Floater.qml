import QtQuick 2.0

Item {
    id: floaterBehavior
    visible: false
    property Component content
    width: contentLoader ? contentLoader.item.width:0
    height: contentLoader ? contentLoader.item.height:0
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
    }

    states: State {
        name: "active"
        when: Qt.isQtObject(contentLoader.item) && contentLoader.item.opacity > 0
        ParentChange { target: floaterBehavior; parent: root }
    }

}
