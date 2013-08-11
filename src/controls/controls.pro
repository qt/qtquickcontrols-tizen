TEMPLATE = lib
CONFIG += qt plugin
QT += qml quick
TARGET=tizencontrolsplugin
TARGETPATH = QtQuick/Controls/Tizen


QML_FILES += \
    Switch.qml \
    DetailButton.qml\
    ContextMenu.qml\
    SplitView.qml\
    ScrollDecorator.qml\
    Popup.qml\
    BusyIndicator.qml \
    DateEdit.qml\
    TimeEdit.qml \
    TitleBar.qml \
    ToolBar.qml \
    View.qml \
    Panel.qml

CONFIG += force_independent

OTHER_FILES += qmldir \
    private/TizenControls.qml

load(qml_module)

target.base = $$_PRO_FILE_PWD_
target.path = $$instbase/$$TARGETPATH

HEADERS += \
    qquicktizencontrolsextensionplugin.h

SOURCES += \
    qquicktizencontrolsextensionplugin.cpp
INSTALLS += target

RESOURCES += \
    internal_resources.qrc
