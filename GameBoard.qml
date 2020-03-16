import QtQuick 2.0

GridView {
    id: root

    property int size: 4
    property int hiddenElementValue: 0
    signal move(int index)

    cellHeight: height / root.size
    cellWidth: width / root.size

    interactive: false

    delegate: Item {
        id: _backgroundDelegate
        width: root.cellWidth
        height: root.cellHeight

        visible: root.hiddenElementValue !== value

        Tile {
            anchors.fill: _backgroundDelegate
            anchors.margins: 5

            internalText: value

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.move(index)
                }
            }
        }
    }

    move: Transition {
        PropertyAnimation {
            properties: "x, y"
            duration: 250
            easing.type: Easing.Linear
        }
    }
}
