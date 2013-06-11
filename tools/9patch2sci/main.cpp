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

    int borderLeft = -1;
    int borderRight = -1;
    int borderTop = -1;
    int borderBottom = -1;

    bool isNinePatch = true;

    for (int x = 0; x < image.width(); ++x) {
        if (qAlpha(image.pixel(x, 0)) == 255 && borderLeft < 0) {
            if (!x) {
                qWarning("Wrong nine-patch image format! Border definition line should not start at x = 0.");
                isNinePatch = false;
                break;
            } else {
                if (image.pixel(x, 0) != qRgba(0, 0, 0, 255)) {
                    qWarning("Wrong nine-patch image format!");
                    isNinePatch = false;
                    break;
                }
                borderLeft = x - 1;
            }
        }
        if (qAlpha(image.pixel(x, 0)) != 255 && borderLeft >= 0) {
            borderRight = image.width() - x - 1;
            break;
        }
    }

    if (borderLeft < 0) {
        qWarning("Wrong nine-patch image format! Proper border definition not found.");
        isNinePatch = false;
    }
    if (borderRight < 0) {
        qWarning("Wrong nine-patch image format!");
        isNinePatch = false;
    }

    for (int y = 0; (y < image.height()) && isNinePatch; ++y) {
        if (qAlpha(image.pixel(0, y)) == 255 && borderTop < 0) {
            if (!y) {
                qWarning("Wrong nine-patch image format! Border definition line should not start at y = 0.");
                isNinePatch = false;
                break;
            } else {
                if (image.pixel(0, y) != qRgba(0, 0, 0, 255)) {
                    qWarning("Wrong nine-patch image format!");
                    isNinePatch = false;
                    break;
                }
                borderTop = y - 1;
            }
        }
        if (qAlpha(image.pixel(0, y)) != 255 && borderTop >= 0) {
            borderBottom = image.height() - y - 1;
            break;
        }
    }

    if (borderTop < 0) {
        qWarning("Wrong nine-patch image format! Proper border definition not found.");
        isNinePatch = false;
    }
    if (borderBottom < 0) {
        qWarning("Wrong nine-patch image format!");
        isNinePatch = false;
    }

    if (!isNinePatch) {
        qDebug()<<fileInfo.fileName()<<" is not 9-patch file - skipping";
        return 1;
    }

    int xOffset = 1;
    int yOffset = 1;

    QImage copy = image.copy(xOffset, yOffset, image.width() - 2*xOffset, image.height() - 2*yOffset);

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

    return 0;
}
