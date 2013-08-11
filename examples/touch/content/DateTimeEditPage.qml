/*
 * Copyright (C) 2013 Tomasz Olszak <olszak.tomasz@gmail.com>
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:

 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Tizen 1.0

Item {
    id:root
    width: parent.width
    height: parent.height
    Column {
        anchors.centerIn: parent
        spacing: 50
        Column {
            Label {
                color: TizenControls.palette.foreground
                text:"Today"
            }
            DateEdit {

            }
        }
        Column {
            Label {
                color: TizenControls.palette.foreground
                text:"Tomorrow"
            }

            DateEdit {
                property date now: new Date()
                date: new Date(now.getTime() + 24 * 60 * 60 * 1000)
            }
        }
        Column {
            Label {
                color: TizenControls.palette.foreground
                text:"Disabled"
            }

            DateEdit {
                enabled: false
            }
        }
        Column {
            Label {
                color: TizenControls.palette.foreground
                text:"Time"
            }

            TimeEdit { amPmDisplay: false }
        }
        Column {
            Label {
                color: TizenControls.palette.foreground
                text:"Time AM/PM"
            }

            TimeEdit { }
        }
    }
}
