TARGETPATH = QtQuick/Controls/Styles/Tizen

QML_FILES = \
    TizenBorderImage.qml \
    ProgressBarStyle.qml \
    SliderStyle.qml \
    ButtonStyle.qml \
    CheckBoxStyle.qml
# Images
QML_FILES += \
    images/00_progress_bar.sci \
    images/qt-00_progress_bar.png \
    images/00_progress_bg.sci \
    images/qt-00_progress_bg.png  \
    images/00_slider_handle.sci \
    images/qt-00_slider_handle.png \
    images/00_button_01.sci \
    images/qt-00_button_01.png
    
QML_FILES += \
    images/white/00_progress_bar_ef.sci \
    images/white/qt-00_progress_bar_ef.png \
    images/white/00_progress_ef_bg.sci \
    images/white/qt-00_progress_ef_bg.png \
    images/white/00_slider_handle_ef_dim.sci \
    images/white/qt-00_slider_handle_ef_dim.png \
    images/white/00_slider_handle_ef_press.sci \
    images/white/qt-00_slider_handle_ef_press.png \
    images/white/00_slider_handle_ef.sci \
    images/white/qt-00_slider_handle_ef.png \
    images/white/00_button_01_ef.sci \
    images/white/qt-00_button_01_ef.png \
    images/white/00_button_01_ef_press.sci \
    images/white/qt-00_button_01_ef_press.png \
    images/white/00_button_01_ef_dim.sci \
    images/white/qt-00_button_01_ef_dim.png

QML_FILES += \
    DefaultSettings.js

load(qml_module)



