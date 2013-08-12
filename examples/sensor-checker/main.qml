/****************************************************************************
**
** Copyright (C) 2013 Tomasz Olszak.
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Tizen 1.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtSensors 5.1
import "content"

ApplicationWindow {
    id: appWindow
    y: 60
    width: 720
    height: 1220
    property real curlValue: 0.05

    Accelerometer {
        id:accelerometer
        active: accelerometerItem.sensorActive
    }

    RotationSensor {
        id:rotationSensor
        active: rotationItem.sensorActive
    }
    Compass {
        id: compass
        active: compassItem.sensorActive
    }
    Accelerometer {
        id: gravitySensor
        active: gravityItem.sensorActive
        identifier: "tizen.gravity"
    }
    Gyroscope {
        id: gyroscope
        active: gyroscopeItem.sensorActive
    }
    LightSensor {
        id: lightSensor
        active: lightSensorItem.sensorActive
    }
    Magnetometer {
        id: magnetometer
        active: magnetometerItem.sensorActive
    }
    ProximitySensor {
        id: proximitySensor
        active: proximityItem.sensorActive
    }

    VisualItemModel {
        id: sensorItemModel
        SensorInformationItem {
            id: rotationItem
            title: qsTr("Rotation sensor")
            informationText: rotationSensor.active ? ("x:" + rotationSensor.reading.x + ", y:" + rotationSensor.reading.y + ", z:" + rotationSensor.reading.z) : "Rotation sensor inactive"
        }
        SensorInformationItem {
            id: compassItem
            title: qsTr("Compass")
            informationText: compass.active ? ("azimuth:" + compass.reading.azimuth + ", calibrationLevel:" +compass.reading.calibrationLevel) : "Compass inactive"
        }
        SensorInformationItem {
            id: accelerometerItem
            title: qsTr("Accelerometer")
            informationText: accelerometer.active ? ("x:" + accelerometer.reading.x + ", y:" + accelerometer.reading.y + ", z:" + accelerometer.reading.z) : "Accelerometer inactive"
        }
        SensorInformationItem {
            id: gravityItem
            title: qsTr("Gravity Sensor")
            informationText: gravitySensor.active ? ("x:" + gravitySensor.reading.x + ", y:" + gravitySensor.reading.y + ", z:" + gravitySensor.reading.z) : "Gravity sensor inactive"
        }
        SensorInformationItem {
            id: gyroscopeItem
            title: qsTr("Gyroscope")
            informationText: gyroscope.active ? ("x:" + gyroscope.reading.x + ", y:" + gyroscope.reading.y + ", z:" + gyroscope.reading.z) : "Gyroscope inactive"
        }
        SensorInformationItem {
            id: lightSensorItem
            title: qsTr("Light sensor")
            informationText: lightSensor.active ? ("illuminance:" + lightSensor.reading.illuminance) : "Light sensor inactive"
        }
        SensorInformationItem {
            id: magnetometerItem
            title: qsTr("Magnetometer")
            informationText: magnetometer.active ? ("x:" + magnetometer.reading.x + ", y:" + magnetometer.reading.y + ", z:" + magnetometer.reading.z + ", calibrationLevel:"+magnetometer.reading.calibrationLevel) : "Magnetometer inactive"
        }
        SensorInformationItem {
            id: proximityItem
            title: qsTr("Proximity sensor")
            informationText: proximitySensor.active ? ("near:" + proximitySensor.reading.near) : "Proximity sensor inactive"
        }
    }

    View {
        id: content
        anchors.fill: parent

        titleBar.text: qsTr("Qt Sensor Checker")

        backAction.onTriggered: Qt.quit()
        ListView {
            clip: true
            anchors.fill: parent
            model: sensorItemModel
            ScrollDecorator {flickableItem: parent}
        }
    }

}
