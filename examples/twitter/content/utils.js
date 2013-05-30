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

.pragma library

var debug = false;

// initial app window size
var appWidth = 720;
var appHeight = 1280;

// initial scale
var appScale = 1;

// returns line height scaled so it's visible on lower DPI (useful for testing on PC)
function scaleLine(height)
{
    return height * 1.0 / appScale
}

/*
 * Javascript Humane Dates
 * Copyright (c) 2008 Dean Landolt (deanlandolt.com)
 * Re-write by Zach Leatherman (zachleat.com)
 *
 * Adopted from the John Resig's pretty.js
 * at http://ejohn.org/blog/javascript-pretty-date
 * and henrah's proposed modification
 * at http://ejohn.org/blog/javascript-pretty-date/#comment-297458
 *
 * Licensed under the MIT license.
 */
function prettyDate(date_str) {
                var time_formats = [
                    [60, 'Just Now'],
                    [90, '1 Minute'], // 60*1.5
                    [3600, 'Minutes', 60], // 60*60, 60
                    [5400, '1 Hour'], // 60*60*1.5
                    [86400, 'Hours', 3600], // 60*60*24, 60*60
                    [129600, '1 Day'], // 60*60*24*1.5
                    [604800, 'Days', 86400], // 60*60*24*7, 60*60*24
                    [907200, '1 Week'], // 60*60*24*7*1.5
                    [2628000, 'Weeks', 604800], // 60*60*24*(365/12), 60*60*24*7
                    [3942000, '1 Month'], // 60*60*24*(365/12)*1.5
                    [31536000, 'Months', 2628000], // 60*60*24*365, 60*60*24*(365/12)
                    [47304000, '1 Year'], // 60*60*24*365*1.5
                    [3153600000, 'Years', 31536000], // 60*60*24*365*100, 60*60*24*365
                    [4730400000, '1 Century'], // 60*60*24*365*100*1.5
                ];

                var time = ('' + date_str).replace(/-/g,"/").replace(/[TZ]/g," "),
                    dt = new Date,
                    seconds = ((dt - new Date(time) + (dt.getTimezoneOffset() * 60000)) / 1000),
                    token = ' Ago',
                    i = 0,
                    format;

                if (seconds < 0) {
                    seconds = Math.abs(seconds);
                    token = '';
                }

                while (format = time_formats[i++]) {
                    if (seconds < format[0]) {
                        if (format.length == 2) {
                            return format[1] + (i > 1 ? token : ''); // Conditional so we don't return Just Now Ago
                        } else {
                            return Math.round(seconds / format[2]) + ' ' + format[1] + (i > 1 ? token : '');
                        }
                    }
                }

                // overflow for centuries
                if (seconds > 4730400000) {
                    return Math.round(seconds / 4730400000) + ' Centuries' + token;
                }

                return date_str;
            }
