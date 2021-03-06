/*
 *右下角有标题的按钮
**/

import QtQuick 2.0

Rectangle {
    width: 100
    height: 62
    color: "transparent"

    property alias text: label.text
    property alias fontSize: label.font.pixelSize
    property int textRightMargin: 0
    property int textBottomMargin: 10
    property url backgroundNormal: ""
    property url backgroundPressed: ""
    property color colorNormal: "#a0a0a0"
    property color colorPressed: "#d0d0d0"
    property color colorText: "#FFFFFFFF"

    signal clicked

    Image {
        id:buttonImage
//        source:maButton.pressed ? backgroundPressed : backgroundNormal
        source: backgroundNormal
//        anchors.fill: parent
        anchors.left: parent.left;
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        scale: maButton.pressed ? 0.9:1
        opacity: maButton.pressed ? 0.8:1
    }

    Text {
        id: label
        x: 78
        y: 38
        color: colorText
        text: "text"
        verticalAlignment: Text.AlignBottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: textBottomMargin
        font.pixelSize: 20
    }

    MouseArea {
        id: maButton
        anchors.fill: parent

        onClicked: {
            parent.clicked()
        }
    }
}
