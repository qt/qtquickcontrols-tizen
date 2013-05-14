.pragma library


var theme="white"

var progress = {
    margins: {top:0, left:8, right:8, bottom: 0},
    progressColor: "#5A95DC",
    backgroundColor: "#F0EDE9"
};

var slider = {
    handle:{
        backgroundColor:{
            pressed: "#5288C9",
            normal:"#E0DAD1",
            disabled:"#BFBFBF"
        },
        foregroundColor:{
            normal:"#3B73B6",
            disabled:"#808080"
        },
        source:{ normal: "images/00_slider_handle.sci"},
        effectSource: {
            normal: "images/"+theme+"/00_slider_handle_ef.sci",
            disabled: "images/"+theme+"/00_slider_handle_ef_dim.sci"            ,
            pressed: "images/"+theme+"/00_slider_handle_ef_press.sci"
        },
        font: {pointSize: 28},
        text: {
            margins: 8,
            color: {
                normal:"#3B73B6",
                disabled:"#808080"
            }
        }
    },
    groove:{/*is default progressbar*/}
}

var button= {

    backgroundColor: {
        normal:"#F8F6EF",
        disabled: "#F8F6EF",
        pressed:"#3B73B6"
        //highlighted:"#3B73B6"
    },
    text: {
        color: {
            normal:"#3A3A3A",
            disabled: "#4C3A3A3A",
            pressed: "#FFFFFF"
            //highlighted:"#FFFFFF"
        },
        margins: {
            left: 12,
            top: 4,
            right:12,
            bottom:4
        }

        //    ADD_SHAPE_CONFIG(LEFT_MARGIN, 12);
        //    ADD_SHAPE_CONFIG(TOP_MARGIN, 4);
        //    ADD_SHAPE_CONFIG(RIGHT_MARGIN, 12);
        //    ADD_SHAPE_CONFIG(BOTTOM_MARGIN, 4);
    },

    source: {
        normal: "images/00_button_01.sci",
        disabled:"images/00_button_01.sci",
        pressed: "images/00_button_01.sci"
        //highlighted:"images/00_button_01.sci"
    },
    effectSource: {
        normal: "images/"+theme+"/00_button_01_ef.sci",
        disabled:"images/"+theme+"/00_button_01_ef_dim.sci",
        pressed: "images/"+theme+"/00_button_01_ef_press.sci"
        //highlighted:"images/"+theme+"/00_button_01_ef_press.sci"
    },
    font:{pixelSize:36, minimumPixelSize: 28}
}
