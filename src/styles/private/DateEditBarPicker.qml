/*
 * Copyright (C) 2013 Tomasz Olszak <olszak.tomasz@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

import QtQuick 2.0
import ".."
import "../DefaultSettings.js" as Theme

MouseArea {
    id: rootItem
    property Item anchorItem
    property point anchorPoint: (anchorItem ? globalAnchorPoint(anchorItem,anchorItem.x, anchorItem.y, anchorItem.width,anchorItem.height) : globalAnchorPoint(anchorItem))

    property date dateTime: model  ? (model === "Hours" || model==="Minutes" ? control.time : control.date) : new Date()
    property Item root
    property Item control

    property string model

    /*hiding bar*/
    onClicked: anchorItem.pressed = false

    function getModel() {
        switch (rootItem.model) {
        case "Day":return daysInMonth(rootItem.dateTime);
        case "Month": return months;
        case "Year": return 5000;
        case "Hours": return control.amPmDisplay ? 12 : 24
        case "Minutes": return 60
        }
    }

    function daysInMonth(anyDateInMonth) {

        return new Date(anyDateInMonth.getYear(),
                        anyDateInMonth.getMonth() + 1,
                        0).getDate();
    }

    property variant months: {
        var tmp = []
        for (var i=1; i < 13; i++) {
            tmp.push(Qt.formatDate(new Date(2000,i,0),"MMM"));
        }
        return tmp
    }

    function globalAnchorPoint() {
        var tmp = {x:0,y:0}
        if (anchorItem) {
            tmp = root.mapFromItem(anchorItem, 0, 0)
            return Qt.point(tmp.x+ anchorItem.width/2,tmp.y + anchorItem.height)
        } else {
            return Qt.point(0,0)
        }
    }

    TizenBorderImage {
        id:tail
        x: anchorPoint.x - width/2
        y: anchorPoint.y
        source: "../"+Theme.dateEdit.tail.source
        backgroundColor: Theme.dateEdit.bar.color
    }

    TizenBorderImage {
        id:bg
        x:0
        anchors.top: tail.bottom
        width: root.width
        height: Theme.dateEdit.height
        source: "../"+Theme.dateEdit.source
        backgroundColor: Theme.dateEdit.bar.color
    }
    PathView {
        id: view
        anchors.fill: bg
        model: getModel()
        property int itemWidth: (rootItem.model === "Day") ?  98 : (rootItem.model === "Month") ? 115 : 120
        onModelChanged: {
            switch (rootItem.model) {
            case "Day": currentIndex = rootItem.dateTime.getDate(); break;
            case "Month": currentIndex = rootItem.dateTime.getMonth(); break;
            case "Year": currentIndex = rootItem.dateTime.getFullYear()-1; break;
            case "Hours": currentIndex = rootItem.dateTime.getHours(); break;
            case "Minutes": currentIndex = rootItem.dateTime.getMinutes(); break;
            }

            positionViewAtIndex(currentIndex, PathView.Center)
        }

        highlightRangeMode: PathView.ApplyRange
        pathItemCount: (rootItem.model === "Day" ||
                        rootItem.model === "Hours" ||
                        rootItem.model === "Minutes"
                        ) ? 7 : (rootItem.model === "Month") ? 6 : 5

        preferredHighlightBegin: (rootItem.model === "Month") ? 0.4 : 0.5
        preferredHighlightEnd: 0.5
        dragMargin: view.width/2

        function delegateText(txt) {
            var tmp = ""+txt
            return tmp.length === 1 ? "0"+tmp : tmp
        }

        delegate: Text {
            id: barDelegate
            width: view.itemWidth
            height: view.height
            text: modelData //view.delegateText(rootItem.model === "Month" || rootItem.model === "Hours" || rootItem.model === "Minutes" ? modelData : modelData+1)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.dateEdit.bar.day.fontSize
            color: PathView.isCurrentItem ? Theme.dateEdit.bar.text.color.pressed : Theme.dateEdit.bar.text.color.normal
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var tmp = dateTime
                    switch (rootItem.model) {
                    case "Day": tmp.setDate(index+1); break;
                    case "Month": tmp.setMonth(index); break;
                    case "Year": tmp.setFullYear(index+1); break;
                    case "Hours":
                        if (control.amPmDisplay && control.time.getHours()> 12 ) {
                            tmp.setHours(index+12);
                        } else {
                            tmp.setHours(index);
                        }
                        break;
                    case "Minutes": tmp.setMinutes(index); break;
                    }
                    if (rootItem.model == "Hours" || rootItem.model == "Minutes") {
                        control.time = tmp
                    } else {
                        control.date = tmp
                    }
                    anchorItem.pressed = false
                }
            }
        }

        path: Path {
            startY: view.height/2; startX: 0
            PathLine { y: view.height/2; x: view.width  }
        }
    }
}
