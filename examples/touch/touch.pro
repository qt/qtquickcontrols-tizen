TEMPLATE=app

QMAKE_LFLAGS+=-pie -rdynamic

TARGET=QtControls.exe

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
    qt.conf

SOURCES += \
    main.cpp

RESOURCES += \
    touch.qrc



