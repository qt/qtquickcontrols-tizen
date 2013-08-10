TEMPLATE=app

tizen {
    QMAKE_LFLAGS+=-pie -rdynamic
    TARGET=QtSensorChecker.exe
} else {
    TARGET=QtSensorChecker
}

QT += qml quick

OTHER_FILES += \
    main.qml \
    tizen/qt.conf \
    content/SensorInformationItem.qml

SOURCES += \
    main.cpp


RESOURCES += sensor-checker-default.qrc

tizen: RESOURCES += sensor-checker-tizen.qrc




