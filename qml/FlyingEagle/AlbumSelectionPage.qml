import QtQuick 2.0

Rectangle {
    id: container

    width: 1280
    height: 591
    color: "transparent"

    signal clicked(int index, int type)

    TestModel2 {
        id: testModel2
    }

    TestListModel {
        id: testModel
    }

    GridView {
        id: musicList
        x: 106
        y: 79

        width: 1095
        height: 444

        cellWidth: 182
        cellHeight: 207

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow

        clip: true

        model: testModel
        delegate: Item {
            width: 182
            height: 207

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    musicList.currentIndex = index
                    //type = 0表示选中了GridView中的一个Item
                    container.clicked(index, 0)
                }
            }

            Image {
                width: 182
                height: 207

                source: "images/starBg.png"
            }

            Text {
                id: starName
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 18

                text: star
                color: "#FFFFFFFF"
                font.pixelSize: 26
            }
        }
    }

    PushButton {
        id: leftButton
        x: 693
        y: 495
        width: 68
        height: 36

        anchors.top: musicList.bottom
        anchors.topMargin: -28

        backgroundNormal: "images/left.png"

        onClicked: {
            //左移
            console.log(musicList.currentIndex)
            musicList.moveCurrentIndexLeft()
        }
    }

    Text {
        id: pageLabel
        x: 775
        y: 502
        width: 128
        height: 22

        anchors.top: musicList.bottom
        anchors.topMargin: -21

        text: "10/100"
        horizontalAlignment: Text.AlignHCenter
        color: "#FFFFFFFF"
        font.pixelSize: 18
    }

    PushButton {
        id: rightButton
        x: 921
        y: 495
        width: 68
        height: 36

        anchors.top: musicList.bottom
        anchors.topMargin: -28

        backgroundNormal: "images/right.png"

        onClicked: {
            //右移
            console.log(musicList.currentIndex)
            musicList.moveCurrentIndexRight()
        }
    }

    PushButton {
        x: 1101
        y: 494

        width: 100
        height: 44

        backgroundNormal: "images/back.png"

        onClicked: {
            handlerLoader("HomePage.qml", 0)
        }
    }
}
