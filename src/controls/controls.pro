TARGETPATH = QtQuick/Controls/Tizen


QML_FILES += \
    Switch.qml \
    DetailButton.qml\
    ContextMenu.qml\
    SplitView.qml\
    ScrollDecorator.qml

CONFIG += force_independent

OTHER_FILES += qmldir

load(qml_module)
