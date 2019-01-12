import QtQuick 2.10
// import QtQuick.Window 2.10
// import QtQuick.Layouts 1.12

Item
{
    id: iAnimatedRectangle

    property int displacement: 10

    Rectangle
    {
        id: opacityBox
        width: 50
        height: 50
        color: "mediumseagreen"


        OpacityAnimator
        {
            target: opacityBox;
            from: 0
            to: 1
            duration: 500
            running: iListView.movementEnded
        }

        XAnimator
        {
            id: iXAnimator
            // property int displacement
            target: opacityBox;
            from: opacityBox.x;
            to: opacityBox.x + displacement;
            duration: 500
            easing.type: Easing.InQuad
            running: iListView.movementEnded
        }
    }
}