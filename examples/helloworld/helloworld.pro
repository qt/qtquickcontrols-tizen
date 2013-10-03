TEMPLATE=app

TARGET=QtHelloWorld

QT += qml quick

OTHER_FILES += \
    main.qml \
    tizen/manifest.xml

SOURCES += \
    main.cpp

RESOURCES += helloworld-default.qrc

tizen {
    tizen_shared.files = shared/res
    CONFIG += TIZEN_STANDALONE_PACKAGE
    TIZEN_BUNDLED_QT_LIBS=Qt5Core Qt5DBus Qt5Qml Qt5Quick Qt5Widgets Qt5Gui Qt5Network
    load(tizen_app)
}
