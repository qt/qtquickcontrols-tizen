TEMPLATE=app

TARGET=QtControls

QT += qml quick

OTHER_FILES += \
    main.qml \
    content/AndroidDelegate.qml \
    content/ButtonPage.qml \
    content/ProgressBarPage.qml \
    content/SliderPage.qml \
    content/TabBarPage.qml \
    content/CheckBoxPage.qml \
    content/TextInputPage.qml \
    content/ContextMenuPage.qml \
    content/SplitViewPage.qml \
    content/DateTimeEditPage.qml\
    content/PageCurl.qml \
    content/ConfigurationPage.qml \
    tizen/qt.conf \
    manifest.xml


SOURCES += \
    main.cpp

RESOURCES += touch-default.qrc

tizen {
    tizen_shared.files = shared/res
    CONFIG += TIZEN_STANDALONE_PACKAGE
    TIZEN_BUNDLED_QT_LIBS=Qt5Core Qt5DBus Qt5Qml Qt5Quick Qt5Widgets Qt5Gui Qt5Network
    load(tizen_app)
}
