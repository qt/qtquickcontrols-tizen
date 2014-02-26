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
    tizen/manifest.xml \
    content/MultimediaPage.qml


SOURCES += \
    main.cpp

RESOURCES += touch-default.qrc

tizen {
    tizen_shared.files = shared/res
    CONFIG += TIZEN_STANDALONE_PACKAGE
    TIZEN_BUNDLED_QT_LIBS=Qt5Core \
                          Qt5DBus \
                          Qt5Qml \
                          Qt5Quick \
                          Qt5Widgets \
                          Qt5Gui \
                          Qt5Network \
                          Qt5Multimedia \
                          Qt5MultimediaQuick_p \
                          Qt5MultimediaWidgets \
                          Qt5OpenGL
    tizen_lib.files += $$[QT_INSTALL_LIBS]/libqgsttools_p.so.1
    LIBS += -lqgsttools_p
    load(tizen_app)
}
