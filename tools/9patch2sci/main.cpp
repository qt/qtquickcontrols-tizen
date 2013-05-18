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

#include <QImage>
#include <QStringList>
#include <QFileInfo>
#include <QDir>
#include <QTextStream>
#include <iostream>
#include <QDebug>

void usage()
{
    qDebug() << "USAGE:";
    qDebug() << "\t9patch2sci <nine_patched_image> [<outputdirectory>]";
}

int main(int argc, char *argv[])
{
    if (argc < 2) {
        qWarning() << "Wrong aguments count";
        usage();
        return 1;
    }
    QString outDir;
    if( argc == 3) {
        outDir = argv[2];

        if(!outDir.endsWith(QDir::separator())) {
            outDir+=QDir::separator();
        }
    }
    QString imgPath(argv[1]);
    QFileInfo fileInfo(imgPath);
    QImage image(imgPath);
    if (image.isNull()) {
        qWarning() << "Image not found";
        return -1;
    }

    if (fileInfo.fileName().contains("#")) {
        qCritical()<<"file :"<<fileInfo.fileName()<<" contains # sign - it could not be loaded from QML";
        return -1;
    }

    if(outDir.isEmpty()) {
        outDir = fileInfo.dir().absolutePath();
    }

    int borderLeft = 0;
    int borderRight = 0;
    int borderTop = 0;
    int borderBottom = 0;
    for (int x = 0; x < image.width(); ++x) {
        if (image.pixel(x, 0) == qRgba(0, 0, 0, 255) && !borderLeft) {
            borderLeft = x - 1;
        }
        if (image.pixel(x, 0) != qRgba(0, 0, 0, 255) && borderLeft) {
            borderRight = image.width() - x - 1;
            break;
        }
    }
    for (int y = 0; y < image.height(); ++y) {
        if (image.pixel(0, y) == qRgba(0, 0, 0, 255) && !borderTop) {
            borderTop = y - 1;
        }
        if (image.pixel(0, y) != qRgba(0, 0, 0, 255) && borderTop) {
            borderBottom = image.height() - y - 1;
            break;
        }
    }
    // assuming that if there is no border we don't crop the image
    int xOffset = (borderLeft || borderRight) ? 1 : 0;
    int yOffset = (borderTop || borderBottom) ? 1 : 0;
    QImage copy = image.copy(xOffset, yOffset, image.width() - 2*xOffset, image.height() - 2*yOffset);

    if (borderBottom + borderLeft + borderRight + borderTop > 0) {
        if (!copy.save(QDir(outDir).filePath(QString("%1").arg(fileInfo.fileName())))) {
            qWarning() << "Cannot save image file:"<<fileInfo.fileName();
            return 1;
        }
        QFile sciFile(QDir(outDir).filePath(QString("%1.sci").arg(fileInfo.completeBaseName())));
        if (!sciFile.open(QFile::Text|QFile::WriteOnly)) {
            qWarning() << "Cannot create sci file:"<<sciFile.fileName();
            return 1;
        }
        qDebug()<<"creating sci file:"<<sciFile.fileName();
        QTextStream stream(&sciFile);
        stream << "border.left: " << borderLeft << "\n";
        stream << "border.right: " << borderRight << "\n";
        stream << "border.top: " << borderTop << "\n";
        stream << "border.bottom: " << borderBottom << "\n";
        stream << "source: " << QString("%1").arg(fileInfo.fileName()) << "\n";
        stream.flush();
        sciFile.close();
    } else {
        qDebug()<<fileInfo.fileName()<<" is not 9-patch file - skipping";
    }
    return 0;
}
