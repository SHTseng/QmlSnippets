import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 480
    height: 320
    title: qsTr("Hello World")

    ListView
    {
        id: iListView
        width: parent.width
        height: parent.height

        cacheBuffer: parent.width
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        spacing: 20

        model: 3
        delegate: GridLayout
        {
            id: iRectDelegate
            columns: 4
            rows: 2
            columnSpacing: 20
            rowSpacing: 40
            property int listX: x - iListView.contentX

            Repeater
            {
                id: iRectReapter
                model: 8
                Rectangle
                {
                    width: 100
                    height: 100
                    color: "red"
                }
            }

            Binding
            {
                target: iRectDelegate
                property: "opacity"
                // value: 2*(iRectDelegate.x - iListView.contentX)/iListView.width
                value: 1-(listX/iListView.width)*(listX/iListView.width)
                when: iListView.moving || iListView.flicking || iListView.dragging
            }

            Binding
            {
                target: iRectDelegate
                property: "opacity"
                value: 1
                when: !(iListView.moving || iListView.dragging)
            }

            Behavior on opacity
            {
                enabled: !(iListView.flicking || iListView.dragging) // active only when flick or dragging ends!
                NumberAnimation
                {
                    duration: 400
                    to: 1
                    // easing.type: Easing.InQuint
                }
            }

            Behavior on opacity
            {
                enabled: iListView.moving || iListView.flicking || iListView.dragging
                NumberAnimation
                {
                    duration: 500
                    to: 0
                    // easing.type: Easing.InQuint
                }
            }
        }

        onFlickStarted:
        {
            console.log(currentIndex);
        }
    }
}
