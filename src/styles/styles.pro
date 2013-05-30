TARGETPATH = QtQuick/Controls/Styles/Tizen

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
    DetailButtonStyle.qml

# Images
QML_FILES += \
    images/720x1280/*.png \
    images/720x1280/*.sci \
    images/720x1280/white/*.png \
    images/720x1280/white/*.sci

QML_FILES += \
    DefaultSettings.js

CONFIG += force_independent

OTHER_FILES += qmldir

load(qml_module)
