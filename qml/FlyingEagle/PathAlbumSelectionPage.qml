/*
 *使用PathView来展示专辑列表
**/

import QtQuick 2.0

Rectangle {
    id: container

    width: 1280
    height: 500
    color: "transparent"

    signal handleBack()

    PathView {
        id: pathView
        anchors.top: parent.top
        anchors.topMargin: 120
        width: parent.width
        height: 356
        opacity: 0

        pathItemCount: 7
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightRangeMode: PathView.StrictlyEnforceRange
        flickDeceleration: 390

        model: TestListModel {

        }

        delegate: Item{
            id: cell

            property real tmpAngle : PathView.rotateY
            property real scaleValue: PathView.scalePic
            width: 356
            height: 356
            anchors.verticalCenter: parent.verticalCenter
            visible: PathView.onPath
            z: PathView.zOrder

            Flipable {
                width: 356
                height: 356
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                id: flipable

                property bool flipped: false

                back: Item {
                    id: back
                    width: 356
                    height: 356
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image {
                        width: 356
                        height: 356

                        source: "images/albumBg.png"
                    }

                    Image {
                        id: headImage

                        width: 126
                        height: 121
                        anchors.left: back.left
                        anchors.top: back.top

                        source: "images/singergravatar.png"
                    }

                    Text {
                        anchors.left: headImage.right
                        anchors.top: back.top
                        anchors.topMargin: 10

                        text: "七(国语新歌*精选)"
                        color: "white"
                    }

                    Text {
                        anchors.left: headImage.right
                        anchors.top: back.top
                        anchors.topMargin: 40

                        text: "歌手:陈奕迅"
                        color: "white"
                    }

                    Text {
                        anchors.left: headImage.right
                        anchors.top: back.top
                        anchors.topMargin: 60

                        text: "语言:粤语"
                        color: "white"
                    }

                    Text {
                        anchors.left: headImage.right
                        anchors.top: back.top
                        anchors.topMargin: 80

                        text: "发行时间:2013-7-22"
                        color: "white"
                    }

                    Text {
                        anchors.left: back.left
                        anchors.top: back.top
                        anchors.topMargin: 140

                        text: "简介"
                        color: "white"
                    }

                    Text {
                        anchors.left: back.left
                        anchors.top: back.top
                        anchors.topMargin: 160
                        color: "white"
                        width: parent.width
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                        text: "陈奕迅2002年开始成功打入台湾乐坛,由<Special Thanks to...>至<黑*白*灰>"
                    }

//                    MouseArea {
//                        anchors.fill: parent
//                        onClicked: {
//                            flipable.flipped = !flipable.flipped
//                        }
//                    }

                    //点击显示专辑歌曲
                    PushButton {
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        width: 100
                        height: 50

                        backgroundNormal: "images/moresongs.png"
                        text: "专辑歌曲"
                        colorText: "white"
                    }
                }

                front: Item {
                    id: front
                    width: 356
                    height: 356
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image{
                        id:myImage
                        width: 356
                        height: 356
                        source: image
                    }

                    Text {
                        text: index
                        color: "red"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(pathView.currentIndex != index) {
//                                console.log(index)
//                                pathView.currentIndex = index
//                                pathView.positionViewAtIndex(index, PathView.Center)
//                                if(pathView.currentIndex < index) {
//                                    pathView.incrementCurrentIndex()
//                                } else {
//                                    pathView.decrementCurrentIndex()
//                                }

                                if(cell.x < pathView.currentItem.x) {
                                    pathView.decrementCurrentIndex()
                                }else {
                                    pathView.incrementCurrentIndex()
                                }

                                return
                            }

                            flipable.flipped = !flipable.flipped
                        }
                    }

//                    PushButton {
//                        anchors.bottom: parent.bottom
//                        anchors.bottomMargin: 20
//                        anchors.horizontalCenter: parent.horizontalCenter

//                        width: 100
//                        height: 50

//                        backgroundNormal: "images/moresongs.png"
//                        visible: !(flipable.flipped)
//                    }
                }

                transform: Rotation {
                    id: rotation
                    origin.x: flipable.width/2
                    origin.y: flipable.height/2
                    axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
                    angle: 0    // the default angle
                }

                states: State {
                    name: "back"
                    PropertyChanges { target: rotation; angle: 180 }
                    when: flipable.flipped
                }

                transitions: Transition {
                    NumberAnimation { target: rotation; property: "angle"; duration: 400 }
                }
            }

            transform:[
                Rotation{
                    angle: tmpAngle
                    origin.x: 356/2
                    origin.y: 356/2
                    axis { x: 0; y: 1; z: 0 }
                },
                Scale {
                    xScale:scaleValue; yScale:scaleValue
                    origin.x: 356/2;   origin.y: 356/2
                }
            ]
        }//Item

        path: Path {
            startX: 0
            startY: 0

            PathLine{x:-60; y: 0}
            PathPercent {value: 0.0}
            PathAttribute {name: "rotateY"; value: 0.0}
            PathAttribute {name: "scalePic"; value: 0.36}
            PathAttribute {name: "zOrder"; value: 1}

            PathLine{x:150; y: 0}
            PathPercent {value: 0.20}
            PathAttribute {name: "rotateY"; value: -60.0}
            PathAttribute {name: "scalePic"; value: 0.50}
            PathAttribute {name: "zOrder"; value: 10}

            PathLine{x:380; y: 0}
            PathPercent {value: 0.40}
            PathAttribute {name: "rotateY"; value: -60.0}
            PathAttribute {name: "scalePic"; value: 0.90}
            PathAttribute {name: "zOrder"; value: 50}

            PathLine{x:640; y: 0}
            PathPercent {value: 0.50}
            PathAttribute {name: "rotateY"; value: 0.0}
            PathAttribute {name: "scalePic"; value: 1.0}
            PathAttribute {name: "zOrder"; value: 60}

            PathLine{x:888; y: 0}
            PathPercent {value: 0.60}
            PathAttribute {name: "rotateY"; value: 60.0}
            PathAttribute {name: "scalePic"; value: 0.9}
            PathAttribute {name: "zOrder"; value: 50}

            PathLine{x:1120; y: 0}
            PathPercent {value: 0.80}
            PathAttribute {name: "rotateY"; value: 60.0}
            PathAttribute {name: "scalePic"; value: 0.50}
            PathAttribute {name: "zOrder"; value: 10}

            PathLine{x:1330; y: 0}
            PathPercent {value: 1.00}
            PathAttribute {name: "rotateY"; value: 0.0}
            PathAttribute {name: "scalePic"; value: 0.36}
            PathAttribute {name: "zOrder"; value: 1}
        }

        focus: true
        interactive: true

        PropertyAnimation {
            id: animation
            target: pathView
            property: "opacity"
            from: 0
            to: 1
            duration: 1500
        }

        Component.onCompleted: {
            animation.start()
        }
    }

    PushButton {
        id:backButton;
        width: 100; height: 44;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: -60
        anchors.right: parent.right;
        anchors.rightMargin: 70;
        backgroundNormal: "images/back.png";
        onClicked: {
//                handlerLoader("HomePage.qml", 0)
            container.handleBack()
        }
    }
}
