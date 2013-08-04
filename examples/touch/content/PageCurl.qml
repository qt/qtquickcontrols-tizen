/*
 * Copyright (C) 2013 Witold Wysota <wysota@qtcentre.org>
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

/*
* file based on qtmultimedia/examples/multimedia/video/qmlvideofx/shaders/pagecurl.fsh
* and qtmultimedia/examples/multimedia/video/qmlvideofx/qml/qmlvideofx/EffectPageCurl.qml
*/

import QtQuick 2.0

ShaderEffect {

    property variant source
    property color bgColor: "transparent"
    property double curlExtent

    fragmentShader: "
precision lowp float;
uniform lowp float curlExtent;
uniform lowp sampler2D source;
uniform lowp float qt_Opacity;
varying lowp vec2 qt_TexCoord0;
uniform lowp vec4 bgColor;

const lowp float minAmount = -0.16;
const lowp float maxAmount = 1.3;
const lowp float PI = 3.141592653589793;
const lowp float scale = 512.0;
const lowp float sharpness = 3.0;
//const vec4 bgColor = vec4(0.0, 0.0, 0.0, 0.0);

float amount = curlExtent * (maxAmount - minAmount) + minAmount;
float cylinderCenter = amount;
// 360 degrees * amount
float cylinderAngle = 2.0 * PI * amount;
const float cylinderRadius = 1.0 / PI / 2.0;

vec3 hitPoint(float hitAngle, float yc, vec3 point, mat3 rrotation)
{
float hitPoint = hitAngle / (2.0 * PI);
point.y = hitPoint;
return rrotation * point;
}

vec4 antiAlias(vec4 color1, vec4 color2, float distance)
{
distance *= scale;
if (distance < 0.0) return color2;
if (distance > 2.0) return color1;
float dd = pow(1.0 - distance / 2.0, sharpness);
return ((color2 - color1) * dd) + color1;
}

float distanceToEdge(vec3 point)
{
float dx = abs(point.x > 0.5 ? 1.0 - point.x : point.x);
float dy = abs(point.y > 0.5 ? 1.0 - point.y : point.y);
if (point.x < 0.0) dx = -point.x;
if (point.x > 1.0) dx = point.x - 1.0;
if (point.y < 0.0) dy = -point.y;
if (point.y > 1.0) dy = point.y - 1.0;
if ((point.x < 0.0 || point.x > 1.0) && (point.y < 0.0 || point.y > 1.0)) return sqrt(dx * dx + dy * dy);
return min(dx, dy);
}

vec4 seeThrough(float yc, vec2 p, mat3 rotation, mat3 rrotation)
{
float hitAngle = PI - (acos(yc / cylinderRadius) - cylinderAngle);
vec3 point = hitPoint(hitAngle, yc, rotation * vec3(p, 1.0), rrotation);
if (yc <= 0.0 && (point.x < 0.0 || point.y < 0.0 || point.x > 1.0 || point.y > 1.0))
    return bgColor;
if (yc > 0.0)
    return texture2D(source, p);
vec4 color = texture2D(source, point.xy);
vec4 tcolor = vec4(0.0);
return antiAlias(color, tcolor, distanceToEdge(point));
}

vec4 seeThroughWithShadow(float yc, vec2 p, vec3 point, mat3 rotation, mat3 rrotation)
{
float shadow = distanceToEdge(point) * 30.0;
shadow = (1.0 - shadow) / 3.0;
if (shadow < 0.0)
    shadow = 0.0;
else
    shadow *= amount;
vec4 shadowColor = seeThrough(yc, p, rotation, rrotation);
shadowColor.r -= shadow;
shadowColor.g -= shadow;
shadowColor.b -= shadow;
return shadowColor;
}

vec4 backside(float yc, vec3 point)
{
vec4 color = texture2D(source, point.xy);
float gray = (color.r + color.b + color.g) / 15.0;
gray += (8.0 / 10.0) * (pow(1.0 - abs(yc / cylinderRadius), 2.0 / 10.0) / 2.0 + (5.0 / 10.0));
color.rgb = vec3(gray);
return color;
}

void main(void)
{
const float angle = 30.0 * PI / 180.0;
float c = cos(-angle);
float s = sin(-angle);
mat3 rotation = mat3(
    c, s, 0,
    -s, c, 0,
    0.12, 0.258, 1
);
c = cos(angle);
s = sin(angle);
mat3 rrotation = mat3(
    c, s, 0,
    -s, c, 0,
    0.15, -0.5, 1
);
vec3 point = rotation * vec3(qt_TexCoord0, 1.0);
float yc = point.y - cylinderCenter;
vec4 color = vec4(1.0, 0.0, 0.0, 1.0);
if (yc < -cylinderRadius) {
    // See through to background
    color = bgColor;
} else if (yc > cylinderRadius) {
    // Flat surface
    color = texture2D(source, qt_TexCoord0);
} else {
    float hitAngle = (acos(yc / cylinderRadius) + cylinderAngle) - PI;
    float hitAngleMod = mod(hitAngle, 2.0 * PI);
    if ((hitAngleMod > PI && amount < 0.5) || (hitAngleMod > PI/2.0 && amount < 0.0)) {
        color = seeThrough(yc, qt_TexCoord0, rotation, rrotation);
    } else {
        point = hitPoint(hitAngle, yc, point, rrotation);
        if (point.x < 0.0 || point.y < 0.0 || point.x > 1.0 || point.y > 1.0) {
            color = seeThroughWithShadow(yc, qt_TexCoord0, point, rotation, rrotation);
        } else {
            color = backside(yc, point);
            vec4 otherColor;
            if (yc < 0.0) {
                float shado = 1.0 - (sqrt(pow(point.x - 0.5, 2.0) + pow(point.y - 0.5, 2.0)) / 0.71);
                shado *= pow(-yc / cylinderRadius, 3.0);
                shado *= 0.5;
                otherColor = vec4(0.0, 0.0, 0.0, shado);
            } else {
                otherColor = texture2D(source, qt_TexCoord0);
            }
            color = antiAlias(color, otherColor, cylinderRadius - abs(yc));

            // This second antialiasing step causes the shader to fail to render, on
            // Symbian devices (tested so far using IVE3.5).  Running out of scratch
            // memory?
        }
    }
}
gl_FragColor = qt_Opacity * color;
}
"
}
