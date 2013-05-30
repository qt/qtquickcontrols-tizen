/****************************************************************************
**
** Copyright (C) 2013 Jarosław Staniek <staniek@kde.org>
** Contact: http://www.qt-project.org/legal
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
import QtQuick.XmlListModel 2.0
import "utils.js" as Utils

XmlListModel {
    property bool ready: false
    property string user

    source:'https://api.twitter.com/1/statuses/user_timeline.xml?include_entities=true'
          + '&exclude_replies=true&trim_user=true&include_rts=true&screen_name=' + user + '&count=50'
    query: "/statuses/status"
    XmlRole { name: "date"; query: "created_at/string()" }
    XmlRole { name: "statusText"; query: "text/string()" }

    onStatusChanged: {
        ready = (status == XmlListModel.Ready)
        if (Utils.debug) {
            switch (status) {
            case XmlListModel.Ready:    console.log("[READY]   '" + source + "' | "  + count + " items")
            case XmlListModel.Error:    console.log("[ERROR]   '" + source + "' | Error: ''" + errorString() + "'")
            case XmlListModel.Loading:  console.log("[LOADING] '" + source + "'")
            }
        }
    }
}
