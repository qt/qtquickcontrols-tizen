TEMPLATE=app

tizen {
    QMAKE_LFLAGS+=-pie -rdynamic
    TARGET=QtHelloWorld.exe
} else {
    TARGET=QtHelloWorld
}

#under /opt/usr/apps/$APPID application will be installed
#you also need to add this in tizen/qt.conf file in Prefix entry
APPID=QtHelloWrl

QT += qml quick

OTHER_FILES += \
    main.qml \
    tizen/qt.conf

SOURCES += \
    main.cpp

RESOURCES += helloworld-default.qrc

tizen: RESOURCES += helloworld-tizen.qrc




