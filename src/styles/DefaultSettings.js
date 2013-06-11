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

var theme="white/"
var resolution="720x1280/"

var imagesPath="images/"+resolution

var colors = {
    foreground:"#FF000000",
    background:"#FFF8F6EF",
    B011:"#FFF8F6EF",
    B012:"#FFF8F6EF",
    B013:"#FF000000",
    B014:"#FFFFFFFF",
    B015:"#FFF8F6EF",
    B016:"#FF000000",
    B017:"#FFFFFFFF",
    B0211:"#FFF8F6EF",
    B0211D:"#FFDBD9D4",
    B0212:"#FFF8F6EF",
    B0213:"#FF5B5656",
    B0214:"#FFDCDAD3",
    B0215:"#00000000",
    B0216:"#FFDCDAD3",
    B0217:"#FFEFEDE5",
    B0217D:"#00000000",
    B0221:"#FFB2B1AE",
    B0222:"#FFFFFFFF",
    B0223:"#FFD3D1CB",
    B0224:"#FFB9B8B2",
    B0225:"#FF2A5181",
    B0226:"#FF4B73A3",
    B0227:"#FF000000",
    B0228:"#7FCFCFCF",
    B0232:"#00000000",
    B0233:"#FF1A5274",
    B031:"#00000000",
    B041:"#FF5787C2",
    B041P:"#FFFFFFFF",
    B042:"#FF3B73B6",
    B043:"#FF5787C2",
    B044:"#FF2A89C2",
    B0511:"#FFF8F6EF",
    B0512:"#00000000",
    B0513:"#FFF8F6EF",
    B0514:"#00000000",
    B0514P1:"#FFA9A597",
    B0514P2:"#00000000",
    B0515L1:"#FFF8F6EF",
    B0515L2:"#7F454442",
    B0516:"#00000000",
    B0517:"#00000000",
    B0517P1:"#00000000",
    B0517P2:"#00000000",
    B0518:"#003567A3",
    B0518P:"#00000000",
    B0519:"#FFFFFFFF",
    B0520:"#FF3567A3",
    B0520P:"#FF2A89C2",
    B052L1:"#FF737373",
    B052L1P:"#FF4093F7",
    B052L1D:"#4C737373",
    B052L2:"#FF525252",
    B052L2P:"#005787B8",
    B052L3:"#00000000",
    B052L3P:"#00000000",
    B052L4:"#FF3A3A3A",
    B052L4P:"#FFFFFFFF",
    B052L4D:"#4C3A3A3A",
    B052L5:"#FF3B73B6",
    B052L6:"#FF999999",
    B052L6P:"#FF3B73B6",
    B052L7:"#FF0A64D0",
    B052L8:"#FFFFFFFF",
    B052L8P:"#FF4093F7",
    B052L8D:"#4CFFFFFF",
    B052L9:"#FFE4E4E4",
    B052L9P:"#FFFFFFFF",
    B052L9D:"#4CE4E4E4",
    B052L10:"#FFBABABA",
    B0531:"#FFF8F6EF",
    B0532:"#00000000",
    B0533:"#00000000",
    B0534:"#00000000",
    B0535:"#00000000",
    B0536:"#00000000",
    B0537:"#00000000",
    B0541:"#00000000",
    B0542:"#00000000",
    B0542P:"#00000000",
    B0543:"#00000000",
    B0544:"#00000000",
    B0545:"#00000000",
    B0551:"#00000000",
    B0552:"#00000000",
    B0553:"#FFA5A5A5",
    B0554:"#FFFFFFFF",
    B0555:"#00000000",
    B0556:"#00000000",
    B0557:"#00000000",
    B0558:"#00000000",
    B061L1:"#FFF8F6EF",
    B061L2:"#00000000",
    B061L3:"#00000000",
    B061L4:"#FF444444",
    B061L5:"#FF343432",
    B061L6:"#FF333537",
    B0621L1:"#00000000",
    B0621L2:"#00000000",
    B0622L1:"#FF2D2D2D",
    B0622L2:"#FF5B5B5B",
    B0623L1:"#FF2D2D2D",
    B0623L2:"#FF5B5B5B",
    B0624L1:"#00000000",
    B0624L2:"#00000000",
    B0624L3:"#FFFDFCF9",
    B063L1:"#FF000000",
    B063L1P:"#00000000",
    B063L1D:"#4C000000",
    B063L2:"#FFFFFFFF",
    B063L3:"#FF808080",
    B063L4:"#FFFFFFFF",
    B063L5:"#FFFFFFFF",
    B063L5D:"#4CFFFFFF",
    B063L6:"#FF454545",
    B063L6P:"#FFFFFFFF",
    B063L6D:"#4C454545",
    B063L7:"#FF656565",
    B063L8:"#FF808080",
    B063L8P:"#00000000",
    B063L8D:"#4C808080",
    B063L9:"#FF3B73B6",
    B064L1:"#00000000",
    B064L1P:"#00000000",
    B064L2:"#FF808080",
    B064L2P:"#00000000",
    B064L2D:"#4C808080",
    B065L1:"#00000000",
    B065L2:"#00000000",
    B065L3:"#00000000",
    B065L3P:"#00000000",
    B065L4:"#00000000",
    B065L4P:"#00000000",
    B065L5:"#00000000",
    B071:"#FFC6C4BE",
    B0721:"#FFA09F9A",
    B0722:"#FF3B73B6",
    B0723:"#FFEBE9E1",
    B0724:"#FFD9D5CA",
    B0725:"#FF3B73B6",
    B0731:"#FF3B73B6",
    B0732:"#FFFFFFFF",
    B0741:"#FFA09F9A",
    B0742:"#FF3B73B6",
    B0743:"#FFE6E3D8",
    B0744:"#FFC5C2B7",
    B0745:"#00000000",
    B0751:"#FF3B73B6",
    F011L1:"#FF000000",
    F011L1P:"#FFFFFFFF",
    F011L1D:"#4C000000",
    F011L2:"#FF3B73B6",
    F011L2D:"#4C3B73B6",
    F011L3:"#FF808080",
    F011L3D:"#CC808080",
    F011L4:"#FF808080",
    F011L4D:"#CC808080",
    F011L5:"#FF3B73B6",
    F011L6:"#00000000",
    F011L7:"#FF808080",
    F011L7D:"#CC808080",
    F011L8:"#FFC24747",
    F011L9:"#FFFFFFFF",
    F011L10:"#FFFFFFFF",
    F011L11:"#FF808080",
    F011L12:"#FF4093F7",
    F011L13:"#00000000",
    F011L14:"#00000000",
    F011L15:"#FFE94949",
    F011L16:"#FF8B8B8B",
    F011L17:"#FF8B8B8B",
    F011L18:"#FF686868",
    F011L19:"#FF8B8B8B",
    F011L20:"#00000000",
    F011L21:"#FF808080",
    F011L22:"#FF9A9A9A",
    F011L23:"#FF1382FF",
    F021L1i:"#FF808080",
    F021L1iP:"#FFFFFFFF",
    F021L1iD:"#CC808080",
    F022L1i:"#FFB8B8B8",
    F022L2i:"#FF4C85C9",
    F022L2iD:"#4C4C85C9",
    F031L1:"#FF3A3A3A",
    F031L1P:"#FFFFFFFF",
    F031L1D:"#4C3A3A3A",
    F031L2:"#00000000",
    F031L2P:"#00000000",
    F031L2D:"#00000000",
    F031L3:"#FFFFFFFF",
    F031L3P:"#FFFFFFFF",
    F031L3D:"#4CFFFFFF",
    F032L1:"#FF808080",
    F032L1P:"#FFFFFFFF",
    F032L1D:"#4C808080",
    F032L2:"#FFFFFFFF",
    F032L2P:"#FFFFFFFF",
    F032L2D:"#4CFFFFFF",
    F032L3:"#FFF9F9F9",
    F032L3P:"#FFF9F9F9",
    F041i:"#FF808080",
    F041iD:"#4C808080",
    F051:"#FF90A9C7",
    F052:"#FF000000",
    F053:"#FFB1B1B1",
    F053P:"#FFFFFFFF",
    F053D:"#4CB1B1B1",
    W011:"#FFF8F6EF",
    W012:"#00000000",
    W013:"#00000000",
    W0141:"#FFD05252",
    W0141P:"#FF9E2C2C",
    W0141D:"#4CD05252",
    W015:"#FF404040",
    W021L1:"#FFF8F6EF",
    W021L1P:"#FF84A2C6",
    W021L2:"#FF3B73B6",
    W021L2P:"#FFFFFFFF",
    W021L3:"#FF3B73B6",
    W021L3P:"#FFFFFFFF",
    W031:"#FFFFFFFF",
    W031D:"#4CFFFFFF",
    W032:"#FF878580",
    W032P:"#FF000000",
    W032D:"#4C878580",
    W041:"#FFE1DDD1",
    W051:"#FF000000",
    W0611:"#FF3B73B6",
    W0611P:"#FFFFFFFF",
    W0611D:"#FF808080",
    W062L1:"#FFF0EDE9",
    W062L1D:"#4CF0EDE9",
    W062L2:"#FF5A95DC",
    W062L2D:"#4C5A95DC",
    W062L3:"#FFD8D7D2",
    W062L3D:"#4CD8D7D2",
    W062L4:"#FF3677C3",
    W062L4D:"#4C3677C3",
    W0631:"#FF656565",
    W0632:"#FFFFFFFF",
    W0641:"#FFE0DAD1",
    W0641P:"#FF5288C9",
    W0641D:"#FFBFBFBF",
    W0651:"#FFE8E6DF",
    W0711:"#FF769DCC",
    W0712:"#FF4267A9",
    W0713:"#FF4093F7",
    W0714:"#FF263E5F",
    W0715:"#FF2889FF",
    W0721:"#00000000",
    W0811:"#FF5787C2",
    W0812:"#00000000",
    W0813:"#FF494949",
    W082:"#00000000",
    W083:"#00000000",
    W084:"#B2FFFFFF",
    W084P:"#FFFFFFFF",
    W085:"#00000000",
    W091:"#FF444444",
    W092:"#FFFFFFFF",
    W101:"#FF5893E4",
    W111:"#FFE7E5DE",
    W1121:"#FF000000",
    W1122:"#FFFFFFFF",
    W1123:"#4C000000",
    W112L1:"#FFB4B4B4",
    W112L2:"#FFFFFFFF",
    W1211:"#00000000",
    W1212:"#00000000",
    W1221:"#00000000",
    W1222:"#00000000",
    W1223:"#00000000",
    W131:"#FF959595",
    W132:"#FF5787C2",
    W141:"#FF808080",
    W151:"#FF95948F",
    W152:"#FF878787",
    W153:"#FF5787C2",
    W154:"#FFEFECE0",
    W161:"#FF5787C2"
}


var images = {
    img_00_arrow_left: imagesPath + theme + "00_arrow_left.png",
    img_00_arrow_right: imagesPath + theme + "00_arrow_right.png",
    img_00_badge_bg_9: imagesPath + "00_badge_bg.9.sci",
    img_00_badge_bg_ef_9: imagesPath + theme + "00_badge_bg_ef.9.sci",
    img_00_button_01_9: imagesPath + "00_button_01.9.sci",
    img_00_button_01_ef_9: imagesPath + theme + "00_button_01_ef.9.sci",
    img_00_button_01_ef_dim_9: imagesPath + theme + "00_button_01_ef_dim.9.sci",
    img_00_button_01_ef_press_9: imagesPath + theme + "00_button_01_ef_press.9.sci",
    img_00_button_01_focus_9: imagesPath + "00_button_01_focus.9.sci",
    img_00_button_02_9: imagesPath + "00_button_02.9.sci",
    img_00_button_02_ef_9: imagesPath + "00_button_02_ef.9.sci",
    img_00_button_02_ef_press_9: imagesPath + "00_button_02_ef_press.9.sci",
    img_00_button_03_9: imagesPath + "00_button_03.9.sci",
    img_00_button_expand_closed: imagesPath + "00_button_expand_closed.png",
    img_00_button_expand_closed_ef: imagesPath + theme + "00_button_expand_closed_ef.png",
    img_00_button_expand_opened: imagesPath + "00_button_expand_opened.png",
    img_00_button_expand_opened_ef: imagesPath + theme + "00_button_expand_opened_ef.png",
    img_00_button_left: imagesPath + "00_button_left.png",
    img_00_button_left_ef: imagesPath + theme + "00_button_left_ef.png",
    img_00_button_off: imagesPath + theme + "00_button_off.png",
    img_00_button_off_dim: imagesPath + theme + "00_button_off_dim.png",
    img_00_button_on: imagesPath + theme + "00_button_on.png",
    img_00_button_on_dim: imagesPath + theme + "00_button_on_dim.png",
    img_00_button_on_off_handler: imagesPath + theme + "00_button_on_off_handler.png",
    img_00_button_on_off_handler_dim: imagesPath + theme + "00_button_on_off_handler_dim.png",
    img_00_button_on_off_handler_focus: imagesPath + theme + "00_button_on_off_handler_focus.png",
    img_00_button_plus: imagesPath + "00_button_plus.png",
    img_00_button_plus_ef: imagesPath + "00_button_plus_ef.png",
    img_00_button_radio: imagesPath + "00_button_radio.png",
    img_00_button_radio_Activated: imagesPath + theme + "00_button_radio_Activated.png",
    img_00_button_radio_Activated_dim: imagesPath + theme + "00_button_radio_Activated_dim.png",
    img_00_button_radio_bg: imagesPath + theme + "00_button_radio_bg.png",
    img_00_button_radio_bg_dim: imagesPath + theme + "00_button_radio_bg_dim.png",
    img_00_button_radio_dim: imagesPath + "00_button_radio_dim.png",
    img_00_button_radio_dim_bg: imagesPath + "00_button_radio_dim_bg.png",
    img_00_button_radio_Disabled: imagesPath + "00_button_radio_Disabled.png",
    img_00_button_radio_focus: imagesPath + theme + "00_button_radio_focus.png",
    img_00_button_radio_normal1: imagesPath + theme + "00_button_radio_normal1.png",
    img_00_button_radio_normal2: imagesPath + theme + "00_button_radio_normal2.png",
    img_00_button_radio_press: imagesPath + theme + "00_button_radio_press.png",
    img_00_button_radio_press1: imagesPath + "00_button_radio_press1.png",
    img_00_button_radio_press2: imagesPath + "00_button_radio_press2.png",
    img_00_button_radio_press_bg: imagesPath + theme + "00_button_radio_press_bg.png",
    img_00_button_radio_select: imagesPath + "00_button_radio_select.png",
    img_00_button_radio_select_dim: imagesPath + "00_button_radio_select_dim.png",
    img_00_button_reveal: imagesPath + "00_button_reveal.png",
    img_00_button_right: imagesPath + "00_button_right.png",
    img_00_button_right_ef: imagesPath + theme + "00_button_right_ef.png",
    img_00_category_button_9: imagesPath + theme + "00_category_button.9.sci",
    img_00_category_button_focus_9: imagesPath + theme + "00_category_button_focus.9.sci",
    img_00_category_left_gradation: imagesPath + theme + "00_category_left_gradation.png",
    img_00_category_panel_bg_9: imagesPath + theme + "00_category_panel_bg.9.sci",
    img_00_category_panel_bg_ef_9: imagesPath + theme + "00_category_panel_bg_ef.9.sci",
    img_00_category_right_gradation: imagesPath + theme + "00_category_right_gradation.png",
    img_00_check_Activated: imagesPath + theme + "00_check_Activated.png",
    img_00_check_Activated_dim: imagesPath + theme + "00_check_Activated_dim.png",
    img_00_check_bg: imagesPath + theme + "00_check_bg.png",
    img_00_check_bg_dim: imagesPath + "00_check_bg_dim.png",
    img_00_check_bg_press: imagesPath + "00_check_bg_press.png",
    img_00_check_checking: imagesPath + "00_check_checking.png",
    img_00_check_checking_dim: imagesPath + "00_check_checking_dim.png",
    img_00_check_dim: imagesPath + theme + "00_check_dim.png",
    img_00_check_dim_bg: imagesPath + theme + "00_check_dim_bg.png",
    img_00_check_Disabled: imagesPath + "00_check_Disabled.png",
    img_00_check_focus: imagesPath + theme + "00_check_focus.png",
    img_00_check_press: imagesPath + theme + "00_check_press.png",
    img_00_check_press_bg: imagesPath + theme + "00_check_press_bg.png",
    img_00_circle_bg: imagesPath + theme + "00_circle_bg.png",
    img_00_circle_bg_ef: imagesPath + theme + "00_circle_bg_ef.png",
    img_00_circle_bg_ef_dim: imagesPath + theme + "00_circle_bg_ef_dim.png",
    img_00_circle_bg_ef_press: imagesPath + theme + "00_circle_bg_ef_press.png",
    img_00_circle_button_focus: imagesPath + theme + "00_circle_button_focus.png",
    img_00_color_picker_brightness: imagesPath + "00_color_picker_brightness.png",
    img_00_color_picker_brightness_h: imagesPath + "00_color_picker_brightness_h.png",
    img_00_color_picker_color: imagesPath + "00_color_picker_color.png",
    img_00_color_picker_color_h: imagesPath + "00_color_picker_color_h.png",
    img_00_color_picker_custom_color: imagesPath + "00_color_picker_custom_color.png",
    img_00_color_picker_custom_color_h: imagesPath + "00_color_picker_custom_color_h.png",
    img_00_color_picker_handler: imagesPath + "00_color_picker_handler.png",
    img_00_color_picker_handler_focus: imagesPath + "00_color_picker_handler_focus.png",
    img_00_color_picker_saturation: imagesPath + "00_color_picker_saturation.png",
    img_00_color_picker_saturation_h: imagesPath + "00_color_picker_saturation_h.png",
    img_00_contacts_button_bg_9: imagesPath + "00_contacts_button_bg.9.sci",
    img_00_contacts_button_bg_ef_9: imagesPath + theme + "00_contacts_button_bg_ef.9.sci",
    img_00_contacts_button_bg_press_ef_9: imagesPath + theme + "00_contacts_button_bg_press_ef.9.sci",
    img_00_date_picker_dot: imagesPath + "00_date_picker_dot.png",
    img_00_edit_field_clear: imagesPath + "00_edit_field_clear.png",
    img_00_edit_field_line_round_bg_01_9: imagesPath + "00_edit_field_line_round_bg_01.9.sci",
    img_00_edit_field_no_line_square_bg_9: imagesPath + "00_edit_field_no_line_square_bg.9.sci",
    img_00_edit_field_round_bg_9: imagesPath + "00_edit_field_round_bg.9.sci",
    img_00_effect_tab_bounce_left: imagesPath + theme + "00_effect_tab_bounce_left.png",
    img_00_effect_tab_bounce_left_h: imagesPath + "00_effect_tab_bounce_left_h.png",
    img_00_effect_tab_bounce_right: imagesPath + theme + "00_effect_tab_bounce_right.png",
    img_00_effect_tab_bounce_right_h: imagesPath + "00_effect_tab_bounce_right_h.png",
    img_00_effect_title_tab_bounce_left: imagesPath + "00_effect_title_tab_bounce_left.png",
    img_00_effect_title_tab_bounce_right: imagesPath + "00_effect_title_tab_bounce_right.png",
    img_00_effect_toolbar_tab_bounce_left: imagesPath + "00_effect_toolbar_tab_bounce_left.png",
    img_00_effect_toolbar_tab_bounce_left_h: imagesPath + "00_effect_toolbar_tab_bounce_left_h.png",
    img_00_effect_toolbar_tab_bounce_right: imagesPath + "00_effect_toolbar_tab_bounce_right.png",
    img_00_effect_toolbar_tab_bounce_right_h: imagesPath + "00_effect_toolbar_tab_bounce_right_h.png",
    img_00_fast_scroll_handler_9: imagesPath + "00_fast_scroll_handler.9.sci",
    img_00_fast_scroll_handler_h_9: imagesPath + "00_fast_scroll_handler_h.9.sci",
    img_00_fast_scroll_popup_bg_9: imagesPath + "00_fast_scroll_popup_bg.9.sci",
    img_00_fast_scroll_popup_bg_ef_9: imagesPath + "00_fast_scroll_popup_bg_ef.9.sci",
    img_00_fast_scroll_rollover_bg_9: imagesPath + "00_fast_scroll_rollover_bg.9.sci",
    img_00_fast_scroll_rollover_bg_focus_9: imagesPath + "00_fast_scroll_rollover_bg_focus.9.sci",
    img_00_fast_scroll_rollover_bg_line_focus_9: imagesPath + theme + "00_fast_scroll_rollover_bg_line_focus.9.sci",
    img_00_focus_9: imagesPath + theme + "00_focus.9.sci",
    img_00_grid_select_check: imagesPath + "00_grid_select_check.png",
    img_00_grid_select_check_bg: imagesPath + "00_grid_select_check_bg.png",
    img_00_grid_select_check_bg_press: imagesPath + "00_grid_select_check_bg_press.png",
    img_00_groupedlist_bg_focus_9: imagesPath + "00_groupedlist_bg_focus.9.sci",
    img_00_groupedlist_bg_press_9: imagesPath + "00_groupedlist_bg_press.9.sci",
    img_00_groupedlist_bottom_bg_focus_9: imagesPath + "00_groupedlist_bottom_bg_focus.9.sci",
    img_00_groupedlist_bottom_bg_press_9: imagesPath + "00_groupedlist_bottom_bg_press.9.sci",
    img_00_groupedlist_center_bg_focus_9: imagesPath + "00_groupedlist_center_bg_focus.9.sci",
    img_00_groupedlist_center_bg_press_9: imagesPath + "00_groupedlist_center_bg_press.9.sci",
    img_00_groupedlist_top_bg_focus_9: imagesPath + "00_groupedlist_top_bg_focus.9.sci",
    img_00_groupedlist_top_bg_press_9: imagesPath + "00_groupedlist_top_bg_press.9.sci",
    img_00_header_process_01: imagesPath + theme + "00_header_process_01.png",
    img_00_header_process_02: imagesPath + theme + "00_header_process_02.png",
    img_00_header_process_03: imagesPath + theme + "00_header_process_03.png",
    img_00_header_process_04: imagesPath + theme + "00_header_process_04.png",
    img_00_header_process_05: imagesPath + theme + "00_header_process_05.png",
    img_00_header_process_06: imagesPath + theme + "00_header_process_06.png",
    img_00_header_process_07: imagesPath + theme + "00_header_process_07.png",
    img_00_header_process_08: imagesPath + theme + "00_header_process_08.png",
    img_00_header_process__9: imagesPath + theme + "00_header_process_09.png",
    img_00_header_process_10: imagesPath + theme + "00_header_process_10.png",
    img_00_header_process_11: imagesPath + theme + "00_header_process_11.png",
    img_00_header_process_12: imagesPath + theme + "00_header_process_12.png",
    img_00_header_process_13: imagesPath + theme + "00_header_process_13.png",
    img_00_header_process_14: imagesPath + theme + "00_header_process_14.png",
    img_00_header_process_15: imagesPath + theme + "00_header_process_15.png",
    img_00_header_process_16: imagesPath + theme + "00_header_process_16.png",
    img_00_header_process_17: imagesPath + theme + "00_header_process_17.png",
    img_00_header_process_18: imagesPath + theme + "00_header_process_18.png",
    img_00_header_process__9: imagesPath + theme + "00_header_process_19.png",
    img_00_header_process_20: imagesPath + theme + "00_header_process_20.png",
    img_00_header_process_21: imagesPath + theme + "00_header_process_21.png",
    img_00_header_process_22: imagesPath + theme + "00_header_process_22.png",
    img_00_header_process_23: imagesPath + theme + "00_header_process_23.png",
    img_00_header_process_24: imagesPath + theme + "00_header_process_24.png",
    img_00_header_process_25: imagesPath + theme + "00_header_process_25.png",
    img_00_header_process_26: imagesPath + theme + "00_header_process_26.png",
    img_00_header_process_27: imagesPath + theme + "00_header_process_27.png",
    img_00_header_process_28: imagesPath + theme + "00_header_process_28.png",
    img_00_header_process__9: imagesPath + theme + "00_header_process_29.png",
    img_00_header_process_30: imagesPath + theme + "00_header_process_30.png",
    img_00_icon_Back: imagesPath + "00_icon_Back.png",
    img_00_icon_Back_ef: imagesPath + theme + "00_icon_Back_ef.png",
    img_00_icon_Back_ef_02: imagesPath + theme + "00_icon_Back_ef_02.png",
    img_00_icon_Back_trans_ef: imagesPath + theme + "00_icon_Back_trans_ef.png",
    img_00_icon_jump: imagesPath + "00_icon_jump.png",
    img_00_icon_jump_ef: imagesPath + theme + "00_icon_jump_ef.png",
    img_00_icon_jump_left: imagesPath + "00_icon_jump_left.png",
    img_00_icon_jump_left_ef: imagesPath + theme + "00_icon_jump_left_ef.png",
    img_00_icon_more: imagesPath + "00_icon_more.png",
    img_00_icon_more_ef: imagesPath + theme + "00_icon_more_ef.png",
    img_00_icon_SIP_close: imagesPath + "00_icon_SIP_close.png",
    img_00_icon_SIP_close_ef: imagesPath + theme + "00_icon_SIP_close_ef.png",
    img_00_indexlist_bg_9: imagesPath + "00_indexlist_bg.9.sci",
    img_00_indexlist_bg_ef_9: imagesPath + theme + "00_indexlist_bg_ef.9.sci",
    img_00_list_group_bg_9: imagesPath + "00_list_group_bg.9.sci",
    img_00_list_group_bg_bottom_9: imagesPath + "00_list_group_bg_bottom.9.sci",
    img_00_list_group_bg_bottom_ef_9: imagesPath + theme + "00_list_group_bg_bottom_ef.9.sci",
    img_00_list_group_bg_bottom_focus_9: imagesPath + "00_list_group_bg_bottom_focus.9.sci",
    img_00_list_group_bg_center_9: imagesPath + "00_list_group_bg_center.9.sci",
    img_00_list_group_bg_center_ef_9: imagesPath + theme + "00_list_group_bg_center_ef.9.sci",
    img_00_list_group_bg_center_focus_9: imagesPath + "00_list_group_bg_center_focus.9.sci",
    img_00_list_group_bg_ef_9: imagesPath + theme + "00_list_group_bg_ef.9.sci",
    img_00_list_group_bg_focus_9: imagesPath + "00_list_group_bg_focus.9.sci",
    img_00_list_group_bg_top_9: imagesPath + "00_list_group_bg_top.9.sci",
    img_00_list_group_bg_top_ef_9: imagesPath + theme + "00_list_group_bg_top_ef.9.sci",
    img_00_list_group_bg_top_focus_9: imagesPath + "00_list_group_bg_top_focus.9.sci",
    img_00_list_group_bottom_cover_round_bg_normal_9: imagesPath + "00_list_group_bottom_cover_round_bg_normal.9.sci",
    img_00_list_group_center_cover_round_bg_normal_9: imagesPath + "00_list_group_center_cover_round_bg_normal.9.sci",
    img_00_list_group_press_bg_9: imagesPath + "00_list_group_press_bg.9.sci",
    img_00_list_group_press_bg_bottom_9: imagesPath + "00_list_group_press_bg_bottom.9.sci",
    img_00_list_group_press_bg_center_9: imagesPath + "00_list_group_press_bg_center.9.sci",
    img_00_list_group_press_bg_top_9: imagesPath + "00_list_group_press_bg_top.9.sci",
    img_00_list_group_single_cover_round_bg_normal_9: imagesPath + "00_list_group_single_cover_round_bg_normal.9.sci",
    img_00_list_group_top_cover_round_bg_normal_9: imagesPath + "00_list_group_top_cover_round_bg_normal.9.sci",
    img_00_list_process_01: imagesPath + theme + "00_list_process_01.png",
    img_00_list_process_02: imagesPath + theme + "00_list_process_02.png",
    img_00_list_process_03: imagesPath + theme + "00_list_process_03.png",
    img_00_list_process_04: imagesPath + theme + "00_list_process_04.png",
    img_00_list_process_05: imagesPath + theme + "00_list_process_05.png",
    img_00_list_process_06: imagesPath + theme + "00_list_process_06.png",
    img_00_list_process_07: imagesPath + theme + "00_list_process_07.png",
    img_00_list_process_08: imagesPath + theme + "00_list_process_08.png",
    img_00_list_process__9: imagesPath + theme + "00_list_process_09.png",
    img_00_list_process_10: imagesPath + theme + "00_list_process_10.png",
    img_00_list_process_11: imagesPath + theme + "00_list_process_11.png",
    img_00_list_process_12: imagesPath + theme + "00_list_process_12.png",
    img_00_list_process_13: imagesPath + theme + "00_list_process_13.png",
    img_00_list_process_14: imagesPath + theme + "00_list_process_14.png",
    img_00_list_process_15: imagesPath + theme + "00_list_process_15.png",
    img_00_list_process_16: imagesPath + theme + "00_list_process_16.png",
    img_00_list_process_17: imagesPath + theme + "00_list_process_17.png",
    img_00_list_process_18: imagesPath + theme + "00_list_process_18.png",
    img_00_list_process__9: imagesPath + theme + "00_list_process_19.png",
    img_00_list_process_20: imagesPath + theme + "00_list_process_20.png",
    img_00_list_process_21: imagesPath + theme + "00_list_process_21.png",
    img_00_list_process_22: imagesPath + theme + "00_list_process_22.png",
    img_00_list_process_23: imagesPath + theme + "00_list_process_23.png",
    img_00_list_process_24: imagesPath + theme + "00_list_process_24.png",
    img_00_list_process_25: imagesPath + theme + "00_list_process_25.png",
    img_00_list_process_26: imagesPath + theme + "00_list_process_26.png",
    img_00_list_process_27: imagesPath + theme + "00_list_process_27.png",
    img_00_list_process_28: imagesPath + theme + "00_list_process_28.png",
    img_00_list_process__9: imagesPath + theme + "00_list_process_29.png",
    img_00_list_process_30: imagesPath + theme + "00_list_process_30.png",
    img_00_more_popup_press_9: imagesPath + theme + "00_more_popup_press.9.sci",
    img_00_option_panel_contextual_popup_arrow: imagesPath + "00_option_panel_contextual_popup_arrow.png",
    img_00_option_panel_handle_bg: imagesPath + "00_option_panel_handle_bg.png",
    img_00_option_panel_handle_bg_ef: imagesPath + theme + "00_option_panel_handle_bg_ef.png",
    img_00_option_panel_handle_bg_ef_press: imagesPath + theme + "00_option_panel_handle_bg_ef_press.png",
    img_00_option_panel_handle_bg_press: imagesPath + "00_option_panel_handle_bg_press.png",
    img_00_option_panel_handle_more: imagesPath + "00_option_panel_handle_more.png",
    img_00_option_panel_handle_more_press: imagesPath + "00_option_panel_handle_more_press.png",
    img_00_overscrolling_bottom_9: imagesPath + theme + "00_overscrolling_bottom.9.sci",
    img_00_overscrolling_left_9: imagesPath + theme + "00_overscrolling_left.9.sci",
    img_00_overscrolling_right_9: imagesPath + theme + "00_overscrolling_right.9.sci",
    img_00_overscrolling_top_9: imagesPath + theme + "00_overscrolling_top.9.sci",
    img_00_panel_bg_9: imagesPath + "00_panel_bg.9.sci",
    img_00_panel_handle_arrow: imagesPath + "00_panel_handle_arrow.png",
    img_00_panel_handle_bg_9: imagesPath + "00_panel_handle_bg.9.sci",
    img_00_panel_handle_bg_ef_9: imagesPath + theme + "00_panel_handle_bg_ef.9.sci",
    img_00_panel_handle_bg_ef_press_9: imagesPath + theme + "00_panel_handle_bg_ef_press.9.sci",
    img_00_panel_list_bg_ef_press_9: imagesPath + theme + "00_panel_list_bg_ef_press.9.sci",
    img_00_panel_list_bg_press_9: imagesPath + "00_panel_list_bg_press.9.sci",
    img_00_picker_button_9: imagesPath + "00_picker_button.9.sci",
    img_00_picker_button_dim_ef_9: imagesPath + theme + "00_picker_button_dim_ef.9.sci",
    img_00_picker_button_ef_9: imagesPath + theme + "00_picker_button_ef.9.sci",
    img_00_picker_button_focus_9: imagesPath + "00_picker_button_focus.9.sci",
    img_00_picker_button_press_ef_9: imagesPath + theme + "00_picker_button_press_ef.9.sci",
    img_00_popup_bg_9: imagesPath + theme + "00_popup_bg.9.sci",
    img_00_popup_bg_ef_9: imagesPath + theme + "00_popup_bg_ef.9.sci",
    img_00_popup_bubble_bg_9: imagesPath + theme + "00_popup_bubble_bg.9.sci",
    img_00_popup_bubble_bg_ef_9: imagesPath + theme + "00_popup_bubble_bg_ef.9.sci",
    img_00_popup_bubble_tail_bottom: imagesPath + theme + "00_popup_bubble_tail_bottom.png",
    img_00_popup_bubble_tail_bottom_ef: imagesPath + theme + "00_popup_bubble_tail_bottom_ef.png",
    img_00_popup_bubble_tail_left: imagesPath + theme + "00_popup_bubble_tail_left.png",
    img_00_popup_bubble_tail_left_ef: imagesPath + theme + "00_popup_bubble_tail_left_ef.png",
    img_00_popup_bubble_tail_right: imagesPath + theme + "00_popup_bubble_tail_right.png",
    img_00_popup_bubble_tail_right_ef: imagesPath + theme + "00_popup_bubble_tail_right_ef.png",
    img_00_popup_bubble_tail_top: imagesPath + theme + "00_popup_bubble_tail_top.png",
    img_00_popup_bubble_tail_top_ef: imagesPath + theme + "00_popup_bubble_tail_top_ef.png",
    img_00_popup_button_bg_ef_9: imagesPath + theme + "00_popup_button_bg_ef.9.sci",
    img_00_popup_dim_lighting: imagesPath + theme + "00_popup_dim_lighting.png",
    img_00_popup_dim_lighting_h: imagesPath + theme + "00_popup_dim_lighting_h.png",
    img_00_popup_title_bg_9: imagesPath + "00_popup_title_bg.9.png",
    img_00_popup_title_bg_ef_9: imagesPath + "00_popup_title_bg_ef.9.png",
    img_00_progress_bar_9: imagesPath + "00_progress_bar.9.sci",
    img_00_progress_bar_ef_9: imagesPath + theme + "00_progress_bar_ef.9.sci",
    img_00_progress_bg_9: imagesPath + "00_progress_bg.9.sci",
    img_00_progress_ef_bg_9: imagesPath + theme + "00_progress_ef_bg.9.sci",
    img_00_scroll_bar_h_9: imagesPath + "00_scroll_bar_h.9.sci",
    img_00_scroll_bar_handler_h: imagesPath + theme + "00_scroll_bar_handler_h.png",
    img_00_scroll_bar_handler_v: imagesPath + theme + "00_scroll_bar_handler_v.png",
    img_00_scroll_bar_h_ef_9: imagesPath + "00_scroll_bar_h_ef.9.sci",
    img_00_scroll_bar_v_9: imagesPath + "00_scroll_bar_v.9.sci",
    img_00_scroll_bar_v_ef_9: imagesPath + "00_scroll_bar_v_ef.9.sci",
    img_00_search_edit_field_bg_9: imagesPath + "00_search_edit_field_bg.9.sci",
    img_00_search_edit_field_bg_ef_9: imagesPath + theme + "00_search_edit_field_bg_ef.9.sci",
    img_00_search_icon: imagesPath + "00_search_icon.png",
    img_00_search_icon_ef: imagesPath + theme + "00_search_icon_ef.png",
    img_00_slider_bg_9: imagesPath + theme + "00_slider_bg.9.sci",
    img_00_slider_handle: imagesPath + "00_slider_handle.png",
    img_00_slider_handle_ef: imagesPath + theme + "00_slider_handle_ef.png",
    img_00_slider_handle_ef_dim: imagesPath + theme + "00_slider_handle_ef_dim.png",
    img_00_slider_handle_ef_press: imagesPath + theme + "00_slider_handle_ef_press.png",
    img_00_slider_handle_focus: imagesPath + "00_slider_handle_focus.png",
    img_00_slider_popup_bg_9: imagesPath + "00_slider_popup_bg.9.sci",
    img_00_slider_popup_bg_ef_9: imagesPath + theme + "00_slider_popup_bg_ef.9.sci",
    img_00_softkey_icon_add: imagesPath + "00_softkey_icon_add.png",
    img_00_softkey_icon_zoom: imagesPath + "00_softkey_icon_zoom.png",
    img_00_softkey_left_bg: imagesPath + "00_softkey_left_bg.png",
    img_00_softkey_left_bg_ef: imagesPath + theme + "00_softkey_left_bg_ef.png",
    img_00_softkey_left_bg_ef_press: imagesPath + theme + "00_softkey_left_bg_ef_press.png",
    img_00_softkey_left_text_bg: imagesPath + "00_softkey_left_text_bg.png",
    img_00_softkey_left_text_bg_ef: imagesPath + theme + "00_softkey_left_text_bg_ef.png",
    img_00_softkey_left_text_bg_ef_press: imagesPath + theme + "00_softkey_left_text_bg_ef_press.png",
    img_00_softkey_right_bg: imagesPath + "00_softkey_right_bg.png",
    img_00_softkey_right_bg_ef: imagesPath + theme + "00_softkey_right_bg_ef.png",
    img_00_softkey_right_bg_ef_press: imagesPath + theme + "00_softkey_right_bg_ef_press.png",
    img_00_softkey_right_text_bg: imagesPath + "00_softkey_right_text_bg.png",
    img_00_softkey_right_text_bg_ef: imagesPath + theme + "00_softkey_right_text_bg_ef.png",
    img_00_softkey_right_text_bg_ef_press: imagesPath + theme + "00_softkey_right_text_bg_ef_press.png",
    img_00_split_handler_bg_9: imagesPath + "00_split_handler_bg.9.sci",
    img_00_split_handler_bg_ef_h_9: imagesPath + theme + "00_split_handler_bg_ef_h.9.sci",
    img_00_split_handler_bg_ef_v_9: imagesPath + theme + "00_split_handler_bg_ef_v.9.sci",
    img_00_split_handler_h: imagesPath + theme + "00_split_handler_h.png",
    img_00_split_handler_v: imagesPath + theme + "00_split_handler_v.png",
    img_00_system_control_bg_9: imagesPath + "00_system_control_bg.9.sci",
    img_00_tab_bg_9: imagesPath + "00_tab_bg.9.sci",
    img_00_tab_bg_focus_ef_9: imagesPath + "00_tab_bg_focus_ef.9.png",
    img_00_tab_bg_line_ef_9: imagesPath + "00_tab_bg_line_ef.9.png",
    img_00_tab_focus_9: imagesPath + "00_tab_focus.9.sci",
    img_00_tab_press_ef_9: imagesPath + "00_tab_press_ef.9.sci",
    img_00_thumbs_bg_focus_9: imagesPath + "00_thumbs_bg_focus.9.sci",
    img_00_thumbs_line_bg_9: imagesPath + "00_thumbs_line_bg.9.sci",
    img_00_time_picker_keypad_bg_9: imagesPath + "00_time_picker_keypad_bg.9.sci",
    img_00_time_picker_keypad_button_bg_9: imagesPath + "00_time_picker_keypad_button_bg.9.sci",
    img_00_time_picker_keypad_button_bg_ef_9: imagesPath + "00_time_picker_keypad_button_bg_ef.9.sci",
    img_00_time_picker_number_bg_9: imagesPath + "00_time_picker_number_bg.9.sci",
    img_00_time_picker_tail: imagesPath + "00_time_picker_tail.png",
    img_00_time_picker_tail_01: imagesPath + "00_time_picker_tail_01.png",
    img_00_title_bg_9: imagesPath + "00_title_bg.9.sci",
    img_00_title_bg_ef_9: imagesPath + "00_title_bg_ef.9.png",
    img_00_toolbar_bg_9: imagesPath + "00_toolbar_bg.9.sci",
    img_00_toolbar_bg_ef_9: imagesPath + theme + "00_toolbar_bg_ef.9.sci",
    img_00_toolbar_bg_shadow_9: imagesPath + theme + "00_toolbar_bg_shadow.9.sci",
    img_00_toolbar_button_9: imagesPath + theme + "00_toolbar_button.9.sci",
    img_00_toolbar_button_bg_9: imagesPath + "00_toolbar_button_bg.9.sci",
    img_00_toolbar_button_ef_9: imagesPath + theme + "00_toolbar_button_ef.9.sci",
    img_00_toolbar_button_ef_focus_9: imagesPath + "00_toolbar_button_ef_focus.9.sci",
    img_00_toolbar_button_ef_press_9: imagesPath + theme + "00_toolbar_button_ef_press.9.sci",
    img_00_toolbar_button_press_9: imagesPath + theme + "00_toolbar_button_press.9.sci",
    img_00_toolbar_ef_press_9: imagesPath + theme + "00_toolbar_ef_press.9.sci",
    img_00_toolbar_press_9: imagesPath + "00_toolbar_press.9.sci",
    img_copy_and_paste_Handler_center: imagesPath + "copy_and_paste_Handler_center.png",
    img_copy_and_paste_Handler_center_reverse: imagesPath + "copy_and_paste_Handler_center_reverse.png",
    img_copy_and_paste_Handler_left: imagesPath + "copy_and_paste_Handler_left.png",
    img_copy_and_paste_Handler_left_01: imagesPath + "copy_and_paste_Handler_left_01.png",
    img_copy_and_paste_Handler_left_reverse: imagesPath + "copy_and_paste_Handler_left_reverse.png",
    img_copy_and_paste_Handler_right: imagesPath + "copy_and_paste_Handler_right.png",
    img_copy_and_paste_icon_search: imagesPath + "copy_and_paste_icon_search.png",
    img_copy_and_paste_Magnifier_9: imagesPath + "copy_and_paste_Magnifier.9.sci",
    img_pd_btn_bg_9: imagesPath + theme + "pd_btn_bg.9.sci",
    img_pd_btn_bg_arrow_down: imagesPath + theme + "pd_btn_bg_arrow_down.png",
    img_pd_btn_bg_arrow_up: imagesPath + theme + "pd_btn_bg_arrow_up.png",
    img_TTS_focus_9: imagesPath + "TTS_focus.9.sci",
    img_TTS_popup_bg_9: imagesPath + "TTS_popup_bg.9.sci",
}



var panel = {
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

var progress = {
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
};

var slider = {

    handle:{
        backgroundColor:{
            pressed: colors.W0641P,
            normal: colors.W0641,
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
            height: 108,
            heightWithoutArrow: 86,
            margin: 12,
            source: images.img_00_slider_popup_bg_9,
            effectSource: images.img_00_slider_popup_bg_ef_9
        }
    },
    groove:{/*is default progressbar*/}
}

var button= {

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
        disabled:images.img_00_button_01_ef_dim_9,
        pressed: images.img_00_button_01_ef_press_9
        //highlighted:images.img_00_button_01_ef_press_9
    },
    font:{pixelSize:36, minimumPixelSize: 28}
}

var checkBox = {

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
            normal: images.img_00_check_Activated,
            disabled: images.img_00_check_Activated_dim,
            pressed: images.img_00_check_press,
            checked: images.img_00_check_Activated
        }
    },

    onOff: {
        icon: {
            source: {
                normal: images.img_00_button_radio_bg,
                disabled: images.img_00_button_radio_dim_bg,
                pressed: images.img_00_button_radio_press_bg,
                highlighted: images.img_00_button_radio_press_bg,
                selected: images.img_00_button_radio_bg
            },
            effectSource: {
                normal: images.img_00_button_radio_Activated,
                disabled: images.img_00_button_radio_Activated_dim,
                pressed: images.img_00_button_radio_press,
                highlighted: images.img_00_button_radio_press,
                selected: images.img_00_button_radio_Activated
            }
        },

        handlerSource: {
            normal: images.img_00_button_on_off_handler,
            disabled: images.img_00_button_on_off_handler_dim,
            pressed: images.img_00_button_on_off_handler,
            highlighted: images.img_00_button_on_off_handler,
            selected: images.img_00_button_on_off_handler
        },
        backgroundSource: {
            on: {
                normal:images.img_00_button_on,
                disabled: images.img_00_button_on_dim,
                pressed: images.img_00_button_on,
                highlighted: images.img_00_button_on,
                selected: images.img_00_button_on
            },
            off: {
                normal:images.img_00_button_off,
                disabled: images.img_00_button_off_dim,
                pressed: images.img_00_button_off,
                highlighted: images.img_00_button_off,
                selected: images.img_00_button_off
            }
        }

    },

    text: {
        color: {
            normal:colors.F011L1,
            disabled:colors.F011L3,
            pressed:colors.F031L1P,
            checked:colors.F011L1
            //highlighted:"#FFFFFF"
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
            pressed:colors.B042
        },
        source: {
            normal: images.img_00_circle_bg
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
            disabled: colors.F032L1,
            pressed: colors.F032L1P
            //highlighted: colors.F032L1P,
        }
    }
}


var tabBar = {

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

var detailButton = {
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

var contextMenu = {

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
var splitView = {
    color: {
        normal: colors.W131,
        pressed: colors.W132
    },
    width: 5,
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

var scroll = {
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

//    ADD_COLOR_CONFIG(JUMP_TO_TOP_NORMAL, $F032L1);
//    ADD_COLOR_CONFIG(JUMP_TO_TOP_PRESSED, $F032L1P);
//    ADD_COLOR_CONFIG(BUTTON_BG_NORMAL, $W011);
//    ADD_COLOR_CONFIG(BUTTON_BG_PRESSED, $B042);

//    ADD_IMAGE_CONFIG(JUMP_TO_TOP_NORMAL, #00_icon_jump.png);
//    ADD_IMAGE_CONFIG(JUMP_TO_TOP_PRESSED, #00_icon_jump.png);
//    ADD_IMAGE_CONFIG(JUMP_TO_TOP_EFFECT, #00_icon_jump_ef.png);
//    ADD_IMAGE_CONFIG(JUMP_TO_LEFT_NORMAL, #00_icon_jump_left.png);
//    ADD_IMAGE_CONFIG(JUMP_TO_LEFT_PRESSED, #00_icon_jump_left.png);
//    ADD_IMAGE_CONFIG(JUMP_TO_LEFT_EFFECT, #00_icon_jump_left_ef.png);
//    ADD_IMAGE_CONFIG(BUTTON_BG_NORMAL, #00_button_01.#.png);
//    ADD_IMAGE_CONFIG(BUTTON_BG_NORMAL_EFFECT, #00_button_01_ef.#.png);
//    ADD_IMAGE_CONFIG(BUTTON_BG_PRESSED, #00_button_01.#.png);
//    ADD_IMAGE_CONFIG(BUTTON_BG_PRESSED_EFFECT, #00_button_01_ef_press.#.png);


//    START_UI_CONFIG_MODE(720x1280);


//        ADD_SHAPE_CONFIG(JUMP_TO_TOP_RIGHT_MARGIN, 26);
//        ADD_SHAPE_CONFIG(JUMP_TO_TOP_TOP_MARGIN, 18);
//        ADD_FIXED_VALUE_CONFIG(JUMP_TO_TOP_WIDTH, 74);
//        ADD_FIXED_VALUE_CONFIG(JUMP_TO_TOP_HEIGHT, 74);

//        ADD_SHAPE_CONFIG(HANDLER_MARGIN, 4);
//        ADD_SHAPE_CONFIG(HANDLER_MIN_WIDTH, 36);
//        ADD_SHAPE_CONFIG(HANDLER_MIN_HEIGHT, 234);


//        ADD_SHAPE_CONFIG(CONTEXTTHUMB_MIN_WIDTH, 9);
//        ADD_SHAPE_CONFIG(CONTEXTTHUMB_MIN_HEIGHT, 18);
//        ADD_SHAPE_CONFIG(CONTEXTTHUMB_MARGIN, 8);
//    END_UI_CONFIG_MODE(720x1280);












//    ADD_COLOR_CONFIG(THUMB_BG_NORMAL, $B071);

//    ADD_IMAGE_CONFIG(HANDLER_HORIZONTAL, #00_fast_scroll_handler_h.#.png);
//    ADD_IMAGE_CONFIG(HANDLER_VERTICAL, #00_fast_scroll_handler.#.png);
//    ADD_IMAGE_CONFIG(THUMB_HORIZONTAL_BG_NORMAL, #00_scroll_bar_h.#.png);
//    ADD_IMAGE_CONFIG(THUMB_HORIZONTAL_EFFECT, #00_scroll_bar_h_ef.#.png);
//    ADD_IMAGE_CONFIG(THUMB_VERTICAL_BG_NORMAL, #00_scroll_bar_v.#.png);
//    ADD_IMAGE_CONFIG(THUMB_VERTICAL_EFFECT, #00_scroll_bar_v_ef.#.png);
//    ADD_SHAPE_CONFIG(VERTICAL_THUMB_MIN_WIDTH, 18);
//    ADD_SHAPE_CONFIG(VERTICAL_THUMB_MIN_HEIGHT, 27);
//    ADD_SHAPE_CONFIG(VERTICAL_THUMB_MARGIN, 6);
//    ADD_SHAPE_CONFIG(HORIZONTAL_THUMB_MIN_WIDTH, 27);
//    ADD_SHAPE_CONFIG(HORIZONTAL_THUMB_MIN_HEIGHT, 18);
//    ADD_SHAPE_CONFIG(HORIZONTAL_THUMB_MARGIN, 6);
//    ADD_SHAPE_CONFIG(OVERSCROLLING_TOP_HEIGHT, 36);
//    ADD_SHAPE_CONFIG(OVERSCROLLING_BOTTOM_HEIGHT, 36);
//    ADD_SHAPE_CONFIG(OVERSCROLLING_LEFT_WIDTH, 36);
//    ADD_SHAPE_CONFIG(OVERSCROLLING_RIGHT_WIDTH, 36);
//    ADD_IMAGE_CONFIG(OVERSCROLLING_TOP_BG, #00_overscrolling_top.#.png);
//    ADD_IMAGE_CONFIG(OVERSCROLLING_BOTTOM_BG, #00_overscrolling_bottom.#.png);
//    ADD_IMAGE_CONFIG(OVERSCROLLING_LEFT_BG, #00_overscrolling_left.#.png);
//    ADD_IMAGE_CONFIG(OVERSCROLLING_RIGHT_BG, #00_overscrolling_right.#.png);
//    ADD_IMAGE_CONFIG(CONTEXTTHUMB_NORMAL, #00_popup_scroll.#.png);


}


