
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

var colorsBlack = {
    foreground : "#FFFFFFFF",
    background : "#FF000000",
    B011 : "#FF000000",
    B012 : "#FF000000",
    B013 : "#FF000000",
    B014 : "#FFFFFFFF",
    B015 : "#FFF8F6EF",
    B016 : "#FF000000",
    B017 : "#FF000000",
    B018 : "#FF6590FF",
    B0211 : "#FF000000",
    B0211D : "#FF000000",
    B0212 : "#FF1C1E28",
    B0213 : "#FF404040",
    B0214 : "#FF222C47",
    B0215 : "#FF1D263C",
    B0216 : "#FF222C47",
    B0217 : "#FF11131B",
    B0217D : "#7F11131B",
    B0221 : "#FFFFFFFF",
    B0221L1 : "#FF838CA3",
    B0221L2 : "#FF697082",
    B0221L3 : "#FF6B707E",
    B0221L4 : "#FF525252",
    B0222 : "#3FFFFFFF",
    B0223 : "#00000000",
    B0224 : "#FF27282B",
    B0225 : "#FF2A5181",
    B0226 : "#FF4B73A3",
    B0227 : "#FF000000",
    B0228 : "#FF1A5274",
    B0232 : "#00000000",
    B0233 : "#00000000",
    B031 : "#00000000",
    B041 : "#FF2B3AAF",
    B041P : "#FFFAFAFA",
    B042 : "#FF2A39AC",
    B043 : "#00001BEA",
    B044 : "#FF2B3AAF",
    B0511 : "#FF313F66",
    B0511P : "#FF2A39AC",
    B0512 : "#00000000",
    B0513 : "#FFF8F6EF",
    B0514 : "#FF313F66",
    B0514P1 : "#FF303FB2",
    B0514P2 : "#FF5163E9",
    B0514L3 : "#FF6590FF",
    B0515L1 : "#FF464C5E",
    B0515L2 : "#7F454442",
    B0516 : "#00000000",
    B0517 : "#00000000",
    B0517P1 : "#00000000",
    B0517P2 : "#00000000",
    B0518 : "#FF2E4468",
    B0518P : "#00000000",
    B0519 : "#FFF25D28",
    B0520 : "#FF2E4468",
    B0520P : "#FF3C649B",
    B052L1 : "#FFFAFAFA",
    B052L1P : "#FF5D83FF",
    B052L1D : "#FFFAFAFA",
    B052L2 : "#00000000",
    B052L2P : "#005787B8",
    B052L3 : "#00000000",
    B052L3P : "#00000000",
    B052L4 : "#FFFAFAFA",
    B052L4P : "#FFFAFAFA",
    B052L4D : "#66FAFAFA",
    B052L5 : "#FFFAFAFA",
    B052L5D : "#66FAFAFA",
    B052L5P : "#FF5D83FF",
    B052L6 : "#FFFAFAFA",
    B052L6D : "#99FAFAFA",
    B052L6P1 : "#FFFAFAFA",
    B052L6P2 : "#FFFAFAFA",
    B052L7 : "#FFFAFAFA",
    B052L8 : "#FFFAFAFA",
    B052L8P : "#FF5D83FF",
    B052L8D : "#66FAFAFA",
    B052L9 : "#FFFAFAFA",
    B052L9P : "#FFFAFAFA",
    B052L9D : "#66FAFAFA",
    B052L10 : "#00000000",
    B0531 : "#FFF8F6EF",
    B0532 : "#00000000",
    B0533 : "#00000000",
    B0534 : "#00000000",
    B0535 : "#00000000",
    B0536 : "#00000000",
    B0537 : "#00000000",
    B0541 : "#FF6B728A",
    B0541P : "#FF0D1D96",
    B0541D : "#996B728A",
    B0542 : "#00000000",
    B0542P : "#00000000",
    B0543 : "#00000000",
    B0544 : "#00000000",
    B0545 : "#00000000",
    B0551 : "#00000000",
    B0552 : "#00000000",
    B0553 : "#FFA5A5A5",
    B0554 : "#FFFFFFFF",
    B0555 : "#00000000",
    B0556 : "#00000000",
    B0557 : "#00000000",
    B0558 : "#00000000",
    B061L1 : "#FF1D263C",
    B061L2 : "#FF49577B",
    B061L3 : "#FF969A9C",
    B061L4 : "#FF1D263C",
    B061L5 : "#FF000000",
    B061L6 : "#FF333537",
    B0621L1 : "#00000000",
    B0621L2 : "#00000000",
    B0622L1 : "#001D263C",
    B0622L2 : "#3FFFFFFF",
    B0623L1 : "#FF1D263C",
    B0623L2 : "#FF626675",
    B0624L1 : "#FF1D263C",
    B0624L2 : "#FF626675",
    B0624L3 : "#FF313F66",
    B0624L4 : "#FF000000",
    B0624L5 : "#FF5783FF",
    B0624L6 : "#FF5783FF",
    B063L1 : "#FFFAFAFA",
    B063L1P : "#FFFAFAFA",
    B063L1D : "#99FAFAFA",
    B063L2 : "#FFFAFAFA",
    B063L3 : "#FF6E6F76",
    B063L4 : "#FFFAFAFA",
    B063L5 : "#FFFAFAFA",
    B063L5D : "#99FAFAFA",
    B063L6 : "#FFFAFAFA",
    B063L6P : "#FFFAFAFA",
    B063L6D : "#99FAFAFA",
    B063L7 : "#FF656565",
    B063L8 : "#FF6E6F76",
    B063L8P : "#00000000",
    B063L8D : "#996E6F76",
    B063L9 : "#FFFAFAFA",
    B064L1 : "#FF6890FF",
    B064L2 : "#FFD7D7D7",
    B064L2P : "#FFD7D7D7",
    B064L2D : "#FFD7D7D7",
    B064L3 : "#FF000000",
    B064L3P : "#FFFAFAFA",
    B064L3D : "#7F000000",
    B065L1 : "#00000000",
    B065L2 : "#00000000",
    B065L3 : "#00000000",
    B065L3P : "#00000000",
    B065L4 : "#FFEEEEEE",
    B065L4D : "#99EEEEEE",
    B065L4P : "#FF2A39AC",
    B065L5 : "#00000000",
    B071 : "#FF393B41",
    B0721 : "#FFA09F9A",
    B0722 : "#FF5D83FF",
    B0723 : "#FF212428",
    B0724 : "#FF404040",
    B0725 : "#FF4F66A7",
    B0726 : "#FF404040",
    B0731 : "#FF2B3AAF",
    B0732 : "#FFFAFAFA",
    B0741 : "#FFA09F9A",
    B0742 : "#FF5D83FF",
    B0743 : "#FF212428",
    B0744 : "#FF404040",
    B0745 : "#00000000",
    B0751 : "#FF3B73B6",
    F011L1 : "#FFFAFAFA",
    F011L1P : "#FFFAFAFA",
    F011L1D : "#7FFAFAFA",
    F011L2 : "#FF6890FF",
    F011L2D : "#996890FF",
    F011L3 : "#FF6E6F76",
    F011L3D : "#996E6F76",
    F011L4 : "#FF6E6F76",
    F011L4D : "#996E6F76",
    F011L5 : "#FF5D83FF",
    F011L6 : "#FFFAFAFA",
    F011L7 : "#FF6E6F76",
    F011L7D : "#996E6F76",
    F011L8 : "#FFD10000",
    F011L9 : "#FFFFFFFF",
    F011L10 : "#FFF9F9F9",
    F011L11 : "#FF808080",
    F011L12 : "#FF4093F7",
    F011L13 : "#00000000",
    F011L14 : "#00000000",
    F011L15 : "#FFD10000",
    F011L16 : "#FF6E6F76",
    F011L17 : "#FF8B8B8B",
    F011L18 : "#FF686868",
    F011L19 : "#FF6E6F76",
    F011L20 : "#00000000",
    F011L21 : "#FF6E6F76",
    F011L22 : "#FF6E6F76",
    F011L23 : "#FF1382FF",
    F021L1i : "#FFFAFAFA",
    F021L1iP : "#FFFAFAFA",
    F021L1iD : "#99FAFAFA",
    F022L1i : "#FF6C6E77",
    F022L2i : "#FF2B3AAF",
    F022L2iD : "#992B3AAF",
    F031L1 : "#FFFAFAFA",
    F031L1P : "#FFFAFAFA",
    F031L1D : "#99FAFAFA",
    F031L2 : "#00000000",
    F031L2P : "#00000000",
    F031L2D : "#00000000",
    F031L3 : "#FFFAFAFA",
    F031L3P : "#FFFAFAFA",
    F031L3D : "#99FAFAFA",
    F032L1 : "#FFFAFAFA",
    F032L1P : "#FFFAFAFA",
    F032L1D : "#99FAFAFA",
    F032L2 : "#FFFAFAFA",
    F032L2P : "#FFFAFAFA",
    F032L2D : "#99FAFAFA",
    F032L3 : "#FFF9F9F9",
    F032L3P : "#FFF9F9F9",
    F041i : "#FF5D6176",
    F041iD : "#995D6176",
    F051 : "#FF485D93",
    F052 : "#FF3A72FF",
    F053 : "#FF485D93",
    F053P : "#FFFAFAFA",
    F053D : "#99485D93",
    F054 : "#FF202432",
    F055 : "#FF3A72FF",
    W011 : "#FF4B4D56",
    W011D : "#994B4D56",
    W012 : "#FF095FD4",
    W012D : "#99095FD4",
    W012P : "#FF232F91",
    W013 : "#00000000",
    W0141 : "#FFDB0000",
    W0141P : "#FFA10808",
    W0141D : "#99DB0000",
    W015 : "#FF343432",
    W021L1 : "#FF000000",
    W021L1P : "#FF2B3AAF",
    W021L2 : "#FF425790",
    W021L2P : "#FFFAFAFA",
    W021L3 : "#FF425790",
    W021L3P : "#FFFAFAFA",
    W021L4 : "#FFF0F0F0",
    W031L1 : "#FF000000",
    W031L1D : "#99000000",
    W031L2 : "#FF000000",
    W031L2D : "#99000000",
    W032 : "#FF5D6176",
    W032P : "#FFFAFAFA",
    W032D : "#99FAFAFA",
    W041 : "#FFE1DDD1",
    W051 : "#FF000000",
    W0611 : "#FFFAFAFA",
    W0611P : "#FFFAFAFA",
    W0611D : "#99FAFAFA",
    W062L1 : "#FF555861",
    W062L1D : "#99555861",
    W062L2 : "#FF415BFE",
    W062L2D : "#7F415BFE",
    W062L3 : "#FFD8D7D2",
    W062L3D : "#4CD8D7D2",
    W062L4 : "#FF3677C3",
    W062L4D : "#4C3677C3",
    W062L5 : "#FFC7D3E3",
    W0631 : "#FFEEEEEE",
    W0632 : "#FF4C5158",
    W0641 : "#FF6B6D79",
    W0641P : "#FF2A39AC",
    W0641D : "#996B6D79",
    W0651 : "#FF3A3A3A",
    W0711 : "#FF525767",
    W0711P : "#FF2B3AAF",
    W0711D : "#FF3E414E",
    W0712 : "#FF4267A9",
    W0713 : "#FF2B3AAF",
    W0714 : "#FF263E5F",
    W0715 : "#FF2B3AAF",
    W0721 : "#FFFAFAFA",
    W0721P : "#FFFAFAFA",
    W0721D : "#99FAFAFA",
    W0811 : "#FF253296",
    W0812 : "#00000000",
    W0813 : "#FF595959",
    W082 : "#00000000",
    W083 : "#00000000",
    W084 : "#B2FAFAFA",
    W084P : "#FFFAFAFA",
    W085 : "#00000000",
    W091 : "#FF2B3AAF",
    W092 : "#FFFAFAFA",
    W101 : "#FF4884D6",
    W111 : "#FFC8CEDB",
    W112L1 : "#FF8995AE",
    W112L2 : "#FFFAFAFA",
    W1121 : "#FFFAFAFA",
    W1122 : "#FFFAFAFA",
    W1123 : "#4C000000",
    W1211 : "#00000000",
    W1212 : "#00000000",
    W1221 : "#FF000000",
    W1222 : "#FF878580",
    W1223 : "#FFFFFFFF",
    W131 : "#FF343739",
    W132 : "#FF2B3AAF",
    W141 : "#FFFAFAFA",
    W151 : "#66000000",
    W152 : "#FF42434B",
    W153 : "#FF2B3AAF",
    W154 : "#FF1C1E28",
    W161 : "#FF001BEA",
}

var colorsWhite = {
    foreground : "#FF000000",
    background : "#FFF8F6EF",
    B011 : "#FFF8F6EF",
    B012 : "#FFF8F6EF",
    B013 : "#FF000000",
    B014 : "#FFFFFFFF",
    B015 : "#FF202327",
    B016 : "#FF000000",
    B017 : "#FFFAFAFA",
    B018 : "#FF6590FF",
    B0211 : "#FFF8F6EF",
    B0211D : "#FFF8F6EF",
    B0212 : "#FFEDEBE4",
    B0213 : "#FF5B5656",
    B0214 : "#FFDCDAD3",
    B0215 : "#FFDEDCD5",
    B0216 : "#FFBDBBB5",
    B0217 : "#FFEFEDE5",
    B0217D : "#7FEFEDE5",
    B0221 : "#FF8A8A8A",
    B0221L1 : "#FF8A8A8A",
    B0221L2 : "#FF808080",
    B0221L3 : "#FF8C8C8C",
    B0221L4 : "#FFCCCBC7",
    B0222 : "#FFFFFFFF",
    B0223 : "#FFD3D1CB",
    B0224 : "#FFB9B8B2",
    B0225 : "#FF2A5181",
    B0226 : "#FF4B73A3",
    B0227 : "#FF000000",
    B0228 : "#FF1A5274",
    B0232 : "#00000000",
    B0233 : "#00000000",
    B031 : "#00000000",
    B041 : "#FF5787C2",
    B041P : "#FFFAFAFA",
    B042 : "#FF0079D4",
    B043 : "#FF5787C2",
    B044 : "#FF2A89C2",
    B0511 : "#FFEDEBE4",
    B0511P : "#FF0E66AA",
    B0512 : "#00000000",
    B0513 : "#FF202327",
    B0514 : "#FFEDEBE4",
    B0514P1 : "#FF0E66AA",
    B0514P2 : "#FF007BDA",
    B0514L3 : "#FF6590FF",
    B0515L1 : "#FFDEDCD5",
    B0515L2 : "#7F626262",
    B0516 : "#00000000",
    B0517 : "#00000000",
    B0517P1 : "#00000000",
    B0517P2 : "#00000000",
    B0518 : "#003567A3",
    B0518P : "#00000000",
    B0519 : "#FFF25D28",
    B0520 : "#FF3567A3",
    B0520P : "#FF2A89C2",
    B052L1 : "#FF656565",
    B052L1P : "#FF007BDA",
    B052L1D : "#7F656565",
    B052L2 : "#FF525252",
    B052L2P : "#FF4093F7",
    B052L3 : "#00000000",
    B052L3P : "#00000000",
    B052L4 : "#FF282828",
    B052L4P : "#FFFAFAFA",
    B052L4D : "#7F282828",
    B052L5 : "#FF282828",
    B052L5D : "#7F282828",
    B052L5P : "#FF007BDA",
    B052L6 : "#FF282828",
    B052L6D : "#7F282828",
    B052L6P1 : "#FF0E68AD",
    B052L6P2 : "#FFFAFAFA",
    B052L7 : "#FFFAFAFA",
    B052L8 : "#FFFAFAFA",
    B052L8P : "#FF4093F7",
    B052L8D : "#7FFAFAFA",
    B052L9 : "#FFFAFAFA",
    B052L9P : "#FFFAFAFA",
    B052L9D : "#7FFAFAFA",
    B052L10 : "#00000000",
    B0531 : "#FF202327",
    B0532 : "#00000000",
    B0533 : "#00000000",
    B0534 : "#00000000",
    B0535 : "#00000000",
    B0536 : "#00000000",
    B0537 : "#00000000",
    B0541 : "#FFF7F5ED",
    B0541P : "#FF007AD8",
    B0541D : "#7FF7F5ED",
    B0542 : "#00000000",
    B0542P : "#00000000",
    B0543 : "#00000000",
    B0544 : "#00000000",
    B0545 : "#00000000",
    B0551 : "#00000000",
    B0552 : "#00000000",
    B0553 : "#FF0C0F14",
    B0554 : "#FF414447",
    B0555 : "#00000000",
    B0556 : "#00000000",
    B0557 : "#00000000",
    B0558 : "#00000000",
    B061L1 : "#FFF8F6EF",
    B061L2 : "#FFDBD9CE",
    B061L3 : "#FFD6D3C9",
    B061L4 : "#FF444444",
    B061L5 : "#FF000000",
    B061L6 : "#FF17191C",
    B0621L1 : "#00000000",
    B0621L2 : "#00000000",
    B0622L1 : "#00444444",
    B0622L2 : "#3FFFFFFF",
    B0623L1 : "#FF2D2D2D",
    B0623L2 : "#FF5B5B5B",
    B0624L1 : "#FFCDCDCD",
    B0624L2 : "#FFFAFAFA",
    B0624L3 : "#FF303337",
    B0624L4 : "#FF000000",
    B0624L5 : "#FF007BDA",
    B0624L6 : "#FFFAFAFA",
    B063L1 : "#FF000000",
    B063L1P : "#FFFAFAFA",
    B063L1D : "#7F000000",
    B063L2 : "#FFFAFAFA",
    B063L3 : "#FF808080",
    B063L4 : "#FFFAFAFA",
    B063L5 : "#FFFAFAFA",
    B063L5D : "#7FFAFAFA",
    B063L6 : "#FF454545",
    B063L6P : "#FF454545",
    B063L6D : "#7F454545",
    B063L7 : "#FFBABABA",
    B063L8 : "#FF808080",
    B063L8P : "#00000000",
    B063L8D : "#7F808080",
    B063L9 : "#FF252525",
    B064L1 : "#FF3B73B6",
    B064L2 : "#FF808080",
    B064L2P : "#FF808080",
    B064L2D : "#FF808080",
    B064L3 : "#FF3A3A3A",
    B064L3P : "#FFFAFAFA",
    B064L3D : "#7F3A3A3A",
    B065L1 : "#00000000",
    B065L2 : "#00000000",
    B065L3 : "#00000000",
    B065L3P : "#00000000",
    B065L4 : "#FFF7F5ED",
    B065L4D : "#7FF7F5ED",
    B065L4P : "#FF007AD8",
    B065L5 : "#00000000",
    B071 : "#FFC6C4BE",
    B0721 : "#FFA09F9A",
    B0722 : "#FF3B73B6",
    B0723 : "#FFF8F6EF",
    B0724 : "#FFD1CFC9",
    B0725 : "#FF3B73B6",
    B0726 : "#FFE2DFD5",
    B0731 : "#FF3B73B6",
    B0732 : "#FFFAFAFA",
    B0741 : "#FFA09F9A",
    B0742 : "#FF3B73B6",
    B0743 : "#FFE6E3D8",
    B0744 : "#FFC5C2B7",
    B0745 : "#00000000",
    B0751 : "#FF3B73B6",
    F011L1 : "#FF000000",
    F011L1P : "#FFFAFAFA",
    F011L1D : "#7F000000",
    F011L2 : "#FF3B73B6",
    F011L2D : "#7F3B73B6",
    F011L3 : "#FF4F4F4F",
    F011L3D : "#FF4F4F4F",
    F011L4 : "#FF4F4F4F",
    F011L4D : "#7F4F4F4F",
    F011L5 : "#FF3B73B6",
    F011L6 : "#FF808080",
    F011L7 : "#FF686866",
    F011L7D : "#CC686866",
    F011L8 : "#FFC24747",
    F011L9 : "#FFFFFFFF",
    F011L10 : "#FFFAFAFA",
    F011L11 : "#FF808080",
    F011L12 : "#FF4093F7",
    F011L13 : "#00000000",
    F011L14 : "#00000000",
    F011L15 : "#FFE94949",
    F011L16 : "#FF8B8B8B",
    F011L17 : "#FF8B8B8B",
    F011L18 : "#FF686868",
    F011L19 : "#FF8B8B8B",
    F011L20 : "#00000000",
    F011L21 : "#FF808080",
    F011L22 : "#FF9A9A9A",
    F011L23 : "#FF1382FF",
    F021L1i : "#FF808080",
    F021L1iP : "#FFFAFAFA",
    F021L1iD : "#7F808080",
    F022L1i : "#FFB8B8B8",
    F022L2i : "#FF4C85C9",
    F022L2iD : "#4C4C85C9",
    F031L1 : "#FF282828",
    F031L1P : "#FFFAFAFA",
    F031L1D : "#7F282828",
    F031L2 : "#00000000",
    F031L2P : "#00000000",
    F031L2D : "#00000000",
    F031L3 : "#FFFAFAFA",
    F031L3P : "#FFFAFAFA",
    F031L3D : "#7FFAFAFA",
    F032L1 : "#FF282828",
    F032L1P : "#FFFAFAFA",
    F032L1D : "#7F282828",
    F032L2 : "#FFFAFAFA",
    F032L2P : "#FFFAFAFA",
    F032L2D : "#7FFAFAFA",
    F032L3 : "#FFF9F9F9",
    F032L3P : "#FFF9F9F9",
    F041i : "#FF808080",
    F041iD : "#7F808080",
    F051 : "#FF90A9C7",
    F052 : "#FF007BDB",
    F053 : "#FF808080",
    F053P : "#FF000000",
    F053D : "#7F808080",
    F054 : "#FFE3E1D9",
    F055 : "#FF007BDA",
    W011 : "#FFF7F5ED",
    W011D : "#7FF7F5ED",
    W012 : "#FF0058D0",
    W012D : "#7F0058D0",
    W012P : "#FF0051BF",
    W013 : "#00000000",
    W0141 : "#FFC12C21",
    W0141P : "#FFC12C21",
    W0141D : "#7FC12C21",
    W015 : "#FF343432",
    W021L1 : "#FFF8F6EF",
    W021L1P : "#FF5787C2",
    W021L2 : "#FF0E68AD",
    W021L2P : "#FFFAFAFA",
    W021L3 : "#FF0E68AD",
    W021L3P : "#FFFAFAFA",
    W021L4 : "#FF000000",
    W031L1 : "#FFFAFAFA",
    W031L1D : "#7FFAFAFA",
    W031L2 : "#FFFAFAFA",
    W031L2D : "#7FFAFAFA",
    W032 : "#FF878580",
    W032P : "#FF000000",
    W032D : "#7F878580",
    W041 : "#FF17191C",
    W051 : "#FF000000",
    W0611 : "#FF3B73B6",
    W0611P : "#FFFAFAFA",
    W0611D : "#7F3B73B6",
    W062L1 : "#FFC5C5C5",
    W062L1D : "#4CC5C5C5",
    W062L2 : "#FF007DDE",
    W062L2D : "#7F007DDE",
    W062L3 : "#FF615F5B",
    W062L3D : "#4C615F5B",
    W062L4 : "#FF70A9EE",
    W062L4D : "#4C70A9EE",
    W062L5 : "#FF223148",
    W0631 : "#FF656565",
    W0632 : "#FFFAFAFA",
    W0641 : "#FFF7F5ED",
    W0641P : "#FF0079D4",
    W0641D : "#7FF7F5ED",
    W0651 : "#FFBFBFBF",
    W0711 : "#FF6C90BC",
    W0711P : "#FF4093F7",
    W0711D : "#FF607DA1",
    W0712 : "#00000000",
    W0713 : "#FF4093F7",
    W0714 : "#00000000",
    W0715 : "#FF2889FF",
    W0721 : "#FFFAFAFA",
    W0721P : "#FFFAFAFA",
    W0721D : "#99FAFAFA",
    W0811 : "#FF5787C2",
    W0812 : "#00000000",
    W0813 : "#FF494949",
    W082 : "#00000000",
    W083 : "#00000000",
    W084 : "#B2FAFAFA",
    W084P : "#FFFAFAFA",
    W085 : "#00000000",
    W091 : "#FF444444",
    W092 : "#FFFFFFFF",
    W101 : "#FF5893E4",
    W111 : "#FFE7E5DE",
    W112L1 : "#FFB4B4B4",
    W112L2 : "#FFFFFFFF",
    W1121 : "#FF000000",
    W1122 : "#FF000000",
    W1123 : "#4C000000",
    W1211 : "#00000000",
    W1212 : "#00000000",
    W1221 : "#00000000",
    W1222 : "#00000000",
    W1223 : "#00000000",
    W131 : "#FF959595",
    W132 : "#FF5787C2",
    W141 : "#FF808080",
    W151 : "#FF95948F",
    W152 : "#FF878787",
    W153 : "#FF5787C2",
    W154 : "#FFEFECE0",
    W161 : "#FF007BDA",
}
