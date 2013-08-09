TEMPLATE=app

tizen {
    QMAKE_LFLAGS+=-pie -rdynamic
    TARGET=QtControls.exe
} else {
    TARGET=QtControls
}
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
    tizen/qt.conf


SOURCES += \
    main.cpp

RESOURCES += touch-default.qrc

tizen: RESOURCES += touch-tizen.qrc

