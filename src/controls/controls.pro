TARGETPATH = QtQuick/Controls/Tizen


QML_FILES += \
    Switch.qml \
    DetailButton.qml

CONFIG += force_independent

OTHER_FILES += qmldir

load(qml_module)
