import QtQuick 2.0

Item {
    id: root
    property int steps: 0
    property int time: 0
    Row {
        spacing: 2
        Rectangle {
            id: _counter_rec
            color: "lightblue"
            border.color: "black"
            border.width: 2
            width: root.width / 2
            height: root.height
            Text {
                id: _counter
                font.pointSize: 25
                font.bold: true
                text: qsTr(" Steps : " + String(steps))
            }
        }
        Rectangle {
            id: _timer_rec
            color: "lightblue"
            border.color: "black"
            border.width: 2
            width: root.width / 2
            height: root.height
            Text {
                id: _timer
                font.pointSize: 25
                font.bold: true
                text: qsTr(" Time : " + String(time))
            }
        }
    }

    Item {
        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: parent.parent.time ++;
        }
    }
}
