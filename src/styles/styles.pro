
TEMPLATE = lib
CONFIG += qt plugin
QT += qml quick
TARGET=tizenstyleplugin
TARGETPATH = QtQuick/Controls/Styles/Tizen

QT+=qml

QML_FILES = \
    TizenBorderImage.qml \
    ProgressBarStyle.qml \
    SliderStyle.qml \
    ButtonStyle.qml \
    CheckBoxStyle.qml \
    Panel.qml \
    TabViewStyle.qml \
    Floater.qml \
    SwitchStyle.qml\
    DetailButtonStyle.qml\
    DefaultSettings.js\
    ScrollDecoratorStyle.qml\
    ContextMenuStyle.qml\
    PopupStyle.qml\
    BusyIndicatorStyle.qml \
    TitleBarStyle.qml \
    ViewStyle.qml \
    DateEditStyle.qml\
    TimeEditStyle.qml \
    ToolBarStyle.qml \
    ToolBarButton.qml

QML_FILES += themes/Colors.js \
             Images.js

QML_FILES += \
    private/DateEditField.qml\
    private/DateEditBarPicker.qml

# Images
QML_FILES += \
    images/720x1280/*.png \
    images/720x1280/*.sci \
    images/720x1280/white/*.png \
    images/720x1280/white/*.sci \
    images/720x1280/black/*.png \
    images/720x1280/black/*.sci \
    TizenSansRegular.ttf

CONFIG += force_independent

OTHER_FILES += qmldir \
    private/TizenStyleConfig.qml

load(qml_module)

target.base = $$_PRO_FILE_PWD_
target.path = $$instbase/$$TARGETPATH

HEADERS += \
    qquicktizenstyleextensionplugin.h

SOURCES += \
    qquicktizenstyleextensionplugin.cpp
INSTALLS += target
#error($$INSTALLS)

RESOURCES += \
    internal_resources.qrc
