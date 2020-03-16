import QtQuick 2.5
import QtQuick.Window 2.11

Window {
    id: root

    width: 400
    height: width * 1.2
    visible: true
    title: qsTr("Boss puzzle")

    Header
    {
        id: _header
        width: parent.width
        height: 0.2 * parent.height
        anchors.top: parent.top
        steps: _controller.steps
    }


    GameBoard
    {
        id: _board
        anchors.top : _header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        model: _controller.model
        size: _controller.boardSize

        hiddenElementValue: _controller.emptyValue
    }

    GameController
    {
        id: _controller
        Component.onCompleted: {
            _board.move.connect(_controller.makeMove);
        }
    }
}

