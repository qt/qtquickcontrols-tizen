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

.pragma library

.import "themes/Colors.js" as Colors
.import "Images.js" as Images

var resolution="720x1280"
var theme = "black"
var imagesPath = "images/"+resolution+"/"

var whiteColors = Colors.colorsWhite
var blackColors = Colors.colorsBlack
var whiteImages = Images.getImages("white",imagesPath)
var blackImages = Images.getImages("black",imagesPath)

var fonts = {
    defaultFamily: 'TizenSans',
    defaultSource: 'TizenSansRegular.ttf'
}

function createPanel(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }

    var ret = {
        color: {
            normal:colors.B0217,
            pressed: colors.B041
        },

        source: {
            normal:images.img_00_list_group_bg_9,
            pressed:images.img_00_list_group_bg_9,
            disabled:images.img_00_list_group_bg_9,
            highlihgted:images.img_00_list_group_bg_9,
            selected:images.img_00_list_group_bg_9
        },

        effectSource: {
            normal:images.img_00_list_group_bg_ef_9,
            pressed:images.img_00_list_group_bg_ef_9,
            selected:images.img_00_groupedlist_bg_focus_9
        }
    }
    return ret
}

function createProgress(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        margins:{left:8,right:8,top:0,bottom:0},

        backgroundColor: colors.W062L1,
        progressColor: colors.W062L2,

        height:36,
        source: {
            normal: images.img_00_progress_bar_9
        },
        backgroundSource: {
            normal:images.img_00_progress_bg_9
        },
        backgroundEffectSource: {
            normal:images.img_00_progress_ef_bg_9
        },

        effectSource: {
            normal:images.img_00_progress_bar_ef_9
        }
    }
    return ret
}

function createSlider(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        handle:{
            backgroundColor:{
                normal: colors.W0641,
                pressed: colors.W0641P,
                disabled: colors.W0641D
            },

            source:{ normal: images.img_00_slider_handle},
            effectSource: {
                normal: images.img_00_slider_handle_ef,
                disabled: images.img_00_slider_handle_ef_dim,
                pressed: images.img_00_slider_handle_ef_press
            },
            font: {pointSize: 28},
            text: {
                margins: 8,
                color: {
                    normal:colors.W0611,
                    disabled:colors.W0611D
                }
            },

            overlay: {
                backgroundColor:colors.W0631,
                text: {
                    color:colors.W0632
                },
                font: {
                    pixelSize: 72
                },
                width: 90,
                height: 99,
                heightWithoutArrow: 81,
                margin: 12,
                source: images.img_00_slider_popup_bg_9,
            }
        },
        groove:{/*is default progressbar*/}
    }
    return ret
}

function createButton(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        backgroundColor: {
            normal:colors.W011,
            disabled: colors.W011,
            pressed:colors.B042
            //highlighted:colors.W042
        },
        text: {
            color: {
                normal:colors.F031L1,
                disabled: colors.F031L1D,
                pressed: colors.F031L1P
                //highlighted:colors.F031L1P
            },
            margins: {
                left: 12,
                top: 4,
                right:12,
                bottom:4
            }
        },

        source: {
            normal: images.img_00_button_01_9,
            disabled:images.img_00_button_01_9,
            pressed: images.img_00_button_01_9
            //highlighted:images.img_00_button_01_9
        },
        effectSource: {
            normal: images.img_00_button_01_ef_9,
            disabled:images.img_00_button_01_dim_ef_9,
            pressed: images.img_00_button_01_press_ef_9
            //highlighted:images.img_00_button_01_ef_press_9
        },
        font:{pixelSize:36, minimumPixelSize: 28}
    }
    return ret
}

function createToolBar(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        backgroundColor: colors.background,
        iconColor: {
            normal: colors.F032L1,
            disabled: colors.F032L1,
            pressed: colors.F011L12
        },
        back: {
            source: images.img_00_icon_back,
            effectSource: {
                normal: images.img_00_icon_Back_ef
                //disabled:images.img_00_circle_bg_ef_dim
            }
        },
        more: {
            source: images.img_00_icon_more,
            effectSource: {
                normal: images.img_00_icon_more_ef
                //disabled:images.img_00_circle_bg_ef_dim
            }

        }
    }
    return ret
}

function createCheckBox(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        indicator: {
            color: {
                normal:colors.B0217,
                pressed: colors.B041,
                checked:colors.B0217,
                disabled:colors.B0217
                //highlighted:colors.B041
            },
            source: {
                normal:images.img_00_check_bg,
                pressed:images.img_00_check_press_bg,
                disabled: images.img_00_check_dim_bg
            },
            markSource: {
                normal: images.img_00_check_activated,
                disabled: images.img_00_check_activated_dim,
                pressed: images.img_00_check_press,
                checked: images.img_00_check_activated
            }
        },
        onOff: {
            source: {
                normal: images.img_00_button_radio_bg,
                disabled: images.img_00_button_radio_dim_bg,
                pressed: images.img_00_button_radio_press_bg,
                highlighted: images.img_00_button_radio_focus,
                selected: images.img_00_button_radio_bg
            },
            indicator: {
                source: {
                    normal: images.img_00_button_radio_activated,
                    disabled: images.img_00_button_radio_activated_dim,
                    pressed: images.img_00_button_radio_activated_press,
                    highlighted: images.img_00_button_radio_activated,
                    selected: images.img_00_button_radio_activated
                }
            }
        },

        onOffSliding: {
            source: {
                normal: images.img_00_button_on_off_bg,
                disabled: images.img_00_button_on_off_bg_dim,
                pressed: images.img_00_button_on_off_bg,
                highlighted: images.img_00_button_on_off_bg,
                selected: images.img_00_button_on_off_bg
            },

            on: {
                source: {
                    normal: images.img_00_button_on,
                    disabled: images.img_00_button_on_dim
                },
                handler: {
                    source: {
                        normal: images.img_00_button_on_handler,
                        disabled: images.img_00_button_on_handler_dim
                    }
                }
            },
            off: {
                source: {
                    normal: images.img_00_button_off,
                    disabled: images.img_00_button_off_dim
                },
                handler: {
                    source: {
                        normal: images.img_00_button_off_handler,
                        disabled: images.img_00_button_off_handler_dim
                    }
                }
            }

        },
        text: {
            color: {
                normal:colors.F011L1,
                disabled:colors.F011L1D,
                pressed:colors.F031L1P,
                selected:colors.F011L1,
                highlighted:colors.F011L1
            }
        },
        font: {
            pixelSize: 44
        },
        margins: {
            top:10,
            left: 26,
            right:26,
            bottom: 10
        },
        details: {
            color: {
                normal: colors.W011,
                disabled:colors.W011,
                pressed:colors.B042,
                highlighted: colors.W161,
                selected: colors.W011
            },
            source: {
                normal: images.img_00_circle_bg,
                disabled: images.img_00_circle_bg,
                pressed: images.img_00_circle_bg,
                higlighted: images.img_00_circle_button_focus,
                selected: images.img_00_circle_bg
            },
            effectSource: {
                normal: images.img_00_circle_bg_ef,
                disabled:images.img_00_circle_bg_ef_dim,
                pressed: images.img_00_circle_bg_ef_press
            },
            iconSource: {
                normal: images.img_00_button_right
            },
            iconEffectSource: {
                normal:images.img_00_button_right_ef,
                pressed:images.img_00_button_right_ef
            },
            iconColor: {
                normal: colors.F032L1,
                disabled: colors.F032L1D,
                pressed: colors.F032L1P,
                highlighted: colors.F032L1,
                selected: colors.F032L1
            }
        }
    }
    return ret
}

function createTabBar(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        color: colors.W0813,
        source: images.img_00_category_panel_bg_9,
        effectSource: images.img_00_category_panel_bg_ef_9,

        arrow: {
            color: colors.F031L3,
            sourceLeft: images.img_00_arrow_left,
            sourceRight: images.img_00_arrow_right,
            margin:8
        },
        tab: {
            color: {
                normal:colors.W0813,
                pressed:colors.W101,
                selected:colors.W101,
            },

            text: {
                color: {
                    normal:colors.F031L3,
                    pressed:colors.F031L3P,
                    selected:colors.F031L3P
                },
                margin:10
            },
            source: {
                normal: images.img_00_category_button_9,
                pressed: images.img_00_category_button_focus_9,
                selected: images.img_00_category_button_9
            },
            font: {
                pixelSize: 40,
            },
            minWidth: 140,
            maxWidth: 444,
            height:72,
            margin:12,
            sideMargin:54
        },
        height: 90
    }
    return ret
}

function createDetailButton(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        color: {
            normal: checkBox.details.color.normal,
            disabled: checkBox.details.color.disabled,
            pressed: checkBox.details.color.pressed
        },
        source: {
            normal: checkBox.details.source.normal
        },
        effectSource: {
            normal: checkBox.details.effectSource.normal,
            disabled: checkBox.details.effectSource.disabled,
            pressed: checkBox.details.effectSource.pressed
        },
        iconSource: {
            normal: checkBox.details.iconSource.normal
        },
        iconEffectSource: {
            normal: checkBox.details.iconEffectSource.normal,
            pressed: checkBox.details.iconEffectSource.pressed
        },
        iconColor: {
            normal: checkBox.details.iconColor.normal,
            disabled: checkBox.details.iconColor.disabled,
            pressed: checkBox.details.iconColor.pressed
            //highlighted: colors.F032L1P,
        }
    }
    return ret
}

function createContextMenu(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        color: colors.B061L4,
        listItemDividerColor1: colors.B0622L1,
        listItemDividerColor2: colors.B0622L2,
        item: {
            color: {
                normal: colors.B061L4,
                pressed: colors.B044,
                highlighted: colors.B044,
            },
            text: {
                color: {
                    normal: colors.B063L5,
                    pressed: colors.B063L5,
                    highlighted: colors.B063L5,
                },
                font: {
                    pixelSize:40
                }
            },
            source: {
                pressed: images.img_00_more_popup_press_9
            },
            height: 112,
            iconWidth: 45,
            iconHeight: 45,
            spacing: 16
        },
        gridItemDividerColor1: colors.B0623L1,
        gridItemDividerColor2: colors.B0623L2,

        source: images.img_00_popup_bubble_bg_9,
        effectSource: images.img_00_popup_bubble_bg_ef_9,

        arrow: {
            source: {
                left: images.img_00_popup_bubble_tail_left,
                right: images.img_00_popup_bubble_tail_right,
                top: images.img_00_popup_bubble_tail_top,
                bottom: images.img_00_popup_bubble_tail_bottom
            },
            effectSource: {
                left: images.img_00_popup_bubble_tail_left_ef,
                right: images.img_00_popup_bubble_tail_right_ef,
                top: images.img_00_popup_bubble_tail_top_ef,
                bottom: images.img_00_popup_bubble_tail_bottom_ef
            },
            width: 36,
            height: 36,
            anchors: {
                topMargin: 18,
                leftMargin: 12,
                rightMargin:12,
                bottomMargin:10
            }
        },
        minimumWidth: 386,
        maximumWidth: 620,
        listTopMargin: 8,
        listBottomMargin: 16,
        listLeftMargin: 10,
        listRightMargin: 10,
        screen: {
            topMargin: 24,
            bottomMargin: 24,
            leftMargin: 24,
            rightMargin: 24
        }
    }
    return ret
}

function createSplitView(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        color: {
            normal: colors.W131,
            pressed: colors.W132
        },
        width: 13,
        pressedWidth: 13,
        source: images.img_00_split_handler_bg_9,
        vertical: {
            source:images.img_00_split_handler_v,
            effectSource: images.img_00_split_handler_bg_ef_v_9
        },
        horizontal: {
            source:images.img_00_split_handler_h,
            effectSource: images.img_00_split_handler_bg_ef_h_9
        }
    }
    return ret
}

function createScroll(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        fastScrollHandler: {
            horizontal: {
                source: images.img_00_fast_scroll_handler_h_9
            },
            vertical: {
                source: images.img_00_fast_scroll_handler_9
            }
        },
        handler: {
            color: colors.B071,
            horizontal: {
                source: images.img_00_scroll_bar_h_9,
                effectSource: images.img_00_scroll_bar_h_ef_9,
                minimumWidth:27,
                minimumHeight: 18,
                margin: 6
            },
            vertical: {
                source: images.img_00_scroll_bar_v_9,
                effectSource: images.img_00_scroll_bar_v_ef_9,
                minimumWidth:18,
                minimumHeight: 27,
                margin: 6
            }
        },

        overscrolling: {
            top: {
                source: images.img_00_overscrolling_top_9,
                height: 36
            },
            bottom: {
                source: images.img_00_overscrolling_bottom_9,
                height: 36
            },
            left: {
                source: images.img_00_overscrolling_left_9,
                width: 36
            },
            right: {
                source: images.img_00_overscrolling_right_9,
                width: 36
            }
        }
    }
    return ret
}

function createPopup(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        color: colors.B061L1,
        source: images.img_00_popup_bg_9,
        effectSource: images.img_00_popup_bg_ef_9,
        text: {
            color: colors.B063L9
        },
        margins: {
            top: 14+3,
            bottom: 34+3,
            left: 16+3,
            right: 16+3
        }
    }
    return ret
}

function createTitleBar(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        backgroundColor: colors.background,
        text: {
            color: colors.B042,
            font: {
                pixelSize: 36
            }
        },
        subText: {
            color: colors.B042,
            font: {
                pixelSize: 24
            }
        }
    }
    return ret
}

function createBusyIndicator(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        source: images.img_00_list_process_01,
        duration: 1500
    }
    return ret
}

function createDateEdit(th) {
    var colors
    var images
    if (th === "white") {
        colors = whiteColors
        images = whiteImages
    } else {
        colors = blackColors
        images = blackImages
    }
    var ret = {
        bar: {
            color: colors.W0811,
            text: {
                color: {
                    normal: colors.W084,
                    pressed: colors.W084P
                }
            },
            day: {fontSize:48},
            month: {fontSize:38},
            year: {fontSize:42}
        },
        source: images.img_00_time_picker_number_bg_9,
        height: 102,
        content: {
            color: {
                normal: colors.W011,
                pressed: colors.B042,
                disabled: colors.W011,
                highlighted: colors.W161
            },
            source: {
                normal: images.img_00_picker_button_9,
                pressed: images.img_00_picker_button_9,
                disabled: images.img_00_picker_button_9,
                highlighted: images.img_00_picker_button_focus_9
            },
            effectSource: {
                normal: images.img_00_picker_button_ef_9,
                disabled: images.img_00_picker_button_dim_ef_9,
                pressed: images.img_00_picker_button_press_ef_9
            },
            text: {
                color: {
                    normal: colors.F011L1,
                    pressed: colors.F011L1P,
                    disabled: colors.F011L1D
                }
            },
            width: 345,
            height: 112,
            margin: 17,
            date: {
                height: 48,
                fontSize: 34,
            },
            year: {
                width: 104
            },
            month: {
                width: 104
            },
            day: {
                width: 69
            }
        },

        tail: {
            source: images.img_00_time_picker_tail
        }
    }
    return ret
}

var panel = createPanel(theme)
var progress = createProgress(theme)
var slider = createSlider(theme)
var button = createButton(theme)
var toolBar = createToolBar(theme)
var checkBox = createCheckBox(theme)
var tabBar = createTabBar(theme)
var detailButton = createDetailButton(theme)
var contextMenu = createContextMenu(theme)
var splitView = createSplitView(theme)
var scroll = createScroll(theme)
var popup = createPopup(theme)
var titleBar = createTitleBar(theme)
var busyIndicator = createBusyIndicator(theme)
var dateEdit = createDateEdit(theme)

function setTheme(th) {
    if (theme === th)
        return
    theme = th

    panel = createPanel(theme)
    progress = createProgress(theme)
    slider = createSlider(theme)
    button = createButton(theme)
    toolBar = createToolBar(theme)
    checkBox = createCheckBox(theme)
    tabBar = createTabBar(theme)
    detailButton = createDetailButton(theme)
    contextMenu = createContextMenu(theme)
    splitView = createSplitView(theme)
    scroll = createScroll(theme)
    popup = createPopup(theme)
    titleBar = createTitleBar(theme)
    busyIndicator = createBusyIndicator(theme)
    dateEdit = createDateEdit(theme)
}

