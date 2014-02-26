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

import QtQuick 2.2
import QtMultimedia 5.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Tizen 1.0

Item {
    id:root
    width: parent.width
    height: parent.height

    Column {
        spacing: 40
        anchors.centerIn: parent

        Button {
            anchors.margins: 20
            text: soundEffect.playing ? "Playing sound effect" : "Play sound effect"
            onClicked: soundEffect.playing ? soundEffect.stop() : soundEffect.play()
        }

        Button {
            anchors.margins: 20
            text: audio.playing ? "Playing audio" : "Play audio"
            onClicked: audio.playing ? audio.stop() : audio.play()
        }

    }
    Audio {
        id: soundEffect
        property bool playing: false
        onPlaying: playing = true
        onStopped: playing = false
        source: "file:///usr/share/media/Sherbet.wav"
    }
    Audio {
        id: audio
        property bool playing: false
        onPlaying: playing = true
        onStopped: playing = false
        source: "file:///usr/apps/PhYwYqDa1I/data/Walk in the forest.mp3"
    }
}
